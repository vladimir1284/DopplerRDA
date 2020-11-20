// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/ISynchroWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:42:49 AM - 1.33.2.5)
// ************************************************************************ //

unit ISynchroProxy;

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

  { "urn:CommunicationObj" }
  TxPulseEnum = (tx_Pulse_Long, tx_Pulse_Short, tx_Pulse_None, tx_Pulse_Dual);

  { "urn:CommunicationObj" }
  TxDualPulseEnum = (tx_Dual_54, tx_Dual_43, tx_Dual_32, tx_Dual_None);


  // ************************************************************************ //
  // Namespace : urn:SynchroWSIntf-ISynchroWS
  // soapAction: urn:SynchroWSIntf-ISynchroWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ISynchroWSbinding
  // service   : ISynchroWSservice
  // port      : ISynchroWSPort
  // URL       : http://localhost:8888/soap/ISynchroWS
  // ************************************************************************ //
  ISynchroWS = interface(IInvokable)
  ['{681154D4-6EE7-EC1E-7FAB-599B6ACAB81A}']
    procedure Set_Pulso_Largo; stdcall;
    procedure Set_Pulso_Corto; stdcall;
    function  Get_Frecuencia: Integer; stdcall;
    function  Get_Pulse: TxPulseEnum; stdcall;
    function  Get_PRF_Rate: TxDualPulseEnum; stdcall;
  end;

function GetISynchroWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ISynchroWS;


implementation

function GetISynchroWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ISynchroWS;
const
  defWSDL = 'http://localhost:8888/wsdl/ISynchroWS';
  defURL  = 'http://localhost:8888/soap/ISynchroWS';
  defSvc  = 'ISynchroWSservice';
  defPrt  = 'ISynchroWSPort';
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
    Result := (RIO as ISynchroWS);
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
  InvRegistry.RegisterInterface(TypeInfo(ISynchroWS), 'urn:SynchroWSIntf-ISynchroWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISynchroWS), 'urn:SynchroWSIntf-ISynchroWS#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TxPulseEnum), 'urn:CommunicationObj', 'TxPulseEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TxDualPulseEnum), 'urn:CommunicationObj', 'TxDualPulseEnum');

end.