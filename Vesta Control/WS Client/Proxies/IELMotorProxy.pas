// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IELMotorWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:41:52 AM - 1.33.2.5)
// ************************************************************************ //

unit IELMotorProxy;

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
  // Namespace : urn:ELMotorWSIntf-IELMotorWS
  // soapAction: urn:ELMotorWSIntf-IELMotorWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IELMotorWSbinding
  // service   : IELMotorWSservice
  // port      : IELMotorWSPort
  // URL       : http://localhost:8888/soap/IELMotorWS
  // ************************************************************************ //
  IELMotorWS = interface(IInvokable)
  ['{4D7D26C1-DC02-7748-9934-596012243D35}']
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

function GetIELMotorWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IELMotorWS;


implementation

function GetIELMotorWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IELMotorWS;
const
  defWSDL = 'http://localhost:8888/wsdl/IELMotorWS';
  defURL  = 'http://localhost:8888/soap/IELMotorWS';
  defSvc  = 'IELMotorWSservice';
  defPrt  = 'IELMotorWSPort';
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
    Result := (RIO as IELMotorWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IELMotorWS), 'urn:ELMotorWSIntf-IELMotorWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IELMotorWS), 'urn:ELMotorWSIntf-IELMotorWS#%operationName%');

end.