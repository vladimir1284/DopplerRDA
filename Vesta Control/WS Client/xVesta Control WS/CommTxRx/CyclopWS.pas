// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:49000/wsdl/ICyclopWS
// Version  : 1.0
// (4/29/2011 12:18:38 AM - 1.33.2.5)
// ************************************************************************ //

unit CyclopWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  // ************************************************************************ //
  // Namespace : urn:CyclopWS-ICyclopWS
  // soapAction: urn:CyclopWS-ICyclopWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ICyclopWSbinding
  // service   : ICyclopWSservice
  // port      : ICyclopWSPort
  // URL       : http://localhost:49000/soap/ICyclopWS
  // ************************************************************************ //
  ICyclopWS = interface(IInvokable)
  ['{178EFFB8-C678-FD45-725D-7119D772FD59}']
    function  Login(const UserName: WideString; const Password: WideString): Boolean; stdcall;
    function  Logout: Boolean; stdcall;
  end;

function GetICyclopWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ICyclopWS;


implementation

function GetICyclopWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ICyclopWS;
const
  defWSDL = 'http://localhost:49000/wsdl/ICyclopWS';
  defURL  = 'http://localhost:49000/soap/ICyclopWS';
  defSvc  = 'ICyclopWSservice';
  defPrt  = 'ICyclopWSPort';
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
    Result := (RIO as ICyclopWS);
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
  InvRegistry.RegisterInterface(TypeInfo(ICyclopWS), 'urn:CyclopWS-ICyclopWS', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ICyclopWS), 'urn:CyclopWS-ICyclopWS#%operationName%');

  InvRegistry.RegisterHeaderClass(TypeInfo(ICyclopWS), TCyclopAuthHeader, 'TCyclopAuthHeader', 'urn:CommonObjs');
  RemClassRegistry.RegisterXSClass(TCyclopAuthHeader, 'urn:CommonObjs', 'TCyclopAuthHeader');
end.