// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.123.201:7788/wsdl/IDRX_WS
// Version  : 1.0
// (19/03/2012 14:33:31 - 1.33.2.5)
// ************************************************************************ //

unit DRX_WS;

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
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"

  TDRX_Parameters      = class;                 { "urn:DRX_WS" }
  TDataFilter          = class;                 { "urn:DRX_WS" }



  // ************************************************************************ //
  // Namespace : urn:DRX_WS
  // ************************************************************************ //
  TDRX_Parameters = class(TRemotable)
  private
    FShortPulse_NData: Integer;
    FLongPulse_NData: Integer;
    FDualPulse_NData: Integer;
    FShortPulse_Trigger: Integer;
    FLongPulse_Trigger: Integer;
    FDualPulse_High_Trigger: Integer;
    FDualPulse_1_Trigger: Integer;
    FDualPulse_2_Trigger: Integer;
    FDualPulse_3_Trigger: Integer;
    FShortPulse_CellSize: Integer;
    FLongPulse_CellSize: Integer;
    FShortPulse_Clock: Integer;
    FLongPulse_Clock: Integer;
    FSectors: Integer;
    FIF_: Int64;
    FBand_Frequency: Int64;
    FBand_Length: Double;
  published
    property ShortPulse_NData: Integer read FShortPulse_NData write FShortPulse_NData;
    property LongPulse_NData: Integer read FLongPulse_NData write FLongPulse_NData;
    property DualPulse_NData: Integer read FDualPulse_NData write FDualPulse_NData;
    property ShortPulse_Trigger: Integer read FShortPulse_Trigger write FShortPulse_Trigger;
    property LongPulse_Trigger: Integer read FLongPulse_Trigger write FLongPulse_Trigger;
    property DualPulse_High_Trigger: Integer read FDualPulse_High_Trigger write FDualPulse_High_Trigger;
    property DualPulse_1_Trigger: Integer read FDualPulse_1_Trigger write FDualPulse_1_Trigger;
    property DualPulse_2_Trigger: Integer read FDualPulse_2_Trigger write FDualPulse_2_Trigger;
    property DualPulse_3_Trigger: Integer read FDualPulse_3_Trigger write FDualPulse_3_Trigger;
    property ShortPulse_CellSize: Integer read FShortPulse_CellSize write FShortPulse_CellSize;
    property LongPulse_CellSize: Integer read FLongPulse_CellSize write FLongPulse_CellSize;
    property ShortPulse_Clock: Integer read FShortPulse_Clock write FShortPulse_Clock;
    property LongPulse_Clock: Integer read FLongPulse_Clock write FLongPulse_Clock;
    property Sectors: Integer read FSectors write FSectors;
    property IF_: Int64 read FIF_ write FIF_;
    property Band_Frequency: Int64 read FBand_Frequency write FBand_Frequency;
    property Band_Length: Double read FBand_Length write FBand_Length;
  end;



  // ************************************************************************ //
  // Namespace : urn:DRX_WS
  // ************************************************************************ //
  TDataFilter = class(TRemotable)
  private
    FB0: Double;
    FB1: Double;
    FB2: Double;
    FB3: Double;
    FB4: Double;
    FC1: Double;
    FC2: Double;
    FC3: Double;
    FC4: Double;
    FMaxAngle: Double;
    FMaxHeigh: Integer;
    FMaxDistance: Integer;
    FSQI: Boolean;
    FCI: Boolean;
    FSIG: Boolean;
    FLOG: Boolean;
    FCCOR: Boolean;
  published
    property B0: Double read FB0 write FB0;
    property B1: Double read FB1 write FB1;
    property B2: Double read FB2 write FB2;
    property B3: Double read FB3 write FB3;
    property B4: Double read FB4 write FB4;
    property C1: Double read FC1 write FC1;
    property C2: Double read FC2 write FC2;
    property C3: Double read FC3 write FC3;
    property C4: Double read FC4 write FC4;
    property MaxAngle: Double read FMaxAngle write FMaxAngle;
    property MaxHeigh: Integer read FMaxHeigh write FMaxHeigh;
    property MaxDistance: Integer read FMaxDistance write FMaxDistance;
    property SQI: Boolean read FSQI write FSQI;
    property CI: Boolean read FCI write FCI;
    property SIG: Boolean read FSIG write FSIG;
    property LOG: Boolean read FLOG write FLOG;
    property CCOR: Boolean read FCCOR write FCCOR;
  end;


  // ************************************************************************ //
  // Namespace : urn:DRX_WS-IDRX_WS
  // soapAction: urn:DRX_WS-IDRX_WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IDRX_WSbinding
  // service   : IDRX_WSservice
  // port      : IDRX_WSPort
  // URL       : http://192.168.123.201:7788/soap/IDRX_WS
  // ************************************************************************ //
  IDRX_WS = interface(IInvokable)
  ['{03DAF513-0A65-453F-B522-A0CAB9709302}']
    function  Login(const UserName: WideString; const Password: WideString): Boolean; stdcall;
    function  Logout: Boolean; stdcall;
    function  Ping(const code: Integer): Integer; stdcall;
    procedure StartDataFlow(const RealTime: Boolean); stdcall;
    procedure StopDataFlow; stdcall;
    function  GetParameters: TDRX_Parameters; stdcall;
    function  GetGathering: Boolean; stdcall;
    procedure AcquirePPI(const Speed: Integer; const Elevation: Integer); stdcall;
    procedure AcquireRHI(const Speed: Integer; const Azimuth: Integer; const Start: Integer; const Final: Integer); stdcall;
    procedure FinalizeObservation; stdcall;
    procedure CancelObservation; stdcall;
    procedure Set_Filter(const Filter: Boolean; const FilterInfo: TDataFilter); stdcall;
  end;

function GetIDRX_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IDRX_WS;


implementation

function GetIDRX_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IDRX_WS;
const
  defWSDL = 'http://192.168.123.201:7788/wsdl/IDRX_WS';
  defURL  = 'http://192.168.123.201:7788/soap/IDRX_WS';
  defSvc  = 'IDRX_WSservice';
  defPrt  = 'IDRX_WSPort';
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
    Result := (RIO as IDRX_WS);
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
  InvRegistry.RegisterInterface(TypeInfo(IDRX_WS), 'urn:DRX_WS-IDRX_WS', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IDRX_WS), 'urn:DRX_WS-IDRX_WS#%operationName%');
  RemClassRegistry.RegisterXSClass(TDRX_Parameters, 'urn:DRX_WS', 'TDRX_Parameters');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(TDRX_Parameters), 'IF_', 'IF');
  RemClassRegistry.RegisterXSClass(TDataFilter, 'urn:DRX_WS', 'TDataFilter');

end.