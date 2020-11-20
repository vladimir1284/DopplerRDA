// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/IRadarWS
// Encoding : utf-8
// Version  : 1.0
// (4/10/2011 11:36:54 PM - 1.33.2.5)
// ************************************************************************ //

unit RadarWS;

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


  // ************************************************************************ //
  // Namespace : urn:RadarWSIntf-IRadarWS
  // soapAction: urn:RadarWSIntf-IRadarWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IRadarWSbinding
  // service   : IRadarWSservice
  // port      : IRadarWSPort
  // URL       : http://localhost:9999/soap/IRadarWS
  // ************************************************************************ //
  IRadarWS = interface(IInvokable)
  ['{1211759B-C0DE-EA2C-4A69-19D507222EEC}']
    function  Get_Red_Listo: Boolean; stdcall;
    function  Get_Radar_On_P: Boolean; stdcall;
    function  Get_Radar_On_N: Boolean; stdcall;
    function  Get_Muestra_P: Integer; stdcall;
    function  Get_Muestra_N: Integer; stdcall;
    function  Get_Radar_Encender: Boolean; stdcall;
    function  Get_Radar_Apagar: Boolean; stdcall;
    function  Get_Rango_Muestra_P: Integer; stdcall;
    function  Get_Rango_Muestra_N: Integer; stdcall;
    function  Get_Sector_Muestra_P: Integer; stdcall;
    function  Get_Sector_Muestra_N: Integer; stdcall;
    procedure Encender_Radar; stdcall;
    procedure Apagar_Radar; stdcall;
    procedure Set_Rango_Muestra_P(const Param1: Integer); stdcall;
    procedure Set_Rango_Muestra_N(const Param1: Integer); stdcall;
    procedure Set_Sector_Muestra_P(const Param1: Integer); stdcall;
    procedure Set_Sector_Muestra_N(const Param1: Integer); stdcall;

    property Red_Listo: boolean read Get_Red_Listo;
    property Radar_On_P: boolean read Get_Radar_On_P;
    property Radar_On_N: boolean read Get_Radar_On_N;
    property Muestra_P: Integer read Get_Muestra_P;
    property Muestra_N: Integer read Get_Muestra_N;
    property Radar_Encender: boolean read Get_Radar_Encender;
    property Radar_Apagar: boolean read Get_Radar_Apagar;
    property Rango_Muestra_P: Integer read Get_Rango_Muestra_P;
    property Rango_Muestra_N: Integer read Get_Rango_Muestra_N;
    property Sector_Muestra_P: Integer read Get_Sector_Muestra_P;
    property Sector_Muestra_N: Integer read Get_Sector_Muestra_N;

  end;

function GetIRadarWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IRadarWS;


implementation

function GetIRadarWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IRadarWS;
const
  defWSDL = 'http://localhost:9999/wsdl/IRadarWS';
  defURL  = 'http://localhost:9999/soap/IRadarWS';
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

end.