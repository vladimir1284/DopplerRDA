unit SynchroWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, SynchroWSIntf, CommunicationObj;

type
  TSynchroWS = class(TCommObj, ISynchroWS)
  public
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto; safecall;
    function  Get_Frecuencia: Integer; safecall;
    function  Get_Pulse: TxPulseEnum; safecall;
    function  Get_PRF_Rate: TxDualPulseEnum; safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses Users, Elbrus, Rda_TLB;

{ TSynchroWS }

function TSynchroWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Operator;
end;

function TSynchroWS.Get_Frecuencia: Integer;
begin
  Result := Snapshot.Trigger_Rate;
end;

function TSynchroWS.Get_PRF_Rate: TxDualPulseEnum;
begin
  Result := TxDualPulseEnum(Snapshot.PRF_Rate);
end;

function TSynchroWS.Get_Pulse: TxPulseEnum;
begin
  Result := TxPulseEnum(Snapshot.Pulse);
end;

procedure TSynchroWS.Set_Pulso_Corto;
begin
  if InControl
    then Elbrus.Short_Pulse(tx_Dual_None);
end;

procedure TSynchroWS.Set_Pulso_Largo;
begin
  if InControl
    then Elbrus.Long_Pulse;
end;

initialization
  InvRegistry.RegisterInvokableClass(TSynchroWS);

end.