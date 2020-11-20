// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:49000/wsdl/ITxRxWS
// Version  : 1.0
// (4/28/2011 10:30:01 PM - 1.33.2.5)
// ************************************************************************ //

unit TxRxWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type
  // ************************************************************************ //
  // Namespace : urn:TxRx-ITxRxWS
  // soapAction: urn:TxRx-ITxRxWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITxRxWSbinding
  // service   : ITxRxWSservice
  // port      : ITxRxWSPort
  // URL       : http://localhost:49000/soap/ITxRxWS
  // ************************************************************************ //
  ITxRxWS = interface(IInvokable)
  ['{97B0D470-4F2E-F810-2AFE-12C32BAB6D24}']
    procedure Set_Pulso_Largo; stdcall;
    procedure Set_Pulso_Corto; stdcall;
  end;

function GetITxRxWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITxRxWS;


implementation

function GetITxRxWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITxRxWS;
const
  defWSDL = 'http://localhost:49000/wsdl/ITxRxWS';
  defURL  = 'http://localhost:49000/soap/ITxRxWS';
  defSvc  = 'ITxRxWSservice';
  defPrt  = 'ITxRxWSPort';
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
    Result := (RIO as ITxRxWS);
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
  InvRegistry.RegisterInterface(TypeInfo(ITxRxWS), 'urn:TxRx-ITxRxWS', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITxRxWS), 'urn:TxRx-ITxRxWS#%operationName%');

end.