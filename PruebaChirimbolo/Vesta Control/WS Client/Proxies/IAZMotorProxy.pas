// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IAZMotorWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:41:06 AM - 1.33.2.5)
// ************************************************************************ //

unit IAZMotorProxy;

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
  // !:float           - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:AZMotorWSIntf-IAZMotorWS
  // soapAction: urn:AZMotorWSIntf-IAZMotorWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IAZMotorWSbinding
  // service   : IAZMotorWSservice
  // port      : IAZMotorWSPort
  // URL       : http://localhost:8888/soap/IAZMotorWS
  // ************************************************************************ //
  IAZMotorWS = interface(IInvokable)
  ['{B12A6284-59AD-52BD-DAD6-41CA83B502DC}']
    function  Get_Posicion: Integer; stdcall;
    function  Get_Velocidad: Integer; stdcall;
    function  Get_SP_Posicion: Integer; stdcall;
    function  Get_SP_Velocidad: Integer; stdcall;
    function  Get_Lazo_Posicion: Boolean; stdcall;
    function  Get_Acc_Listo: Boolean; stdcall;
    function  Get_Marca_Posicion: Integer; stdcall;
    function  Get_Lazo_Sector: Boolean; stdcall;
    function  Get_Lazo_Posicion_K: Single; stdcall;
    function  Get_Lazo_Velocidad_K: Single; stdcall;
    procedure Set_SP_Posicion(const Value: Integer); stdcall;
    procedure Set_SP_Velocidad(const Value: Integer); stdcall;
    procedure Set_Lazo_Posicion(const Value: Boolean); stdcall;
    procedure Set_Lazo_Posicion_K(const Value: Single); stdcall;
    procedure Set_Lazo_Velocidad_K(const Value: Single); stdcall;
    procedure Set_Marca_Posicion(const Value: Integer); stdcall;
    procedure Set_Lazo_Sector(const Value: Boolean); stdcall;
  end;

function GetIAZMotorWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IAZMotorWS;


implementation

function GetIAZMotorWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IAZMotorWS;
const
  defWSDL = 'http://localhost:8888/wsdl/IAZMotorWS';
  defURL  = 'http://localhost:8888/soap/IAZMotorWS';
  defSvc  = 'IAZMotorWSservice';
  defPrt  = 'IAZMotorWSPort';
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
    Result := (RIO as IAZMotorWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IAZMotorWS), 'urn:AZMotorWSIntf-IAZMotorWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IAZMotorWS), 'urn:AZMotorWSIntf-IAZMotorWS#%operationName%');

end.