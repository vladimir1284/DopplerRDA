// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/ILogWS
// Encoding : utf-8
// Version  : 1.0
// (4/20/2011 12:49:16 PM - 1.33.2.5)
// ************************************************************************ //

unit LogWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  // ************************************************************************ //
  // Namespace : urn:LogWSIntf-ILogWS
  // soapAction: urn:LogWSIntf-ILogWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ILogWSbinding
  // service   : ILogWSservice
  // port      : ILogWSPort
  // URL       : http://localhost:9999/soap/ILogWS
  // ************************************************************************ //
  ILogWS = interface(IInvokable)
  ['{42593513-52ED-91CB-7A96-6A959CD2D821}']
    function  Get_MaxLogEntries: Integer; stdcall;
    function  LogMessageTitles: TWideStringDynArray; stdcall;
    function  LogMessage(const MsgCode: Integer): TLogEntry; stdcall;
  end;

function GetILogWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ILogWS;


implementation

function GetILogWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ILogWS;
const
  defWSDL = 'http://localhost:9999/wsdl/ILogWS';
  defURL  = 'http://localhost:9999/soap/ILogWS';
  defSvc  = 'ILogWSservice';
  defPrt  = 'ILogWSPort';
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
    Result := (RIO as ILogWS);
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
  InvRegistry.RegisterInterface(TypeInfo(ILogWS), 'urn:LogWSIntf-ILogWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ILogWS), 'urn:LogWSIntf-ILogWS#%operationName%');
end.
