unit RDAReg;

interface

uses
  Registry;

const
  RDARootKey = {HKEY_LOCAL_MACHINE} '\SOFTWARE\LDT\Vesta\RDA';

type
  TRDAReg = class(TRegistry)
  public
    constructor Create;
    destructor  Destroy;  override;
  end;

implementation

uses
  Windows,
  SysUtils,
  Mutex;

const
  RegistryMutexName = 'Elbrus_Registry_Mutex';

var
  RegistryMutex : TMutex  = nil;

const
  MutexTime = 3000;

{ TRDAReg }

constructor TRDAReg.Create;
begin
  inherited Create;
  if RegistryMutex.WaitFor(MutexTime)
    then RootKey := HKEY_LOCAL_MACHINE
    else raise Exception.Create('Can not lock registry access');
  Access := KEY_READ or KEY_WRITE;
end;

destructor TRDAReg.Destroy;
begin
  RegistryMutex.Release;
  inherited;
end;

initialization
  RegistryMutex := TMutex.Create(nil, false, RegistryMutexName);
finalization
  RegistryMutex.Free;
end.

