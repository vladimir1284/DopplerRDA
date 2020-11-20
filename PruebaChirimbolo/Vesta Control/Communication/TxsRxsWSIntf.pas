{ Invokable interface ITxsRxsWS }

unit TxsRxsWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  { Invokable interfaces must derive from IInvokable }
  ITxsRxsWS = interface(IInvokable)
  ['{4C869C9C-F2F9-4EE9-A7EC-F326EE561DCB}']
    // TxsRxs
    function Get_TxRxCount: Integer; safecall;
    property TxRxCount    : Integer read Get_TxRxCount;

    // ISynchro
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto; safecall;
    function  Get_Frecuencia: Integer; safecall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ITxsRxsWS));

end.
 