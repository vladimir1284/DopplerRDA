unit StatisticsConfig;

interface

uses
  SyncObjs, SysUtils;

type
  StatisticsCount = 0..20;

const
  RDAIndex        = 0;
  RadarIndex      = 1;
  AccIndex        = 2;
  AzIndex         = 3;
  ElIndex         = 4;
  TxCaldeoIndex   = 5;
  TxAnodoIndex    = 6;
  RxIndex         = 7;
  MagCaldeoIndex  = 8;
  MagAnodoIndex   = 9;
  TirPrincIndex   = 10;
  TirAuxIndex     = 11;
  TxCaldeo2Index  = 12;
  TxAnodo2Index   = 13;
  Rx2Index        = 14;
  MagCaldeo2Index = 15;
  MagAnodo2Index  = 16;
  TirPrinc2Index  = 17;
  TirAux2Index    = 18;
  TirPrincAnodo1Index = 19;
  TirPrincAnodo2Index = 20;

var
  TimeNames : array[StatisticsCount] of string = ('SwitchedOnRDA',
                                                  'SwitchedOnRadar',
                                                  'SwitchedOnAcc',
                                                  'SwitchedOnMotorAz',
                                                  'SwitchedOnMotorEl',
                                                  'SwitchedOnTxCaldeo3cm',
                                                  'SwitchedOnTxAnodo3cm',
                                                  'SwitchedOnRx3cm',
                                                  'MagnetronCaldeo3cm',
                                                  'MagnetronAnodo3cm',
                                                  'TiratronPrincipal3cm',
                                                  'TiratronAuxiliar3cm',
                                                  'SwitchedOnTxCaldeo10cm',
                                                  'SwitchedOnTxAnodo10cm',
                                                  'SwitchedOnRx10cm',
                                                  'MagnetronCaldeo10cm',
                                                  'MagnetronAnodo10cm',
                                                  'TiratronPrincipal10cm',
                                                  'TiratronAuxiliar10cm',
                                                  'TiratronPrincipalAnodo10cm',
                                                  'TiratronPrincipalAnodo3cm');

type
  TTimeState =
    record
      TimeElapse : cardinal;
      State      : boolean;
    end;

  TStatisticsConfig =
    class
      private
        fTimes : array[ StatisticsCount ] of TTimeState;
        fTimeElapse : array[ StatisticsCount ] of integer;
        fLockEnd : TCriticalSection;
        function  GetSwitched(const Index: Integer): integer;
        procedure SetSwitched(const Index, Value: integer);
      public
        property SwitchedOnRDA       : integer index RDAIndex        read GetSwitched write SetSwitched;
        property SwitchedOnRadar     : integer index RadarIndex      read GetSwitched write SetSwitched;
        property SwitchedOnAcc       : integer index AccIndex        read GetSwitched write SetSwitched;
        property SwitchedOnMotorAz   : integer index AzIndex         read GetSwitched write SetSwitched;
        property SwitchedOnMotorEl   : integer index ElIndex         read GetSwitched write SetSwitched;
        property SwitchedOnTxCaldeo  : integer index TxCaldeoIndex   read GetSwitched write SetSwitched;
        property SwitchedOnTxAnodo   : integer index TxAnodoIndex    read GetSwitched write SetSwitched;
        property SwitchedOnRx        : integer index RxIndex         read GetSwitched write SetSwitched;
        property MagnetronCaldeo     : integer index MagCaldeoIndex  read GetSwitched write SetSwitched;
        property MagnetronAnodo      : integer index MagAnodoIndex   read GetSwitched write SetSwitched;
        property TiratronPrincipal   : integer index TirPrincIndex   read GetSwitched write SetSwitched;
        property TiratronAuxiliar    : integer index TirAuxIndex     read GetSwitched write SetSwitched;
        property SwitchedOnTxCaldeo2 : integer index TxCaldeo2Index  read GetSwitched write SetSwitched;
        property SwitchedOnTxAnodo2  : integer index TxAnodo2Index   read GetSwitched write SetSwitched;
        property SwitchedOnRx2       : integer index Rx2Index        read GetSwitched write SetSwitched;
        property MagnetronCaldeo2    : integer index MagCaldeo2Index read GetSwitched write SetSwitched;
        property MagnetronAnodo2     : integer index MagAnodo2Index  read GetSwitched write SetSwitched;
        property TiratronPrincipal2  : integer index TirPrinc2Index  read GetSwitched write SetSwitched;
        property TiratronAuxiliar2   : integer index TirAux2Index    read GetSwitched write SetSwitched;
        property TiratronPrincipalAnodo1  : integer index TirPrincAnodo1Index  read GetSwitched write SetSwitched;
        property TiratronPrincipalAnodo2  : integer index TirPrincAnodo2Index  read GetSwitched write SetSwitched;
        //marks
        procedure BeginSwitched( Index : integer );
        procedure EndSwitched( index : integer );
        procedure EndAll;
      private
        procedure LoadConfig;
        procedure Defaults;
      public
        procedure SaveConfig;
      public
        constructor Create;
        destructor  Destroy;  override;
        procedure   Update;
    end;

var
  theStatisticsConfig : TStatisticsConfig = nil;

implementation

uses
  Mutex, RDAReg, DateUtils, Windows;

const
  StatisticsMutexName = 'Elbrus_Configuration_Mutex';

var
  StatisticsMutex : TMutex  = nil;

const
    MutexTime     = 1000;
    AutoSaveReportTime = 30 * 60 * 1000;
    StatisticsKey = RDARootKey + '\Statistics';

{ TStatisticsConfig }

procedure TStatisticsConfig.BeginSwitched(Index: integer);
begin
  if not fTimes[Index].State
    then
      begin
        fTimes[Index].State := true;
        fTimes[Index].TimeElapse := GetTickCount;
      end
    else if Abs( fTimes[Index].TimeElapse - GetTickCount ) > AutoSaveReportTime
           then EndSwitched( Index );
end;

constructor TStatisticsConfig.Create;
var
  i : integer;
begin
  inherited Create;
  StatisticsMutex := TMutex.Create(nil, false, StatisticsMutexName);
  fLockEnd := TCriticalSection.Create;
  Update;
  for i := Low(StatisticsCount) to High(StatisticsCount) do
  begin
    fTimes[i].TimeElapse := 0;
    fTimes[i].State := false;
  end;
  BeginSwitched(RDAIndex);
end;

procedure TStatisticsConfig.Defaults;
var
  i : integer;
begin
  for i := Low(StatisticsCount) to High(StatisticsCount) do
    fTimeElapse[i] := 0;
end;

destructor TStatisticsConfig.Destroy;
begin
  EndAll;
  fLockEnd.Free;
  StatisticsMutex.Free;
  inherited;
end;

procedure TStatisticsConfig.EndAll;
var
  i : integer;
begin
  for i := Low(StatisticsCount) to High(StatisticsCount) do
    EndSwitched(i);
end;

procedure TStatisticsConfig.EndSwitched(index: integer);
var
  EndTime : cardinal;
  Total : cardinal;
begin
  fLockEnd.Enter;
  try
    try
      if fTimes[Index].State
        then
          begin
            EndTime := GetTickCount;
            if fTimes[Index].TimeElapse <= EndTime
              then Total := fTimeElapse[Index] + ((EndTime - fTimes[Index].TimeElapse) div 60000)
              else Total := fTimeElapse[Index] + ((EndTime +( High(Cardinal) - fTimes[Index].TimeElapse)) div 60000);
            fTimes[Index].State := false;
            SetSwitched( Index, Total mod High(integer) );
          end;
    except
      fTimes[Index].State := false;
      with TRDAReg.Create do
        try
          if OpenKey(StatisticsKey, false)
            then
              try
                if ValueExists(TimeNames[index])
                  then fTimeElapse[index] := ReadInteger(TimeNames[index])
                  else fTimeElapse[index] := 0;
              except
                fTimeElapse[index] := 0;
              end
            else fTimeElapse[index] := 0;
        finally
          free;
        end;
    end;
  finally
    fLockEnd.Leave;
  end;
end;

function TStatisticsConfig.GetSwitched(const Index: Integer): integer;
var
  EndTime : cardinal;
  Total : cardinal;
begin
  result := fTimeElapse[Index];
  if fTimes[Index].State
    then
      begin
        EndTime := GetTickCount;
        if fTimes[Index].TimeElapse <= EndTime
          then Total := result + ((EndTime - fTimes[Index].TimeElapse) div 60000)
          else Total := result + ((EndTime +( High(Cardinal) - fTimes[Index].TimeElapse)) div 60000);
        Result := Total mod High(integer);
      end;
end;

procedure TStatisticsConfig.LoadConfig;
var
  i : integer;
begin
    with TRDAReg.Create do
      try
        if OpenKey(StatisticsKey, false)
          then
            try
              for i := Low(StatisticsCount) to High(StatisticsCount) do
                if ValueExists(TimeNames[i])
                  then fTimeElapse[i] := ReadInteger(TimeNames[i])
                  else fTimeElapse[i] := 0;
            except
              Defaults;
            end
          else Defaults;
      finally
        free;
      end;
end;

procedure TStatisticsConfig.SaveConfig;
var
  i : integer;
begin
  with TRDAReg.Create do
    try
      if OpenKey(StatisticsKey, true)
        then
          for i := Low(StatisticsCount) to High(StatisticsCount) do
            WriteInteger(TimeNames[i], fTimeElapse[i]);
    finally
      Free;
    end;
end;

procedure TStatisticsConfig.SetSwitched(const Index, Value: integer);
begin
  if StatisticsMutex.WaitFor(MutexTime)
    then
      try
        fTimeElapse[Index] := Value;
        with TRDAReg.Create do
          try
            if OpenKey(StatisticsKey, true)
              then WriteInteger(TimeNames[Index], Value);
          finally
            Free;
          end;
      finally
        StatisticsMutex.Release;
      end;
end;

procedure TStatisticsConfig.Update;
begin
  if StatisticsMutex.WaitFor(MutexTime)
    then
      try
        LoadConfig;
      finally
        StatisticsMutex.Release;
      end;
end;

end.

