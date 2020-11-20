// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IDRX_AFC_WS
// Version  : 1.0
// (5/6/2011 11:23:32 PM - 1.33.2.5)
// ************************************************************************ //

unit DRX_AFC_WS;

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
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:DRX_AFC_WS-IDRX_AFC_WS
  // soapAction: urn:DRX_AFC_WS-IDRX_AFC_WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IDRX_AFC_WSbinding
  // service   : IDRX_AFC_WSservice
  // port      : IDRX_AFC_WSPort
  // URL       : http://localhost:8888/soap/IDRX_AFC_WS
  // ************************************************************************ //
  IDRX_AFC_WS = interface(IInvokable)
  ['{33A3143C-2820-24A6-C116-9F6BBB2CE244}']
    procedure Set_STALO_Output(const state: Boolean); stdcall;
    function  Get_STALO_Output: Boolean; stdcall;
    function  Get_Frequency: Int64; stdcall;
    procedure Set_Frequency(const value: Int64); stdcall;
    function  Get_Power: Double; stdcall;
    procedure Set_Power(const value: Double); stdcall;
    function  Get_Temperature: Double; stdcall;
    procedure Set_AFCChangesInhibited(const value: Boolean); stdcall;
    function  Get_Settling: Boolean; stdcall;
    function  Get_NCOFrequency: Int64; stdcall;
    procedure Set_NCOFrequency(const value: Int64); stdcall;
  end;

function GetIDRX_AFC_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IDRX_AFC_WS;


implementation

function GetIDRX_AFC_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IDRX_AFC_WS;
const
  defWSDL = 'http://localhost:8888/wsdl/IDRX_AFC_WS';
  defURL  = 'http://localhost:8888/soap/IDRX_AFC_WS';
  defSvc  = 'IDRX_AFC_WSservice';
  defPrt  = 'IDRX_AFC_WSPort';
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
    Result := (RIO as IDRX_AFC_WS);
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
  InvRegistry.RegisterInterface(TypeInfo(IDRX_AFC_WS), 'urn:DRX_AFC_WS-IDRX_AFC_WS', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IDRX_AFC_WS), 'urn:DRX_AFC_WS-IDRX_AFC_WS#%operationName%');

end.