unit DataReceiverThread;

interface

uses
  Classes, IdBaseComponent, SysUtils, IdComponent, IdTCPConnection, IdTCPClient, SyncObjs, Constants;

type
  TDataReceiverThread = class(TThread)
  private
    DataReceiver : TIdTCPClient;
    lock : THandle;

    function allow_TX_RX_Power(channel : integer) : boolean;
    function allow_TX_Burst(channel : integer) : boolean;
    function allow_TX_Spectrum(channel : integer) : boolean;
    function allow_RX_dBZ(channel : integer) : boolean;
    function allow_RX_dBT(channel : integer) : boolean;
    function allow_RX_V(channel : integer) : boolean;
    function allow_RX_W(channel : integer) : boolean;
  protected
    procedure Execute; override;
    function  receive_package(Channel : integer; Command : string) : TDataPackage;
    procedure receive_Command(Command : string; Channel : integer);
  public
    constructor Create(Host : string; Port : integer);
    destructor  Destroy; override;
  end;

implementation

uses
  Windows, Shell_Client, UpdaterThread, ZLibEx, FrameVideo, RTForm;

{ TDataReceiverThread }

constructor TDataReceiverThread.Create(Host: string; Port: integer);
begin
  inherited Create( true );
  FreeOnTerminate := true;
  Priority := tpHigher;

  lock := CreateMutex(nil, false, 'DataReceiver');

  DataReceiver := TIdTCPClient.Create( nil );
  DataReceiver.Port := Port;
  DataReceiver.Host := Host;

  DataReceiver.Connect(deMaxTimeServerConnect);

  Resume;
end;

destructor TDataReceiverThread.Destroy;
begin
  if DataReceiver.Connected
    then DataReceiver.Disconnect;
  DataReceiver.Free;
  inherited;
end;

procedure TDataReceiverThread.Execute;
var
  Command, cmd, ch : string;
  channel : smallint;
begin
  while not Terminated do
  try
    Command := DataReceiver.ReadLn('', deClientCommandTimeOut);
    if Command = ''
      then
        begin
          DataReceiver.CheckForDisconnect;
          DataReceiver.CheckForGracefulDisconnect;
          Sleep(1000);
        end
      else
        begin
          cmd := '';
               if Pos(TX_Burst_Command, Command) = 1    then cmd := TX_Burst_Command
          else if Pos(TX_RX_Power_Command, Command) = 1 then cmd := TX_RX_Power_Command
          else if Pos(TX_Spectrum_Command, Command) = 1 then cmd := TX_Spectrum_Command
          else if Pos(RX_dBZ_Command, Command) = 1      then cmd := RX_dBZ_Command
          else if Pos(RX_dBT_Command, Command) = 1      then cmd := RX_dBT_Command
          else if Pos(RX_V_Command, Command) = 1        then cmd := RX_V_Command
          else if Pos(RX_W_Command, Command) = 1        then cmd := RX_W_Command;

          if cmd <> ''
            then
              begin
                ch := copy(Command, Length(cmd)+1, Length(Command) - Length(cmd));
                channel := StrToInt(ch);
                receive_Command(cmd, channel);
                Sleep(10);
              end
            else Sleep(50);
        end;
  except
    Terminate;
  end;

  if DataReceiver.Connected
    then DataReceiver.Disconnect;
end;

function TDataReceiverThread.receive_package(Channel : integer; Command : string) : TDataPackage;
var
  PackSize : integer;
  BufferSize : cardinal;
  zdata    : pointer;
  data    : pointer;
  buffer_data_type, buffer_data_size, cell_size, ndata, Az, El : Smallint;
  OutSize : integer;
begin
  result := nil;
  cell_size := DataReceiver.ReadSmallInt;
  Az := DataReceiver.ReadSmallInt;
  El := DataReceiver.ReadSmallInt;
  buffer_data_type := DataReceiver.ReadSmallInt;
  buffer_data_size := GetSizeOf(buffer_data_type);
  ndata   := DataReceiver.ReadSmallInt;
  BufferSize := ndata * buffer_data_size;

  PackSize := DataReceiver.ReadInteger;
  zdata := AllocMem(PackSize);
  try
    DataReceiver.ReadBuffer(zdata^, PackSize);
    ZDecompress(zdata, PackSize, data, OutSize);

    if OutSize = BufferSize
      then result := TDataPackage.Init(Command, Channel, cell_size, Az, El, buffer_data_type, ndata, data);
  finally
    ReallocMem(zdata, 0);
    ReallocMem(data, 0);
  end;
end;

procedure TDataReceiverThread.receive_Command(Command: string; Channel : integer);
var
  package : TDataPackage;
  allowed : boolean;
begin
       if Command = TX_Burst_Command    then allowed := allow_TX_Burst(channel)
  else if Command = TX_RX_Power_Command then allowed := allow_TX_RX_Power(channel)
  else if Command = TX_Spectrum_Command then allowed := allow_TX_Spectrum(channel)
  else if Command = RX_dBZ_Command      then allowed := allow_RX_dBZ(channel)
  else if Command = RX_dBT_Command      then allowed := allow_RX_dBT(channel)
  else if Command = RX_V_Command        then allowed := allow_RX_V(channel)
  else if Command = RX_W_Command        then allowed := allow_RX_W(channel)
  else allowed := false;

  if allowed
    then
      begin
        DataReceiver.WriteLn(Success_Response);
        package := receive_package(channel, Command);
        theUpdaterThread.AddPackage(package);
      end
    else
      DataReceiver.WriteLn(Fail_Response);
end;

function TDataReceiverThread.allow_RX_dBZ(channel: integer): boolean;
begin
  with ShellClient do
  begin
    with Video do
      result := (Acquiring_dBT_DBZ or Acquiring_dBZ_DBZ) and (((channel = 0) and CheckBox1.Checked) or ((channel = 1) and CheckBox2.Checked));

    result := result or ((channel = 0) and (RT_Ch1.Acquiring_dBT_DBZ or RT_Ch1.Acquiring_dBZ_DBZ));
    result := result or ((channel = 1) and (RT_Ch2.Acquiring_dBT_DBZ or RT_Ch2.Acquiring_dBZ_DBZ));
  end;
end;

function TDataReceiverThread.allow_RX_W(channel: integer): boolean;
begin
  with ShellClient do
  begin
    with Video do
      result := Acquiring_Width and (((channel = 0) and CheckBox1.Checked) or ((channel = 1) and CheckBox2.Checked));

    result := result or ((channel = 0) and RT_Ch1.Acquiring_Width);
    result := result or ((channel = 1) and RT_Ch2.Acquiring_Width);
  end;
end;

function TDataReceiverThread.allow_RX_V(channel: integer): boolean;
begin
  with ShellClient do
  begin
    with Video do
      result := Acquiring_Speed and (((channel = 0) and CheckBox1.Checked) or ((channel = 1) and CheckBox2.Checked));

    result := result or ((channel = 0) and RT_Ch1.Acquiring_Speed);
    result := result or ((channel = 1) and RT_Ch2.Acquiring_Speed);
  end;
end;

function TDataReceiverThread.allow_TX_Spectrum(channel: integer): boolean;
begin
  with ShellClient do
    result := (TxRx1.DRX.acquiring.State and (channel = 0)) or (TxRx2.DRX.acquiring.State and (channel = 1));
end;

function TDataReceiverThread.allow_TX_Burst(channel: integer): boolean;
begin
  with ShellClient do
    result := (TxRx1.DRX.acquiring.State and (channel = 0)) or (TxRx2.DRX.acquiring.State and (channel = 1));
end;

function TDataReceiverThread.allow_TX_RX_Power(channel: integer): boolean;
begin
  with ShellClient.Video do
    result := ShellClient.Video.Acquiring_Calibration and (((channel = 0) and CheckBox1.Checked) or ((channel = 1) and CheckBox2.Checked));
end;

function TDataReceiverThread.allow_RX_dBT(channel: integer): boolean;
begin
  with ShellClient do
  begin
    with Video do
      result := (Acquiring_dBT_DB or Acquiring_dBZ_DB) and (((channel = 0) and CheckBox1.Checked) or ((channel = 1) and CheckBox2.Checked));

    result := result or ((channel = 0) and (RT_Ch1.Acquiring_dBT_DB or RT_Ch1.Acquiring_dBZ_DB));
    result := result or ((channel = 1) and (RT_Ch2.Acquiring_dBT_DB or RT_Ch2.Acquiring_dBZ_DB));
  end;
end;

end.

