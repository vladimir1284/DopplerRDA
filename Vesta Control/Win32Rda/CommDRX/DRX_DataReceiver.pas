unit DRX_DataReceiver;

interface

uses
  Classes, IdTCPClient, Constants;

type
  TDRX_DataReceiver = class(TThread)
  private
    DataReceiver : TIdTCPClient;
    fChannel : smallint;

    tx_rx_power : boolean;
    tx_burst    : boolean;
    tx_spectrum : boolean;
    rx_dbz      : boolean;
    rx_dbt      : boolean;
    rx_w        : boolean;
    rx_v        : boolean;
  protected
    procedure Execute; override;
    procedure ReceiveData(msg : string);
  public
    constructor Create(Channel : smallint; Host : string; Port : integer);

    procedure WantAllPackages;
    procedure WantedPackage(packageType : string; state : boolean);
  end;

implementation

uses
  DataSenderThread, SysUtils, IdTCPConnection;

{ TDRX_DataReceiver }

constructor TDRX_DataReceiver.Create(Channel : smallint; Host: string; Port: integer);
begin
  inherited Create( true );
  FreeOnTerminate := true;
  Priority := tpHigher;

  fChannel := Channel;

  tx_rx_power := false;
  tx_burst    := false;
  tx_spectrum := false;
  rx_dbz      := false;
  rx_dbt      := false;
  rx_w        := false;
  rx_v        := false;

  DataReceiver      := TIdTCPClient.Create( nil );
  DataReceiver.Port := Port;
  DataReceiver.Host := Host;

  DataReceiver.Connect(deMaxTimeServerConnect);

  Resume;
end;

procedure TDRX_DataReceiver.Execute;
var
  Command : string;
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
      else if (Command = TX_RX_Power_Command) or
              (Command = TX_Burst_Command   ) or
              (Command = TX_Spectrum_Command) or
              (Command = RX_dBZ_Command   ) or
              (Command = RX_dBT_Command ) or
              (Command = RX_V_Command   ) or
              (Command = RX_W_Command)
            then
              begin
                ReceiveData(Command);
                Sleep(10);
              end;
  except
    Terminate;
  end;

  if DataReceiver.Connected
    then DataReceiver.Disconnect;
  DataReceiver.Free;
end;

procedure TDRX_DataReceiver.ReceiveData(msg : string);
var
  DataType, ndata, Az, El, CellSize : smallint;
  data : pointer;
  BufferSize : integer;
  allowed : boolean;
begin
  allowed := ((msg = TX_RX_Power_Command) and tx_rx_power) or
             ((msg = TX_Burst_Command   ) and tx_burst   ) or
             ((msg = TX_Spectrum_Command) and tx_spectrum) or
             ((msg = RX_dBZ_Command     ) and rx_dbz     ) or
             ((msg = RX_dBT_Command     ) and rx_dbt     ) or
             ((msg = RX_V_Command       ) and rx_v       ) or
             ((msg = RX_W_Command       ) and rx_w       );

  if allowed
    then
      begin
        DataReceiver.WriteLn(Success_Response);

        CellSize := DataReceiver.ReadSmallInt;
        Az       := DataReceiver.ReadSmallInt;
        El       := DataReceiver.ReadSmallInt;
        DataType := DataReceiver.ReadSmallInt;
        ndata    := DataReceiver.ReadSmallInt;
        BufferSize := ndata * GetSizeOf(DataType);
        data := AllocMem(BufferSize);
        DataReceiver.ReadBuffer(data^, BufferSize);

        if not SendDataPackage(msg, fChannel, CellSize, Az, El, DataType, ndata, data)
          then WantedPackage(msg, false);
      end
    else
      DataReceiver.WriteLn(Fail_Response);
end;

procedure TDRX_DataReceiver.WantAllPackages;
begin
  tx_rx_power := true;
  tx_burst    := true;
  tx_spectrum := true;
  rx_dbz      := true;
  rx_dbt      := true;
  rx_v        := true;
  rx_w        := true;
end;

procedure TDRX_DataReceiver.WantedPackage(packageType: string; state: boolean);
begin
       if packageType = TX_RX_Power_Command then tx_rx_power := state
  else if packageType = TX_Burst_Command    then tx_burst    := state
  else if packageType = TX_Spectrum_Command then tx_spectrum := state
  else if packageType = RX_dBZ_Command      then rx_dbz      := state
  else if packageType = RX_dBT_Command      then rx_dbt      := state
  else if packageType = RX_V_Command        then rx_v        := state
  else if packageType = RX_W_Command        then rx_w        := state;
end;

end.
