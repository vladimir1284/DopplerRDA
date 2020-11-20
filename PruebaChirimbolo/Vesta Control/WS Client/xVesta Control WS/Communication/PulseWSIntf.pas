{ Invokable interface IPulseWS }

unit PulseWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, Advantech, CommunicationObj;

type
  IPulseWS = interface(IInvokable)
  ['{5E79B470-2680-410A-96CC-685BAF238D95}']
  // IPulse
    function  Get_N1CH1: Integer; safecall;
    function  Get_N2: Integer; safecall;
    function  Get_N3: Integer; safecall;
    function  Get_N4: Integer; safecall;
    function  Get_N5: Integer; safecall;
    function  Get_N6: Integer; safecall;
    function  Get_N1CH2: Integer; safecall;
    function  Get_Frecuencia: Integer; safecall;
    function  Get_TxRxPulso: TxPulseEnum; safecall;
  // IPulseControl
    procedure Set_N1CH1(Value: Integer); safecall;
    procedure Set_N2(Value: Integer); safecall;
    procedure Set_N3(Value: Integer); safecall;
    procedure Set_N4(Value: Integer); safecall;
    procedure Set_N5(Value: Integer); safecall;
    procedure Set_N6(Value: Integer); safecall;
    procedure Set_N1CH2(Value: Integer); safecall;
    procedure Set_Frecuencia(Value: Integer); safecall;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(IPulseWS));

end.
 