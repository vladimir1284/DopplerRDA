unit ConfigurationWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, ConfigurationWSIntf, CommunicationObj, DRX_WS;

type
  TConfigurationWS = class(TCommObj, IConfigurationWS)
  public
    // IConfiguration
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
    function  Get_Timeout_Radar: Integer; safecall;
    function  Get_Automatic_Obs: boolean; safecall;
    function  Get_Auto_Power_Off: boolean; safecall;
    function  Get_WarmTime_Radar: Integer; safecall;
    function  Get_RestTime_Radar: Integer; safecall;
    function  Get_RadarTemperature: Double; safecall;
    function  Get_RadarPressure: Double; safecall;
    function  Get_CheckPPIParam: boolean; safecall;

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
    // IConfigurationControl
    procedure Set_RestTime_Radar(Value: Integer); safecall;
    procedure Set_Auto_Power_Off(Value: boolean); safecall;
    procedure Set_Automatic_Obs(Value: boolean); safecall;
    procedure Set_Timeout_Radar(Value: Integer); safecall;
    procedure Set_ContinuosRegime(Value: boolean); safecall;
    procedure Set_WarmTime_Radar(Value: Integer); safecall;
    
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

    procedure Set_AIGains(Gains: TWordDynArray); safecall;
    procedure Set_AIFactors(Factors: TDoubleDynArray); safecall;
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

    procedure SaveConfig; safecall;
    procedure SaveAllConfig; safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses
  Config, Users, Radars, Description, EventLog, ElbrusTypes, Advantech, Elbrus,
  Parameters, ManagerDRX;

{ TConfiguration }

function TConfigurationWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Supervisor;
end;

function TConfigurationWS.Get_AIGains: TWordDynArray;
var
  i : integer;
begin
  SetLength(result, High(AIRange));
  for I := Low(AIRange) to High(AIRange) do
    result[I] := theConfiguration.AIGains[i];
end;

function TConfigurationWS.Get_Angle_Accuracy: Integer;
begin
  Result := theConfiguration.AngleAcc;
end;

function TConfigurationWS.Get_AngleClockwiseRotationX: boolean;
begin
  Result := theConfiguration.AngleClockwiseRotationX;
end;

function TConfigurationWS.Get_AngleClockwiseRotationY: boolean;
begin
  Result := theConfiguration.AngleClockwiseRotationY;
end;

function TConfigurationWS.Get_AngleClockwiseRotationZ: boolean;
begin
  Result := theConfiguration.AngleClockwiseRotationZ;
end;

function TConfigurationWS.Get_AngleCodeRate: Integer;
begin
  Result := theConfiguration.AngleCodeRate;
end;

function TConfigurationWS.Get_Auto_Power_Off: boolean;
begin
  Result := theConfiguration.AutoPowerOff;
end;

function TConfigurationWS.Get_Automatic_Obs: boolean;
begin
  Result := theConfiguration.AutoObs;
end;

function TConfigurationWS.Get_Beam_Ch1: Single;
begin
  Result := theConfiguration.Ch1Beam;
end;

function TConfigurationWS.Get_Beam_Ch2: Single;
begin
  Result := theConfiguration.Ch2Beam;
end;

function TConfigurationWS.Get_CheckPPIParam: boolean;
begin
  Result := theConfiguration.CheckPPIParam;
end;

function TConfigurationWS.Get_ContinuosRegime: boolean;
begin
  result := theConfiguration.ContinuosRegime;
end;

function TConfigurationWS.Get_Obs_Directory: string;
begin
  Result := theConfiguration.ObsDir;
end;

function TConfigurationWS.Get_Pack_Method: Integer;
begin
  Result := theConfiguration.PackMethod;
end;

function TConfigurationWS.Get_Radar_ID: Integer;
begin
  Result := theConfiguration.RadarID;
end;

function TConfigurationWS.Get_RadarAltitude(RadarId: Integer): Single;
begin
  result := Radars.Find( TRadar( RadarID ) ).Location.Altitude;
end;

function TConfigurationWS.Get_RadarBrand(RadarId: Integer): RadarBrandsEnum;
begin
  case Radars.Find( TRadar( RadarID ) ).Brand of
    rbUnknown : result := CommunicationObj.rbUnknown;
    rbMRL5 : result := CommunicationObj.rbMRL5;
    rbMRL5M : result := CommunicationObj.rbMRL5M;
    rbRC32B : result := CommunicationObj.rbRC32B;
    rbResearch : result := CommunicationObj.rbResearch;
  else result := CommunicationObj.rbUnknown;
  end;
end;

function TConfigurationWS.Get_RadarLatitude(RadarId: Integer): Single;
begin
  result := Radars.Find( TRadar( RadarID ) ).Location.Latitude;
end;

function TConfigurationWS.Get_RadarLongitude(RadarId: Integer): Single;
begin
  result := Radars.Find( TRadar( RadarID ) ).Location.Longitude;
end;

function TConfigurationWS.Get_RadarName(RadarId: Integer): string;
begin
  result := Radars.Find( TRadar( RadarId ) ).Name;
end;

function TConfigurationWS.Get_RadarOwner(RadarId: Integer): string;
begin
  result := Radars.Find( TRadar( RadarID ) ).Owner;
end;

function TConfigurationWS.Get_RadarPressure: Double;
begin
  result := theConfiguration.Pressure;
end;

function TConfigurationWS.Get_RadarRange(RadarId: Integer): Integer;
begin
  result := Radars.Find( TRadar( RadarID ) ).Range;
end;

function TConfigurationWS.Get_RadarTemperature: Double;
begin
  result := theConfiguration.Temperature;
end;

function TConfigurationWS.Get_RestTime_Radar: Integer;
begin
  Result := theConfiguration.RadarRestTime;
end;

function TConfigurationWS.Get_Save_Variance: boolean;
begin
  Result := theConfiguration.SaveVariance;
end;

function TConfigurationWS.Get_SendMsgOnError: boolean;
begin
  Result := theConfiguration.SendMsgOnError;
end;

function TConfigurationWS.Get_SMTPFromAddress: string;
begin
  Result := theConfiguration.SMTPFromAddress;
end;

function TConfigurationWS.Get_SMTPPassword: string;
begin
  Result := theConfiguration.SMTPPassword;
end;

function TConfigurationWS.Get_SMTPPort: Integer;
begin
  Result := theConfiguration.SMTPPort;
end;

function TConfigurationWS.Get_SMTPServer: string;
begin
  Result := theConfiguration.SMTPServer;
end;

function TConfigurationWS.Get_SMTPUser: string;
begin
  Result := theConfiguration.SMTPUser;
end;

function TConfigurationWS.Get_Speckle_Remove: boolean;
begin
  Result := theConfiguration.SpeckleRemove;
end;

function TConfigurationWS.Get_SpeckleUmbral: Integer;
begin
  Result := theConfiguration.SpeckleUmbral;
end;

function TConfigurationWS.Get_Speed_Accuracy: Integer;
begin
  Result := theConfiguration.SpeedAcc;
end;

function TConfigurationWS.Get_TargetAddress: string;
begin
  Result := theConfiguration.TargetAddress;
end;

function TConfigurationWS.Get_Timeout_Radar: Integer;
begin
  Result := theConfiguration.RadarTimeout;
end;

function TConfigurationWS.Get_Timeout_TxRx: Integer;
begin
  Result := theConfiguration.TxRxTimeout;
end;

function TConfigurationWS.Get_WarmTime_Radar: Integer;
begin
  Result := theConfiguration.RadarWarmTime;
end;

function TConfigurationWS.SendTestEMail: boolean;
begin
  result := LogMessages.SendTestEmail;
end;

procedure TConfigurationWS.Set_AIGains(Gains: TWordDynArray);
var
  i : integer;
begin
  try
    for i := Low(AIRange) to High(AIRange) do
      theConfiguration.AIGains[i] := Gains[I];
    Set_Analog_Input_Gains( theConfiguration.AI_Gains );
  except
  end;
end;

procedure TConfigurationWS.Set_Angle_Accuracy(value: Integer);
begin
  if InControl
    then theConfiguration.AngleAcc := Value;
end;

procedure TConfigurationWS.Set_AngleClockwiseRotationX(value: boolean);
begin
  if InControl
    then theConfiguration.AngleClockwiseRotationX := Value;
end;

procedure TConfigurationWS.Set_AngleClockwiseRotationY(value: boolean);
begin
  if InControl
    then theConfiguration.AngleClockwiseRotationY := Value;
end;

procedure TConfigurationWS.Set_AngleClockwiseRotationZ(value: boolean);
begin
  if InControl
    then theConfiguration.AngleClockwiseRotationZ := Value;
end;

procedure TConfigurationWS.Set_AngleCodeRate(value: Integer);
begin
  if InControl
    then theConfiguration.AngleCodeRate := Value;
end;

procedure TConfigurationWS.Set_Auto_Power_Off(Value: boolean);
begin
  if InControl
    then theConfiguration.AutoPowerOff := Value;
end;

procedure TConfigurationWS.Set_Automatic_Obs(Value: boolean);
begin
  if InControl
    then theConfiguration.AutoObs := Value;
end;

procedure TConfigurationWS.Set_Beam_Ch1(value: Single);
begin
  if InControl
    then theConfiguration.Ch1Beam := Value;
end;

procedure TConfigurationWS.Set_Beam_Ch2(value: Single);
begin
  if InControl
    then theConfiguration.Ch2Beam := Value;
end;

procedure TConfigurationWS.Set_CheckPPIParam(value: boolean);
begin
  if InControl
    then theConfiguration.CheckPPIParam := Value;
end;

procedure TConfigurationWS.Set_ContinuosRegime(Value: boolean);
begin
  if InControl
    then theConfiguration.ContinuosRegime := Value;
end;

procedure TConfigurationWS.Set_Obs_Directory(const value: string);
begin
  if InControl
    then theConfiguration.ObsDir := Value;
end;

procedure TConfigurationWS.Set_Pack_Method(value: Integer);
begin
  if InControl
    then theConfiguration.PackMethod := Value;
end;

procedure TConfigurationWS.Set_Radar_ID(value: Integer);
begin
  if InControl
    then theConfiguration.RadarID := Value;
end;

procedure TConfigurationWS.Set_RadarPressure(value: Double);
begin
  if InControl
    then theConfiguration.Pressure := Value;
end;

procedure TConfigurationWS.Set_RadarTemperature(value: Double);
begin
  if InControl
    then theConfiguration.Temperature := Value;
end;

procedure TConfigurationWS.Set_RestTime_Radar(Value: Integer);
begin
  if InControl
    then theConfiguration.RadarRestTime := Value;
end;

procedure TConfigurationWS.Set_Save_Variance(value: boolean);
begin
  if InControl
    then theConfiguration.SaveVariance := Value;
end;

procedure TConfigurationWS.Set_SendMsgOnError(value: boolean);
begin
  if InControl
    then theConfiguration.SendMsgOnError := Value;
end;

procedure TConfigurationWS.Set_SMTPFromAddress(const value: string);
begin
  if InControl
    then theConfiguration.SMTPFromAddress := Value;
end;

procedure TConfigurationWS.Set_SMTPPassword(const value: string);
begin
  if InControl
    then theConfiguration.SMTPPassword := Value;
end;

procedure TConfigurationWS.Set_SMTPPort(value: Integer);
begin
  if InControl
    then theConfiguration.SMTPPort := Value;
end;

procedure TConfigurationWS.Set_SMTPServer(const value: string);
begin
  if InControl
    then theConfiguration.SMTPServer := Value;
end;

procedure TConfigurationWS.Set_SMTPUser(const value: string);
begin
  if InControl
    then theConfiguration.SMTPUser := Value;
end;

procedure TConfigurationWS.Set_Speckle_Remove(value: boolean);
begin
  if InControl
    then theConfiguration.SpeckleRemove := Value;
end;

procedure TConfigurationWS.Set_SpeckleUmbral(value: Integer);
begin
  if InControl
    then theConfiguration.SpeckleUmbral := Value;
end;

procedure TConfigurationWS.Set_Speed_Accuracy(value: Integer);
begin
  if InControl
    then theConfiguration.SpeedAcc := Value;
end;

procedure TConfigurationWS.Set_TargetAddress(const value: string);
begin
  if InControl
    then theConfiguration.TargetAddress := Value;
end;

procedure TConfigurationWS.Set_Timeout_Radar(Value: Integer);
begin
  if InControl
    then theConfiguration.RadarTimeout := Value;
end;

procedure TConfigurationWS.Set_Timeout_TxRx(value: Integer);
begin
  if InControl
    then theConfiguration.TxRxTimeout := Value;
end;

procedure TConfigurationWS.Set_WarmTime_Radar(Value: Integer);
begin
  if InControl
    then theConfiguration.RadarWarmTime := Value;
end;

function TConfigurationWS.TestSMTPConfig: boolean;
begin
  result := LogMessages.TestEmailServerConfig;
end;

procedure TConfigurationWS.SaveAllConfig;
begin
  theConfiguration.SaveConfig;
end;

procedure TConfigurationWS.SaveConfig;
begin
  theConfiguration.SaveOprConfig;
end;

function TConfigurationWS.Get_AIFactors: TDoubleDynArray;
var
  i : integer;
begin
  SetLength(result, High(AIRange));
  for I := Low(AIRange) to High(AIRange) do
    result[I] := theConfiguration.AIFactors[i];
end;

function TConfigurationWS.Get_DefaultFilter: Integer;
begin
  Result := theConfiguration.DefaultFilter;
end;

function TConfigurationWS.Get_Filter(Index: Integer): TDataFilter;
var
  data : FilterInfo;
begin
  if Index < theConfiguration.Filters
    then
      begin
        //result.Name := theConfiguration.FilterName[Index];
        data := theConfiguration.GetFilter(Index);
        result.B0 := data.B0;
        result.B1 := data.B1;
        result.B2 := data.B2;
        result.B3 := data.B3;
        result.B4 := data.B4;
        result.C1 := data.C1;
        result.C2 := data.C2;
        result.C3 := data.C3;
        result.C4 := data.C4;
      end
    else Result := nil;
end;

function TConfigurationWS.Get_FilterAngle: Double;
begin
  Result := theConfiguration.FilterMaxAngle;
end;

function TConfigurationWS.Get_FilterCCOR: WordBool;
begin
  Result := theConfiguration.FilterCCOR;
end;

function TConfigurationWS.Get_FilterCI: WordBool;
begin
  Result := theConfiguration.FilterCI;
end;

function TConfigurationWS.Get_FilterCount: Integer;
begin
  Result := theConfiguration.Filters;
end;

function TConfigurationWS.Get_FilterDistance: Integer;
begin
  Result := theConfiguration.FilterMaxDistance;
end;

function TConfigurationWS.Get_FilterHeigh: Integer;
begin
  Result := theConfiguration.FilterMaxHeigh;
end;

function TConfigurationWS.Get_FilterLOG: WordBool;
begin
  Result := theConfiguration.FilterLOG;
end;

function TConfigurationWS.Get_FilterSIG: WordBool;
begin
  Result := theConfiguration.FilterSIG;
end;

function TConfigurationWS.Get_FilterSQI: WordBool;
begin
  Result := theConfiguration.FilterSQI;
end;

procedure TConfigurationWS.Set_AIFactors(Factors: TDoubleDynArray);
var
  i : integer;
begin
  for i := Low(AIRange) to High(AIRange) do
    theConfiguration.AIFactors[i] := Factors[I];
end;

procedure TConfigurationWS.Set_DefaultFilter(Value: Integer);
begin
  if InControl
    then
      begin
        theConfiguration.DefaultFilter := Value;
        if DRX1.Ready
          then
            try
              DRX1.SetDefaultFilter;
            except
              DRX1.Validate;
            end;
        if DRX2.Ready
          then
            try
              DRX2.SetDefaultFilter;
            except
              DRX1.Validate;
            end;
      end;
end;

procedure TConfigurationWS.Set_FilterAngle(Value: Double);
begin
  if InControl
    then theConfiguration.FilterMaxAngle := Value;
end;

procedure TConfigurationWS.Set_FilterCCOR(Value: WordBool);
begin
  if InControl
    then theConfiguration.FilterCCOR := Value;
end;

procedure TConfigurationWS.Set_FilterCI(Value: WordBool);
begin
  if InControl
    then theConfiguration.FilterCI := Value;
end;

procedure TConfigurationWS.Set_FilterCount(Value: Integer);
begin
  if InControl
    then theConfiguration.Filters := Value;
end;

procedure TConfigurationWS.Set_FilterDistance(Value: Integer);
begin
  if InControl
    then theConfiguration.FilterMaxDistance := Value;
end;

procedure TConfigurationWS.Set_FilterHeigh(Value: Integer);
begin
  if InControl
    then theConfiguration.FilterMaxHeigh := Value;
end;

procedure TConfigurationWS.Set_FilterLOG(Value: WordBool);
begin
  if InControl
    then theConfiguration.FilterLOG := Value;
end;

procedure TConfigurationWS.Set_FilterSIG(Value: WordBool);
begin
  if InControl
    then theConfiguration.FilterSIG := Value;
end;

procedure TConfigurationWS.Set_FilterSQI(Value: WordBool);
begin
  if InControl
    then theConfiguration.FilterSQI := Value;
end;

procedure TConfigurationWS.SetFilter(Index: Integer; Filter: TDataFilter);
begin
  //if InControl and Assigned(Filter)
    //then theConfiguration.SetFilter(Index, Filter.Name, Filter.B0, Filter.B1, Filter.B2, Filter.B3, Filter.B4, Filter.C1, Filter.C2, Filter.C3, Filter.C4);
end;

initialization
  InvRegistry.RegisterInvokableClass(TConfigurationWS);

end.
