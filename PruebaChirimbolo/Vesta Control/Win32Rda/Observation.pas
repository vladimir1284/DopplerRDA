unit Observation;

{$DEFINE RDA_Simulation}
//{$UNDEF RDA_Simulation}

interface

uses
  SysUtils,
  ElbrusTypes, Elbrus,
  Calib,
  Rda_TLB,
  VestaFile,
  Constants,
  Measure,
  SyncObjs;

type
  EObservationCanceled = class(Exception);
  EObservationFailure  = class(Exception);
  EObservationTimeout  = class(EObservationFailure);
  ETxRxOutOfParameters = class(EObservationFailure);
  ETxRxAveria          = class(Exception);

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
    fCh0DataComplete : boolean;
    fCh1DataComplete : boolean;
    fObsError   : string;
    fLock       : TCriticalSection;
    fCH3cmManualAFC,
    fCH10cmManualAFC  : boolean;
    fAdquiring  : boolean;
  public
    function  Execute : integer;
    procedure ReceiveData(Channel : integer; PPI_Date : double; PPI_Speed, PPI_Angle, Sectors, CellCount, CellSize : integer; dBZ, dBT, Speed, Width : PSingles);
    procedure DataComplete(Channel : integer);
    procedure SetError(error : string);
  protected
    procedure Initialize;
    procedure Finalize;
    procedure AllocateMemory;
    procedure ReleaseMemory;
    procedure TurnOnSequence;
    procedure TurnOffSequence;
    procedure CheckPPIRHI;
    procedure CheckCancel;
    procedure CheckError;
    procedure AcquireData;
    procedure UpdateTimes;
    procedure RemoveSpeckles(AcqLength, AcqCells : integer; Data : PSingles);
    procedure ConvertdBZ(Channel, AcqLength, AcqCells : integer; Data : PSingles);
    procedure FormatData(AcqSectors, AcqLength, AcqCells : integer; Data : PSingles; Cells, Length : integer; Measure : TMeasure);
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
    procedure TxRxRestore;
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
  private  // Actions
    fLocal1 : boolean;
    fLocal2 : boolean;
    procedure TurnRadarOn;
    procedure TurnRadarOff;
    procedure TurnTxRxOn;
    procedure TurnTxRxOff;
    procedure SoundAlarm;
    procedure WaitTime;
    procedure ProgTxRx;
    procedure SetPulse(Pulse : TxPulse; Rate : TxDualPulse; Progress : integer);
    procedure StandbyTxRx;
    procedure TurnMotorOn;
    procedure TurnMotorOff;
    procedure CleanMotor;
    procedure AcquirePPI;
    procedure AcquireRHI;
    procedure RestoreDefaultFilter;
    procedure SetFilters;
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
    function SyncChanged : boolean;
    function Tx1_SyncChanged : boolean;
    function Tx2_SyncChanged : boolean;
    function SyncChanging : boolean;
    function Tx1_SyncChanging : boolean;
    function Tx2_SyncChanging : boolean;
    function TxsOn : boolean;
    function AntennaTurningOn : boolean;
    function MPSOn : boolean;
    function DRX_StopAcquiring : boolean;
    function DRX_Acquiring : boolean;
    function DataIsComplete : boolean;

  private //SignalErros
    function CheckInputSignals( const Signals : array of cardinal; const State : boolean ) : string;
    function SignalsFailInTxRxOk : string;
  private
    fBuffer     : PBytes;
    fBufSize    : cardinal;
    MaxCell     : integer;
  end;

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
  EventLog, Users, IdFTP,
  LogTools, Dialogs, ActiveX, ManagerDRX,
  Communication_Module, DRX_WS, ObservationReceiver;

const
  DirtyCellsPercent = 50;
  CheckPointDiference = 50;

// Private procedures & functions

procedure Small2Big(Src : PSingles; Dst : PBytes; SSize, DSize, Count : cardinal; Measure : TMeasure);
var
  V : single;
  M : integer;

  procedure AddCell( Cell : single; Size : integer );
  begin
    if Cell <> Sample_Excluded
      then
        begin
          inc(M, Size);
          V := V + (Cell * Size);
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
        then Dst[J] := MeasureCode(V/M, Measure)
        else Dst[J] := Data_Excluded;
      inc(J);
    end;
end;

procedure Big2Small(Src : PSingles; Dst : PBytes; SSize, DSize, Count : cardinal; Measure : TMeasure);
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
        then Dst[J] := MeasureCode(Src[I], Measure)
        else
          if (Src[I] = Sample_Excluded) or (Src[I + 1] = Sample_Excluded)
            then Dst[J] := MeasureCode(Src[I] + Src[I + 1] - Sample_Excluded, Measure)
            else Dst[J] := MeasureCode((Src[I] * (D - S) + Src[I + 1] * (DSize - (D - S))) / DSize, Measure);
      inc(J);
      inc(D, DSize);
    end;
end;

procedure StretchCells(Src : PSingles; Dst : PBytes; SrcSize, DstSize, Count : cardinal; Measure : TMeasure);
begin
  if SrcSize <= DstSize
    then Small2Big(Src, Dst, SrcSize, DstSize, Count, Measure)
    else Big2Small(Src, Dst, SrcSize, DstSize, Count, Measure);
end;

{ TObservation }

constructor TObservation.Create(Template: ITemplate; Client : string; Time: TDateTime);
begin
  inherited Create;
  
  fTemplate  := Template;
  fClient    := Client;
  fTime      := Time;
  fProgress  := 0;
  fAdquiring := false;
  fLock      := TCriticalSection.Create;
end;

destructor TObservation.Destroy;
begin
  fLock.Free;
  inherited;
end;

procedure TObservation.Error(ErrorMessage: string);
begin
  Report_Obs_Progress(fProgress, ts_Error, ErrorMessage);
end;

function TObservation.Execute : integer;
var
  TimeMark : cardinal;
  drxFilterData : TDataFilter;
  rdaFilterData : FilterInfo;
begin
  Result := obs_Failed;
  Report_Obs_Start(fTemplate.Nombre, fClient);
  try
    try
      Initialize;
      try
        TurnOnSequence;
        try
          CheckPPIRHI;
          CreateFile;

          try
            AllocateMemory;
            try
              fObsError   := '';
              fCh0DataComplete := not fTR1Enabled;
              fCh1DataComplete := not fTR2Enabled;
              AcquireData;
              if fTR1Enabled
                then DRX1.DRX_WS.FinalizeObservation;
              if fTR2Enabled
                then DRX2.DRX_WS.FinalizeObservation;

              WaitCondition(DataIsComplete, 1000, Transfer_Timeout, fProgress, ts_Executing, 'Recibiendo datos...', 'No se recibe el fin de la observacion...');
            finally
              fAdquiring := false;
              ReleaseMemory;
            end;

            CloseFile;
          except
            DeleteFile;
            raise;
          end;

          UpdateTimes;
          CopyObs;
          Result := obs_Ok;
        finally
          TurnOffSequence;
        end;
      finally
        Finalize;
      end;
    except
      on EObservationCanceled do
        begin
          if fTR1Enabled
            then DRX1.DRX_WS.CancelObservation;
          if fTR2Enabled
            then DRX2.DRX_WS.CancelObservation;

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

          if fTR1Enabled
            then DRX1.DRX_WS.CancelObservation;
          if fTR2Enabled
            then DRX2.DRX_WS.CancelObservation;
        end;
    end;
  finally
    RestoreDefaultFilter;
    Report_Obs_Finish(Result);
  end;
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
            CommunicationModule.FTP.Host := DecodedFTPSettings[ FTPHostIndex ];
            CommunicationModule.FTP.Port := StrToInt( DecodedFTPSettings[ FTPPortIndex ] );
            if DecodedFTPSettings[ FTPUserIndex ] <> ''
              then
                begin
                  CommunicationModule.FTP.Username := DecodedFTPSettings[ FTPUserIndex ];
                  CommunicationModule.FTP.Password := DecodedFTPSettings[ FTPPasswordIndex ];
                end
              else
                begin
                  CommunicationModule.FTP.Username := 'anonymous';
                  CommunicationModule.FTP.Password := '';
                end;
            if boolean( StrToInt( DecodedFTPSettings[ UseProxyIndex ] ) )
              then
                begin
                  CommunicationModule.FTP.ProxySettings.ProxyType := fpcmUserSite;
                  CommunicationModule.FTP.ProxySettings.Host      := DecodedFTPSettings[ ProxyHostIndex ];
                  CommunicationModule.FTP.ProxySettings.Port      := StrToInt( DecodedFTPSettings[ ProxyPortIndex ] );
                  CommunicationModule.FTP.ProxySettings.UserName  := DecodedFTPSettings[ ProxyUserIndex ];
                  CommunicationModule.FTP.ProxySettings.Password  := DecodedFTPSettings[ ProxyPasswordIndex ];
                end
              else CommunicationModule.FTP.ProxySettings.ProxyType := fpcmNone;
            CommunicationModule.FTP.Connect( true, FTP_Timeout );
            try
              CommunicationModule.FTP.ChangeDir( DecodedFTPSettings[ FTPFolderIndex ] );
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
                      CommunicationModule.FTP.ChangeDir( FTPPath );
                      CommunicationModule.FTP.Put( fFileName, ExtractFileName( fFileName ) );
                    except
                      try
                        CommunicationModule.FTP.MakeDir( fTemplate.Nombre );
                        CommunicationModule.FTP.ChangeDir( fTemplate.Nombre );
                      except
                        CommunicationModule.FTP.ChangeDir( fTemplate.Nombre );
                      end;
                      if fTemplate.Opciones and tf_Create_Dir <> 0
                        then
                          begin
                            //Creo el directorio
                            if fTemplate.Opciones and tf_Include_Radar <> 0
                              then
                                try
                                  CommunicationModule.FTP.MakeDir( RadarIDs[ord(fFileHeader.Radar)] );
                                  CommunicationModule.FTP.ChangeDir( RadarIDs[ord(fFileHeader.Radar)] );
                                except
                                  CommunicationModule.FTP.ChangeDir( RadarIDs[ord(fFileHeader.Radar)] );
                                end;
                            if fTemplate.Opciones and tf_Include_Year <> 0
                              then
                                try
                                  CommunicationModule.FTP.MakeDir( Format('%.4d', [Year] ) );
                                  CommunicationModule.FTP.ChangeDir( Format('%.4d', [Year] ) );
                                except
                                  CommunicationModule.FTP.ChangeDir( Format('%.4d', [Year] ) );
                                end;
                            if fTemplate.Opciones and tf_Include_Month <> 0
                              then
                                try
                                  CommunicationModule.FTP.MakeDir( Format('%.2d', [Month]) );
                                  CommunicationModule.FTP.ChangeDir( Format('%.2d', [Month]) );
                                except
                                  CommunicationModule.FTP.ChangeDir( Format('%.2d', [Month]) );
                                end;
                            if fTemplate.Opciones and tf_Include_Day <> 0
                              then
                                try
                                  CommunicationModule.FTP.MakeDir( Format('%.2d', [Day]) );
                                  CommunicationModule.FTP.ChangeDir( Format('%.2d', [Day]) );
                                except
                                  CommunicationModule.FTP.ChangeDir( Format('%.2d', [Day]) );
                                end;
                            CommunicationModule.FTP.Put( fFileName, ExtractFileName( fFileName ) );
                          end
                        else CommunicationModule.FTP.Put( fFileName, ExtractFileName( fFileName ) );
                    end;
                  end
                else CommunicationModule.FTP.Put( ExtractFileName( fFileName ), ExtractFileName( fFileName ) );
            finally
              CommunicationModule.FTP.Quit;
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
  I, S : integer;
  D : TChannelDesc;
  W : integer;
begin
  FileSeek(fFileHandle, sizeof(fFileHeader) + fFileHeader.Movements * sizeof(longint), 0);
  for I := 0 to fTemplate.Formatos - 1 do
    begin
      fTemplate.Formato(I, W, D.Cells, D.Length);
      D.Wave := TWaveLength(W);
      D.Sectors := fTemplate.Sectores;

      case D.Wave of
        wl3cm:
          begin
            D.Beam    := theConfiguration.Ch1Beam;
            case D.Pulse of
              plLong  : D.PotMet := theCalibration.PotMetPL1;
              plShort : D.PotMet := theCalibration.PotMetPC1;
              else      D.PotMet := 0.0;
            end;
          end;
        wl10cm:
          begin
            D.Beam    := theConfiguration.Ch2Beam;
            case D.Pulse of
              plLong  : D.PotMet := theCalibration.PotMetPL2;
              plShort : D.PotMet := theCalibration.PotMetPC2;
              else      D.PotMet := 0.0;
            end;
          end;
        else D.Beam    := 0.0;
      end;

      D.Pulse := TPulseLength(fTemplate.Pulso);

      if fTemplate.Fin > fTemplate.Inicio
        then S := fTemplate.Fin - fTemplate.Inicio
        else S := fTemplate.Inicio - fTemplate.Fin;
      
      D.Delta := 0.0;

      D.Index := I * 4;
      D.Reserved := 0;
      FileWrite(fFileHandle, D, sizeof(D));

      D.Index := I * 4 + 1;
      D.Reserved := 1;
      FileWrite(fFileHandle, D, sizeof(D));

      D.Index := I * 4 + 2;
      D.Reserved := 2;
      FileWrite(fFileHandle, D, sizeof(D));

      D.Index := I * 4 + 3;
      D.Reserved := 3;
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
        while not Success and (GetTickCount - StartTime < Timeout) do
          begin
            fProgress := StartProg + round(Steps*Increment);
            inc(Steps);
            Report_Obs_Progress(fProgress, M, S );
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
  DRX1.Validate;
  DRX2.Validate;

  fTR1Enabled := TREnabled(wl_3cm);
  if fTR1Enabled and (not DRX1.Ready)
    then raise EObservationFailure.Create('El DRX 3cm no esta conectado');

  fTR2Enabled := TREnabled(wl_10cm);
  if fTR2Enabled and (not DRX2.Ready)
    then raise EObservationFailure.Create('El DRX 10cm no esta conectado');

  with fTemplate do
    begin
      MaxCell := 0;
      for I := 0 to Formatos - 1 do
        begin
          Formato(I, W, C, L);
          if C > MaxCell
            then MaxCell := C;
        end;
      Count := succ(abs(Sector_Fin - Sector_Inicio));
      fBufSize := Count * MaxCell * sizeof(byte);
      with fFileHeader do
        begin
          Stamp.Signature := VestaSignature;
          Stamp.Version   := FileVersion;
          StrCopy(Stamp.Design, pchar(string(Nombre)));
          Radar := TRadar(theConfiguration.RadarID);
          //DayLight & DateTime filled in CreateFile
          Channels  := Formatos * 4;
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
              //convertir de 14 bits a 12 bits
              Start  := round(Inicio * 4096 / 16384);
              Finish := round(Fin * 4096 / 16384);

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
              Measure := unNone;
              Kind := TPlaneKind(Tipo);

              if Fin > Inicio
                then I := Fin - Inicio
                else I := Inicio - Fin;

              //convertir de 14 bits a 12 bits
              Start  := round(Inicio * 4096 / 16384);
              Finish := round(Fin * 4096 / 16384);

              SectorCount := I * Sectores div Codes;
              //Measure, Speed, Time, Channel and Angle are set at acquisition time
            end;
          FillChar(Reserved, sizeof(Reserved), 0);
        end;
    end;

    if fTR1Enabled
      then TObservationDataReceiver.Create(self, 0, DRX1.Host, DRX1.Doppler_Port);
    if fTR2Enabled
      then TObservationDataReceiver.Create(self, 1, DRX2.Host, DRX2.Doppler_Port);
end;

procedure TObservation.Finalize;
begin
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

  fBuffer := AllocPtr(fBufSize);
end;

procedure TObservation.ReleaseMemory;
begin
  if Assigned( fBuffer )
    then ReleasePtr(pointer(fBuffer), fBufSize);
  ReallocMem(fMoveDir, 0);
end;

procedure TObservation.TurnOnSequence;
begin
  fLocal1 := Elbrus.Snapshot.Digital_Input and di_TxRx1_Local = di_TxRx1_Local;
  fLocal2 := Elbrus.Snapshot.Digital_Input and di_TxRx2_Local = di_TxRx2_Local;

{$IFNDEF RDA_Simulation}
  if not RadarOn
    then TurnRadarOn;
  try
    WaitCondition(RadarOn, 2000, 10000, 10, ts_Preparing, ms_TurnRadarOn, es_CheckRadarOn);
  except
    TurnRadarOff;
    raise;
  end;
{$ELSE}
    WaitCondition(nil, 500, 1000, 10, ts_Preparing, ms_TurnRadarOn, es_CheckRadarOn);
{$ENDIF}

{$IFNDEF RDA_Simulation}
  if not TxRxOn
    then
      try
        TurnTxRxOn;
        WaitCondition(TxRxOn, 5000, 900000, 60, ts_Preparing, ms_TurnTxRxOn, es_CheckTxRxOn);
      except
        TurnTxRxOff;
        raise;
      end;
{$ELSE}
    WaitCondition(nil, 500, 1000, 60, ts_Preparing, ms_TurnTxRxOn, es_CheckTxRxOn);
{$ENDIF}

  WaitTime;
  WaitCondition(IsTime, 1000, round(1000*theConfiguration.RadarWarmTime/ASecond), 70, ts_Preparing, ms_WaitTime, es_CheckTime);

  SoundAlarm;

{$IFNDEF RDA_Simulation}
  try
    ProgTxRx;  //85% progress
    WaitCondition(TxRxOk, 3000, 90000, 90, ts_Preparing, ms_ProgTxRx, es_CheckTxRx);
  except
    WaitForTxsStantby;
    raise;
  end;
{$ELSE}
    WaitCondition(nil, 500, 1000, 90, ts_Preparing, ms_ProgTxRx, es_CheckTxRx);
{$ENDIF}

{$IFNDEF RDA_Simulation}
  if not MotorOk
    then TurnMotorOn;
  try
    WaitCondition(MotorOk, 1000, 5000, 100, ts_Preparing, ms_MotorOn, es_CheckMotor);
  except
    TurnMotorOff;
    raise;
  end;
{$ELSE}
    WaitCondition(nil, 500, 1000, 100, ts_Preparing, ms_MotorOn, es_CheckMotor);
{$ENDIF}
end;

procedure TObservation.TurnOffSequence;

begin
  if not theConfiguration.ContinuosRegime
    then
      begin
        try
{$IFNDEF RDA_Simulation}
          StandbyTxRx;
          WaitCondition(TxRxStandby, 2000, 5000, 50, ts_Done, ms_TxRxStandby, es_CheckStandby);
{$ELSE}
          WaitCondition(nil, 500, 1000, 50, ts_Done, ms_TxRxStandby, es_CheckStandby);
{$ENDIF}


{$IFNDEF RDA_Simulation}
          TurnMotorOff;
          WaitCondition(MotorOff, 1000, 5000, 100, ts_Done, ms_MotorOff, es_CheckMotorOff);
{$ELSE}
          WaitCondition(nil, 500, 1000, 100, ts_Done, ms_MotorOff, es_CheckMotorOff);
{$ENDIF}
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
{$IFNDEF RDA_Simulation}
        Elbrus.Set_SP_Posicion_El(ang_0);
        Elbrus.Set_Lazo_Posicion_El(true);
        try
        WaitCondition(PositionEl, 500, 15000, fProgress, ts_Executing, ms_ElPosAntenna, es_ElPosAntenna);
        finally
          Elbrus.Set_Lazo_Posicion_El(false);
        end;
{$ENDIF}
      end;

  TxRxRestore;      
end;

procedure TObservation.CheckPPIRHI;
begin
  if fTemplate.Nombre = Plantilla_PPI
    then
      with fTemplate as ITemplateControl do
        begin
          Angulos := 1;
          SetAngulo(0, Snapshot.SP_Position_El);
        end
  else if fTemplate.Nombre = Plantilla_RHI
         then
           with fTemplate as ITemplateControl do
             begin
               Angulos := 1;
               SetAngulo(0, Snapshot.SP_Position_Az);
             end;
end;

procedure TObservation.CheckCancel;
begin
  if Snapshot^.ObsCancel
    then
      begin
        WriteView^.ObsCancel := true;
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
  fAdquiring := true;
  case fTemplate.Tipo of
    tk_PPI: AcquirePPI;
    tk_RHI: AcquireRHI;
    else raise EObservationFailure.Create('Tipo de plantilla desconocido');
  end;
end;

procedure TObservation.RemoveSpeckles(AcqLength, AcqCells : integer; Data : PSingles);
var
  S, I, D : integer;
  Umbral : word; //Cells to remove
  Start, Index : integer;
begin
  Umbral := theConfiguration.SpeckleUmbral div AcqLength;
  for S := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    begin
      D := (S - fTemplate.Sector_Inicio) * AcqCells;

      Index := 0;
      repeat
        //me posiciono en el primer valor distinto de cero
        while (Data[D+Index] = 0) and (Index < AcqCells) do Inc(Index);
        if Index < AcqCells
          then Start := Index
          else Break;
        Inc( Index );
        //me posiciono en el siguiente cero
        while (Data[D+Index] <> 0) and (Index < AcqCells) do Inc(Index);
        //Comparo con el umbral
        if Index-Start <= Umbral
          then
            for i := Start to Index-1 do
              Data[D+i] := 0;
        Inc( Index );
      until Index >= AcqCells;
    end;
end;

procedure TObservation.FormatData(AcqSectors, AcqLength, AcqCells : integer; Data : PSingles; Cells, Length : integer; Measure : TMeasure);
var
  I, J, K : integer;
  Buffer : PBytes;
  SectorCount : integer;
  Index, AcqIndex : integer;
  DataStorage : PSingles;
begin
  Buffer := fBuffer;

  if AcqSectors <> fTemplate.Sectores
    then
      begin
        DataStorage := AllocMem(fTemplate.Sectores * AcqCells * sizeof(single));
        if AcqSectors < fTemplate.Sectores
          then
            begin
              SectorCount := fTemplate.Sectores div AcqSectors;
              for I := 0 to AcqSectors-1 do
              begin
                for J := 0 to SectorCount-1 do
                begin
                  Move(Data^, DataStorage^, AcqCells * sizeof(single));
                  inc(DataStorage, AcqCells);
                end;
                inc(Data, AcqCells);
              end;
            end
          else
            begin
              SectorCount := AcqSectors div fTemplate.Sectores;

              for I := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
              begin
                for J := 0 to SectorCount-1 do
                begin
                  Index := I * AcqCells;
                  for K := 0 to AcqCells-1 do
                  begin
                    DataStorage^[Index] := DataStorage^[Index] + Data^[AcqIndex];
                    Inc(Index);
                    Inc(AcqIndex);
                  end;
                end;
              end;

              for I := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
                for J := 0 to AcqCells-1 do
                  DataStorage^[AcqCells*I+J] := DataStorage^[AcqCells*I+J] / SectorCount;
            end;
      end
    else DataStorage := Data;

  for I := fTemplate.Sector_Inicio to fTemplate.Sector_Fin do
    begin
      StretchCells(DataStorage, Buffer, AcqLength, Length, Cells, Measure);
      inc(DataStorage, AcqCells);
      inc(Buffer, Cells);
    end;

  if AcqSectors <> fTemplate.Sectores
    then FreeMem(DataStorage);
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
begin
  Result := Snapshot.Radar_ON;
end;

procedure TObservation.TurnTxRxOn;
var
  ret : integer;
begin
  //encender txs y rxs
  if fTR1Enabled
    then
      begin
        Elbrus.Tx1_Standby(true);
        Elbrus.Rx1_Encender;
        Elbrus.Tx1_Encender;
      end;
  if fTR2Enabled
    then
      begin
        Elbrus.Tx2_Standby(true);
        Elbrus.Rx2_Encender;
        Elbrus.Tx2_Encender;
      end;

  // esperar que esten listos los Txs
{$IFNDEF RDA_Simulation}
  Sleep(1000);
  WaitCondition(TxsOn, 5000, 900000, 60, ts_Preparing, ms_TurnTxRxOn, es_CheckTxRxOn);
{$ELSE}
  WaitCondition(nil, 500, 1000, 60, ts_Preparing, ms_TurnTxRxOn, es_CheckTxRxOn);
{$ENDIF}

{
  if fTR1Enabled
    then
      begin
        ret := TX_TurningOn_result[0];

        if ret = obs_Failed
          then raise EObservationFailure.Create('Fallo encendiendo Tx1');
        if ret = obs_Canceled
          then raise EObservationCanceled.Create(ts_Cancel);
      end;
}      
  if fTR2Enabled
    then
      begin
        ret := TX_TurningOn_result[1];

        if ret = obs_Failed
          then raise EObservationFailure.Create('Fallo encendiendo Tx2');
        if ret = obs_Canceled
          then raise EObservationCanceled.Create(ts_Cancel);
      end;
end;

function TObservation.TxRxOn: boolean;
begin
  Result := (not fTR1Enabled or (Is_Tx1On and Is_Rx1On and (SnapShot^.Digital_Input and di_Tx1_Listo = di_Tx1_Listo))) and
            (not fTR2Enabled or (Is_Tx2On and Is_Rx2On and (SnapShot^.Digital_Input and di_Tx2_Listo = di_Tx2_Listo)));
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
var
  ret : LongWord;
begin
  Elbrus.Encender_Accionamiento;
  Sleep(1000);

  WaitCondition(AntennaTurningOn, 1000, 5000, 98, ts_Preparing, ms_MotorOn, es_CheckMotor);

  ret := Antenna_TurningOn_result;

  if ret = obs_Failed
    then raise EObservationFailure.Create('Fallo encendiendo la antena');
  if ret = obs_Canceled
    then raise EObservationCanceled.Create(ts_Cancel);
end;

function TObservation.MotorOk : boolean;
begin
  Result := Snapshot.Antena_ON and Snapshot.Antena_Ok;
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
var
  freq : Int64;
  ret : integer;
begin
  with fTemplate do
  begin
    SetPulse(Pulso, PulseRate, 80);

    if fTR1Enabled
      then
        begin
          fCH3cmManualAFC := DRX1.AFC_WS.Get_AFCChangesInhibited;
          DRX1.AFC_WS.Set_AFCChangesInhibited(CH3cm_ManualAFC);
          if CH3cm_ManualAFC
            then
              begin
                freq := CH3cm_StaloFreq * 1000000;
                DRX1.AFC_WS.Set_Stalo_Frequency(freq);
                DRX1.AFC_WS.Set_Stalo_Power(CH3cm_StaloPower);
                DRX1.AFC_WS.Set_NCOFrequency(CH3cm_NCO);
              end;
          DRX1.AFC_WS.Set_Stalo_Output(true);
          Elbrus.Tx1_Standby(false);
      end;

    if fTR2Enabled
      then
        begin
          fCH10cmManualAFC := DRX2.AFC_WS.Get_AFCChangesInhibited;
          DRX2.AFC_WS.Set_AFCChangesInhibited(CH10cm_ManualAFC);
          if CH10cm_ManualAFC
            then
              begin
                freq := CH10cm_StaloFreq * 1000000;
                DRX2.AFC_WS.Set_Stalo_Frequency(freq);
                DRX2.AFC_WS.Set_Stalo_Power(CH10cm_StaloPower);
                DRX2.AFC_WS.Set_NCOFrequency(CH10cm_NCO);
              end;
          DRX2.AFC_WS.Set_Stalo_Output(true);
          Elbrus.Tx2_Standby(false);
        end;
  end;

  // esperar que esten listos las MPS
  Sleep(1000);
  WaitCondition(MPSOn, 1000, 20000, 85, ts_Preparing, ms_TurnMPSOn, es_CheckTxRxOn);

{
  if fTR1Enabled
    then
      begin
        ret := MPS_Changing_result[0];

        if ret = obs_Failed
          then raise EObservationFailure.Create('La MPS del Tx1 no alcanza el voltaje de ' + Format('%.2f', [theCalibration.MPS_Voltage1]) + ' volts');
        if ret = obs_Canceled
          then raise EObservationCanceled.Create(ts_Cancel);
      end;
}

  if fTR2Enabled
    then
      begin
        ret := MPS_Changing_result[1];

        if ret = obs_Failed
          then raise EObservationFailure.Create('La MPS del Tx2 no alcanza el voltaje de ' + Format('%.2f', [theCalibration.MPS_Voltage2]) + ' volts');
        if ret = obs_Canceled
          then raise EObservationCanceled.Create(ts_Cancel);
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
        then Result := Result and InSector(Analog_Input[ai_Tx1_Potencia], AI_Sector[ai_Tx1_Potencia]);
      if fTR2Enabled
        then Result := Result and InSector(Analog_Input[ai_Tx2_Potencia], AI_Sector[ai_Tx2_Potencia]);
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
    then Result := Result and Is_Tx1Standby;
  if fTR2Enabled
    then Result := Result and Is_Tx2Standby;
end;

procedure TObservation.AcquirePPI;
var
  I        : integer;
  A        : integer;
  fAngle, fSpeed, fPulse, fRate : integer;
  prog : integer;
begin
  with fTemplate do
    begin
      Elbrus.Set_SyncMark(false, 0);
      EnableMotorAz(true);
      EnableMotorEl(true);
      Elbrus.Set_Lazo_Posicion_Az(false);
      Elbrus.Set_Lazo_Posicion_El(true);
      A := Angulos;
      for I := 0 to A - 1 do
      begin
        if Movement(I, fAngle, fSpeed, fPulse, fRate) = S_OK
          then
            begin
              //if not theConfiguration.Motor_EL_Enabled
              //  then fAngle := 0;

              //posicionar antena
              Elbrus.Set_SP_Velocidad_Az(fSpeed);
              Elbrus.Set_SP_Posicion_El(fAngle);

              prog := i * 100 div A;

              SetPulse(fPulse, fRate, prog + (10 div A));

{$IFNDEF RDA_Simulation}
              WaitCondition(SpeedAz, 1000, 10000, prog + (20 div A), ts_Executing, ms_ElSpeedAntenna, es_AzSpeedAntenna);
              WaitCondition(PositionEl, 500, 15000, prog + (30 div A), ts_Executing, ms_ElPosAntenna, es_ElPosAntenna);
{$ELSE}
              WaitCondition(nil, 500, 1000, prog + (20 div A), ts_Executing, ms_ElSpeedAntenna, es_AzSpeedAntenna);
              WaitCondition(nil, 500, 1000, prog + (30 div A), ts_Executing, ms_ElPosAntenna, es_ElPosAntenna);
{$ENDIF}

              fSpeed := Snapshot.Velocity_Az;
              EnableMotorEl( false );

              try
                SetFilters;
                if fTR1Enabled
                  then DRX1.DRX_WS.AcquirePPI(fSpeed, fAngle);
                if fTR2Enabled
                  then DRX2.DRX_WS.AcquirePPI(fSpeed, fAngle);

                WaitCondition(DRX_Acquiring, 500, 10000, fProgress, ts_Executing, ms_Transfer + IntToStr(succ(I)), 'DRX no comenzo a adquirir a tiempo');
                WaitCondition(DRX_StopAcquiring, 1000, PPI_Timeout, prog + (100 div A), ts_Executing, ms_Transfer + IntToStr(succ(I)), 'DRX no respondio a tiempo');
              finally
                Elbrus.Set_Lazo_Posicion_El(false);
                EnableMotorEl( true );
              end;
            end;
      end;
    end;
end;

procedure TObservation.AcquireRHI;
var
  I        : integer;
  A        : integer;
  fAngle, fSpeed, fPulse, fRate : integer;
  prog, ret : integer;
  change_pulse : array[0..1] of boolean;
  PulseChangeResult : integer;
  pulse_msg : string;
begin
  with fTemplate do
    begin
      Elbrus.Set_SyncMark(true, 0);
      EnableMotorAz(true);
      EnableMotorEl(true);
      Elbrus.Set_Lazo_Posicion_Az(true);

      A := Angulos;
      try
        for I := 0 to A - 1 do
          if Movement(I, fAngle, fSpeed, fPulse, fRate) = S_OK
            then
              begin
                //posiciono la antena en la posicion inicial
                Elbrus.Set_SP_Posicion_Az(fAngle);
                Elbrus.Set_SP_Posicion_El(Inicio);
                Elbrus.Set_Lazo_Posicion_El(true);

                prog := i * 100 div A;

                SetPulse(fPulse, fRate, prog + (10 div A));

                //espero a que la antena este posicionada
{$IFNDEF RDA_Simulation}
                WaitCondition(PositionAz, 500, 15000, prog + (20 div A), ts_Executing, ms_AzPosAntenna, es_AzPosAntenna);
                WaitCondition(PositionEl, 500, 15000, prog + (30 div A), ts_Executing, ms_ElPosAntenna, es_ElPosAntenna);
{$ELSE}
                WaitCondition(nil, 500, 1000, prog + (20 div A), ts_Executing, ms_AzPosAntenna, es_AzPosAntenna);
                WaitCondition(nil, 500, 1000, prog + (30 div A), ts_Executing, ms_ElPosAntenna, es_ElPosAntenna);
{$ENDIF}

                EnableMotorAz(false);

                try
                  SetFilters;
                  if fTR1Enabled
                    then DRX1.DRX_WS.AcquireRHI(fSpeed, fAngle, Inicio, Fin);
                  if fTR2Enabled
                    then DRX2.DRX_WS.AcquireRHI(fSpeed, fAngle, Inicio, Fin);

                  WaitCondition(DRX_Acquiring, 100, 10000, fProgress, ts_Executing, ms_Transfer + IntToStr(succ(I)), 'DRX no respondio a tiempo');

                  Elbrus.Set_SP_Velocidad_El(fSpeed);
                  Elbrus.Set_Lazo_Posicion_El(false);

                  try
                    WaitCondition(DRX_StopAcquiring, 1000, RHI_Timeout, prog + (100 div A), ts_Executing, ms_Transfer + IntToStr(succ(I)), 'DRX no respondio a tiempo');
                  finally
                    Elbrus.Set_SP_Velocidad_El(0);
                  end;
                finally
                  EnableMotorAz(true);
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
          end;
      if fTR2Enabled
        then
          begin
            if not InSector(Analog_Input[ai_Tx2_Potencia], AI_Sector[ai_Tx2_Potencia])
              then result := result + ';' + AI_Names[ai_Tx2_Potencia] + ' fuera de parametro';
          end;
    end;
end;

procedure TObservation.TurnTxRxOff;
begin
  if fTR1Enabled
    then
      begin
        Elbrus.Tx1_Standby(true);
        Elbrus.Tx1_Apagar;
        Elbrus.Rx1_Apagar;
      end;
  if fTR2Enabled
    then
      begin
        Elbrus.Tx2_Standby(true);
        Elbrus.Tx2_Apagar;
        Elbrus.Rx2_Apagar;
      end;
end;

function TObservation.SpeedElZero: boolean;
begin
  result := Snapshot.Velocity_Az = 0;
end;

procedure TObservation.ReceiveData(Channel : integer; PPI_Date : double; PPI_Speed, PPI_Angle, Sectors, CellCount, CellSize : integer; dBZ, dBT, Speed, Width : PSingles);
var
  J  : integer;
  F     : integer;
  W, C, L  : integer;
begin
  if not fAdquiring then exit;
  
  fLock.Enter;
  try
    F := fTemplate.Formatos;

    if theConfiguration.SpeckleRemove
      then
        begin
          RemoveSpeckles(CellSize, CellCount, dBZ);
          RemoveSpeckles(CellSize, CellCount, dBT);
          RemoveSpeckles(CellSize, CellCount, Speed);
          RemoveSpeckles(CellSize, CellCount, Width);
        end;

    //convertir a dbz
    ConvertdBZ(Channel, CellSize, CellCount, dBZ);
    ConvertdBZ(Channel, CellSize, CellCount, dBT);

    for J := 0 to F - 1 do  // For each format
      begin
        fTemplate.Formato(J, W, C, L);
        if ((W = wl_3cm) and (Channel = 0)) or ((W = wl_10cm) and (Channel = 1))
          then
            begin
              if C * L > CellCount * CellSize
                then raise EObservationFailure.Create('Formato ' + IntToStr(J) +  ' es incorrecto');

              // Power Move
              with fMoveHeader.Desc do
                begin
                  Time    := PPI_Date;
                  //convertir de 14 bits a 12 bits
                  Speed   := round(PPI_Speed * 4096 / 16384);
                  Angle   := round(PPI_Angle * 4096 / 16384);
                end;
              fMoveHeader.UnpackSize := fBufSize;

              //Reflectivity Z
              fMoveHeader.Desc.Measure := unDBZ;
              fMoveHeader.Desc.Channel := J * 4;
              FormatData(Sectors, CellSize, CellCount, dBZ, C, L, unDBZ);
              WriteMove;

              //Reflectivity T
              fMoveHeader.Desc.Measure := unDBZ;
              fMoveHeader.Desc.Channel := J * 4 + 1;
              FormatData(Sectors, CellSize, CellCount, dBT, C, L, unDBZ);
              WriteMove;

              // Speed Move
              fMoveHeader.Desc.Measure := unMS;
              fMoveHeader.Desc.Channel := J * 4 + 2;
              FormatData(Sectors, CellSize, CellCount, Speed, C, L, unMS);
              WriteMove;

              // Spectrum Move
              fMoveHeader.Desc.Measure := unMS;
              fMoveHeader.Desc.Channel := J * 4 + 3;
              FormatData(Sectors, CellSize, CellCount, Width, C, L, unMS);
              WriteMove;
            end;
      end;
  finally
    fLock.Leave;
  end;
end;

procedure TObservation.DataComplete(Channel: integer);
begin
  if not fAdquiring
    then exit;

  if Channel = 0
    then fCh0DataComplete := true;
  if Channel = 1
    then fCh1DataComplete := true;
end;

procedure TObservation.CheckError;
begin
  if fObsError <> ''
    then raise EObservationFailure.Create(fObsError);
end;

procedure TObservation.SetError(error: string);
begin
  fObsError := error;
end;

procedure TObservation.SetPulse(Pulse: TxPulse; Rate: TxDualPulse; Progress : integer);
var
  PulseChangeResult : cardinal;
  pulse_msg : string;
begin
  while SyncChanging do Sleep(500);

  if Pulse = tx_Pulse_Long
    then
      begin
        if fTR1Enabled
          then Elbrus.Tx1_Long_Pulse;
        if fTR2Enabled
          then Elbrus.Tx2_Long_Pulse;
      end
    else
      begin
        if fTR1Enabled
          then Elbrus.Tx1_Short_Pulse(Rate);
        if fTR2Enabled
          then Elbrus.Tx2_Short_Pulse(Rate);
      end;

  Sleep(1000);    
  //esperar a que termine el cambio de pulso
  WaitCondition(SyncChanged, 1000, 20000, Progress, ts_Preparing, pulse_msg, 'Fallo el cambio de pulso');

  PulseChangeResult := PulseChanging_result[0];
  if PulseChangeResult = obs_Failed
    then raise EObservationFailure.Create('El Tx1 no cambia de pulso')
    else if PulseChangeResult = obs_Canceled
           then raise EObservationCanceled.Create(ts_Cancel);

  PulseChangeResult := PulseChanging_result[1];
  if PulseChangeResult = obs_Failed
    then raise EObservationFailure.Create('El Tx2 no cambia de pulso')
    else if PulseChangeResult = obs_Canceled
           then raise EObservationCanceled.Create(ts_Cancel);
end;

function TObservation.AntennaTurningOn: boolean;
begin
  result := not Elbrus.Antenna_TurningOn;
end;

function TObservation.TxsOn: boolean;
begin
  result := (not (fTR1Enabled and Elbrus.TX_TurningOn[0])) and (not (fTR2Enabled and Elbrus.TX_TurningOn[1]));
end;

function TObservation.MPSOn: boolean;
begin
  result := (not (fTR1Enabled and Elbrus.MPS_Changing[0])) and  (not (fTR2Enabled and Elbrus.MPS_Changing[1]));
end;

function TObservation.DRX_StopAcquiring: boolean;
begin
  result := not DRX_Acquiring;
end;

function TObservation.DRX_Acquiring: boolean;
begin
  result := (fTR1Enabled and DRX1.DRX_WS.GetGathering) or (fTR2Enabled and DRX2.DRX_WS.GetGathering);
end;

procedure TObservation.RestoreDefaultFilter;
begin
  if fTR1Enabled
    then DRX1.SetDefaultFilter;
  if fTR2Enabled
    then DRX2.SetDefaultFilter;
end;

procedure TObservation.SetFilters;
var
  drxFilterData : TDataFilter;
  rdaFilterData : FilterInfo;
begin
  with fTemplate do
    begin
      if fTR1Enabled
        then
          begin
            drxFilterData := TDataFilter.Create;

            drxFilterData.SQI  := FilterSQI;
            drxFilterData.CI   := FilterCI;
            drxFilterData.SIG  := FilterSIG;
            drxFilterData.LOG  := FilterLOG;
            drxFilterData.CCOR := FilterCCOR;

            if FilterCH1 > 0
              then
                begin
                  rdaFilterData := theConfiguration.GetFilter(FilterCH1-1);
                  drxFilterData := TDataFilter.Create;
                  drxFilterData.B0 := rdaFilterData.B0;
                  drxFilterData.B1 := rdaFilterData.B1;
                  drxFilterData.B2 := rdaFilterData.B2;
                  drxFilterData.B3 := rdaFilterData.B3;
                  drxFilterData.B4 := rdaFilterData.B4;
                  drxFilterData.C1 := rdaFilterData.C1;
                  drxFilterData.C2 := rdaFilterData.C2;
                  drxFilterData.C3 := rdaFilterData.C3;
                  drxFilterData.C4 := rdaFilterData.C4;

                  drxFilterData.MaxAngle    := Filter_MaxAngle;
                  drxFilterData.MaxHeigh    := Filter_MaxHeigh;
                  drxFilterData.MaxDistance := Filter_Distance;
                end;

              DRX1.DRX_WS.Set_Filter(FilterCH1 > 0, drxFilterData);
          end;

      if fTR2Enabled
        then
          begin
            drxFilterData := TDataFilter.Create;

            drxFilterData.SQI  := FilterSQI;
            drxFilterData.CI   := FilterCI;
            drxFilterData.SIG  := FilterSIG;
            drxFilterData.LOG  := FilterLOG;
            drxFilterData.CCOR := FilterCCOR;

            if FilterCH2 > 0
              then
                begin
                  rdaFilterData := theConfiguration.GetFilter(FilterCH2-1);
                  drxFilterData := TDataFilter.Create;
                  drxFilterData.B0 := rdaFilterData.B0;
                  drxFilterData.B1 := rdaFilterData.B1;
                  drxFilterData.B2 := rdaFilterData.B2;
                  drxFilterData.B3 := rdaFilterData.B3;
                  drxFilterData.B4 := rdaFilterData.B4;
                  drxFilterData.C1 := rdaFilterData.C1;
                  drxFilterData.C2 := rdaFilterData.C2;
                  drxFilterData.C3 := rdaFilterData.C3;
                  drxFilterData.C4 := rdaFilterData.C4;

                  drxFilterData.MaxAngle    := Filter_MaxAngle;
                  drxFilterData.MaxHeigh    := Filter_MaxHeigh;
                  drxFilterData.MaxDistance := Filter_Distance;
                end;

              DRX2.DRX_WS.Set_Filter(FilterCH1 > 0, drxFilterData);
          end;
  end;
end;

procedure TObservation.ConvertdBZ(Channel, AcqLength, AcqCells: integer; Data: PSingles);
var
  i  : integer;
  PotMet   : double;
  CellDistance : double;
  DistanceCorrection : double;
  GaseousAttenuationCorrection : double;
begin
  if Channel = 0
    then
      begin
        if fTemplate.Pulso = tx_Pulse_Long
          then PotMet := theCalibration.PotMetPL1
          else PotMet := theCalibration.PotMetPC1;
      end
    else
      begin
        if fTemplate.Pulso = tx_Pulse_Long
          then PotMet := theCalibration.PotMetPL2
          else PotMet := theCalibration.PotMetPC2;
      end;

  for i := 0 to AcqCells-1 do
  begin
    if Data[i] > 0
      then
        begin
          CellDistance := AcqLength * (i+1) / 1000;
          DistanceCorrection := 20 + Log10(CellDistance);
          GaseousAttenuationCorrection := GaseousAttenuation * CellDistance;
          Data[i] := Data[i] + DistanceCorrection + GaseousAttenuationCorrection;
        end;
    Data[i] := Data[i] + PotMet;
  end;
end;

procedure TObservation.TxRxRestore;
begin
  try
    if fTR1Enabled
      then DRX1.AFC_WS.Set_AFCChangesInhibited(fCH3cmManualAFC);

    if fTR2Enabled
      then DRX2.AFC_WS.Set_AFCChangesInhibited(fCH10cmManualAFC);
  except
    if fTR1Enabled
      then DRX1.Validate;

    if fTR2Enabled
      then DRX2.Validate;
  end;
end;

function TObservation.Tx1_SyncChanged: boolean;
begin
  result := not Elbrus.PulseChanging[0];
end;

function TObservation.Tx2_SyncChanged: boolean;
begin
  result := not Elbrus.PulseChanging[1];
end;

function TObservation.Tx1_SyncChanging: boolean;
begin
  result := Elbrus.PulseChanging[0];
end;

function TObservation.Tx2_SyncChanging: boolean;
begin
  result := Elbrus.PulseChanging[1];
end;

function TObservation.SyncChanged: boolean;
begin
  result := Tx1_SyncChanged and Tx2_SyncChanged;
end;

function TObservation.SyncChanging: boolean;
begin
  result := Tx1_SyncChanging or Tx2_SyncChanging;
end;

function TObservation.DataIsComplete: boolean;
begin
  result := fCh0DataComplete and fCh1DataComplete;
end;

end.

