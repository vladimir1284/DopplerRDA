unit Radar;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, RDA_TLB, RDAObj;

type
  TRadar =
    class( TRDAObject, IRadar, IRadarControl )
    protected  //IRadar
      function Get_Red_Listo: WordBool; safecall;
      function Get_Radar_On: WordBool; safecall;
      function Get_Tx1Status: RadarStatus; safecall;
      function Get_Tx2Status: RadarStatus; safecall;
      function Get_Rx1Status: RadarStatus; safecall;
      function Get_Rx2Status: RadarStatus; safecall;
      function Get_AntennaStatus: RadarStatus; safecall;
      function Get_Status: RadarStatus; safecall;
    protected  //IRadarControl
      procedure Encender_Radar; safecall;
      procedure Apagar_Radar; safecall;
    end;

const
  Class_Radar: TGUID = '{3754B9AC-4E4D-489D-94A0-5B1397AEC3C3}';

implementation

uses
  ComServ, ElbrusTypes, Elbrus, SysUtils, ManagerDRX;

{ TRadar }

procedure TRadar.Apagar_Radar;
begin
  if InControl
    then Elbrus.Apagar_Radar;
end;

procedure TRadar.Encender_Radar;
begin
  if InControl
    then Elbrus.Encender_Radar;
end;

function TRadar.Get_AntennaStatus: RadarStatus;
begin
  if Snapshot.Antena_ON
    then if Snapshot.Antena_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadar.Get_Radar_On: WordBool;
begin
  result := Is_RadarOn;
end;

function TRadar.Get_Red_Listo: WordBool;
begin
  Result := (Snapshot.Digital_Input and di_Red_Listo) = di_Red_Listo;
end;

function TRadar.Get_Rx1Status: RadarStatus;
begin
  if Snapshot.Rx1_ON
    then if Snapshot.Rx1_ON
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadar.Get_Rx2Status: RadarStatus;
begin
  if Snapshot.Rx2_ON
    then if Snapshot.Rx2_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadar.Get_Status: RadarStatus;
begin
  if Snapshot.Radar_ON
    then if Snapshot.Radar_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadar.Get_Tx1Status: RadarStatus;
begin
  if Snapshot.Tx1_ON
    then if Snapshot.Tx1_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TRadar.Get_Tx2Status: RadarStatus;
begin
  if Snapshot.Tx2_ON
    then if Snapshot.Tx2_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

initialization
  TComObjectFactory.Create(ComServer, TRadar, Class_Radar, 'Radar', '', ciMultiInstance, tmApartment);
end.
