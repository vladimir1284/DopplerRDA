{ Invokable interface ISynchroWS }

unit SynchroWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  ISynchroWS = interface(IInvokable)
  ['{C05DD55B-1CDC-4A72-9055-5FA92CBE0459}']
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto; safecall;
    function  Get_Frecuencia: Integer; safecall;
    function  Get_Fuente: TSyncSourceEnum; safecall;
    procedure Set_Fuente(Value: TSyncSourceEnum); safecall;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(ISynchroWS));

end.
 