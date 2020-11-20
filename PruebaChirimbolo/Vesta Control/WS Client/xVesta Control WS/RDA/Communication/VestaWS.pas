// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/IVestaWS
// Encoding : utf-8
// Version  : 1.0
// (4/20/2011 10:03:58 PM - 1.33.2.5)
// ************************************************************************ //

unit VestaWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type
  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:VestaWSIntf-IVestaWS
  // soapAction: urn:VestaWSIntf-IVestaWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IVestaWSbinding
  // service   : IVestaWSservice
  // port      : IVestaWSPort
  // URL       : http://localhost:9999/soap/IVestaWS
  // ************************************************************************ //
  IVestaWS = interface(IInvokable)
  ['{19DAED86-C4E6-C9E5-4206-2038C5715B51}']
    function  Get_Version: WideString; stdcall;
    function  Get_SystemDateTime: Double; stdcall;
    function  Get_SystemTimeZone: Double; stdcall;

    property Version: WideString read Get_Version;
    property SystemDateTime: Double read Get_SystemDateTime;
    property SystemTimeZone: Double read Get_SystemTimeZone;
  end;

function GetIVestaWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IVestaWS;


implementation

function GetIVestaWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IVestaWS;
const
  defWSDL = 'http://localhost:9999/wsdl/IVestaWS';
  defURL  = 'http://localhost:9999/soap/IVestaWS';
  defSvc  = 'IVestaWSservice';
  defPrt  = 'IVestaWSPort';
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
    Result := (RIO as IVestaWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IVestaWS), 'urn:VestaWSIntf-IVestaWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IVestaWS), 'urn:VestaWSIntf-IVestaWS#%operationName%');
end.
