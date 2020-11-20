{ Invokable interface ITxsRxs }

unit TxsRxsIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type

  { Invokable interfaces must derive from IInvokable }
  ITxsRxs = interface(IInvokable)
  ['{544B8508-B830-48F4-8E88-894FF0879C7A}']
    // TxsRxs
    function Get_TxRxCount: Integer; safecall;
    function Get_Pulso_Unico: boolean; safecall;
    function Get_Sincro_Unico: boolean; safecall;

    property TxRxCount    : Integer read Get_TxRxCount;
    property Pulso_Unico  : boolean read Get_Pulso_Unico;
    property Sincro_Unico : boolean read Get_Sincro_Unico;

    // ISynchro
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto; safecall;
    function  Get_Frecuencia: Integer; safecall;
    function  Get_Fuente: TSyncSourceEnum; safecall;
    procedure Set_Fuente(Value: TSyncSourceEnum); safecall;

    property Fuente: TSyncSourceEnum read Get_Fuente write Set_Fuente;

    // IPulse
    function Get_N1CH1: Integer; safecall;
    function Get_N2: Integer; safecall;
    function Get_N3: Integer; safecall;
    function Get_N4: Integer; safecall;
    function Get_N5: Integer; safecall;
    function Get_N6: Integer; safecall;
    function Get_N1CH2: Integer; safecall;
    function Get_TxRxPulso: TxPulseEnum; safecall;

    // IPulseControl
    procedure Set_N1CH1(value: Integer); safecall;
    procedure Set_N2(value: Integer); safecall;
    procedure Set_N3(value: Integer); safecall;
    procedure Set_N4(value: Integer); safecall;
    procedure Set_N5(value: Integer); safecall;
    procedure Set_N6(value: Integer); safecall;
    procedure Set_N1CH2(value: Integer); safecall;
    procedure Set_Frecuencia(value: Integer); safecall;

    property N1CH1: Integer read Get_N1CH1 write Set_N1CH1;
    property N2: Integer read Get_N2 write Set_N2;
    property N3: Integer read Get_N3 write Set_N3;
    property N4: Integer read Get_N4 write Set_N4;
    property N5: Integer read Get_N5 write Set_N5;
    property N6: Integer read Get_N6 write Set_N6;
    property N1CH2: Integer read Get_N1CH2 write Set_N1CH2;
    property TxRxPulso: TxPulseEnum read Get_TxRxPulso;
    property Frecuencia: Integer read Get_Frecuencia write Set_Frecuencia;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ITxsRxs));
end.
 