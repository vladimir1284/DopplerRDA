// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IDRX_Sync_WS
// Version  : 1.0
// (5/6/2011 11:21:01 PM - 1.33.2.5)
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
  // port      : IDRX_Sync_WSPort
  // URL       : http://localhost:8888/soap/IDRX_Sync_WS
  // ************************************************************************ //
  IDRX_Sync_WS = interface(IInvokable)
  ['{E0D2CD48-710F-089C-5502-4EFB2F1D0337}']
    function  Get_Pulse_Mode: Boolean; stdcall;
    function  Get_Output_Mode: Boolean; stdcall;
    function  Get_Sector_Mode: Integer; stdcall;
    function  Get_PRF_Mode: Boolean; stdcall;
    function  Get_PRF_Rate: Integer; stdcall;
    procedure Set_Pulso_Largo; stdcall;
    procedure Set_Pulso_Corto; stdcall;
    procedure Set_Output_On; stdcall;
    procedure Set_Output_Off; stdcall;
    procedure Set_Sector_Mode(const count: Integer); stdcall;
    procedure Set_Single_PRF; stdcall;
    procedure Set_Dual_PRF(const rate: Integer); stdcall;
    function  Get_Synch_Settling: Boolean; stdcall;
  end;

function GetIDRX_Sync_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IDRX_Sync_WS;


implementation

function GetIDRX_Sync_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IDRX_Sync_WS;
const
  defWSDL = 'http://localhost:8888/wsdl/IDRX_Sync_WS';
  defURL  = 'http://localhost:8888/soap/IDRX_Sync_WS';
  defSvc  = 'IDRX_Sync_WSservice';
  defPrt  = 'IDRX_Sync_WSPort';
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