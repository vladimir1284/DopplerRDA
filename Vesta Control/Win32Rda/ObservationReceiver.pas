unit ObservationReceiver;

interface

uses
  Classes, IdTCPClient, Constants, Observation;

type
  TObservationDataReceiver = class(TThread)
  private
    DataReceiver : TIdTCPClient;
    fChannel : smallint;
    fOwnerObs : TObservation;
  private
    procedure ReceiveMovement;
  protected
    procedure Execute; override;
  public
    constructor Create(Owner : TObservation; Channel : smallint; Host : string; Port : integer);
  end;

var
  ObsChannel : array[0..1] of TObservationDataReceiver;

implementation

uses
  Windows, SysUtils;

{ TDataBlockReceiver }

constructor TObservationDataReceiver.Create(Owner: TObservation; Channel: smallint; Host: string; Port: integer);
begin
  inherited Create( true );
  FreeOnTerminate := true;
  Priority  := tpHigher;
  fOwnerObs := Owner;
  fChannel  := Channel;

  DataReceiver      := TIdTCPClient.Create( nil );
  DataReceiver.Port := Port;
  DataReceiver.Host := Host;

  try
    if Assigned(ObsChannel[Channel])
      then ObsChannel[Channel].Terminate;
  except
  end;

  Resume;
end;

procedure TObservationDataReceiver.Execute;
var
  Command : string;
  ErrorMsg : string;
begin
  ObsChannel[fChannel] := self;
  try
    DataReceiver.Connect(deMaxTimeServerConnect);

    while not Terminated do
    begin
      Command := DataReceiver.ReadLn('', deClientCommandTimeOut);

      if Command = Obs_Move_Command
        then ReceiveMovement
        else if Command = Obs_Finalize_Command
               then
                 begin
                   fOwnerObs.DataComplete(fChannel);
                   Terminate;
                 end
               else if Command = Obs_Error_Command
                      then
                        begin
                          ErrorMsg := DataReceiver.ReadLn();
                          fOwnerObs.SetError(ErrorMsg);
                          Terminate;
                        end
                      else
                        if Command = ''
                          then
                            begin
                              DataReceiver.CheckForDisconnect;
                              DataReceiver.CheckForGracefulDisconnect;
                              Sleep(1000);
                            end
                          else
                            begin
                              fOwnerObs.SetError('Error recibiendo datos. Comando ( ' + Command + ' ) desconocido...');
                              Terminate;
                            end;
    end;
  except
    on E : Exception do
    begin
      if not Terminated
        then fOwnerObs.SetError('Error recibiendo datos...' + E.Message);
    end;
  end;

  ObsChannel[fChannel] := nil;

  if DataReceiver.Connected
    then DataReceiver.Disconnect;

  DataReceiver.Free;
end;

procedure TObservationDataReceiver.ReceiveMovement;
var
  dBZ, dBT, V, W : PSingles;
  El, Spd, Sectors, Cells, Size : smallint;
  BufferSize : integer;
  DataDateTime  :double;
begin
  DataDateTime := Now;

  El      := DataReceiver.ReadSmallInt;
  Spd     := DataReceiver.ReadSmallInt;
  Sectors := DataReceiver.ReadSmallInt;
  Cells   := DataReceiver.ReadSmallInt;
  Size    := DataReceiver.ReadSmallInt;

  BufferSize := Sectors * Cells * sizeof(single);
  dBZ := AllocMem(BufferSize);
  dBT := AllocMem(BufferSize);
  V   := AllocMem(BufferSize);
  W   := AllocMem(BufferSize);

  try
    DataReceiver.ReadBuffer(dBZ^, BufferSize);
    DataReceiver.ReadBuffer(dBT^, BufferSize);
    DataReceiver.ReadBuffer(V^, BufferSize);
    DataReceiver.ReadBuffer(W^, BufferSize);

    if not Terminated
      then fOwnerObs.ReceiveData(fChannel, DataDateTime, Spd, El, Sectors, Cells, Size, dBZ, dBT, V, W);
  finally
    FreeMem(dBZ);
    FreeMem(dBT);
    FreeMem(V);
    FreeMem(W);
  end;
end;

end.
