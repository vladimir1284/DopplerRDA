unit CalibrationCH2WSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, CalibrationCH2WSIntf, CommunicationObj;

type

  { TCalibrationCH2WS }
  TCalibrationCH2WS = class(TCommObj, ICalibrationCH2WS)
  public
  // ICalibration
    function  Get_Codigos: TCalibrationTable; safecall;
    function  Get_Potencia: Integer;   safecall;
    function  Get_CRadarPL: Single;    safecall;
    function  Get_CRadarPC: Single;    safecall;
    function  Get_PotMetPL: Single;    safecall;
    function  Get_PotMetPC: Single;    safecall;
  // ICalibrationControl
    procedure Set_Codigos(Value: TCalibrationTable); safecall;
    procedure Set_Potencia(Value: Integer); safecall;
    procedure Set_CRadarPL(Value: Single); safecall;
    procedure Set_CRadarPC(Value: Single); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses
  Users, Calib, ActiveX, ElbrusTypes;

{ TCalibrationCH2WS }

function TCalibrationCH2WS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Service;
end;

function TCalibrationCH2WS.Get_Codigos: TCalibrationTable;
var
  CalibrationTable : PSafeArray;
  i : integer;
begin
  result := nil;
  CalibrationTable := theCalibration.Calibration2;
  if assigned(CalibrationTable)
    then
      begin
        result := TCalibrationTable.Init(CalibrationTable.rgsabound[0].cElements, CalibrationTable.rgsabound[0].lLbound);
        for i := Low(result.Data) to High(result.Data) do
          result.Data[i] := PWords(CalibrationTable.pvData)[i];
      end;
end;

function TCalibrationCH2WS.Get_CRadarPC: Single;
begin
  Result := theCalibration.CRadarPC2;
end;

function TCalibrationCH2WS.Get_CRadarPL: Single;
begin
  Result := theCalibration.CRadarPL2;
end;

function TCalibrationCH2WS.Get_Potencia: Integer;
begin
  Result := theCalibration.Potencia2;
end;

function TCalibrationCH2WS.Get_PotMetPC: Single;
begin
  Result := theCalibration.PotMetPC2;
end;

function TCalibrationCH2WS.Get_PotMetPL: Single;
begin
  Result := theCalibration.PotMetPC2;
end;

procedure TCalibrationCH2WS.Set_Codigos(Value: TCalibrationTable);
var
  SAB : TSafeArrayBound;
  CalibrationTable : PSafeArray;
  i : integer;
begin
  SAB.cElements := Value.Range;
  SAB.lLbound   := Value.Sensibility;
  CalibrationTable := SafeArrayCreate(VT_UI2, 1, SAB);
  for i := 0 to SAB.cElements - 1 do
    PWords(CalibrationTable.pvData)[I] := Value.Data[I];

  theCalibration.Calibration2 := CalibrationTable;
end;

procedure TCalibrationCH2WS.Set_CRadarPC(Value: Single);
begin
  if CheckCredentials
    then theCalibration.CRadarPC2 := Value;
end;

procedure TCalibrationCH2WS.Set_CRadarPL(Value: Single);
begin
  if CheckCredentials
    then theCalibration.CRadarPL2 := Value;
end;

procedure TCalibrationCH2WS.Set_Potencia(Value: Integer);
begin
  if CheckCredentials
    then theCalibration.Potencia2 := Value;
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TCalibrationCH2WS);

end.
 