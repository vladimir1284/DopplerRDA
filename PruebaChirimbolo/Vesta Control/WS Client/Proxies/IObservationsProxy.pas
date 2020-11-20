// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/IObservationsWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:45:11 AM - 1.33.2.5)
// ************************************************************************ //

unit IObservationsProxy;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:TIntegerDynArray - "http://www.borland.com/namespaces/Types"
  // !:float           - "http://www.w3.org/2001/XMLSchema"

  FormatData           = class;                 { "urn:CommunicationObj" }
  TTemplateInfo        = class;                 { "urn:CommunicationObj" }

  { "urn:CommunicationObj" }
  DesignKindEnum = (dk_PPI, dk_RHI);

  { "urn:CommunicationObj" }
  TxPulseEnum = (tx_Pulse_Long, tx_Pulse_Short, tx_Pulse_None, tx_Pulse_Dual);

  { "urn:CommunicationObj" }
  TWaveLengthEnum = (wl_3cm, wl_10cm);



  // ************************************************************************ //
  // Namespace : urn:CommunicationObj
  // ************************************************************************ //
  FormatData = class(TRemotable)
  private
    FOnda: TWaveLengthEnum;
    FCeldas: Integer;
    FLong: Integer;
    FPotMet: Single;
  published
    property Onda: TWaveLengthEnum read FOnda write FOnda;
    property Celdas: Integer read FCeldas write FCeldas;
    property Long: Integer read FLong write FLong;
    property PotMet: Single read FPotMet write FPotMet;
  end;

  TFormatArray = array of FormatData;           { "urn:CommunicationObj" }


  // ************************************************************************ //
  // Namespace : urn:CommunicationObj
  // ************************************************************************ //
  TTemplateInfo = class(TRemotable)
  private
    FName: WideString;
    FFlags: Integer;
    FAddress: WideString;
    FFTPSettings: WideString;
    FPeriod: TXSDateTime;
    FDelay: TXSDateTime;
    FKind: DesignKindEnum;
    FStart: Integer;
    FFinish: Integer;
    FSpeed: Integer;
    FAngles: Integer;
    FFormats: Integer;
    FAutomatic: Boolean;
    FSentFTP: Boolean;
    FLastTime: TXSDateTime;
    FNextTime: TXSDateTime;
    FPulse: TxPulseEnum;
    FCH3cm_ManualAFC: Boolean;
    FCH3cm_StaloPower: Double;
    FCH3cm_StaloFreq: Integer;
    FCH3cm_NCO: Integer;
    FCH10cm_ManualAFC: Boolean;
    FCH10cm_StaloPower: Double;
    FCH10cm_StaloFreq: Integer;
    FCH10cm_NCO: Integer;
    FAngleList: TIntegerDynArray;
    FFormatList: TFormatArray;
  public
    destructor Destroy; override;
  published
    property Name: WideString read FName write FName;
    property Flags: Integer read FFlags write FFlags;
    property Address: WideString read FAddress write FAddress;
    property FTPSettings: WideString read FFTPSettings write FFTPSettings;
    property Period: TXSDateTime read FPeriod write FPeriod;
    property Delay: TXSDateTime read FDelay write FDelay;
    property Kind: DesignKindEnum read FKind write FKind;
    property Start: Integer read FStart write FStart;
    property Finish: Integer read FFinish write FFinish;
    property Speed: Integer read FSpeed write FSpeed;
    property Angles: Integer read FAngles write FAngles;
    property Formats: Integer read FFormats write FFormats;
    property Automatic: Boolean read FAutomatic write FAutomatic;
    property SentFTP: Boolean read FSentFTP write FSentFTP;
    property LastTime: TXSDateTime read FLastTime write FLastTime;
    property NextTime: TXSDateTime read FNextTime write FNextTime;
    property Pulse: TxPulseEnum read FPulse write FPulse;
    property CH3cm_ManualAFC: Boolean read FCH3cm_ManualAFC write FCH3cm_ManualAFC;
    property CH3cm_StaloPower: Double read FCH3cm_StaloPower write FCH3cm_StaloPower;
    property CH3cm_StaloFreq: Integer read FCH3cm_StaloFreq write FCH3cm_StaloFreq;
    property CH3cm_NCO: Integer read FCH3cm_NCO write FCH3cm_NCO;
    property CH10cm_ManualAFC: Boolean read FCH10cm_ManualAFC write FCH10cm_ManualAFC;
    property CH10cm_StaloPower: Double read FCH10cm_StaloPower write FCH10cm_StaloPower;
    property CH10cm_StaloFreq: Integer read FCH10cm_StaloFreq write FCH10cm_StaloFreq;
    property CH10cm_NCO: Integer read FCH10cm_NCO write FCH10cm_NCO;
    property AngleList: TIntegerDynArray read FAngleList write FAngleList;
    property FormatList: TFormatArray read FFormatList write FFormatList;
  end;


  // ************************************************************************ //
  // Namespace : urn:ObservationsWSIntf-IObservationsWS
  // soapAction: urn:ObservationsWSIntf-IObservationsWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : IObservationsWSbinding
  // service   : IObservationsWSservice
  // port      : IObservationsWSPort
  // URL       : http://localhost:8888/soap/IObservationsWS
  // ************************************************************************ //
  IObservationsWS = interface(IInvokable)
  ['{7EC4E564-CBC3-DE95-D4A1-01395292B708}']
    function  Get_Plantillas: Integer; stdcall;
    procedure Ejecutar(const Name: WideString); stdcall;
    function  Plantilla(const Index: Integer): TTemplateInfo; stdcall;
    function  Buscar(const Name: WideString): TTemplateInfo; stdcall;
    procedure ChequearRadar; stdcall;
    procedure Borrar(const Name: WideString); stdcall;
    function  Nueva: TTemplateInfo; stdcall;
    function  Control(const Name: WideString): TTemplateInfo; stdcall;
    function  Clonar(const TemplateName: WideString): TTemplateInfo; stdcall;
    procedure Save(const Template: TTemplateInfo); stdcall;
    procedure Automatica(const TemplateName: WideString; const Value: Boolean); stdcall;
    function  Get_InProgress: Boolean; stdcall;
    function  Get_Name: WideString; stdcall;
    function  Get_Client: WideString; stdcall;
    function  Get_StartTime: TXSDateTime; stdcall;
    function  Get_LastTime: TXSDateTime; stdcall;
    function  Get_Progress: Integer; stdcall;
    function  Get_Message: WideString; stdcall;
    function  Get_SubMsg: WideString; stdcall;
    function  Get_Result: Integer; stdcall;
    procedure Cancel; stdcall;
  end;

function GetIObservationsWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IObservationsWS;


implementation

function GetIObservationsWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IObservationsWS;
const
  defWSDL = 'http://localhost:8888/wsdl/IObservationsWS';
  defURL  = 'http://localhost:8888/soap/IObservationsWS';
  defSvc  = 'IObservationsWSservice';
  defPrt  = 'IObservationsWSPort';
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
    Result := (RIO as IObservationsWS);
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


destructor TTemplateInfo.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FFormatList)-1 do
    if Assigned(FFormatList[I]) then
      FFormatList[I].Free;
  SetLength(FFormatList, 0);
  if Assigned(FPeriod) then
    FPeriod.Free;
  if Assigned(FDelay) then
    FDelay.Free;
  if Assigned(FLastTime) then
    FLastTime.Free;
  if Assigned(FNextTime) then
    FNextTime.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(IObservationsWS), 'urn:ObservationsWSIntf-IObservationsWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IObservationsWS), 'urn:ObservationsWSIntf-IObservationsWS#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(DesignKindEnum), 'urn:CommunicationObj', 'DesignKindEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TxPulseEnum), 'urn:CommunicationObj', 'TxPulseEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TWaveLengthEnum), 'urn:CommunicationObj', 'TWaveLengthEnum');
  RemClassRegistry.RegisterXSClass(FormatData, 'urn:CommunicationObj', 'FormatData');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TFormatArray), 'urn:CommunicationObj', 'TFormatArray');
  RemClassRegistry.RegisterXSClass(TTemplateInfo, 'urn:CommunicationObj', 'TTemplateInfo');

end.