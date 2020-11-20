// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/ITxRxCh1WS
// Encoding : utf-8
// Version  : 1.0
// (4/19/2011 10:56:28 AM - 1.33.2.5)
// ************************************************************************ //

unit TxRxCh1WS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, TxRxChWS;

type
  // ************************************************************************ //
  // Namespace : urn:TxRxCh1WSIntf-ITxRxCh1WS
  // soapAction: urn:TxRxCh1WSIntf-ITxRxCh1WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITxRxCh1WSbinding
  // service   : ITxRxCh1WSservice
  // port      : ITxRxCh1WSPort
  // URL       : http://localhost:9999/soap/ITxRxCh1WS
  // ************************************************************************ //
  ITxRxCh1WS = interface(ITxRxChWS)
  ['{4CEDA6BD-6D98-EE7A-4EBF-F07F6854CEA0}']
  end;

function GetITxRxCh1WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITxRxCh1WS;


implementation

function GetITxRxCh1WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITxRxCh1WS;
const
  defWSDL = 'http://localhost:9999/wsdl/ITxRxCh1WS';
  defURL  = 'http://localhost:9999/soap/ITxRxCh1WS';
  defSvc  = 'ITxRxCh1WSservice';
  defPrt  = 'ITxRxCh1WSPort';
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
    Result := (RIO as ITxRxCh1WS);
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
  InvRegistry.RegisterInterface(TypeInfo(ITxRxCh1WS), 'urn:TxRxCh1WSIntf-ITxRxCh1WS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITxRxCh1WS), 'urn:TxRxCh1WSIntf-ITxRxCh1WS#%operationName%');
end.
