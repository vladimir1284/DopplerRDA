// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/ITxsRxsWS
// Encoding : utf-8
// Version  : 1.0
// (4/19/2011 10:04:44 PM - 1.33.2.5)
// ************************************************************************ //

unit TxsRxsWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  // ************************************************************************ //
  // Namespace : urn:TxsRxsWSIntf-ITxsRxsWS
  // soapAction: urn:TxsRxsWSIntf-ITxsRxsWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITxsRxsWSbinding
  // service   : ITxsRxsWSservice
  // port      : ITxsRxsWSPort
  // URL       : http://localhost:9999/soap/ITxsRxsWS
  // ************************************************************************ //
  ITxsRxsWS = interface(IInvokable)
  ['{BA1F7A01-C8C3-A3B1-7C69-2ACDB48C169C}']
    // TxsRxs
    function  Get_TxRxCount: Integer; stdcall;
    function  Get_Pulso_Unico: Boolean; stdcall;
    function  Get_Sincro_Unico: Boolean; stdcall;

    property TxRxCount    : Integer read Get_TxRxCount;
    property Pulso_Unico  : boolean read Get_Pulso_Unico;
    property Sincro_Unico : boolean read Get_Sincro_Unico;

    // ISynchro
    procedure Set_Pulso_Largo; stdcall;
    procedure Set_Pulso_Corto; stdcall;
    function  Get_Frecuencia: Integer; stdcall;
    function  Get_Fuente: TSyncSourceEnum; stdcall;
    procedure Set_Fuente(const Value: TSyncSourceEnum); stdcall;

    property Fuente: TSyncSourceEnum read Get_Fuente write Set_Fuente;

    // IPulse
    function  Get_N1CH1: Integer; stdcall;
    function  Get_N2: Integer; stdcall;
    function  Get_N3: Integer; stdcall;
    function  Get_N4: Integer; stdcall;
    function  Get_N5: Integer; stdcall;
    function  Get_N6: Integer; stdcall;
    function  Get_N1CH2: Integer; stdcall;
    function  Get_TxRxPulso: TxPulseEnum; stdcall;
    // IPulseControl
    procedure Set_N1CH1(const value: Integer); stdcall;
    procedure Set_N2(const value: Integer); stdcall;
    procedure Set_N3(const value: Integer); stdcall;
    procedure Set_N4(const value: Integer); stdcall;
    procedure Set_N5(const value: Integer); stdcall;
    procedure Set_N6(const value: Integer); stdcall;
    procedure Set_N1CH2(const value: Integer); stdcall;
    procedure Set_Frecuencia(const value: Integer); stdcall;

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

function GetITxsRxsWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITxsRxsWS;


implementation

function GetITxsRxsWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITxsRxsWS;
const
  defWSDL = 'http://localhost:9999/wsdl/ITxsRxsWS';
  defURL  = 'http://localhost:9999/soap/ITxsRxsWS';
  defSvc  = 'ITxsRxsWSservice';
  defPrt  = 'ITxsRxsWSPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ITxsRxsWS);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ITxsRxsWS), 'urn:TxsRxsWSIntf-ITxsRxsWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITxsRxsWS), 'urn:TxsRxsWSIntf-ITxsRxsWS#%operationName%');
end.
