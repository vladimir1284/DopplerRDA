unit SynchroWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, SynchroWSIntf, CommunicationObj;

type
  TSynchroWS = class(TCommObj, ISynchroWS)
  public
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto; safecall;
    function  Get_Frecuencia: Integer; safecall;
    function  Get_Fuente: TSyncSourceEnum; safecall;
    procedure Set_Fuente(Value: TSyncSourceEnum); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses Users, Elbrus;

{ TSynchroWS }

function TSynchroWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Operator;
end;

function TSynchroWS.Get_Frecuencia: Integer;
begin
  Result := Snapshot.Trigger_Rate;
end;

function TSynchroWS.Get_Fuente: TSyncSourceEnum;
begin
  Result := TSyncSourceEnum(Snapshot.Trigger_Source);
end;

procedure TSynchroWS.Set_Fuente(Value: TSyncSourceEnum);
begin
  if InControl
    then Elbrus.Set_Fuente_N1(Ord(Value));
end;

procedure TSynchroWS.Set_Pulso_Corto;
begin
  if InControl
    then Elbrus.Pulso_Corto;
end;

procedure TSynchroWS.Set_Pulso_Largo;
begin
  if InControl
    then Elbrus.Pulso_Largo;
end;

initialization
  InvRegistry.RegisterInvokableClass(TSynchroWS);

end.
