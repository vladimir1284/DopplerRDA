unit RadarWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, RadarWSIntf, CommunicationObj;

type

  TRadarWS = class(TCommObj, IRadarWS)
  public
    function Get_Red_Listo: WordBool; safecall;
    function Get_Radar_On_P: WordBool; safecall;
    function Get_Radar_On_N: WordBool; safecall;
    function Get_Muestra_P: Integer; safecall;
    function Get_Muestra_N: Integer; safecall;
    function Get_Radar_Encender: WordBool; safecall;
    function Get_Radar_Apagar: WordBool; safecall;
    function Get_Rango_Muestra_P: Integer; safecall;
    function Get_Rango_Muestra_N: Integer; safecall;
    function Get_Sector_Muestra_P: Integer; safecall;
    function Get_Sector_Muestra_N: Integer; safecall;

    procedure Encender_Radar; safecall;
    procedure Apagar_Radar; safecall;
    procedure Set_Rango_Muestra_P(Value: Integer); safecall;
    procedure Set_Rango_Muestra_N(Value: Integer); safecall;
    procedure Set_Sector_Muestra_P(Value: Integer); safecall;
    procedure Set_Sector_Muestra_N(Value: Integer); safecall;
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

function TRadarWS.Get_Muestra_N: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Muestra_Fuente_N];
end;

function TRadarWS.Get_Muestra_P: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Muestra_Fuente_P];
end;

function TRadarWS.Get_Radar_Apagar: WordBool;
begin
  Result := (Snapshot.Digital_Output and do_Radar_Apagar) <> 0;
end;

function TRadarWS.Get_Radar_Encender: WordBool;
begin
  Result := (Snapshot.Digital_Output and do_Radar_Encender) <> 0;
end;

function TRadarWS.Get_Radar_On_N: WordBool;
begin
  Result := (Snapshot.Digital_Input and di_Radar_On_N) <> 0;
end;

function TRadarWS.Get_Radar_On_P: WordBool;
begin
  Result := (Snapshot.Digital_Input and di_Radar_On_P) <> 0;
end;

function TRadarWS.Get_Rango_Muestra_N: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Muestra_Fuente_N]);
end;

function TRadarWS.Get_Rango_Muestra_P: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Muestra_Fuente_P]);
end;

function TRadarWS.Get_Red_Listo: WordBool;
begin
  Result := (Snapshot.Digital_Input and di_Red_Listo) <> 0;
end;

function TRadarWS.Get_Sector_Muestra_N: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Muestra_Fuente_N]);
end;

function TRadarWS.Get_Sector_Muestra_P: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Muestra_Fuente_P]);
end;

procedure TRadarWS.Set_Rango_Muestra_N(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Muestra_Fuente_N, TAIRAnge(Value));
end;

procedure TRadarWS.Set_Rango_Muestra_P(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Muestra_Fuente_P, TAIRAnge(Value));
end;

procedure TRadarWS.Set_Sector_Muestra_N(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Muestra_Fuente_N, TAIRAnge(Value));
end;

procedure TRadarWS.Set_Sector_Muestra_P(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Muestra_Fuente_P, TAIRAnge(Value));
end;

initialization
  InvRegistry.RegisterInvokableClass(TRadarWS);

end.
 