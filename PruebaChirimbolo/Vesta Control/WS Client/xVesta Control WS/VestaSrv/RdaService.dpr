program RdaService;

uses
  Windows,
  SvcMgr,
  RdaInterface in 'RdaInterface.pas' {RdaSrv: TService},
  IniFiles,
  SysUtils,
  AcquireShots in '..\Win32Rda\AcquireShots.pas',
  Advantech in '..\Win32Rda\Advantech.pas',
  Antenna in '..\Win32Rda\Antenna.pas',
  Calib in '..\Win32Rda\Calib.pas',
  Configuration in '..\Win32Rda\Configuration.pas',
  DataUtils in '..\Win32Rda\DataUtils.pas' {Utils: TDataModule},
  EventLog in '..\Win32Rda\EventLog.pas',
  Layout in '..\Win32Rda\Layout.pas',
  MotorAz in '..\Win32Rda\MotorAz.pas',
  MotorEl in '..\Win32Rda\MotorEl.pas',
  Observation in '..\Win32Rda\Observation.pas',
  Observations in '..\Win32Rda\Observations.pas',
  Operator in '..\Win32Rda\Operator.pas',
  Radar in '..\Win32Rda\Radar.pas',
  RDAObj in '..\Win32Rda\RDAObj.pas',
  RDAReg in '..\Win32Rda\RDAReg.pas',
  RTManager in '..\Win32Rda\RTManager.pas',
  ServerThread in '..\Win32Rda\ServerThread.pas',
  Statistics in '..\Win32Rda\Statistics.pas',
  Template in '..\Win32Rda\Template.pas',
  TxRx1 in '..\Win32Rda\TxRx1.pas',
  TxRx2 in '..\Win32Rda\TxRx2.pas',
  TxsRxs in '..\Win32Rda\TxsRxs.pas',
  Users in '..\Win32Rda\Users.pas',
  Constants in '..\General\Constants.pas',
  LogTools in '..\Win32Rda\LogTools.pas',
  VestaRda in '..\Win32Rda\VestaRda.pas',
  Deva in '..\General\Deva.pas',
  CheckPoints in '..\Win32Rda\CheckPoints.pas',
  StatisticsConfig in '..\Win32Rda\StatisticsConfig.pas',
  StatisticsManager in '..\Win32Rda\StatisticsManager.pas',
  Elbrus in '..\Win32Rda\Elbrus.pas',
  RdaService_TLB in 'RdaService_TLB.pas',
  AntennaSimulation in '..\Win32Rda\AntennaSimulation.pas';

{$R '..\Win32Rda\Rda.TLB'}

{$R *.RES}

const
  //Default Values
  MinWorkingSetSizeDefault = 64;
  MaxWorkingSetSizeDefault = 128;

  //Config Keys
  ConfigFile = 'Config.ini';
  MemoryKey = 'Memory';
  MinWorkingSetSizeValue = 'MinimumWorkingSetSize';
  MaxWorkingSetSizeValue = 'MaximumWorkingSetSize';

var
  OnlyOneServer : THandle;
  CurrentProcess : integer;
  Setup : TIniFile;
  MinWorkingSetSize,
  MaxWorkingSetSize : Cardinal;

begin
  try
    OnlyOneServer := CreateMutex( nil, true, OnlyOneRdaServerName );
    if (OnlyOneServer = 0) or (GetLastError = ERROR_ALREADY_EXISTS)
      then raise Exception.Create( 'Ya esta ejecutandose un servidor' );
    try
      Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
      CurrentProcess := GetCurrentProcess;
      SetPriorityClass(CurrentProcess, REALTIME_PRIORITY_CLASS);
      try
        //Lo leo en MBs y lo convierto en Bytes multiplicando por $100000
        if Assigned( Setup )
          then
            begin
              MinWorkingSetSize := Setup.ReadInteger( MemoryKey, MinWorkingSetSizeValue, MinWorkingSetSizeDefault ) * $100000;
              MaxWorkingSetSize := Setup.ReadInteger( MemoryKey, MaxWorkingSetSizeValue, MaxWorkingSetSizeDefault ) * $100000;
            end
          else
            begin
              MinWorkingSetSize := MinWorkingSetSizeDefault * $100000;
              MaxWorkingSetSize := MaxWorkingSetSizeDefault * $100000;
            end;
        //Reservo memoria en RAM
        SetProcessWorkingSetSize(CurrentProcess, MinWorkingSetSize, MaxWorkingSetSize );
        Application.Initialize;
        Application.CreateForm(TUtils, Utils);
  Application.CreateForm(TRdaSrv, RdaSrv);
  Application.Run;
      finally
        if Assigned( Setup )
          then Setup.Free;
        SetPriorityClass(CurrentProcess, NORMAL_PRIORITY_CLASS);
      end;
    finally
      ReleaseMutex( OnlyOneServer );
    end;  
  except
  end;
end.
