unit TxRx1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ActiveX, Classes, ComObj, RDAObj, Rda_TLB;

type
  TTxRx1 =
    class( TRDAObject,
           ITxRxStatus, ITxStatus,  IRxStatus,
           ITxControl, IRxControl, ISynchro,
           ITxRxMeasure, ITxRxMeasureControl,
           ICalibration, ICalibrationControl)
      protected  // ITxStatus
        function Get_Tx_Status: RadarStatus; safecall;
        function Get_Encendido: WordBool; safecall;
        function Get_HV: WordBool; safecall;
        function Get_Listo: WordBool; safecall;
        function Get_Inter_Lock: WordBool; safecall;
        function Get_Ventilacion: WordBool; safecall;
        function Get_Averia: WordBool; safecall;
        function Get_Averia_MPS: WordBool; safecall;
        function Get_Averia_Ventilador: WordBool; safecall;
        function Get_Averia_Fuente_Filamento: WordBool; safecall;
        function Get_Local: WordBool; safecall;
      protected  // IRxStatus
        function Get_Fuente_5V_N: WordBool; safecall;
        function Get_Fuente_5V_P: WordBool; safecall;
        function Get_Fuente_15V_N: WordBool; safecall;
        function Get_Fuente_15V_P: WordBool; safecall;
        function Get_Stalo_Locked: WordBool; safecall;
        function Get_Rx_Status: RadarStatus; safecall;
        function Get_DRX_Ready: WordBool; safecall;

        function Get_Stalo_Temperature: Double; safecall;
        function Get_Stalo_Power: Double; safecall;
        function Get_Stalo_Frequency: Int64; safecall;
        function Get_Stalo_ExtRef: WordBool; safecall;
        function Get_Stalo_Ref_Unlocked: WordBool; safecall;
        function Get_Stalo_RF_Unlocked: WordBool; safecall;
        function Get_Stalo_RF_Output: WordBool; safecall;
        function Get_Stalo_VoltageError: WordBool; safecall;
        function Get_Stalo_Ref_Output: WordBool; safecall;
        function Get_Stalo_Blanking: WordBool; safecall;
        function Get_Stalo_LockRecovery: WordBool; safecall;
        function Get_AFC_Status: WordBool; safecall;
        function Get_Tx_Frequency: Int64; safecall;
        function Get_Tx_IF: Int64; safecall;
        function Get_Tx_PulsePower: Double; safecall;
        function Get_NCO_Frequency: Int64; safecall;
        procedure StartAcquiring; safecall;

        function Get_Potencia_Code: Integer; safecall;
        function Get_Potencia_Unit: Double; safecall;
        function Get_MPS_Volt_Code: Integer; safecall;
        function Get_MPS_Volt_Unit: Double; safecall;
        function Get_MPS_Corr_Code: Integer; safecall;
        function Get_MPS_Corr_Unit: Double; safecall;
        function Get_Fuente_24VN_Code: Integer; safecall;
        function Get_Fuente_24VN_Unit: Double; safecall;
        function Get_Fuente_24VP_Code: Integer; safecall;
        function Get_Fuente_24VP_Unit: Double; safecall;
        function Get_Fuente_50V_Code: Integer; safecall;
        function Get_Fuente_50V_Unit: Double; safecall;
        function Get_Fuente_100V_Code: Integer; safecall;
        function Get_Fuente_100V_Unit: Double; safecall;
        function Get_Fuente_400V_Code: Integer; safecall;
        function Get_Fuente_400V_Unit: Double; safecall;
        function Get_Fuente_Filamento_Code: Integer; safecall;
        function Get_Fuente_Filamento_Unit: Double; safecall;
      protected  // ITxRxStatus
        function  Get_Tx_Pulso: TxPulse; safecall;
        function  Get_Numero: Integer; safecall;
        function  Get_Longitud_Onda: WaveLength; safecall;
      protected  // ITxControl
        procedure Tx_Encender; safecall;
        procedure Tx_Apagar; safecall;
        procedure Set_HV(Value: WordBool); safecall;
      protected  // IRxControl
        procedure Rx_Encender; safecall;
        procedure Rx_Apagar; safecall;

        procedure Set_Stalo_Freq(Value: Int64); safecall;
        procedure Set_Stalo_Power(Value: Double); safecall;
        procedure Stalo_Reset; safecall;
        procedure Set_AFC_Status(Value: WordBool); safecall;
        procedure Set_Stalo_Output(Value: WordBool); safecall;
        procedure Stalo_Update; safecall;
        procedure Set_NCO_Frequency(Value: Int64); safecall;
      protected  // ICalibration
        function Get_Potencia: Integer;   safecall;
        function Get_CRadarPL: Single;    safecall;
        function Get_CRadarPC: Single;    safecall;
        function Get_PotMetPL: Single;    safecall;
        function Get_PotMetPC: Single;    safecall;
        function Get_MPS_Voltage: Double; safecall;

        function Get_Tx_Pulse_SP: Integer; safecall;
        function Get_Tx_Pulse_LP: Integer; safecall;
        function Get_Start_Sample_SP: Integer; safecall;
        function Get_Final_Sample_SP: Integer; safecall;
        function Get_Start_Sample_LP: Integer; safecall;
        function Get_Final_Sample_LP: Integer; safecall;
        function Get_Tx_Factor: Double; safecall;
        function Get_Stalo_Delay: Integer; safecall;
        function Get_Stalo_Step: Integer; safecall;
        function Get_Stalo_Width: Integer; safecall;
        function Get_Valid_tx_power: Double; safecall;
        function Get_DRX_Codes_LP: PSafeArray; safecall;
        function Get_DRX_Codes_SP: PSafeArray; safecall;
        function Get_Loop_Gain: Double; safecall;
      protected  // ICalibrationControl
        procedure Set_Potencia(Value: Integer); safecall;
        procedure Set_CRadarPL(Value: Single); safecall;
        procedure Set_CRadarPC(Value: Single); safecall;
        procedure Set_MPS_Voltage(Value: Double); safecall;

        procedure Set_Tx_Pulse_SP(Value: Integer); safecall;
        procedure Set_Tx_Pulse_LP(Value: Integer); safecall;
        procedure Set_Start_Sample_SP(Value: Integer); safecall;
        procedure Set_Final_Sample_SP(Value: Integer); safecall;
        procedure Set_Start_Sample_LP(Value: Integer); safecall;
        procedure Set_Final_Sample_LP(Value: Integer); safecall;
        procedure Set_Tx_Factor(Value: Double); safecall;
        procedure Set_Stalo_Delay(Value: Integer); safecall;
        procedure Set_Stalo_Step(Value: Integer); safecall;
        procedure Set_Stalo_Width(Value: Integer); safecall;
        procedure Set_Valid_tx_power(Value: Double); safecall;
        procedure Set_DRX_Codes_LP(Value: PSafeArray); safecall;
        procedure Set_DRX_Codes_SP(Value: PSafeArray); safecall;
        procedure Set_Loop_Gain(Value: Double); safecall;
        procedure SaveDRX; safecall;
      protected  // ITxRxMeasure
        function  Get_Rango_Tx_Potencia: Integer; safecall;
        function  Get_Sector_Tx_Potencia: Integer; safecall;

        function Get_Rango_Tx_MPS_Volt: Integer; safecall;
        function Get_Rango_Tx_MPS_Corr: Integer; safecall;
        function Get_Rango_Tx_Fuente24V_N: Integer; safecall;
        function Get_Rango_Tx_Fuente24V_P: Integer; safecall;
        function Get_Rango_Tx_Fuente50V: Integer; safecall;
        function Get_Rango_Tx_Fuente400V: Integer; safecall;
        function Get_Rango_Tx_Fuente_Filamento: Integer; safecall;
        function Get_Rango_Tx_Fuente100V: Integer; safecall;

        function Get_Sector_Tx_MPS_Volt: Integer; safecall;
        function Get_Sector_Tx_MPS_Corr: Integer; safecall;
        function Get_Sector_Tx_Fuente24V_N: Integer; safecall;
        function Get_Sector_Tx_Fuente24V_P: Integer; safecall;
        function Get_Sector_Tx_Fuente50V: Integer; safecall;
        function Get_Sector_Tx_Fuente100V: Integer; safecall;
        function Get_Sector_Tx_Fuente400V: Integer; safecall;
        function Get_Sector_Tx_Fuente_Filamento: Integer; safecall;
      protected  // ITxRxMeasureControl
        procedure Set_Rango_Tx_Potencia(Value: Integer); safecall;
        procedure Set_Sector_Tx_Potencia(Value: Integer); safecall;

        procedure Set_Rango_Tx_MPS_Volt(Value: Integer); safecall;
        procedure Set_Rango_Tx_MPS_Corr(Value: Integer); safecall;
        procedure Set_Rango_Tx_Fuente24V_N(Value: Integer); safecall;
        procedure Set_Rango_Tx_Fuente24V_P(Value: Integer); safecall;
        procedure Set_Rango_Tx_Fuente50V(Value: Integer); safecall;
        procedure Set_Rango_Tx_Fuente100V(Value: Integer); safecall;
        procedure Set_Rango_Tx_Fuente400V(Value: Integer); safecall;
        procedure Set_Rango_Tx_Fuente_Filamento(Value: Integer); safecall;

        procedure Set_Sector_Tx_MPS_Volt(Value: Integer); safecall;
        procedure Set_Sector_Tx_MPS_Corr(Value: Integer); safecall;
        procedure Set_Sector_Tx_Fuente24V_N(Value: Integer); safecall;
        procedure Set_Sector_Tx_Fuente24V_P(Value: Integer); safecall;
        procedure Set_Sector_Tx_Fuente50V(Value: Integer); safecall;
        procedure Set_Sector_Tx_Fuente100V(Value: Integer); safecall;
        procedure Set_Sector_Tx_Fuente400V(Value: Integer); safecall;
        procedure Set_Sector_Tx_Fuente_Filamento(Value: Integer); safecall;
      protected  // ISynchro
        procedure Set_Pulso_Largo; safecall;
        procedure Set_Pulso_Corto(PRF_Rate: TxDualPulse); safecall;
        function  Get_Frecuencia: Integer; safecall;
        function  Get_Pulse: TxPulse; safecall;
        function  Get_PRF_Rate: TxDualPulse; safecall;
        function  FrecuenciaAD: Integer; safecall;
    end;

const
  Class_TxRx1: TGUID = '{37346572-15C1-4B49-98E7-9C3D3E0631A7}';

implementation

uses
  ComServ,
  ElbrusTypes, Elbrus,
  Calib, ManagerDRX, DRX_AFC_WS, DataSenderThread, Constants,
  DRX_DataReceiver, Config, Types, SysUtils, DRX_Sync_WS;

{ TTxRx1 }

function TTxRx1.Get_Tx_Pulso: TxPulse;
begin
  result := Snapshot.Tx1_Pulse;
end;

procedure TTxRx1.Rx_Apagar;
begin
  if InControl
    then Elbrus.Rx1_Apagar
end;

procedure TTxRx1.Rx_Encender;
begin
  if InControl
    then Elbrus.Rx1_Encender
end;

function TTxRx1.Get_Rango_Tx_Potencia: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_Potencia]);
end;

function TTxRx1.Get_Sector_Tx_Potencia: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_Potencia]);
end;

procedure TTxRx1.Set_Rango_Tx_Potencia(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_Potencia, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_Potencia(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_Potencia, TAIRange(Value));
end;

function TTxRx1.Get_Numero: Integer;
begin
  Result := 1;
end;

function TTxRx1.Get_Longitud_Onda: WaveLength;
begin
  Result := wl_3cm;
end;

function TTxRx1.Get_CRadarPC: Single;
begin
  Result := theCalibration.CRadarPC1;
end;

function TTxRx1.Get_CRadarPL: Single;
begin
  Result := theCalibration.CRadarPL1;
end;

function TTxRx1.Get_Potencia: Integer;
begin
  Result := theCalibration.Potencia1;
end;

function TTxRx1.Get_PotMetPC: Single;
begin
  Result := theCalibration.PotMetPC1;
end;

function TTxRx1.Get_PotMetPL: Single;
begin
  Result := theCalibration.PotMetPL1;
end;

procedure TTxRx1.Set_CRadarPC(Value: Single);
begin
  if InControl
    then theCalibration.CRadarPC1 := Value;
end;

procedure TTxRx1.Set_CRadarPL(Value: Single);
begin
  if InControl
    then theCalibration.CRadarPL1 := Value;
end;

procedure TTxRx1.Set_Potencia(Value: Integer);
begin
  if InControl
    then theCalibration.Potencia1 := Value;
end;

function TTxRx1.Get_AFC_Status: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_AFCChangesInhibited
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_NCO_Frequency: Int64;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_NCOFrequency
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Blanking: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Blanking
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_ExtRef: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_ExtRef
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Frequency: Int64;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Frequency
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_LockRecovery: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_LockRecovery
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Power: Double;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Power
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Ref_Output: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Ref_Output
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Ref_Unlocked: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Ref_Unlocked
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_RF_Output: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_RF_Output
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_RF_Unlocked: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_RF_Unlocked
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Temperature: Double;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Temperature
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_VoltageError: WordBool;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_VoltageError
      else result := false;
  except
    result := false;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Tx_Frequency: Int64;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Tx_Frequency
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Tx_IF: Int64;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_IF_Frequency
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Tx_PulsePower: Double;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Tx_Pulse_Power
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_AFC_Status(Value: WordBool);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_AFCChangesInhibited(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_NCO_Frequency(Value: Int64);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_NCOFrequency(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Stalo_Freq(Value: Int64);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Frequency(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Stalo_Output(Value: WordBool);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Output(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Stalo_Power(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Power(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Stalo_Reset;
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Stalo_Reset;
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Stalo_Update;
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Stalo_Update;
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.StartAcquiring;
begin
  try
    if DRX1.Ready
      then
        begin
          WantedPackages(0);
          DRX1.DataReceiver.WantAllPackages;
          DRX1.DRX_WS.StartDataFlow(false);
        end;
  except
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Final_Sample_LP: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Final_Sample_LP
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Final_Sample_SP: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Final_Sample_SP
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Delay: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Delay
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Step: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Step
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Stalo_Width: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Stalo_Width
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Start_Sample_LP: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Start_Sample_LP
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Start_Sample_SP: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Start_Sample_SP
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Tx_Factor: Double;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Tx_Factor
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Tx_Pulse_LP: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Tx_Pulse_LP
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Tx_Pulse_SP: Integer;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Tx_Pulse_SP
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Final_Sample_LP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Final_Sample_LP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Final_Sample_SP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Final_Sample_SP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Stalo_Delay(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Delay(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Stalo_Step(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Step(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Stalo_Width(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Width(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Start_Sample_LP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Start_Sample_LP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Start_Sample_SP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Start_Sample_SP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Tx_Factor(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Tx_Factor(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Tx_Pulse_LP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Tx_Pulse_LP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Tx_Pulse_SP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Tx_Pulse_SP(Value);
  except
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Valid_tx_power: Double;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Valid_Tx_Power
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Valid_tx_power(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Valid_tx_power(Value);
  except
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_DRX_Codes_SP: PSafeArray;
var
  codes : string;
  SAB : TSafeArrayBound;
  i : integer;
  Dinamic_Range, Sensibility : integer;
  buffer : TStrings;
begin
  try
    result := nil;
    if DRX1.Ready
      then
        begin
          Dinamic_Range := theCalibration.DinamicRangePC1;
          Sensibility   := theCalibration.SensibilityPC1;
          codes         := DRX1.Config_WS.Get_DRX_Table_SP;

          buffer := Classes.TStringList.Create;
          try
            buffer.Delimiter := ';';
            buffer.DelimitedText := codes;
            if (buffer.Count > 0) and (buffer.Count = Dinamic_Range)
              then
                begin
                  SAB.cElements := Dinamic_Range;
                  SAB.lLbound   := Sensibility;
                  result := SafeArrayCreate(VT_R4, 1, SAB);
                  for i := 0 to Dinamic_Range-1 do
                  try
                    PSingles(result.pvData)[i] := StrToFloat(buffer[i]);
                  except
                    PSingles(result.pvData)[i] := 0;
                  end;
                end;
          finally
            buffer.Free;
          end;
        end;
  except
    result := nil;
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_DRX_Codes_SP(Value: PSafeArray);
var
  codes : string;
  i : integer;
begin
  try
    if InControl and DRX1.Ready
      then
        if Value <> nil
          then
            begin
              codes := '';
              theCalibration.DinamicRangePC1 := Value.rgsabound[0].cElements;
              theCalibration.SensibilityPC1  := Value.rgsabound[0].lLbound;
              for i := 0 to Value.rgsabound[0].cElements-1 do
                try
                  if i < Value.rgsabound[0].cElements-1
                    then codes := codes + FormatFloat('0.00', PSingles(Value.pvData)^[i]) + ';'
                    else codes := codes + FormatFloat('0.00', PSingles(Value.pvData)^[i]);
                except
                  codes := codes + '0;';
                end;
              DRX1.Config_WS.Set_DRX_Table_SP(codes);
            end
          else DRX1.Config_WS.Set_DRX_Table_SP('');
  except
    DRX1.Validate;
  end;
end;

procedure TTxRx1.SaveDRX;
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Save_Calibration;
  except
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Loop_Gain: Double;
begin
  try
    if DRX1.Ready
      then result := DRX1.AFC_WS.Get_Loop_Gain
      else result := 0;
  except
    result := 0;
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_Loop_Gain(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Loop_Gain(Value);
  except
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Fuente_100V_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_fuente_100V_P];
end;

function TTxRx1.Get_Fuente_100V_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_fuente_100V_P];
end;

function TTxRx1.Get_Fuente_24VN_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_fuente_24V_N];
end;

function TTxRx1.Get_Fuente_24VN_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_fuente_24V_N];
end;

function TTxRx1.Get_Fuente_24VP_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_fuente_24V_P];
end;

function TTxRx1.Get_Fuente_24VP_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_fuente_24V_P];
end;

function TTxRx1.Get_Fuente_400V_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_fuente_400V_P];
end;

function TTxRx1.Get_Fuente_400V_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_fuente_400V_P];
end;

function TTxRx1.Get_Fuente_50V_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_fuente_50V_P];
end;

function TTxRx1.Get_Fuente_50V_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_fuente_50V_P];
end;

function TTxRx1.Get_Fuente_Filamento_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_Fuente_Filamento];
end;

function TTxRx1.Get_Fuente_Filamento_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_Fuente_Filamento];
end;

function TTxRx1.Get_MPS_Corr_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_MPS_Corriente];
end;

function TTxRx1.Get_MPS_Corr_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_MPS_Corriente];
end;

function TTxRx1.Get_MPS_Volt_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_MPS_Voltaje];
end;

function TTxRx1.Get_MPS_Volt_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_MPS_Voltaje];
end;

function TTxRx1.Get_Potencia_Code: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_Potencia];
end;

function TTxRx1.Get_Potencia_Unit: Double;
begin
  Result := Snapshot.Analog_Input_Voltage[ai_Tx1_Potencia];
end;

function TTxRx1.Get_Rango_Tx_Fuente100V: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_fuente_100V_P]);
end;

function TTxRx1.Get_Rango_Tx_Fuente400V: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_fuente_400V_P]);
end;

function TTxRx1.Get_Rango_Tx_Fuente_Filamento: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_Fuente_Filamento]);
end;

function TTxRx1.Get_Rango_Tx_Fuente24V_N: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_fuente_24V_N]);
end;

function TTxRx1.Get_Rango_Tx_Fuente24V_P: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_fuente_24V_P]);
end;

function TTxRx1.Get_Rango_Tx_Fuente50V: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_fuente_50V_P]);
end;

function TTxRx1.Get_Rango_Tx_MPS_Corr: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_MPS_Corriente]);
end;

function TTxRx1.Get_Rango_Tx_MPS_Volt: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_MPS_Voltaje]);
end;

function TTxRx1.Get_Sector_Tx_Fuente400V: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_fuente_400V_P]);
end;

function TTxRx1.Get_Sector_Tx_Fuente_Filamento: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_Fuente_Filamento]);
end;

function TTxRx1.Get_Sector_Tx_Fuente100V: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_fuente_100V_P]);
end;

function TTxRx1.Get_Sector_Tx_Fuente24V_N: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_fuente_24V_N]);
end;

function TTxRx1.Get_Sector_Tx_Fuente24V_P: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_fuente_24V_P]);
end;

function TTxRx1.Get_Sector_Tx_Fuente50V: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_fuente_50V_P]);
end;

function TTxRx1.Get_Sector_Tx_MPS_Corr: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_MPS_Corriente]);
end;

function TTxRx1.Get_Sector_Tx_MPS_Volt: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_MPS_Voltaje]);
end;

procedure TTxRx1.Set_Rango_Tx_Fuente100V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_100V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Rango_Tx_Fuente400V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_400V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Rango_Tx_Fuente_Filamento(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_Fuente_Filamento, TAIRange(Value));
end;

procedure TTxRx1.Set_Rango_Tx_Fuente24V_N(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_24V_N, TAIRange(Value));
end;

procedure TTxRx1.Set_Rango_Tx_Fuente24V_P(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_24V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Rango_Tx_Fuente50V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_50V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Rango_Tx_MPS_Corr(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_MPS_Corriente, TAIRange(Value));
end;

procedure TTxRx1.Set_Rango_Tx_MPS_Volt(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_MPS_Voltaje, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_Fuente_Filamento(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_Fuente_Filamento, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_Fuente100V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_100V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_Fuente24V_N(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_24V_N, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_Fuente24V_P(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_24V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_Fuente400V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_400V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_Fuente50V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_50V_P, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_MPS_Corr(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_MPS_Corriente, TAIRange(Value));
end;

procedure TTxRx1.Set_Sector_Tx_MPS_Volt(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_MPS_Voltaje, TAIRange(Value));
end;

function TTxRx1.Get_Rx_Status: RadarStatus;
begin
  if Snapshot.Rx1_ON
    then if Snapshot.Rx1_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TTxRx1.Get_Tx_Status: RadarStatus;
begin
  if Snapshot.Tx1_ON
    then if Snapshot.Tx1_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TTxRx1.Get_Averia_Fuente_Filamento: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_Averia_Fuente_Filamento = di_Tx1_Averia_Fuente_Filamento;
end;

function TTxRx1.Get_Local: WordBool;
begin
  Result := Snapshot.Digital_Input and di_TxRx1_Local = di_TxRx1_Local;
end;

function TTxRx1.Get_Averia_MPS: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_Averia_MPS = di_Tx1_Averia_MPS;
end;

function TTxRx1.Get_Averia_Ventilador: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_Averia_Ventilador = di_Tx1_Averia_Ventilador;
end;

function TTxRx1.Get_Encendido: WordBool;
begin
  Result := Snapshot.Tx1_ON;
end;

function TTxRx1.Get_HV: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_HV = di_Tx1_HV;
end;

function TTxRx1.Get_Inter_Lock: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_Inter_Lock = di_Tx1_Inter_Lock;
end;

function TTxRx1.Get_Listo: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_Listo = di_Tx1_Listo;
end;

function TTxRx1.Get_Ventilacion: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_Ventilacion_On = di_Tx1_Ventilacion_On;
end;

procedure TTxRx1.Tx_Apagar;
begin
  if InControl
    then Elbrus.Tx1_Apagar;
end;

procedure TTxRx1.Tx_Encender;
begin
  if InControl
   then Elbrus.Tx1_Encender;
end;

procedure TTxRx1.Set_HV(Value: WordBool);
begin
  if InControl
    then Tx1_Standby(Value);
end;

function TTxRx1.Get_Fuente_15V_N: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Rx1_Fuente15V_N = di_Rx1_Fuente15V_N;
end;

function TTxRx1.Get_Fuente_15V_P: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Rx1_Fuente15V_P = di_Rx1_Fuente15V_P;
end;

function TTxRx1.Get_Fuente_5V_N: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Rx1_Fuente5V_N = di_Rx1_Fuente5V_N;
end;

function TTxRx1.Get_Fuente_5V_P: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Rx1_Fuente5V_P = di_Rx1_Fuente5V_P;
end;

function TTxRx1.Get_Stalo_Locked: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Rx1_Stalo_Locked = di_Rx1_Stalo_Locked;
end;

function TTxRx1.Get_DRX_Ready: WordBool;
begin
  result := DRX1.Ready;
end;

function TTxRx1.Get_MPS_Voltage: Double;
begin
  Result := theCalibration.MPS_Voltage1;
end;

procedure TTxRx1.Set_MPS_Voltage(Value: Double);
begin
  if InControl
    then theCalibration.MPS_Voltage1 := Value;
end;

function TTxRx1.Get_DRX_Codes_LP: PSafeArray;
var
  codes : string;
  SAB : TSafeArrayBound;
  i : integer;
  Dinamic_Range, Sensibility : integer;
  buffer : TStrings;
begin
  try
    result := nil;
    if DRX1.Ready
      then
        begin
          Dinamic_Range := theCalibration.DinamicRangePL1;
          Sensibility   := theCalibration.SensibilityPL1;
          codes         := DRX1.Config_WS.Get_DRX_Table_LP;

          buffer := Classes.TStringList.Create;
          try
            buffer.Delimiter := ';';
            buffer.DelimitedText := codes;
            if (buffer.Count > 0) and (buffer.Count = Dinamic_Range)
              then
                begin
                  SAB.cElements := Dinamic_Range;
                  SAB.lLbound   := Sensibility;
                  result := SafeArrayCreate(VT_R4, 1, SAB);
                  for i := 0 to Dinamic_Range-1 do
                  try
                    PSingles(result.pvData)[i] := StrToFloat(buffer[i]);
                  except
                    PSingles(result.pvData)[i] := 0;
                  end;
                end;
          finally
            buffer.Free;
          end;
        end;
  except
    result := nil;
    DRX1.Validate;
  end;
end;

procedure TTxRx1.Set_DRX_Codes_LP(Value: PSafeArray);
var
  codes : string;
  i : integer;
begin
  try
    if InControl and DRX1.Ready
      then
        if Value <> nil
          then
            begin
              codes := '';
              theCalibration.DinamicRangePL1 := Value.rgsabound[0].cElements;
              theCalibration.SensibilityPL1  := Value.rgsabound[0].lLbound;
              for i := 0 to Value.rgsabound[0].cElements-1 do
                try
                  if i < Value.rgsabound[0].cElements-1
                    then codes := codes + FormatFloat('0.00', PSingles(Value.pvData)^[i]) + ';'
                    else codes := codes + FormatFloat('0.00', PSingles(Value.pvData)^[i]);
                except
                  codes := codes + '0;';
                end;
              DRX1.Config_WS.Set_DRX_Table_LP(codes);
            end
          else DRX1.Config_WS.Set_DRX_Table_LP('');
  except
    DRX1.Validate;
  end;
end;

function TTxRx1.Get_Averia: WordBool;
begin
  Result := Snapshot.Digital_Input and di_Tx1_Averia = di_Tx1_Averia;
end;

function TTxRx1.Get_Frecuencia: Integer;
begin
  Result := Snapshot^.Tx1_Trigger_Rate;
end;

function TTxRx1.Get_PRF_Rate: TxDualPulse;
begin
  Result := Snapshot^.Tx1_PRF_Rate;
end;

function TTxRx1.Get_Pulse: TxPulse;
begin
  Result := Snapshot^.Tx1_Pulse;
end;

procedure TTxRx1.Set_Pulso_Corto(PRF_Rate: TxDualPulse);
begin
  if InControl
    then Elbrus.Tx1_Short_Pulse(PRF_Rate);
end;

procedure TTxRx1.Set_Pulso_Largo;
begin
  if InControl
    then Elbrus.Tx1_Long_Pulse;
end;

function TTxRx1.FrecuenciaAD: Integer;
begin
  result := SnapShot^.Tx1_Sample_Rate;
end;

initialization
  TComObjectFactory.Create(ComServer, TTxRx1, Class_TxRx1,
    'TxRx1', '', ciMultiInstance, tmApartment);
end.
