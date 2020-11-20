unit RDAReg;

interface

uses
  Registry, Windows, Mutex;

const
  RDARootKey = {HKEY_LOCAL_MACHINE} '\SOFTWARE\LDT\Vesta\RDA';
  RegistryMutexName = 'Elbrus_Registry_Mutex';

type
  TRDAReg = class(TRegistry)
  private
  public
    constructor Create;
    destructor  Destroy;  override;
  end;

var
  RegistryMutex : TMutex  = nil;

implementation

uses
  SysUtils;

const
  MutexTime = 10000;

{ TRDAReg }

constructor TRDAReg.Create;
begin
  inherited Create;
  if RegistryMutex.WaitFor( MutexTime )
    then RootKey := HKEY_LOCAL_MACHINE
    else raise Exception.Create('Can not lock registry access');
  Access := KEY_READ or KEY_WRITE;
end;

destructor TRDAReg.Destroy;
begin
  if Assigned( RegistryMutex )
    then RegistryMutex.Release;
  inherited;
end;

initialization
  RegistryMutex := TMutex.Create(nil, false, RegistryMutexName);

finalization
  RegistryMutex.Free;

end.

