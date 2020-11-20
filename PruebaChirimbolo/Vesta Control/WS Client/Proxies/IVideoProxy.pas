// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IVideoWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:42:14 AM - 1.33.2.5)
// ************************************************************************ //

unit IVideoProxy;

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
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:VideoWSIntf-IVideoWS
  // soapAction: urn:VideoWSIntf-IVideoWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IVideoWSbinding
  // service   : IVideoWSservice
  // port      : IVideoWSPort
  // URL       : http://localhost:8888/soap/IVideoWS
  // ************************************************************************ //
  IVideoWS = interface(IInvokable)
  ['{3405E054-C57D-8741-D676-83ECB6098A46}']
    function  Get_Frecuencia_AD: Integer; stdcall;
    procedure StartAcquiring(const ch1: Boolean; const ch2: Boolean); stdcall;
    procedure StartRT; stdcall;
  end;

function GetIVideoWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IVideoWS;


implementation

function GetIVideoWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IVideoWS;
const
  defWSDL = 'http://localhost:8888/wsdl/IVideoWS';
  defURL  = 'http://localhost:8888/soap/IVideoWS';
  defSvc  = 'IVideoWSservice';
  defPrt  = 'IVideoWSPort';
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
    Result := (RIO as IVideoWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IVideoWS), 'urn:VideoWSIntf-IVideoWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IVideoWS), 'urn:VideoWSIntf-IVideoWS#%operationName%');

end.