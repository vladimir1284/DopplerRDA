// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IDRX_Configuration_WS
// Version  : 1.0
// (5/6/2011 11:20:47 PM - 1.33.2.5)
// ************************************************************************ //

unit DRX_Configuration_WS;

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
  // !:double          - "http://www.w3.org/2001/XMLSchema"

  Settings             = class;                 { "urn:Site" }

  TBoundArray = array of Integer;               { "urn:Site" }


  // ************************************************************************ //
  // Namespace : urn:Site
  // ************************************************************************ //
  Settings = class(TRemotable)
  private
    FScan_step: Integer;
    FScan_delay: Integer;
    FScan_width: Integer;
    FStaloPort: Integer;
    FPower_factor_tx: Double;
    FStart_sample_lp: Integer;
    FStop_sample_lp: Integer;
    FStart_sample_sp: Integer;
    FStop_sample_sp: Integer;
    FThresholdSQI: Double;
    FC1: Double;
    FC2: Double;
    FSP_TX_PulsePosition: Integer;
    FLP_TX_PulsePosition: Integer;
    FNoise_power: Double;
    FNoise_source: Integer;
    FPower_shot: Integer;
    FSensibility: Integer;
    FDinamic_range: Integer;
    FRadar_constant_lp: Double;
    FRadar_constant_sp: Double;
    FMet_pot_lp: Double;
    FMet_pot_sp: Double;
    FConv_table: TBoundArray;
    FWS_Port: Integer;
  published
    property Scan_step: Integer read FScan_step write FScan_step;
    property Scan_delay: Integer read FScan_delay write FScan_delay;
    property Scan_width: Integer read FScan_width write FScan_width;
    property StaloPort: Integer read FStaloPort write FStaloPort;
    property Power_factor_tx: Double read FPower_factor_tx write FPower_factor_tx;
    property Start_sample_lp: Integer read FStart_sample_lp write FStart_sample_lp;
    property Stop_sample_lp: Integer read FStop_sample_lp write FStop_sample_lp;
    property Start_sample_sp: Integer read FStart_sample_sp write FStart_sample_sp;
    property Stop_sample_sp: Integer read FStop_sample_sp write FStop_sample_sp;
    property ThresholdSQI: Double read FThresholdSQI write FThresholdSQI;
    property C1: Double read FC1 write FC1;
    property C2: Double read FC2 write FC2;
    property SP_TX_PulsePosition: Integer read FSP_TX_PulsePosition write FSP_TX_PulsePosition;
    property LP_TX_PulsePosition: Integer read FLP_TX_PulsePosition write FLP_TX_PulsePosition;
    property Noise_power: Double read FNoise_power write FNoise_power;
    property Noise_source: Integer read FNoise_source write FNoise_source;
    property Power_shot: Integer read FPower_shot write FPower_shot;
    property Sensibility: Integer read FSensibility write FSensibility;
    property Dinamic_range: Integer read FDinamic_range write FDinamic_range;
    property Radar_constant_lp: Double read FRadar_constant_lp write FRadar_constant_lp;
    property Radar_constant_sp: Double read FRadar_constant_sp write FRadar_constant_sp;
    property Met_pot_lp: Double read FMet_pot_lp write FMet_pot_lp;
    property Met_pot_sp: Double read FMet_pot_sp write FMet_pot_sp;
    property Conv_table: TBoundArray read FConv_table write FConv_table;
    property WS_Port: Integer read FWS_Port write FWS_Port;
  end;


  // ************************************************************************ //
  // Namespace : urn:DRX_Configuration_WS-IDRX_Configuration_WS
  // soapAction: urn:DRX_Configuration_WS-IDRX_Configuration_WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IDRX_Configuration_WSbinding
  // service   : IDRX_Configuration_WSservice
  // port      : IDRX_Configuration_WSPort
  // URL       : http://localhost:8888/soap/IDRX_Configuration_WS
  // ************************************************************************ //
  IDRX_Configuration_WS = interface(IInvokable)
  ['{3F38E698-F6FF-D865-B8EF-51DC7DEAD009}']
    function  Get_Configuration: Settings; stdcall;
    procedure Set_Configuration(const config: Settings); stdcall;
  end;

function GetIDRX_Configuration_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IDRX_Configuration_WS;


implementation

function GetIDRX_Configuration_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IDRX_Configuration_WS;
const
  defWSDL = 'http://localhost:8888/wsdl/IDRX_Configuration_WS';
  defURL  = 'http://localhost:8888/soap/IDRX_Configuration_WS';
  defSvc  = 'IDRX_Configuration_WSservice';
  defPrt  = 'IDRX_Configuration_WSPort';
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
    Result := (RIO as IDRX_Configuration_WS);
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
  InvRegistry.RegisterInterface(TypeInfo(IDRX_Configuration_WS), 'urn:DRX_Configuration_WS-IDRX_Configuration_WS', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IDRX_Configuration_WS), 'urn:DRX_Configuration_WS-IDRX_Configuration_WS#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TBoundArray), 'urn:Site', 'TBoundArray');
  RemClassRegistry.RegisterXSClass(Settings, 'urn:Site', 'Settings');

end.