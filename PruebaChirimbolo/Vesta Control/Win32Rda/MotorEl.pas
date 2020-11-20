unit MotorEl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, RDAObj, Rda_TLB;

type
  TMotor_El =
    class( TRDAObject, IMotorStatus, IMotorControl )
    protected  //IMotorStatus
      function  Get_Posicion: Integer; safecall;
      function  Get_Velocidad: Integer; safecall;
      function  Get_SP_Posicion: Integer; safecall;
      function  Get_SP_Velocidad: Integer; safecall;
      function  Get_Lazo_Posicion: WordBool; safecall;
      function  Get_Acc_Listo: WordBool; safecall;
      function  Get_Marca_Posicion: Integer; safecall;
      function  Get_Lazo_Sector: WordBool; safecall;

      function Get_Taco_Code: Integer; safecall;
      function Get_Taco_Unit: Double; safecall;
      function Get_Range_Taco: Integer; safecall;
      function Get_Sector_Taco: Integer; safecall;

      function Get_Status: RadarStatus; safecall;
    protected  //IMotorControl
      procedure Set_SP_Posicion(Value: Integer); safecall;
      procedure Set_SP_Velocidad(Value: Integer); safecall;
      procedure Set_Lazo_Posicion(Value: WordBool); safecall;
      function  Get_Lazo_Posicion_K: Single; safecall;
      procedure Set_Lazo_Posicion_K(Value: Single); safecall;
      function  Get_Lazo_Velocidad_K: Single; safecall;
      procedure Set_Lazo_Velocidad_K(Value: Single); safecall;
      procedure Set_Marca_Posicion(Value: Integer); safecall;
      procedure Set_Lazo_Sector(Value: WordBool); safecall;

      procedure Set_Range_Taco(Value: Integer); safecall;
      procedure Set_Sector_Taco(Value: Integer); safecall;
    end;

const
  Class_Motor_El: TGUID = '{DA7B128A-312E-4F55-B439-668EF81189E5}';

implementation

uses
  ComServ,
  ElbrusTypes, Elbrus;

function TMotor_El.Get_Posicion: Integer;
begin
  Result := Snapshot.Position_El;
end;

function TMotor_El.Get_Velocidad: Integer;
begin
  Result := Snapshot.Velocity_El;
end;

function TMotor_El.Get_Lazo_Posicion: WordBool;
begin
  Result := Snapshot.Position_Loop_El;
end;

function TMotor_El.Get_SP_Posicion: Integer;
begin
  Result := Snapshot.SP_Position_El;
end;

function TMotor_El.Get_SP_Velocidad: Integer;
begin
  Result := Snapshot.SP_Velocity_El;
end;

procedure TMotor_El.Set_Lazo_Posicion(Value: WordBool);
begin
  if InControl
    then Elbrus.Set_Lazo_Posicion_El(Value);
end;

procedure TMotor_El.Set_SP_Posicion(Value: Integer);
begin
  if InControl
    then Elbrus.Set_SP_Posicion_El(Value);
end;

procedure TMotor_El.Set_SP_Velocidad(Value: Integer);
begin
  if InControl
    then Elbrus.Set_SP_Velocidad_El(Value);
end;

function TMotor_El.Get_Lazo_Posicion_K: Single;
begin
  Result := Snapshot.Position_Loop_El_K;
end;

procedure TMotor_El.Set_Lazo_Posicion_K(Value: Single);
begin
  if InControl
    then Elbrus.Set_Lazo_K_Pos_El(Value);
end;

function TMotor_El.Get_Acc_Listo: WordBool;
begin
  Result := (SnapShot.Digital_Input and di_Acc_Listo_El) <> 0;
end;

function TMotor_El.Get_Lazo_Velocidad_K: Single;
begin
  Result := Snapshot.Velocity_Loop_El_K;
end;

procedure TMotor_El.Set_Lazo_Velocidad_K(Value: Single);
begin
  if InControl
    then Elbrus.Set_Lazo_K_Vel_El(Value);
end;

procedure TMotor_El.Set_Lazo_Sector(Value: WordBool);
begin
  if InControl
    then Elbrus.Set_Lazo_Sector_El(Value);
end;

procedure TMotor_El.Set_Marca_Posicion(Value: Integer);
begin
  if InControl
    then Elbrus.Set_Mark_Posicion_El(Value);
end;

function TMotor_El.Get_Marca_Posicion: Integer;
begin
  Result := Snapshot.Mark_Position_El;
end;

function TMotor_El.Get_Lazo_Sector: WordBool;
begin
  Result := Snapshot.Sector_Loop_El;
end;

function TMotor_El.Get_Status: RadarStatus;
begin
  if Snapshot.MotorEl_ON
    then if Snapshot.MotorEl_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TMotor_El.Get_Range_Taco: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Taco_El]);
end;

function TMotor_El.Get_Sector_Taco: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Taco_El]);
end;

function TMotor_El.Get_Taco_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Taco_El];
end;

function TMotor_El.Get_Taco_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Taco_El];
end;

procedure TMotor_El.Set_Range_Taco(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Taco_El, TAIRange(Value));
end;

procedure TMotor_El.Set_Sector_Taco(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Taco_El, TAIRange(Value));
end;

initialization
  TComObjectFactory.Create(ComServer, TMotor_El, Class_Motor_El,
    'Motor_El', '', ciMultiInstance, tmApartment);
end.
