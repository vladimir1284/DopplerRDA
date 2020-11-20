// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/ICalibrationCH1WS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:43:05 AM - 1.33.2.5)
// ************************************************************************ //

unit ICalibrationCH1Proxy;

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
  // !:float           - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:CalibrationCH1WSIntf-ICalibrationCH1WS
  // soapAction: urn:CalibrationCH1WSIntf-ICalibrationCH1WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ICalibrationCH1WSbinding
  // service   : ICalibrationCH1WSservice
  // port      : ICalibrationCH1WSPort
  // URL       : http://localhost:8888/soap/ICalibrationCH1WS
  // ************************************************************************ //
  ICalibrationCH1WS = interface(IInvokable)
  ['{8143E5A0-8B93-BF8E-0D91-6EBCD28CE57C}']
    function  Get_Potencia: Integer; stdcall;
    function  Get_CRadarPL: Single; stdcall;
    function  Get_CRadarPC: Single; stdcall;
    function  Get_PotMetPL: Single; stdcall;
    function  Get_PotMetPC: Single; stdcall;
    function  Get_MPS_Voltage: Double; stdcall;
    function  Get_Tx_Pulse_SP: Integer; stdcall;
    function  Get_Tx_Pulse_LP: Integer; stdcall;
    function  Get_Start_Sample_SP: Integer; stdcall;
    function  Get_Final_Sample_SP: Integer; stdcall;
    function  Get_Start_Sample_LP: Integer; stdcall;
    function  Get_Final_Sample_LP: Integer; stdcall;
    function  Get_Tx_Factor: Double; stdcall;
    function  Get_Stalo_Delay: Integer; stdcall;
    function  Get_Stalo_Step: Integer; stdcall;
    function  Get_Stalo_Width: Integer; stdcall;
    function  Get_Valid_tx_power: Double; stdcall;
    function  Get_Loop_Gain: Double; stdcall;
    procedure Set_Potencia(const Value: Integer); stdcall;
    procedure Set_CRadarPL(const Value: Single); stdcall;
    procedure Set_CRadarPC(const Value: Single); stdcall;
    procedure Set_MPS_Voltage(const Value: Double); stdcall;
    procedure Set_Tx_Pulse_SP(const Value: Integer); stdcall;
    procedure Set_Tx_Pulse_LP(const Value: Integer); stdcall;
    procedure Set_Start_Sample_SP(const Value: Integer); stdcall;
    procedure Set_Final_Sample_SP(const Value: Integer); stdcall;
    procedure Set_Start_Sample_LP(const Value: Integer); stdcall;
    procedure Set_Final_Sample_LP(const Value: Integer); stdcall;
    procedure Set_Tx_Factor(const Value: Double); stdcall;
    procedure Set_Stalo_Delay(const Value: Integer); stdcall;
    procedure Set_Stalo_Step(const Value: Integer); stdcall;
    procedure Set_Stalo_Width(const Value: Integer); stdcall;
    procedure Set_Valid_tx_power(const Value: Double); stdcall;
    procedure Set_Loop_Gain(const Value: Double); stdcall;
    procedure SaveDRX; stdcall;
  end;

function GetICalibrationCH1WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ICalibrationCH1WS;


implementation

function GetICalibrationCH1WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ICalibrationCH1WS;
const
  defWSDL = 'http://localhost:8888/wsdl/ICalibrationCH1WS';
  defURL  = 'http://localhost:8888/soap/ICalibrationCH1WS';
  defSvc  = 'ICalibrationCH1WSservice';
  defPrt  = 'ICalibrationCH1WSPort';
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
    Result := (RIO as ICalibrationCH1WS);
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
  InvRegistry.RegisterInterface(TypeInfo(ICalibrationCH1WS), 'urn:CalibrationCH1WSIntf-ICalibrationCH1WS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ICalibrationCH1WS), 'urn:CalibrationCH1WSIntf-ICalibrationCH1WS#%operationName%');

end.