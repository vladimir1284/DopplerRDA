unit TxRxCh1WSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, TxRxCh1WSIntf, TxRxWSIntf, CommunicationObj;

type
  TTxRxCh1WS = class(TCommObj, ITxRxCh1WS)
    // ISynchro
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto(PRF_Rate: TxDualPulseEnum); safecall;
    function  Get_Frecuencia: Integer; safecall;
    function  Get_Pulse: TxPulseEnum; safecall;
    function  Get_PRF_Rate: TxDualPulseEnum; safecall;

    // ITxStatus
    function Get_Tx_Status: RadarStatusEnum; safecall;
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

    // IRxStatus
    function Get_Fuente_5V_N: WordBool; safecall;
    function Get_Fuente_5V_P: WordBool; safecall;
    function Get_Fuente_15V_N: WordBool; safecall;
    function Get_Fuente_15V_P: WordBool; safecall;
    function Get_Stalo_Locked: WordBool; safecall;
    function Get_Rx_Status: RadarStatusEnum; safecall;
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
    // ITxRxStatus
    function  Get_Tx_Pulso: TxPulseEnum; safecall;
    function  Get_Numero: Integer; safecall;
    function  Get_Longitud_Onda: TWaveLengthEnum; safecall;

    // ITxControl
    procedure Tx_Encender; safecall;
    procedure Tx_Apagar; safecall;
    procedure Set_HV(Value: WordBool); safecall;
    // IRxControl
    procedure Rx_Encender; safecall;
    procedure Rx_Apagar; safecall;

    procedure Set_Stalo_Freq(Value: Int64); safecall;
    procedure Set_Stalo_Power(Value: Double); safecall;
    procedure Stalo_Reset; safecall;
    procedure Set_AFC_Status(Value: WordBool); safecall;
    procedure Set_Stalo_Output(Value: WordBool); safecall;
    procedure Stalo_Update; safecall;
    procedure Set_NCO_Frequency(Value: Int64); safecall;

    // ITxRxMeasure
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
    // ITxRxMeasureControl
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

    function CheckCredentials : boolean; override;
  end;

implementation

uses Elbrus, ElbrusTypes, Users, ManagerDRX, DRX_DataReceiver, DataSenderThread;

{ TTxRxCh1WS }

function TTxRxCh1WS.Get_Longitud_Onda: TWaveLengthEnum;
begin
  Result := wl_3cm;
end;

procedure TTxRxCh1WS.Rx_Apagar;
begin
  if InControl
    then Elbrus.Rx1_Apagar
end;

procedure TTxRxCh1WS.Rx_Encender;
begin
  if InControl
    then Elbrus.Rx1_Encender
end;

procedure TTxRxCh1WS.Tx_Apagar;
begin
  if InControl
    then Elbrus.Tx1_Apagar;
end;

procedure TTxRxCh1WS.Tx_Encender;
begin
  if InControl
    then Elbrus.Tx1_Encender;
end;

function TTxRxCh1WS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Operator;
end;

function TTxRxCh1WS.Get_Rango_Tx_Potencia: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_Potencia]);
end;

function TTxRxCh1WS.Get_Sector_Tx_Potencia: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_Potencia]);
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Potencia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_Potencia, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Potencia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_Potencia, TAIRange(value));
end;

function TTxRxCh1WS.Get_AFC_Status: WordBool;
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

function TTxRxCh1WS.Get_Averia_Fuente_Filamento: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_Averia_Fuente_Filamento = di_Tx1_Averia_Fuente_Filamento;
end;

function TTxRxCh1WS.Get_Local: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_TxRx1_Local = di_TxRx1_Local;
end;

function TTxRxCh1WS.Get_Averia_MPS: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_Averia_MPS = di_Tx1_Averia_MPS;
end;

function TTxRxCh1WS.Get_Averia_Ventilador: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_Averia_Ventilador = di_Tx1_Averia_Ventilador;
end;

function TTxRxCh1WS.Get_DRX_Ready: WordBool;
begin
  result := DRX1.Ready;
end;

function TTxRxCh1WS.Get_Encendido: WordBool;
begin
  Result := Snapshot^.Tx1_ON;
end;

function TTxRxCh1WS.Get_Fuente_100V_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_fuente_100V_P];
end;

function TTxRxCh1WS.Get_Fuente_100V_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_fuente_100V_P];
end;

function TTxRxCh1WS.Get_Fuente_15V_N: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Rx1_Fuente15V_N = di_Rx1_Fuente15V_N;
end;

function TTxRxCh1WS.Get_Fuente_15V_P: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Rx1_Fuente15V_P = di_Rx1_Fuente15V_P;
end;

function TTxRxCh1WS.Get_Fuente_24VN_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_fuente_24V_N];
end;

function TTxRxCh1WS.Get_Fuente_24VN_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_fuente_24V_N];
end;

function TTxRxCh1WS.Get_Fuente_24VP_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_fuente_24V_P];
end;

function TTxRxCh1WS.Get_Fuente_24VP_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_fuente_24V_P];
end;

function TTxRxCh1WS.Get_Fuente_400V_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_fuente_400V_P];
end;

function TTxRxCh1WS.Get_Fuente_400V_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_fuente_400V_P];
end;

function TTxRxCh1WS.Get_Fuente_50V_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_fuente_50V_P];
end;

function TTxRxCh1WS.Get_Fuente_50V_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_fuente_50V_P];
end;

function TTxRxCh1WS.Get_Fuente_5V_N: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Rx1_Fuente5V_N = di_Rx1_Fuente5V_N;
end;

function TTxRxCh1WS.Get_Fuente_5V_P: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Rx1_Fuente5V_P = di_Rx1_Fuente5V_P;
end;

function TTxRxCh1WS.Get_Fuente_Filamento_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_Fuente_Filamento];
end;

function TTxRxCh1WS.Get_Fuente_Filamento_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_Fuente_Filamento];
end;

function TTxRxCh1WS.Get_HV: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_HV = di_Tx1_HV;
end;

function TTxRxCh1WS.Get_Inter_Lock: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_Inter_Lock = di_Tx1_Inter_Lock;
end;

function TTxRxCh1WS.Get_Listo: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_Listo = di_Tx1_Listo;
end;

function TTxRxCh1WS.Get_MPS_Corr_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_MPS_Corriente];
end;

function TTxRxCh1WS.Get_MPS_Corr_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_MPS_Corriente];
end;

function TTxRxCh1WS.Get_MPS_Volt_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_MPS_Voltaje];
end;

function TTxRxCh1WS.Get_MPS_Volt_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_MPS_Voltaje];
end;

function TTxRxCh1WS.Get_NCO_Frequency: Int64;
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

function TTxRxCh1WS.Get_Potencia_Code: Integer;
begin
  Result := Snapshot^.Analog_Input[ai_Tx1_Potencia];
end;

function TTxRxCh1WS.Get_Potencia_Unit: Double;
begin
  Result := Snapshot^.Analog_Input_Voltage[ai_Tx1_Potencia];
end;

function TTxRxCh1WS.Get_Rango_Tx_Fuente_Filamento: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_Fuente_Filamento]);
end;

function TTxRxCh1WS.Get_Rango_Tx_Fuente100V: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_fuente_100V_P]);
end;

function TTxRxCh1WS.Get_Rango_Tx_Fuente24V_N: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_fuente_24V_N]);
end;

function TTxRxCh1WS.Get_Rango_Tx_Fuente24V_P: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_fuente_24V_P]);
end;

function TTxRxCh1WS.Get_Rango_Tx_Fuente400V: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_fuente_400V_P]);
end;

function TTxRxCh1WS.Get_Rango_Tx_Fuente50V: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_fuente_50V_P]);
end;

function TTxRxCh1WS.Get_Rango_Tx_MPS_Corr: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_MPS_Corriente]);
end;

function TTxRxCh1WS.Get_Rango_Tx_MPS_Volt: Integer;
begin
  Result := integer(Snapshot^.AI_Range[ai_Tx1_MPS_Voltaje]);
end;

function TTxRxCh1WS.Get_Rx_Status: RadarStatusEnum;
begin
  if Snapshot^.Rx1_ON
    then if Snapshot^.Rx1_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TTxRxCh1WS.Get_Sector_Tx_Fuente_Filamento: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_Fuente_Filamento]);
end;

function TTxRxCh1WS.Get_Sector_Tx_Fuente100V: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_fuente_100V_P]);
end;

function TTxRxCh1WS.Get_Sector_Tx_Fuente24V_N: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_fuente_24V_N]);
end;

function TTxRxCh1WS.Get_Sector_Tx_Fuente24V_P: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_fuente_24V_P]);
end;

function TTxRxCh1WS.Get_Sector_Tx_Fuente400V: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_fuente_400V_P]);
end;

function TTxRxCh1WS.Get_Sector_Tx_Fuente50V: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_fuente_50V_P]);
end;

function TTxRxCh1WS.Get_Sector_Tx_MPS_Corr: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_MPS_Corriente]);
end;

function TTxRxCh1WS.Get_Sector_Tx_MPS_Volt: Integer;
begin
  Result := integer(Snapshot^.AI_Sector[ai_Tx1_MPS_Voltaje]);
end;

function TTxRxCh1WS.Get_Stalo_Blanking: WordBool;
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

function TTxRxCh1WS.Get_Stalo_ExtRef: WordBool;
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

function TTxRxCh1WS.Get_Stalo_Frequency: Int64;
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

function TTxRxCh1WS.Get_Stalo_Locked: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Rx1_Stalo_Locked = di_Rx1_Stalo_Locked;
end;

function TTxRxCh1WS.Get_Stalo_LockRecovery: WordBool;
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

function TTxRxCh1WS.Get_Stalo_Power: Double;
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

function TTxRxCh1WS.Get_Stalo_Ref_Output: WordBool;
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

function TTxRxCh1WS.Get_Stalo_Ref_Unlocked: WordBool;
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

function TTxRxCh1WS.Get_Stalo_RF_Output: WordBool;
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

function TTxRxCh1WS.Get_Stalo_RF_Unlocked: WordBool;
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

function TTxRxCh1WS.Get_Stalo_Temperature: Double;
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

function TTxRxCh1WS.Get_Stalo_VoltageError: WordBool;
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

function TTxRxCh1WS.Get_Tx_Frequency: Int64;
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

function TTxRxCh1WS.Get_Tx_IF: Int64;
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

function TTxRxCh1WS.Get_Tx_PulsePower: Double;
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

function TTxRxCh1WS.Get_Tx_Status: RadarStatusEnum;
begin
  if Snapshot^.Tx1_ON
    then if Snapshot^.Tx1_Ok
           then result := rsOk
           else result := rsFailure
    else result := rsOff;
end;

function TTxRxCh1WS.Get_Ventilacion: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_Ventilacion_On = di_Tx1_Ventilacion_On;
end;

procedure TTxRxCh1WS.Set_AFC_Status(Value: WordBool);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_AFCChangesInhibited(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRxCh1WS.Set_HV(Value: WordBool);
begin
  if InControl
    then Tx1_Standby(Value);
end;

procedure TTxRxCh1WS.Set_NCO_Frequency(Value: Int64);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_NCOFrequency(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Fuente_Filamento(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_Fuente_Filamento, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Fuente100V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_100V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Fuente24V_N(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_24V_N, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Fuente24V_P(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_24V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Fuente400V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_400V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Fuente50V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_fuente_50V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_MPS_Corr(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_MPS_Corriente, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_MPS_Volt(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_MPS_Voltaje, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Fuente_Filamento(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_Fuente_Filamento, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Fuente100V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_100V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Fuente24V_N(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_24V_N, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Fuente24V_P(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_24V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Fuente400V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_400V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Fuente50V(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_fuente_50V_P, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_MPS_Corr(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_MPS_Corriente, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_MPS_Volt(Value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_MPS_Voltaje, TAIRange(Value));
end;

procedure TTxRxCh1WS.Set_Stalo_Freq(Value: Int64);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Frequency(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRxCh1WS.Set_Stalo_Output(Value: WordBool);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Output(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRxCh1WS.Set_Stalo_Power(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Power(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TTxRxCh1WS.Stalo_Reset;
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Stalo_Reset;
  except
    DRX1.Validate;
  end;
end;

procedure TTxRxCh1WS.Stalo_Update;
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Stalo_Update;
  except
    DRX1.Validate;
  end;
end;

procedure TTxRxCh1WS.StartAcquiring;
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

function TTxRxCh1WS.Get_Numero: Integer;
begin
  Result := 1;
end;

function TTxRxCh1WS.Get_Tx_Pulso: TxPulseEnum;
begin
  result := TxPulseEnum(Snapshot^.Tx1_Pulse);
end;

function TTxRxCh1WS.Get_Averia: WordBool;
begin
  Result := Snapshot^.Digital_Input and di_Tx1_Averia = di_Tx1_Averia;
end;

function TTxRxCh1WS.Get_Frecuencia: Integer;
begin
  Result := Snapshot^.Tx1_Trigger_Rate;
end;

function TTxRxCh1WS.Get_PRF_Rate: TxDualPulseEnum;
begin
  Result := TxDualPulseEnum(Snapshot^.Tx1_PRF_Rate);
end;

function TTxRxCh1WS.Get_Pulse: TxPulseEnum;
begin
  Result := TxPulseEnum(Snapshot^.Tx1_Pulse);
end;

procedure TTxRxCh1WS.Set_Pulso_Corto(PRF_Rate: TxDualPulseEnum);
begin
  if InControl
    then Elbrus.Tx1_Short_Pulse(Ord(PRF_Rate));
end;

procedure TTxRxCh1WS.Set_Pulso_Largo;
begin
  if InControl
    then Elbrus.Tx1_Long_Pulse;
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TTxRxCh1WS);

end.
