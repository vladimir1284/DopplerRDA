unit Elbrus;

{$DEFINE RDA_Simulation}
//{$UNDEF RDA_Simulation}

interface

uses
  Advantech,
  Deva, SyncObjs,
  Windows, SysUtils, Classes,
  ElbrusTypes, Rda_TLB, Constants, ManagerDRX;

type
  TConditionFunction = function : boolean of object;

  EActionCanceled = class(Exception)
  end;

  EActionTimeout = class(Exception)
  end;

  EWaitCondition = class(Exception)
  end;

type
  PSnapshot = ^TSnapshot;
  TSnapshot = packed record
    Digital_Input       : DigitalInput;   // di_...
    Digital_Output      : DigitalOutput;  // do_...
    Analog_Input        : AnalogInput;    // ai_...
    Analog_Input_Voltage: AnalogVoltages; // ai_...volts
    Analog_Output       : AnalogOutput;   // Chopper codes
    AI_Range            : AnalogRange;
    AI_Sector           : AnalogRange;
    //Antenna
    Position_Az         : integer;
    Position_El         : integer;
    Velocity_Az         : integer;
    Velocity_El         : integer;
    SP_Position_Az      : integer;
    Mark_Position_Az    : integer;
    SP_Position_El      : integer;
    Mark_Position_El    : integer;
    SP_Velocity_Az      : integer;
    SP_Velocity_El      : integer;
    Position_Loop_Az    : boolean;
    Position_Loop_El    : boolean;
    Sector_Loop_Az      : boolean;
    Sector_Loop_El      : boolean;
    Velocity_Loop_Az_K  : single;
    Velocity_Loop_El_K  : single;
    Position_Loop_Az_K  : single;
    Position_Loop_El_K  : single;
    SyncMark            : integer;
    SyncMarkDirection   : boolean;

    //Synch
    Tx1_Pulse               : integer;
    Tx1_PRF_Rate            : integer;
    Tx1_Trigger_Rate        : cardinal;         // Trigger frequency
    Tx1_Sample_Rate         : cardinal;
    Tx1_Sample_Cell_Size    : integer;
    Tx1_Sample_Max_Count    : integer;
    Tx2_Pulse               : integer;
    Tx2_PRF_Rate            : integer;
    Tx2_Trigger_Rate        : cardinal;         // Trigger frequency
    Tx2_Sample_Rate         : cardinal;
    Tx2_Sample_Cell_Size    : integer;
    Tx2_Sample_Max_Count    : integer;

    ObsInProgress       : boolean;
    ObsName             : string;
    ObsClient           : string;
    ObsStartTime        : TDateTime;
    ObsLastTime         : TDateTime;
    ObsProgress         : integer;
    ObsMessage          : string;
    ObsSubMsg           : string;
    ObsResult           : integer;
    ObsCancel           : boolean;

    Last_Action_Time    : TDateTime;
    
    //Status
    Radar_ON            : boolean;
    Antena_ON           : boolean;
    MotorAz_ON          : boolean;
    MotorEl_ON          : boolean;
    Tx1_ON              : boolean;
    Rx1_ON              : boolean;
    Tx2_ON              : boolean;
    Rx2_ON              : boolean;
    Radar_Ok            : boolean;
    Antena_Ok           : boolean;
    MotorAz_Ok          : boolean;
    MotorEl_Ok          : boolean;
    Tx1_Ok              : boolean;
    Rx1_Ok              : boolean;
    Tx2_Ok              : boolean;
    Rx2_Ok              : boolean;
  end;

type
  TAntennaThread = class(TThread)
  public
    constructor Create;
  protected
    procedure Execute;  override;
  end;

  TAction_Thread = class(TThread)
  protected
    fProgUpdate : boolean;
    fProgress : integer;
    fMessage  : string;

    procedure CheckCancel;
    procedure WaitForCondition(Condition: TConditionFunction; Period: cardinal; Timeout: cardinal; ProgGoal: integer; M, E: string);

    function  ActionName : string; virtual;

    procedure Task_Start;
    procedure Task_Progress;
    procedure Task_Finalize;
  public
    constructor Create;
  end;

  TAntenna_OnThread = class(TAction_Thread)
  private
    function Antena : boolean;
    function Veltilacion : boolean;
    function Motores : boolean;
    function Fuentes : boolean;
    function LimiteActivado : boolean;
    function InRange : boolean;
    function PositionEl : boolean;
  public
    constructor Create;
  protected
    procedure Execute;  override;
    function  ActionName : string; override;
  end;

  TTXAction_Thread = class(TAction_Thread)
  protected
    fChannel : integer;

    function InterLock : boolean;
    function Veltilacion : boolean;
    function Filamento : boolean;
    function Listo : boolean;
    function Fuentes : boolean;
    function Tx_Ok : boolean;

    function TxName : string;
  public
    constructor Create(Channel : integer);
  end;

  TPulseChangeThread = class(TTXAction_Thread)
  protected
    pulse_mode : TxPulse;
    rate_mode  : TxDualPulse;
    TxRx_Pulso_Largo : DigitalInput;
    drx : TDRX_Manager;

    function InLongPulse : boolean;
    function InShortPulse : boolean;
    function ActionName : string; override;
  public
    constructor Create(Channel : integer);
    constructor LongPulse(Channel : integer);
    constructor ShortPulse(Channel : integer; Rate : TxDualPulse);
  protected
    procedure Execute;  override;
  end;

  TTX_OnThread = class(TTXAction_Thread)
  public
    constructor Create(Channel : integer);
  protected
    procedure Execute;  override;
    function  ActionName : string; override;
  end;

  TMPS_OnThread = class(TTXAction_Thread)
  protected
    fVoltageCode : AnalogCode;
    fVoltage : double;
    fMPS_Factor : double;
    aoMPS : AORange;
    aiMPS_V, aiMPS_I : AIRange;
    do_Tx_HV : Int64;

    function MPS_Ok : boolean;
    function HV : boolean;
    function ActionName : string; override;
  public
    constructor Create(Channel : integer; Voltage : double);
  protected
    procedure Execute;  override;
  end;

var
  Snapshot      : PSnapshot = nil;
  WriteView     : PSnapshot = nil;
  AntennaThread : TAntennaThread  = nil;
  Initialized   : boolean   = false;

  Antenna_TurningOn : boolean;
  MPS_Changing      : array[0..1] of boolean;
  TX_TurningOn      : array[0..1] of boolean;
  PulseChanging     : array[0..1] of boolean;

  Antenna_TurningOn_result : integer;
  MPS_Changing_result      : array[0..1] of integer;
  TX_TurningOn_result      : array[0..1] of integer;
  PulseChanging_result     : array[0..1] of integer;

//General
procedure InitElbrus;
procedure DoneElbrus;
procedure WaitForTxsStantby;
function  AI_InSector(Value : integer; Range : TAIRange) : boolean;

//conditions
function InSector(Value : integer; Range : TAIRange) : boolean;
function WaitCondition(Condition : TConditionFunction; Period : cardinal; Timeout : cardinal) : boolean;

function Is_RadarOn  : boolean;
function Is_RadarOk  : boolean;

function Is_AntennaOn  : boolean;
function Is_AntennaOk  : boolean;

function Is_MotorAzOn  : boolean;
function Is_MotorAzOk  : boolean;

function Is_MotorElOn  : boolean;
function Is_MotorElOk : boolean;

function Is_MotorsOk : boolean;
function Is_MotorsOn : boolean;

function Is_SpeedAz : boolean;
function Is_PositionAz : boolean;
function Is_PositionEl : boolean;
function Is_SpeedElZero : boolean;

function Is_Tx1On  : boolean;
function Is_Tx1Ok  : boolean;
function Is_Tx1Standby : boolean;

function Is_Tx2On  : boolean;
function Is_Tx2Ok  : boolean;
function Is_Tx2Standby : boolean;

function Is_Rx1On  : boolean;
function Is_Rx1Ok  : boolean;

function Is_Rx2On  : boolean;
function Is_Rx2Ok  : boolean;

// Radar
procedure Encender_Radar;
procedure Apagar_Radar;

//Aire Acondicionado
procedure Air1( State : boolean );
procedure Air2( State : boolean );
procedure Air3( State : boolean );

// Antenna
procedure Encender_Accionamiento;
procedure Apagar_Accionamiento;
procedure Alarma_Sonora( Tiempo : integer );
procedure SetDACodeEl( Code : integer );
procedure SetDACodeAz( Code : integer );
procedure Set_SyncMark(direction: boolean; rays: integer);

// MotorAz
function  ClockwiseAz : boolean;
procedure Set_Lazo_Sector_AZ  ( State : boolean );
procedure Set_Lazo_Posicion_Az( State : boolean );
procedure Set_Mark_Posicion_Az( Value : integer );
procedure Set_SP_Posicion_Az  ( Value : integer );
procedure Set_SP_Velocidad_Az ( Value : integer );
procedure Set_Lazo_K_Pos_Az   ( Value : single );
procedure Set_Lazo_K_Vel_Az   ( Value : single );
procedure EnableMotorAz( State : boolean );

// MotorEl
function  ClockwiseEl : boolean;
procedure Set_Lazo_Sector_El  ( State : boolean );
procedure Set_Mark_Posicion_El( Value : integer );
procedure Set_Lazo_Posicion_El( State : boolean );
procedure Set_SP_Posicion_El  ( Value : integer );
procedure Set_SP_Velocidad_El ( Value : integer );
procedure Set_Lazo_K_Pos_El   ( Value : single );
procedure Set_Lazo_K_Vel_El   ( Value : single );
procedure EnableMotorEl( State : boolean );

// TxRx1
procedure Tx1_ClearSynch;
procedure Tx1_Long_Pulse;
procedure Tx1_Short_Pulse(PRF_Rate : TxDualPulse);
procedure Tx1_Encender;
procedure Tx1_Apagar;
procedure Tx1_Standby(State : boolean);
procedure Rx1_Encender;
procedure Rx1_Apagar;

// TxRx2
procedure Tx2_ClearSynch;
procedure Tx2_Long_Pulse;
procedure Tx2_Short_Pulse(PRF_Rate : TxDualPulse);
procedure Tx2_Encender;
procedure Tx2_Apagar;
procedure Rx2_Encender;
procedure Rx2_Apagar;
procedure Tx2_Standby(State : boolean);

// Analog input ranges & sectors
function  BinaryToKW( const Binary : cardinal ) : double;
procedure Set_AI_Range ( AI : AIRange; const Range : TAIRange );
procedure Set_AI_Sector( AI : AIRange; const Range : TAIRange );

// Obs Engine
procedure Report_Obs_Start   ( Name, Client : string );
procedure Report_Obs_Finish  ( Result : integer );
procedure Report_Obs_Progress( Progress : integer; M, S : string );

// Control
procedure Acquire_Control;
procedure Release_Control;

implementation

uses
  EventLog,
  Angle,
  Mutex,
  Parameters, Config, Calib, Dialogs, Users, LogTools,
  StatisticsConfig, DRX_Sync_WS, ActiveX, DRX_WS;

type
  TControlMutex = class(TMutex)
  public
    function WaitFor( Timeout : dword ) : boolean;  override;
    procedure Release;  override;
  end;

const
  SnapshotName      = 'Elbrus_Snapshot';
  SnapshotMutexName = 'Elbrus_Snapshot_Mutex';
  ControlMutexName  = 'Elbrus_Control_Mutex';
  CleanupMutexName  = 'Elbrus_Cleanup_Mutex';
  AntennaMutexName  = 'Elbrus_Antenna_Mutex';
  ObsMutexName      = 'Elbrus_Observation_Mutex';

const
  ControlTime = 100;
  MinSector   = 171;  //15 degrees
  AzTimeOut   = 5000;
  ElTimeOut   = 5000;
  RampAz      = 5000; //cods
  RampEl      = 5000; //cods

var
  FileMapping   : integer   = 0;
  ControlMutex  : TMutex    = nil;
  SnapshotMutex : TMutex    = nil;
  CleanupMutex  : TMutex    = nil;
  AntennaMutex  : TMutex    = nil;
  ObsMutex      : TMutex    = nil;
  ChangeSP      : TMutex    = nil;

type
  TInitSectorLoopAzThread = class(TThread)
  public
    constructor Create;
  protected
    procedure Execute;  override;
  end;

  TInitSectorLoopElThread = class(TThread)
  public
    constructor Create;
  protected
    procedure Execute;  override;
  end;

  TSnapshotThread = class(TThread)
  public
    constructor Create;
  protected
    procedure Execute;  override;
  end;

type
  TCleanupThread = class(TThread)
  public
    constructor Create;
  protected
    procedure Execute;  override;
  end;

const
  Msg_Waiting = 'En espera';

var
  InitSectorLoopAzThread : TInitSectorLoopAzThread;
  InitSectorLoopElThread : TInitSectorLoopElThread;

{ TControlMutex }

procedure TControlMutex.Release;
begin
  inherited;
  WriteView.Last_Action_Time := Now;
end;

function TControlMutex.WaitFor(Timeout: dword): boolean;
begin
  Result := inherited WaitFor(TimeOut);
  if Result
    then WriteView.Last_Action_Time := Now;
end;

// Private procedures & functions

procedure MaskDOBits( Bits, Mask : int64 );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        with WriteView^ do
          begin
            Bits := Digital_Output and not Mask or Bits and Mask;
            Digital_Output := Bits;
            Digital_Output := Advantech.Set_Digital_Output(Digital_Output);
          end;
      finally
        ControlMutex.Release;
      end;
end;

procedure SetDOBits( Bits : int64 );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        with WriteView^ do
        begin
          Bits := Digital_Output or Bits;
          Digital_Output := Bits;
          Digital_Output := Advantech.Set_Digital_Output(Digital_Output);
        end;
      finally
        ControlMutex.Release;
      end;
end;

procedure ClearDOBits( Bits : int64 );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        with WriteView^ do
        begin
          Bits := Digital_Output and not Bits;
          Digital_Output := Bits;
          Digital_Output := Advantech.Set_Digital_Output(Digital_Output);
        end;
      finally
        ControlMutex.Release;
      end;
end;

procedure ClearCommand( Bits : int64 );
begin
  Sleep(500);
  ClearDOBits(Bits);
end;

procedure Set_SyncMark(direction: boolean; rays: integer);
begin
  if DRX1.Ready
    then DRX1.Sync_WS.Set_Sector_Mode(direction, rays);
  if DRX2.Ready
    then DRX2.Sync_WS.Set_Sector_Mode(direction, rays);

  with WriteView^ do
  begin
    SyncMark := rays;
    SyncMarkDirection := direction;
  end;
end;

procedure SetDACodeAz( Code : integer );
begin
  if Code >  2047 then Code :=  2047;
  if Code < -2048 then Code := -2048;
  WriteView^.Analog_Output[ao_Azimut] := 2048 + Code;
  Advantech.Set_Analog_Output_Channel(ao_Azimut, SnapShot^.Analog_Output[ao_Azimut]);
end;

procedure SetDACodeEl( Code : integer );
begin
  if Code >  2047 then Code :=  2047;
  if Code < -2048 then Code := -2048;
  WriteView^.Analog_Output[ao_Elevacion] := 2048 + Code;
  Advantech.Set_Analog_Output_Channel(ao_Elevacion, SnapShot^.Analog_Output[ao_Elevacion]);
end;

procedure WaitForTxsStantby;
const
  Timeout = 10000;
{$IFNDEF RDA_Simulation}
var
  StartTime : cardinal;
{$ENDIF}
begin
  Tx1_Standby(true);
  Tx2_Standby(true);

{$IFNDEF RDA_Simulation}
  StartTime := GetTickCount;
  while not(Is_Tx1Standby and Is_Tx2Standby) and (StartTime - GetTickCount < Timeout) do Sleep(10);
  if not Is_Tx1Standby and not Is_Tx2Standby
    then raise Exception.Create( 'Los trasmisores no caen en StandBy' )
    else if not Is_Tx1Standby
         then raise Exception.Create( 'El trasmisor #1 no cae en StandBy' )
         else if not Is_Tx2Standby
                then raise Exception.Create( 'El trasmisor #2 no cae en StandBy' );
{$ELSE}
  Sleep(2000);
{$ENDIF}
end;

function AI_InSector(Value: integer; Range: TAIRange): boolean;
begin
  Result := (Value >= Range.Min) and (Value <= Range.Max);
end;

procedure WaitForRadarOff;
begin
  Apagar_Radar;
end;

// Public procedures & functions

// Radar

procedure Encender_Radar;
begin
  ClearDOBits(do_Radar_Apagar);
  SetDOBits(do_Radar_Encender);
end;

procedure Apagar_Radar;
begin
  try
    WaitForTxsStantby;
  except
    on E : Exception do
      LogMessages.AddLogRawMessage( Now, lcError, GetController, TxZone, E.Message, E.Message );
  end;
  ClearDOBits(do_Radar_Encender);
  SetDOBits(do_Radar_Apagar);
end;

//Aire Acondicionado
procedure Air1( State : boolean );
begin
  if State
    then SetDOBits(do_Aire_1)
    else ClearDOBits(do_Aire_1);
end;

procedure Air2( State : boolean );
begin
  if State
    then SetDOBits(do_Aire_2)
    else ClearDOBits(do_Aire_2);
end;

procedure Air3( State : boolean );
begin
  if State
    then SetDOBits(do_Aire_3)
    else ClearDOBits(do_Aire_3);
end;


// Antenna

procedure Encender_Accionamiento;
begin
  if not Antenna_TurningOn
    then TAntenna_OnThread.Create;
end;

procedure Apagar_Accionamiento;
begin
  EnableMotorAz(false);
  EnableMotorEl(false);

  ClearDOBits(do_Acc_Encender);

  Set_Lazo_Posicion_Az(false);
  Set_Lazo_Posicion_El(false);
end;

procedure Alarma_Sonora( Tiempo : integer );
begin
  SetDOBits(do_Alarma_Sonora);
  try
    Sleep(Tiempo);
  finally
    ClearDOBits(do_Alarma_Sonora);
  end;
end;

// Motor Az
function  ClockwiseAz : boolean;
begin
  result := Snapshot^.SP_Velocity_Az >= 0;
end;

procedure Set_Lazo_Sector_AZ( State : boolean );
begin
  if State
    then TInitSectorLoopAzThread.Create
    else
      begin
        if Assigned(InitSectorLoopAzThread)
           then
             try
               InitSectorLoopAzThread.Terminate;
             except
               InitSectorLoopAzThread := nil;
             end;
        if ControlMutex.WaitFor(ControlTime)
          then
            try
              WriteView^.Sector_Loop_Az := false;
            finally
              ControlMutex.Release;
            end;
      end;
end;

procedure Set_Lazo_Posicion_Az( State : boolean );
begin
  Set_SP_Velocidad_Az(0);
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Position_Loop_Az := State;
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Mark_Posicion_Az( Value : integer );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Mark_Position_Az := Value;
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_SP_Posicion_Az(Value: Integer);
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.SP_Position_Az := Value;
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_SP_Velocidad_Az(Value: Integer);
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        if not Snapshot.Sector_Loop_Az
          then WriteView^.SP_Velocity_Az := Value
          else
            begin
              Value := Abs( Value );
              if ChangeSP.WaitFor( 1000 )
                then
                  try
                    if ClockwiseAz
                      then WriteView^.SP_Velocity_Az := Value
                      else WriteView^.SP_Velocity_Az := -Value;
                  finally
                    ChangeSP.Release;
                  end;
            end;
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Lazo_K_Pos_Az( Value : single );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Position_Loop_Az_K := Value;
      finally
        ControlMutex.Release;
      end;
  SaveKPosAz(Value);
end;

procedure Set_Lazo_K_Vel_Az( Value : single );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Velocity_Loop_Az_K := Value;
      finally
        ControlMutex.Release;
      end;
  SaveKVelAz(Value);
end;

// Motor El
function  ClockwiseEl : boolean;
begin
  result := Snapshot^.SP_Velocity_El >= 0;
end;

procedure Set_Lazo_Sector_El( State : boolean );
begin
  if State
    then TInitSectorLoopElThread.Create
    else
      begin
        if Assigned( InitSectorLoopElThread )
           then
             try
               InitSectorLoopElThread.Terminate;
             except
               InitSectorLoopElThread := nil;
             end;
        if ControlMutex.WaitFor(ControlTime)
          then
            try
              WriteView^.Sector_Loop_El := false;
            finally
              ControlMutex.Release;
            end;
      end;
end;

procedure Set_Mark_Posicion_El( Value : integer );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Mark_Position_El := Value;
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Lazo_Posicion_El( State : boolean );
begin
  Set_SP_Velocidad_El(0);
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Position_Loop_El := State;
      finally
        ControlMutex.Release;
      end;
end;

procedure EnableMotorEl( State : boolean );
begin
  if State and theConfiguration.Motor_EL_Enabled
    then SetDOBits(do_Habilitar_El)
    else ClearDOBits(do_Habilitar_El);
end;

procedure EnableMotorAz( State : boolean );
begin
  if State
    then SetDOBits(do_Habilitar_Az)
    else ClearDOBits(do_Habilitar_Az);
end;

procedure Set_SP_Posicion_El(Value: Integer);
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.SP_Position_El := Value;
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_SP_Velocidad_El(Value: Integer);
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        if not Snapshot.Sector_Loop_El
          then WriteView^.SP_Velocity_El := Value
          else
            begin
              Value := Abs( Value );
              if ChangeSP.WaitFor( 1000 )
                then
                  try
                    if ClockwiseEl
                      then WriteView^.SP_Velocity_El := Value
                      else WriteView^.SP_Velocity_El := -Value;
                  finally
                    ChangeSP.Release;
                  end;
            end;
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Lazo_K_Pos_El( Value : single );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Position_Loop_El_K := Value;
        SaveKPosEl(Value);
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Lazo_K_Vel_El( Value : single );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Velocity_Loop_El_K := Value;
        SaveKVelEl(Value);
      finally
        ControlMutex.Release;
      end;
end;

// TxRx1

procedure Tx1_ClearSynch;
begin
  with WriteView^ do
  begin
    Tx1_Pulse            := tx_Pulse_None;
    Tx1_PRF_Rate         := tx_Dual_None;
    Tx1_Sample_Rate      := 0;
    Tx1_Trigger_Rate     := 0;
    Tx1_Sample_Cell_Size := 0;
    Tx1_Sample_Max_Count := 0;
  end;
end;

procedure Tx1_Long_Pulse;
begin
  if not PulseChanging[0] 
    then TPulseChangeThread.LongPulse(0);
end;

procedure Tx1_Short_Pulse(PRF_Rate : TxDualPulse);
begin
  if not PulseChanging[0] 
    then TPulseChangeThread.ShortPulse(0, PRF_Rate);
end;

procedure Tx1_Encender;
begin
  ClearDOBits(do_Tx1_Apagar);
  SetDOBits(do_Tx1_Encender);
end;

procedure Tx1_Apagar;
begin
  ClearDOBits(do_Tx1_Encender);
  SetDOBits(do_Tx1_Apagar);
end;

procedure Rx1_Encender;
begin
  ClearDOBits(do_Rx1_Apagar);
  SetDOBits(do_Rx1_Encender);
end;

procedure Rx1_Apagar;
begin
  ClearDOBits(do_Rx1_Encender);
  SetDOBits(do_Rx1_Apagar);
end;

procedure Tx1_Standby( State : boolean );
begin
  if State
    then SetDOBits(do_Tx1_HV)
    else ClearDOBits(do_Tx1_HV);
end;

// TxRx2

procedure Tx2_ClearSynch;
begin
  with WriteView^ do
  begin
    Tx2_Pulse            := tx_Pulse_None;
    Tx2_PRF_Rate         := tx_Dual_None;
    Tx2_Sample_Rate      := 0;
    Tx2_Trigger_Rate     := 0;
    Tx2_Sample_Cell_Size := 0;
    Tx2_Sample_Max_Count := 0;
  end;
end;

procedure Tx2_Long_Pulse;
begin
  if not PulseChanging[1] 
    then TPulseChangeThread.LongPulse(1);
end;

procedure Tx2_Short_Pulse(PRF_Rate : TxDualPulse);
begin
  if not PulseChanging[1] 
    then TPulseChangeThread.ShortPulse(1, PRF_Rate);
end;

procedure Tx2_Encender;
begin
  if not TX_TurningOn[1]
    then TTX_OnThread.Create(1);
end;

procedure Tx2_Apagar;
begin
  Tx2_Standby(true);
  ClearDOBits(do_Tx2_MPS_On);
  ClearDOBits(do_Tx2_Encender);
  SetDOBits(do_Tx2_Apagar);
end;

procedure Rx2_Encender;
begin
  ClearDOBits(do_Rx2_Apagar);
  SetDOBits(do_Rx2_Encender);
end;

procedure Rx2_Apagar;
begin
  ClearDOBits(do_Rx2_Encender);
  SetDOBits(do_Rx2_Apagar);
end;

procedure Tx2_Standby( State : boolean );
begin
  if State
    then
      begin
        Advantech.Set_Analog_Output_Channel(ao_Tx2_MPS, 0);
        if ControlMutex.WaitFor(ControlTime)
          then
            try
              WriteView^.Analog_Output[ao_Tx2_MPS] := 0;
            finally
              ControlMutex.Release;
            end;

        ClearDOBits(do_Tx2_HV);
      end
    else if not MPS_Changing[1]
           then TMPS_OnThread.Create(1, theCalibration.MPS_Voltage2);
end;

// Analog input ranges & sectors

function Load_AI_Range( AI : AIRange ) : TAIRange;
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        Result := LoadAIRange(AI);
      finally
        ControlMutex.Release;
      end;
end;

function Load_AI_Sector( AI : AIRange ) : TAIRange;
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        Result := LoadAISector(AI);
      finally
        ControlMutex.Release;
      end;
end;

function BinaryToKW( const Binary : cardinal ) : double;
begin
  result := 0;
end;

procedure Set_AI_Range( AI : AIRange; const Range : TAIRange );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.AI_Range[AI].Min := Range.Min;
        WriteView^.AI_Range[AI].Max := Range.Max;
        SaveAIRange(AI, Range);
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_AI_Sector( AI : AIRange; const Range : TAIRange );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.AI_Sector[AI].Min := Range.Min;
        WriteView^.AI_Sector[AI].Max := Range.Max;
        SaveAISector(AI, Range);
      finally
        ControlMutex.Release;
      end;
end;

// Obs Engine

procedure Report_Obs_Start( Name, Client : string );
begin
  ObsMutex.Acquire;
  with WriteView^ do
    begin
      ObsInProgress := true;
      ObsName       := Name;
      ObsClient     := Client;
      ObsStartTime  := Now;
      ObsLastTime   := 0;
      ObsProgress   := 0;
      ObsMessage    := '';
      ObsSubMsg     := '';
      ObsResult     := obs_InProgress;
      ObsCancel     := false;
    end;
  LogMessages.AddLogMessage(lcInformation, Client, ObservationZone, Name, Name );
end;

procedure Report_Obs_Finish( Result : integer );
begin
  case Result of
    obs_Ok:
      LogMessages.AddLogMessage(lcInformation, Snapshot.ObsClient, ObservationZone, 'Tarea terminada', 'Tarea terminada' );
    obs_Canceled:
      LogMessages.AddLogMessage(lcWarning, Snapshot.ObsClient, ObservationZone, Snapshot.ObsMessage, Snapshot.ObsSubMsg );
    obs_Failed:
      LogMessages.AddLogMessage(lcError, Snapshot.ObsClient, ObservationZone, Snapshot.ObsMessage, Snapshot.ObsSubMsg );
  end;
  with WriteView^ do
    begin
      ObsInProgress := false;
      ObsLastTime   := ObsStartTime;
      ObsResult     := Result;
      if (Result = obs_Ok) or (Result = obs_Nothing)
        then
          begin
            ObsName      := '';
            ObsClient    := '';
            ObsMessage   := Msg_Waiting;
            ObsSubMsg    := '';
            ObsStartTime := 0;
            ObsProgress  := 0;
            ObsCancel    := false;
          end;
    end;
  ObsMutex.Release;
end;

procedure Report_Obs_Progress( Progress : integer; M, S : string );
begin
  if ObsMutex.WaitFor(ControlTime)
    then
      try
        if Snapshot.ObsInProgress
          then
            with WriteView^ do
              begin
                ObsProgress := Progress;
                ObsMessage  := M;
                ObsSubMsg   := S;
              end;
      finally
        ObsMutex.Release;
      end;
end;

// Control

procedure Acquire_Control;
begin
  ControlMutex.Acquire;
end;

procedure Release_Control;
begin
  ControlMutex.Release;
end;

{ TSnapshotThread }

constructor TSnapshotThread.Create;
begin
  inherited Create(true);
  Priority := tpNormal;
  Resume;
end;

procedure TSnapshotThread.Execute;
var
  i : integer;
begin
  while not SnapshotMutex.WaitFor(1000) do
    if Terminated
      then Exit;

  CoInitialize(nil);
  try
    with WriteView^ do
      while not Terminated do
        begin
          Digital_Input := Advantech.Get_Digital_Input;

          //invierto la senal de standby de 3cm
          if Digital_Input and di_Tx1_HV = di_Tx1_HV
            then Digital_Input := Digital_Input and (not di_Tx1_HV)
            else Digital_Input := Digital_Input or di_Tx1_HV;

          Analog_Input := Advantech.Get_Analog_Input;

          for i := Low(Analog_Input) to High(Analog_Input) do
            Analog_Input_Voltage[i] := Get_Analog_Input_Voltage_Channel(i, theConfiguration.AIGains[i]) * theConfiguration.AIFactors[i];

          MotorAz_ON := Is_MotorAzOn;
          MotorAz_Ok := Is_MotorAzOk;

          MotorEl_ON := Is_MotorElOn;
          MotorEl_Ok := Is_MotorElOk;

          Antena_ON  := Is_AntennaOn;
          Antena_Ok  := Is_AntennaOk;

          Tx1_ON     := Is_Tx1On;
          Tx1_Ok     := Is_Tx1Ok;

          Rx1_ON     := Is_Rx1On;
          Rx1_Ok     := Is_Rx1Ok;

          Tx2_ON     := Is_Tx2On;
          Tx2_Ok     := Is_Tx2Ok;

          Rx2_ON     := Is_Rx2On;
          Rx2_Ok     := Is_Rx2Ok;

          Radar_ON   := Is_RadarOn;
          Radar_Ok   := Is_RadarOk;

          Sleep(1000);
        end;

  finally
    CoUninitialize;
    SnapshotMutex.Release;
  end;
end;

{ TCleanupThread }

constructor TCleanupThread.Create;
begin
  inherited Create(true);
  Priority := tpLowest;
  Resume;
end;

procedure TCleanupThread.Execute;
begin
  while not CleanupMutex.WaitFor(1000) do
    if Terminated
      then Exit;

  try
    with Snapshot^ do
      while not Terminated do
        begin
          theStatisticsConfig.BeginSwitched(RDAIndex);
          // do_Radar_Encender
          if Radar_ON
            then
              begin
                if (Digital_Output and do_Radar_Encender) <> 0
                  then ClearCommand(do_Radar_Encender);
                theStatisticsConfig.BeginSwitched(RadarIndex);
              end;
          // do_Radar_Apagar
          if not Radar_ON
            then
              begin
                if (Digital_Output and do_Radar_Apagar) <> 0
                  then ClearCommand(do_Radar_Apagar);
                theStatisticsConfig.EndSwitched(RadarIndex);
              end;
          // do_Tx1_Encender
          if Tx1_ON
            then
              begin
                if (Digital_Output and do_Tx1_Encender) <> 0
                  then ClearCommand(do_Tx1_Encender);
                theStatisticsConfig.BeginSwitched(TxCaldeoIndex);
                theStatisticsConfig.BeginSwitched(MagCaldeoIndex);
                theStatisticsConfig.BeginSwitched(TirPrincIndex);
                theStatisticsConfig.BeginSwitched(TirAuxIndex);
              end;
          // do_Tx2_Encender
          if Tx2_ON
            then
              begin
                if (Digital_Output and do_Tx2_Encender) <> 0
                  then ClearCommand(do_Tx2_Encender);
                theStatisticsConfig.BeginSwitched(TxCaldeo2Index);
                theStatisticsConfig.BeginSwitched(MagCaldeo2Index);
                theStatisticsConfig.BeginSwitched(TirPrinc2Index);
                theStatisticsConfig.BeginSwitched(TirAux2Index);
              end;
          // do_Tx1_Apagar
          if not Tx1_ON
            then
              begin
                if (Digital_Output and do_Tx1_Apagar) <> 0
                  then ClearCommand(do_Tx1_Apagar);
                theStatisticsConfig.EndSwitched(TxCaldeoIndex);
                theStatisticsConfig.EndSwitched(TirPrincIndex);
                theStatisticsConfig.EndSwitched(TirAuxIndex);
                theStatisticsConfig.EndSwitched(MagCaldeoIndex);
              end;
          // do_Tx2_Apagar
          if not Tx2_ON
            then
              begin
                if (Digital_Output and do_Tx2_Apagar) <> 0
                  then ClearCommand(do_Tx2_Apagar);
                theStatisticsConfig.EndSwitched(TxCaldeo2Index);
                theStatisticsConfig.EndSwitched(TirPrinc2Index);
                theStatisticsConfig.EndSwitched(TirAux2Index);
                theStatisticsConfig.EndSwitched(MagCaldeo2Index);
              end;
          // do_Rx1_Encender
          if Rx1_ON
            then
              begin
                if (Digital_Output and do_Rx1_Encender) <> 0
                  then ClearCommand(do_Rx1_Encender);
                theStatisticsConfig.BeginSwitched(RxIndex);
              end;
          // do_Rx2_Encender
          if Rx2_ON
            then
              begin
                if (Digital_Output and do_Rx2_Encender) <> 0
                  then ClearCommand(do_Rx2_Encender);
                theStatisticsConfig.BeginSwitched(Rx2Index);
              end;
          // do_Rx1_Apagar
          if not Rx1_ON
            then
              begin
                if (Digital_Output and do_Rx1_Apagar) <> 0
                  then ClearCommand(do_Rx1_Apagar);
                theStatisticsConfig.EndSwitched(RxIndex);
              end;
          // do_Rx2_Apagar
          if not Rx2_ON
            then
              begin
                if (Digital_Output and do_Rx2_Apagar) <> 0
                  then ClearCommand(do_Rx2_Apagar);
                theStatisticsConfig.EndSwitched(Rx2Index);
              end;
          //Radiar
          if not Is_Tx1Standby
            then
              begin
                theStatisticsConfig.BeginSwitched(TxAnodoIndex);
                theStatisticsConfig.BeginSwitched(MagAnodoIndex);
                theStatisticsConfig.BeginSwitched(TirPrincAnodo1Index);
              end;
          if Is_Tx1Standby
            then
              begin
                theStatisticsConfig.EndSwitched(TxAnodoIndex);
                theStatisticsConfig.EndSwitched(MagAnodoIndex);
                theStatisticsConfig.EndSwitched(TirPrincAnodo1Index);
              end;
          if not Is_Tx2Standby
            then
              begin
                theStatisticsConfig.BeginSwitched(TxAnodo2Index);
                theStatisticsConfig.BeginSwitched(MagAnodo2Index);
                theStatisticsConfig.BeginSwitched(TirPrincAnodo2Index);
              end;
          if Is_Tx2Standby
            then
              begin
                theStatisticsConfig.EndSwitched(TxAnodo2Index);
                theStatisticsConfig.EndSwitched(MagAnodo2Index);
                theStatisticsConfig.EndSwitched(TirPrincAnodo2Index);
              end;

          Sleep(3000);
        end;
  finally
    CleanupMutex.Release;
  end;
end;

{ TAntennaThread }

constructor TAntennaThread.Create;
begin
  inherited Create(true);
  Priority := tpTimeCritical;
  Resume;
end;

procedure TAntennaThread.Execute;
var
  Freq     : int64;
  Count    : int64;
  Last     : int64;
  Time     : int64;
  Interval : int64;
  Last_Az  : integer;
  Last_El  : integer;
  Prec     : single;
  FinishAng,
  OffsetAng,
  AntPos   : integer;
begin
  while not AntennaMutex.WaitFor(500) do
    if Terminated then Exit;
  try
    QueryPerformanceFrequency(Freq);
    Interval := Freq div 5;  // 1/5 sec
    Last_Az  := 0;
    Last_El  := 0;
    Last     := 0;
    with WriteView^ do
      while not Terminated do
        begin
          // Read positions
          Position_Az := Deva.Read_Encoder_X;
          Position_El := Deva.Read_Encoder_Y;
          // Velocity estimation
          QueryPerformanceCounter(Count);
          Time := Count - Last;
          if Time > Interval
            then
              begin
                Prec := Freq/Time;
                Last := Count;
                Velocity_Az := round(Distance(Position_Az, Last_Az) * Prec);
                Velocity_El := round(Distance(Position_El, Last_El) * Prec);
                Last_Az := Position_Az;
                Last_El := Position_El;
              end;
          // Control loops
          if Position_Loop_Az
            then SetDACodeAz(round(SnapShot.Position_Loop_Az_K * Distance(SnapShot.SP_Position_Az, SnapShot.Position_Az)))
            else
              begin
                if Sector_Loop_Az
                 then
                   begin
                     OffsetAng := Snapshot.SP_Position_Az;
                     FinishAng := SnapShot.Mark_Position_Az - OffsetAng;
                     if FinishAng < 0
                       then FinishAng := FinishAng + AntennaMaxValue;
                     if FinishAng > MinSector
                       then
                         begin
                           AntPos := SnapShot.Position_Az - OffsetAng + theConfiguration.AngleAcc;
                           if AntPos < 0
                             then AntPos := AntPos + AntennaMaxValue;
                           if SnapShot.SP_Velocity_Az <> 0
                             then
                               if ((ClockwiseAz) and (AntPos > FinishAng) and (Abs(AntPos - FinishAng) < MinSector)) or
                                  ((not ClockwiseAz) and (AntPos > (AntennaMaxValue-MinSector)))
                                 then
                                   if ChangeSP.WaitFor( 1000 )
                                     then
                                       try
                                         if SnapShot.SP_Velocity_Az <> 0
                                           then SP_Velocity_Az := -SnapShot.SP_Velocity_Az;
                                       finally
                                         ChangeSP.Release;
                                       end;
                         end;
                   end;
                //Rampa
                //SetDACodeAz(round(Velocity_Loop_Az_K * SP_Velocity_Az));
                if(Abs(SnapShot.SP_Velocity_Az - Snapshot.Velocity_Az) > RampAz)
                  then
                    if SP_Velocity_Az - Snapshot.Velocity_Az > 0
                      then SetDACodeAz(round(SnapShot.Velocity_Loop_Az_K * (Snapshot.Velocity_Az + RampAz)))
                      else SetDACodeAz(round(SnapShot.Velocity_Loop_Az_K * (Snapshot.Velocity_Az - RampAz)))
                   else SetDACodeAz(round(SnapShot.Velocity_Loop_Az_K * SnapShot.SP_Velocity_Az));
              end;
          if Position_Loop_El
            then SetDACodeEl(round(Position_Loop_El_K * Distance(SP_Position_El, Position_El)))
            else
             begin
               if Sector_Loop_El
                 then
                   begin
                     if Snapshot.SP_Position_El < SnapShot.Mark_Position_El
                       then
                         begin
                           OffsetAng := Snapshot.SP_Position_El;
                           FinishAng := SnapShot.Mark_Position_El - OffsetAng;
                         end
                       else
                         begin
                           OffsetAng := SnapShot.Mark_Position_El;
                           FinishAng := Snapshot.SP_Position_El - OffsetAng;
                         end;
                     if FinishAng > MinSector
                       then
                         begin
                           AntPos := SnapShot.Position_El - OffsetAng + theConfiguration.AngleAcc;;
                           if AntPos < 0
                             then AntPos := AntPos + AntennaMaxValue;
                           if SnapShot.SP_Velocity_El <> 0
                             then
                               if ((ClockwiseEl) and (AntPos > FinishAng) and (Abs(AntPos - FinishAng) < MinSector)) or
                                  ((not ClockwiseEl) and (AntPos > (AntennaMaxValue-MinSector)))
                                 then
                                   if ChangeSP.WaitFor( 1000 )
                                     then
                                       try
                                         if Snapshot.SP_Velocity_El <> 0
                                           then SP_Velocity_El := -Snapshot.SP_Velocity_El;
                                       finally
                                         ChangeSP.Release;
                                       end;
                         end;
                   end;
               //SetDACodeEl(round(Velocity_Loop_El_K * SP_Velocity_El));
               if(Abs(SP_Velocity_El - Snapshot.Velocity_El) > RampEl)
                 then
                   if Snapshot.SP_Velocity_El - Snapshot.Velocity_El > 0
                     then SetDACodeEl(round(Snapshot.Velocity_Loop_El_K * (Snapshot.Velocity_El + RampEl)))
                     else SetDACodeEl(round(Snapshot.Velocity_Loop_El_K * (Snapshot.Velocity_El - RampEl)))
                  else SetDACodeEl(round(Snapshot.Velocity_Loop_El_K * Snapshot.SP_Velocity_El));
             end;
          Sleep(50);
        end;
  finally
    AntennaMutex.Release;
  end;
end;

// Initialization and finalization

var
  SnapShotThread : TSnapshotThread = nil;
  CleanupThread  : TCleanupThread  = nil;

procedure InitSnapshot;
var
  I : integer;
begin
  with WriteView^ do
    begin
      if SnapshotMutex.WaitFor(ControlTime)
        then
          try
            Digital_Output := 0;
            Digital_Output := Advantech.Set_Digital_Output(Digital_Output);
            SetDACodeAz(0);
            SetDACodeEl(0);
            // AI Ranges & Sectors
            for I := Low(AIRange) to High(AIRange) do
              begin
                AI_Range [I] := Load_AI_Range (I);
                AI_Sector[I] := Load_AI_Sector(I);
              end;
            //Loops
            Position_Loop_Az := false;
            Position_Loop_El := false;
            Sector_Loop_Az   := false;
            Sector_Loop_El   := false;
            // Control loop constants
            Velocity_Loop_Az_K := LoadKVelAz;
            Velocity_Loop_El_K := LoadKVelEl;
            Position_Loop_Az_K := LoadKPosAz;
            Position_Loop_El_K := LoadKPosEl;
            SyncMark           := 0;
            SyncMarkDirection  := false;

            //Pulse
            Tx1_Pulse    := tx_Pulse_None;
            Tx1_PRF_Rate := tx_Dual_None;
            Tx1_Trigger_Rate := 0;
            Tx1_Sample_Rate  := 0;
            Tx1_Sample_Cell_Size := 0;
            Tx1_Sample_Max_Count := 0;
            Tx2_Pulse    := tx_Pulse_None;
            Tx2_PRF_Rate := tx_Dual_None;
            Tx2_Trigger_Rate := 0;
            Tx2_Sample_Rate  := 0;
            Tx2_Sample_Cell_Size := 0;
            Tx2_Sample_Max_Count := 0;

            // Obs engine
            ObsInProgress := false;
            ObsName       := '';
            ObsClient     := '';
            ObsStartTime  := 0.0;
            ObsLastTime   := 0.0;
            ObsProgress   := 0;
            ObsMessage    := Msg_Waiting;
            ObsSubMsg     := '';
            ObsResult     := 0;
          finally
            SnapshotMutex.Release;
          end;
    end;
end;

procedure InitElbrus;
begin
  Antenna_TurningOn := false;
  PulseChanging[0]  := false;
  PulseChanging[1]  := false;
  MPS_Changing[0]   := false;
  MPS_Changing[1]   := false;
  TX_TurningOn[0]   := false;
  TX_TurningOn[1]   := false;

  Init_Encoder;  // Deva
  Init_Devices;  // Advantech

  FileMapping := CreateFileMapping($FFFFFFFF, nil,
                                   PAGE_READWRITE,
                                   0, sizeof(TSnapshot),
                                   SnapshotName);
  Assert(FileMapping <> 0);
  ControlMutex   := TControlMutex.Create(nil, false, ControlMutexName);
  SnapshotMutex  := TMutex.Create(nil, false, SnapshotMutexName);
  CleanupMutex   := TMutex.Create(nil, false, CleanupMutexName);
  AntennaMutex   := TMutex.Create(nil, false, AntennaMutexName);
  ObsMutex       := TMutex.Create(nil, false, ObsMutexName);
  ChangeSP       := TMutex.Create(nil, false, '');
  Snapshot       := MapViewOfFile(FileMapping, FILE_MAP_READ,  0, 0, 0);
  WriteView      := MapViewOfFile(FileMapping, FILE_MAP_WRITE, 0, 0, 0);
  Assert(Snapshot  <> nil);
  Assert(WriteView <> nil);
  InitSnapshot;

  SnapShotThread := TSnapshotThread.Create;
  CleanupThread  := TCleanupThread.Create;
  AntennaThread  := TAntennaThread.Create;
  Initialized    := true;
  LogMessages.AddLogMessage(lcInformation, 'Automatic', ElbrusZone, 'Elbrus Inicializado...', 'Elbrus Inicializado...' );
end;

procedure DoneElbrus;
begin
  try
    AntennaThread.Terminate;
    CleanupThread.Terminate;
    SnapshotThread.Terminate;
    Sleep(5000);
    FreeAndNil(AntennaThread);
    FreeAndNil(CleanupThread);
    FreeAndNil(SnapshotThread);
    try
      Tx1_Standby(true);
      Tx2_Standby(true);
    except
    end;
    Sleep(3000);
    ClearDOBits($FFFFFFFF);
    SetDACodeAz(0);
    SetDACodeEl(0);
    UnmapViewOfFile(WriteView);
    WriteView := nil;
    UnmapViewOfFile(Snapshot);
    SnapShot := nil;
    FreeAndNil(ObsMutex);
    FreeAndNil(AntennaMutex);
    FreeAndNil(CleanupMutex);
    FreeAndNil(SnapshotMutex);
    FreeAndNil(ControlMutex);
    FreeAndNil(ChangeSP);
    CloseHandle(FileMapping);

    Done_Devices;
    Done_Encoder;

    LogMessages.AddLogMessage(lcInformation, 'Automatic', ElbrusZone, 'Elbrus Terminado', 'Elbrus Terminado' );
  except
  end;
end;

//conditions

function InSector(Value : integer; Range : TAIRange) : boolean;
begin
  Result := (Value >= Range.Min) and (Value <= Range.Max);
end;

function WaitCondition( Condition : TConditionFunction; Period : cardinal; Timeout : cardinal) : boolean;
var
  StartTime : cardinal;
begin
  result := (@Condition = nil) or Condition;
  if Timeout > 0
    then
      begin
        StartTime := GetTickCount;
        while not result and (GetTickCount - StartTime < Timeout) do
        begin
          Sleep(Period);
          result := Condition;
        end;
      end;
end;

function Is_RadarOn  : boolean;
begin
  result := SnapShot^.Digital_Input and RadarOnQuery <> 0;
end;

function Is_RadarOk  : boolean;
begin
  result := SnapShot^.Digital_Input and RadarOkQuery = RadarOkResult;
end;

function Is_AntennaOn : boolean;
begin
  result := SnapShot^.Digital_Output and AntennaOnQuery = AntennaOnQuery;
end;

function Is_AntennaOk : boolean;
begin
  result := SnapShot^.Digital_Input and AntennaOkQuery = AntennaOkResult;

  result := result and Is_MotorAzOk and Is_MotorElOk;

  result := result and InSector(Snapshot^.Analog_Input[ai_Fuente_Excitacion], Snapshot^.AI_Sector[ai_Fuente_Excitacion]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Fuente_5V_P],       Snapshot^.AI_Sector[ai_Fuente_5V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Fuente_12V_P],      Snapshot^.AI_Sector[ai_Fuente_12V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Fuente_24V_P],      Snapshot^.AI_Sector[ai_Fuente_24V_P]);
end;

function Is_MotorsOn : boolean;
begin
  result := Is_MotorAzOn or Is_MotorElOn;
end;

function Is_MotorAzOn  : boolean;
begin
  result := SnapShot^.Digital_Output and MotorAzOnQuery = MotorAzOnQuery;
end;

function Is_MotorAzOk : boolean;
begin
  result := SnapShot^.Digital_Input and di_Acc_Listo_Az = di_Acc_Listo_Az;
end;

function Is_MotorElOn  : boolean;
begin
  result := SnapShot^.Digital_Output and MotorElOnQuery = MotorElOnQuery;
end;

function Is_MotorElOk : boolean;
begin
  result := (not theConfiguration.Motor_EL_Enabled) or (SnapShot^.Digital_Input and di_Acc_Listo_El = di_Acc_Listo_El);
end;

function Is_MotorsOk : boolean;
begin
  result := Is_MotorAzOk and Is_MotorAzOk;
end;

function Is_SpeedAz : boolean;
begin
  Result := abs(Snapshot.SP_Velocity_Az - Snapshot.Velocity_Az) <= theConfiguration.SpeedAcc;
end;

function Is_PositionAz : boolean;
begin
  Result := abs(Distance(Snapshot.SP_Position_Az, Snapshot.Position_Az)) <= theConfiguration.AngleAcc;
end;

function Is_PositionEl : boolean;
begin
  Result := abs(Distance(Snapshot.SP_Position_El, Snapshot.Position_El)) <= theConfiguration.AngleAcc;
end;

function Is_SpeedElZero : boolean;
begin
  result := Snapshot.Velocity_Az = 0;
end;

function Is_Tx1On  : boolean;
begin
  result := SnapShot^.Digital_Input and Tx1OnQuery <> 0;
end;

function Is_Tx1Ok  : boolean;
begin
  result := SnapShot^.Digital_Input and Tx1OkQuery = Tx1OkResult;

  result := result and InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_24V_P], Snapshot^.AI_Sector[ai_Tx1_fuente_24V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_24V_N], Snapshot^.AI_Sector[ai_Tx1_fuente_24V_N]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_50V_P], Snapshot^.AI_Sector[ai_Tx1_fuente_50V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_100V_P], Snapshot^.AI_Sector[ai_Tx1_fuente_100V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_400V_P], Snapshot^.AI_Sector[ai_Tx1_fuente_400V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx1_Fuente_Filamento], Snapshot^.AI_Sector[ai_Tx1_Fuente_Filamento]);

  if Snapshot.Digital_Input and di_Tx1_HV = di_Tx1_HV
    then result := result and InSector(Snapshot^.Analog_Input[ai_Tx1_Potencia], Snapshot^.AI_Sector[ai_Tx1_Potencia]);
end;

function Is_Tx1Standby  : boolean;
begin
  result := SnapShot^.Digital_Input and Tx1StandbyQuery = 0;
end;

function Is_Tx2On  : boolean;
begin
  result := SnapShot^.Digital_Input and Tx2OnQuery <> 0;
end;

function Is_Tx2Ok  : boolean;
begin
  result := SnapShot^.Digital_Input and Tx2OkQuery = Tx2OkResult;

  result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_24V_P], Snapshot^.AI_Sector[ai_Tx2_fuente_24V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_24V_N], Snapshot^.AI_Sector[ai_Tx2_fuente_24V_N]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_50V_P], Snapshot^.AI_Sector[ai_Tx2_fuente_50V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_100V_P], Snapshot^.AI_Sector[ai_Tx2_fuente_100V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_400V_P], Snapshot^.AI_Sector[ai_Tx2_fuente_400V_P]);
  result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_Fuente_Filamento], Snapshot^.AI_Sector[ai_Tx2_Fuente_Filamento]);

  if Snapshot.Digital_Input and di_Tx1_HV = di_Tx1_HV
    then
      begin
        result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_Potencia], Snapshot^.AI_Sector[ai_Tx2_Potencia]);
        result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_MPS_Voltaje], Snapshot^.AI_Sector[ai_Tx2_MPS_Voltaje]);
        result := result and InSector(Snapshot^.Analog_Input[ai_Tx2_MPS_Corriente], Snapshot^.AI_Sector[ai_Tx2_MPS_Corriente]);
      end;
end;

function Is_Tx2Standby  : boolean;
begin
  result := SnapShot^.Digital_Input and Tx2StandbyQuery = 0;
end;

function Is_Rx1On  : boolean;
begin
  result := SnapShot^.Digital_Input and Rx1OnQuery <> 0;
end;

function Is_Rx1Ok  : boolean;
begin
  result := SnapShot^.Digital_Input and Rx1OkQuery = Rx1OkResult;
  result := result and DRX1.Ready;
end;

function Is_Rx2On  : boolean;
begin
  result := SnapShot^.Digital_Input and Rx2OnQuery <> 0;
end;

function Is_Rx2Ok  : boolean;
begin
  result := SnapShot^.Digital_Input and Rx2OkQuery = Rx2OkResult;
  result := result and DRX2.Ready;
end;


{ TInitSectorLoopAzThread }

constructor TInitSectorLoopAzThread.Create;
begin
  if Assigned( InitSectorLoopAzThread )
    then
      try
        InitSectorLoopAzThread.Terminate;
      except
      end;
  inherited Create(true);
  FreeOnTerminate := true;
  InitSectorLoopAzThread := self;
  Resume;
end;

procedure TInitSectorLoopAzThread.Execute;
var
  TimeCount : cardinal;
begin
  if ControlMutex.WaitFor(1000)
    then
      try
        WriteView^.SP_Velocity_Az := 0;
        WriteView^.Position_Loop_Az := true;
      finally
        ControlMutex.Release;
      end;
  try
    TimeCount := GetTickCount;
    while (not Terminated) and ((GetTickCount - TimeCount) < AzTimeOut) and
          (abs(Snapshot.SP_Position_Az - Snapshot.Position_Az) > theConfiguration.AngleAcc) do
      Sleep( 300 );
  finally
    if ControlMutex.WaitFor(1000)
      then
        try
          WriteView^.Position_Loop_Az := false;
          if not Terminated
            then WriteView^.Sector_Loop_Az := abs(Snapshot.SP_Position_Az - Snapshot.Position_Az) <= theConfiguration.AngleAcc;
        finally
          InitSectorLoopAzThread := nil;
          ControlMutex.Release;
        end;
  end;
end;

{ TInitSectorLoopElThread }

constructor TInitSectorLoopElThread.Create;
begin
  if Assigned( InitSectorLoopElThread )
    then
      try
        InitSectorLoopElThread.Terminate;
      except
      end;
  inherited Create(true);
  FreeOnTerminate := true;
  InitSectorLoopElThread := self;
  Resume;
end;

procedure TInitSectorLoopElThread.Execute;
var
  TimeCount : cardinal;
begin
  if ControlMutex.WaitFor(1000)
    then
      try
        WriteView^.SP_Velocity_El := 0;
        WriteView^.Position_Loop_El := true;
      finally
        ControlMutex.Release;
      end;
  try
    TimeCount := GetTickCount;
    while (not Terminated) and ((GetTickCount - TimeCount) < ElTimeOut) and
          (abs(Snapshot.SP_Position_El - Snapshot.Position_El) > theConfiguration.AngleAcc) do
      Sleep( 300 );
  finally
    if ControlMutex.WaitFor(1000)
      then
        try
          WriteView^.Position_Loop_El := false;
          if not Terminated
            then WriteView^.Sector_Loop_El := abs(Snapshot.SP_Position_El - Snapshot.Position_El) <= theConfiguration.AngleAcc;
        finally
          InitSectorLoopElThread := nil;
          ControlMutex.Release;
        end;
  end;
end;

{ TPulseChangeThread }

function TPulseChangeThread.ActionName: string;
begin
  result := 'Trasmisor ' + TxName + '.';
  if pulse_mode = tx_Pulse_Long
    then result := result + ' Cambiando a pulso largo'
    else
      case rate_mode of
        tx_Dual_54  : result := result + ' Cambiando a pulso corto. Razon de PRF 5/4';
        tx_Dual_43  : result := result + ' Cambiando a pulso corto. Razon de PRF 4/3';
        tx_Dual_32  : result := result + ' Cambiando a pulso corto. Razon de PRF 3/2';
        else result := result + ' Cambiando a pulso corto';
      end;
end;

constructor TPulseChangeThread.Create(Channel: integer);
begin
  inherited Create(Channel);

  PulseChanging[Channel] := true;
  pulse_mode := tx_Pulse_Long;
  rate_mode  := tx_Dual_None;

  Resume;
end;

procedure TPulseChangeThread.Execute;
var
  Delay : boolean;
  CurrentPulse : TxPulse;
  CurrentRate  : TxDualPulse;
begin
  Task_Start;
  CoInitialize(nil);
  ReturnValue := obs_Nothing;
  try
    if fChannel = 0
      then
        begin
          CurrentPulse := Snapshot^.Tx1_Pulse;
          CurrentRate  := Snapshot^.Tx1_PRF_Rate;
          drx          := DRX1;
        end
      else
        begin
          CurrentPulse := Snapshot^.Tx2_Pulse;
          CurrentRate  := Snapshot^.Tx2_PRF_Rate;
          drx          := DRX2;
        end;
        
    if (pulse_mode <> CurrentPulse) or ((pulse_mode = tx_Pulse_Short) and (rate_mode <> CurrentRate))
      then
        begin
          Delay := pulse_mode <> CurrentPulse;
          if fChannel = 0
            then Tx1_ClearSynch
            else Tx2_ClearSynch;

          WaitForCondition(nil, 0, 500, 5, 'Buscando DRX...', '');
          drx.Validate;

          if drx.Ready
            then
              begin
                try
                  //orden de cambio de pulso
                  if pulse_mode = tx_Pulse_Long
                    then drx.Sync_WS.Set_Pulso_Largo
                    else drx.Sync_WS.Set_Pulso_Corto(rate_mode);

                  //espero a que cambie el pulso
                  if fChannel = 0
                    then TxRx_Pulso_Largo := di_TxRx1_Pulso_Largo
                    else TxRx_Pulso_Largo := di_TxRx2_Pulso_Largo;

                  {$IFNDEF RDA_Simulation}
                  if pulse_mode = tx_Pulse_Long
                    then WaitForCondition(InLongPulse, 500, 5000, 10, 'Cambiando a pulso largo...', 'No fue posible cambiar a pulso largo...')
                    else WaitForCondition(InShortPulse, 500, 5000, 10, 'Cambiando a pulso corto...', 'No fue posible cambiar a pulso corto...');
                  {$ELSE}
                  if pulse_mode = tx_Pulse_Long
                    then WaitForCondition(nil, 500, 1000, 10, 'Cambiando a pulso largo...', '')
                    else WaitForCondition(nil, 500, 1000, 10, 'Cambiando a pulso corto...', '');
                  {$ENDIF}

                  //espero un tiempo antes de sacar los pulsos
                  if Delay
                    then WaitForCondition(nil, 1000, PulseChangingDelay, 100, 'Esperando ' + IntToStr(PulseChangingDelay) + ' ms', '');

                  //actualizo snapshot
                  with WriteView^ do
                  case fChannel of
                    0: begin
                        Tx1_Pulse    := pulse_mode;
                        Tx1_PRF_Rate := rate_mode;
                        if pulse_mode = tx_Pulse_Long
                          then
                            begin
                                Tx1_Sample_Rate  := drx.Parameters.LongPulse_Clock;
                                Tx1_Trigger_Rate := drx.Parameters.LongPulse_Trigger;
                            end
                          else
                            begin
                                Tx1_Sample_Rate  := drx.Parameters.ShortPulse_Clock;
                                Tx1_Trigger_Rate := drx.Parameters.ShortPulse_Trigger;
                            end;

                        if Tx1_Sample_Rate > 0
                          then Tx1_Sample_Cell_Size := round(LightSpeed/(2*Tx1_Sample_Rate))
                          else Tx1_Sample_Cell_Size := 0;
                        if Tx1_Trigger_Rate > 0
                          then Tx1_Sample_Max_Count := trunc(Tx1_Sample_Rate/Tx1_Trigger_Rate)
                          else Tx1_Sample_Max_Count := 0;
                       end;
                    1: begin
                        Tx2_Pulse    := pulse_mode;
                        Tx2_PRF_Rate := rate_mode;
                        if pulse_mode = tx_Pulse_Long
                          then
                            begin
                                Tx2_Sample_Rate  := drx.Parameters.LongPulse_Clock;
                                Tx2_Trigger_Rate := drx.Parameters.LongPulse_Trigger;
                            end
                          else
                            begin
                                Tx2_Sample_Rate  := drx.Parameters.ShortPulse_Clock;
                                Tx2_Trigger_Rate := drx.Parameters.ShortPulse_Trigger;
                            end;

                        if Tx2_Sample_Rate > 0
                          then Tx2_Sample_Cell_Size := round(LightSpeed/(2*Tx2_Sample_Rate))
                          else Tx2_Sample_Cell_Size := 0;
                        if Tx2_Trigger_Rate > 0
                          then Tx2_Sample_Max_Count := trunc(Tx2_Sample_Rate/Tx2_Trigger_Rate)
                          else Tx2_Sample_Max_Count := 0;
                       end;
                  end;

                  ReturnValue := obs_Ok;
                except
                  on e : EActionCanceled do
                  begin
                    ReturnValue := obs_Canceled;
                    fMessage := e.Message;
                  end;
                  on e : Exception do
                  begin
                    fMessage := e.Message;
                    ReturnValue := obs_Failed;
                  end;
                end;
                //saco los pulsos
                drx.Sync_WS.Set_Pulso(ReturnValue = obs_Ok);
              end
            else
              begin
                fMessage := 'No se pudo encontrar el DRX ' + TxName;
                ReturnValue := obs_Failed;
              end;
        end
      else ReturnValue := obs_Ok;
  finally
    PulseChanging_result[fChannel] := ReturnValue;
    PulseChanging[fChannel] := false;
    CoUninitialize;
    Task_Finalize;
  end;
end;

function TPulseChangeThread.InLongPulse: boolean;
begin
  result := Snapshot.Digital_Input and TxRx_Pulso_Largo = TxRx_Pulso_Largo;
end;

function TPulseChangeThread.InShortPulse: boolean;
begin
  result := Snapshot.Digital_Input and TxRx_Pulso_Largo = 0;
end;

constructor TPulseChangeThread.LongPulse(Channel : integer);
begin
  inherited Create(Channel);

  PulseChanging[Channel] := true;
  pulse_mode := tx_Pulse_Long;
  rate_mode  := tx_Dual_None;

  Resume;
end;

constructor TPulseChangeThread.ShortPulse(Channel : integer; Rate: TxDualPulse);
begin
  inherited Create(Channel);

  PulseChanging[Channel] := true;
  pulse_mode := tx_Pulse_Short;
  rate_mode  := Rate;
  
  Resume;
end;

{ TMPS_OnThread }

function TMPS_OnThread.ActionName: string;
begin
  result := 'Encendiendo MPS del trasmisor ' + TxName;
end;

constructor TMPS_OnThread.Create(Channel : integer; Voltage : double);
begin
  inherited Create(Channel);

  Priority := tpTimeCritical;

  MPS_Changing[fChannel] := true;
  if fChannel = 0
    then ClearDOBits(do_Tx1_HV)
    else ClearDOBits(do_Tx2_HV);
  fVoltage := Voltage;
  fVoltageCode := round(Voltage * 4096 / MPS_MAx);

  if fChannel = 0
    then
      begin
        aoMPS    := ao_Tx1_MPS;
        aiMPS_V  := ai_Tx1_MPS_Voltaje;
        aiMPS_I  := ai_Tx1_MPS_Corriente;
        do_Tx_HV := do_Tx1_HV;
      end
    else
      begin
        aoMPS    := ao_Tx2_MPS;
        aiMPS_V  := ai_Tx2_MPS_Voltaje;
        aiMPS_I  := ai_Tx2_MPS_Corriente;
        do_Tx_HV := do_Tx2_HV;
      end;

  Resume;
end;

procedure TMPS_OnThread.Execute;
var
  TimeMark, ElapsedTime : cardinal;
  value : AnalogCode;
  m, mp : double;
  mps_progress : cardinal;
begin
  Task_Start;
  try
    if not MPS_Ok
      then
        begin
          {$IFNDEF RDA_Simulation}
          WaitForCondition(Tx_Ok, 500, 5000, 5, 'Chequeando transmisor en parametros...', 'El trasmisor no esta listo');
          {$ELSE}
          WaitForCondition(nil, 500, 1000, 5, 'Chequeando transmisor en parametros...', '');
          {$ENDIF}

          Advantech.Set_Analog_Output_Channel(aoMPS, 0);
          SetDOBits(do_Tx_HV);

          {$IFNDEF RDA_Simulation}
          WaitForCondition(HV, 500, 5000, 10, 'Chequeando status de HV del transmisor...', 'El trasmisor no responde al comando de HV');
          {$ELSE}
          WaitForCondition(nil, 500, 5000, 10, 'Chequeando status de HV del transmisor...', '');
          {$ENDIF}

          WaitForCondition(nil, 500, MPS_Wait, 20, 'Esperando ' + IntToStr(MPS_Wait) + ' ms', '');
          WaitForCondition(nil, 500, 1000, 20, 'Habilitando la MPS en rampa...', '');

          m  := fVoltageCode / MPS_Delay;
          mp := 90 / fVoltageCode;
          TimeMark := GetTickCount;
          repeat
            ElapsedTime := GetTickCount - TimeMark;
            value := round(m * ElapsedTime);
            if value <= fVoltageCode
              then Advantech.Set_Analog_Output_Channel(aoMPS, value);
            mps_progress := 20 + round(value * mp);
            WaitForCondition(nil, 0, 0, mps_progress, 'Rampa de salida de la MPS...', '');
          until ElapsedTime >= MPS_Delay;

          Advantech.Set_Analog_Output_Channel(aoMPS, fVoltageCode);

          {$IFNDEF RDA_Simulation}
          WaitForCondition(MPS_Ok, 500, MPS_Delay, 100, 'Chequeando que la MPS este en parametros...', 'La MPS no esta en parametros...');
          {$ELSE}
          WaitForCondition(nil, 500, 1000, 100, 'Chequeando que la MPS este en parametros...', '');
          {$ENDIF}
        end;

    ReturnValue := obs_Ok;
  except
    on e : EActionCanceled do
    begin
      ReturnValue := obs_Canceled;
      fMessage := e.Message;
    end;
    on e : Exception do
    begin
      ReturnValue := obs_Failed;
      fMessage := e.Message;
    end;
  end;

  try
    if ReturnValue <> obs_Ok
      then Advantech.Set_Analog_Output_Channel(aoMPS, 0);

    if ControlMutex.WaitFor(ControlTime)
      then
        try
          if ReturnValue = obs_Ok
            then WriteView^.Analog_Output[aoMPS] := fVoltageCode
            else WriteView^.Analog_Output[aoMPS] := 0;
        finally
          ControlMutex.Release;
        end;
  finally
    MPS_Changing_result[fChannel] := ReturnValue;
    MPS_Changing[fChannel] := false;
    Task_Finalize;
  end;
end;

function TMPS_OnThread.HV: boolean;
begin
  if fChannel = 0
    then result := SnapShot^.Digital_Input and di_Tx1_HV = di_Tx1_HV
    else result := SnapShot^.Digital_Input and di_Tx2_HV = di_Tx2_HV
end;

function TMPS_OnThread.MPS_Ok: boolean;
begin
{$IFNDEF RDA_Simulation}
  result := false;
{$ELSE}
  result := abs(fVoltage - Snapshot^.Analog_Input_Voltage[aiMPS_V]) <= MPS_Error;

  if fChannel = 0
    then
      begin
        //result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_MPS_Voltaje], Snapshot^.AI_Sector[ai_Tx1_MPS_Voltaje]);
        //result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_MPS_Corriente], Snapshot^.AI_Sector[ai_Tx1_MPS_Corriente]);
      end
    else
      begin
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_MPS_Voltaje], Snapshot^.AI_Sector[ai_Tx2_MPS_Voltaje]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_MPS_Corriente], Snapshot^.AI_Sector[ai_Tx2_MPS_Corriente]);
      end;
{$ENDIF}
end;

{ TTX_OnThread }

function TTX_OnThread.ActionName: string;
begin
  result := 'Encendiendo Trasmisor ' + TxName;
end;

constructor TTX_OnThread.Create(Channel: integer);
begin
  inherited Create(Channel);
  TX_TurningOn[Channel] := true;
  ClearDOBits(do_Tx1_Apagar);
  Resume;
end;

procedure TTX_OnThread.Execute;
begin
  Task_Start;
  try
    if not Listo
      then
        begin
          {$IFNDEF RDA_Simulation}
          WaitForCondition(InterLock, 500, 5000, 10, 'Chequeando puerta del trasmisor...', 'La puerta del trasmisor no esta cerrada...');
          {$ELSE}
          WaitForCondition(nil, 500, 1000, 10, 'Chequeando puerta del trasmisor...', 'La puerta del trasmisor no esta cerrada...');
          {$ENDIF}

          if fChannel = 0
            then SetDOBits(do_Tx1_Encender)
            else SetDOBits(do_Tx2_Encender);

          {$IFNDEF RDA_Simulation}
          WaitForCondition(Veltilacion, 500, 5000, 20, 'Chequeando ventilacion...', 'La ventilacion no esta funcionando');
          WaitForCondition(Fuentes,     500, 5000, 30, 'Chequeando fuentes...', 'Hay fuentes fuera de parametros');
          WaitForCondition(Filamento,   500, 5000, 40, 'Chequeando filamento...', 'Filamento no conectado');
          {$ELSE}
          WaitForCondition(nil, 500, 1000, 20, 'Chequeando ventilacion...', '');
          WaitForCondition(nil, 500, 1000, 30, 'Chequeando fuentes...', '');
          WaitForCondition(nil, 500, 1000, 40, 'Chequeando filamento...', '');
          {$ENDIF}

          if fChannel = 0
            then
              begin
                Advantech.Set_Analog_Output_Channel(ao_Tx1_MPS, 0);
                SetDOBits(do_Tx1_MPS_On)
              end
            else
              begin
                Advantech.Set_Analog_Output_Channel(ao_Tx2_MPS, 0);
                SetDOBits(do_Tx2_MPS_On);
              end;

          {$IFNDEF RDA_Simulation}
          WaitForCondition(Listo, 3000, theConfiguration.RadarWarmTime * 60000, 100, 'Esperando por trasmisor listo...', 'El trasmisor no esta listo');
          {$ELSE}
          WaitForCondition(nil, 500, 1000, 100, 'Esperando por trasmisor listo...', '');
          {$ENDIF}
        end;

    ReturnValue := obs_Ok;
  except
      on e : EActionCanceled do
      begin
        ReturnValue := obs_Canceled;
        fMessage := e.Message;
      end;
      on e : Exception do
      begin
        fMessage := e.Message;
        ReturnValue := obs_Failed;
      end;
  end;

  if ReturnValue <> obs_Ok
    then if fChannel = 0
           then Tx1_Apagar
           else Tx2_Apagar;

  TX_TurningOn_result[fChannel] := ReturnValue;
  TX_TurningOn[fChannel] := false;
  Task_Finalize;
end;

{ TAntenna_OnThread }

function TAntenna_OnThread.ActionName: string;
begin
  result := 'Encendiendo Antena';
end;

function TAntenna_OnThread.Antena: boolean;
const
  query = di_Antena_Local or di_Excitacion or di_Cupula_Cerrada;
  query_result = di_Cupula_Cerrada or di_Excitacion;
begin
  result := SnapShot^.Digital_Input and query = query_result;
end;

constructor TAntenna_OnThread.Create;
begin
  inherited Create;
  Antenna_TurningOn := true;
  Resume;
end;

procedure TAntenna_OnThread.Execute;
begin
  Task_Start;
  Set_Lazo_Posicion_Az(false);
  Set_Lazo_Posicion_El(false);
  SetDOBits(do_Acc_Encender);
  try
    if not Motores
      then
        begin
          {$IFNDEF RDA_Simulation}
          WaitForCondition(nil,         500, 10000, 10, 'Esperando a que este lista la unidad de antena', '');
          WaitForCondition(Antena,      500, 5000,  20, 'Chequeando parametros de la antena...', 'Hay problemas en la antena');
          WaitForCondition(Veltilacion, 500, 5000,  30, 'Chequeando ventilacion...', 'La ventilacion no esta conectada');
          WaitForCondition(Fuentes,     500, 5000,  40, 'Chequeando fuentes...', 'Hay fuentes fuera de parametros');
          {$ELSE}
          WaitForCondition(nil, 500, 10000, 10, 'Esperando a que este lista la unidad de antena', '');
          WaitForCondition(nil, 500, 1000,  20, 'Chequeando parametros...', 'Hay problemas en la antena');
          WaitForCondition(nil, 500, 1000,  30, 'Chequeando ventilacion...', 'La ventilacion no esta conectada');
          WaitForCondition(nil, 500, 1000,  40, 'Chequeando fuentes...', 'Hay fuentes fuera de parametros');
          {$ENDIF}

          Elbrus.Set_SP_Velocidad_Az(0);
          Elbrus.Set_Lazo_Posicion_Az(false);
          Elbrus.Set_SP_Velocidad_El(0);
          Elbrus.Set_Lazo_Posicion_El(false);
          EnableMotorAz(true);
          EnableMotorEl(true);

          {$IFNDEF RDA_Simulation}
          WaitForCondition(Motores, 500, 5000, 80, 'Chequeando motores...', 'Motores fuera de parametros');
          if LimiteActivado
            then
              begin
                Elbrus.Set_SP_Posicion_El(ang_45);
                Elbrus.Set_Lazo_Posicion_El(true);
                try
                  WaitForCondition(InRange, 500, 5000, 90, 'Limites activados. Moviendo antena...', 'Limites activados. No se puede mover la antena.');
                finally
                  Elbrus.Set_Lazo_Posicion_El(false);
                end;
              end;

          WaitForCondition(InRange, 500, 1000, 100, 'Chequeando posicion de la antena...', '');
          {$ELSE}
          WaitForCondition(nil, 500, 1000, 100, 'Chequeando motores...', '');
          {$ENDIF}
        end;

    ReturnValue := obs_Ok;
  except
    on e : EActionCanceled do
    begin
      fMessage := e.Message;
      ReturnValue := obs_Canceled;
    end;
    on e : Exception do
    begin
      fMessage := e.Message;
      ReturnValue := obs_Failed;
    end;
  end;

  if ReturnValue <> obs_Ok
    then Apagar_Accionamiento;

  Antenna_TurningOn_result := ReturnValue;
  Antenna_TurningOn := false;
  Task_Finalize;
end;

function TAntenna_OnThread.Fuentes: boolean;
begin
  result :=            AI_InSector(Snapshot^.Analog_Input[ai_Fuente_Excitacion], Snapshot^.AI_Sector[ai_Fuente_Excitacion]);
  result := result and AI_InSector(Snapshot^.Analog_Input[ai_Fuente_5V_P],       Snapshot^.AI_Sector[ai_Fuente_5V_P]);
  result := result and AI_InSector(Snapshot^.Analog_Input[ai_Fuente_12V_P],      Snapshot^.AI_Sector[ai_Fuente_12V_P]);
  result := result and AI_InSector(Snapshot^.Analog_Input[ai_Fuente_24V_P],      Snapshot^.AI_Sector[ai_Fuente_24V_P]);
end;

function TAntenna_OnThread.InRange: boolean;
const
  mask = di_Antena_Limite_N or di_Antena_Limite_P;
begin
  result := SnapShot^.Digital_Input and mask = 0;
end;

function TAntenna_OnThread.LimiteActivado: boolean;
const
  mask = di_Antena_Limite_N or di_Antena_Limite_P;
begin
  result := SnapShot^.Digital_Input and mask <> 0;
end;

function TAntenna_OnThread.Motores: boolean;
const
  mask = di_Acc_Listo_Az or di_Acc_Listo_El;
begin
{$IFNDEF RDA_Simulation}
  result := false;
{$ELSE}
  result := SnapShot^.Digital_Input and di_Acc_Listo_Az = di_Acc_Listo_Az;
  result := result and ((not theConfiguration.Motor_EL_Enabled) or (SnapShot^.Digital_Input and di_Acc_Listo_El = di_Acc_Listo_El));
{$ENDIF}
end;

function TAntenna_OnThread.PositionEl: boolean;
begin
  Result := abs(Distance(Snapshot.SP_Position_El, Snapshot.Position_El)) <= theConfiguration.AngleAcc;
end;

function TAntenna_OnThread.Veltilacion: boolean;
begin
  result := SnapShot^.Digital_Input and di_Antena_Ventilacion_On = di_Antena_Ventilacion_On;
end;

{ TAction_Thread }

procedure TAction_Thread.CheckCancel;
begin
  if fProgUpdate and Snapshot^.ObsCancel
    then
      begin
        WriteView^.ObsCancel := false;
        raise EActionCanceled.Create(a_Cancel);
      end;
end;

constructor TAction_Thread.Create;
begin
  inherited Create(true);

  Priority := tpHighest;
  FreeOnTerminate := true;

  fProgUpdate := not Snapshot^.ObsInProgress;
end;

procedure TAction_Thread.WaitForCondition(Condition: TConditionFunction; Period: cardinal; Timeout: cardinal; ProgGoal: integer; M, E: string);
var
  StartTime : cardinal;
  Steps     : integer;
  Increment : single;
  Success   : boolean;
  StartProg : integer;
begin
  CheckCancel;
  if @Condition = nil
    then Success := false
    else Success := Condition;

  if Timeout > 0
    then
      begin
        if Period > 0
          then Steps := Timeout div Period
          else Steps := Timeout;
        Increment := (ProgGoal - fProgress)/Steps;
        Steps     := 0;
        StartTime := GetTickCount;
        StartProg := fProgress;
        fMessage  := M;
        Task_Progress;
        while not Success and (GetTickCount - StartTime < Timeout) do
          begin
            fProgress := StartProg + round(Steps*Increment);
            inc(Steps);
            Task_Progress;
            Sleep(Period);
            CheckCancel;
            if @Condition = nil
              then Success := false
              else Success := Condition;
          end;
      end;

  if (@Condition = nil) or Condition
    then
      begin
        fProgress := ProgGoal;
        Task_Progress;
      end
    else raise EActionTimeout.Create(E);
end;

function TAction_Thread.ActionName: string;
begin
  result := '';
end;

procedure TAction_Thread.Task_Finalize;
begin
  if fProgUpdate
    then
      try
        case ReturnValue of
          obs_Ok:
            LogMessages.AddLogMessage(lcInformation, Snapshot.ObsClient, TaskZone, ActionName, ActionName + '. Finalizado exitosamente.');
          obs_Canceled:
            LogMessages.AddLogMessage(lcWarning, Snapshot.ObsClient, TaskZone, ActionName, fMessage);
          obs_Failed:
            LogMessages.AddLogMessage(lcError, Snapshot.ObsClient, TaskZone, ActionName, fMessage);
        end;
        with WriteView^ do
          begin
            ObsCancel     := false;
            ObsInProgress := false;
            ObsLastTime   := ObsStartTime;
            ObsResult     := ReturnValue;
            if (ReturnValue = obs_Ok) or (ReturnValue = obs_Nothing)
              then
                begin
                  ObsName      := '';
                  ObsClient    := '';
                  ObsMessage   := Msg_Waiting;
                  ObsSubMsg    := '';
                  ObsStartTime := 0;
                  ObsProgress  := 0;
                end
              else
                begin
                  ObsSubMsg    := fMessage;
                  ObsProgress  := fProgress;
                end;
          end;
      finally    
        ObsMutex.Release;
      end;
end;

procedure TAction_Thread.Task_Progress;
begin
  if fProgUpdate and Snapshot.ObsInProgress
    then
      with WriteView^ do
        begin
          ObsProgress := fProgress;
          ObsSubMsg   := fMessage;
        end;
end;

procedure TAction_Thread.Task_Start;
begin
  if fProgUpdate
    then
      begin
        ObsMutex.Acquire;
        fProgress := 0;
        fMessage  := '';
        with WriteView^ do
          begin
            ObsInProgress := true;
            ObsName       := ActionName;
            ObsClient     := GetController;
            ObsStartTime  := Now;
            ObsLastTime   := 0;
            ObsProgress   := 0;
            ObsMessage    := ActionName;
            ObsSubMsg     := '';
            ObsResult     := obs_InProgress;
            ObsCancel     := false;
          end;
        LogMessages.AddLogMessage(lcInformation, GetController, TaskZone, ActionName, 'Iniciando la tarea. ' + ActionName);
      end;
end;

{ TTXAction_Thread }

constructor TTXAction_Thread.Create(Channel: integer);
begin
  inherited Create;
  fChannel := Channel;
end;

function TTXAction_Thread.Filamento: boolean;
const
  mask1 = di_Tx1_Filamento_On or di_Tx1_Averia_Fuente_Filamento;
  mask2 = di_Tx2_Filamento_On or di_Tx2_Averia_Fuente_Filamento;
begin
  if fChannel = 0
    then result := SnapShot^.Digital_Input and mask1 = di_Tx1_Filamento_On
    else result := SnapShot^.Digital_Input and mask2 = di_Tx2_Filamento_On;
end;

function TTXAction_Thread.Fuentes: boolean;
begin
  if fChannel = 0
    then
      begin
        result :=            AI_InSector(Snapshot^.Analog_Input[ai_Tx1_Potencia],         Snapshot^.AI_Sector[ai_Tx1_Potencia]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_24V_P],     Snapshot^.AI_Sector[ai_Tx1_fuente_24V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_24V_N],     Snapshot^.AI_Sector[ai_Tx1_fuente_24V_N]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_50V_P],     Snapshot^.AI_Sector[ai_Tx1_fuente_50V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_100V_P],    Snapshot^.AI_Sector[ai_Tx1_fuente_100V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_fuente_400V_P],    Snapshot^.AI_Sector[ai_Tx1_fuente_400V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx1_Fuente_Filamento], Snapshot^.AI_Sector[ai_Tx1_Fuente_Filamento]);
      end
    else
      begin
        result :=            AI_InSector(Snapshot^.Analog_Input[ai_Tx2_Potencia],         Snapshot^.AI_Sector[ai_Tx2_Potencia]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_MPS_Voltaje],      Snapshot^.AI_Sector[ai_Tx2_MPS_Voltaje]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_MPS_Corriente],    Snapshot^.AI_Sector[ai_Tx2_MPS_Corriente]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_24V_P],     Snapshot^.AI_Sector[ai_Tx2_fuente_24V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_24V_N],     Snapshot^.AI_Sector[ai_Tx2_fuente_24V_N]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_50V_P],     Snapshot^.AI_Sector[ai_Tx2_fuente_50V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_100V_P],    Snapshot^.AI_Sector[ai_Tx2_fuente_100V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_fuente_400V_P],    Snapshot^.AI_Sector[ai_Tx2_fuente_400V_P]);
        result := result and AI_InSector(Snapshot^.Analog_Input[ai_Tx2_Fuente_Filamento], Snapshot^.AI_Sector[ai_Tx2_Fuente_Filamento]);
      end;
end;

function TTXAction_Thread.InterLock: boolean;
begin
  if fChannel = 0
    then result := SnapShot^.Digital_Input and di_Tx1_Inter_Lock = di_Tx1_Inter_Lock
    else result := SnapShot^.Digital_Input and di_Tx2_Inter_Lock = di_Tx2_Inter_Lock;
end;

function TTXAction_Thread.Listo: boolean;
begin
{$IFNDEF RDA_Simulation}
  result := false;
{$ELSE}
  if fChannel = 0
    then result := SnapShot^.Digital_Input and di_Tx1_Listo = di_Tx1_Listo
    else result := SnapShot^.Digital_Input and di_Tx2_Listo = di_Tx2_Listo;
{$ENDIF}
end;

function TTXAction_Thread.TxName: string;
begin
  if fChannel = 0
    then result := '3cm'
    else result := '10cm';
end;

function TTXAction_Thread.Tx_Ok: boolean;
begin
  if fChannel = 0
    then result := SnapShot^.Digital_Input and Tx1OkQuery = Tx1OkResult
    else result := SnapShot^.Digital_Input and Tx2OkQuery = Tx2OkResult;

  result := result and Fuentes;
end;

function TTXAction_Thread.Veltilacion: boolean;
const
  mask1 = di_Tx1_Ventilacion_On or di_Tx1_Averia_Ventilador;
  mask2 = di_Tx2_Ventilacion_On or di_Tx2_Averia_Ventilador;
begin
  if fChannel = 0
    then result := SnapShot^.Digital_Input and mask1 = di_Tx1_Ventilacion_On
    else result := SnapShot^.Digital_Input and mask2 = di_Tx2_Ventilacion_On;
end;

end.

