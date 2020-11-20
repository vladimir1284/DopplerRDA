// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IAntennaWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:39:36 AM - 1.33.2.5)
// ************************************************************************ //

unit IAntennaProxy;

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
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:byte            - "http://www.w3.org/2001/XMLSchema"

  { "urn:CommunicationObj" }
  RadarStatusEnum = (rsOff, rsFailure, rsOk);


  // ************************************************************************ //
  // Namespace : urn:AntennaWSIntf-IAntennaWS
  // soapAction: urn:AntennaWSIntf-IAntennaWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IAntennaWSbinding
  // service   : IAntennaWSservice
  // port      : IAntennaWSPort
  // URL       : http://localhost:8888/soap/IAntennaWS
  // ************************************************************************ //
  IAntennaWS = interface(IInvokable)
  ['{AF956BBF-4A7C-B97D-F274-D183551A3508}']
    function  Get_Local: Boolean; stdcall;
    function  Get_Ventilacion: Boolean; stdcall;
    function  Get_Status: RadarStatusEnum; stdcall;
    function  Get_SyncMark: Integer; stdcall;
    function  Get_SyncMarkDirection: Boolean; stdcall;
    function  Get_Excitacion: Boolean; stdcall;
    function  Get_Limite_N: Boolean; stdcall;
    function  Get_Limite_P: Boolean; stdcall;
    function  Get_Cupula_Cerrada: Boolean; stdcall;
    function  Get_Fuente_Exitacion_Code: Integer; stdcall;
    function  Get_Fuente_Exitacion_Unit: Double; stdcall;
    function  Get_Fuente_5V_Code: Integer; stdcall;
    function  Get_Fuente_5V_Unit: Double; stdcall;
    function  Get_Fuente_12V_Code: Integer; stdcall;
    function  Get_Fuente_24V_Code: Integer; stdcall;
    function  Get_Fuente_24V_Unit: Double; stdcall;
    function  Get_Fuente_12V_Unit: Double; stdcall;
    function  Get_Rango_Fuente_5V: Integer; stdcall;
    function  Get_Rango_Fuente_12V: Integer; stdcall;
    function  Get_Rango_Fuente_24V: Integer; stdcall;
    function  Get_Rango_Fuente_Excitacion: Integer; stdcall;
    function  Get_Sector_Fuente_5V: Integer; stdcall;
    function  Get_Sector_Fuente_12V: Integer; stdcall;
    function  Get_Sector_Fuente_24V: Integer; stdcall;
    function  Get_Sector_Fuente_Excitacion: Integer; stdcall;
    procedure Encender_Acc; stdcall;
    procedure Apagar_Acc; stdcall;
    procedure Alarma_Sonora(const Tiempo: Integer); stdcall;
    procedure Set_SyncMark(const direction: Boolean; const rays: Shortint); stdcall;
    procedure Set_Rango_Fuente_5V(const Value: Integer); stdcall;
    procedure Set_Sector_Fuente_5V(const Value: Integer); stdcall;
    procedure Set_Sector_Fuente_12V(const Value: Integer); stdcall;
    procedure Set_Rango_Fuente_12V(const Value: Integer); stdcall;
    procedure Set_Rango_Fuente_24V(const Value: Integer); stdcall;
    procedure Set_Sector_Fuente_24V(const Value: Integer); stdcall;
    procedure Set_Rango_Fuente_Excitacion(const Value: Integer); stdcall;
    procedure Set_Sector_Fuente_Excitacion(const Value: Integer); stdcall;
  end;

function GetIAntennaWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IAntennaWS;


implementation

function GetIAntennaWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IAntennaWS;
const
  defWSDL = 'http://localhost:8888/wsdl/IAntennaWS';
  defURL  = 'http://localhost:8888/soap/IAntennaWS';
  defSvc  = 'IAntennaWSservice';
  defPrt  = 'IAntennaWSPort';
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
    Result := (RIO as IAntennaWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IAntennaWS), 'urn:AntennaWSIntf-IAntennaWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IAntennaWS), 'urn:AntennaWSIntf-IAntennaWS#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RadarStatusEnum), 'urn:CommunicationObj', 'RadarStatusEnum');

end.