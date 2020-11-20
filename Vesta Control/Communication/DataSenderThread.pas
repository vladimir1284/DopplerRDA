unit DataSenderThread;

interface

uses
  IdTCPServer, Windows, Classes, SysUtils, SyncObjs, Contnrs;

const
  MaxPackageCount = 100;

type
  TDataSenderThread =
    class(TIdPeerThread)
      private
        packages : TQueue;
        lock : TCriticalSection;

        tx_rx_power : array of boolean;
        tx_burst    : array of boolean;
        tx_spectrum : array of boolean;
        rx_dbz      : array of boolean;
        rx_dbt      : array of boolean;
        rx_w        : array of boolean;
        rx_v        : array of boolean;

        function AllowedMessage(msg : string; channel : smallint) : boolean;
      protected
        procedure BeforeExecute; override;
        procedure Run;           override;
        procedure AfterExecute;  override;
      public
        constructor Create(ACreateSuspended: Boolean = True); override;

        procedure WantedPackage(packageType : string; channel : smallint; state : boolean);
        function  SendDataPackage(msg: string; channel, cell_size, Az, El, BufferType, ndata: smallint; buffer: pointer) : boolean; overload;
    end;

var
  theDataSender : TIdTCPServer;

procedure RemoveSpeckles(cell_size, cell_count : smallint; data : pointer);
function  SendDataPackage(msg: string; channel, cell_size, az, el, buffer_type, ndata: smallint; buffer: pointer) : boolean;
procedure WantedPackages(channel : smallint);

implementation

uses
  Constants, IdThread, Config, ZLibEx;

//general

procedure RemoveSpeckles(cell_size, cell_count : smallint; data: pointer);
var
  i : integer;
  Umbral : word; //Cells to remove
  Start, Index : integer;
  Buffer : PSingles;
begin
  Buffer := PSingles(data);
  Umbral := theConfiguration.RTSpeckleUmbral div cell_size;
  //Canal 1
  Index := 0;
  repeat
    //me posiciono en el primer valor distinto de cero
    while (Buffer[Index] = 0) and (Index < cell_count) do Inc(Index);
    if Index < cell_count
      then
        begin
          Start := Index;
          Inc( Index );
          //me posiciono en el siguiente cero
          while (Buffer[Index] <> 0) and (Index < cell_count) do Inc(Index);
          //Comparo con el umbral
          if Index-Start <= Umbral
            then
              for i := Start to Index-1 do
                Buffer[i] := 0;
          Inc( Index );
        end;
  until Index >= cell_count;
end;

function SendDataPackage(msg: string; channel, cell_size, az, el, buffer_type, ndata: smallint; buffer: pointer) : boolean;
var
  threads : TList;
  CurrentThread : TDataSenderThread;
  i : integer;
begin
  result := false;
  threads := theDataSender.Threads.LockList;
  try
    if theConfiguration.RTSpeckleRemove and ((Pos(RX_dBZ_Command, msg) > 0) or (Pos(RX_dBT_Command, msg) > 0) or (Pos(RX_V_Command, msg) > 0))
      then RemoveSpeckles(cell_size, ndata, buffer);

    for i := 0 to threads.Count-1 do
    try
      CurrentThread := TDataSenderThread(threads[i]);
      result := result or CurrentThread.SendDataPackage(msg, channel, cell_size, az, el, buffer_type, ndata, buffer);
    except
    end;
  finally
    theDataSender.Threads.UnlockList;
  end;
end;


procedure WantedPackages(channel : smallint);
var
  threads : TList;
  CurrentThread : TDataSenderThread;
  i : integer;
begin
  threads := theDataSender.Threads.LockList;
  try
    for i := 0 to threads.Count-1 do
    try
      CurrentThread := TDataSenderThread(threads[i]);
      CurrentThread.WantedPackage(TX_RX_Power_Command, channel, true);
      CurrentThread.WantedPackage(TX_Burst_Command, channel, true);
      CurrentThread.WantedPackage(TX_Spectrum_Command, channel, true);
      CurrentThread.WantedPackage(RX_dBZ_Command, channel, true);
      CurrentThread.WantedPackage(RX_dBT_Command, channel, true);
      CurrentThread.WantedPackage(RX_V_Command, channel, true);
      CurrentThread.WantedPackage(RX_W_Command, channel, true);
    except
    end;
  finally
    theDataSender.Threads.UnlockList;
  end;
end;

{ TDataExcanhe }

procedure TDataSenderThread.AfterExecute;
begin
  inherited;

  lock.Free;
  packages.Free;
end;

function TDataSenderThread.AllowedMessage(msg: string; channel : smallint): boolean;
begin
  result := ((msg = TX_RX_Power_Command) and tx_rx_power[channel]) or
            ((msg = TX_Burst_Command   ) and tx_burst[channel]   ) or
            ((msg = TX_Spectrum_Command) and tx_spectrum[channel]) or
            ((msg = RX_dBZ_Command     ) and rx_dbz[channel]     ) or
            ((msg = RX_dBT_Command     ) and rx_dbt[channel]     ) or
            ((msg = RX_V_Command       ) and rx_v[channel]       ) or
            ((msg = RX_W_Command       ) and rx_w[channel]       );
end;

procedure TDataSenderThread.BeforeExecute;
var
  drx_count : integer;
  i : integer;
begin
  inherited;

  drx_count := Ord(theConfiguration.DRX1_Enabled) + Ord(theConfiguration.DRX2_Enabled);

  SetLength(tx_rx_power, drx_count);
  SetLength(tx_burst   , drx_count);
  SetLength(tx_spectrum, drx_count);
  SetLength(rx_dbz     , drx_count);
  SetLength(rx_dbt     , drx_count);
  SetLength(rx_w       , drx_count);
  SetLength(rx_v       , drx_count);

  for i := 0 to drx_count-1 do
  begin
    tx_rx_power[i] := false;
    tx_burst[i]    := false;
    tx_spectrum[i] := false;
    rx_dbz[i]      := false;
    rx_dbt[i]      := false;
    rx_w[i]        := false;
    rx_v[i]        := false;
  end;
end;

constructor TDataSenderThread.Create(ACreateSuspended: Boolean);
begin
  inherited Create( true );
  Priority := tpHigher;

  lock := TCriticalSection.Create;
  packages := TQueue.Create;

  if not ACreateSuspended
    then Resume;
end;

procedure TDataSenderThread.Run;
var
  package  : TDataPackage;
  response : string;
  pack : pointer;
  packSize : integer;
  BufferSize : integer;
begin
  lock.Enter;
  try
    package := nil;
    if packages.Count > 0
      then package := TDataPackage(packages.Pop);
  finally
    lock.Leave;
  end;

  if Assigned(package)
    then
      try
        if AllowedMessage(package.msg, package.Channel)
          then
            begin
              Connection.WriteLn( package.msg + IntToStr(package.Channel));
              response := Connection.ReadLn('', deCommandTimeOut);
              if response = Success_Response
                then
                  begin
                    Connection.WriteSmallInt(package.CellSize);
                    Connection.WriteSmallInt(package.Az);
                    Connection.WriteSmallInt(package.El);
                    Connection.WriteSmallInt(package.DataType);
                    Connection.WriteSmallInt(package.NData);

                    BufferSize := package.NData * package.DataSize;

                    ZCompress(package.Data, BufferSize, pack, PackSize);
                    Connection.WriteInteger(PackSize);
                    Connection.WriteBuffer(pack^, PackSize);
                    FreeMem(pack);
                  end
                else if response = Fail_Response
                       then WantedPackage(package.msg, package.Channel, false);
            end;
        Sleep(10);
      finally
        package.Free;
      end
    else Sleep(1000);  
end;

function TDataSenderThread.SendDataPackage(msg: string; channel, cell_size, Az, El, BufferType, ndata: smallint; buffer: pointer) : boolean;
var
  package : TDataPackage;
begin
  result := AllowedMessage(msg, channel);

  if result
    then
      begin
        package := TDataPackage.Init(msg, channel, cell_size, Az, El, BufferType, ndata, buffer);
        lock.Enter;
        try
          if packages.Count < MaxPackageCount
            then packages.Push(package);
        finally
          lock.Leave;
        end;
      end;
end;


procedure TDataSenderThread.WantedPackage(packageType: string; channel : smallint; state : boolean);
begin
       if Pos(TX_RX_Power_Command, packageType) = 1 then tx_rx_power[channel] := state
  else if Pos(TX_Burst_Command   , packageType) = 1 then tx_burst[channel]    := state
  else if Pos(TX_Spectrum_Command, packageType) = 1 then tx_spectrum[channel] := state
  else if Pos(RX_dBZ_Command     , packageType) = 1 then rx_dbz[channel]      := state
  else if Pos(RX_dBT_Command     , packageType) = 1 then rx_dbt[channel]      := state
  else if Pos(RX_V_Command       , packageType) = 1 then rx_v[channel]        := state
  else if Pos(RX_W_Command       , packageType) = 1 then rx_w[channel]        := state;
end;

end.
