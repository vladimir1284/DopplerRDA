unit RdaInterface;

interface

uses
  Windows, SysUtils, SvcMgr, Classes, AppEvnts;

type
  TRdaSrv = class(TService)
    ApplicationEvents1: TApplicationEvents;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
  private
    procedure InitializateSystem;
    procedure FinalizateSystem;
  public
    function  GetServiceController: TServiceController; override;
    procedure AppException(Sender: TObject; E: Exception);
  end;

var
  RdaSrv: TRdaSrv;

implementation

uses
  Statistics, VestaRda, RDAReg, Mutex, Users, Operator, Layout, Elbrus,
  Advantech, EventLog, Config, Calib, LogTools, Constants,
  StatisticsConfig;

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  RdaSrv.Controller(CtrlCode);
end;

procedure TRdaSrv.InitializateSystem;
begin
  try
    RegistryMutex := TMutex.Create( nil, false, RegistryMutexName );
    theConfiguration := TConfig.Create;
    theStatisticsConfig := TStatisticsConfig.Create;
    theCalibration := TCalib.Create;
    InitUsers;
    InitLayouts;
    InitElbrus;
    theOperator := TOperator.Create;
  except
    on E : ECardError do
    begin
      Done_Devices;
      LogMessages := TLog.Create;
      LogMessages.AddLogRawMessage( Now, lcError, 'Automatic', ElbrusZone, E.Message, E.Message );
      LogMessages.Free;
      raise;
    end;
    else raise;
  end;
end;

procedure TRdaSrv.FinalizateSystem;
begin
  try
    if Assigned( theOperator )
      then theOperator.Free;
    DoneUsers;
    if Assigned( theConfiguration ) and theConfiguration.AutoPowerOff
      then Elbrus.Apagar_Radar;
    if Initialized
      then DoneElbrus;
    theStatisticsConfig.EndAll;
    RemoveInstance;
    theConfiguration.Free;
    theStatisticsConfig.Free;
    theCalibration.Free;
    RegistryMutex.Free;
  except
  end;  
end;

function TRdaSrv.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TRdaSrv.ServiceStart(Sender: TService; var Started: Boolean);
begin
  InitializateSystem;
  if CountReferences > 0
    then
      while CountReferences > 0 do
        RemoveReference
    else
      while CountReferences < 0 do
        RegisterReference;
  if CountInstances > 1
    then
      while CountInstances > 1 do
        RemoveInstance
    else
      while CountInstances < 1 do
        RegisterInstance;
end;

procedure TRdaSrv.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  FinalizateSystem;
end;

procedure TRdaSrv.AppException(Sender: TObject; E: Exception);
begin
  LogMessages.AddLogMessage( lcError, GetController, 'General', 'Error no resuelto', E.Message );
end;

procedure TRdaSrv.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  LogMessages.AddLogMessage(lcError, GetController, 'General', 'Error no resuelto', E.Message );
end;

end.
