unit CommunicationObj;

interface

uses
  InvokeRegistry, Types, XSBuiltIns, Classes, SysUtils;

const
  tf_Create_Dir    = 1;
  tf_Include_Radar = 2;
  tf_Include_Year  = 4;
  tf_Include_Month = 8;
  tf_Include_Day   = $10;

type
  TxPulseEnum      = (tx_Pulse_Long, tx_Pulse_Short, tx_Pulse_None, tx_Pulse_Dual );
  TxDualPulseEnum  = (tx_Dual_54, tx_Dual_43, tx_Dual_32, tx_Dual_None);

  TWaveLengthEnum  = (wl_3cm, wl_10cm );
  TSyncSourceEnum  = (ss_Internal, ss_External_Digital, ss_Analog_Raising_Edge, ss_Analog_Falling_Edge );
  DesignKindEnum   = (dk_PPI, dk_RHI);
  RadarBrandsEnum  = (rbUnknown, rbMRL5, rbRC32B, rbMRL5M, rbResearch);
  RadarStatusEnum = (rsOff, rsFailure, rsOk);

  TLogEntry = class(TRemotable)
    private
      fDateTime: TDateTime;
      fCategory: Integer;
      fClient: string;
      fTitle : string;
      fMsg : string;
      fZone : string;
      fMsgCode : integer;
    published
      property MsgCode : integer   read fMsgCode  write fMsgCode;
      property DateTime: TDateTime read fDateTime write fDateTime;
      property Category: Integer   read fCategory write fCategory;
      property Client: string      read fClient   write fClient;
      property Title : string      read fTitle    write fTitle;
      property Msg : string        read fMsg      write fMsg;
      property Zone : string       read fZone     write fZone;
  end;

  FormatData = class(TRemotable)
    private
      fOnda: TWaveLengthEnum;
      fCeldas: Integer;
      fLong: Integer;
      fPotMet: single;
    published
      property Onda: TWaveLengthEnum read fOnda write fOnda;
      property Celdas: integer read fCeldas write fCeldas;
      property Long: integer read fLong write fLong;
      property PotMet: single read fPotMet write fPotMet;
  end;

  FilterData = class(TRemotable)
    private
      fB0: Double;
      fB1: Double;
      fB2: Double;
      fB3: Double;
      fB4: Double;
      fC1: Double;
      fC2: Double;
      fC3: Double;
      fC4: Double;
      fName: WideString;
    published
      property B0: Double read fB0 write fB0;
      property B1: Double read fB1 write fB1;
      property B2: Double read fB2 write fB2;
      property B3: Double read fB3 write fB3;
      property B4: Double read fB4 write fB4;
      property C1: Double read fC1 write fC1;
      property C2: Double read fC2 write fC2;
      property C3: Double read fC3 write fC3;
      property C4: Double read fC4 write fC4;
      property Name: WideString read fName write fName;
  end;

  TFormatArray = array of FormatData;
  TFilterArray = array of FilterData;
  
  TAuthHeader = class(TSOAPHeader)
  private
    fUserName : string;
    fToken: string;
    fLevel : integer;
  published
    property UserName : string read fUserName write fUserName;
    property Token : string read fToken write fToken;
    property Level : integer read fLevel write fLevel;
  end;

  TCyclopAuthHeader = class(TSOAPHeader)
  private
    fUserName : AnsiString;
    fToken: AnsiString;
  published
    property UserName : AnsiString read fUserName write fUserName;
    property Token : AnsiString read fToken write fToken;
  end;

  TCommObj = class(TInvokableClass)
    protected
      fAuthHeader : TAuthHeader;
      fPassword : string;
      function GetAuthHeader: TAuthHeader;
      function GetLevel: integer;
      function GetName: string;
      function GetPassword: string;
      function GetToken : string;
    protected
      property AuthHeader : TAuthHeader read GetAuthHeader;
      property UserName : string read GetName;
      property UserPassword : string read GetPassword;
      property UserLevel : integer read GetLevel;
      property Token : string read GetToken;

      function CheckAuthHeader : integer;
      function CheckCredentials : boolean; virtual;
      function InControl : boolean;
  end;

  TTemplateInfo = class(TRemotable)
  private
    fName       : string;
    fFlags      : integer;
    fAddress    : string;
    fFTPSettings: string;
    fPeriod     : TDateTime;
    fDelay      : TDateTime;
    fKind       : DesignKindEnum;
    fStart      : integer;
    fFinish     : integer;
    fSpeed      : integer;
    fAngles     : integer;
    fFormats    : integer;
    fAutomatic  : boolean;
    fSentFTP    : boolean;
    fLastTime   : TDateTime;
    fNextTime   : TDateTime;
    fPulse      : TxPulseEnum;
    fAngleList  : TIntegerDynArray;
    fFormatList : TFormatArray;
    fMovementList : TFilterArray;

    fCH3cm_ManualAFC,
    fCH10cm_ManualAFC : boolean;
    fCH3cm_StaloPower,
    fCH10cm_StaloPower : double;
    fCH3cm_StaloFreq,
    fCH10cm_StaloFreq : integer;
    fCH3cm_NCO_Freq,
    fCH10cm_NCO_Freq : integer;
  private
    procedure SetAutomatic(const Value: boolean);
    procedure SetLastTime(const Value: TDateTime);
    procedure SetAngles(const Value: integer);
    procedure SetFormats(const Value: integer);
  public
    constructor Create; override;
  published
    property Name                  : string      read fName                  write fName;
    property Flags                 : integer     read fFlags                 write fFlags;
    property Address               : string      read fAddress               write fAddress;
    property FTPSettings           : string      read fFTPSettings           write fFTPSettings;
    property Period                : TDateTime   read fPeriod                write fPeriod;
    property Delay                 : TDateTime   read fDelay                 write fDelay;
    property Kind                  : DesignKindEnum  read fKind              write fKind;
    property Start                 : integer     read fStart                 write fStart;
    property Finish                : integer     read fFinish                write fFinish;
    property Speed                 : integer     read fSpeed                 write fSpeed;
    property Angles                : integer     read fAngles                write SetAngles;
    property Formats               : integer     read fFormats               write SetFormats;
    property Automatic             : boolean     read fAutomatic             write SetAutomatic;
    property SentFTP               : boolean     read fSentFTP               write fSentFTP;
    property LastTime              : TDateTime   read fLastTime              write SetLastTime;
    property NextTime              : TDateTime   read fNextTime              write fNextTime;
    property Pulse                 : TxPulseEnum read fPulse                 write fPulse;

    property CH3cm_ManualAFC       : boolean     read fCH3cm_ManualAFC       write fCH3cm_ManualAFC;
    property CH3cm_StaloPower      : Double      read fCH3cm_StaloPower      write fCH3cm_StaloPower;
    property CH3cm_StaloFreq       : Integer     read fCH3cm_StaloFreq       write fCH3cm_StaloFreq;
    property CH3cm_NCO             : Integer     read fCH3cm_NCO_Freq        write fCH3cm_NCO_Freq;
    property CH10cm_ManualAFC      : boolean     read fCH10cm_ManualAFC      write fCH10cm_ManualAFC;
    property CH10cm_StaloPower     : Double      read fCH10cm_StaloPower     write fCH10cm_StaloPower;
    property CH10cm_StaloFreq      : Integer     read fCH10cm_StaloFreq      write fCH10cm_StaloFreq;
    property CH10cm_NCO            : Integer     read fCH10cm_NCO_Freq       write fCH10cm_NCO_Freq;


    property AngleList  : TIntegerDynArray  read fAngleList write fAngleList;
    property FormatList : TFormatArray      read fFormatList write fFormatList;
  end;

  TChannelsData = class(TRemotable)
  private
    fCh1Data : TCardinalDynArray;
    fCh2Data : TCardinalDynArray;
  public
    constructor Init(Size : integer);
  published
    property Ch1Data : TCardinalDynArray read fCh1Data write fCh1Data;
    property Ch2Data : TCardinalDynArray read fCh2Data write fCh2Data;
  end;

  TCalibrationTable = class(TRemotable)
  private
    fData : TWordDynArray;
    fRange : integer;
    fSensibility : integer;
  public
    constructor Init(Range : integer; Sensibility : integer);
  published
    property Data  : TWordDynArray read fData write fData;
    property Range : integer read fRange write fRange;
    property Sensibility : integer read fSensibility write fSensibility;
  end;

implementation

uses Users;

{ TCommObj }

function TCommObj.CheckAuthHeader : integer;
begin
  if Users.CheckSecurityToken(UserName, Token)
     then result := AuthHeader.Level
     else result := ul_NotLogged;
end;

function TCommObj.CheckCredentials: boolean;
begin
  result := CheckAuthHeader > ul_NotLogged;
end;

function TCommObj.GetAuthHeader: TAuthHeader;
var
  Headers : ISOAPHeaders;
begin
  if fAuthHeader = nil
    then
      begin
        Headers := self as ISOAPHeaders;
        Headers.Get(TAuthHeader, TSoapHeader(fAuthHeader));
        if fAuthHeader = nil
          then raise ERemotableException.Create('No authentication header, user must Login');
      end;
  result := fAuthHeader;      
end;

function TCommObj.GetLevel: integer;
begin
  result := AuthHeader.Level;
end;

function TCommObj.GetName: string;
begin
  result := AuthHeader.UserName;
end;

function TCommObj.GetPassword: string;
begin
  result := Users.UserPassword( UserName );
end;

function TCommObj.GetToken: string;
begin
  result := AuthHeader.Token;
end;

function TCommObj.InControl: boolean;
begin
  if CheckCredentials
    then result := CompareText(AuthHeader.UserName, Users.GetController) = 0
    else result := false;
end;

{ TTemplateInfo }

constructor TTemplateInfo.Create;
begin
  inherited Create;
end;

procedure TTemplateInfo.SetAngles(const Value: integer);
begin
  fAngles := Value;
  SetLength(fAngleList, Value);
end;

procedure TTemplateInfo.SetAutomatic(const Value: boolean);
begin
  fAutomatic := Value;
  if fAutomatic
    then fNextTime := fPeriod * (trunc(Now/fPeriod) + 1) + fDelay
    else fNextTime := 0;
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

procedure TTemplateInfo.SetLastTime(const Value: TDateTime);
begin
  fLastTime := Value;
  fNextTime := fPeriod * (trunc(fLastTime/fPeriod) + 1) + fDelay;
end;

{ TChannelsData }

constructor TChannelsData.Init(Size: integer);
begin
  inherited Create;
  SetLength(fCh1Data, Size);
  SetLength(fCh2Data, Size);
end;

{ TCalibrationTable }

constructor TCalibrationTable.Init(Range, Sensibility: integer);
begin
  inherited Create;
  fData := nil;
  fRange := Range;
  fSensibility := Sensibility;
  if fRange > 0
    then SetLength(fData, fRange);
end;

initialization
  RemClassRegistry.RegisterXSClass(TAuthHeader);
  RemClassRegistry.RegisterXSClass(FormatData);
  RemClassRegistry.RegisterXSClass(TTemplateInfo);
  RemClassRegistry.RegisterXSClass(TChannelsData);
  RemClassRegistry.RegisterXSClass(TCalibrationTable);

  RemClassRegistry.RegisterXSInfo(TypeInfo(DesignKindEnum));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TxPulseEnum));
  RemClassRegistry.RegisterXSInfo(TypeInfo(TWaveLengthEnum));
  RemClassRegistry.RegisterXSInfo(TypeInfo(RadarBrandsEnum));
  RemClassRegistry.RegisterXSInfo(TypeInfo(RadarStatusEnum));

  RemClassRegistry.RegisterXSInfo(TypeInfo(TFormatArray));
end.
