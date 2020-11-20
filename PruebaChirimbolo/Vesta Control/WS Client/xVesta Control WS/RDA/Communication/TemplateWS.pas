// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/ITemplateWS
// Encoding : utf-8
// Version  : 1.0
// (4/12/2011 12:20:16 PM - 1.33.2.5)
// ************************************************************************ //

unit TemplateWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  // ************************************************************************ //
  // Namespace : urn:TemplateWSIntf-ITemplateWS
  // soapAction: urn:TemplateWSIntf-ITemplateWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITemplateWSbinding
  // service   : ITemplateWSservice
  // port      : ITemplateWSPort
  // URL       : http://localhost:9999/soap/ITemplateWS
  // ************************************************************************ //
  ITemplateWS = interface(IInvokable)
  ['{9EEF803F-0CE5-2A65-D8B6-CE00161C2453}']
    function  LoadTemplate(const TemplateName: WideString): TTemplateInfo; stdcall;
    function  GetTemplateList: TStringDynArray; stdcall;
    function  TemplateExists(const TemplateName: WideString): Boolean; stdcall;
    procedure ModifyTemplate(const Template: TTemplateInfo); stdcall;
    procedure Eliminar(const TemplateName: WideString); stdcall;
    procedure Automatica(const TemplateName: WideString; const Value: Boolean); stdcall;
  end;

function GetITemplateWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITemplateWS;


implementation

function GetITemplateWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITemplateWS;
const
  defWSDL = 'http://localhost:9999/wsdl/ITemplateWS';
  defURL  = 'http://localhost:9999/soap/ITemplateWS';
  defSvc  = 'ITemplateWSservice';
  defPrt  = 'ITemplateWSPort';
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
    Result := (RIO as ITemplateWS);
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
  InvRegistry.RegisterInterface(TypeInfo(ITemplateWS), 'urn:TemplateWSIntf-ITemplateWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITemplateWS), 'urn:TemplateWSIntf-ITemplateWS#%operationName%');
end.
