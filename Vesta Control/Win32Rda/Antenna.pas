unit Antenna;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, RDAObj, Rda_TLB;

type
  TAntenna =
    class( TRDAObject, IAntenna, IAntennaControl )
      protected  // IAntenna
        function Get_Excitacion: WordBool; safecall;
        function Get_Limite_N: WordBool; safecall;
        function Get_Limite_P: WordBool; safecall;
        function Get_Motor_Az: IMotorStatus; safecall;
        function Get_Motor_El: IMotorStatus; safecall;
        function Get_Cupula_Cerrada: WordBool; safecall;
        function Get_Local: WordBool; safecall;
        function Get_Ventilacion: WordBool; safecall;

        function Get_SyncMark: Integer; safecall;
        function Get_SyncMarkDirection: WordBool; safecall;

        function Get_Fuente_Exitacion_Code: Integer; safecall;
        function Get_Fuente_Exitacion_Unit: Double; safecall;
        function Get_Fuente_5V_Code: Integer; safecall;
        function Get_Fuente_5V_Unit: Double; safecall;
        function Get_Fuente_12V_Code: Integer; safecall;
        function Get_Fuente_24V_Code: Integer; safecall;
        function Get_Fuente_24V_Unit: Double; safecall;
        function Get_Fuente_12V_Unit: Double; safecall;

        function Get_Rango_Fuente_5V: Integer; safecall;
        function Get_Rango_Fuente_12V: Integer; safecall;
        function Get_Rango_Fuente_24V: Integer; safecall;
        function Get_Rango_Fuente_Excitacion: Integer; safecall;
        function Get_Sector_Fuente_5V: Integer; safecall;
        function Get_Sector_Fuente_12V: Integer; safecall;
        function Get_Sector_Fuente_24V: Integer; safecall;
        function Get_Sector_Fuente_Excitacion: Integer; safecall;

        function Get_Status: RadarStatus; safecall;        
      protected  // IAntennaControl
        procedure Encender_Acc; safecall;
        procedure Apagar_Acc; safecall;
        procedure Alarma_Sonora(Tiempo: Integer); safecall;

        procedure Set_SyncMark(direction: WordBool; rays: Shortint); safecall;

        procedure Set_Rango_Fuente_5V(Value: Integer); safecall;
        procedure Set_Sector_Fuente_5V(Value: Integer); safecall;
        procedure Set_Sector_Fuente_12V(Value: Integer); safecall;
        procedure Set_Rango_Fuente_12V(Value: Integer); safecall;
        procedure Set_Rango_Fuente_24V(Value: Integer); safecall;
        procedure Set_Sector_Fuente_24V(Value: Integer); safecall;
        procedure Set_Rango_Fuente_Excitacion(Value: Integer); safecall;
        procedure Set_Sector_Fuente_Excitacion(Value: Integer); safecall;
    end;

const
  Class_Antenna: TGUID = '{A20AD06A-1DED-4BD0-8738-0B1F136629F5}';

implementation

uses
  ComServ,
  ElbrusTypes, Elbrus,
  MotorAz, MotorEl, ManagerDRX, DRX_Sync_WS;

function TAntenna.Get_Excitacion: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Excitacion = di_Excitacion;
end;

function TAntenna.Get_Limite_N: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Antena_Limite_N = di_Antena_Limite_N;
end;

function TAntenna.Get_Limite_P: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Antena_Limite_P = di_Antena_Limite_P;
end;

procedure TAntenna.Encender_Acc;
begin
  if InControl
    then Elbrus.Encender_Accionamiento;
end;

procedure TAntenna.Apagar_Acc;
begin
  if InControl
    then Elbrus.Apagar_Accionamiento;
end;

procedure TAntenna.Alarma_Sonora(Tiempo: Integer);
begin
  if InControl
    then Elbrus.Alarma_Sonora(Tiempo);
end;

function TAntenna.Get_Motor_Az: IMotorStatus;
begin
  Result := TMotor_Az.Create(UserName, Level);
end;

function TAntenna.Get_Motor_El: IMotorStatus;
begin
  Result := TMotor_El.Create(UserName, Level);
end;

function TAntenna.Get_Cupula_Cerrada: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Cupula_Cerrada = di_Cupula_Cerrada;
end;

function TAntenna.Get_SyncMark: Integer;
begin
  result := Snapshot^.SyncMark;
end;

function TAntenna.Get_SyncMarkDirection: WordBool;
begin
  result := Snapshot^.SyncMarkDirection;
end;

procedure TAntenna.Set_SyncMark(direction: WordBool; rays: Shortint);
begin
  if InControl
    then Elbrus.Set_SyncMark(direction, rays);
end;

function TAntenna.Get_Fuente_12V_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Fuente_12V_P];
end;

function TAntenna.Get_Fuente_12V_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Fuente_12V_P];
end;

function TAntenna.Get_Fuente_24V_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Fuente_24V_P];
end;

function TAntenna.Get_Fuente_24V_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Fuente_24V_P];
end;

function TAntenna.Get_Fuente_5V_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Fuente_5V_P];
end;

function TAntenna.Get_Fuente_5V_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Fuente_5V_P];
end;

function TAntenna.Get_Fuente_Exitacion_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Fuente_Excitacion];
end;

function TAntenna.Get_Fuente_Exitacion_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Fuente_Excitacion];
end;

function TAntenna.Get_Rango_Fuente_12V: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Fuente_12V_P]);
end;

function TAntenna.Get_Rango_Fuente_24V: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Fuente_24V_P]);
end;

function TAntenna.Get_Rango_Fuente_5V: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Fuente_5V_P]);
end;

function TAntenna.Get_Rango_Fuente_Excitacion: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Fuente_Excitacion]);
end;

function TAntenna.Get_Sector_Fuente_12V: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Fuente_12V_P]);
end;

function TAntenna.Get_Sector_Fuente_24V: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Fuente_24V_P]);
end;

function TAntenna.Get_Sector_Fuente_5V: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Fuente_5V_P]);
end;

function TAntenna.Get_Sector_Fuente_Excitacion: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Fuente_Excitacion]);
end;

procedure TAntenna.Set_Rango_Fuente_12V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Fuente_12V_P, TAIRange(Value));
end;

procedure TAntenna.Set_Rango_Fuente_24V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Fuente_24V_P, TAIRange(Value));
end;

procedure TAntenna.Set_Rango_Fuente_5V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Fuente_5V_P, TAIRange(Value));
end;

procedure TAntenna.Set_Rango_Fuente_Excitacion(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Fuente_Excitacion, TAIRange(Value));
end;

procedure TAntenna.Set_Sector_Fuente_12V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Fuente_12V_P, TAIRange(Value));
end;

procedure TAntenna.Set_Sector_Fuente_24V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Fuente_24V_P, TAIRange(Value));
end;

procedure TAntenna.Set_Sector_Fuente_5V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Fuente_5V_P, TAIRange(Value));
end;

procedure TAntenna.Set_Sector_Fuente_Excitacion(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Fuente_Excitacion, TAIRange(Value));
end;

function TAntenna.Get_Status: RadarStatus;
begin
  if Snapshot.Antena_ON
    then if Snapshot.Antena_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TAntenna.Get_Local: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Antena_Local = di_Antena_Local;
end;

function TAntenna.Get_Ventilacion: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Antena_Ventilacion_On = di_Antena_Ventilacion_On;
end;

initialization
  TComObjectFactory.Create(ComServer, TAntenna, Class_Antenna, 'Antenna', '', ciMultiInstance, tmApartment);
end.
