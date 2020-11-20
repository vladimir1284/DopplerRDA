// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.107.200:7788/wsdl/IDRX_Configuration_WS
// Version  : 1.0
// (13/02/2012 11:48:51 - 1.33.2.5)
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
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"

  TSettings            = class;                 { "urn:Site" }



  // ************************************************************************ //
  // Namespace : urn:Site
  // ************************************************************************ //
  TSettings = class(TRemotable)
  private
    FScan_step: Integer;
    FScan_delay: Integer;
    FScan_width: Integer;
    FValid_power_tx: Double;
    FPower_factor_tx: Double;
    FStart_sample_lp: Integer;
    FStop_sample_lp: Integer;
    FStart_sample_sp: Integer;
    FStop_sample_sp: Integer;
    FLoopGain: Double;
    FThresholdSQI: Double;
    FThresholdCI: Double;
    FThresholdCCOR: Double;
    FThresholdSIG: Double;
    FThresholdLOG: Double;
    FC1: Double;
    FC2: Double;
    FSP_TX_PulsePosition: Integer;
    FLP_TX_PulsePosition: Integer;
    FSensibility_LP: Integer;
    FSensibility_SP: Integer;
    FDinamic_range_LP: Integer;
    FDinamic_range_SP: Integer;
    FConv_table_lp_text: WideString;
    FConv_table_sp_text: WideString;
    FWS_Port: Integer;
    FStream_Port: Integer;
    FDoppler_Port: Integer;
    FMaster: Boolean;
    FMaxAngle: Double;
    FMaxHeigh: Integer;
    FMaxDistance: Integer;
    FFactorB0: Double;
    FFactorB1: Double;
    FFactorB2: Double;
    FFactorB3: Double;
    FFactorB4: Double;
    FFactorC1: Double;
    FFactorC2: Double;
    FFactorC3: Double;
    FFactorC4: Double;
    FSQI_Flag: Boolean;
    FCI_Flag: Boolean;
    FSIG_Flag: Boolean;
    FLOG_Flag: Boolean;
    FCCOR_Flag: Boolean;
  published
    property Scan_step: Integer read FScan_step write FScan_step;
    property Scan_delay: Integer read FScan_delay write FScan_delay;
    property Scan_width: Integer read FScan_width write FScan_width;
    property Valid_power_tx: Double read FValid_power_tx write FValid_power_tx;
    property Power_factor_tx: Double read FPower_factor_tx write FPower_factor_tx;
    property Start_sample_lp: Integer read FStart_sample_lp write FStart_sample_lp;
    property Stop_sample_lp: Integer read FStop_sample_lp write FStop_sample_lp;
    property Start_sample_sp: Integer read FStart_sample_sp write FStart_sample_sp;
    property Stop_sample_sp: Integer read FStop_sample_sp write FStop_sample_sp;
    property LoopGain: Double read FLoopGain write FLoopGain;
    property ThresholdSQI: Double read FThresholdSQI write FThresholdSQI;
    property ThresholdCI: Double read FThresholdCI write FThresholdCI;
    property ThresholdCCOR: Double read FThresholdCCOR write FThresholdCCOR;
    property ThresholdSIG: Double read FThresholdSIG write FThresholdSIG;
    property ThresholdLOG: Double read FThresholdLOG write FThresholdLOG;
    property C1: Double read FC1 write FC1;
    property C2: Double read FC2 write FC2;
    property SP_TX_PulsePosition: Integer read FSP_TX_PulsePosition write FSP_TX_PulsePosition;
    property LP_TX_PulsePosition: Integer read FLP_TX_PulsePosition write FLP_TX_PulsePosition;
    property Sensibility_LP: Integer read FSensibility_LP write FSensibility_LP;
    property Sensibility_SP: Integer read FSensibility_SP write FSensibility_SP;
    property Dinamic_range_LP: Integer read FDinamic_range_LP write FDinamic_range_LP;
    property Dinamic_range_SP: Integer read FDinamic_range_SP write FDinamic_range_SP;
    property Conv_table_lp_text: WideString read FConv_table_lp_text write FConv_table_lp_text;
    property Conv_table_sp_text: WideString read FConv_table_sp_text write FConv_table_sp_text;
    property WS_Port: Integer read FWS_Port write FWS_Port;
    property Stream_Port: Integer read FStream_Port write FStream_Port;
    property Doppler_Port: Integer read FDoppler_Port write FDoppler_Port;
    property Master: Boolean read FMaster write FMaster;
    property MaxAngle: Double read FMaxAngle write FMaxAngle;
    property MaxHeigh: Integer read FMaxHeigh write FMaxHeigh;
    property MaxDistance: Integer read FMaxDistance write FMaxDistance;
    property FactorB0: Double read FFactorB0 write FFactorB0;
    property FactorB1: Double read FFactorB1 write FFactorB1;
    property FactorB2: Double read FFactorB2 write FFactorB2;
    property FactorB3: Double read FFactorB3 write FFactorB3;
    property FactorB4: Double read FFactorB4 write FFactorB4;
    property FactorC1: Double read FFactorC1 write FFactorC1;
    property FactorC2: Double read FFactorC2 write FFactorC2;
    property FactorC3: Double read FFactorC3 write FFactorC3;
    property FactorC4: Double read FFactorC4 write FFactorC4;
    property SQI_Flag: Boolean read FSQI_Flag write FSQI_Flag;
    property CI_Flag: Boolean read FCI_Flag write FCI_Flag;
    property SIG_Flag: Boolean read FSIG_Flag write FSIG_Flag;
    property LOG_Flag: Boolean read FLOG_Flag write FLOG_Flag;
    property CCOR_Flag: Boolean read FCCOR_Flag write FCCOR_Flag;
  end;


  // ************************************************************************ //
  // Namespace : urn:DRX_Configuration_WS-IDRX_Configuration_WS
  // soapAction: urn:DRX_Configuration_WS-IDRX_Configuration_WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IDRX_Configuration_WSbinding
  // service   : IDRX_Configuration_WSservice
  // port      : IDRX_Configuration_WSPort
  // URL       : http://192.168.107.200:7788/soap/IDRX_Configuration_WS
  // ************************************************************************ //
  IDRX_Configuration_WS = interface(IInvokable)
  ['{3F38E698-F6FF-D865-B8EF-51DC7DEAD009}']
    function  Get_Configuration: TSettings; stdcall;
    function  Get_DRX_Dinamic_Range_LP: Integer; stdcall;
    function  Get_DRX_Dinamic_Range_SP: Integer; stdcall;
    function  Get_DRX_Sensibility_LP: Integer; stdcall;
    function  Get_DRX_Sensibility_SP: Integer; stdcall;
    function  Get_DRX_Table_LP: WideString; stdcall;
    function  Get_DRX_Table_SP: WideString; stdcall;
    procedure Set_DRX_Dinamic_Range_LP(const value: Integer); stdcall;
    procedure Set_DRX_Dinamic_Range_SP(const value: Integer); stdcall;
    procedure Set_DRX_Sensibility_LP(const value: Integer); stdcall;
    procedure Set_DRX_Sensibility_SP(const value: Integer); stdcall;
    procedure Set_DRX_Table_LP(const value: WideString); stdcall;
    procedure Set_DRX_Table_SP(const value: WideString); stdcall;
  end;

function GetIDRX_Configuration_WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IDRX_Configuration_WS;


implementation

function GetIDRX_Configuration_WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IDRX_Configuration_WS;
const
  defWSDL = 'http://192.168.107.200:7788/wsdl/IDRX_Configuration_WS';
  defURL  = 'http://192.168.107.200:7788/soap/IDRX_Configuration_WS';
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
  RemClassRegistry.RegisterXSClass(TSettings, 'urn:Site', 'TSettings');

end.