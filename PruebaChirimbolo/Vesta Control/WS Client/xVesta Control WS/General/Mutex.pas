unit Mutex;

interface

uses
  Windows;

type
  TMutex = class
  public
    constructor Create( Attributes   : PSecurityAttributes;
                        InitialOwner : boolean;
                        const Name   : string );
    destructor  Destroy;  override;
  public
    function  WaitFor( Timeout : dword ) : boolean;  virtual;
    procedure Acquire;  virtual;
    procedure Release;  virtual;
  private
    fHandle : integer;
  end;

implementation

uses SysUtils;

{ TMutex }

constructor TMutex.Create(Attributes: PSecurityAttributes; InitialOwner: boolean; const Name: string);
begin
  inherited Create;
  fHandle := CreateMutex(Attributes, InitialOwner, pchar(Name));
  if fHandle = 0
    then raise Exception.Create( 'No puedo crear el mutex ' + Name );
  Assert(fHandle <> 0);
end;

destructor TMutex.Destroy;
begin
  Assert(fHandle <> 0);
  if fHandle <> 0
    then CloseHandle(fHandle);
  inherited Destroy;
end;

procedure TMutex.Acquire;
begin
  if not WaitFor( 10000 )
    then raise Exception.Create( 'Mutex Timeout' );
end;

procedure TMutex.Release;
begin
  ReleaseMutex(fHandle);
end;

function TMutex.WaitFor( Timeout : dword ) : boolean;
begin
  Result := WaitForSingleObject(fHandle, Timeout) = WAIT_OBJECT_0;
end;

end.



