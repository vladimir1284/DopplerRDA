// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/IConfigurationWS
// Encoding : utf-8
// Version  : 1.0
// (5/5/2011 2:55:22 PM - 1.33.2.5)
// ************************************************************************ //

unit ConfigurationWS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  // ************************************************************************ //
  // Namespace : urn:ConfigurationWSIntf-IConfigurationWS
  // soapAction: urn:ConfigurationWSIntf-IConfigurationWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IConfigurationWSbinding
  // service   : IConfigurationWSservice
  // port      : IConfigurationWSPort
  // URL       : http://localhost:9999/soap/IConfigurationWS
  // ************************************************************************ //
  IConfigurationWS = interface(IInvokable)
  ['{3FDEAEC7-6D93-A1AF-1033-0FD96137CF1E}']
    function  Get_Osciloscope_Port: Cardinal; stdcall;
    function  Get_Radar_ID: Integer; stdcall;
    function  Get_Obs_Directory: WideString; stdcall;
    function  Get_Beam_Ch1: Single; stdcall;
    function  Get_Beam_Ch2: Single; stdcall;
    function  Get_Speed_Accuracy: Integer; stdcall;
    function  Get_Angle_Accuracy: Integer; stdcall;
    function  Get_Pack_Method: Integer; stdcall;
    function  Get_Timeout_TxRx: Integer; stdcall;
    function  Get_Clutter_Clear: Boolean; stdcall;
    function  Get_Clutter_Cells: Integer; stdcall;
    function  Get_Clutter_Threshold1: Integer; stdcall;
    function  Get_Clutter_Threshold2: Integer; stdcall;
    function  Get_Speckle_Remove: Boolean; stdcall;
    function  Get_Save_Variance: Boolean; stdcall;
    function  Get_N1Source: Integer; stdcall;
    function  Get_PLRate: Integer; stdcall;
    function  Get_PCRate: Integer; stdcall;
    function  Get_SampleRate: Integer; stdcall;
    function  Get_Ch1Port: Integer; stdcall;
    function  Get_Ch2Port: Integer; stdcall;
    function  Get_AngleCodeRate: Integer; stdcall;
    function  Get_AngleClockwiseRotationX: Boolean; stdcall;
    function  Get_AngleClockwiseRotationY: Boolean; stdcall;
    function  Get_AngleClockwiseRotationZ: Boolean; stdcall;
    function  Get_PCTimes: TWordDynArray; stdcall;
    function  Get_PLTimes: TWordDynArray; stdcall;
    function  Get_AIGains: TWordDynArray; stdcall;
    function  Get_VideoGains: TWordDynArray; stdcall;
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
    function  Get_SpeckleUmbralAz: Integer; stdcall;
    function  Get_SpeckleRemoveAz: Boolean; stdcall;
    function  Get_ClockSource: Boolean; stdcall;
    procedure SaveConfig; stdcall;
    procedure SaveAllConfig; stdcall;
    procedure Set_Osciloscope_Port(const value: Cardinal); stdcall;
    procedure Set_Radar_ID(const value: Integer); stdcall;
    procedure Set_Obs_Directory(const value: WideString); stdcall;
    procedure Set_Beam_Ch1(const value: Single); stdcall;
    procedure Set_Beam_Ch2(const value: Single); stdcall;
    procedure Set_Speed_Accuracy(const value: Integer); stdcall;
    procedure Set_Angle_Accuracy(const value: Integer); stdcall;
    procedure Set_Pack_Method(const value: Integer); stdcall;
    procedure Set_Timeout_TxRx(const value: Integer); stdcall;
    procedure Set_Clutter_Clear(const value: Boolean); stdcall;
    procedure Set_Clutter_Cells(const value: Integer); stdcall;
    procedure Set_Clutter_Threshold1(const value: Integer); stdcall;
    procedure Set_Clutter_Threshold2(const value: Integer); stdcall;
    procedure Set_Speckle_Remove(const value: Boolean); stdcall;
    procedure Set_Save_Variance(const value: Boolean); stdcall;
    procedure Set_N1Source(const value: Integer); stdcall;
    procedure Set_PLRate(const value: Integer); stdcall;
    procedure Set_PCRate(const value: Integer); stdcall;
    procedure Set_SampleRate(const value: Integer); stdcall;
    procedure Set_Ch1Port(const value: Integer); stdcall;
    procedure Set_Ch2Port(const value: Integer); stdcall;
    procedure Set_AngleCodeRate(const value: Integer); stdcall;
    procedure Set_AngleClockwiseRotationX(const value: Boolean); stdcall;
    procedure Set_AngleClockwiseRotationY(const value: Boolean); stdcall;
    procedure Set_AngleClockwiseRotationZ(const value: Boolean); stdcall;
    procedure Set_PCTimes(const Times: TWordDynArray); stdcall;
    procedure Set_PLTimes(const Times: TWordDynArray); stdcall;
    procedure Set_AIGains(const Gains: TWordDynArray); stdcall;
    procedure Set_VideoGains(const Gains: TWordDynArray); stdcall;
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
    procedure Set_SpeckleRemoveAz(const value: Boolean); stdcall;
    procedure Set_SpeckleUmbralAz(const value: Integer); stdcall;
    procedure Set_ClockSource(const value: Boolean); stdcall;
    function  RadarName: WideString; stdcall;
    function  RadarOwner: WideString; stdcall;
    function  RadarRange: Integer; stdcall;
    function  RadarLatitude: Single; stdcall;
    function  RadarLongitude: Single; stdcall;
    function  RadarAltitude: Single; stdcall;
    function  RadarBrand: RadarBrandsEnum; stdcall;

    property Osciloscope_Port: cardinal                read Get_Osciloscope_Port             write Set_Osciloscope_Port;
    property Radar_ID: Integer                         read Get_Radar_ID                     write Set_Radar_ID;
    property Obs_Directory: WideString                 read Get_Obs_Directory                write Set_Obs_Directory;
    property Beam_Ch1: Single                          read Get_Beam_Ch1                     write Set_Beam_Ch1;
    property Beam_Ch2: Single                          read Get_Beam_Ch2                     write Set_Beam_Ch2;
    property Speed_Accuracy: Integer                   read Get_Speed_Accuracy               write Set_Speed_Accuracy;
    property Angle_Accuracy: Integer                   read Get_Angle_Accuracy               write Set_Angle_Accuracy;
    property Pack_Method: Integer                      read Get_Pack_Method                  write Set_Pack_Method;
    property Timeout_TxRx: Integer                     read Get_Timeout_TxRx                 write Set_Timeout_TxRx;
    property Clutter_Clear: boolean                    read Get_Clutter_Clear                write Set_Clutter_Clear;
    property Clutter_Cells: Integer                    read Get_Clutter_Cells                write Set_Clutter_Cells;
    property Clutter_Threshold1: Integer               read Get_Clutter_Threshold1           write Set_Clutter_Threshold1;
    property Clutter_Threshold2: Integer               read Get_Clutter_Threshold2           write Set_Clutter_Threshold2;
    property Speckle_Remove: boolean                   read Get_Speckle_Remove               write Set_Speckle_Remove;
    property Save_Variance: boolean                    read Get_Save_Variance                write Set_Save_Variance;
    property N1Source: Integer                         read Get_N1Source                     write Set_N1Source;
    property PLRate: Integer                           read Get_PLRate                       write Set_PLRate;
    property PCRate: Integer                           read Get_PCRate                       write Set_PCRate;
    property SampleRate: Integer                       read Get_SampleRate                   write Set_SampleRate;
    property Ch1Port: Integer                          read Get_Ch1Port                      write Set_Ch1Port;
    property Ch2Port: Integer                          read Get_Ch2Port                      write Set_Ch2Port;
    property AngleCodeRate: Integer                    read Get_AngleCodeRate                write Set_AngleCodeRate;
    property AngleClockwiseRotationX: boolean          read Get_AngleClockwiseRotationX      write Set_AngleClockwiseRotationX;
    property AngleClockwiseRotationY: boolean          read Get_AngleClockwiseRotationY      write Set_AngleClockwiseRotationY;
    property AngleClockwiseRotationZ: boolean          read Get_AngleClockwiseRotationZ      write Set_AngleClockwiseRotationZ;
    property SpeckleUmbral: Integer                    read Get_SpeckleUmbral                write Set_SpeckleUmbral;
    property ContinuosRegime: boolean                  read Get_ContinuosRegime              write Set_ContinuosRegime;
    property Timeout_Radar: Integer                    read Get_Timeout_Radar                write Set_Timeout_Radar;
    property Automatic_Obs: boolean                    read Get_Automatic_Obs                write Set_Automatic_Obs;
    property Auto_Power_Off: boolean                   read Get_Auto_Power_Off               write Set_Auto_Power_Off;
    property WarmTime_Radar: Integer                   read Get_WarmTime_Radar               write Set_WarmTime_Radar;
    property RestTime_Radar: Integer                   read Get_RestTime_Radar               write Set_RestTime_Radar;
    property RadarTemperature: Double                  read Get_RadarTemperature             write Set_RadarTemperature;
    property RadarPressure: Double                     read Get_RadarPressure                write Set_RadarPressure;
    property CheckPPIParam: boolean                    read Get_CheckPPIParam                write Set_CheckPPIParam;
    property SpeckleUmbralAz: Integer                  read Get_SpeckleUmbralAz              write Set_SpeckleUmbralAz;
    property SpeckleRemoveAz: boolean                  read Get_SpeckleRemoveAz              write Set_SpeckleRemoveAz;
    property ClockSource: boolean                      read Get_ClockSource                  write Set_ClockSource;
    property SendMsgOnError: boolean                   read Get_SendMsgOnError               write Set_SendMsgOnError;
    property TargetAddress: WideString                 read Get_TargetAddress                write Set_TargetAddress;
    property SMTPServer: WideString                    read Get_SMTPServer                   write Set_SMTPServer;
    property SMTPUser: WideString                      read Get_SMTPUser                     write Set_SMTPUser;
    property SMTPPassword: WideString                  read Get_SMTPPassword                 write Set_SMTPPassword;
    property SMTPPort: Integer                         read Get_SMTPPort                     write Set_SMTPPort;
    property SMTPFromAddress: WideString               read Get_SMTPFromAddress              write Set_SMTPFromAddress;
  end;

function GetIConfigurationWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IConfigurationWS;


implementation

function GetIConfigurationWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IConfigurationWS;
const
  defWSDL = 'http://localhost:9999/wsdl/IConfigurationWS';
  defURL  = 'http://localhost:9999/soap/IConfigurationWS';
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
end.
