unit Elbrus;

{$DEFINE RDA_Simulation}
//{$UNDEF RDA_Simulation}

{$DEFINE Antenna_Simulation}
//{$UNDEF Antenna_Simulation}

{$UNDEF Exclude_External_DLLs}

interface

uses
{$IFNDEF Exclude_External_DLLs}
  Advantech, Datel,
  Deva,
{$ENDIF}
  Windows, SysUtils, Classes,
  ElbrusTypes, Rda_TLB;

type
  PSnapshot = ^TSnapshot;
  TSnapshot = packed record
    Digital_Input       : DigitalInput;   // di_...
    Digital_Output      : DigitalOutput;  // do_...
    Analog_Input        : AnalogInput;    // ai_...
    Analog_Output       : AnalogOutput;   // Chopper codes
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
    AI_Range            : AnalogRange;
    AI_Sector           : AnalogRange;
    Counter_Times       : CounterTimes;
    Trigger_Source      : integer;          // Trigger source, 0 :- internal, 1 :- External, ... see Datel
    Trigger_Rate        : cardinal;         // Trigger frequency
    Sample_Rate         : cardinal;
    Sample_Cell_Size    : integer;
    Sample_Max_Count    : integer;
    Pulse               : integer;

    ObsInProgress       : boolean;
    ObsName             : string;
    ObsClient           : string;
    ObsStartTime        : TDateTime;
    ObsLastTime         : TDateTime;
    ObsProgress         : integer;
    ObsMessage          : string;
    ObsSubMsg           : string;
    ObsResult           : integer;

    Last_Action_Time    : TDateTime;
  end;

type
  TAntennaThread = class(TThread)
  public
    constructor Create;
  protected
    procedure Execute;  override;
  end;

var
  Snapshot      : PSnapshot = nil;
  WriteView     : PSnapshot = nil;
  AntennaThread : TAntennaThread  = nil;
  Initialized   : boolean   = false;

//General
procedure InitElbrus;
procedure DoneElbrus;
procedure WaitForTxsStantby;

// Radar
procedure Encender_Radar;
procedure Apagar_Radar;

// Antenna
procedure Encender_Accionamiento;
procedure Apagar_Accionamiento;
procedure Alarma_Sonora( Tiempo : integer );
procedure SetDACodeEl( Code : integer );
procedure SetDACodeAz( Code : integer );

// MotorAz
function  ClockwiseAz : boolean;
procedure Set_Lazo_Sector_AZ  ( State : boolean );
procedure Set_Lazo_Posicion_Az( State : boolean );
procedure Set_Mark_Posicion_Az( Value : integer );
procedure Set_SP_Posicion_Az  ( Value : integer );
procedure Set_SP_Velocidad_Az ( Value : integer );
procedure Set_Lazo_K_Pos_Az   ( Value : single );
procedure Set_Lazo_K_Vel_Az   ( Value : single );

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

// Synchro
procedure Pulso_Largo;
procedure Pulso_Corto;
procedure Set_Counter_Time ( Counter : CounterRange; Time : CounterCode );
procedure Set_Counter_Times( const Times : CounterTimes );
procedure Set_Frecuencia_N1( Rate : cardinal );
procedure Set_Fuente_N1    ( Source : integer );

// TxRx1
procedure Tx1_Encender;
procedure Tx1_Apagar;
procedure Rx1_Encender;
procedure Rx1_Apagar;
procedure Rx1_Correccion( State : boolean );
procedure Tx1_Standby   ( State : boolean );
procedure TxRx1_Trabajo ( State : boolean );
procedure Rx1_CMG( State : boolean );
procedure Rx1_Ganancia_N;
procedure Rx1_Ganancia_P;
procedure Rx1_CMS( State : boolean );
procedure Rx1_Sintonia_N;
procedure Rx1_Sintonia_P;

// TxRx2
procedure Tx2_Encender;
procedure Tx2_Apagar;
procedure Rx2_Encender;
procedure Rx2_Apagar;
procedure Rx2_Correccion( State : boolean );
procedure Tx2_Standby   ( State : boolean );
procedure TxRx2_Trabajo ( State : boolean );
procedure Rx2_CMG( State : boolean );
procedure Rx2_Ganancia_N;
procedure Rx2_Ganancia_P;
procedure Rx2_CMS( State : boolean );
procedure Rx2_Sintonia_N;
procedure Rx2_Sintonia_P;

// Analog input ranges & sectors
function  BinaryToKW( const Binary : cardinal ) : double;
function  BinaryToVoltage( Channel : AIRange ) : single;
procedure Set_AI_Range ( AI : AIRange; const Range : TAIRange );
procedure Set_AI_Sector( AI : AIRange; const Range : TAIRange );

// Video
procedure Set_Frecuencia_AD( Rate : cardinal );
function  Acquire_Frames( Frames     : cardinal;
                          Shots      : cardinal;
                          Cells      : cardinal;
                          Ch1, Ch2   : PDWords;
                          Power      : boolean ) : boolean;
procedure Acquire_PPI( Template   : ITemplate;
                       Cells      : cardinal;
                       Ch1, Ch2   : PDWords;
                       SM1, SM2   : PDWords;
                       Filter1, Filter2 : PDWords );

procedure Acquire_RHI( Template   : ITemplate;
                       Start      : cardinal;
                       Finish     : cardinal;
                       Cells      : cardinal;
                       Ch1, Ch2   : PDWords;
                       SM1, SM2   : PDWords;
                       Filter1, Filter2 : PDWords );

// Obs Engine
procedure Report_Obs_Start   ( Name, Client : string );
procedure Report_Obs_Finish  ( Result : integer );
procedure Report_Obs_Progress( Progress : integer; M, S : string );

procedure Report_Check_Start;
procedure Report_Check_Progress( Progress : integer; M, S : string );
procedure Report_Check_Finish( Result : integer; Error : boolean; Report : string );

// Control
procedure Acquire_Control;
procedure Release_Control;

implementation

uses
  EventLog,
  Angle,
  Mutex,
  Parameters, Config, Calib, Dialogs, Constants, Users, LogTools,
  StatisticsConfig, AntennaSimulation;

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

procedure MaskDOBits( Bits, Mask : cardinal );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        with WriteView^ do
          begin
            Bits := Digital_Output and not Mask or Bits and Mask;
            Digital_Output := Bits;
            {$IFNDEF Exclude_External_DLLs}
            Advantech.Set_Digital_Output(Digital_Output);
            {$ENDIF}
          end;
      finally
        ControlMutex.Release;
      end;
end;

procedure SetDOBits( Bits : cardinal );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        with WriteView^ do
          begin
            Bits := Digital_Output or Bits;
            Digital_Output := Bits;
            {$IFNDEF Exclude_External_DLLs}
            Advantech.Set_Digital_Output(Digital_Output);
            {$ENDIF}
          end;
      finally
        ControlMutex.Release;
      end;
end;

procedure ClearDOBits( Bits : cardinal );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        with WriteView^ do
          begin
            Bits := Digital_Output and not Bits;
            Digital_Output := Bits;
            {$IFNDEF Exclude_External_DLLs}
            Advantech.Set_Digital_Output(Digital_Output);
            {$ENDIF}
          end;
      finally
        ControlMutex.Release;
      end;
end;

procedure ClearCommand( Bits : cardinal );
begin
  Sleep(500);
  ClearDOBits(Bits);
end;

procedure SetDACodeAz( Code : integer );
begin
  with WriteView^ do
    begin
      if Code >  2047 then Code :=  2047;
      if Code < -2048 then Code := -2048;
      Analog_Output[0] := 2048 + Code;
      {$IFNDEF Exclude_External_DLLs}
      Advantech.Set_Analog_Output_Channel(0, Analog_Output[0]);
      {$ENDIF}

      {$IFDEF Antenna_Simulation}
      if AntennaManager.AzimutSpeed <> Code
        then AntennaManager.AzimutSpeed := Code;
      {$ENDIF}
    end;
end;

procedure SetDACodeEl( Code : integer );
begin
  with WriteView^ do
    begin
      if Code >  2047 then Code :=  2047;
      if Code < -2048 then Code := -2048;
      Analog_Output[1] := 2048 + Code;
      {$IFNDEF Exclude_External_DLLs}
      Advantech.Set_Analog_Output_Channel(1, Analog_Output[1]);
      {$ENDIF}

      {$IFDEF Antenna_Simulation}
      if AntennaManager.ElevationSpeed <> Code
        then AntennaManager.ElevationSpeed := Code;
      {$ENDIF}
    end;
end;

procedure WaitForTxsStantby;
const
  Mask = do_TxRx1_Trabajo or do_TxRx2_Trabajo;
  Timeout = 10000;
var
  State : Cardinal;
  StartTime : cardinal;
begin
  State := Snapshot.Digital_Output and Mask;
  SetDOBits(Mask);
  SetDOBits(do_Tx1_Standby or do_Tx2_Standby);
  try
    StartTime := GetTickCount;
    while not ((Snapshot.Digital_Input and di_Tx1_Anodo = 0) and
               (Snapshot.Digital_Input and di_Tx2_Anodo = 0)) and
               (StartTime - GetTickCount < Timeout) do Sleep(10);
  if ((Snapshot.Digital_Input and di_Tx1_Anodo <> 0) and
      (Snapshot.Digital_Input and di_Tx2_Anodo <> 0))
    then raise Exception.Create( 'Los trasmisores no caen en StandBy' )
    else if (Snapshot.Digital_Input and di_Tx1_Anodo <> 0)
         then raise Exception.Create( 'El trasmisor #1 no cae en StandBy' )
         else if (Snapshot.Digital_Input and di_Tx2_Anodo <> 0)
                then raise Exception.Create( 'El trasmisor #2 no cae en StandBy' );
  finally
    MaskDOBits(State, Mask);
  end;
end;

procedure WaitForRadarOff;
begin
  Apagar_Radar;
  while not ((Snapshot.Digital_Input and di_Radar_On_P = 0) and
             (Snapshot.Digital_Input and di_Radar_On_N = 0)) do
    Sleep(10);
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
  Tx1_Standby(true);
  Tx2_Standby(true);
  {$IFNDEF RDA_Simulation}
  try
    WaitForTxsStantby;
  except
    on E : Exception do
      LogMessages.AddLogRawMessage( Now, lcError, GetController, TxZone, E.Message, E.Message );
  end;
  {$ENDIF}
  ClearDOBits(do_Radar_Encender);
  SetDOBits(do_Radar_Apagar);
end;

// Antenna

procedure Encender_Accionamiento;
begin
  Set_Lazo_Posicion_Az(false);
  Set_Lazo_Posicion_El(false);
  SetDOBits(do_Acc_Encender);
  EnableMotorEl( true );
end;

procedure Apagar_Accionamiento;
begin
  EnableMotorEl( false );
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
  result := Snapshot.SP_Velocity_Az >= 0;
end;

procedure Set_Lazo_Sector_AZ( State : boolean );
begin
  if State
    then TInitSectorLoopAzThread.Create
    else
      begin
        if Assigned( InitSectorLoopAzThread )
           then
             try
               InitSectorLoopAzThread.Terminate;
             except
               InitSectorLoopAzThread := nil;
             end;
        if ControlMutex.WaitFor(1000)
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
  if ControlMutex.WaitFor(1000)
    then
      try
        Set_SP_Velocidad_Az(0);
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
        SaveKPosAz(Value);
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Lazo_K_Vel_Az( Value : single );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView^.Velocity_Loop_Az_K := Value;
        SaveKVelAz(Value);
      finally
        ControlMutex.Release;
      end;
end;

// Motor El
function  ClockwiseEl : boolean;
begin
  result := Snapshot.SP_Velocity_El >= 0;
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
        if ControlMutex.WaitFor(1000)
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
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        Set_SP_Velocidad_El(0);
        WriteView^.Position_Loop_El := State;
      finally
        ControlMutex.Release;
      end;
end;

procedure EnableMotorEl( State : boolean );
begin
  if State
    then SetDOBits(do_Reserva_1)
    else ClearDOBits(do_Reserva_1);
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

// TxsRxs

procedure Pulso_Largo;
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        {$IFNDEF RDA_Simulation}
        try
          WaitForTxsStantby;
        except
          on E : Exception do
          begin
            LogMessages.AddLogRawMessage( Now, lcError, GetController, TxZone, E.Message, E.Message );
            Exit;
          end;
        end;
        {$ENDIF}
        WriteView^.Pulse := tx_Pulse_Long;
        SetDOBits(do_Pulso_Largo);
        Set_Frecuencia_N1(theConfiguration.PLRate);
        Set_Counter_Times(theConfiguration.PL_Times);
      finally
        ControlMutex.Release;
      end;
end;

procedure Pulso_Corto;
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        {$IFNDEF RDA_Simulation}
        try
          WaitForTxsStantby;
        except
          on E : Exception do
          begin
            LogMessages.AddLogRawMessage( Now, lcError, GetController, TxZone, E.Message, E.Message );
            Exit;
          end;
        end;
        {$ENDIF}
        WriteView^.Pulse := tx_Pulse_Short;
        ClearDOBits(do_Pulso_Largo);
        Set_Frecuencia_N1(theConfiguration.PCRate);
        Set_Counter_Times(theConfiguration.PC_Times);
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Counter_Time( Counter : CounterRange; Time : CounterCode );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView.Counter_Times[Counter] := Time;
        {$IFNDEF Exclude_External_DLLs}
        Advantech.Set_Counter_Timer(Counter, Time);
        {$ENDIF}
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Counter_Times( const Times : CounterTimes );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView.Counter_Times := Times;
        {$IFNDEF Exclude_External_DLLs}
        Advantech.Set_Counter_Timers(Times);
        {$ENDIF}
      finally
        ControlMutex.Release;
      end;
end;

procedure Set_Frecuencia_N1( Rate : cardinal );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        {$IFNDEF Exclude_External_DLLs}
        with WriteView^ do
          begin
            try
              if theConfiguration.N1Source = 0
                then if PCI416F2 <> -1
                       then Trigger_Rate := Datel.Set_Trigger_Rate(Rate)
                       else Trigger_Rate := Rate
                else
                  if PCI1714 <> -1
                    then Trigger_Rate := Advantech.Set_Trigger_Rate(Rate)
                    else Trigger_Rate := Rate;
            except
              Trigger_Rate := 0;
            end;
            if Trigger_Rate > 0
              then Sample_Max_Count := trunc(Sample_Rate/Trigger_Rate)
              else Sample_Max_Count := 0;
          end;
        {$ENDIF}
        if (Snapshot.Digital_Output and do_Pulso_Largo <> 0)
          then SavePLRate(Snapshot.Trigger_Rate)
          else SavePCRate(Snapshot.Trigger_Rate);
      finally
        {$IFDEF RealTimeData}
        if Assigned( RTData )
          then RTData.SendTriggerRate;
        {$ENDIF}
        ControlMutex.Release;
      end;
end;

procedure Set_Fuente_N1( Source : integer );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        WriteView.Trigger_Source := Source;
        SaveN1Source(Source);  // ???
      finally
        ControlMutex.Release;
      end;
end;
                          
// Video

procedure Set_Frecuencia_AD( Rate : cardinal );
begin
  if ControlMutex.WaitFor(ControlTime)
    then
      try
        with WriteView ^ do
          begin
            {$IFNDEF Exclude_External_DLLs}
            try
              if theConfiguration.ClockSource
                then if PCI416F2 <> -1
                       then Sample_Rate := Datel.Set_Sample_Rate(Rate)
                       else Sample_Rate := Rate
                else
                  if PCI1714 > -1
                    then Sample_Rate := Advantech.Set_Sample_Rate(Rate)
                    else Sample_Rate := Rate;
            except
              Sample_Rate := 0;
            end;
            {$ELSE}
            Sample_Rate := Rate;
            {$ENDIF}
            if Sample_Rate > 0
              then Sample_Cell_Size := round(LightSpeed/(2*Sample_Rate))
              else Sample_Cell_Size := 0;
            if Trigger_Rate > 0
              then Sample_Max_Count := trunc(Sample_Rate/Trigger_Rate)
              else Sample_Max_Count := 0;
          end;
      finally
        {$IFDEF RealTimeData}
        if Assigned( RTData )
          then RTData.SendFreqAD;
        {$ENDIF}
        ControlMutex.Release;
      end;
end;

procedure ConvertToDB( FrameCount, CellCount : cardinal; RawData : PDWords; Calibration : CalibrationTable );
var
  S, I, J, D : integer;
begin
  D := 0;
  for S := 0 to FrameCount-1 do
    for I := 0 to CellCount-1 do
      begin
        if assigned(Calibration)
          then
            with Calibration^ do
              begin
                J := 0;
                while (J < rgsabound[0].cElements) and
                      (RawData[D] > PWords(pvData)[J]) do
                  inc(J);
                if J < rgsabound[0].cElements
                  then RawData[D] := J
                  else RawData[D] := rgsabound[0].cElements;
              end
          else RawData[D] := 0;
        inc(D);
      end;
end;

function Acquire_Frames( Frames     : cardinal;
                         Shots      : cardinal;
                         Cells      : cardinal;
                         Ch1, Ch2   : PDWords;
                         Power      : boolean ) : boolean;
begin
  {$IFNDEF Exclude_External_DLLs}
  if PCI1714 > -1
    then
      begin
        if (Ch1 <> nil) and (Ch2 <> nil)
          then
            begin
              if theConfiguration.Ch1Port mod 2 = 0
                then Result := Advantech.Acquire_FramesTwoChannels( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, theConfiguration.N1Source, Frames, Shots, Cells, Ch1, Ch2, 5 )
                else Result := Advantech.Acquire_FramesTwoChannels( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, theConfiguration.N1Source, Frames, Shots, Cells, Ch1, Ch2, 5 )
            end
          else
            if Ch1 <> nil
              then Result := Advantech.Acquire_FramesOneChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, theConfiguration.N1Source, Frames, Shots, Cells, Ch1, 5 )
              else Result := Advantech.Acquire_FramesOneChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, theConfiguration.N1Source, Frames, Shots, Cells, Ch2, 5 );
      end
    else
      begin
        if theConfiguration.Ch1Port < theConfiguration.Ch2Port
          then Result := Datel.Acquire_FramesTwoChannels( Frames, Shots, Cells, Ch1, Ch2, 10 )
          else Result := Datel.Acquire_FramesTwoChannels( Frames, Shots, Cells, Ch2, Ch1, 10 );
      end;

  if result and (Power) and Assigned( Ch1 )
    then ConvertToDB( Frames, Cells, Ch1, theCalibration.Calibration1 );
  if result and (Power) and Assigned( Ch2 )
    then ConvertToDB( Frames, Cells, Ch2, theCalibration.Calibration2 );
  {$ELSE}
  Result := false;
  {$ENDIF}
end;

procedure Acquire_PPI( Template   : ITemplate;
                       Cells      : cardinal;
                       Ch1, Ch2   : PDWords;
                       SM1, SM2   : PDWords;
                       Filter1, Filter2 : PDWords );
var
  Timeout : double;
begin
  Timeout := 10;
  {$IFNDEF Exclude_External_DLLs}
  if (Filter1 <> nil) or (Filter2 <> nil)
    then
      //Filter
      begin
        if PCI1714 > -1
          then
            begin
              if (Ch1 <> nil) and (Ch2 <> nil)
                then
                  begin
                    if theConfiguration.Ch1Port mod 2 = 0
                      then Advantech.Acquire_Az_SectorsTwoChannelsFilter( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch1, Ch2, Filter1, Filter2, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Timeout )
                      else Advantech.Acquire_Az_SectorsTwoChannelsFilter( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch2, Ch1, Filter2, Filter1, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Timeout )
                  end
                else
                  if Ch1 <> nil
                    then Advantech.Acquire_Az_SectorsOneChannelFilter( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch1, Filter1, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Timeout )
                    else Advantech.Acquire_Az_SectorsOneChannelFilter( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch2, Filter2, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Timeout );
            end
          else
            begin
              if theConfiguration.Ch1Port < theConfiguration.Ch2Port
                then Datel.Acquire_Az_SectorsTwoChannelsFilter( Template.Sectores, Cells, Ch1, Ch2, Filter1, Filter2, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Timeout )
                else Datel.Acquire_Az_SectorsTwoChannelsFilter( Template.Sectores, Cells, Ch2, Ch1, Filter2, Filter1, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Timeout )
            end;
      end
    else
      //Not Filter
      begin
        if PCI1714 > -1
          then
            begin
              if (Ch1 <> nil) and (Ch2 <> nil)
                then
                  begin
                    if theConfiguration.Ch1Port mod 2 = 0
                      then Advantech.Acquire_Az_SectorsTwoChannels( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch1, Ch2, Timeout )
                      else Advantech.Acquire_Az_SectorsTwoChannels( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch2, Ch1, Timeout )
                  end
                else
                  if Ch1 <> nil
                    then Advantech.Acquire_Az_SectorsOneChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch1, Timeout )
                    else Advantech.Acquire_Az_SectorsOneChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Cells, Ch2, Timeout );
            end
          else
            begin
              if theConfiguration.Ch1Port < theConfiguration.Ch2Port
                then Datel.Acquire_Az_SectorsTwoChannels( Template.Sectores, Cells, Ch1, Ch2, Timeout )
                else Datel.Acquire_Az_SectorsTwoChannels( Template.Sectores, Cells, Ch2, Ch1, Timeout )
            end;
      end;
  {$ENDIF}
end;

procedure Acquire_RHI( Template   : ITemplate;
                       Start      : cardinal;
                       Finish     : cardinal;
                       Cells      : cardinal;
                       Ch1, Ch2   : PDWords;
                       SM1, SM2   : PDWords;
                       Filter1, Filter2 : PDWords );
var
  Timeout : double;
begin
  Timeout := 10;
  {$IFNDEF Exclude_External_DLLs}
  if (Filter1 <> nil) or (Filter2 <> nil)
    then
      //Filter
      begin
        if PCI1714 > -1
          then
            begin
              if (Ch1 <> nil) and (Ch2 <> nil)
                 then
                   begin
                     if theConfiguration.Ch1Port mod 2 = 0
                      then Advantech.Acquire_El_SectorsTwoChannelsFilter( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Start, Finish, Cells, Ch1, Ch2, Filter1, Filter2, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Timeout )
                      else Advantech.Acquire_El_SectorsTwoChannelsFilter( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Start, Finish, Cells, Ch2, Ch1, Filter2, Filter1, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Timeout )
                   end
                else
                  if Ch1 <> nil
                    then Advantech.Acquire_El_SectorsOneChannelFilter( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Start, Finish, Template.Sectores, Cells, Ch1, Filter1, Template.CH3cm_B0, Template.CH3cm_B1, Template.CH3cm_B2, Template.CH3cm_A1, Template.CH3cm_A2, Timeout )
                    else Advantech.Acquire_El_SectorsOneChannelFilter( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Start, Finish, Template.Sectores, Cells, Ch2, Filter2, Template.CH10cm_B0, Template.CH10cm_B1, Template.CH10cm_B2, Template.CH10cm_A1, Template.CH10cm_A2, Timeout );
            end
          else
            begin
             if theConfiguration.Ch1Port < theConfiguration.Ch2Port
               then Datel.Acquire_El_SectorsTwoChannels( Template.Sectores, Start, Finish, Cells, Ch1, Ch2, Template, Filter1, Filter2, Timeout )
               else Datel.Acquire_El_SectorsTwoChannels( Template.Sectores, Start, Finish, Cells, Ch2, Ch1, Template, Filter2, Filter1, Timeout )
            end;
      end
    else
      //Not Filter
      begin
        if PCI1714 > -1
          then
            begin
              if (Ch1 <> nil) and (Ch2 <> nil)
                 then
                   begin
                     if theConfiguration.Ch1Port mod 2 = 0
                      then Advantech.Acquire_El_SectorsTwoChannels( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Start, Finish, Cells, Ch1, Ch2, Timeout )
                      else Advantech.Acquire_El_SectorsTwoChannels( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Template.Sectores, Start, Finish, Cells, Ch2, Ch1, Timeout )
                   end
                else
                  if Ch1 <> nil
                    then Advantech.Acquire_El_SectorsOneChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Start, Finish, Template.Sectores, Cells, Ch1, Timeout )
                    else Advantech.Acquire_El_SectorsOneChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Start, Finish, Template.Sectores, Cells, Ch2, Timeout );
            end
          else
            begin
             if theConfiguration.Ch1Port < theConfiguration.Ch2Port
               then Datel.Acquire_El_SectorsTwoChannels( Template.Sectores, Start, Finish, Cells, Ch1, Ch2, Template, Filter1, Filter2, Timeout )
               else Datel.Acquire_El_SectorsTwoChannels( Template.Sectores, Start, Finish, Cells, Ch2, Ch1, Template, Filter2, Filter1, Timeout )
            end;
      end;
  {$ENDIF}
end;

// TxRx1

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

procedure Rx1_Correccion( State : boolean );
begin
  if State
    then SetDOBits(do_Rx1_Correccion)
    else ClearDOBits(do_Rx1_Correccion);
end;

procedure Tx1_Standby( State : boolean );
begin
  if State
    then SetDOBits(do_Tx1_Standby)
    else ClearDOBits(do_Tx1_Standby);
end;

procedure TxRx1_Trabajo( State : boolean );
begin
  if State
    then SetDOBits(do_TxRx1_Trabajo)
    else ClearDOBits(do_TxRx1_Trabajo);
end;

procedure Rx1_CMG( State : boolean );
begin
  if State
    then SetDOBits(do_Rx1_CMG)
    else ClearDOBits(do_Rx1_CMG);
end;

procedure Rx1_Ganancia_N;
begin
  SetDOBits(do_Rx1_Ganancia_N);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx1_Ganancia_N);
  end;
end;

procedure Rx1_Ganancia_P;
begin
  SetDOBits(do_Rx1_Ganancia_P);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx1_Ganancia_P);
  end;
end;

procedure Rx1_CMS( State : boolean );
begin
  if State
    then SetDOBits(do_Rx1_CMS)
    else ClearDOBits(do_Rx1_CMS);
end;

procedure Rx1_Sintonia_N;
begin
  SetDOBits(do_Rx1_Sintonia_N);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx1_Sintonia_N);
  end;
end;

procedure Rx1_Sintonia_P;
begin
  SetDOBits(do_Rx1_Sintonia_P);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx1_Sintonia_P);
  end;
end;

// TxRx2

procedure Tx2_Encender;
begin
  ClearDOBits(do_Tx2_Apagar);
  SetDOBits(do_Tx2_Encender);
end;

procedure Tx2_Apagar;
begin
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

procedure Rx2_Correccion( State : boolean );
begin
  if State
    then SetDOBits(do_Rx2_Correccion)
    else ClearDOBits(do_Rx2_Correccion);
end;

procedure Tx2_Standby( State : boolean );
begin
  if State
    then SetDOBits(do_Tx2_Standby)
    else ClearDOBits(do_Tx2_Standby);
end;

procedure TxRx2_Trabajo( State : boolean );
begin
  if State
    then SetDOBits(do_TxRx2_Trabajo)
    else ClearDOBits(do_TxRx2_Trabajo);
end;

procedure Rx2_CMG( State : boolean );
begin
  if State
    then SetDOBits(do_Rx2_CMG)
    else ClearDOBits(do_Rx2_CMG);
end;

procedure Rx2_Ganancia_N;
begin
  SetDOBits(do_Rx2_Ganancia_N);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx2_Ganancia_N);
  end;
end;

procedure Rx2_Ganancia_P;
begin
  SetDOBits(do_Rx2_Ganancia_P);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx2_Ganancia_P);
  end;
end;

procedure Rx2_CMS( State : boolean );
begin
  if State
    then SetDOBits(do_Rx2_CMS)
    else ClearDOBits(do_Rx2_CMS);
end;

procedure Rx2_Sintonia_N;
begin
  SetDOBits(do_Rx2_Sintonia_N);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx2_Sintonia_N);
  end;
end;

procedure Rx2_Sintonia_P;
begin
  SetDOBits(do_Rx2_Sintonia_P);
  try
    Sleep(250);
  finally
    ClearDOBits(do_Rx2_Sintonia_P);
  end;
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

function  BinaryToVoltage( Channel : AIRange ) : single;
begin
{$IFNDEF Exclude_External_DLLs}
  result := Get_Analog_Input_Voltage_Channel( Channel, Snapshot.Analog_Input[ Channel ], theConfiguration.AIGains[ Channel ] );
{$ELSE}
  result := 0;
{$ENDIF}
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

procedure Report_Check_Start;
begin
  ObsMutex.Acquire;
  with WriteView^ do
    begin
      ObsInProgress := true;
      ObsName       := '';
      ObsClient     := GetController;
      ObsStartTime  := Now;
      ObsLastTime   := 0;
      ObsProgress   := 0;
      ObsMessage    := '';
      ObsSubMsg     := '';
      ObsResult     := obs_InProgress;
    end;
  LogMessages.AddLogMessage( Now, lcInformation, Snapshot.ObsClient, AutoCheckingZone, 'Comenzando Autochequeo', 'Comenzando Autochequeo' );
end;

procedure Report_Check_Progress( Progress : integer; M, S : string );
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

procedure Report_Check_Finish( Result : integer; Error : boolean; Report : string );
begin
  case Result of
    obs_Ok:
      if Error
        then LogMessages.AddLogMessage( Now, lcInformation, Snapshot.ObsClient, AutoCheckingZone, 'Autochequeo Terminado. Error en algún punto', Report )
        else LogMessages.AddLogMessage( Now, lcInformation, Snapshot.ObsClient, AutoCheckingZone, 'Autochequeo Terminado', Report );
    obs_Canceled:
      LogMessages.AddLogMessage( Now, lcWarning, Snapshot.ObsClient, AutoCheckingZone, 'Autochequeo Cancelado', Snapshot.ObsMessage + ' ' + Snapshot.ObsSubMsg );
    else
      LogMessages.AddLogMessage( Now, lcError, Snapshot.ObsClient, AutoCheckingZone, 'Error en Autochequeo', Snapshot.ObsMessage + ' ' + Snapshot.ObsSubMsg );
  end;
  with WriteView^ do
    begin
      ObsInProgress := false;
      ObsLastTime   := ObsStartTime;
      ObsResult     := Result;
      if Result = obs_Ok
        then
          begin
            ObsName      := '';
            ObsClient    := '';
            if Error
             then ObsMessage   := 'Autochequeo Terminado. Error en algún punto'
             else ObsMessage   := 'Autochequeo Terminado';
            ObsSubMsg    := Report;
            ObsStartTime := 0;
            ObsProgress  := 0;
          end;
    end;
  ObsMutex.Release;
end;

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
    end;
  LogMessages.AddLogMessage( Now, lcInformation, Client, ObservationZone, 'Ejecutando plantilla ' + Name, 'Ejecutando plantilla ' + Name );
end;

procedure Report_Obs_Finish( Result : integer );
begin
  case Result of
    obs_Ok:
      LogMessages.AddLogMessage( Now, lcInformation, Snapshot.ObsClient, ObservationZone, 'Observacion terminada', 'Observacion terminada' );
    obs_Canceled:
      LogMessages.AddLogMessage( Now, lcWarning, Snapshot.ObsClient, ObservationZone, Snapshot.ObsMessage, Snapshot.ObsSubMsg );
    obs_Failed:
      LogMessages.AddLogMessage( Now, lcError, Snapshot.ObsClient, ObservationZone, Snapshot.ObsMessage, Snapshot.ObsSubMsg );
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
begin
  while not SnapshotMutex.WaitFor(1000) do
    if Terminated
      then Exit;
  try
    with WriteView^ do
      while not Terminated do
        begin
          {$IFNDEF Exclude_External_DLLs}
          Digital_Input   := Advantech.Get_Digital_Input;
          Analog_Input    := Advantech.Get_Analog_Input;
          {$ENDIF}
          Sleep(500);
        end;
  finally
    SnapshotMutex.Release;
  end;
end;

{ TCleanupThread }

constructor TCleanupThread.Create;
begin
  inherited Create(true);
  Priority := tpLower;
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
          if ((Digital_Input and di_Radar_On_P) <> 0) and
             ((Digital_Input and di_Radar_On_N) <> 0)
            then
              begin
                if (Digital_Output and do_Radar_Encender) <> 0
                  then ClearCommand(do_Radar_Encender);
                theStatisticsConfig.BeginSwitched(RadarIndex);
              end;
          // do_Radar_Apagar
          if ((Digital_Output and do_Radar_Apagar) <> 0) and
             ((Digital_Input  and di_Radar_On_P) = 0) and
             ((Digital_Input  and di_Radar_On_N) = 0)
            then ClearCommand(do_Radar_Apagar);
          if ((Digital_Input and di_Radar_On_P) = 0) or ((Digital_Input and di_Radar_On_N) = 0)
            then theStatisticsConfig.EndSwitched(RadarIndex);
          // do_Tx1_Encender
          if (Digital_Input and di_Tx1_Caldeo) <> 0
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
          if (Digital_Input and di_Tx2_Caldeo) <> 0
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
          if (Digital_Input and di_Tx1_Caldeo) = 0
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
          if (Digital_Input and di_Tx2_Caldeo) = 0
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
          if (Digital_Input  and di_Rx1_Caldeo) <> 0
            then
              begin
                if (Digital_Output and do_Rx1_Encender) <> 0
                  then ClearCommand(do_Rx1_Encender);
                theStatisticsConfig.BeginSwitched(RxIndex);
              end;
          // do_Rx2_Encender
          if (Digital_Input and di_Rx2_Caldeo) <> 0
            then
              begin
                if (Digital_Output and do_Rx2_Encender) <> 0
                  then ClearCommand(do_Rx2_Encender);
                theStatisticsConfig.BeginSwitched(Rx2Index);
              end;
          // do_Rx1_Apagar
          if (Digital_Input and di_Rx1_Caldeo) = 0
            then
              begin
                if (Digital_Output and do_Rx1_Apagar) <> 0
                  then ClearCommand(do_Rx1_Apagar);
                theStatisticsConfig.EndSwitched(RxIndex);
              end;
          // do_Rx2_Apagar
          if (Digital_Input and di_Rx2_Caldeo) = 0
            then
              begin
                if (Digital_Output and do_Rx2_Apagar) <> 0
                  then ClearCommand(do_Rx2_Apagar);
                theStatisticsConfig.EndSwitched(Rx2Index);
              end;
          //Radiar
          if (Digital_Input and di_Tx1_Anodo) <> 0
            then
              begin
                theStatisticsConfig.BeginSwitched(TxAnodoIndex);
                theStatisticsConfig.BeginSwitched(MagAnodoIndex);
                theStatisticsConfig.BeginSwitched(TirPrincAnodo1Index);
              end;
          if (Digital_Input and di_Tx1_Anodo) = 0
            then
              begin
                theStatisticsConfig.EndSwitched(TxAnodoIndex);
                theStatisticsConfig.EndSwitched(MagAnodoIndex);
                theStatisticsConfig.EndSwitched(TirPrincAnodo1Index);
              end;
          if (Digital_Input and di_Tx2_Anodo) <> 0
            then
              begin
                theStatisticsConfig.BeginSwitched(TxAnodo2Index);
                theStatisticsConfig.BeginSwitched(MagAnodo2Index);
                theStatisticsConfig.BeginSwitched(TirPrincAnodo2Index);
              end;
          if (Digital_Input and di_Tx2_Anodo) = 0
            then
              begin
                theStatisticsConfig.EndSwitched(TxAnodo2Index);
                theStatisticsConfig.EndSwitched(MagAnodo2Index);
                theStatisticsConfig.EndSwitched(TirPrincAnodo2Index);
              end;
          Sleep(1000);
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
          {$IFNDEF Exclude_External_DLLs}
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
                       then FinishAng := FinishAng + 4096;
                     if FinishAng > MinSector
                       then
                         begin
                           AntPos := SnapShot.Position_Az - OffsetAng + theConfiguration.AngleAcc;
                           if AntPos < 0
                             then AntPos := AntPos + 4096;
                           if SnapShot.SP_Velocity_Az <> 0
                             then
                               if ((ClockwiseAz) and (AntPos > FinishAng) and (Abs(AntPos - FinishAng) < MinSector)) or
                                  ((not ClockwiseAz) and (AntPos > (4096-MinSector)))
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
                             then AntPos := AntPos + 4096;
                           if SnapShot.SP_Velocity_El <> 0
                             then
                               if ((ClockwiseEl) and (AntPos > FinishAng) and (Abs(AntPos - FinishAng) < MinSector)) or
                                  ((not ClockwiseEl) and (AntPos > (4096-MinSector)))
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
          {$ENDIF}
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

procedure InitAcquisition;
begin
  // Trigger source
  Set_Fuente_N1( theConfiguration.N1Source );
  // A/D converter freq
  Set_Frecuencia_AD( theConfiguration.SampleRate );
  // AI Gains
{$IFNDEF Exclude_External_DLLs}
  Set_Analog_Input_Gains( theConfiguration.AI_Gains );
{$ENDIF}
end;

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
            {$IFNDEF Exclude_External_DLLs}
            Advantech.Set_Digital_Output(Digital_Output);
            {$ENDIF}
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
            //Pulse
            Pulse := tx_Pulse_None;
            Trigger_Source := LoadN1Source;
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
{$IFNDEF Exclude_External_DLLs}
  if PCI1714 = -1
    then Init_PCI416;
  Init_Encoder;  // Deva
  Init_Devices;  // Advantech
{$ENDIF}
  FileMapping := CreateFileMapping($FFFFFFFF, nil,
                                   PAGE_READWRITE,
                                   0, sizeof(TSnapshot),
                                   SnapshotName);
  Assert(FileMapping <> 0);
  ControlMutex  := TControlMutex.Create(nil, false, ControlMutexName);
  SnapshotMutex := TMutex.Create(nil, false, SnapshotMutexName);
  CleanupMutex  := TMutex.Create(nil, false, CleanupMutexName);
  AntennaMutex  := TMutex.Create(nil, false, AntennaMutexName);
  ObsMutex      := TMutex.Create(nil, false, ObsMutexName);
  ChangeSP      := TMutex.Create(nil, false, '');
  Snapshot      := MapViewOfFile(FileMapping, FILE_MAP_READ,  0, 0, 0);
  WriteView     := MapViewOfFile(FileMapping, FILE_MAP_WRITE, 0, 0, 0);
  Assert(Snapshot  <> nil);
  Assert(WriteView <> nil);
  InitSnapshot;
  InitAcquisition;
  Pulso_Largo;
  SnapShotThread := TSnapshotThread.Create;
  CleanupThread  := TCleanupThread.Create;
  AntennaThread  := TAntennaThread.Create;
  Initialized    := true;
  LogMessages    := TLog.Create;
  LogMessages.AddLogMessage( Now, lcInformation, 'Automatic', ElbrusZone, 'Elbrus Inicializado...', 'Elbrus Inicializado...' );
end;

procedure DoneElbrus;
begin
  try
    {$IFNDEF RDA_Simulation}
    try
      WaitForTxsStantby;
    except
      on E : Exception do
        LogMessages.AddLogRawMessage( Now, lcError, GetController, TxZone, E.Message, E.Message );
    end;
    {$ENDIF}
    FreeAndNil(AntennaThread);
    FreeAndNil(CleanupThread);
    FreeAndNil(SnapshotThread);
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
  {$IFNDEF Exclude_External_DLLs}
    if PCI1714 = -1
      then Done_PCI416;
    Done_Devices;
    Done_Encoder;
  {$ENDIF}
    LogMessages.AddLogMessage( Now, lcInformation, 'Automatic', ElbrusZone, 'Elbrus Terminado', 'Elbrus Terminado' );
    LogMessages.Free;
  except
  end;
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

end.

