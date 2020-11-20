unit AntennaSimulation;

interface

uses
  SysUtils;

type
  TAntennaManager =
    class
      private
        fAzimutPosition : integer;
        fELevationPosition : integer;
        fAzimutSpeed : integer;
        fELevationSpeed : integer;
        fAzTimeMark, fElTimeMark : cardinal;
        fAzSinc, fElSinc : THandle;
      private
        procedure SetAzSpeed(Value : integer);
        procedure SetElSpeed(Value : integer);
        function  GetAzimutPosition: integer;
        function  GetElevationPosition: integer;
      public
        property AzimutPosition : integer read GetAzimutPosition write fAzimutPosition;
        property ElevationPosition : integer read GetElevationPosition write fElevationPosition;
        property AzimutSpeed : integer read fAzimutSpeed write SetAzSpeed;
        property ElevationSpeed : integer read fELevationSpeed write SetElSpeed;

        constructor Create;
        destructor  Destroy; override;
    end;

implementation

uses
  Windows;

{ TAntennaManager }

constructor TAntennaManager.Create;
begin
  fAzimutPosition := 0;
  fELevationPosition := 0;
  fAzimutSpeed := 0;
  fELevationSpeed := 0;
  fAzTimeMark := GetTickCount;
  fElTimeMark := GetTickCount;
  fAzSinc := CreateMutex(nil, false, '');
  fElSinc := CreateMutex(nil, false, '');
end;

destructor TAntennaManager.Destroy;
begin
  CloseHandle( fAzSinc );
  CloseHandle( fElSinc );
  inherited;
end;

function TAntennaManager.GetAzimutPosition: integer;
var
  CurrentTime : cardinal;
begin
  result := 0;
  if WaitForSingleObject(fAzSinc, 1000) = WAIT_OBJECT_0
    then
      try
        CurrentTime := GetTickCount;
        if fAzimutSpeed <> 0
          then
            begin
              Result := (fAzimutPosition + (fAzimutSpeed * Abs(CurrentTime - fAzTimeMark) div 1000)) mod 4096;
              if Result < 0 then Inc(Result, 4096);
            end
          else Result := fAzimutPosition;

        fAzTimeMark := CurrentTime;
        fAzimutPosition := Result;
      finally
        ReleaseMutex( fAzSinc );
      end;
end;

function TAntennaManager.GetElevationPosition: integer;
var
  CurrentTime : cardinal;
begin
  result := 0;
  if WaitForSingleObject(fElSinc, 1000) = WAIT_OBJECT_0
    then
      try
        CurrentTime := GetTickCount;
        if fElevationSpeed <> 0
          then
            begin
              Result := (fElevationPosition + (fElevationSpeed * Abs(CurrentTime - fElTimeMark) div 1000)) mod 4096;
              if Result < 0 then Inc(Result, 4096)
            end
          else Result := fElevationPosition;

        fElTimeMark := CurrentTime;
        fElevationPosition := Result;
      finally
        ReleaseMutex( fElSinc );
      end;
end;

procedure TAntennaManager.SetAzSpeed(Value: integer);
begin
  if WaitForSingleObject(fAzSinc, 1000) = WAIT_OBJECT_0
    then
      try
        fAzimutSpeed := Value;
      finally
        ReleaseMutex( fAzSinc );
      end;
end;

procedure TAntennaManager.SetElSpeed(Value: integer);
begin
  if WaitForSingleObject(fElSinc, 1000) = WAIT_OBJECT_0
    then
      try
        fElevationSpeed := Value;
      finally
        ReleaseMutex( fElSinc );
      end;
end;

end.
