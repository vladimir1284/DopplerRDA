// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.107.200:7788/wsdl/IDRX_SYNC_WS
// Version  : 1.0
// (13/02/2012 11:49:17 - 1.33.2.5)
// ************************************************************************ //

unit DRX_Sync_WS;

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
  // Namespace : urn:DRX_Sync_WS-IDRX_Sync_WS
  // soapAction: urn:DRX_Sync_WS-IDRX_Sync_WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IDRX_Sync_WSbinding
  // service   : IDRX_Sync_WSservice
  // port      : IDRX_SYNC_WSPort
  // URL       : http://192.168.107.200:7788/soap/IDRX_SYNC_WS
  // ************************************************************************ //
  IDRX_Sync_WS = interface(IInvokable)
  ['{99ECB1FD-93A0-18FD-07B6-ACF7261415B4}']
    function  Get_Pulse_Mode: Boolean; stdcall;
    function  Get_Output_Mode: Boolean; stdcall;
    function  Get_Sector_Mode: Integer; stdcall;
    function  Get_PRF_Mode: Boolean; stdcall;
    function  Get_PRF_Rate: Integer; stdcall;
    procedure Set_Pulso_Largo; stdcall;
    procedure Set_Pulso_Corto(const rate: Integer); stdcall;
    procedure Set_Pulso(const Success: Boolean); stdcall;
    function  Get_SectorDirection: Boolean; stdcall;
    procedure Set_Sector_Mode(const direction: Boolean; const count: Integer); stdcall;
    function  Get_Synch_Settling: Boolean; stdcall;
  end;

function GetIDRX_Sync_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IDRX_Sync_WS;


implementation

function GetIDRX_Sync_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IDRX_Sync_WS;
const
  defWSDL = 'http://192.168.107.200:7788/wsdl/IDRX_SYNC_WS';
  defURL  = 'http://192.168.107.200:7788/soap/IDRX_SYNC_WS';
  defSvc  = 'IDRX_Sync_WSservice';
  defPrt  = 'IDRX_SYNC_WSPort';
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
    Result := (RIO as IDRX_Sync_WS);
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
  InvRegistry.RegisterInterface(TypeInfo(IDRX_Sync_WS), 'urn:DRX_Sync_WS-IDRX_Sync_WS', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IDRX_Sync_WS), 'urn:DRX_Sync_WS-IDRX_Sync_WS#%operationName%');

end.