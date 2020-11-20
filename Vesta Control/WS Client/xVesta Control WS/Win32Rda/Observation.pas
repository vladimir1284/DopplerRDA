unit Observation;

{$DEFINE RDA_Simulation}
//{$UNDEF RDA_Simulation}
// RDA_Simulation if defined, do not check parameters at observation time

interface

uses
  SysUtils,
  ElbrusTypes, Elbrus,
  Calib,
  Rda_TLB,
  VestaFile;

type
  EObservationCanceled = class(Exception);
  EObservationFailure  = class(Exception);
  EObservationTimeout  = class(EObservationFailure);
  ETxRxOutOfParameters = class(EObservationFailure);
  ETxRxAveria          = class(Exception);

type
  TConditionFunction = function : boolean of object;

  TObservation = class
  public
    constructor Create( Template : ITemplate;
                        Client   : string;
                        Time     : TDateTime );
    destructor  Destroy;  override;
  private
    fTemplate   : ITemplate;
    fClient     : string;
    fTime       : TDateTime;
    fProgress   : integer;
    fTR1Enabled : boolean;
    fTR2Enabled : boolean;
    fObsCancel  : boolean;
  public
    function  Execute : integer;
    procedure Cancel;
  protected
    procedure Initialize;
    procedure Finalize;
    procedure AllocateMemory;
    procedure ReleaseMemory;
    procedure TurnOnSequence;
    procedure TurnOffSequence;
    procedure CheckPPIRHI;
    procedure CheckCancel;
    procedure AcquireData;
    procedure UpdateTimes;
    procedure FindVariance;
    procedure FilterVariance;
    procedure PPIFilterPermanentEchoWhole;
    procedure PPIFilterPermanentEchoByDistance( Distance : cardinal );
    procedure PPIFilterPermanentEchoByHeight( Angle : single );
    procedure RHIFilterPermanentEcho;
    procedure ClutterSuppresion;
    function  FindPowerCh1( Antenna, Dist : double ) : Double;
    function  FindPowerCh2( Antenna, Dist : double ) : Double;
    function  CheckPPIReferencePointsCh1( const Angle : integer; out Msg : string ) : boolean;
    function  CheckPPIReferencePointsCh2( const Angle : integer; out Msg : string ) : boolean;
    function  CheckRHIReferencePointsCh1( const Angle : integer; out Msg : string ) : boolean;
    function  CheckRHIReferencePointsCh2( const Angle : integer; out Msg : string ) : boolean;
    procedure ConvertToDB( RawData : PDWords; Calibration : CalibrationTable );
    procedure RemoveSpeckles;
    procedure RemoveSpecklesAz;
    procedure FormatData( MeanDB : PDWords; Cells, Length : integer );
    procedure Error( ErrorMessage : string );
    procedure WaitCondition( Condition : TConditionFunction;
                             Period    : cardinal;
                             Timeout   : cardinal;
                             ProgGoal  : integer;
                             M, S, E   : string );
    function  TREnabled( Wave : WaveLength ) : boolean;
    function  InSector( Value : integer; Range : TAIRange ) : boolean;
  private  // Obs file
    fFileName   : string;
    fTempName   : string;
    fFileHandle : integer;
    fFileHeader : TVestaFileHeader;
    fMoveDir    : PDWords;
    fVarPDir    : PDWords;
    fMoveHeader : TVestaMoveHeader;
    fVarPHeader : TVestaVarPHeader;
    fMoveIndex  : integer;
    fVarPIndex  : integer;
    procedure CreateFile;
    procedure CloseFile;
    procedure CopyObs;
    procedure DeleteFile;
    procedure WriteHeader;
    procedure WriteMoveDir;
    procedure WriteChannels;
    procedure WriteVarPDir;
    procedure WriteMove;
    procedure WriteVarP;
    procedure CodingData( MeanDB : PDWords );
  private  // Actions
    fTrabajo1 : boolean;
    fTrabajo2 : boolean;
    procedure TurnRadarOn;
    procedure TurnRadarOff;
    procedure TurnTxRxOn;
    procedure TurnTxRxOff;
    procedure SoundAlarm;
    procedure TxRxRestore;
    procedure WaitTime;
    procedure ProgTxRx;
    procedure StandbyTxRx;
    procedure TurnMotorOn;
    procedure TurnMotorOff;
    procedure CleanMotor;
    procedure ValidateData;
    procedure AcquirePPI;
    procedure AcquireRHI;
  private  // Conditions
    function RadarOn : boolean;
    function TxRxOn : boolean;
    function TxRxStandby : boolean;
    function IsTime : boolean;
    function TxRxOk : boolean;
    function MotorOk : boolean;
    function MotorOff : boolean;
    function SpeedAz : boolean;
    function PositionAz : boolean;
    function PositionEl : boolean;
    function SpeedElZero : boolean;
  private //SignalErros
    function CheckInputSignals( const Signals : array of cardinal; const State : boolean ) : string;
    function SignalsFailInTxRxOk : string;
  private
    fAcqCells   : integer;
    fAcqLength  : integer;
    fMemSize    : integer;
    fCh1Mean    : PDWords;
    fCh2Mean    : PDWords;
    fCh1SqrM    : PDWords;
    fCh2SqrM    : PDWords;
    fBuffer     : PBytes;
    fFilter3cm  : PDWords;
    fFilter10cm : PDWords;
    fBufSize    : cardinal;
    MaxCell : integer;
  end;

var
  theObservation : TObservation = nil;

implementation

uses
  Windows,
  Classes, Math,
  UtStr,
  VersionInfo,
  Plane, Description,
  Angle, 
  Config,
  Layout,
  Measure,
  EventLog, DataUtils, Users, IdFTP,
  Constants, LogTools, Dialogs;

const
  DirtyCellsPercent = 50;
  CheckPointDiference = 50;

// Private procedures & functions

procedure Small2Big( Src : PDWords; Dst : PBytes; SSize, DSize, Count : cardinal );
var
  V, M : integer;

  procedure AddCell( Cell, Size : integer );
  begin
    if Cell <> Sample_Excluded
      then
        begin
          inc(M, Size);
          inc(V, Cell * Size);
        end;
  end;

var
  I, J : cardinal;
  S, D : cardinal;
begin
  S := 0;
  D := 0;
  I := 0;
  J := 0;
  while J < Count do
    begin
      V := 0;
      M := 0;
      AddCell(Src[I], SSize - (D - S));
      inc(I);
      inc(S, SSize);
      inc(D, DSize);
      while D - S >= SSize do
        begin
          AddCell(Src[I], SSize);
          inc(I);
          inc(S, SSize);
        end;
      AddCell(Src[I], D - S);
      if M > 0
        then Dst[J] := V div M
        else Dst[J] := Data_Excluded;
      inc(J);
    end;
end;

procedure Big2Small( Src : PDWords; Dst : PBytes; SSize, DSize, Count : cardinal );
var
  I, J : cardinal;
  S, D : cardinal;
begin
  I := 0;
  J := 0;
  S := SSize;
  D := 0;
  while J < Count do
    begin
      if S < D
        then
          begin
            inc(I);
            inc(S, SSize);
          end;
      if (D - S) >= DSize
        then Dst[J] := Src[I]
        else
          if (Src[I] = Sample_Excluded) or (Src[I + 1] = Sample_Excluded)
            then Dst[J] := Src[I] + Src[I + 1] - Sample_Excluded
            else Dst[J] := (Src[I] * (D - S) + Src[I + 1] * (DSize - (D - S))) div DSize;
      inc(J);
      inc(D, DSize);
    end;
end;

procedure StretchCells( Src : PDwords; Dst : PBytes; SrcSize, DstSize, Count : cardinal );
begin
  if SrcSize <= DstSize
    then Small2Big(Src, Dst, SrcSize, DstSize, Count)
    else Big2Small(Src, Dst, SrcSize, DstSize, Count);
end;

{ TObservation }

constructor TObservation.Create(Template: ITemplate; Client : string; Time: TDateTime);
begin
  inherited Create;
  fTemplate := Template;
  fClient   := Client;
  fTime     := Time;
  theObservation := Self;
  fProgress := 0;
end;

destructor TObservation.Destroy;
begin
  theObservation := nil;
  ReleaseMemory;
  inherited;
end;

procedure TObservation.Error(ErrorMessage: string);
begin
  Report_Obs_Progress(fProgress, ts_Error, ErrorMessage);
end;

function TObservation.Execute : integer;
begin
  Result := obs_Failed;
  Report_Obs_Start(fTemplate.Nombre, fClient);
  try
    try
      try
        Initialize;
      except
        on E : Exception do
        begin
          E.Message := InitializationError + ';' + E.Message;
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
              LogMessages.AddLogMessage( Now, lcError, Snapshot.ObsClient, 'Secuencia de apagado', TurnOffError,
                                         'Hubo un error en la secuencia de encendido y se paso a la secuencia' +
                                         ' de apagado donde hubo el siguiente error;' +  E.Message );
          end;
          raise;
        end;
        try
          CheckPPIRHI;
          try
            CreateFile;
          except
            on E : Exception do
            begin
              E.Message := FileCreationError + ';' + E.Message;
              raise;
            end;
          end;
          try
            try
              AllocateMemory;
            except
              on E : Exception do
              begin
                ReleaseMemory;
                E.Message := AllocationMemoryError + ';' + E.Message;
                raise;
              end;
            end;
            try
              try
                AcquireData;
              except
                on E : Exception do
                begin
                  E.Message := AcquireError +  ';' + E.Message;
                  raise;
                end;
              end;
            finally
              ReleaseMemory;
            end;
            CloseFile;
          except
            DeleteFile;
            raise;
          end;
          UpdateTimes;
          try
            CopyObs;
          except
            on E : Exception do
            begin
              E.Message := CopiyingFileError + ';' + E.Message;
              raise;
            end;
          end;
          Result := obs_Ok;
        finally
          try
            TurnOffSequence;
          except
            on E : Exception do
            begin
              LogMessages.AddLogMessage( Now, lcError, Snapshot.ObsClient, 'Secuencia de apagado', TurnOffError, E.Message );
              Error( E.Message );
              Sleep( 5000 );
            end;
          end;
        end;
      finally
        Finalize;
      end;
    except
      on EObservationCanceled do
        begin
          Report_Obs_Progress(0, ts_Cancel, '');
          Result := obs_Canceled;
          if (not theConfiguration.AutoObs) and (theConfiguration.ContinuosRegime)
            then
              begin
                theConfiguration.ContinuosRegime := false;
                TurnOffSequence;
              end;
        end;
      on E : Exception do
        begin
          Error(E.Message);
        end;
    end;
  finally
    Report_Obs_Finish(Result);
  end;
end;

procedure TObservation.Cancel;
begin
  fObsCancel := true;
end;

function TObservation.TREnabled( Wave : WaveLength ) : boolean;
var
  I : integer;
  W, C, L : integer;
begin
  I := 0;
  Result := false;
  while I < fTemplate.Formatos do
    begin
      fTemplate.Formato(I, W, C, L);
      if cardinal(W) = Wave
        then
          begin
            Result := true;
            break;
          end;
      inc(I);
    end;
end;

function TObservation.InSector(Value: integer; Range: TAIRange): boolean;
begin
  Result := (Value >= Range.Min) and (Value <= Range.Max);
end;

procedure TObservation.CreateFile;
var
  Y, M, D  : word;
  TimeZone : TTimeZoneInformation;
const
  TIME_ZONE_ID_UNKNOWN  = 0;
  TIME_ZONE_ID_STANDARD = 1;
  TIME_ZONE_ID_DAYLIGHT = 2;
var
  TempPath : array[0..MAX_PATH] of char;
  TempFile : array[0..MAX_PATH] of char;
begin
  with fFileHeader do
    begin
      Variance := theConfiguration.SaveVariance;
      DayLight := GetTimeZoneInformation(TimeZone) = TIME_ZONE_ID_DAYLIGHT;
      DateTime := Now;
      DecodeDate(DateTime, Y, M, D);
      fFileName := theConfiguration.ObsDir;
      if not SetCurrentDir(fFileName)
        then CreateDir(fFileName);
      if fTemplate.Opciones and tf_Create_Dir <> 0
        then
          begin
            fFileName := fFileName + '\' + fTemplate.Nombre;
            if not SetCurrentDir(fFileName)
              then CreateDir(fFileName);
          end;
      if fTemplate.Opciones and tf_Include_Radar <> 0
        then
          begin
            fFileName := fFileName + '\' + RadarIDs[ord(Radar)];
            if not SetCurrentDir(fFileName)
              then CreateDir(fFileName);
          end;
      if fTemplate.Opciones and tf_Include_Year <> 0
        then
          begin
            fFileName := fFileName + '\' + Format('%.4d', [Y]);
            if not SetCurrentDir(fFileName)
              then CreateDir(fFileName);
          end;
      if fTemplate.Opciones and tf_Include_Month <> 0
        then
          begin
            fFileName := fFileName + '\' + Format('%.2d', [M]);
            if not SetCurrentDir(fFileName)
              then CreateDir(fFileName);
          end;
      if fTemplate.Opciones and tf_Include_Day <> 0
        then
          begin
            fFileName := fFileName + '\' + Format('%.2d', [D]);
            if not SetCurrentDir(fFileName)
              then CreateDir(fFileName);
          end;
      fFileName := fFileName + '\' +
                   RadarIDs[ord(Radar)] +
                   FormatDateTime( 'dd', DateTime ) + MonthIDs[M] +
                   FormatDateTime( 'hhnn', DateTime ) + VestaFileExt;
    end;
  GetTempPath(MAX_PATH, TempPath);
  GetTempFileName(TempPath, 'RDA', 0, TempFile );
  fTempName := StrPas(TempFile);
  fFileHandle := FileCreate(fTempName);
  assert(fFileHandle <> 0);
  WriteHeader;
  WriteMoveDir;
  WriteChannels;
  WriteVarPDir;
end;

procedure TObservation.CloseFile;
begin
  if fFileHandle <> 0
    then
      begin
        FileClose(fFileHandle);
        fFileHandle := 0;
      end;
end;

procedure TObservation.CopyObs;
var
  Year, Month, Day  : word;
  D, T, N : string;
  Dest    : TStringList;
  I       : integer;
  DecodedFTPSettings : TStrings;
  FTPPath : string;
begin
  N := ExtractFileName(fFileName);
  Report_Obs_Progress( 0, ts_Copying, N);
  MoveFileEx(pchar(fTempName), pchar(fFileName),
             MOVEFILE_COPY_ALLOWED or
             MOVEFILE_REPLACE_EXISTING or
             MOVEFILE_WRITE_THROUGH);
  Dest := TStringList.Create;
  SplitStr( ';', fTemplate.Direcciones, D, T );
  D := Trim( D );
  while D <> '' do
    begin
      if D[length(D)] <> '\'
        then D := D + '\';
      D := D + N;
      Dest.Add( D );
      SplitStr( ';', T, D, T );
      D := Trim( D );
    end;
  for I := 0 to Dest.Count - 1 do
    begin
      Report_Obs_Progress(10 + I * 90 div Dest.Count, ts_Copying, Dest[I]);
      CopyFile(pchar(fFileName), pchar(Dest[I]), false);
    end;
  Report_Obs_Progress( 100, ts_Copying, '' );
  if fTemplate.SentFTP
    then
      begin
        Report_Obs_Progress( 0, ts_CopyingFTP, '' );
        DecodedFTPSettings := TStringList.Create;
        try
          try
            DecodedFTPSettings.CommaText := Decode( fTemplate.FTPSettings );
            Utils.FTP.Host := DecodedFTPSettings[ FTPHostIndex ];
            Utils.FTP.Port := StrToInt( DecodedFTPSettings[ FTPPortIndex ] );
            if DecodedFTPSettings[ FTPUserIndex ] <> ''
              then
                begin
                  Utils.FTP.Username := DecodedFTPSettings[ FTPUserIndex ];
                  Utils.FTP.Password := DecodedFTPSettings[ FTPPasswordIndex ];
                end
              else
                begin
                  Utils.FTP.Username := 'anonymous';
                  Utils.FTP.Password := '';
                end;
            if boolean( StrToInt( DecodedFTPSettings[ UseProxyIndex ] ) )
              then
                begin
                  Utils.FTP.ProxySettings.ProxyType := fpcmUserSite;
                  Utils.FTP.ProxySettings.Host      := DecodedFTPSettings[ ProxyHostIndex ];
                  Utils.FTP.ProxySettings.Port      := StrToInt( DecodedFTPSettings[ ProxyPortIndex ] );
                  Utils.FTP.ProxySettings.UserName  := DecodedFTPSettings[ ProxyUserIndex ];
                  Utils.FTP.ProxySettings.Password  := DecodedFTPSettings[ ProxyPasswordIndex ];
                end
              else Utils.FTP.ProxySettings.ProxyType := fpcmNone;
            Utils.FTP.Connect( true, FTP_Timeout );
            try
              Utils.FTP.ChangeDir( DecodedFTPSettings[ FTPFolderIndex ] );
              if boolean( StrToInt( DecodedFTPSettings[ MakeDirsIndex ] ) )
                then
                  begin
                    DecodeDate( Now, Year, Month, Day );
                    FTPPath := fTemplate.Nombre;
                    if fTemplate.Opciones and tf_Include_Radar <> 0
                      then FTPPath := FTPPath + '/' + RadarIDs[ord(fFileHeader.Radar)];
                    if fTemplate.Opciones and tf_Include_Year <> 0
                      then FTPPath := FTPPath + '/' + Format('%.4d', [Year]);
                    if fTemplate.Opciones and tf_Include_Month <> 0
                      then FTPPath := FTPPath + '/' + Format('%.2d', [Month]);
                    if fTemplate.Opciones and tf_Include_Day <> 0
                      then FTPPath := FTPPath + '/' + Format('%.2d', [Day]);
                    try
                      Utils.FTP.ChangeDir( FTPPath );
                      Utils.FTP.Put( fFileName, ExtractFileName( fFileName ) );
                    except
                      try
                        Utils.FTP.MakeDir( fTemplate.Nombre );
                        Utils.FTP.ChangeDir( fTemplate.Nombre );
                      except
                        Utils.FTP.ChangeDir( fTemplate.Nombre );
                      end;
                      if fTemplate.Opciones and tf_Create_Dir <> 0
                        then
                          begin
                            //Creo el directorio
                            if fTemplate.Opciones and tf_Include_Radar <> 0
                              then
                                try
                                  Utils.FTP.MakeDir( RadarIDs[ord(fFileHeader.Radar)] );
                                  Utils.FTP.ChangeDir( RadarIDs[ord(fFileHeader.Radar)] );
                                except
                                  Utils.FTP.ChangeDir( RadarIDs[ord(fFileHeader.Radar)] );
                                end;
                            if fTemplate.Opciones and tf_Include_Year <> 0
                              then
                                try
                                  Utils.FTP.MakeDir( Format('%.4d', [Year] ) );
                                  Utils.FTP.ChangeDir( Format('%.4d', [Year] ) );
                                except
                                  Utils.FTP.ChangeDir( Format('%.4d', [Year] ) );
                                end;
                            if fTemplate.Opciones and tf_Include_Month <> 0
                              then
                                try
                                  Utils.FTP.MakeDir( Format('%.2d', [Month]) );
                                  Utils.FTP.ChangeDir( Format('%.2d', [Month]) );
                                except
                                  Utils.FTP.ChangeDir( Format('%.2d', [Month]) );
                                end;
                            if fTemplate.Opciones and tf_Include_Day <> 0
                              then
                                try
                                  Utils.FTP.MakeDir( Format('%.2d', [Day]) );
                                  Utils.FTP.ChangeDir( Format('%.2d', [Day]) );
                                except
                                  Utils.FTP.ChangeDir( Format('%.2d', [Day]) );
                                end;
                            Utils.FTP.Put( fFileName, ExtractFileName( fFileName ) );
                          end
                        else Utils.FTP.Put( fFileName, ExtractFileName( fFileName ) );
                    end;
                  end
                else Utils.FTP.Put( ExtractFileName( fFileName ), ExtractFileName( fFileName ) );
            finally
              Utils.FTP.Quit;
            end;
            Report_Obs_Progress( 100, ts_CopyingFTP, '' );
          except
            Report_Obs_Progress( 100, ts_CopyingFTP, 'Error en el envio' );
          end;
        finally
          DecodedFTPSettings.Free;
          Dest.Free;
        end;
  end;
end;

procedure TObservation.DeleteFile;
begin
  CloseFile;
  SysUtils.DeleteFile(fFileName);
  fFileName := '';
end;

procedure TObservation.WriteHeader;
begin
  FileSeek(fFileHandle, 0, 0);
  FileWrite(fFileHandle, fFileHeader, sizeof(fFileHeader));
end;

procedure TObservation.WriteMoveDir;
begin
  FileSeek(fFileHandle, sizeof(fFileHeader), 0);
  FileWrite(fFileHandle, fMoveDir^, fFileHeader.Movements * sizeof(longint));
end;

procedure TObservation.WriteChannels;
var
  I : integer;
  D : TChannelDesc;
  W : integer;
begin
  FileSeek(fFileHandle, sizeof(fFileHeader) +
                        fFileHeader.Movements * sizeof(longint), 0);
  for I := 0 to fFileHeader.Channels - 1 do
    begin
      fTemplate.Formato(I, W, D.Cells, D.Length);
      D.Wave := TWaveLength(W);
      D.Pulse := TPulseLength(fTemplate.Pulso);
      D.Reserved := 0;
      D.Sectors := fTemplate.Sectores;
      case D.Wave of
        wl3cm:  D.Beam := theConfiguration.Ch1Beam;
        wl10cm: D.Beam := theConfiguration.Ch2Beam;
        else    D.Beam := 0.0;
      end;
      case D.Wave of
        wl3cm:
          case D.Pulse of
            plLong  : D.PotMet := theCalibration.PotMetPL1;
            plShort : D.PotMet := theCalibration.PotMetPC1;
            else      D.PotMet := 0.0;
          end;
        wl10cm:
          case D.Pulse of
            plLong  : D.PotMet := theCalibration.PotMetPL2;
            plShort : D.PotMet := theCalibration.PotMetPC2;
            else      D.PotMet := 0.0;
          end;
      end;
      D.Delta := 0.0;
      D.Index := I;
      FileWrite(fFileHandle, D, sizeof(D));
    end;
end;

procedure TObservation.WriteVarPDir;
begin
  FileSeek(fFileHandle, sizeof(fFileHeader) +
                        fFileHeader.Movements * sizeof(longint) +
                        fFileHeader.Channels * sizeof(TChannelDesc), 0);
  FileWrite(fFileHandle, fVarPDir^, fFileHeader.Movements * sizeof(longint));
end;

procedure TObservation.WriteMove;
var
  Pack : pointer;
begin
  with fMoveHeader do
    begin
      PackMethod := TVestaPackMethod(theConfiguration.PackMethod);
      PackSize   := VestaFile.Pack(fBuffer, Pack, UnPackSize, PackMethod);
    end;
  fMoveDir[fMoveIndex] := FileSeek(fFileHandle, 0, 2);
  inc(fMoveIndex);
  FileWrite(fFileHandle, fMoveHeader, sizeof(fMoveHeader));
  FileWrite(fFileHandle, Pack^, fMoveHeader.PackSize);
  if Pack <> fBuffer
    then FreeMem(Pack);
  WriteMoveDir;
end;

procedure TObservation.WriteVarP;
var
  Pack : pointer;
begin
  with fVarPHeader do
    begin
      PackMethod := TVestaPackMethod(theConfiguration.PackMethod);
      PackSize   := VestaFile.Pack(fBuffer, Pack, UnPackSize, PackMethod);
    end;
  fVarPDir[fVarPIndex] := FileSeek(fFileHandle, 0, 2);
  inc(fVarPIndex);
  FileWrite(fFileHandle, fVarPHeader, sizeof(fVarPHeader));
  FileWrite(fFileHandle, Pack^, fVarPHeader.PackSize);
  if Pack <> fBuffer
    then FreeMem(Pack);
  WriteVarPDir;
end;

procedure TObservation.WaitCondition(Condition: TConditionFunction; Period,
  Timeout: cardinal; ProgGoal: integer; M, S, E: string);
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
    else raise EObservationTimeout.Create(E);
end;

procedure TObservation.Initialize;
var
  I : integer;
  W, C, L : integer;
  Count   : integer;
begin
  fTR1Enabled := TREnabled(wl_3cm);
  fTR2Enabled := TREnabled(wl_10cm);
  with fTemplate do
    begin
      Elbrus.Set_Frecuencia_AD( Frecuencia_Muestra );
      if Pulso = tx_Pulse_Long
        then
          begin
            if Snapshot^.Pulse <> tx_Pulse_Long
              then Elbrus.Pulso_Largo;
          end
        else if Snapshot^.Pulse <> tx_Pulse_Short
               then Elbrus.Pulso_Corto;
      with Snapshot^ do
        begin
          fAcqCells  := round(Counter_Times[N3_Counter] * (Sample_Rate/1000000));
          fAcqLength := Sample_Cell_Size;
        end;
      MaxCell := 0;
      for I := 0 to Formatos - 1 do
        begin
          Formato(I, W, C, L);
          if C > MaxCell
            then MaxCell := C;
        end;
      Count := succ(abs(Sector_Fin - Sector_Inicio));
      fMemSize := Count * fAcqCells * sizeof(integer);
      fBufSize := Count * MaxCell * sizeof(byte);
      with fFileHeader do
        begin
          Stamp.Signature := VestaSignature;
          Stamp.Version   := FileVersion;
          StrCopy(Stamp.Design, pchar(string(Nombre)));
          Radar := TRadar(theConfiguration.RadarID);
        //DayLight & DateTime filled in CreateFile
          Channels  := Formatos;
          Movements := Channels * Angulos;
        end;
      fVarPIndex := 0;
      with fVarPHeader do
        begin
          with Desc do
            begin
              Radar := fFileHeader.Radar;
              Reserved := 0;
              Kind := TPlaneKind(Tipo);
              Measure := unNone;
              if Fin > Inicio
                then I := Fin - Inicio
                else I := Inicio - Fin;
              Start := Inicio;
              Finish := Fin;
              SectorCount := I * Sectores div Codes;
              //Speed, Time, Channel and Angle are set at acquisition time
            end;
          FillChar(Reserved, sizeof(Reserved), 0);
        end;
      fMoveIndex := 0;
      with fMoveHeader do
        begin
          with Desc do
            begin
              Radar := fFileHeader.Radar;
              Reserved := 0;
              Kind := TPlaneKind(Tipo);
              Measure := unDB;
              if Fin > Inicio
                then I := Fin - Inicio
                else I := Inicio - Fin;
              Start := Inicio;
              Finish := Fin;
              SectorCount := I * Sectores div Codes;
              //Speed, Time, Channel and Angle are set at acquisition time
            end;
          FillChar(Reserved, sizeof(Reserved), 0);
        end;
    end;
end;

procedure TObservation.Finalize;
begin
  Elbrus.Set_Frecuencia_AD( theConfiguration.SampleRate );
end;
    
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

procedure TObservation.AllocateMemory;
begin
  fBuffer := nil;
  fMoveDir := AllocMem(fFileHeader.Movements * sizeof(longint));
  if fTemplate.Filter and fTemplate.SaveFilter //theConfiguration.SaveVariance
    then fVarPDir := AllocMem(fFileHeader.Movements * sizeof(longint))
    else fVarPDir := nil;
  if fTR1Enabled
    then
      begin
        fCh1Mean := AllocPtr(fMemSize);
        fCh1SqrM := AllocPtr(fMemSize);
      end
    else
      begin
        fCh1Mean := nil;
        fCh1SqrM := nil;
      end;
  if fTR2Enabled
    then
      begin
        fCh2Mean := AllocPtr(fMemSize);
        fCh2SqrM := AllocPtr(fMemSize);
      end
    else
      begin
        fCh2Mean := nil;
        fCh2SqrM := nil;
      end;
  if fTemplate.Filter and fTR1Enabled
    then fFilter3cm := AllocPtr( fMemSize )
    else fFilter3cm := nil;
  if fTemplate.Filter and fTR2Enabled
    then fFilter10cm := AllocPtr( fMemSize )
    else fFilter10cm := nil;
  fBuffer := AllocPtr(fBufSize);
end;

procedure TObservation.ReleaseMemory;
begin
  if fTR1Enabled
    then
      begin
        if Assigned( fCh1Mean )
          then ReleasePtr(pointer(fCh1Mean), fMemSize);
        if Assigned( fCh1SqrM )
          then ReleasePtr(pointer(fCh1SqrM), fMemSize);
      end;
  if fTR2Enabled
    then
      begin
        if Assigned( fCh2Mean )
          then ReleasePtr(pointer(fCh2Mean), fMemSize);
        if Assigned( fCh2SqrM )
          then ReleasePtr(pointer(fCh2SqrM), fMemSize);
      end;
  if Assigned( fFilter3cm )
    then ReleasePtr( pointer(fFilter3cm), fMemSize );
  if Assigned( fFilter10cm )
    then ReleasePtr( pointer(fFilter10cm), fMemSize );
  if Assigned( fBuffer )
    then ReleasePtr(pointer(fBuffer), fBufSize);
  ReallocMem(fMoveDir, 0);
  if fTemplate.Filter and fTemplate.SaveFilter  //theConfiguration.SaveVariance
    then ReallocMem(fVarPDir, 0);
end;

procedure TObservation.TurnOnSequence;
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
                  ts_Preparing, ms_TurnRadarOn, es_CheckRadarOn);
  except
    on E : EObservationTimeout do
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
                  ts_Preparing, ms_TurnTxRxOn, es_CheckTxRxOn);
  except
    on E : EObservationTimeout do
    begin
      TurnTxRxOff;
      E.Message := E.Message + ';Fallaron las siguietes señales:';
      if fTR1Enabled
        then E.Message := E.Message + ';' +
                          CheckInputSignals( [ di_Tx1_Listo, di_Rx1_Anodo ], false ) +
                          CheckInputSignals( [ di_Tx1_Averia ], true );
      if fTR2Enabled
        then E.Message := E.Message + ';' +
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
  WaitTime;
  WaitCondition(IsTime, 1000, round(1000*theConfiguration.RadarWarmTime/ASecond), 80,
                ts_Preparing, ms_WaitTime, es_CheckTime);
  if not MotorOk
    then SoundAlarm;
  {$ENDIF}
  ProgTxRx;
  {$IFNDEF RDA_Simulation}
  try
    WaitCondition(TxRxOk, 3000, 90000, 90,
                  ts_Preparing, ms_ProgTxRx, es_CheckTxRx);

  except
    on E : EObservationTimeout do
    begin
      try
        WaitForTxsStantby;
      except
      end;
      E.Message := E.Message  + ';Hubo los siguientes errores:;' + SignalsFailInTxRxOk;
      raise;
    end;
    else
      begin
        try
          WaitForTxsStantby;
        except
        end;
        raise;
      end;
  end;
  if MotorOff
    then TurnMotorOn;
  try
    WaitCondition(MotorOk, 1000, 5000, 100,
                  ts_Preparing, ms_MotorOn, es_CheckMotor);
  except
    on E : EObservationTimeout do
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
  {$ENDIF}
end;

procedure TObservation.TurnOffSequence;

begin
{$IFNDEF RDA_Simulation}
  if not theConfiguration.ContinuosRegime
    then
      begin
        StandbyTxRx;
        WaitCondition(TxRxStandby, 2000, 5000, 50,
                      ts_Done, ms_TxRxStandby, es_CheckStandby);
        TurnMotorOff;
        try
          WaitCondition(MotorOff, 1000, 5000, 100,
                        ts_Done, ms_MotorOff, es_CheckMotorOff);
        except
          on E : EObservationTimeout do
          begin
            E.Message := E.Message  + ';Fallaron las siguietes señales:;' +
                         CheckInputSignals( [di_Acc_Listo_Az, di_Acc_Listo_El], true );
            raise;
          end;
          else raise;
        end;
        CleanMotor;
      end
    else
      begin
        Elbrus.Set_SP_Posicion_El(0);
        Elbrus.Set_Lazo_Posicion_El(true);
        WaitCondition(PositionEl, 500, 15000, fProgress, ts_Executing, ms_MoveAntenna, es_ElPosAntenna);
        Elbrus.Set_Lazo_Posicion_El(false);
      end;
  TxRxRestore;
{$ELSE}
  Elbrus.Set_SP_Velocidad_Az(0);
  Elbrus.Set_SP_Velocidad_El(0);
{$ENDIF}
end;

procedure TObservation.CheckPPIRHI;
begin
  if fTemplate.Nombre = Plantilla_PPI
    then
      with fTemplate as ITemplateControl do
        begin
          Angulos := 1;
          SetAngulo(0, Snapshot.SP_Position_El);
        end;
  if fTemplate.Nombre = Plantilla_RHI
    then
      with fTemplate as ITemplateControl do
        begin
          Angulos := 1;
          SetAngulo(0, Snapshot.SP_Position_Az);
        end;
end;

procedure TObservation.CheckCancel;
begin
  if fObsCancel
    then
      begin
        fObsCancel := false;
        raise EObservationCanceled.Create(ts_Cancel);
      end;
end;

procedure TObservation.UpdateTimes;
begin
  with fTemplate as ITemplateControl do
    begin
      Anterior := fTime;
      if fTemplate.Automatica
        then
          while fTemplate.Proxima < Now do
            Proxima := fTemplate.Proxima + fTemplate.Periodo
        else Proxima := 0;
    end;
end;

procedure TObservation.AcquireData;
begin
  WaitCondition(nil, 0, 0, 0, ts_Executing, '', '');
  case fTemplate.Tipo of
    tk_PPI: AcquirePPI;
    tk_RHI: AcquireRHI;
    else raise EObservationFailure.Create('Tipo de plantilla desconocido');
  end;
end;

procedure TObservation.FindVariance;
var
  S, I, D : integer;
begin
  D := 0;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    for I := 0 to fAcqCells - 1 do
      begin
        if fTR1Enabled
          then
            begin
              fCh1SqrM[D] := Abs( fCh1SqrM[D] - Sqr(fCh1Mean[D]) );
              if fCh1SqrM[D] < fCh1Mean[D]
                then fCh1SqrM[D] := 0
                else fCh1SqrM[D] := fCh1SqrM[D] - fCh1Mean[D];
            end;                                                    
        if fTR2Enabled
          then
            begin
              fCh2SqrM[D] := Abs( fCh2SqrM[D] - Sqr(fCh2Mean[D]) );
              if fCh2SqrM[D] < fCh2Mean[D]
                then fCh2SqrM[D] := 0
                else fCh2SqrM[D] := fCh2SqrM[D] - fCh2Mean[D];
            end;
        inc(D);
      end;
end;

procedure TObservation.FilterVariance;
var
  S, I, D : integer;
begin
  D := 0;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    for I := 0 to fAcqCells - 1 do
      begin
        if fTR1Enabled and (fCh1Mean[D] = 0)
          then fCh1SqrM[D] := 0;
        if fTR2Enabled and (fCh2Mean[D] = 0)
          then fCh2SqrM[D] := 0;
        inc(D);
      end;
end;

procedure TObservation.ClutterSuppresion;
var
  S, I, J, D, Index, DirtyCells1, DirtyCells2 : integer;
begin
  D := 0;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
  begin
    //initialization
    Index := 0;
    DirtyCells1 := 0;
    DirtyCells2 := 0;
    for I := 1 to fAcqCells do
      begin
        Inc( Index );
        if fTR1Enabled and ((fCh1SqrM[D] <= theConfiguration.Threshold1) or (fCh1SqrM[D] >= theConfiguration.Threshold2))
          then Inc( DirtyCells1 );
        if fTR2Enabled and ((fCh2SqrM[D] <= theConfiguration.Threshold1) or (fCh2SqrM[D] >= theConfiguration.Threshold2))
          then Inc( DirtyCells2 );
        if Index = theConfiguration.ClutterCells
          then
            begin
              if DirtyCells1 * 100 / theConfiguration.ClutterCells >= DirtyCellsPercent
                then for J := D downto D-Index+1 do
                       fCh1Mean[ J ] := 0;
              if DirtyCells2 * 100 / theConfiguration.ClutterCells >= DirtyCellsPercent
                then for J := D downto D-Index+1 do
                       fCh2Mean[ J ] := 0;
              //initialization
              Index := 0;
              DirtyCells1 := 0;
              DirtyCells2 := 0;
            end;
        inc(D);
      end;
      if DirtyCells1 * 100 / theConfiguration.ClutterCells >= DirtyCellsPercent
        then for J := D downto D-Index+1 do
               fCh1Mean[ J ] := 0;
      if DirtyCells2 * 100 / theConfiguration.ClutterCells >= DirtyCellsPercent
        then for J := D downto D-Index+1 do
               fCh2Mean[ J ] := 0;
  end;
end;

procedure TObservation.ConvertToDB( RawData : PDWords; Calibration : CalibrationTable );
var
  S, I, J, D : integer;
begin
  D := 0;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    for I := 0 to fAcqCells - 1 do
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

procedure TObservation.RemoveSpeckles;
var
  S, I, D : integer;
  Umbral : word; //Cells to remove
  Start, Index : integer;
begin
  Umbral := theConfiguration.SpeckleUmbral div fAcqLength;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    begin
      D := (S - fTemplate.Sector_Inicio) * fAcqCells;
      //Canal 1
      if fTR1Enabled
        then
          begin
            Index := 0;
            repeat
              //me posiciono en el primer valor distinto de cero
              while (fCh1Mean[D+Index] = 0) and (Index < fAcqCells) do Inc(Index);
              if Index < fAcqCells
                then Start := Index
                else Break;
              Inc( Index );
              //me posiciono en el siguiente cero
              while (fCh1Mean[D+Index] <> 0) and (Index < fAcqCells) do Inc(Index);
              //Comparo con el umbral
              if Index-Start <= Umbral
                then
                  for i := Start to Index-1 do
                    fCh1Mean[D+i] := 0;
              Inc( Index );
            until Index >= fAcqCells;
          end;
      //Canal 2
      if fTR2Enabled
        then
          begin
            Index := 0;
            repeat
              //me posiciono en el primer valor disto de cero
              while (Index < fAcqCells) and (fCh2Mean[D+Index] = 0) do Inc(Index);
              if Index < fAcqCells
                then Start := Index
                else Break;
              Inc( Index );
              //me posiciono en el siguiente cero
              while (Index<fAcqCells) and (fCh2Mean[D+Index] <> 0) do Inc(Index);
              //Comparo con el umbral
              if Index-Start <= Umbral
                then
                  for i := Start to Index-1 do
                    fCh2Mean[D+i] := 0;
            Inc( Index );
            until Index >= fAcqCells;
          end;
    end;
end;

procedure TObservation.FormatData( MeanDB : PDWords; Cells, Length : integer );
var
  I : integer;
  Buffer : PBytes;
begin
  Buffer := fBuffer;
  for I := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    begin
      StretchCells(MeanDB, Buffer, fAcqLength, Length, Cells);
      inc(MeanDB, fAcqCells);
      inc(Buffer, Cells);
    end;
end;

procedure TObservation.TurnRadarOn;
begin
  Elbrus.Encender_Radar;
end;

procedure TObservation.TurnRadarOff;
begin
  Elbrus.Apagar_Radar;
end;

function TObservation.RadarOn: boolean;
const
  Mask = di_Red_Listo or
         di_Radar_On_P or
         di_Radar_On_N;
begin
  Result := Snapshot.Digital_Input and Mask = Mask;
end;

procedure TObservation.TurnTxRxOn;
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

function TObservation.TxRxOn: boolean;
const
  Mask1 = di_Tx1_Listo or di_Rx1_Anodo;
  Mask2 = di_Tx2_Listo or di_Rx2_Anodo;
begin
  with Snapshot^ do
    Result := (not fTR1Enabled or (((Digital_Input and Mask1) = Mask1)   and
                                   (Digital_Input and di_Tx1_Averia = 0) and
                                   (Digital_Input and di_Rx1_Averia = 0)))
              and
              (not fTR2Enabled or (((Digital_Input and Mask2) = Mask2)   and
                                   (Digital_Input and di_Tx2_Averia = 0) and
                                   (Digital_Input and di_Rx2_Averia = 0)));
end;

procedure TObservation.TxRxRestore;
begin
  if fTR1Enabled
    then Elbrus.TxRx1_Trabajo(fTrabajo1);
  if fTR2Enabled
    then Elbrus.TxRx2_Trabajo(fTrabajo2);
end;

procedure TObservation.SoundAlarm;
begin
  Elbrus.Alarma_Sonora(5000);
end;

procedure TObservation.WaitTime;
begin
end;

function TObservation.IsTime: boolean;
begin
  Result := Now >= fTime;
end;

procedure TObservation.TurnMotorOn;
begin
  Elbrus.Encender_Accionamiento;
end;

function TObservation.MotorOk : boolean;
const
  AccMask = di_Antena_Listo or di_Acc_Listo_Az or di_Acc_Listo_El;
begin
  Result := (Snapshot.Digital_Input and AccMask) = AccMask;
end;

procedure TObservation.TurnMotorOff;
begin
  Elbrus.Apagar_Accionamiento;
end;

procedure TObservation.CleanMotor;
begin
  Elbrus.Set_Lazo_Posicion_Az(false);
  Elbrus.Set_Lazo_Posicion_El(false);
  Elbrus.Set_SP_Velocidad_Az(0);
  Elbrus.Set_SP_Velocidad_El(0);
end;

function TObservation.MotorOff : boolean;
const
  AccMask = di_Acc_Listo_Az or di_Acc_Listo_El;
begin
  Result := (Snapshot.Digital_Input and AccMask) = 0;
end;

function TObservation.PositionAz: boolean;
begin
  Result := abs(Distance(Snapshot.SP_Position_Az, Snapshot.Position_Az)) <= theConfiguration.AngleAcc;
end;

function TObservation.PositionEl: boolean;
begin
  Result := abs(Distance(Snapshot.SP_Position_El, Snapshot.Position_El)) <= theConfiguration.AngleAcc;
end;

function TObservation.SpeedAz: boolean;
begin
  Result := abs(Snapshot.SP_Velocity_Az - Snapshot.Velocity_Az) <= theConfiguration.SpeedAcc;
end;

procedure TObservation.ProgTxRx;
begin
  with fTemplate do
    begin
      case Pulso of
        tx_Pulse_Long  : if Snapshot^.Pulse <> tx_Pulse_Long
                           then Elbrus.Pulso_Largo;
        tx_Pulse_Short : if Snapshot^.Pulse <> tx_Pulse_Short
                           then Elbrus.Pulso_Corto;
      end;
  {$IFNDEF RDA_Simulation}
      if fTR1Enabled
        then
          begin
            if CRT1 <> xo_Nevermind then Elbrus.Rx1_Correccion(CRT1 = xo_Yes);
            if CMG1 <> xo_Nevermind then Elbrus.Rx1_CMG       (CMG1 = xo_Yes);
            if CMS1 <> xo_Nevermind then Elbrus.Rx1_CMS       (CMS1 = xo_Yes);
            Elbrus.Tx1_Standby(false);
          end;
      if fTR2Enabled
        then
          begin
            if CRT2 <> xo_Nevermind then Elbrus.Rx2_Correccion(CRT2 = xo_Yes);
            if CMG2 <> xo_Nevermind then Elbrus.Rx2_CMG       (CMG2 = xo_Yes);
            if CMS2 <> xo_Nevermind then Elbrus.Rx2_CMS       (CMS2 = xo_Yes);
            Elbrus.Tx2_Standby(false);
          end;
{$ENDIF}
    end;
end;

function TObservation.TxRxOk: boolean;
begin
  with Snapshot^ do
    begin
      Result := (fTemplate.Pulso = tx_Pulse_None) or
                (not fTR1Enabled or ((fTemplate.Pulso = tx_Pulse_Long) xor (Digital_Input and di_TxRx1_Pulso_Largo = 0))) and
                (not fTR2Enabled or ((fTemplate.Pulso = tx_Pulse_Long) xor (Digital_Input and di_TxRx2_Pulso_Largo = 0)));
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

procedure TObservation.StandbyTxRx;
begin
  if fTR1Enabled
    then Elbrus.Tx1_Standby(true);
  if fTR2Enabled
    then Elbrus.Tx2_Standby(true);
end;

function TObservation.TxRxStandby;
begin
  Result := true;
  if fTR1Enabled
    then Result := Result and (Snapshot.Digital_Input and di_Tx1_Anodo = 0);
  if fTR2Enabled
    then Result := Result and (Snapshot.Digital_Input and di_Tx2_Anodo = 0);
end;

procedure TObservation.AcquirePPI;
var
  Missed   : integer;
  I, J     : integer;
  A, F     : integer;
  W, C, L  : integer;
  Ang, Spd : integer;
  Msg      : string;
begin
  with fTemplate do
    begin
      Spd := Velocidad;
      //{$IFNDEF RDA_Simulation}
      Elbrus.Set_Lazo_Posicion_Az(false);
      Elbrus.Set_SP_Velocidad_Az(Spd);
      WaitCondition(SpeedAz, 1000, 10000, 10,
                    ts_Executing, ms_MoveAntenna, es_AzSpeedAntenna);
      Spd := Snapshot.Velocity_Az;
      //{$ENDIF}
      A := Angulos;
      F := Formatos;
      for I := 0 to A - 1 do
        if Angulo(I, Ang) = S_OK
          then
            begin
              {$IFNDEF RDA_Simulation}
              if (theConfiguration.CheckPPIParam) and (not TxRxOk)
                then raise ETxRxOutOfParameters.Create( 'Hubo los siguientes errores en TxRx en el Angulo #' +
                                                        IntToStr( I ) + ' ' + #13 + SignalsFailInTxRxOk );
              Elbrus.Set_SP_Posicion_El(Ang);
              Elbrus.Set_Lazo_Posicion_El(true);
              WaitCondition(PositionEl, 500, 15000, fProgress,
                          ts_Executing, ms_MoveAntenna, es_ElPosAntenna);
              {$ENDIF}
              WaitCondition(nil, 0, 0, 10 + (I*90) div A,
                           ts_Executing, ms_Transfer + IntToStr(succ(I)), '');
              Sleep(1000);
              EnableMotorEl( false );
              try
                Elbrus.Acquire_PPI(fTemplate, fAcqCells,
                                   fCh1Mean, fCh2Mean,
                                   fCh1SqrM, fCh2SqrM,
                                   fFilter3cm, fFilter10cm );

                Elbrus.Set_Lazo_Posicion_El(false);
              finally
                EnableMotorEl( true );
              end;
              with theCalibration do
                begin
                  if fTR1Enabled
                    then ConvertToDB(fCh1Mean, Calibration1);
                  if fTR2Enabled
                    then ConvertToDB(fCh2Mean, Calibration2);
                end;
              if theConfiguration.SpeckleRemoveAz
                then ValidateData;
              if fTemplate.Filter and fTemplate.ApplyFilter
                then if (Ang <= AngleCode(fTemplate.MaxAngleEchoFilter))
                       then PPIFilterPermanentEchoByDistance( fTemplate.MaxDistanceEchoFilter )
                       else PPIFilterPermanentEchoByHeight( CodeAngle( Ang ) );
              if theConfiguration.SpeckleRemove
                then RemoveSpeckles;
              if fTemplate.Filter and fTemplate.SaveFilter
                then
                  begin
                    if fTR1Enabled then CodingData(fFilter3cm);
                    if fTR2Enabled then CodingData(fFilter10cm);
                  end;

              for J := 0 to F - 1 do  // For each format
                begin
                  Formato(J, W, C, L);

                  // VarP
                  if fTemplate.Filter and fTemplate.SaveFilter
                    then
                      begin
                        with fVarPHeader.Desc do
                          begin
                            Time := Now;
                            Channel := J;
                            Speed := Spd;
                            Angle := Ang;
                          end;
                        fVarPHeader.UnpackSize := fBufSize;
                        if W = wl_3cm
                          then FormatData(fFilter3cm, C, L)
                          else FormatData(fFilter10cm, C, L);
                        WriteVarP;
                      end;

                  // Move
                  with fMoveHeader.Desc do
                    begin
                      Time    := Now;
                      Channel := J;
                      Speed   := Spd;
                      Angle   := Ang;
                    end;
                  fMoveHeader.UnpackSize := fBufSize;
                  if W = wl_3cm
                    then FormatData(fCh1Mean, C, L)
                    else FormatData(fCh2Mean, C, L);
                  WriteMove;
                end;
            end;
    end;
end;

procedure TObservation.AcquireRHI;
var
  Missed   : integer;
  I, J     : integer;
  A, F     : integer;
  W, C, L  : integer;
  Ang, Spd : integer;
  Msg      : string;
begin
  with fTemplate do
    begin
      Spd := Velocidad;
      Elbrus.Set_Lazo_Posicion_Az(true);
      A := Angulos;
      F := Formatos;
      try
        for I := 0 to A - 1 do
          if Angulo(I, Ang) = S_OK
            then
              begin
                {$IFNDEF RDA_Simulation}
                if theConfiguration.CheckPPIParam and (not TxRxOk)
                  then raise ETxRxOutOfParameters.Create( 'Hubo los siguientes errores en TxRx en el Angulo #' +
                                                          IntToStr( I ) + ' ' + #13 + SignalsFailInTxRxOk );
                {$ENDIF}
                Elbrus.Set_SP_Posicion_Az(Ang);
                Elbrus.Set_SP_Posicion_El(Inicio);
                Elbrus.Set_Lazo_Posicion_El(true);
                WaitCondition(PositionAz, 500, 15000, fProgress,
                              ts_Executing, ms_MoveAntenna, es_AzPosAntenna);
                WaitCondition(PositionEl, 500, 15000, fProgress,
                              ts_Executing, ms_MoveAntenna, es_ElPosAntenna);
                Elbrus.Set_Lazo_Posicion_El(false);

                WaitCondition(nil, 0, 0, 10 + (I*90) div A,
                              ts_Executing, ms_Transfer + IntToStr(succ(I)), '');
                Sleep(1000);
                Elbrus.Set_SP_Velocidad_El(Spd);
                try
                  Elbrus.Acquire_RHI(fTemplate,
                                     Inicio, Fin,
                                     fAcqCells,
                                     fCh1Mean, fCh2Mean,
                                     fCh1SqrM, fCh2SqrM,
                                     fFilter3cm, fFilter10cm );
                finally
                    Elbrus.Set_SP_Velocidad_El(0);
                end;
                with theCalibration do
                  begin
                    if fTR1Enabled
                      then ConvertToDB(fCh1Mean, Calibration1);
                    if fTR2Enabled
                      then ConvertToDB(fCh2Mean, Calibration2);
                  end;
                if fTemplate.Filter and fTemplate.ApplyFilter
                  then RHIFilterPermanentEcho;
                if theConfiguration.SpeckleRemove
                  then RemoveSpeckles;
              if fTemplate.Filter and fTemplate.SaveFilter
                then
                  begin
                    if fTR1Enabled then CodingData(fFilter3cm);
                    if fTR2Enabled then CodingData(fFilter10cm);
                  end;

                for J := 0 to F - 1 do  // For each format
                  begin
                    Formato(J, W, C, L);

                    // VarP
                    if fTemplate.Filter and fTemplate.SaveFilter
                      then
                        begin
                          with fVarPHeader.Desc do
                            begin
                              Time := Now;
                              Channel := J;
                              Speed := Spd;
                              Angle := Ang;
                            end;
                          fVarPHeader.UnpackSize := fBufSize;
                          if W = wl_3cm
                            then FormatData(fFilter3cm, C, L)
                            else FormatData(fFilter10cm, C, L);
                          WriteVarP;
                        end;

                    // Move
                    with fMoveHeader.Desc do
                      begin
                        Time := Now;
                        Channel := J;
                        Speed := Spd;
                        Angle := Ang;
                      end;
                    fMoveHeader.UnpackSize := fBufSize;
                    if W = wl_3cm
                      then FormatData(fCh1Mean, C, L)
                      else FormatData(fCh2Mean, C, L);
                    WriteMove;
                  end;
              end;
      finally
        Elbrus.Set_Lazo_Posicion_Az(false);
      end;
    end;
end;

function TObservation.CheckInputSignals(const Signals: array of cardinal; const State : boolean): string;
var
  i : byte;
begin
  for i := Low( Signals ) to High( Signals ) do
    if (Snapshot.Digital_Input and Signals[i] <> 0) = State
      then result := result + DI_Names[ Trunc(Log2(Signals[i])) ] + ',';
  Delete( result, Length(result), 1 );
end;

function TObservation.SignalsFailInTxRxOk: string;
begin
  result := '';
  with Snapshot^ do
    begin
      if fTemplate.Pulso <> tx_Pulse_None
        then
          begin
            if fTR1Enabled and ((fTemplate.Pulso = tx_Pulse_Long) xor (Digital_Input and di_TxRx1_Pulso_Largo <> 0))
              then result := TxRx1PulseEqualObsPulse;
            if fTR2Enabled and ((fTemplate.Pulso = tx_Pulse_Long) xor (Digital_Input and di_TxRx2_Pulso_Largo <> 0))
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

procedure TObservation.TurnTxRxOff;
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

function TObservation.CheckPPIReferencePointsCh1( const Angle : integer; out Msg : string ): boolean;
begin
  result := true;
end;

function TObservation.CheckRHIReferencePointsCh1( const Angle : integer; out Msg : string ): boolean;
begin
  result := true;
end;

function TObservation.FindPowerCh1(Antenna, Dist: double): Double;
var
  Sector, Cell : integer;
  CodAntenna : cardinal;
begin
  Cell := Trunc( Dist / fAcqLength ) - 1;
  CodAntenna := AngleCode( Antenna );
  Sector := Trunc( fTemplate.Sectores * CodAntenna / 4096 ) - fTemplate.Sector_Inicio;
  if (Sector >= 0) and (Sector <= fTemplate.Sector_Fin-fTemplate.Sector_Inicio)
    then if fTR1Enabled
           then result := fCh1Mean[ Sector * fAcqCells + Cell ]
           else result := High(  byte )
    else result := High( byte );
end;

procedure TObservation.RemoveSpecklesAz;
var
  Start, i, j, Index : integer;
begin
  if fTR1Enabled
    then
      for i := 1 to fAcqCells do
      begin
        Index := 0;
        repeat
          while (Index <= succ(abs(fTemplate.Sector_Fin - fTemplate.Sector_Inicio))) and (fCh1Mean[(Index*fAcqCells)+i] = 0) do Inc( Index );
          Start := Index;
          Inc( Index );
          while (Index <= succ(abs(fTemplate.Sector_Fin - fTemplate.Sector_Inicio))) and (fCh1Mean[(Index*fAcqCells)+i] <> 0) do Inc( Index );
          if Index-Start <= theConfiguration.SpeckleUmbralAz
            then
              for j := Start to Index-1 do
                fCh1Mean[(j*fAcqCells)+i] := 0;
        until Index >= succ(abs(fTemplate.Sector_Fin - fTemplate.Sector_Inicio));
      end;
  if fTR2Enabled
    then
      for i := 1 to fAcqCells do
      begin
        Index := 0;
        repeat
          while (Index <= succ(abs(fTemplate.Sector_Fin - fTemplate.Sector_Inicio))) and (fCh2Mean[(Index*fAcqCells)+i] = 0) do Inc( Index );
          Start := Index;
          Inc( Index );
          while (Index <= succ(abs(fTemplate.Sector_Fin - fTemplate.Sector_Inicio))) and (fCh2Mean[(Index*fAcqCells)+i] <> 0) do Inc( Index );
          if Index-Start <= theConfiguration.SpeckleUmbralAz
            then
              for j := Start to Index-1 do
                fCh2Mean[(j*fAcqCells)+i] := 0;
        until Index >= succ(abs(fTemplate.Sector_Fin - fTemplate.Sector_Inicio));
      end;
end;

procedure TObservation.PPIFilterPermanentEchoWhole;
var
  S, I, Index : integer;
begin
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    for I := 0 to fAcqCells - 1 do
      begin
        Index := S * fAcqCells + I;
        if fTR1Enabled and (fFilter3cm[Index] <= fTemplate.CH3cm_Threshold)
          then fCh1Mean[Index] := 0;
        if fTR2Enabled and (fFilter10cm[Index] <= fTemplate.CH10cm_Threshold)
          then fCh2Mean[Index] := 0;
      end;
end;

function TObservation.CheckPPIReferencePointsCh2(const Angle: integer; out Msg: string): boolean;
begin
  result := true;
end;

function TObservation.CheckRHIReferencePointsCh2(const Angle: integer; out Msg: string): boolean;
begin
  result := true;
end;

function TObservation.FindPowerCh2(Antenna, Dist: double): Double;
var
  Sector, Cell : integer;
  CodAntenna : cardinal;
begin
  Cell := Trunc( Dist / fAcqLength ) - 1;
  CodAntenna := AngleCode( Antenna );
  Sector := Trunc( fTemplate.Sectores * CodAntenna / 4096 ) - fTemplate.Sector_Inicio;
  if (Sector >= 0) and (Sector <= fTemplate.Sector_Fin-fTemplate.Sector_Inicio)
    then if fTR1Enabled
           then result := fCh2Mean[ Sector * fAcqCells + Cell ]
           else result := High(  byte )
    else result := High( byte );
end;

procedure TObservation.RHIFilterPermanentEcho;
var
  S, I, D, Index : integer;
  Sector  : integer;
  Angle   : double;
begin
  Sector  := AngleCode(fTemplate.MaxAngleEchoFilter) * fTemplate.Sectores div 4096;
  D := 0;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    if S <= Sector
      then
        for I := 0 to fAcqCells - 1 do
          begin
            Index := S * fAcqCells + I;
            if fTR1Enabled and (fFilter3cm[Index] <= fTemplate.CH3cm_Threshold)
              then fCh1Mean[Index] := 0;
            if fTR2Enabled and (fFilter10cm[Index] <= fTemplate.CH10cm_Threshold)
              then fCh2Mean[Index] := 0;
          end
        else
          begin
            for I := 0 to fAcqCells - 1 do
              begin
                Index := S * fAcqCells + I;
                Angle := 360 * S div fTemplate.Sectores;
                if (fAcqLength * (I+1) * sin(DegToRad(Angle))) <= fTemplate.MaxHeightEchoFilter
                  then
                    begin
                      if fTR1Enabled and (fFilter3cm[D] <= fTemplate.CH3cm_Threshold)
                        then fCh1Mean[D] := 0;
                      if fTR2Enabled and (fFilter10cm[D] <= fTemplate.CH10cm_Threshold)
                        then fCh2Mean[D] := 0;
                    end;
              end;
          end;
end;

procedure TObservation.PPIFilterPermanentEchoByHeight(Angle: single);
var
  S, I, Index : integer;
begin
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    for I := 0 to fAcqCells - 1 do
      begin
        if (fAcqLength * (I+1) * sin(DegToRad(Angle))) <= fTemplate.MaxHeightEchoFilter
          then
            begin
              Index := S * fAcqCells + I;
              if fTR1Enabled and (fFilter3cm[Index] <= fTemplate.CH3cm_Threshold)
                then fCh1Mean[Index] := 0;
              if fTR2Enabled and (fFilter10cm[Index] <= fTemplate.CH10cm_Threshold)
                then fCh2Mean[Index] := 0;
            end;
      end;
end;

procedure TObservation.PPIFilterPermanentEchoByDistance( Distance: cardinal);
var
  S, I, Index : integer;
begin
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    for I := 0 to fAcqCells-1 do
      if I * fAcqLength <= Distance
        then
          begin
            Index := S * fAcqCells + I;
            if fTR1Enabled and (fFilter3cm[Index] <= fTemplate.CH3cm_Threshold)
              then fCh1Mean[Index] := 0;
            if fTR2Enabled and (fFilter10cm[Index] <= fTemplate.CH10cm_Threshold)
              then fCh2Mean[Index] := 0;
          end;
end;

function TObservation.SpeedElZero: boolean;
begin
  result := Snapshot.Velocity_Az = 0;
end;

procedure TObservation.ValidateData;
var
  Valid : boolean;
  s, i, Count : integer;
  Average : double;
const
  StartSample = 0;
  FinalSample = 2;
  Sample = 20;
begin
  Valid := false;
  if fTR1Enabled
    then
      begin
        for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
          if not Valid
            then
              begin
                Count := 0;
                for I := StartSample to FinalSample do
                  Inc( Count, fCh1Mean[((S-fTemplate.Sector_Inicio)*fAcqCells)+I] );
                Average := Count div (FinalSample-StartSample+1);
                if Average >= Sample
                  then
                    begin
                      Valid := true;
                      break;
                    end;
              end;
        if not Valid
          then raise EObservationFailure.Create('PPI no valido');
      end;
  Valid := false;
  if fTR2Enabled
    then
      begin
        for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
          if not Valid
            then
              begin
                Count := 0;
                for I := StartSample to FinalSample do
                  Inc( Count, fCh2Mean[((S-fTemplate.Sector_Inicio)*fAcqCells)+I] );
                Average := Count div (FinalSample-StartSample+1);
                if Average > Sample
                  then
                    begin
                      Valid := true;
                      break;
                    end;
              end;
        if not Valid
          then raise EObservationFailure.Create('PPI no valido');
      end;
end;

procedure TObservation.CodingData(MeanDB: PDWords );
const
  Resolution = 4095; //bits
var
  S, I, J, D : integer;
begin
  D := 0;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    for I := 0 to fAcqCells - 1 do
      begin
        if MeanDB[D] >= Resolution
          then MeanDB[D] := 255
          else MeanDB[D] := MeanDB[D] * 255 div Resolution;
        inc(D);
      end;
end;

end.

