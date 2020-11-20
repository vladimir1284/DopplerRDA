unit CommonObjs;

interface

uses
  InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  tf_Create_Dir    = 1;
  tf_Include_Radar = 2;
  tf_Include_Year  = 4;
  tf_Include_Month = 8;
  tf_Include_Day   = $10;

// User levels
  ul_God        = 9;
  ul_Author     = 8;
  ul_Supervisor = 7;
  ul_Service    = 6;
  ul_Designer   = 5;
  ul_Operator   = 4;
  ul_Guest      = 3;
  ul_NotLogged  = 2;
  ul_NotUser    = 1;
  ul_Failed     = 0;

type
  MaxMin = packed record
    Min: Smallint;
    Max: Smallint;
  end;
  
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
  // !:unsignedInt     - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:TIntegerDynArray - "http://www.borland.com/namespaces/Types"
  // !:float           - "http://www.w3.org/2001/XMLSchema"
  // !:TStringDynArray - "http://www.borland.com/namespaces/Types"

  TxRxInfo             = class;                 { "urn:CommunicationObj" }
  FormatData           = class;                 { "urn:CommunicationObj" }
  TTemplateInfo        = class;                 { "urn:CommunicationObj" }

  { "urn:CommunicationObj" }
  DesignKindEnum = (dk_PPI, dk_RHI);

  { "urn:CommunicationObj" }
  TxPulseEnum = (tx_Pulse_Long, tx_Pulse_Short, tx_Pulse_None);

  { "urn:CommunicationObj" }
  TxRxOptionsEnum = (xo_No, xo_Yes, xo_Nevermind);

  { "urn:CommunicationObj" }
  TWaveLengthEnum = (wl_3cm, wl_10cm);

  { "urn:CommunicationObj" }
  RadarBrandsEnum  = (rbUnknown, rbMRL5, rbRC32B, rbMRL5M, rbResearch);

  { "urn:CommunicationObj" }
  TSyncSourceEnum = (ss_Internal, ss_External_Digital, ss_Analog_Raising_Edge, ss_Analog_Falling_Edge);

  // ************************************************************************ //
  // Namespace : urn:LoginWSIntf
  // ************************************************************************ //
  TUserInfo = class(TRemotable)
  private
    FName: WideString;
    FLevel: Integer;
  published
    property Name: WideString read FName write FName;
    property Level: Integer read FLevel write FLevel;
  end;

  // ************************************************************************ //
  // Namespace : urn:CommunicationObj
  // ************************************************************************ //
  TAuthHeader = class(TSOAPHeader)
  private
    FUserName: WideString;
    FToken: WideString;
    FLevel: Integer;
  published
    property UserName: WideString read FUserName write FUserName;
    property Token: WideString read FToken write FToken;
    property Level: Integer read FLevel write FLevel;
  end;

  // ************************************************************************ //
  // Namespace : urn:CommonObjs
  // ************************************************************************ //
  TCyclopAuthHeader = class(TSOAPHeader)
  private
    FUserName: WideString;
    FToken: WideString;
  published
    property UserName: WideString read FUserName write FUserName;
    property Token: WideString read FToken write FToken;
  end;  

  // ************************************************************************ //
  // Namespace : urn:CommunicationObj
  // ************************************************************************ //
  TxRxInfo = class(TRemotable)
  private
    FCRT: TxRxOptionsEnum;
    FCMG: TxRxOptionsEnum;
    FCMS: TxRxOptionsEnum;
  published
    property CRT: TxRxOptionsEnum read FCRT write FCRT;
    property CMG: TxRxOptionsEnum read FCMG write FCMG;
    property CMS: TxRxOptionsEnum read FCMS write FCMS;
  end;

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
    FADRate: Cardinal;
    FSectors: Integer;
    FPulse: TxPulseEnum;
    FTR1: TxRxInfo;
    FTR2: TxRxInfo;
    FCH10cm_B0: Double;
    FCH10cm_B1: Double;
    FCH10cm_B2: Double;
    FCH10cm_A1: Double;
    FCH10cm_A2: Double;
    FCH3cm_B0: Double;
    FCH3cm_B1: Double;
    FCH3cm_B2: Double;
    FCH3cm_A1: Double;
    FCH3cm_A2: Double;
    FFilter: Boolean;
    FSaveFilter: Boolean;
    FApplyFilter: Boolean;
    FCH10cm_Threshold: Double;
    FCH3cm_Threshold: Double;
    FMaxAngleEchoFilter: Double;
    FMaxHeightEchoFilter: Integer;
    FMaxDistanceEchoFilter: Integer;
    FAngleList: TIntegerDynArray;
    FFormatList: TFormatArray;
  private
    procedure SetAutomatic(const Value: boolean);
    procedure SetLastTime(const Value: TXSDateTime);
    procedure SetAngles(const Value: integer);
    procedure SetFormats(const Value: integer);
  public
    constructor Create; override;
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
    property Angles: Integer read FAngles write SetAngles;
    property Formats: Integer read FFormats write SetFormats;
    property Automatic: Boolean read FAutomatic write SetAutomatic;
    property SentFTP: Boolean read FSentFTP write FSentFTP;
    property LastTime: TXSDateTime read FLastTime write SetLastTime;
    property NextTime: TXSDateTime read FNextTime write FNextTime;
    property ADRate: Cardinal read FADRate write FADRate;
    property Sectors: Integer read FSectors write FSectors;
    property Pulse: TxPulseEnum read FPulse write FPulse;
    property TR1: TxRxInfo read FTR1 write FTR1;
    property TR2: TxRxInfo read FTR2 write FTR2;
    property CH10cm_B0: Double read FCH10cm_B0 write FCH10cm_B0;
    property CH10cm_B1: Double read FCH10cm_B1 write FCH10cm_B1;
    property CH10cm_B2: Double read FCH10cm_B2 write FCH10cm_B2;
    property CH10cm_A1: Double read FCH10cm_A1 write FCH10cm_A1;
    property CH10cm_A2: Double read FCH10cm_A2 write FCH10cm_A2;
    property CH3cm_B0: Double read FCH3cm_B0 write FCH3cm_B0;
    property CH3cm_B1: Double read FCH3cm_B1 write FCH3cm_B1;
    property CH3cm_B2: Double read FCH3cm_B2 write FCH3cm_B2;
    property CH3cm_A1: Double read FCH3cm_A1 write FCH3cm_A1;
    property CH3cm_A2: Double read FCH3cm_A2 write FCH3cm_A2;
    property Filter: Boolean read FFilter write FFilter;
    property SaveFilter: Boolean read FSaveFilter write FSaveFilter;
    property ApplyFilter: Boolean read FApplyFilter write FApplyFilter;
    property CH10cm_Threshold: Double read FCH10cm_Threshold write FCH10cm_Threshold;
    property CH3cm_Threshold: Double read FCH3cm_Threshold write FCH3cm_Threshold;
    property MaxAngleEchoFilter: Double read FMaxAngleEchoFilter write FMaxAngleEchoFilter;
    property MaxHeightEchoFilter: Integer read FMaxHeightEchoFilter write FMaxHeightEchoFilter;
    property MaxDistanceEchoFilter: Integer read FMaxDistanceEchoFilter write FMaxDistanceEchoFilter;
    property AngleList: TIntegerDynArray read FAngleList write FAngleList;
    property FormatList: TFormatArray read FFormatList write FFormatList;
  end;

  // ************************************************************************ //
  // Namespace : urn:CommunicationObj
  // ************************************************************************ //
  TChannelsData = class(TRemotable)
  public
    FCh1Data: TCardinalDynArray;
    FCh2Data: TCardinalDynArray;
  published
    property Ch1Data: TCardinalDynArray read FCh1Data write FCh1Data;
    property Ch2Data: TCardinalDynArray read FCh2Data write FCh2Data;
  end;

  // ************************************************************************ //
  // Namespace : urn:CommunicationObj
  // ************************************************************************ //
  TLogEntry = class(TRemotable)
  private
    FMsgCode: Integer;
    FDateTime: TXSDateTime;
    FCategory: Integer;
    FClient: WideString;
    FTitle: WideString;
    FMsg: WideString;
    FZone: WideString;
  public
    destructor Destroy; override;
  published
    property MsgCode: Integer read FMsgCode write FMsgCode;
    property DateTime: TXSDateTime read FDateTime write FDateTime;
    property Category: Integer read FCategory write FCategory;
    property Client: WideString read FClient write FClient;
    property Title: WideString read FTitle write FTitle;
    property Msg: WideString read FMsg write FMsg;
    property Zone: WideString read FZone write FZone;
  end;

  TCalibrationTable = class(TRemotable)
  private
    FData: TWordDynArray;
    FRange: Integer;
    FSensibility: Integer;
  public
    constructor Init(Range : integer; Sensibility : integer);
  published
    property Data: TWordDynArray read FData write FData;
    property Range: Integer read FRange write FRange;
    property Sensibility: Integer read FSensibility write FSensibility;
  end;

implementation

uses
  SysUtils;

constructor TTemplateInfo.Create;
begin
  inherited Create;
  fTR1 := TxRxInfo.Create;
  fTR2 := TxRxInfo.Create;
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
  if Assigned(FTR1) then
    FTR1.Free;
  if Assigned(FTR2) then
    FTR2.Free;
  inherited Destroy;
end;

procedure TTemplateInfo.SetAngles(const Value: integer);
begin
  fAngles := Value;
  SetLength(fAngleList, Value);
end;

procedure TTemplateInfo.SetAutomatic(const Value: boolean);
begin
  fAutomatic := Value;
  if(fNextTime = nil)
    then fNextTime := TXSDateTime.Create;
  if fAutomatic
    then fNextTime.AsDateTime := fPeriod.AsDateTime * (trunc(Now/fPeriod.AsDateTime) + 1) + fDelay.AsDateTime
    else fNextTime.AsDateTime := 0;
end;

procedure TTemplateInfo.SetFormats(const Value: integer);
var
  i : integer;
begin
  fFormats := Value;
  SetLength(fFormatList, Value);
  for i := Low(fFormatList) to High(fFormatList) do
    if(fFormatList[i] = nil)
      then fFormatList[i] := FormatData.Create;
end;

procedure TTemplateInfo.SetLastTime(const Value: TXSDateTime);
begin
  fLastTime := Value;
  if(fNextTime = nil)
    then fNextTime := TXSDateTime.Create;
  fNextTime.AsDateTime := fPeriod.AsDateTime * (trunc(fLastTime.AsDateTime/fPeriod.AsDateTime) + 1) + fDelay.AsDateTime;
end;

{ TLogEntry }

destructor TLogEntry.Destroy;
begin
  if Assigned(FDateTime) then
    FDateTime.Free;

  inherited;
end;

{ TCalibrationTable }

constructor TCalibrationTable.Init(Range, Sensibility: integer);
begin
  inherited Create;
  fRange := Range;
  fSensibility := Sensibility;
  SetLength(fData, fRange);
end;

initialization
  RemClassRegistry.RegisterXSInfo(TypeInfo(DesignKindEnum), 'urn:CommunicationObj', 'DesignKindEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TxPulseEnum), 'urn:CommunicationObj', 'TxPulseEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TxRxOptionsEnum), 'urn:CommunicationObj', 'TxRxOptionsEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TWaveLengthEnum), 'urn:CommunicationObj', 'TWaveLengthEnum');
  RemClassRegistry.RegisterXSClass(TxRxInfo, 'urn:CommunicationObj', 'TxRxInfo');
  RemClassRegistry.RegisterXSClass(FormatData, 'urn:CommunicationObj', 'FormatData');
  RemClassRegistry.RegisterXSClass(TChannelsData, 'urn:CommunicationObj', 'TChannelsData');
  RemClassRegistry.RegisterXSClass(TCalibrationTable, 'urn:CommunicationObj', 'TCalibrationTable');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TFormatArray), 'urn:CommunicationObj', 'TFormatArray');
  RemClassRegistry.RegisterXSClass(TTemplateInfo, 'urn:CommunicationObj', 'TTemplateInfo');
  RemClassRegistry.RegisterXSClass(TLogEntry, 'urn:CommunicationObj', 'TLogEntry');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TSyncSourceEnum), 'urn:CommunicationObj', 'TSyncSourceEnum');
end.
