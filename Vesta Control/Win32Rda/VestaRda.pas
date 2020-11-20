unit VestaRda;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, AxCtrls, Classes, Rda_TLB, StdVcl, SyncObjs, EventLog, LogTools, VestaDispatch;

type
  PWStrings = ^TWStrings;
  TWStrings = array[0..0] of WideString;

type
  TVestaRda = class(TAutoObject, IConnectionPointContainer, IVestaRda, ILogin)
  //TVestaRda = class(TVestaAutoObject, IConnectionPointContainer, IVestaRda, ILogin)
  private
    { Private declarations }
    FConnectionPoints: TConnectionPoints;
    FConnectionPoint: TConnectionPoint;
    FEvents: IVestaRdaEvents;
    { note: FEvents maintains a *single* event sink. For access to more
      than one event sink, use FConnectionPoint.SinkList, and iterate
      through the list of sinks. }
  public
    procedure  Initialize; override;
    destructor Destroy;   override;
  protected
    { Protected declarations }
    property  ConnectionPoints: TConnectionPoints read FConnectionPoints implements IConnectionPointContainer;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    //IVestaRda
    function  Get_Radar: IRadar; safecall;
    function  Get_TxsRxs: ITxsRxs; safecall;
    function  GenerateLogName( LogMessage : TLogMessage ) : string;
    function  LogMessageTitles(out LogMessages: PSafeArray; out MsgCount: Integer): HResult; safecall;
    procedure LogMessage(MsgCode: Integer; out DateTime: TDateTime; out Category: Integer; out Client, Title, Msg, Zone: WideString); safecall;
    function  Get_Antenna: IAntenna; safecall;
    function  Get_Configuration: IConfiguration; safecall;
    function  Get_Statistics: IStatistics; safecall;
    function  Get_MaxLogEntries: Integer; safecall;
    function  Get_Observations: IObservations; safecall;
    function  Get_SystemDateTime: Double; safecall;
    function  Get_SystemTimeZone: Double; safecall;
    function  Get_Version: WideString; safecall;
    //ILogin
    function Borrar_Usuario(const Name: WideString): HResult; safecall;
    function Get_ControllerLevel: Integer; safecall;
    function Get_ControllerName: WideString; safecall;
    function Get_InControl: WordBool; safecall;
    function Get_Level: Integer; safecall;
    function Get_Name: WideString; safecall;
    function Get_Usuarios: Integer; safecall;
    function Login(const UserName, Password: WideString): HResult; safecall;
    function Logout: HResult; safecall;
    function Modificar(const Name, Password: WideString; Level: Integer): HResult; safecall;
    function Nuevo_Usuario(const Name, Password: WideString; Level: Integer): HResult; safecall;
    function ReleaseControl: HResult; safecall;
    function TakeControl: HResult; safecall;
    function Usuario(Index: Integer; out Name: WideString; out Level: Integer): HResult; safecall;
    function Get_Lazo_Posicion_K: Single; safecall;
    function Get_Lazo_Velocidad_K: Single; safecall;
    procedure Set_Lazo_Posicion(Param1: WordBool); safecall;
    procedure Set_Lazo_Posicion_K(Value: Single); safecall;
    procedure Set_Lazo_Sector(Param1: WordBool); safecall;
    procedure Set_Lazo_Velocidad_K(Value: Single); safecall;
    procedure Set_Marca_Posicion(Param1: Integer); safecall;
    procedure Set_Range_Taco(Param1: Integer); safecall;
    procedure Set_Sector_Taco(Param1: Integer); safecall;
    procedure Set_SP_Posicion(Param1: Integer); safecall;
    procedure Set_SP_Velocidad(Param1: Integer); safecall;
  private
    fReady : TSynchroObject;
    fLevel : integer;
    fName  : string;
    fPwd   : string;
    function Logged : boolean;
    procedure FireEvents;
  end;

  TRdaFactory = class( TAutoObjectFactory )
  public
    function CreateComObject(const Controller: IUnknown): TComObject; override;
  end;

var
  VestaRdaObject : TVestaRda;

implementation

uses
  Windows,
  ComServ,
  SysUtils,
  Users,
  Elbrus,
  Radar, TxsRxs, Antenna,
  Configuration, Observations,
  VersionInfo, Constants, StatisticsManager;

procedure TVestaRda.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IVestaRdaEvents;
end;

procedure TVestaRda.Initialize;
begin
  inherited Initialize;
  fReady := TCriticalSection.Create;
  FConnectionPoints := TConnectionPoints.Create(Self);
  if AutoFactory.EventTypeInfo <> nil
    then FConnectionPoint := FConnectionPoints.CreateConnectionPoint( AutoFactory.EventIID, ckMulti, EventConnect )
    else FConnectionPoint := nil;
end;


function TVestaRda.Get_Radar: IRadar;
begin
  if Logged
    then Result := TRadar.Create(fName, fLevel)
    else Result := nil;
end;

function TVestaRda.Get_TxsRxs: ITxsRxs;
begin
  if Logged
    then Result := TTxsRxs.Create(fName, fLevel)
    else Result := nil;
end;

function TVestaRda.LogMessageTitles(out LogMessages: PSafeArray; out MsgCount: Integer): HResult;
var
  SAB : TSafeArrayBound;
  i   : integer;
begin
  try
    MsgCount := EventLog.LogMessages.Count;
    SAB.cElements := EventLog.LogMessages.Count;
    SAB.lLbound   := 0;
    LogMessages := SafeArrayCreate(VT_BSTR, 1, SAB);
    for I := 0 to EventLog.LogMessages.LogMessages.Count-1 do
      PWStrings(LogMessages.pvData)[i] := GenerateLogName( EventLog.LogMessages.LogMessages[i] );
    Result := S_OK;
  except
    Result := E_FAIL;
  end;
end;

function TVestaRda.Get_Antenna: IAntenna;
begin
  if Logged
    then Result := TAntenna.Create(fName, fLevel)
    else Result := nil;
end;

function TVestaRda.Get_Configuration: IConfiguration;
begin
  if Logged
    then Result := TConfiguration.Create(fName, fLevel)
    else Result := nil;
end;

function TVestaRda.Get_MaxLogEntries: Integer;
begin
  result := MaxLogLines;
end;

function TVestaRda.Get_Observations: IObservations;
begin
  if Logged
    then Result := TObservations.Create(fName, fLevel)
    else Result := nil;
end;

function TVestaRda.Get_SystemDateTime: Double;
begin
  result := Now;
end;

function TVestaRda.Get_SystemTimeZone: Double;
var
  TimeZoneInfo : TTimeZoneInformation;
begin
  try
    GetTimeZoneInformation( TimeZoneInfo );
    result := TimeZoneInfo.Bias div TimeZoneInfo.DaylightBias;
  except
    result := -5;
  end;
end;

function TVestaRda.Get_Version: WideString;
begin
  result := '[' + GetVersionString(vs_FileVersion) + ']';
end;

function TVestaRda.Borrar_Usuario(const Name: WideString): HResult;
begin
  if Get_InControl and (fLevel > UserLevel(Name))
    then
      if Users.DeleteUser(Name)
        then
          begin
            Result := S_OK;
            LogMessages.AddLogMessage( lcInformation, fName, LoggingZone, 'El usuario ' + fName + ' borro al usuario ' + Name, 'El usuario ' + fName + ' borro al usuario ' + Name  );
          end
        else Result := E_FAIL
    else Result := E_ACCESSDENIED;
end;

function TVestaRda.Get_ControllerLevel: Integer;
begin
  fReady.Acquire;
  try
    Result := Users.UserLevel( GetController );
  finally
    fReady.Release;
  end;
end;

function TVestaRda.Get_ControllerName: WideString;
begin
  fReady.Acquire;
  try
    Result := Users.GetController;
  finally
    fReady.Release;
  end;
end;

function TVestaRda.Get_InControl: WordBool;
begin
  Result := CompareText(fName, Users.GetController) = 0;
end;

function TVestaRda.Get_Level: Integer;
begin
  fReady.Acquire;
  try
    Result := fLevel;
  finally
    fReady.Release;
  end;
end;

function TVestaRda.Get_Name: WideString;
begin
  fReady.Acquire;
  try
    Result := fName;
  finally
    fReady.Release;
  end;
end;

function TVestaRda.Get_Usuarios: Integer;
begin
  with EnumUsers(fName, fPwd) do
    try
      Result := Count;
    finally
      Free;
    end;
end;

function TVestaRda.Login(const UserName, Password: WideString): HResult;
begin
  fReady.Acquire;
  try
    fLevel := Users.UserLogin(UserName, Password);
    if fLevel > ul_NotLogged
      then
        begin
          fName := UserName;
          fPwd  := Password;
          Result := S_OK;
          LogMessages.AddLogMessage( lcInformation, fName, LoggingZone, 'Se conecto al sistema el usuario ' + fName, 'Se conecto al sistema el usuario ' + fName );
        end
      else Result := E_ACCESSDENIED;
  finally
    fReady.Release;
  end;
end;

function TVestaRda.Logout: HResult;
begin
  fReady.Acquire;
  try
    LogMessages.AddLogMessage( lcInformation, fName, LoggingZone, 'Se desconecto del sistema el usuario '+fName, 'Se desconecto del sistema el usuario '+fName );
    ReleaseControl;
    if fLevel > ul_NotLogged
      then Result := S_OK
      else Result := E_FAIL;
    fName  := '';
    fLevel := ul_NotLogged;
  finally
    fReady.Release;
  end;
end;

function TVestaRda.Modificar(const Name, Password: WideString; Level: Integer): HResult;
begin
  if Get_InControl
    then
      begin
        if Level > fLevel
          then Level := fLevel;
        Result := E_FAIL;
        if Users.ModifyUser(Name, Password, Level)
          then
            if UpperCase(Name) = UpperCase(fName)
              then Result := Login(Name, Password)
              else Result := S_OK;
        if Result = S_OK
          then LogMessages.AddLogMessage( lcInformation, fName, LoggingZone, 'El usuario '+fName+' modifico al usuario ' + Name, 'El usuario '+fName+' modifico al usuario ' + Name  );
      end
    else Result := E_ACCESSDENIED;
end;

function TVestaRda.Nuevo_Usuario(const Name, Password: WideString; Level: Integer): HResult;
begin
  if Get_InControl and (Level < fLevel)
    then
      if Users.CreateUser(Name, Password, Level)
        then
          begin
            Result := S_OK;
            LogMessages.AddLogMessage( lcInformation, fName, LoggingZone, 'El usuario '+fName+' creo al usuario '+Name, 'El usuario '+fName+' creo al usuario '+Name );
          end
        else Result := E_FAIL
    else Result := E_ACCESSDENIED;
end;

function TVestaRda.ReleaseControl: HResult;
begin
  fReady.Acquire;
  try
    if CompareText(fName, Users.GetController) = 0
      then
        if Users.ResetController(fName, fPwd)
          then
            begin
              Result := S_OK;
              LogMessages.AddLogMessage( lcInformation, fName, LoggingZone, 'El usuario '+fName+' libero el control', 'El usuario '+fName+' libero el control' );
            end
          else Result := E_FAIL
      else Result := E_ACCESSDENIED;
  finally
    fReady.Release;
  end;
end;

function TVestaRda.TakeControl: HResult;
begin
  fReady.Acquire;
  try
    if Users.SetController(fName, fPwd)
      then
        begin
          Result := S_OK;
          LogMessages.AddLogMessage( lcInformation, fName, LoggingZone, 'El usuario '+fName+' tomo el control', 'El usuario '+fName+' tomo el control' );
        end
      else Result := E_FAIL;
  finally
    fReady.Release;
  end;
end;

function TVestaRda.Usuario(Index: Integer; out Name: WideString; out Level: Integer): HResult;
begin
  with EnumUsers(fName, fPwd) do
    try
      Name  := Strings[Index];
      Level := UserLevel(Name);
    finally
      Free;
    end;
end;

function TVestaRda.Logged: boolean;
begin
  Result := fLevel > ul_NotLogged;
end;

destructor TVestaRda.Destroy;
begin
  VestaRdaObject := nil;
  FreeAndNil(fReady);
  inherited;
end;

{ TRdaFactory }

function TRdaFactory.CreateComObject( const Controller: IInterface ): TComObject;
begin
  if Assigned( VestaRdaObject )
    then result := VestaRdaObject
    else
      begin
        result := inherited CreateComObject( Controller );
        VestaRdaObject := (result as TVestaRda);
      end;
end;

procedure TVestaRda.FireEvents;
var
  I : Integer;
  EventSinkList : TList;
  EventSink : IVestaRdaEvents;
begin
  if FConnectionPoint <> nil
    then
      begin
        EventSinkList := FConnectionPoint.SinkList;
        for I := 0 to EventSinkList.Count - 1 do
        try
          EventSink := IUnknown( EventSinkList[I] ) as IVestaRdaEvents;
          if Assigned( EventSink )
            then;// EventSink.OnTextChanged( Text );
        except
        end;
      end;
end;

procedure TVestaRda.LogMessage(MsgCode: Integer; out DateTime: TDateTime;
  out Category: Integer; out Client, Title, Msg, Zone: WideString);
var
  LogMessage : TLogMessage;
begin
  LogMessage := LogMessages.LogMessages.Find( MsgCode );
  if Assigned( LogMessage )
    then
      begin
        DateTime := LogMessage.DateTime;
        Category := Ord( LogMessage.Category );
        Client := LogMessage.CurrentUser;
        Title := LogMessage.Title;
        Msg := LogMessage.LogMessage;
        Zone := LogMessage.Zone;
      end
    else
      begin
        DateTime := Now;
        Category := 0;
        Client := '';
        Title := '';
        Msg := '';
        Zone := '';
      end;
end;

function TVestaRda.GenerateLogName(LogMessage: TLogMessage): string;
begin
  if Assigned( LogMessage )
    then result := IntToStr( LogMessage.Code ) + ';' +
                   IntToStr( Ord(LogMessage.Category)) + ';' +
                   DateTimeToStr( LogMessage.DateTime ) + ';' +
                   LogMessage.CurrentUser + ';' +
                   LogMessage.Zone + ';' +
                   LogMessage.Title + ';'
    else result := '';
end;

function TVestaRda.Get_Statistics: IStatistics;
begin
  if Logged
    then Result := TStatisticsManager.Create(fName, fLevel)
    else Result := nil;
end;

function TVestaRda.Get_Lazo_Posicion_K: Single;
begin

end;

function TVestaRda.Get_Lazo_Velocidad_K: Single;
begin

end;

procedure TVestaRda.Set_Lazo_Posicion(Param1: WordBool);
begin

end;

procedure TVestaRda.Set_Lazo_Posicion_K(Value: Single);
begin

end;

procedure TVestaRda.Set_Lazo_Sector(Param1: WordBool);
begin

end;

procedure TVestaRda.Set_Lazo_Velocidad_K(Value: Single);
begin

end;

procedure TVestaRda.Set_Marca_Posicion(Param1: Integer);
begin

end;

procedure TVestaRda.Set_Range_Taco(Param1: Integer);
begin

end;

procedure TVestaRda.Set_Sector_Taco(Param1: Integer);
begin

end;

procedure TVestaRda.Set_SP_Posicion(Param1: Integer);
begin

end;

procedure TVestaRda.Set_SP_Velocidad(Param1: Integer);
begin

end;

initialization
//  TRdaFactory.Create(ComServer, TVestaRda, Class_VestaRda, ciMultiInstance, tmApartment);
  TAutoObjectFactory.Create(ComServer, TVestaRda, Class_VestaRda, ciMultiInstance, tmApartment);
end.
