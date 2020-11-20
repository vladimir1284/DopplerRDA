unit RadarWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, RadarWSIntf, CommunicationObj;

type

  TRadarWS = class(TCommObj, IRadarWS)
  public
    function Get_Red_Listo: WordBool; safecall;
    function Get_Radar_On: WordBool; safecall;
    function Get_Tx1Status: RadarStatusEnum; safecall;
    function Get_Tx2Status: RadarStatusEnum; safecall;
    function Get_Rx1Status: RadarStatusEnum; safecall;
    function Get_Rx2Status: RadarStatusEnum; safecall;
    function Get_AntennaStatus: RadarStatusEnum; safecall;
    function Get_Status: RadarStatusEnum; safecall;

    procedure Encender_Radar; safecall;
    procedure Apagar_Radar; safecall;
  end;

implementation

uses
  ElbrusTypes, Elbrus;

{ TRadarWS }

procedure TRadarWS.Apagar_Radar;
begin
  if InControl
    then Elbrus.Apagar_Radar;
end;

procedure TRadarWS.Encender_Radar;
begin
  if InControl
    then Elbrus.Encender_Radar;
end;

function TRadarWS.Get_AntennaStatus: RadarStatusEnum;
begin
  if Snapshot.Antena_ON
    then if Snapshot.Antena_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadarWS.Get_Radar_On: WordBool;
begin
  result := Is_RadarOn;
end;

function TRadarWS.Get_Red_Listo: WordBool;
begin
  Result := (Snapshot.Digital_Input and di_Red_Listo) = di_Red_Listo;
end;

function TRadarWS.Get_Rx1Status: RadarStatusEnum;
begin
  if Snapshot.Rx1_ON
    then if Snapshot.Rx1_ON
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadarWS.Get_Rx2Status: RadarStatusEnum;
begin
  if Snapshot.Rx2_ON
    then if Snapshot.Rx2_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadarWS.Get_Status: RadarStatusEnum;
begin
  if Snapshot.Radar_ON
    then if Snapshot.Radar_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadarWS.Get_Tx1Status: RadarStatusEnum;
begin
  if Snapshot.Tx1_ON
    then if Snapshot.Tx1_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadarWS.Get_Tx2Status: RadarStatusEnum;
begin
  if Snapshot.Tx2_ON
    then if Snapshot.Tx2_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

initialization
  InvRegistry.RegisterInvokableClass(TRadarWS);

end.
 