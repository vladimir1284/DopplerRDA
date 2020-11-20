// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/IStatisticsWS
// Encoding : utf-8
// Version  : 1.0
// (4/20/2011 11:48:03 AM - 1.33.2.5)
// ************************************************************************ //

unit StatisticsWS;

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


  // ************************************************************************ //
  // Namespace : urn:StatisticsWSIntf-IStatisticsWS
  // soapAction: urn:StatisticsWSIntf-IStatisticsWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IStatisticsWSbinding
  // service   : IStatisticsWSservice
  // port      : IStatisticsWSPort
  // URL       : http://localhost:9999/soap/IStatisticsWS
  // ************************************************************************ //
  IStatisticsWS = interface(IInvokable)
  ['{28EE4844-9B1A-6C73-4820-E06427BBA295}']
    function  Get_SwitchedOnRDA: Integer; stdcall;
    function  Get_SwitchedOnRadar: Integer; stdcall;
    function  Get_SwitchedOnAcc: Integer; stdcall;
    function  Get_SwitchedOnMotorAz: Integer; stdcall;
    function  Get_SwitchedOnMotorEl: Integer; stdcall;
    function  Get_SwitchedOnTxCaldeo: Integer; stdcall;
    function  Get_SwitchedOnTxAnodo: Integer; stdcall;
    function  Get_SwitchedOnRx: Integer; stdcall;
    function  Get_MagnetronCaldeo: Integer; stdcall;
    function  Get_MagnetronAnodo: Integer; stdcall;
    function  Get_TiratronPrincipal: Integer; stdcall;
    function  Get_TiratronAuxiliar: Integer; stdcall;
    function  Get_SwitchedOnTxCaldeo2: Integer; stdcall;
    function  Get_SwitchedOnTxAnodo2: Integer; stdcall;
    function  Get_SwitchedOnRx2: Integer; stdcall;
    function  Get_MagnetronCaldeo2: Integer; stdcall;
    function  Get_MagnetronAnodo2: Integer; stdcall;
    function  Get_TiratronPrincipal2: Integer; stdcall;
    function  Get_TiratronAuxiliar2: Integer; stdcall;
    function  Get_TiratronPrincipalAnodo2: Integer; stdcall;
    function  Get_TiratronPrincipalAnodo1: Integer; stdcall;
    procedure Set_SwitchedOnRDA(const value: Integer); stdcall;
    procedure Set_SwitchedOnRadar(const value: Integer); stdcall;
    procedure Set_SwitchedOnAcc(const value: Integer); stdcall;
    procedure Set_SwitchedOnMotorAz(const value: Integer); stdcall;
    procedure Set_SwitchedOnMotorEl(const value: Integer); stdcall;
    procedure Set_SwitchedOnTxCaldeo(const value: Integer); stdcall;
    procedure Set_SwitchedOnTxAnodo(const value: Integer); stdcall;
    procedure Set_SwitchedOnRx(const value: Integer); stdcall;
    procedure Set_MagnetronCaldeo(const value: Integer); stdcall;
    procedure Set_MagnetronAnodo(const value: Integer); stdcall;
    procedure Set_TiratronPrincipal(const value: Integer); stdcall;
    procedure Set_TiratronAuxiliar(const value: Integer); stdcall;
    procedure Set_SwitchedOnTxCaldeo2(const value: Integer); stdcall;
    procedure Set_SwitchedOnTxAnodo2(const value: Integer); stdcall;
    procedure Set_SwitchedOnRx2(const value: Integer); stdcall;
    procedure Set_MagnetronCaldeo2(const value: Integer); stdcall;
    procedure Set_MagnetronAnodo2(const value: Integer); stdcall;
    procedure Set_TiratronAuxiliar2(const value: Integer); stdcall;
    procedure Set_TiratronPrincipal2(const value: Integer); stdcall;
    procedure Set_TiratronPrincipalAnodo1(const value: Integer); stdcall;
    procedure Set_TiratronPrincipalAnodo2(const value: Integer); stdcall;

    property SwitchedOnRDA: Integer           read Get_SwitchedOnRDA           write Set_SwitchedOnRDA;
    property SwitchedOnRadar: Integer         read Get_SwitchedOnRadar         write Set_SwitchedOnRadar;
    property SwitchedOnAcc: Integer           read Get_SwitchedOnAcc           write Set_SwitchedOnAcc;
    property SwitchedOnMotorAz: Integer       read Get_SwitchedOnMotorAz       write Set_SwitchedOnMotorAz;
    property SwitchedOnMotorEl: Integer       read Get_SwitchedOnMotorEl       write Set_SwitchedOnMotorEl;
    property SwitchedOnTxCaldeo: Integer      read Get_SwitchedOnTxCaldeo      write Set_SwitchedOnTxCaldeo;
    property SwitchedOnTxAnodo: Integer       read Get_SwitchedOnTxAnodo       write Set_SwitchedOnTxAnodo;
    property SwitchedOnRx: Integer            read Get_SwitchedOnRx            write Set_SwitchedOnRx;
    property MagnetronCaldeo: Integer         read Get_MagnetronCaldeo         write Set_MagnetronCaldeo;
    property MagnetronAnodo: Integer          read Get_MagnetronAnodo          write Set_MagnetronAnodo;
    property TiratronPrincipal: Integer       read Get_TiratronPrincipal       write Set_TiratronPrincipal;
    property TiratronAuxiliar: Integer        read Get_TiratronAuxiliar        write Set_TiratronAuxiliar;
    property SwitchedOnTxCaldeo2: Integer     read Get_SwitchedOnTxCaldeo2     write Set_SwitchedOnTxCaldeo2;
    property SwitchedOnTxAnodo2: Integer      read Get_SwitchedOnTxAnodo2      write Set_SwitchedOnTxAnodo2;
    property SwitchedOnRx2: Integer           read Get_SwitchedOnRx2           write Set_SwitchedOnRx2;
    property MagnetronCaldeo2: Integer        read Get_MagnetronCaldeo2        write Set_MagnetronCaldeo2;
    property MagnetronAnodo2: Integer         read Get_MagnetronAnodo2         write Set_MagnetronAnodo2;
    property TiratronPrincipal2: Integer      read Get_TiratronPrincipal2      write Set_TiratronAuxiliar2;
    property TiratronAuxiliar2: Integer       read Get_TiratronAuxiliar2       write Set_TiratronPrincipal2;
    property TiratronPrincipalAnodo2: Integer read Get_TiratronPrincipalAnodo2 write Set_TiratronPrincipalAnodo2;
    property TiratronPrincipalAnodo1: Integer read Get_TiratronPrincipalAnodo1 write Set_TiratronPrincipalAnodo1;    
  end;

function GetIStatisticsWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IStatisticsWS;


implementation

function GetIStatisticsWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IStatisticsWS;
const
  defWSDL = 'http://localhost:9999/wsdl/IStatisticsWS';
  defURL  = 'http://localhost:9999/soap/IStatisticsWS';
  defSvc  = 'IStatisticsWSservice';
  defPrt  = 'IStatisticsWSPort';
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
    Result := (RIO as IStatisticsWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IStatisticsWS), 'urn:StatisticsWSIntf-IStatisticsWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IStatisticsWS), 'urn:StatisticsWSIntf-IStatisticsWS#%operationName%');

end. 