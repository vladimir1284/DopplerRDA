{ Invokable implementation File for TCalibrationWS which implements ICalibrationWS }

unit CalibrationCH1WSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, CalibrationCH1WSIntf, ActiveX, CommunicationObj, Constants;

type

  { TCalibrationWS }
  TCalibrationCH1WS = class(TCommObj, ICalibrationCH1WS)
  public
  // ICalibration
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
    function Get_Loop_Gain: Double; safecall;
  // ICalibrationControl
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
    procedure Set_Loop_Gain(Value: Double); safecall;
    procedure SaveDRX; safecall;    

    function CheckCredentials : boolean; override;
  end;

implementation

uses
  Users, Calib, ElbrusTypes, ManagerDRX;

{ TCalibrationCH1WS }

function TCalibrationCH1WS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Service;
end;

function TCalibrationCH1WS.Get_CRadarPC: Single;
begin
  Result := theCalibration.CRadarPC1;
end;

function TCalibrationCH1WS.Get_CRadarPL: Single;
begin
  Result := theCalibration.CRadarPL1;
end;

function TCalibrationCH1WS.Get_Final_Sample_LP: Integer;
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

function TCalibrationCH1WS.Get_Final_Sample_SP: Integer;
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

function TCalibrationCH1WS.Get_Loop_Gain: Double;
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

function TCalibrationCH1WS.Get_MPS_Voltage: Double;
begin
  Result := theCalibration.MPS_Voltage1;
end;

function TCalibrationCH1WS.Get_Potencia: Integer;
begin
  Result := theCalibration.Potencia1;
end;

function TCalibrationCH1WS.Get_PotMetPC: Single;
begin
  Result := theCalibration.PotMetPC1;
end;

function TCalibrationCH1WS.Get_PotMetPL: Single;
begin
  Result := theCalibration.PotMetPC1;
end;

function TCalibrationCH1WS.Get_Stalo_Delay: Integer;
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

function TCalibrationCH1WS.Get_Stalo_Step: Integer;
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

function TCalibrationCH1WS.Get_Stalo_Width: Integer;
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

function TCalibrationCH1WS.Get_Start_Sample_LP: Integer;
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

function TCalibrationCH1WS.Get_Start_Sample_SP: Integer;
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

function TCalibrationCH1WS.Get_Tx_Factor: Double;
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

function TCalibrationCH1WS.Get_Tx_Pulse_LP: Integer;
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

function TCalibrationCH1WS.Get_Tx_Pulse_SP: Integer;
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

function TCalibrationCH1WS.Get_Valid_tx_power: Double;
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

procedure TCalibrationCH1WS.SaveDRX;
begin
  if InControl and DRX1.Ready
    then DRX1.AFC_WS.Save_Calibration;
end;

procedure TCalibrationCH1WS.Set_CRadarPC(Value: Single);
begin
  if InControl
    then theCalibration.CRadarPC1 := Value;
end;

procedure TCalibrationCH1WS.Set_CRadarPL(Value: Single);
begin
  if InControl
    then theCalibration.CRadarPL1 := Value;
end;

procedure TCalibrationCH1WS.Set_Final_Sample_LP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Final_Sample_LP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Final_Sample_SP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Final_Sample_SP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Loop_Gain(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Loop_Gain(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_MPS_Voltage(Value: Double);
begin
  if InControl
    then theCalibration.MPS_Voltage1 := Value;
end;

procedure TCalibrationCH1WS.Set_Potencia(Value: Integer);
begin
  if InControl
    then theCalibration.Potencia1 := Value;
end;

procedure TCalibrationCH1WS.Set_Stalo_Delay(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Delay(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Stalo_Step(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Step(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Stalo_Width(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Stalo_Width(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Start_Sample_LP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Start_Sample_LP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Start_Sample_SP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Start_Sample_SP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Tx_Factor(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Tx_Factor(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Tx_Pulse_LP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Tx_Pulse_LP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Tx_Pulse_SP(Value: Integer);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Tx_Pulse_SP(Value);
  except
    DRX1.Validate;
  end;
end;

procedure TCalibrationCH1WS.Set_Valid_tx_power(Value: Double);
begin
  try
    if InControl and DRX1.Ready
      then DRX1.AFC_WS.Set_Valid_tx_power(Value);
  except
    DRX1.Validate;
  end;
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TCalibrationCH1WS);

end.
