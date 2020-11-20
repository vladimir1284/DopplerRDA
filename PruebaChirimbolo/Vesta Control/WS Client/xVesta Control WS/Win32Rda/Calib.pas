unit Calib;

interface

uses
  ActiveX;

type
  CalibrationTable = PSafeArray;  // safearray of word

type
  TCalib = class
  public
    constructor Create;
    destructor  Destroy;  override;
    procedure   Update;
  private
    fCalibration : array[0..1] of CalibrationTable;
    fPotencia    : array[0..1] of integer;
    fCRadar      : array[0..3] of single;
    function  GetCalibration( Index : integer ) : CalibrationTable;
    procedure SetCalibration( Index : integer; Value : CalibrationTable );
    procedure SetPotencia   ( Index : integer; Value : integer );
    procedure SetCRadar     ( Index : integer; Value : single );
    function  GetPotMetPL1 : single;
    function  GetPotMetPL2 : single;
    function  GetPotMetPC1 : single;
    function  GetPotMetPC2 : single;
  public
    property Calibration1 : CalibrationTable index 0 read GetCalibration write SetCalibration;
    property Calibration2 : CalibrationTable index 1 read GetCalibration write SetCalibration;
    property Potencia1    : integer          index 0 read fPotencia[0]   write SetPotencia;
    property Potencia2    : integer          index 1 read fPotencia[1]   write SetPotencia;
    property CRadarPL1    : single           index 0 read fCRadar  [0]   write SetCRadar;
    property CRadarPL2    : single           index 1 read fCRadar  [1]   write SetCRadar;
    property CRadarPC1    : single           index 2 read fCRadar  [2]   write SetCRadar;
    property CRadarPC2    : single           index 3 read fCRadar  [3]   write SetCRadar;
    property PotMetPL1    : single                   read GetPotMetPL1;
    property PotMetPL2    : single                   read GetPotMetPL2;
    property PotMetPC1    : single                   read GetPotMetPC1;
    property PotMetPC2    : single                   read GetPotMetPC2;
  private
    procedure LoadCalib;
    procedure SaveCalib;
    function  PotMet( Pt, Po, C : single ) : single;
  end;

var
  theCalibration : TCalib = nil;

implementation

uses
  Mutex,
  Math,
  Registry,
  RDAReg;

const
  CalibrationMutexName = 'Elbrus_Calibration_Mutex';

var
  CalibrationMutex : TMutex  = nil;

const
  MutexTime = 1000;

const
  CalibKey   = RDARootKey + '\Calibration\';
  Ch1Key     = 'Channel1';
  Ch2Key     = 'Channel2';
  P0Value    = 'Sensibility';
  DRValue    = 'DynamicRange';
  CodeValue  = 'Codes';
  StartValue = 'Start';
  CountValue = 'Count';
  P1Value    = 'Potencia1';
  P2Value    = 'Potencia2';
  CR1PLValue = 'CRadarPL1';
  CR2PLValue = 'CRadarPL2';
  CR1PCValue = 'CRadarPC1';
  CR2PCValue = 'CRadarPC2';

// Private procedures & functions

function LoadCalibrationTable( Reg : TRegistry; Key : string ) : CalibrationTable;
var
  SAB : TSafeArrayBound;
begin
  Result := nil;
  if assigned(Reg) and Reg.OpenKey(Key, false)
    then
      with Reg do
        begin
          if ValueExists(P0Value) and
             ValueExists(DRValue) and
             ValueExists(CodeValue)
            then
              begin
                SAB.lLbound   := ReadInteger(P0Value);
                SAB.cElements := ReadInteger(DRValue);
                Result := SafeArrayCreate(VT_UI2, 1, SAB);
                SafeArrayLock(Result);
                with Result^ do
                  ReadBinaryData(CodeValue, pvData^, rgsabound[0].cElements * cbElements);
              end;
          CloseKey;
        end;
end;

procedure SaveCalibrationTable( Reg: TRegistry; Key : string; Table : CalibrationTable );
begin
  if assigned(Reg)
    then
      with Reg do
        if assigned(Table)
          then
            begin
              if OpenKey(Key, true)
                then
                  begin
                    with Table^ do
                      begin
                        WriteInteger(P0Value, rgsabound[0].lLbound);
                        WriteInteger(DRValue, rgsabound[0].cElements);
                        WriteBinaryData(CodeValue, pvData^, rgsabound[0].cElements * cbElements);
                      end;
                    CloseKey;
                  end;
            end
          else DeleteKey(Key);
end;

{ TCalib }

constructor TCalib.Create;
begin
  inherited Create;
  CalibrationMutex := TMutex.Create(nil, false, CalibrationMutexName);
  Update;
end;

destructor TCalib.Destroy;
begin
  SaveCalib;
  CalibrationMutex.Free;
  inherited;
end;

procedure TCalib.Update;
begin
  if CalibrationMutex.WaitFor(MutexTime)
    then
      try
        LoadCalib;
      finally
        CalibrationMutex.Release;
      end;
end;

function TCalib.GetCalibration(Index: integer): CalibrationTable;
begin
  if assigned(fCalibration[Index])
    then SafeArrayCopy(fCalibration[Index], Result)
    else Result := nil;
end;

function TCalib.GetPotMetPC1: single;
begin
  if assigned(Calibration1)
    then Result := PotMet(Potencia1, Calibration1.rgsabound[0].lLbound, CRadarPC1)
    else Result := 0;
end;

function TCalib.GetPotMetPC2: single;
begin
  if assigned(Calibration2)
    then Result := PotMet(Potencia2, Calibration2.rgsabound[0].lLbound, CRadarPC2)
    else Result := 0;
end;

function TCalib.GetPotMetPL1: single;
begin
  if assigned(Calibration1)
    then Result := PotMet(Potencia1, Calibration1.rgsabound[0].lLbound, CRadarPL1)
    else Result := 0;
end;

function TCalib.GetPotMetPL2: single;
begin
  if assigned(Calibration2)
    then Result := PotMet(Potencia2, Calibration2.rgsabound[0].lLbound, CRadarPL2)
    else Result := 0;
end;

procedure TCalib.LoadCalib;
var
  Reg : TRegistry;
begin
  Reg := TRDAReg.Create;
  try
    if Reg.OpenKey(CalibKey, true)
      then
        with Reg do
          begin
            if ValueExists(P1Value)
              then fPotencia[0] := ReadInteger(P1Value);
            if ValueExists(P2Value)
              then fPotencia[1] := ReadInteger(P2Value);
            if ValueExists(CR1PLValue)
              then fCRadar[0] := ReadFloat(CR1PLValue);
            if ValueExists(CR2PLValue)
              then fCRadar[1] := ReadFloat(CR2PLValue);
            if ValueExists(CR1PCValue)
              then fCRadar[2] := ReadFloat(CR1PCValue);
            if ValueExists(CR2PCValue)
              then fCRadar[3] := ReadFloat(CR2PCValue);
            CloseKey;
          end;
    fCalibration[0] := LoadCalibrationTable(Reg, CalibKey + Ch1Key);
    fCalibration[1] := LoadCalibrationTable(Reg, CalibKey + Ch2Key);
  finally
    Reg.Free;
  end;
end;

function TCalib.PotMet( Pt, Po, C : single ) : single;
begin
  Result := 240.0 - C - (10 * log10(1000 * Pt)) + Po;
end;

procedure TCalib.SaveCalib;
var
  Reg : TRegistry;
begin
  Reg := TRDAReg.Create;
  try
    if Reg.OpenKey(CalibKey, true)
      then
        with Reg do
          begin
            WriteInteger(P1Value, fPotencia[0]);
            WriteInteger(P2Value, fPotencia[1]);
            WriteFloat  (CR1PLValue, fCRadar[0]);
            WriteFloat  (CR2PLValue, fCRadar[1]);
            WriteFloat  (CR1PCValue, fCRadar[2]);
            WriteFloat  (CR2PCValue, fCRadar[3]);
            CloseKey;
          end;
    SaveCalibrationTable(Reg, CalibKey + Ch1Key, Calibration1);
    SaveCalibrationTable(Reg, CalibKey + Ch2Key, Calibration2);
  finally
    Reg.Free;
  end;
end;

procedure TCalib.SetCalibration(Index: integer; Value: CalibrationTable);
begin
  if CalibrationMutex.WaitFor(MutexTime)
    then
      try
        if assigned(fCalibration[Index])
          then
            begin
              SafeArrayUnlock(fCalibration[Index]);
              SafeArrayDestroy(fCalibration[Index]);
            end;
        if assigned(Value)
          then
            begin
              SafeArrayCopy(Value, fCalibration[Index]);
              SafeArrayLock(fCalibration[Index]);
            end
          else fCalibration[Index] := nil;
        SaveCalib;
      finally
        CalibrationMutex.Release;
      end;
end;

procedure TCalib.SetCRadar(Index: integer; Value: single);
begin
  if CalibrationMutex.WaitFor(MutexTime)
    then
      try
        fCRadar[Index] := Value;
        SaveCalib;
      finally
        CalibrationMutex.Release;
      end;
end;

procedure TCalib.SetPotencia(Index, Value: integer);
begin
  if CalibrationMutex.WaitFor(MutexTime)
    then
      try
        fPotencia[Index] := Value;
        SaveCalib;
      finally
        CalibrationMutex.Release;
      end;
end;

end.

