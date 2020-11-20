{ Invokable implementation File for TAZMotorWS which implements IAZMotorWS }

unit AZMotorWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, AZMotorWSIntf, CommunicationObj;

type

  { TAZMotorWS }
  TAZMotorWS = class(TCommObj, IAZMotorWS)
  public
  //Status
    function  Get_Posicion: Integer; safecall;
    function  Get_Velocidad: Integer; safecall;
    function  Get_SP_Posicion: Integer; safecall;
    function  Get_SP_Velocidad: Integer; safecall;
    function  Get_Lazo_Posicion: boolean; safecall;
    function  Get_Acc_Listo: boolean; safecall;
    function  Get_Marca_Posicion: Integer; safecall;
    function  Get_Lazo_Sector: boolean; safecall;
  //Control
    procedure Set_SP_Posicion(Value: Integer); safecall;
    procedure Set_SP_Velocidad(Value: Integer); safecall;
    procedure Set_Lazo_Posicion(Value: boolean); safecall;
    function  Get_Lazo_Posicion_K: Single; safecall;
    procedure Set_Lazo_Posicion_K(Value: Single); safecall;
    function  Get_Lazo_Velocidad_K: Single; safecall;
    procedure Set_Lazo_Velocidad_K(Value: Single); safecall;
    procedure Set_Marca_Posicion(Value: Integer); safecall;
    procedure Set_Lazo_Sector(Value: boolean); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses
  ElbrusTypes, Elbrus, Users;

{ TAZMotorWS }

function TAZMotorWS.Get_Acc_Listo: boolean;
begin
  Result := (SnapShot.Digital_Input and di_Acc_Listo_Az) <> 0;
end;

function TAZMotorWS.Get_Lazo_Posicion: boolean;
begin
  Result := Snapshot.Position_Loop_Az;
end;

function TAZMotorWS.Get_Lazo_Sector: boolean;
begin
  Result := Snapshot.Sector_Loop_Az;
end;

function TAZMotorWS.Get_Marca_Posicion: Integer;
begin
  Result := Snapshot.Mark_Position_Az;
end;

function TAZMotorWS.Get_Posicion: Integer;
begin
  Result := Snapshot.Position_Az;
end;

function TAZMotorWS.Get_SP_Posicion: Integer;
begin
  Result := Snapshot.SP_Position_Az;
end;

function TAZMotorWS.Get_SP_Velocidad: Integer;
begin
  Result := Snapshot.SP_Velocity_Az;
end;

function TAZMotorWS.Get_Velocidad: Integer;
begin
  Result := Snapshot.Velocity_Az;
end;

{ TAZMotorWS }

function TAZMotorWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Operator;
end;

function TAZMotorWS.Get_Lazo_Posicion_K: Single;
begin
  Result := Snapshot.Position_Loop_Az_K;
end;

function TAZMotorWS.Get_Lazo_Velocidad_K: Single;
begin
  Result := Snapshot.Velocity_Loop_Az_K;
end;

procedure TAZMotorWS.Set_Lazo_Posicion(Value: boolean);
begin
  if InControl
    then Elbrus.Set_Lazo_Posicion_Az(Value);
end;

procedure TAZMotorWS.Set_Lazo_Posicion_K(Value: Single);
begin
  if InControl
    then Elbrus.Set_Lazo_K_Pos_Az(Value);
end;

procedure TAZMotorWS.Set_Lazo_Sector(Value: boolean);
begin
  if InControl
    then Elbrus.Set_Lazo_Sector_Az(Value);
end;

procedure TAZMotorWS.Set_Lazo_Velocidad_K(Value: Single);
begin
  if InControl
    then Elbrus.Set_Lazo_K_Vel_Az(Value);
end;

procedure TAZMotorWS.Set_Marca_Posicion(Value: Integer);
begin
  if InControl
    then Elbrus.Set_Mark_Posicion_Az(Value);
end;

procedure TAZMotorWS.Set_SP_Posicion(Value: Integer);
begin
  if InControl
    then Elbrus.Set_SP_Posicion_Az(Value);
end;

procedure TAZMotorWS.Set_SP_Velocidad(Value: Integer);
begin
  if InControl
    then Elbrus.Set_SP_Velocidad_Az(Value);
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TAZMotorWS);

end.
 