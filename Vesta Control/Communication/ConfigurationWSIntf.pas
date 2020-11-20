unit ConfigurationWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj, DRX_WS;

type
  IConfigurationWS = interface(IInvokable)
  ['{712FF90D-6010-4692-BB7B-55889DD01519}']
    // IConfiguration
    function Get_Filter(Index: Integer) : TDataFilter;
    function Get_FilterCount: Integer; safecall;
    function Get_DefaultFilter: Integer; safecall;
    function Get_FilterAngle: Double; safecall;
    function Get_FilterHeigh: Integer; safecall;
    function Get_FilterDistance: Integer; safecall;
    function Get_FilterSQI: WordBool; safecall;
    function Get_FilterCI: WordBool; safecall;
    function Get_FilterSIG: WordBool; safecall;
    function Get_FilterLOG: WordBool; safecall;
    function Get_FilterCCOR: WordBool; safecall;

    function  Get_AIGains: TWordDynArray; safecall;
    function  Get_AIFactors : TDoubleDynArray; safecall;

    function  Get_Radar_ID: Integer; safecall;
    function  Get_Obs_Directory: string; safecall;
    function  Get_Beam_Ch1: Single; safecall;
    function  Get_Beam_Ch2: Single; safecall;
    function  Get_Speed_Accuracy: Integer; safecall;
    function  Get_Angle_Accuracy: Integer; safecall;
    function  Get_Pack_Method: Integer; safecall;
    function  Get_Timeout_TxRx: Integer; safecall;
    function  Get_Speckle_Remove: boolean; safecall;
    function  Get_Save_Variance: boolean; safecall;
    function  Get_AngleCodeRate: Integer; safecall;
    function  Get_AngleClockwiseRotationX: boolean; safecall;
    function  Get_AngleClockwiseRotationY: boolean; safecall;
    function  Get_AngleClockwiseRotationZ: boolean; safecall;
    function  Get_SpeckleUmbral: Integer; safecall;
    function  Get_RadarName(RadarId: Integer): string; safecall;
    function  Get_RadarOwner(RadarId: Integer): string; safecall;
    function  Get_RadarRange(RadarId: Integer): Integer; safecall;
    function  Get_RadarLatitude(RadarId: Integer): Single; safecall;
    function  Get_RadarLongitude(RadarId: Integer): Single; safecall;
    function  Get_RadarAltitude(RadarId: Integer): Single; safecall;
    function  Get_RadarBrand(RadarId: Integer): RadarBrandsEnum; safecall;
    function  Get_SendMsgOnError: boolean; safecall;
    function  Get_TargetAddress: string; safecall;
    function  Get_SMTPServer: string; safecall;
    function  Get_SMTPUser: string; safecall;
    function  Get_SMTPPassword: string; safecall;
    function  Get_SMTPPort: Integer; safecall;
    function  Get_SMTPFromAddress: string; safecall;
    function  Get_ContinuosRegime: boolean; safecall;
    procedure Set_ContinuosRegime(Value: boolean); safecall;
    function  Get_Timeout_Radar: Integer; safecall;
    procedure Set_Timeout_Radar(Value: Integer); safecall;
    function  Get_Automatic_Obs: boolean; safecall;
    procedure Set_Automatic_Obs(Value: boolean); safecall;
    function  Get_Auto_Power_Off: boolean; safecall;
    procedure Set_Auto_Power_Off(Value: boolean); safecall;
    function  Get_WarmTime_Radar: Integer; safecall;
    procedure Set_WarmTime_Radar(Value: Integer); safecall;
    function  Get_RestTime_Radar: Integer; safecall;
    procedure Set_RestTime_Radar(Value: Integer); safecall;
    function  Get_RadarTemperature: Double; safecall;
    function  Get_RadarPressure: Double; safecall;
    function  Get_CheckPPIParam: boolean; safecall;

    // IConfigurationControl
    procedure SaveConfig; safecall;
    procedure SaveAllConfig; safecall;

    procedure Set_AIGains(Gains: TWordDynArray); safecall;
    procedure Set_AIFactors(Factors: TDoubleDynArray); safecall;

    procedure Set_Radar_ID(value: Integer); safecall;
    procedure Set_Obs_Directory(const value: string); safecall;
    procedure Set_Beam_Ch1(value: Single); safecall;
    procedure Set_Beam_Ch2(value: Single); safecall;
    procedure Set_Speed_Accuracy(value: Integer); safecall;
    procedure Set_Angle_Accuracy(value: Integer); safecall;
    procedure Set_Pack_Method(value: Integer); safecall;
    procedure Set_Timeout_TxRx(value: Integer); safecall;
    procedure Set_Speckle_Remove(value: boolean); safecall;
    procedure Set_Save_Variance(value: boolean); safecall;
    procedure Set_AngleCodeRate(value: Integer); safecall;
    procedure Set_AngleClockwiseRotationX(value: boolean); safecall;
    procedure Set_AngleClockwiseRotationY(value: boolean); safecall;
    procedure Set_AngleClockwiseRotationZ(value: boolean); safecall;
    procedure Set_SpeckleUmbral(value: Integer); safecall;
    procedure Set_SMTPPort(value: Integer); safecall;
    procedure Set_SMTPUser(const value: string); safecall;
    procedure Set_SMTPPassword(const value: string); safecall;
    procedure Set_SendMsgOnError(value: boolean); safecall;
    procedure Set_TargetAddress(const value: string); safecall;
    procedure Set_SMTPServer(const value: string); safecall;
    function  TestSMTPConfig: boolean; safecall;
    function  SendTestEMail: boolean; safecall;
    procedure Set_SMTPFromAddress(const value: string); safecall;
    procedure Set_RadarTemperature(value: Double); safecall;
    procedure Set_RadarPressure(value: Double); safecall;
    procedure Set_CheckPPIParam(value: boolean); safecall;

    procedure SetFilter(Index: Integer; Filter : TDataFilter);
    procedure Set_FilterCount(Value: Integer); safecall;
    procedure Set_DefaultFilter(Value: Integer); safecall;
    procedure Set_FilterAngle(Value: Double); safecall;
    procedure Set_FilterHeigh(Value: Integer); safecall;
    procedure Set_FilterDistance(Value: Integer); safecall;
    procedure Set_FilterSQI(Value: WordBool); safecall;
    procedure Set_FilterCI(Value: WordBool); safecall;
    procedure Set_FilterSIG(Value: WordBool); safecall;
    procedure Set_FilterLOG(Value: WordBool); safecall;
    procedure Set_FilterCCOR(Value: WordBool); safecall;

    property Radar_ID: Integer                         read Get_Radar_ID                     write Set_Radar_ID;
    property Obs_Directory: string                     read Get_Obs_Directory                write Set_Obs_Directory;
    property Beam_Ch1: Single                          read Get_Beam_Ch1                     write Set_Beam_Ch1;
    property Beam_Ch2: Single                          read Get_Beam_Ch2                     write Set_Beam_Ch2;
    property Speed_Accuracy: Integer                   read Get_Speed_Accuracy               write Set_Speed_Accuracy;
    property Angle_Accuracy: Integer                   read Get_Angle_Accuracy               write Set_Angle_Accuracy;
    property Pack_Method: Integer                      read Get_Pack_Method                  write Set_Pack_Method;
    property Timeout_TxRx: Integer                     read Get_Timeout_TxRx                 write Set_Timeout_TxRx;
    property Speckle_Remove: boolean                   read Get_Speckle_Remove               write Set_Speckle_Remove;
    property Save_Variance: boolean                    read Get_Save_Variance                write Set_Save_Variance;
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
    property SendMsgOnError: boolean                   read Get_SendMsgOnError               write Set_SendMsgOnError;
    property TargetAddress: string                     read Get_TargetAddress                write Set_TargetAddress;
    property SMTPServer: string                        read Get_SMTPServer                   write Set_SMTPServer;
    property SMTPUser: string                          read Get_SMTPUser                     write Set_SMTPUser;
    property SMTPPassword: string                      read Get_SMTPPassword                 write Set_SMTPPassword;
    property SMTPPort: Integer                         read Get_SMTPPort                     write Set_SMTPPort;
    property SMTPFromAddress: string                   read Get_SMTPFromAddress              write Set_SMTPFromAddress;
    property RadarName[RadarId: Integer]: string       read Get_RadarName;
    property RadarOwner[RadarId: Integer]: string      read Get_RadarOwner;
    property RadarRange[RadarId: Integer]: Integer     read Get_RadarRange;
    property RadarLatitude[RadarId: Integer]: Single   read Get_RadarLatitude;
    property RadarLongitude[RadarId: Integer]: Single  read Get_RadarLongitude;
    property RadarAltitude[RadarId: Integer]: Single   read Get_RadarAltitude;
    property RadarBrand[RadarId: Integer]: RadarBrandsEnum read Get_RadarBrand;

    property FilterCount:    Integer  read  Get_FilterCount     write Set_FilterCount;
    property DefaultFilter:  Integer  read  Get_DefaultFilter   write Set_DefaultFilter;
    property FilterAngle:    Double   read  Get_FilterAngle     write Set_FilterAngle;
    property FilterHeigh:    Integer  read  Get_FilterHeigh     write Set_FilterHeigh;
    property FilterDistance: Integer  read  Get_FilterDistance  write Set_FilterDistance;
    property FilterSQI:      WordBool read  Get_FilterSQI       write Set_FilterSQI;
    property FilterCI:       WordBool read  Get_FilterCI        write Set_FilterCI;
    property FilterSIG:      WordBool read  Get_FilterSIG       write Set_FilterSIG;
    property FilterLOG:      WordBool read  Get_FilterLOG       write Set_FilterLOG;
    property FilterCCOR:     WordBool read  Get_FilterCCOR      write Set_FilterCCOR;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(IConfigurationWS));

end.
