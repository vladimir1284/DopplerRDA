unit AcquireShots;

interface

uses
  Advantech, Classes, Rda_TLB, ElbrusTypes, Calib, SysUtils;

type
  TShotsHeader = packed record
    ShotCount       : LongWord;
    CellCount       : LongWord;
    CellSize        : LongWord;    //metros
    KindOfMovement  : DesignKind;
    ChannelType     : WaveLength;
    AntennaPosition : single;
    StartAngle      : single;
    FinishAngle     : single;
  end;

  EObsTimeOut =
    class(Exception)
    end;

  TAcquireShotsInSector = class(TThread)
  private
    fStartAngle,
    fFinishAngle : Single;
    fTimeout     : Integer;
    fKing        : DesignKind;
    fCellCount   : Integer;
    fChannel1,
    fChannel2    : boolean;
    fPPI         : DesignKind;
    f3cmPath,
    f10cmPath    : string;
    Ant          : TList;
    Ch1, Ch2     : PWords;
    ShotsHeader  : TShotsHeader;
    f3cmFile,
    f10cmFile    : TFileStream;
  private
    procedure ConvertToDB( RawData : PWords; Calibration : CalibrationTable );
    procedure WriteHeader( FileStream : TFileStream; Header : TShotsHeader );
    procedure WriteAntennaPos( FileStream : TFileStream );
    procedure WriteChannelData( FileStream : TFileStream; Channel : PBytes );
    procedure WriteFile( FileStream : TFileStream; Header : TShotsHeader; Data : PBytes );
  protected
    function  Acquire_ShotsInSectorTwoChannel( SampleRate  : cardinal;
                                               ClockSource : boolean;
                                               ChannelOrder : boolean;
                                               Port, CodeError : Integer ) : word;
    procedure Execute; override;
  public
    constructor Create( StartAngle, FinishAngle: Single; Timeout: Integer;
                        King: DesignKind; CellCount: Integer;
                        Channel1, Channel2: boolean; FilePath : string );
    destructor Destroy; override;
  end;

implementation

uses
  Deva, Driver, Parameters, Windows, Config, Elbrus, Users, Constants;

const
  AcquireShotsExt = '.sts';
  ch3cmName = 'ch3cm' + AcquireShotsExt;
  ch10cmName = 'ch10cm' + AcquireShotsExt;

type
  TCastBytes =
    record
     case word of
       0 : (W : word);
       1 : (LB, HB : byte);
    end;

{ TAcquireShotsInSector }

function TAcquireShotsInSector.Acquire_ShotsInSectorTwoChannel( SampleRate  : cardinal;
                                                                ClockSource : boolean;
                                                                ChannelOrder : boolean;
                                                                Port, CodeError : Integer ) : word;

  function AntennaInAngle( Angle : single; CodeError : word ) : boolean;
  var
    AntennaPosition : single;
    CodeAngle : word;
  begin
    if fPPI = dk_PPI
      then AntennaPosition := Deva.Read_Encoder_X
      else AntennaPosition := Deva.Read_Encoder_Y;
    CodeAngle := Trunc( 4096 * Angle / 360 );
    result := (CodeAngle >= AntennaPosition - CodeError) and (CodeAngle <= AntennaPosition + CodeError);
  end;

var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  BuffCh1,
  BuffCh2       : pointer;
  Index         : integer;
  BufferSize    : integer;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  Acq, Wrk      : boolean;
  StartTime     : cardinal;

  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;

  AntCod        : cardinal;
  AntAng        : single;
  Buffer        : pointer;
begin
  //Initializations
  StartTime := GetTickCount;
  BuffCh1 := nil;
  BuffCh2 := nil;
  result := 0;
  Index := 0;
  Acq := false;
  Wrk := true;
  BufferSize := fCellCount * SizeOf( word );
  QueryPerformanceFrequency(Freq);
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize*2 );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize*2 );
        GetMem(BuffCh1, BufferSize);
        GetMem(BuffCh2, BufferSize);
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        BufferAcq[Acq].Buffer := GlobalLock( BufferAcq[Acq].Handle );
        BufferAcq[Wrk].Buffer := GlobalLock( BufferAcq[Wrk].Handle );
        VirtualLock( BuffCh1, BufferSize );
        VirtualLock( BuffCh2, BufferSize );

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
        FAIDmaExStart.StartChan  := Port;
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := fCellCount * 2;
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        while (GetTickCount-StartTime < fTimeout) and
              (not AntennaInAngle( fStartAngle, CodeError ) ) do Sleep(0);
        if GetTickCount-StartTime >= fTimeout
          then raise EObsTimeOut.Create( 'No llego el angulo de inicio (' + Format('%.2f', [fStartAngle]) + ') en el tiempo establecido' );

        //Acquire Start
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );
        StartTime := GetTickCount;
        if fPPI = dk_PPI
          then AntCod := Deva.Read_Encoder_X
          else AntCod := Deva.Read_Encoder_Y;

        repeat
          //Check for data ready
          QueryPerformanceCounter( Starting );
          GlobalStarting := Starting;
          repeat
            DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
            QueryPerformanceCounter( Finishing );
            if (Stopped <> 1) and ((Finishing-Starting)*1000/Freq >= MaxLoopTime)
              then if (Finishing-GlobalStarting)/Freq >= 1
                     then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-GlobalStarting)*1000/Freq ) + ' ms')
                     else
                       begin
                         DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
                         DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );
                         QueryPerformanceCounter(Starting);
                       end;
          until Stopped = 1;

          //Acquire Restart
          AntAng := (AntCod * 360) / 4096;
          DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
          Acq := not Acq;
          Wrk := not Wrk;
          FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
          DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );
          if fPPI = dk_PPI
            then AntCod := Deva.Read_Encoder_X
            else AntCod := Deva.Read_Encoder_Y;

          //Process Data
          Index := result * fCellCount;
          FillChar( BuffCh1^, BufferSize, 0 );
          FillChar( BuffCh2^, BufferSize, 0 );
          if ChannelOrder
            then ScatterTwoData( BuffCh1, BuffCh2, fCellCount, BufferAcq[Wrk].Buffer )
            else ScatterTwoData( BuffCh2, BuffCh1, fCellCount, BufferAcq[Wrk].Buffer );

          if fChannel1
            then
              begin
                ReallocMem( Ch1, (result+1) * BufferSize );
                MoveWords( BuffCh1, @Ch1^[ Index ], BufferSize );
              end;
          if fChannel2
            then
              begin
                ReallocMem( Ch2, (result+1) * BufferSize );
                MoveWords( BuffCh2, @Ch2^[ Index ], BufferSize );
              end;

          //Antenna
          Ant.Add( pointer( AntAng ) );
          Inc( result );
        until (Terminated) or (GetTickCount-StartTime >= fTimeout) or (AntennaInAngle( fFinishAngle, CodeError ));
        if GetTickCount-StartTime >= fTimeout
          then raise EObsTimeOut.Create( 'No llego el angulo de fin (' + Format('%.2f', [fFinishAngle]) + ') en el tiempo establecido' );
        if Terminated
          then raise EAcqError.Create( 'Error desconocido' );
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
        ReleaseMutex(AcquiringMutex);
        try
          //unlock
          GlobalUnlock( BufferAcq[Acq].Handle );
          GlobalUnlock( BufferAcq[Wrk].Handle );
          if assigned( BuffCh1 ) then VirtualUnlock( BuffCh1, BufferSize );
          if assigned( BuffCh2 ) then VirtualUnlock( BuffCh2, BufferSize );
          //release
          if BufferAcq[Acq].Handle <> 0 then GlobalFree( BufferAcq[Acq].Handle );
          if BufferAcq[Wrk].Handle <> 0 then GlobalFree( BufferAcq[Wrk].Handle );
          if assigned( BuffCh1 ) then FreeMem( BuffCh1 );
          if assigned( BuffCh2 ) then FreeMem( BuffCh2 );
          Dispose( GainList );
        except
        end;
      end
    else raise EAcqError.Create( 'Ya estan adquiriendo' );
end;

constructor TAcquireShotsInSector.Create(StartAngle, FinishAngle: Single;
                                         Timeout: Integer; King: DesignKind;
                                         CellCount: Integer; Channel1,
                                         Channel2: boolean; FilePath : string);
var
  Path, Temp : string;
begin
  inherited Create( true );
  Priority := tpTimeCritical;
  FreeOnTerminate := true;

  fStartAngle  := StartAngle;
  fFinishAngle := FinishAngle;
  fTimeout     := Timeout;
  fPPI         := King;
  fCellCount   := CellCount;
  fChannel1    := Channel1;
  fChannel2    := Channel2;

  Ch1 := nil;
  Ch2 := nil;
  Ant := TList.Create;
  Ant.Capacity := 5000;
  Ant.Clear;
  try
    if ExtractFilePath( FilePath ) = ''
      then Path := theConfiguration.ObsDir
      else Path := ExtractFilePath( FilePath );
    if (Path<>'') and (Path[ Length( Path ) ] <> '\')
      then Path := Path + '\';
    Temp := ExtractFileName( FilePath );
    if Pos( '.', Temp ) > 0
      then Delete( Temp, Pos( '.', Temp ), Length( Temp ) - Pos( '.', Temp ) + 1 );

    if fChannel1
      then
        begin
          f3cmPath  := Path + Temp + ch3cmName;
          f3cmFile := TFileStream.Create( f3cmPath, fmCreate	);
        end;
    if fChannel2
      then
        begin
          f10cmPath := Path + Temp + ch10cmName;
          f10cmFile := TFileStream.Create( f10cmPath, fmCreate	);
        end;
  except
    if fChannel1
      then
        begin
          f3cmPath  := theConfiguration.ObsDir + '\' + ch3cmName;
          if Assigned( f3cmFile )
            then f3cmFile.Free;
          f3cmFile := TFileStream.Create( f3cmPath, fmCreate	);
        end;
    if fChannel2
      then
        begin
          f10cmPath := theConfiguration.ObsDir + '\' + ch10cmName;
          if Assigned( f10cmFile )
            then f10cmFile.Free;
          f10cmFile := TFileStream.Create( f10cmPath, fmCreate	);
        end;
  end;

  Resume;
end;

procedure TAcquireShotsInSector.Execute;
var
  Status  : integer;
  Channel : PBytes;
begin
  Report_Obs_Start( 'Adquiriendo Rayos', GetController );
  Sleep( 1000 );
  try
    //Header
    with ShotsHeader do
    begin
      KindOfMovement := fPPI;
      CellCount := fCellCount;
      if KindOfMovement = dk_PPI
        then AntennaPosition := Deva.Read_Encoder_Int_X * 360 / 4096
        else AntennaPosition := Deva.Read_Encoder_Int_Y * 360 / 4096;
      CellSize := Snapshot.Sample_Cell_Size;
      StartAngle := fStartAngle;
      FinishAngle := FinishAngle;
    end;
    //Acquire Data
    try
      if fPPI = dk_PPI
        then EnableMotorEl( false );
      try
        if fChannel1 and fChannel2
          then
            begin
              if theConfiguration.Ch1Port < theConfiguration.Ch2Port
                then ShotsHeader.ShotCount := Acquire_ShotsInSectorTwoChannel( SnapShot.Sample_Rate, theConfiguration.ClockSource, true, theConfiguration.Ch1Port, theConfiguration.AngleAcc )
                else ShotsHeader.ShotCount := Acquire_ShotsInSectorTwoChannel( SnapShot.Sample_Rate, theConfiguration.ClockSource, false, theConfiguration.Ch2Port, theConfiguration.AngleAcc )
            end
          else if fChannel1
                 then
                   begin
                     if (theConfiguration.Ch1Port mod 2) = 0
                       then ShotsHeader.ShotCount := Acquire_ShotsInSectorTwoChannel( SnapShot.Sample_Rate, theConfiguration.ClockSource, true, theConfiguration.Ch1Port, theConfiguration.AngleAcc )
                       else ShotsHeader.ShotCount := Acquire_ShotsInSectorTwoChannel( SnapShot.Sample_Rate, theConfiguration.ClockSource, false, theConfiguration.Ch2Port, theConfiguration.AngleAcc )
                   end
                 else if fChannel2
                        then
                          begin
                            if (theConfiguration.Ch2Port mod 2) = 0
                              then ShotsHeader.ShotCount := Acquire_ShotsInSectorTwoChannel( SnapShot.Sample_Rate, theConfiguration.ClockSource, false, theConfiguration.Ch2Port, theConfiguration.AngleAcc )
                              else ShotsHeader.ShotCount := Acquire_ShotsInSectorTwoChannel( SnapShot.Sample_Rate, theConfiguration.ClockSource, true, theConfiguration.Ch1Port, theConfiguration.AngleAcc );
                          end;
      finally
        if fPPI = dk_PPI
          then EnableMotorEl( true );
      end;
      //Process & Save Data
      if fChannel1
        then
          try
            GetMem( Channel, ShotsHeader.ShotCount * ShotsHeader.CellCount );
            ConvertToDB( Ch1, theCalibration.Calibration1 );
            PWord_To_PBytes( Ch1, Channel, ShotsHeader.ShotCount * ShotsHeader.CellCount );
            ShotsHeader.ChannelType := wl_3cm;
            WriteFile( f3cmFile, ShotsHeader, Channel );
          finally
            FreeMem( Channel );
          end;
      if fChannel2
        then
          try
            GetMem( Channel, ShotsHeader.ShotCount * ShotsHeader.CellCount );
            ConvertToDB( Ch2, theCalibration.Calibration2 );
            PWord_To_PBytes( Ch2, Channel, ShotsHeader.ShotCount * ShotsHeader.CellCount );
            ShotsHeader.ChannelType := wl_10cm;
            WriteFile( f10cmFile, ShotsHeader, Channel );
          finally
            FreeMem( Channel );
          end;
      Status := obs_Ok;
    except
      on E : Exception do
      begin
        Status := obs_Failed;
        Report_Obs_Progress( 100, 'Error en la Observación', E.Message );
      end;
    end;
  finally
    Report_Obs_Finish( Status );
  end;
end;

procedure TAcquireShotsInSector.WriteHeader( FileStream : TFileStream; Header : TShotsHeader );
begin
  FileStream.WriteBuffer( Header, sizeof( TShotsHeader ) );
end;

procedure TAcquireShotsInSector.WriteAntennaPos( FileStream : TFileStream );
var
  i      : cardinal;
  AntPos : single;
begin
  for i := 0 to Ant.Count-1 do
  begin
    AntPos := single( Ant[i] );
    FileStream.WriteBuffer( AntPos, sizeof(Single) );
  end;
end;

procedure TAcquireShotsInSector.WriteChannelData( FileStream : TFileStream; Channel : PBytes );
begin
  FileStream.WriteBuffer( Channel^, ShotsHeader.ShotCount * ShotsHeader.CellCount );
end;

procedure TAcquireShotsInSector.WriteFile( FileStream : TFileStream; Header : TShotsHeader; Data : PBytes );
begin
  WriteHeader( FileStream, Header );
  WriteAntennaPos( FileStream );
  WriteChannelData( FileStream, Data );
end;

destructor TAcquireShotsInSector.Destroy;
var
  i : cardinal;
begin
  //Free Data
  ReallocMem( Ch1, 0 );
  ReallocMem( Ch2, 0 );
  if fChannel1
    then f3cmFile.Free;
  if fChannel2
    then f10cmFile.Free;
  Ant.Free;
  inherited;
end;

procedure TAcquireShotsInSector.ConvertToDB(RawData: PWords; Calibration: CalibrationTable);
var
  I, J : integer;
begin
  for I := 0 to (ShotsHeader.ShotCount*ShotsHeader.CellCount)-1 do
    if assigned(Calibration)
      then
        with Calibration^ do
          begin
            J := 0;
            while (J < rgsabound[0].cElements) and
                  (RawData[I] > PWords(pvData)[J]) do
              inc(J);
            if J < rgsabound[0].cElements
              then RawData[i] := J
              else RawData[I] := rgsabound[0].cElements;
          end
      else RawData[I] := 0;
end;

end.
