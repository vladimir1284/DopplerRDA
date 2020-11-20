// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IDRX_WS
// Version  : 1.0
// (5/6/2011 11:20:00 PM - 1.33.2.5)
// ************************************************************************ //

unit DRX_WS;

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
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:DRX_WS-IDRX_WS
  // soapAction: urn:DRX_WS-IDRX_WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IDRX_WSbinding
  // service   : IDRX_WSservice
  // port      : IDRX_WSPort
  // URL       : http://localhost:8888/soap/IDRX_WS
  // ************************************************************************ //
  IDRX_WS = interface(IInvokable)
  ['{03DAF513-0A65-453F-B522-A0CAB9709302}']
    function  Login(const UserName: WideString; const Password: WideString): Boolean; stdcall;
    function  Logout: Boolean; stdcall;
    function  Ping: Boolean; stdcall;
  end;

function GetIDRX_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IDRX_WS;


implementation

function GetIDRX_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IDRX_WS;
const
  defWSDL = 'http://localhost:8888/wsdl/IDRX_WS';
  defURL  = 'http://localhost:8888/soap/IDRX_WS';
  defSvc  = 'IDRX_WSservice';
  defPrt  = 'IDRX_WSPort';
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
    Result := (RIO as IDRX_WS);
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
  InvRegistry.RegisterInterface(TypeInfo(IDRX_WS), 'urn:DRX_WS-IDRX_WS', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IDRX_WS), 'urn:DRX_WS-IDRX_WS#%operationName%');

end.