// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IRadarWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:45:27 AM - 1.33.2.5)
// ************************************************************************ //

unit IRadarProxy;

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
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"

  { "urn:CommunicationObj" }
  RadarStatusEnum = (rsOff, rsFailure, rsOk);


  // ************************************************************************ //
  // Namespace : urn:RadarWSIntf-IRadarWS
  // soapAction: urn:RadarWSIntf-IRadarWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IRadarWSbinding
  // service   : IRadarWSservice
  // port      : IRadarWSPort
  // URL       : http://localhost:8888/soap/IRadarWS
  // ************************************************************************ //
  IRadarWS = interface(IInvokable)
  ['{1211759B-C0DE-EA2C-4A69-19D507222EEC}']
    function  Get_Red_Listo: Boolean; stdcall;
    function  Get_Radar_On: Boolean; stdcall;
    function  Get_Tx1Status: RadarStatusEnum; stdcall;
    function  Get_Tx2Status: RadarStatusEnum; stdcall;
    function  Get_Rx1Status: RadarStatusEnum; stdcall;
    function  Get_Rx2Status: RadarStatusEnum; stdcall;
    function  Get_AntennaStatus: RadarStatusEnum; stdcall;
    function  Get_Status: RadarStatusEnum; stdcall;
    procedure Encender_Radar; stdcall;
    procedure Apagar_Radar; stdcall;
  end;

function GetIRadarWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IRadarWS;


implementation

function GetIRadarWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IRadarWS;
const
  defWSDL = 'http://localhost:8888/wsdl/IRadarWS';
  defURL  = 'http://localhost:8888/soap/IRadarWS';
  defSvc  = 'IRadarWSservice';
  defPrt  = 'IRadarWSPort';
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
    Result := (RIO as IRadarWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IRadarWS), 'urn:RadarWSIntf-IRadarWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IRadarWS), 'urn:RadarWSIntf-IRadarWS#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RadarStatusEnum), 'urn:CommunicationObj', 'RadarStatusEnum');

end.