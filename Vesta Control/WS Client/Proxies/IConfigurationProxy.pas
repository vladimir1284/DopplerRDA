// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IConfigurationWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:44:55 AM - 1.33.2.5)
// ************************************************************************ //

unit IConfigurationProxy;

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
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:unsignedShort   - "http://www.w3.org/2001/XMLSchema"
  // !:TWordDynArray   - "http://www.borland.com/namespaces/Types"
  // !:TDoubleDynArray - "http://www.borland.com/namespaces/Types"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:float           - "http://www.w3.org/2001/XMLSchema"

  TDataFilter          = class;                 { "urn:DRX_WS" }

  { "urn:CommunicationObj" }
  RadarBrandsEnum = (rbUnknown, rbMRL5, rbRC32B, rbMRL5M, rbResearch);



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
  // Namespace : urn:ConfigurationWSIntf-IConfigurationWS
  // soapAction: urn:ConfigurationWSIntf-IConfigurationWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IConfigurationWSbinding
  // service   : IConfigurationWSservice
  // port      : IConfigurationWSPort
  // URL       : http://localhost:8888/soap/IConfigurationWS
  // ************************************************************************ //
  IConfigurationWS = interface(IInvokable)
  ['{3FDEAEC7-6D93-A1AF-1033-0FD96137CF1E}']
    function  Get_Filter(const Index: Integer): TDataFilter; stdcall;
    function  Get_FilterCount: Integer; stdcall;
    function  Get_DefaultFilter: Integer; stdcall;
    function  Get_FilterAngle: Double; stdcall;
    function  Get_FilterHeigh: Integer; stdcall;
    function  Get_FilterDistance: Integer; stdcall;
    function  Get_FilterSQI: Boolean; stdcall;
    function  Get_FilterCI: Boolean; stdcall;
    function  Get_FilterSIG: Boolean; stdcall;
    function  Get_FilterLOG: Boolean; stdcall;
    function  Get_FilterCCOR: Boolean; stdcall;
    function  Get_AIGains: TWordDynArray; stdcall;
    function  Get_AIFactors: TDoubleDynArray; stdcall;
    function  Get_Radar_ID: Integer; stdcall;
    function  Get_Obs_Directory: WideString; stdcall;
    function  Get_Beam_Ch1: Single; stdcall;
    function  Get_Beam_Ch2: Single; stdcall;
    function  Get_Speed_Accuracy: Integer; stdcall;
    function  Get_Angle_Accuracy: Integer; stdcall;
    function  Get_Pack_Method: Integer; stdcall;
    function  Get_Timeout_TxRx: Integer; stdcall;
    function  Get_Speckle_Remove: Boolean; stdcall;
    function  Get_Save_Variance: Boolean; stdcall;
    function  Get_AngleCodeRate: Integer; stdcall;
    function  Get_AngleClockwiseRotationX: Boolean; stdcall;
    function  Get_AngleClockwiseRotationY: Boolean; stdcall;
    function  Get_AngleClockwiseRotationZ: Boolean; stdcall;
    function  Get_SpeckleUmbral: Integer; stdcall;
    function  Get_RadarName(const RadarId: Integer): WideString; stdcall;
    function  Get_RadarOwner(const RadarId: Integer): WideString; stdcall;
    function  Get_RadarRange(const RadarId: Integer): Integer; stdcall;
    function  Get_RadarLatitude(const RadarId: Integer): Single; stdcall;
    function  Get_RadarLongitude(const RadarId: Integer): Single; stdcall;
    function  Get_RadarAltitude(const RadarId: Integer): Single; stdcall;
    function  Get_RadarBrand(const RadarId: Integer): RadarBrandsEnum; stdcall;
    function  Get_SendMsgOnError: Boolean; stdcall;
    function  Get_TargetAddress: WideString; stdcall;
    function  Get_SMTPServer: WideString; stdcall;
    function  Get_SMTPUser: WideString; stdcall;
    function  Get_SMTPPassword: WideString; stdcall;
    function  Get_SMTPPort: Integer; stdcall;
    function  Get_SMTPFromAddress: WideString; stdcall;
    function  Get_ContinuosRegime: Boolean; stdcall;
    procedure Set_ContinuosRegime(const Value: Boolean); stdcall;
    function  Get_Timeout_Radar: Integer; stdcall;
    procedure Set_Timeout_Radar(const Value: Integer); stdcall;
    function  Get_Automatic_Obs: Boolean; stdcall;
    procedure Set_Automatic_Obs(const Value: Boolean); stdcall;
    function  Get_Auto_Power_Off: Boolean; stdcall;
    procedure Set_Auto_Power_Off(const Value: Boolean); stdcall;
    function  Get_WarmTime_Radar: Integer; stdcall;
    procedure Set_WarmTime_Radar(const Value: Integer); stdcall;
    function  Get_RestTime_Radar: Integer; stdcall;
    procedure Set_RestTime_Radar(const Value: Integer); stdcall;
    function  Get_RadarTemperature: Double; stdcall;
    function  Get_RadarPressure: Double; stdcall;
    function  Get_CheckPPIParam: Boolean; stdcall;
    procedure SaveConfig; stdcall;
    procedure SaveAllConfig; stdcall;
    procedure Set_AIGains(const Gains: TWordDynArray); stdcall;
    procedure Set_AIFactors(const Factors: TDoubleDynArray); stdcall;
    procedure Set_Radar_ID(const value: Integer); stdcall;
    procedure Set_Obs_Directory(const value: WideString); stdcall;
    procedure Set_Beam_Ch1(const value: Single); stdcall;
    procedure Set_Beam_Ch2(const value: Single); stdcall;
    procedure Set_Speed_Accuracy(const value: Integer); stdcall;
    procedure Set_Angle_Accuracy(const value: Integer); stdcall;
    procedure Set_Pack_Method(const value: Integer); stdcall;
    procedure Set_Timeout_TxRx(const value: Integer); stdcall;
    procedure Set_Speckle_Remove(const value: Boolean); stdcall;
    procedure Set_Save_Variance(const value: Boolean); stdcall;
    procedure Set_AngleCodeRate(const value: Integer); stdcall;
    procedure Set_AngleClockwiseRotationX(const value: Boolean); stdcall;
    procedure Set_AngleClockwiseRotationY(const value: Boolean); stdcall;
    procedure Set_AngleClockwiseRotationZ(const value: Boolean); stdcall;
    procedure Set_SpeckleUmbral(const value: Integer); stdcall;
    procedure Set_SMTPPort(const value: Integer); stdcall;
    procedure Set_SMTPUser(const value: WideString); stdcall;
    procedure Set_SMTPPassword(const value: WideString); stdcall;
    procedure Set_SendMsgOnError(const value: Boolean); stdcall;
    procedure Set_TargetAddress(const value: WideString); stdcall;
    procedure Set_SMTPServer(const value: WideString); stdcall;
    function  TestSMTPConfig: Boolean; stdcall;
    function  SendTestEMail: Boolean; stdcall;
    procedure Set_SMTPFromAddress(const value: WideString); stdcall;
    procedure Set_RadarTemperature(const value: Double); stdcall;
    procedure Set_RadarPressure(const value: Double); stdcall;
    procedure Set_CheckPPIParam(const value: Boolean); stdcall;
    procedure SetFilter(const Index: Integer; const Filter: TDataFilter); stdcall;
    procedure Set_FilterCount(const Value: Integer); stdcall;
    procedure Set_DefaultFilter(const Value: Integer); stdcall;
    procedure Set_FilterAngle(const Value: Double); stdcall;
    procedure Set_FilterHeigh(const Value: Integer); stdcall;
    procedure Set_FilterDistance(const Value: Integer); stdcall;
    procedure Set_FilterSQI(const Value: Boolean); stdcall;
    procedure Set_FilterCI(const Value: Boolean); stdcall;
    procedure Set_FilterSIG(const Value: Boolean); stdcall;
    procedure Set_FilterLOG(const Value: Boolean); stdcall;
    procedure Set_FilterCCOR(const Value: Boolean); stdcall;
    function  RadarName: WideString; stdcall;
    function  RadarOwner: WideString; stdcall;
    function  RadarRange: Integer; stdcall;
    function  RadarLatitude: Single; stdcall;
    function  RadarLongitude: Single; stdcall;
    function  RadarAltitude: Single; stdcall;
    function  RadarBrand: RadarBrandsEnum; stdcall;
  end;

function GetIConfigurationWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IConfigurationWS;


implementation

function GetIConfigurationWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IConfigurationWS;
const
  defWSDL = 'http://localhost:8888/wsdl/IConfigurationWS';
  defURL  = 'http://localhost:8888/soap/IConfigurationWS';
  defSvc  = 'IConfigurationWSservice';
  defPrt  = 'IConfigurationWSPort';
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
    Result := (RIO as IConfigurationWS);
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
  InvRegistry.RegisterInterface(TypeInfo(IConfigurationWS), 'urn:ConfigurationWSIntf-IConfigurationWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IConfigurationWS), 'urn:ConfigurationWSIntf-IConfigurationWS#%operationName%');
  RemClassRegistry.RegisterXSClass(TDataFilter, 'urn:DRX_WS', 'TDataFilter');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RadarBrandsEnum), 'urn:CommunicationObj', 'RadarBrandsEnum');

end.