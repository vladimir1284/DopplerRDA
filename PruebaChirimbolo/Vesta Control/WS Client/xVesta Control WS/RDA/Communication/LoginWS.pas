// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/ILoginWS
// Encoding : utf-8
// Version  : 1.0
// (4/10/2011 11:51:44 PM - 1.33.2.5)
// ************************************************************************ //

unit LoginWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  // ************************************************************************ //
  // Namespace : urn:LoginWSIntf-ILoginWS
  // soapAction: |urn:LoginWSIntf-ILoginWS#Borrar_Usuario|urn:LoginWSIntf-ILoginWS#Get_ControllerLevel|urn:LoginWSIntf-ILoginWS#Get_ControllerName|urn:LoginWSIntf-ILoginWS#Get_InControl|urn:LoginWSIntf-ILoginWS#Get_Usuarios|urn:LoginWSIntf-ILoginWS#Login|urn:LoginWSIntf-ILoginWS#Logout|urn:LoginWSIntf-ILoginWS#Modificar|urn:LoginWSIntf-ILoginWS#Nuevo_Usuario|urn:LoginWSIntf-ILoginWS#ReleaseControl|urn:LoginWSIntf-ILoginWS#TakeControl|urn:LoginWSIntf-ILoginWS#Usuario
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ILoginWSbinding
  // service   : ILoginWSservice
  // port      : ILoginWSPort
  // URL       : http://localhost:9999/soap/ILoginWS
  // ************************************************************************ //
  ILoginWS = interface(IInvokable)
  ['{C0A84F6E-0F00-7E2F-073F-5071C9041728}']
    function  Borrar_Usuario(const Name: WideString): Boolean; stdcall;
    function  Get_ControllerLevel: Integer; stdcall;
    function  Get_ControllerName: WideString; stdcall;
    function  Get_InControl: Boolean; stdcall;
    function  Get_Usuarios: Integer; stdcall;
    function  Login(const UserName: WideString; const Password: WideString): Boolean; stdcall;
    function  Logout: Boolean; stdcall;
    function  Modificar(const Name: WideString; const Password: WideString; const Level: Integer): Boolean; stdcall;
    function  Nuevo_Usuario(const Name: WideString; const Password: WideString; const Level: Integer): Boolean; stdcall;
    function  ReleaseControl: Boolean; stdcall;
    function  TakeControl: Boolean; stdcall;
    function  Usuario(const Index: Integer): TUserInfo; stdcall;

    property ControllerName: WideString read Get_ControllerName;
    property Usuarios: Integer read Get_Usuarios;
    property ControllerLevel: Integer read Get_ControllerLevel;
  end;

function GetILoginWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ILoginWS;


implementation

function GetILoginWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ILoginWS;
const
  defWSDL = 'http://localhost:9999/wsdl/ILoginWS';
  defURL  = 'http://localhost:9999/soap/ILoginWS';
  defSvc  = 'ILoginWSservice';
  defPrt  = 'ILoginWSPort';
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
    Result := (RIO as ILoginWS);
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
  InvRegistry.RegisterInterface(TypeInfo(ILoginWS), 'urn:LoginWSIntf-ILoginWS', 'utf-8');
  InvRegistry.RegisterAllSOAPActions(TypeInfo(ILoginWS), '|urn:LoginWSIntf-ILoginWS#Borrar_Usuario'
                                                        +'|urn:LoginWSIntf-ILoginWS#Get_ControllerLevel'
                                                        +'|urn:LoginWSIntf-ILoginWS#Get_ControllerName'
                                                        +'|urn:LoginWSIntf-ILoginWS#Get_InControl'
                                                        +'|urn:LoginWSIntf-ILoginWS#Get_Usuarios'
                                                        +'|urn:LoginWSIntf-ILoginWS#Login'
                                                        +'|urn:LoginWSIntf-ILoginWS#Logout'
                                                        +'|urn:LoginWSIntf-ILoginWS#Modificar'
                                                        +'|urn:LoginWSIntf-ILoginWS#Nuevo_Usuario'
                                                        +'|urn:LoginWSIntf-ILoginWS#ReleaseControl'
                                                        +'|urn:LoginWSIntf-ILoginWS#TakeControl'
                                                        +'|urn:LoginWSIntf-ILoginWS#Usuario'
                                                        );
  InvRegistry.RegisterHeaderClass(TypeInfo(ILoginWS), TAuthHeader, 'TAuthHeader', 'urn:CommunicationObj');
  RemClassRegistry.RegisterXSClass(TUserInfo, 'urn:LoginWSIntf', 'TUserInfo');
  RemClassRegistry.RegisterXSClass(TAuthHeader, 'urn:CommunicationObj', 'TAuthHeader');

end.