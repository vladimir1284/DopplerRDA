unit CheckPoints;

{$DEFINE RDA_Simulation}
//{$UNDEF RDA_Simulation}
// RDA_Simulation if defined, do not check parameters at observation time

interface

uses
  SysUtils, ElbrusTypes, Calib, Rda_TLB;

type
  ECheckCanceled       = class(Exception);
  ECheckFailure        = class(Exception);
  ECheckTimeout        = class(ECheckFailure);
  ETxRxOutOfParameters = class(ECheckFailure);
  ETxRxAveria          = class(Exception);

  TConditionFunction = function : boolean of object;

  TCheckRefPoints =
    class
      private
        fPCEnabled,
        fPLEnabled,
        fTR1Enabled,
        fTR2Enabled,
        fTrabajo1,
        fTrabajo2,
        fCancel     : boolean;
        fProgress   : integer;
        fAcqCells   : word;
        fMemSize,
        fPointCount : integer;
        fCh1Mean,
        fCh2Mean,
        fCh1SqrMean,
        fCh2SqrMean : cardinal;
        Report      : string;
        fCheckError : boolean;
        fTime       : TDateTime;
      private  // Conditions
        function RadarOn : boolean;
        function TxRxOn : boolean;
        function TxRxStandby : boolean;
        function TxRxOk : boolean;
        function MotorOk : boolean;
        function MotorOff : boolean;
        function PositionAz : boolean;
        function PositionEl : boolean;
        function IsTime : boolean;
        function InSector( Value : integer; Range : TAIRange ) : boolean;
      private //SignalErros
        function CheckInputSignals( const Signals : array of cardinal; const State : boolean ) : string;
        function SignalsFailInTxRxOk : string;
      protected
        procedure Initialize;
        procedure Finalize;
        procedure TurnOnSequence;
        procedure TurnOffSequence;
        procedure TurnRadarOn;
        procedure TurnRadarOff;
        procedure TurnTxRxOn;
        procedure TurnTxRxOff;
        procedure SoundAlarm;
        procedure ProgTxRx( Pulse : TxPulse );
        procedure StandbyTxRx;
        procedure TurnMotorOn;
        procedure TurnMotorOff;
        procedure CleanMotor;
        procedure CheckCancel;
        function  PCPoints : integer;
        function  PLPoints : integer;
        procedure SwapPulse( const Pulse : TxPulse );
        procedure CheckChannelPL;
        procedure CheckChannelPC;
        procedure Error( ErrorMessage : string );
        procedure TxRxRestore;
        procedure WaitCondition( Condition : TConditionFunction;
                                 Period    : cardinal;
                                 Timeout   : cardinal;
                                 ProgGoal  : integer;
                                 M, S, E   : string );
        function  ConvertToDB( Start, Final : cardinal; RawData : PWords; Calibration : CalibrationTable ) : cardinal;
        function  Acquire_Shots( Shots      : cardinal;
                                 Cells      : cardinal;
                                 FirstCell, LastCell : cardinal;
                                 out Ch1, Ch2   : cardinal;
                                 out SM1, SM2   : cardinal ) : boolean;
        function  Acquire_ShotsTwoChannels( Order       : boolean;
                                            Port        : integer;
                                            SampleRate  : cardinal;
                                            ClockSource : boolean;
                                            ShotCount   : cardinal;
                                            CellCount   : cardinal;
                                            StartCell   : cardinal;
                                            FinalCell   : cardinal;
                                            out Ch1, Ch2    : cardinal;
                                            out SM1, SM2    : cardinal;
                                            LoopTimeout : double ) : boolean;
      public
        constructor Create;
        destructor  Destroy;  override;
        procedure   Execute;
        procedure   Cancel;
    end;

var
  CheckRefPoints : TCheckRefPoints = nil;

implementation

uses
  Windows, Constants, Config, Elbrus, Angle, Math, Users,
  RTManager, EventLog, LogTools, DateUtils, Driver, Advantech, Parameters;

const
  BeamsToAcquire = 100;

const
  ADay    = 1;
  AnHour  = ADay/24;
  AMinute = AnHour/60;
  ASecond = AMinute/60;

function AllocPtr( Size : cardinal ) : pointer;
var
  Address : cardinal;
begin
  Address := GlobalAlloc(GPTR, Size);
  if Address <> 0
    then
      if VirtualLock(pointer(Address), Size)
        then
          begin
            Result := pointer(Address);
            FillChar( Result^, Size, 0 );
          end
        else
          begin
            GlobalFree(Address);
            raise Exception.Create('Can not lock memory');
          end
    else raise Exception.Create('Out of memory');
end;

procedure ReleasePtr( var Ptr : pointer; Size : cardinal );
begin
  if assigned(Ptr)
    then
      begin
        VirtualUnlock(Ptr, Size);
        GlobalFree(cardinal(Ptr));
        Ptr := nil;
      end;
end;

{ TCheckRefPoints }

procedure TCheckRefPoints.Cancel;
begin
  fCancel := true;
end;

procedure TCheckRefPoints.CheckCancel;
begin
  if fCancel
    then
      begin
        fCancel := false;
        raise ECheckCanceled.Create(ts_Cancel);
      end;
end;

procedure TCheckRefPoints.CheckChannelPC;
var
  i, Index : integer;
  PCPoint : integer;
  Deviation : double;
begin
  fAcqCells  := round(Snapshot.Counter_Times[N3_Counter] * (Snapshot.Sample_Rate/1000000));
  PCPoint := 0;
  for i := 0 to theConfiguration.PointCount-1 do
    if (theConfiguration.RefPowerCh1PC[i] > 0) or (theConfiguration.RefPowerCh2PC[i] > 0)
      then
        begin
          {$IFNDEF RDA_Simulation}
          if not TxRxOk
            then raise ETxRxOutOfParameters.Create( 'Hubo los siguientes errores en TxRx en el punto #' +
                                                    IntToStr( I ) + ' trabajando en pulso corto:;' + SignalsFailInTxRxOk );
          Elbrus.Set_SP_Posicion_Az( AngleCode( theConfiguration.RefAzimuth[i] ) );
          WaitCondition(PositionAz, 500, 15000, fProgress, ts_ExecutingCheck, ms_MoveAntenna, es_AzPosAntenna);
          Elbrus.Set_SP_Posicion_El( AngleCode( theConfiguration.RefElevation[i] ) );
          WaitCondition(PositionEl, 500, 15000, fProgress, ts_ExecutingCheck, ms_MoveAntenna, es_ElPosAntenna);
          {$ENDIF}
          WaitCondition(nil, 0, 0, ((PLPoints+PCPoint)*100) div (PLPoints+PCPoints),
                        ts_ExecutingCheck, ms_TransferCheck + IntToStr(PLPoints + succ(PCPoint)), '');
          Inc( PCPoint );
          Acquire_Shots( BeamsToAcquire, fAcqCells, Trunc(theConfiguration.RefStartCell[i]), Trunc(theConfiguration.RefFinalCell[i]), fCh1Mean, fCh2Mean, fCh1SqrMean, fCh2SqrMean );
          if fTR1Enabled
            then
              begin
                Deviation := Abs( fCh1SqrMean - Sqr(fCh1Mean) );
                fCheckError := fCheckError or (fCh1Mean < theConfiguration.RefPowerCh1PC[i]);
                Report := Report + ' Az: ' + FormatFloat( '0.00', theConfiguration.RefAzimuth[i] ) +
                                   ', El: ' + FormatFloat( '0.00', theConfiguration.RefElevation[i] ) +
                                   ', Celdas: ' + FormatFloat( '0', theConfiguration.RefStartCell[i] ) + '..' + FormatFloat( '0', theConfiguration.RefFinalCell[i] ) +
                                   ' trabajando en pulso corto. ' +
                                   ' De ' + FormatFloat( '0.00', theConfiguration.RefPowerCh1PC[i] ) +
                                   ' DB, hay ' + FormatFloat( '0.00', fCh1Mean ) + ' DB, la desviación típica fue de ' + FormatFloat( '0.00', Deviation ) + ';';
              end;
          if fTR2Enabled
            then
              begin
                Deviation := Abs( fCh2SqrMean - Sqr(fCh2Mean) );
                fCheckError := fCheckError or (fCh2Mean < theConfiguration.RefPowerCh2PC[i]);
                Report := Report + 'Az: ' + FormatFloat( '0.00', theConfiguration.RefAzimuth[i] ) +
                                   ', El: ' + FormatFloat( '0.00', theConfiguration.RefElevation[i] ) +
                                   ', Celdas: ' + FormatFloat( '0', theConfiguration.RefStartCell[i] ) + '..' + FormatFloat( '0', theConfiguration.RefFinalCell[i] ) +
                                   ' trabajando en pulso corto. ' +
                                   ' De ' + FormatFloat( '0.00', theConfiguration.RefPowerCh2PC[i] ) +
                                   ' DB, hay ' + FormatFloat( '0.00', fCh2Mean ) + ' DB, la desviación típica fue de ' + FormatFloat( '0.00', Deviation ) + ';';
              end;
        end;
end;

function TCheckRefPoints.CheckInputSignals(const Signals: array of cardinal; const State: boolean): string;
var
  i : byte;
begin
  for i := Low( Signals ) to High( Signals ) do
    if (Snapshot.Digital_Input and Signals[i] <> 0) = State
      then result := result + DI_Names[ Trunc(Log2(Signals[i])) ] + ',';
  Delete( result, Length(result), 1 );
end;

procedure TCheckRefPoints.CleanMotor;
begin
  Elbrus.Set_Lazo_Posicion_Az(false);
  Elbrus.Set_Lazo_Posicion_El(false);
  Elbrus.Set_SP_Velocidad_Az(0);
  Elbrus.Set_SP_Velocidad_El(0);
end;

procedure TCheckRefPoints.Error(ErrorMessage: string);
begin
  Report_Obs_Progress(fProgress, ts_ErrorCheck, ErrorMessage);
end;

procedure TCheckRefPoints.Execute;
var
  Result : integer;
begin
  Result := obs_Failed;
  Report_Check_Start;
  RTEnabled := false;
  try
    try
      try
        Initialize;
      except
        on E : Exception do
        begin
          E.Message := CheckInitializationError + ' ' + E.Message;
          raise;
        end;
      end;
      try
        try
          TurnOnSequence;
        except
          try
            TurnOffSequence;
          except
            on E : Exception do
              LogMessages.AddLogMessage( Now, lcError, GetController, 'Secuencia de apagado', TurnOffError,
                                         'Hubo un error en la secuencia de encendido y se paso a la secuencia' +
                                         ' de apagado donde hubo el siguiente error ' +  E.Message );
          end;
          raise;
        end;
        try
          {$IFNDEF RDA_Simulation}
          fTime := IncMinute( Now, theConfiguration.RefPointsWarnTime );
          WaitCondition(IsTime, 1000, round(1000*(theConfiguration.RefPointsWarnTime+1)/ASecond), 100,
                        ts_Warming, ms_WaitTime, es_CheckTime);
          Elbrus.Set_Lazo_Posicion_Az(true);
          Elbrus.Set_Lazo_Posicion_El(true);
          {$ENDIF}
          if fPLEnabled
            then
              begin
                SwapPulse( tx_Pulse_Long );
                CheckChannelPL;
              end;
          if fPCEnabled
            then
              begin
                SwapPulse( tx_Pulse_Short );
                CheckChannelPC;
              end;
        finally
          {$IFNDEF RDA_Simulation}
          Elbrus.Set_Lazo_Posicion_Az(false);
          Elbrus.Set_Lazo_Posicion_El(false);
          {$ENDIF}
          try
            TurnOffSequence;
          except
            on E : Exception do
            begin
              LogMessages.AddLogMessage( Now, lcError, GetController, 'Secuencia de apagado', TurnOffError, E.Message );
              Error( E.Message );
              Sleep( 5000 );
            end;
          end;
        end;
      finally
        Finalize;
      end;
      Result := obs_Ok;
      if theConfiguration.SendMsgOnError
        then LogMessages.SendCheckEmail( Report );
    except
      on ECheckCanceled do
        begin
          Report_Check_Progress(0, ts_CancelCheck, '');
          Result := obs_Canceled;
        end;
      on E : Exception do
        begin
          Error( E.Message );
        end;
    end;
  finally
    Report_Check_Finish( Result, fCheckError ,Report );
  end;
end;

procedure TCheckRefPoints.Finalize;
begin
  Elbrus.Set_Frecuencia_AD( theConfiguration.SampleRate );
end;

procedure TCheckRefPoints.Initialize;
var
  i : integer;
begin
  fCheckError := false;
  Report := '';
  fProgress := 0;
  fPointCount := 0;
  fCancel := false;
  fTR1Enabled := false;
  fTR2Enabled := false;
  fPCEnabled := false;
  fPLEnabled := false;
  for i := 0 to theConfiguration.PointCount-1 do
  begin
    if (theConfiguration.RefPowerCh1PC[i] > 0) or (theConfiguration.RefPowerCh1PL[i] > 0)
      then fTR1Enabled := true;
    if (theConfiguration.RefPowerCh2PC[i] > 0) or (theConfiguration.RefPowerCh2PL[i] > 0)
      then fTR2Enabled := true;
    if (theConfiguration.RefPowerCh1PC[i] > 0) or (theConfiguration.RefPowerCh2PC[i] > 0)
      then fPCEnabled := true;
    if (theConfiguration.RefPowerCh1PL[i] > 0) or (theConfiguration.RefPowerCh2PL[i] > 0)
      then fPLEnabled := true;
  end;
  Report := 'Chequeando los puntos de referencia:;';
{
  if fTR1Enabled
    then Report := Report + 'La potencia del trasmisor #1 es de: ' + FormatFloat( '0.00', BinaryToKW( Snapshot.Analog_Input[ai_Tx1_Potencia] ) ) + ';';
  if fTR2Enabled
    then Report := Report + 'La potencia del trasmisor #2 es de: ' + FormatFloat( '0.00', BinaryToKW( Snapshot.Analog_Input[ai_Tx2_Potencia] ) ) + ';';
}    
  Elbrus.Set_Frecuencia_AD( theConfiguration.RefPointsADFreq );
  if fPLEnabled
    then
      begin
        if Snapshot^.Pulse <> tx_Pulse_Long
          then Elbrus.Pulso_Largo;
      end
    else if fPCEnabled
           then if Snapshot^.Pulse <> tx_Pulse_Short
                  then Elbrus.Pulso_Corto;
end;

function TCheckRefPoints.InSector(Value: integer; Range: TAIRange): boolean;
begin
  Result := (Value >= Range.Min) and (Value <= Range.Max);
end;

function TCheckRefPoints.MotorOff: boolean;
const
  AccMask = di_Acc_Listo_Az or di_Acc_Listo_El;
begin
  Result := (Snapshot.Digital_Input and AccMask) = 0;
end;

function TCheckRefPoints.MotorOk: boolean;
const
  AccMask = di_Antena_Listo or di_Acc_Listo_Az or di_Acc_Listo_El;
begin
  Result := (Snapshot.Digital_Input and AccMask) = AccMask;
end;

function TCheckRefPoints.PositionAz: boolean;
begin
  Result := abs(Distance(Snapshot.SP_Position_Az, Snapshot.Position_Az)) <= theConfiguration.AngleAcc;
end;

function TCheckRefPoints.PositionEl: boolean;
begin
  Result := abs(Distance(Snapshot.SP_Position_El, Snapshot.Position_El)) <= theConfiguration.AngleAcc;
end;

procedure TCheckRefPoints.ProgTxRx( Pulse : TxPulse );
begin
  case Pulse of
    tx_Pulse_Long  : if Snapshot^.Pulse <> tx_Pulse_Long
                       then Elbrus.Pulso_Largo;
    tx_Pulse_Short : if Snapshot^.Pulse <> tx_Pulse_Short
                       then Elbrus.Pulso_Corto;
  end;
  if fTR1Enabled
    then Elbrus.Tx1_Standby(false);
  if fTR2Enabled
    then Elbrus.Tx2_Standby(false);
end;

function TCheckRefPoints.RadarOn: boolean;
const
  Mask = di_Red_Listo or
         di_Radar_On_P or
         di_Radar_On_N;
begin
  Result := Snapshot.Digital_Input and Mask = Mask;
end;

function TCheckRefPoints.SignalsFailInTxRxOk: string;
begin
  result := '';
  with Snapshot^ do
    begin
      if Snapshot.Pulse <> tx_Pulse_None
        then
          begin
            if fTR1Enabled and ((Snapshot.Pulse = tx_Pulse_Long) xor (Digital_Input and di_TxRx1_Pulso_Largo <> 0))
              then result := TxRx1PulseEqualObsPulse;
            if fTR2Enabled and ((Snapshot.Pulse = tx_Pulse_Long) xor (Digital_Input and di_TxRx2_Pulso_Largo <> 0))
              then result := result + ';' + TxRx2PulseEqualObsPulse;
          end;
      if fTR1Enabled
        then
          begin
            if not InSector(Analog_Input[ai_Tx1_Potencia], AI_Sector[ai_Tx1_Potencia])
              then result := result + ';' + AI_Names[ai_Tx1_Potencia] + ' fuera de parametro';
            if not InSector(Analog_Input[ai_Rx1_Sintonia], AI_Sector[ai_Rx1_Sintonia])
              then result := result + ';' + AI_Names[ai_Rx1_Sintonia] + ' fuera de parametro';
            if not InSector(Analog_Input[ai_Rx1_Ganancia], AI_Sector[ai_Rx1_Ganancia])
              then result := result + ';' + AI_Names[ai_Rx1_Ganancia] + ' fuera de parametro';
            if not InSector(Analog_Input[ai_Rx1_Ruido], AI_Sector[ai_Rx1_Ruido])
              then result := result + ';' + AI_Names[ai_Rx1_Ruido] + ' fuera de parametro';
          end;
      if fTR2Enabled
        then
          begin
            if not InSector(Analog_Input[ai_Tx2_Potencia], AI_Sector[ai_Tx2_Potencia])
              then result := result + ';' + AI_Names[ai_Tx2_Potencia] + ' fuera de parametro';
            if not InSector(Analog_Input[ai_Rx2_Sintonia], AI_Sector[ai_Rx2_Sintonia])
              then result := result + ';' + AI_Names[ai_Rx2_Sintonia] + ' fuera de parametro';
            if not InSector(Analog_Input[ai_Rx2_Ganancia], AI_Sector[ai_Rx2_Ganancia])
              then result := result + ';' + AI_Names[ai_Rx2_Ganancia] + ' fuera de parametro';
            if not InSector(Analog_Input[ai_Rx2_Ruido], AI_Sector[ai_Rx2_Ruido])
              then result := result + ';' + AI_Names[ai_Rx2_Ruido] + ' fuera de parametro';
          end;
    end;
end;

procedure TCheckRefPoints.SoundAlarm;
begin
  Elbrus.Alarma_Sonora(5000);
end;

procedure TCheckRefPoints.StandbyTxRx;
begin
  if fTR1Enabled
    then Elbrus.Tx1_Standby(true);
  if fTR2Enabled
    then Elbrus.Tx2_Standby(true);
end;

procedure TCheckRefPoints.TurnMotorOff;
begin
  Elbrus.Apagar_Accionamiento;
end;

procedure TCheckRefPoints.TurnMotorOn;
begin
  Elbrus.Encender_Accionamiento;
end;

procedure TCheckRefPoints.TurnOffSequence;
begin
  {$IFNDEF RDA_Simulation}
  StandbyTxRx;
  WaitCondition(TxRxStandby, 2000, 5000, 50,
                ts_CheckDone, ms_TxRxStandby, es_CheckStandby);
  TurnMotorOff;
  try
    WaitCondition(MotorOff, 1000, 5000, 100,
                  ts_CheckDone, ms_MotorOff, es_CheckMotorOff);
  except
    on E : ECheckTimeout do
    begin
      E.Message := E.Message  + ';Fallaron las siguietes señales:;' +
                   CheckInputSignals( [di_Acc_Listo_Az, di_Acc_Listo_El], true );
      raise;
    end;
    else raise;
  end;
  CleanMotor;
  TxRxRestore;
  {$ENDIF}
end;

procedure TCheckRefPoints.TurnOnSequence;
const
  Tx1Tx2_On_Mask = di_Tx1_Anodo or di_Tx2_Anodo;
begin
  {$IFNDEF RDA_Simulation}
  fTrabajo1 := (Elbrus.Snapshot.Digital_Input and di_TxRx1_Ajuste) = 0;
  fTrabajo2 := (Elbrus.Snapshot.Digital_Input and di_TxRx2_Ajuste) = 0;
  if not RadarOn
    then TurnRadarOn;
  try
    WaitCondition(RadarOn, 2000, 10000, 10,
                  ts_PreparingCheck, ms_TurnRadarOn, es_CheckRadarOn);
  except
    on E : ECheckTimeout do
    begin
      TurnRadarOff;
      E.Message := E.Message + ';Fallaron las siguietes señales:;' +
                   CheckInputSignals( [di_Red_Listo, di_Radar_On_P, di_Radar_On_N, di_Antena_Listo ], false );
      raise;
    end;
    else
      begin
        TurnRadarOff;
        raise;
      end;
  end;
  if not TxRxOn
    then TurnTxRxOn
    else
      begin
        if fTR1Enabled
          then Elbrus.TxRx1_Trabajo(true);
        if fTR2Enabled
          then Elbrus.TxRx2_Trabajo(true);
      end;
  try
    if fTR1Enabled and (Snapshot.Digital_Input and di_Tx1_Averia <> 0)
      then raise ETxRxAveria.Create( 'Averia en el trasmisor #1' );
    if fTR2Enabled and (Snapshot.Digital_Input and di_Tx2_Averia <> 0)
      then raise ETxRxAveria.Create( 'Averia en el trasmisor #2' );

    WaitCondition(TxRxOn, 5000, 900000, 80,
                  ts_PreparingCheck, ms_TurnTxRxOn, es_CheckTxRxOn);
  except
    on E : ECheckTimeout do
    begin
      TurnTxRxOff;
      E.Message := E.Message  + ';Fallaron las siguietes señales:;';
      if fTR1Enabled
        then E.Message := E.Message +
                          CheckInputSignals( [ di_Tx1_Listo, di_Rx1_Anodo ], false ) +
                          CheckInputSignals( [ di_Tx1_Averia ], true );
      if fTR2Enabled
        then E.Message := E.Message +
                          CheckInputSignals( [ di_Tx2_Listo, di_Rx2_Anodo ], false ) +
                          CheckInputSignals( [ di_Tx2_Averia ], true );
      raise;
    end;
    else
      begin
        TurnTxRxOff;
        raise;
      end;
  end;
  if not MotorOk
    then
      begin
        SoundAlarm;
        TurnMotorOn;
      end;
  try
    WaitCondition(MotorOk, 1000, 5000, 100,
                  ts_PreparingCheck, ms_MotorOn, es_CheckMotor);
  except
    on E : ECheckTimeout do
    begin
      TurnMotorOff;
      E.Message := E.Message  + ';Fallaron las siguietes señales:;' +
                   CheckInputSignals( [di_Antena_Listo, di_Acc_Listo_Az, di_Acc_Listo_El], false );
      raise;
    end;
    else
      begin
        TurnMotorOff;
        raise;
      end;
  end;
  {$ELSE}
  Sleep( 2000 );
  {$ENDIF}
end;

procedure TCheckRefPoints.TurnRadarOff;
begin
  Elbrus.Apagar_Radar;
end;

procedure TCheckRefPoints.TurnRadarOn;
begin
  Elbrus.Encender_Radar;
end;

procedure TCheckRefPoints.SwapPulse( const Pulse : TxPulse );
begin
  ProgTxRx( Pulse );
  {$IFNDEF RDA_Simulation}
  try
    WaitCondition(TxRxOk, 3000, 90000, 100,
                  ts_PreparingCheck, ms_ProgTxRx, es_CheckTxRx);
  except
    on E : ECheckTimeout do
    begin
      E.Message := E.Message  + ' Hubo los siguientes errores ' + SignalsFailInTxRxOk;
      raise;
    end;
    else raise;
  end;
  {$ENDIF}
end;

procedure TCheckRefPoints.TurnTxRxOff;
begin
  if fTR1Enabled
    then
      begin
        Elbrus.Tx1_Standby(true);
        Elbrus.TxRx1_Trabajo(true);
        Elbrus.Tx1_Apagar;
        Elbrus.Rx1_Apagar;
      end;
  if fTR2Enabled
    then
      begin
        Elbrus.Tx2_Standby(true);
        Elbrus.TxRx2_Trabajo(true);
        Elbrus.Tx2_Apagar;
        Elbrus.Rx2_Apagar;
      end;
end;

procedure TCheckRefPoints.TurnTxRxOn;
begin
  if fTR1Enabled
    then
      begin
        Elbrus.Tx1_Standby(true);
        Elbrus.TxRx1_Trabajo(true);
        Elbrus.Tx1_Encender;
        Elbrus.Rx1_Encender;
      end;
  if fTR2Enabled
    then
      begin
        Elbrus.Tx2_Standby(true);
        Elbrus.TxRx2_Trabajo(true);
        Elbrus.Tx2_Encender;
        Elbrus.Rx2_Encender;
      end;
end;

function TCheckRefPoints.TxRxOk: boolean;
begin
  with Snapshot^ do
    begin
      Result := (Snapshot.Pulse = tx_Pulse_None) or
                (not fTR1Enabled or ((Snapshot.Pulse = tx_Pulse_Long) xor (Digital_Input and di_TxRx1_Pulso_Largo = 0))) and
                (not fTR2Enabled or ((Snapshot.Pulse = tx_Pulse_Long) xor (Digital_Input and di_TxRx2_Pulso_Largo = 0)));
      if fTR1Enabled
        then Result := Result and
                       InSector(Analog_Input[ai_Tx1_Potencia], AI_Sector[ai_Tx1_Potencia]) and
                       InSector(Analog_Input[ai_Rx1_Sintonia], AI_Sector[ai_Rx1_Sintonia]) and
                       InSector(Analog_Input[ai_Rx1_Ganancia], AI_Sector[ai_Rx1_Ganancia]) and
                       InSector(Analog_Input[ai_Rx1_Ruido],    AI_Sector[ai_Rx1_Ruido]);
      if fTR2Enabled
        then Result := Result and
                       InSector(Analog_Input[ai_Tx2_Potencia], AI_Sector[ai_Tx2_Potencia]) and
                       InSector(Analog_Input[ai_Rx2_Sintonia], AI_Sector[ai_Rx2_Sintonia]) and
                       InSector(Analog_Input[ai_Rx2_Ganancia], AI_Sector[ai_Rx2_Ganancia]) and
                       InSector(Analog_Input[ai_Rx2_Ruido],    AI_Sector[ai_Rx2_Ruido]);
    end;
end;

function TCheckRefPoints.TxRxOn: boolean;
const
  Mask1 = di_Tx1_Listo or di_Rx1_Anodo;
  Mask2 = di_Tx2_Listo or di_Rx2_Anodo;
begin
  with Snapshot^ do
    Result := (not fTR1Enabled or (((Digital_Input and Mask1) = Mask1) and
                                   (Digital_Input and di_Tx1_Averia = 0) and
                                   (Digital_Input and di_Rx1_Averia = 0)))
              and
              (not fTR2Enabled or (((Digital_Input and Mask2) = Mask2) and
                                   (Digital_Input and di_Tx2_Averia = 0) and
                                   (Digital_Input and di_Rx2_Averia = 0)));
end;

procedure TCheckRefPoints.TxRxRestore;
begin
  if fTR1Enabled
    then Elbrus.TxRx1_Trabajo(fTrabajo1);
  if fTR2Enabled
    then Elbrus.TxRx2_Trabajo(fTrabajo2);
end;

function TCheckRefPoints.TxRxStandby: boolean;
begin
  Result := true;
  if fTR1Enabled
    then Result := Result and (Snapshot.Digital_Input and di_Tx1_Anodo = 0);
  if fTR2Enabled
    then Result := Result and (Snapshot.Digital_Input and di_Tx1_Anodo = 0);
end;

procedure TCheckRefPoints.WaitCondition(Condition: TConditionFunction; Period, Timeout: cardinal; ProgGoal: integer; M, S, E: string);
var
  StartTime : cardinal;
  Steps     : integer;
  Increment : single;
  Success   : boolean;
  StartProg : integer;
begin
  CheckCancel;
  Success := (@Condition = nil) or Condition;
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
        while not Success and (GetTickCount - StartTime < Timeout) do
          begin
            fProgress := StartProg + round(Steps*Increment);
            inc(Steps);
            Report_Obs_Progress(fProgress, M, S );
            Sleep(Period);
            CheckCancel;
            Success := Condition;
          end;
      end;
  if Success
    then
      begin
        fProgress := ProgGoal;
        Report_Obs_Progress(fProgress, M, S )
      end
    else raise ECheckTimeout.Create(E);
end;

procedure TCheckRefPoints.CheckChannelPL;
var
  i : integer;
  PLPoint, Index : integer;
  Deviation : double;
begin
  fAcqCells  := round(Snapshot.Counter_Times[N3_Counter] * (Snapshot.Sample_Rate/1000000));
  PLPoint := 0;
  for i := 0 to theConfiguration.PointCount-1 do
    if (theConfiguration.RefPowerCh1PL[i] > 0) or (theConfiguration.RefPowerCh2PL[i] > 0)
      then
        begin
          {$IFNDEF RDA_Simulation}
          if not TxRxOk
            then raise ETxRxOutOfParameters.Create( 'Hubo los siguientes errores en TxRx en el punto #' +
                                                    IntToStr( I ) + ' trabajando en pulso largo:;' + SignalsFailInTxRxOk );
          Elbrus.Set_SP_Posicion_Az( AngleCode( theConfiguration.RefAzimuth[i] ) );
          WaitCondition(PositionAz, 500, 15000, fProgress, ts_ExecutingCheck, ms_MoveAntenna, es_AzPosAntenna);
          Elbrus.Set_SP_Posicion_El( AngleCode( theConfiguration.RefElevation[i] ) );
          WaitCondition(PositionEl, 500, 15000, fProgress, ts_ExecutingCheck, ms_MoveAntenna, es_ElPosAntenna);
          {$ENDIF}
          WaitCondition(nil, 0, 0, (PLPoint*100) div (PLPoints+PCPoints),
                        ts_ExecutingCheck, ms_TransferCheck + IntToStr(succ(PLPoint)), '');
          Inc( PLPoint );
          Acquire_Shots( BeamsToAcquire, fAcqCells, Trunc(theConfiguration.RefStartCell[i]), Trunc(theConfiguration.RefFinalCell[i]), fCh1Mean, fCh2Mean, fCh1SqrMean, fCh2SqrMean );
          if fTR1Enabled
            then
              begin
                Deviation := Abs( fCh1SqrMean - Sqr(fCh1Mean) );
                fCheckError := fCheckError or (fCh1Mean < theConfiguration.RefPowerCh1PL[i]);
                Report := Report + 'Comprobado el punto Az: ' + FormatFloat( '0.00', theConfiguration.RefAzimuth[i] ) +
                                   ', El: ' + FormatFloat( '0.00', theConfiguration.RefElevation[i] ) +
                                   ', Celdas: ' + FormatFloat( '0', theConfiguration.RefStartCell[i] ) + '..' + FormatFloat( '0', theConfiguration.RefFinalCell[i] ) +
                                   ' trabajando en pulso largo. ' +
                                   ' De ' + FormatFloat( '0.00', theConfiguration.RefPowerCh1PL[i] ) +
                                   ' DB, hay ' + FormatFloat( '0.00', fCh1Mean ) + ' DB, la desviación típica fue de ' + FormatFloat( '0.00', Deviation ) + ';';
              end;
          if fTR2Enabled
            then
              begin
                Deviation := Abs( fCh2SqrMean - Sqr(fCh2Mean) );
                fCheckError := fCheckError or (fCh2Mean < theConfiguration.RefPowerCh2PL[i]);
                Report := Report + 'Comprobado el punto Az: ' + FormatFloat( '0.00', theConfiguration.RefAzimuth[i] ) +
                                   ', El: ' + FormatFloat( '0.00', theConfiguration.RefElevation[i] ) +
                                   ', Celdas: ' + FormatFloat( '0', theConfiguration.RefStartCell[i] ) + '..' + FormatFloat( '0', theConfiguration.RefFinalCell[i] ) +
                                   ' trabajando en pulso largo. ' +
                                   ' De ' + FormatFloat( '0.00', theConfiguration.RefPowerCh2PL[i] ) +
                                   ' DB, hay ' + FormatFloat( '0.00', fCh2Mean ) + ' DB, la desviación típica fue de ' + FormatFloat( '0.00', Deviation ) + ';';
              end;
        end;
end;

function TCheckRefPoints.PCPoints: integer;
var
  i : integer;
begin
  result := 0;
  for i := 0 to theConfiguration.PointCount-1 do
    if (theConfiguration.RefPowerCh1PC[i] > 0) or (theConfiguration.RefPowerCh2PC[i] > 0)
      then Inc( result );
end;

function TCheckRefPoints.PLPoints: integer;
var
  i : integer;
begin
  result := 0;
  for i := 0 to theConfiguration.PointCount-1 do
    if (theConfiguration.RefPowerCh1PL[i] > 0) or (theConfiguration.RefPowerCh2PL[i] > 0)
      then Inc( result );
end;

function TCheckRefPoints.IsTime: boolean;
begin
  Result := Now >= fTime;
end;

function TCheckRefPoints.Acquire_Shots(Shots, Cells: cardinal; FirstCell, LastCell : cardinal; out Ch1, Ch2 ,SM1, SM2: cardinal): boolean;
begin
  {$IFNDEF Exclude_External_DLLs}
  if theConfiguration.Ch1Port < theConfiguration.Ch2Port
    then Result := Acquire_ShotsTwoChannels( true, theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Shots, Cells, FirstCell, LastCell, Ch1, Ch2, SM1, SM2, 5 )
    else Result := Acquire_ShotsTwoChannels( false, theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, Shots, Cells, FirstCell, LastCell, Ch2, Ch1, SM2, SM1, 5 );
  {$ELSE}
  Result := false;
  {$ENDIF}
end;

function TCheckRefPoints.Acquire_ShotsTwoChannels(Order : boolean; Port: integer; SampleRate: cardinal;
                                                  ClockSource: boolean; ShotCount, CellCount, StartCell,
                                                  FinalCell : cardinal; out Ch1, Ch2, SM1, SM2: cardinal;
                                                  LoopTimeout: double): boolean;
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  Ch1Buffer,
  Ch2Buffer     : PWords;
  Ch1Value,
  Ch2Value      : cardinal;
  BufferSize    : integer;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferStruct;
  GainList      : PVideoGains;
  i             : cardinal;
  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;
begin
  Result := false;
  Ch1Buffer := nil;
  Ch2Buffer := nil;
  Ch1 := 0;
  Ch2 := 0;
  SM1 := 0;
  SM2 := 0;
  BufferSize := CellCount * sizeof( word );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq.Handle := GlobalAlloc( GPTR, BufferSize*2 );
        GetMem( Ch1Buffer, BufferSize );
        GetMem( Ch2Buffer, BufferSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Ch1Buffer, BufferSize );
        VirtualLock( Ch2Buffer, BufferSize );
        BufferAcq.Buffer  := GlobalLock( BufferAcq.Handle );

        //Check DMA Status
        FAICheck.ActiveBuf := @ActiveBuf;
        FAICheck.stopped   := @Stopped;
        FAICheck.retrieved := @Retrieved;
        FAICheck.overrun   := @Overrun;
        FAICheck.HalfReady := @HalfReady;

        //Initialize DMA
        FAIDmaExStart.TrigSrc    := 1;        //External Trigger
        FAIDmaExStart.TrigMode   := 1;        //Post Mode
        if ClockSource
          then FAIDmaExStart.ClockSrc := 0
          else FAIDmaExStart.ClockSrc := 2;
        FAIDmaExStart.TrigEdge   := 0;        //Rise
        FAIDmaExStart.SRCType    := 0;        //Digital
        FAIDmaExStart.CyclicMode := 0;        //Non-Cyclic
        FAIDmaExStart.NumChans   := 2;
        FAIDmaExStart.StartChan  := Port;     //Start by Chanel 0
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := CellCount * 2;
        FAIDmaExStart.buffer0    := BufferAcq.Buffer;

        QueryPerformanceFrequency(Freq);
        for i := 0 to ShotCount-1 do
          begin // Frame loop
            //Comienzo a adquirir
            DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

            QueryPerformanceCounter(Starting);
            GlobalStarting := Starting;
            try
              repeat
                DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
                QueryPerformanceCounter( Finishing );
                if (Stopped <> 1) and ((Finishing-Starting)*1000/Freq >= MaxLoopTime)
                  then if (Finishing-GlobalStarting)/Freq >= LoopTimeout
                         then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-GlobalStarting)*1000/Freq ) + ' ms')
                         else
                           begin
                             DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
                             DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );
                             QueryPerformanceCounter(Starting);
                           end;
              until Stopped = 1;
            finally
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
            end;
            // Process data
            ScatterTwoData( Ch1Buffer, Ch2Buffer, CellCount, BufferAcq.Buffer );
            if Order
              then
                begin
                  Ch1Value := ConvertToDB( StartCell, FinalCell, Ch1Buffer, theCalibration.Calibration1 );
                  Ch2Value := ConvertToDB( StartCell, FinalCell, Ch2Buffer, theCalibration.Calibration2 );
                end
              else
                begin
                  Ch1Value := ConvertToDB( StartCell, FinalCell, Ch1Buffer, theCalibration.Calibration2 );
                  Ch2Value := ConvertToDB( StartCell, FinalCell, Ch2Buffer, theCalibration.Calibration1 );
                end;
            Ch1 := Ch1 + Ch1Value;
            Ch2 := Ch2 + Ch2Value;
            SM1 := SM1 + Sqr(Ch1Value);
            SM2 := SM2 + Sqr(Ch2Value);
            if fCancel
              then raise ECheckCanceled.Create( 'El Chequeo Automatico ha sido Cancelado' );
            Sleep( 10 );
          end;
        // Mean
        Ch1 := Ch1 div ShotCount;
        Ch2 := Ch2 div ShotCount;
        SM1 := SM1 div ShotCount;
        SM2 := SM2 div ShotCount;
        Result := true;
      finally
        if assigned( Ch1Buffer ) then VirtualUnlock( Ch1Buffer, BufferSize );
        if assigned( Ch2Buffer ) then VirtualUnlock( Ch2Buffer, BufferSize );
        GlobalUnlock( BufferAcq.Handle );
        if assigned( Ch1Buffer ) then FreeMem( Ch1Buffer );
        if assigned( Ch2Buffer ) then FreeMem( Ch2Buffer );
        if assigned( BufferAcq.Buffer ) then GlobalFree( BufferAcq.Handle );
        Dispose( GainList );
        ReleaseMutex(AcquiringMutex);
      end
    else raise EAcqError.Create( 'Ya estan adquiriendo' );
end;

function TCheckRefPoints.ConvertToDB(Start, Final : cardinal; RawData: PWords; Calibration: CalibrationTable) : cardinal;
var
  I, J : integer;
begin
  result := 0;
  for I := Start to Final do
  begin
    if assigned(Calibration)
      then
        with Calibration^ do
          begin
            J := 0;
            while (J < rgsabound[0].cElements) and
                  (RawData[I] > PWords(pvData)[J]) do
              inc(J);
            if J < rgsabound[0].cElements
              then RawData[I] := J
              else RawData[I] := rgsabound[0].cElements;
          end
      else RawData[I] := 0;
    result := result + RawData[I];
  end;
  result := result div (Final-Start+1);
end;

constructor TCheckRefPoints.Create;
begin
  inherited Create;
  CheckRefPoints := self;
  fProgress := 0;
  fTime := 0;
end;

destructor TCheckRefPoints.Destroy;
begin
  CheckRefPoints := nil;
  inherited;
end;

end.
