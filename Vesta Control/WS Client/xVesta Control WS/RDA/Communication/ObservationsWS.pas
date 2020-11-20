// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/IObservationsWS
// Encoding : utf-8
// Version  : 1.0
// (4/12/2011 11:30:28 PM - 1.33.2.5)
// ************************************************************************ //

unit ObservationsWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  // ************************************************************************ //
  // Namespace : urn:ObservationsWSIntf-IObservationsWS
  // soapAction: urn:ObservationsWSIntf-IObservationsWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IObservationsWSbinding
  // service   : IObservationsWSservice
  // port      : IObservationsWSPort
  // URL       : http://localhost:9999/soap/IObservationsWS
  // ************************************************************************ //
  IObservationsWS = interface(IInvokable)
  ['{7EC4E564-CBC3-DE95-D4A1-01395292B708}']
    function  Get_Plantillas: Integer; stdcall;
    procedure Ejecutar(const Name: WideString); stdcall;
    function  Plantilla(const Index: Integer): TTemplateInfo; stdcall;
    function  Buscar(const Name: WideString): TTemplateInfo; stdcall;
    procedure ChequearRadar; stdcall;
    procedure Borrar(const Name: WideString); stdcall;
    function  Nueva: TTemplateInfo; stdcall;
    function  Control(const Name: WideString): TTemplateInfo; stdcall;
    function  Clonar(const TemplateName: WideString): TTemplateInfo; stdcall;
    procedure Save(const Template: TTemplateInfo); stdcall;
    procedure Automatica(const TemplateName: WideString; const Value: Boolean); stdcall;
    function  Get_InProgress: Boolean; stdcall;
    function  Get_Name: WideString; stdcall;
    function  Get_Client: WideString; stdcall;
    function  Get_StartTime: TXSDateTime; stdcall;
    function  Get_LastTime: TXSDateTime; stdcall;
    function  Get_Progress: Integer; stdcall;
    function  Get_Message: WideString; stdcall;
    function  Get_SubMsg: WideString; stdcall;
    function  Get_Result: Integer; stdcall;
    procedure Cancel; stdcall;

    property Plantillas: Integer read Get_Plantillas;

    property InProgress: boolean read Get_InProgress;
    property Name: WideString read Get_Name;
    property Client: WideString read Get_Client;
    property StartTime: TXSDateTime read Get_StartTime;
    property LastTime: TXSDateTime read Get_LastTime;
    property Progress: Integer read Get_Progress;
    property Message: WideString read Get_Message;
    property SubMsg: WideString read Get_SubMsg;
    property Result: Integer read Get_Result;
  end;

function GetIObservationsWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IObservationsWS;


implementation

function GetIObservationsWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IObservationsWS;
const
  defWSDL = 'http://localhost:9999/wsdl/IObservationsWS';
  defURL  = 'http://localhost:9999/soap/IObservationsWS';
  defSvc  = 'IObservationsWSservice';
  defPrt  = 'IObservationsWSPort';
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
    Result := (RIO as IObservationsWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IObservationsWS), 'urn:ObservationsWSIntf-IObservationsWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IObservationsWS), 'urn:ObservationsWSIntf-IObservationsWS#%operationName%');
end.
