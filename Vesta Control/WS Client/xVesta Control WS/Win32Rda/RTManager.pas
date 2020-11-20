unit RTManager;

interface

uses
  Classes, ElbrusTypes, Calib, SysUtils;

const
  ChannelDataSize = 2000;
  TimeForRead = 5;  //milisegundos
  SleepPercent = 80;
  MinimalSleepTime = 10;
  MaximumSleepTime = 500;
  MaxRTLoopTime = 10;
  MaxSleepTime = 100;

type
  TBeamDataRec =
    record
      Az, El     : single;
      CellSize   : cardinal;
      PackSize,
      UnPackSize : word;
      Data       : pointer;
      WR         : TMultiReadExclusiveWriteSynchronizer;
    end;

  TBeamData = array [0..ChannelDataSize-1] of TBeamDataRec;
  TChannelData = array [1..2] of TBeamData;

  TRTThread =
    class(TThread)
      private
        fCh1, fCh2   : boolean;
        fCellCount   : cardinal;
        fWriteIndex,
        fReaders     : word;
        fWriteLap    : boolean;
      public
        constructor Create( Ch1, Ch2 : boolean; CellCount : cardinal );

        procedure AddReader;
        procedure RemoveReader;
        property  WriteIndex : word read fWriteIndex;
        property  WriteLap : boolean read fWriteLap;
        property  Ch1Enabled : boolean read fCh1;
        property  Ch2Enabled : boolean read fCh2;
        property  ReaderCount : word read fReaders;
      private
        procedure ConvertToDB( RawData : PWords; Calibration : CalibrationTable );
        procedure RemoveSpeckles( MeanDB : PWords );
        function  MinorAngle( Ang1, Ang2 : single ) : single;

        procedure Datel_RT_AdquireTwoChannel( Port : integer; SampleRate  : cardinal;
                                        ClockSource : boolean; Ch1, Ch2 : byte );

        procedure Advantech_RT_AdquireTwoChannel( Port : integer; SampleRate  : cardinal;
                                        ClockSource : boolean; Ch1, Ch2 : byte );
      protected
        procedure Execute;  override;
    end;

var
  RTThread : TRTThread = nil;
  RTEnabled : boolean = false;
  RTCellCount : integer = 0;
  ChannelData : TChannelData;

implementation

uses
  Parameters, Windows, Config, Elbrus, ZLibEx, Driver, Deva, Advantech, Datel, Pci416;

{ TRTThread }

procedure TRTThread.AddReader;
begin
  Inc( fReaders );
end;

procedure TRTThread.ConvertToDB(RawData: PWords; Calibration: CalibrationTable );
var
  I, J : integer;
begin
  for I := 0 to fCellCount - 1 do
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
end;

constructor TRTThread.Create(Ch1, Ch2: boolean; CellCount: cardinal);
begin
  inherited Create( true );
  Priority := tpTimeCritical;
  FreeOnTerminate := true;
  fCh1 := Ch1;
  fCh2 := Ch2;
  fCellCount := CellCount;
  fReaders := 0;
  fWriteIndex := 0;
  fWriteLap := false;
  Resume;
end;

procedure TRTThread.Execute;
begin
  try
    if PCI1714 > -1
      then
        begin
          if fCh1 and fCh2
            then
              begin
                if theConfiguration.Ch1Port < theConfiguration.Ch2Port
                  then Advantech_RT_AdquireTwoChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 1, 2 )
                  else Advantech_RT_AdquireTwoChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 2, 1 )
              end
            else if fCh1
                   then
                     begin
                       if (theConfiguration.Ch1Port mod 2) = 0
                         then Advantech_RT_AdquireTwoChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 1, 0 )
                         else Advantech_RT_AdquireTwoChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 0, 1 )
                     end
                   else if fCh2
                          then
                            begin
                              if (theConfiguration.Ch2Port mod 2) = 0
                                then Advantech_RT_AdquireTwoChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 2, 0 )
                                else Advantech_RT_AdquireTwoChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 0, 2 );
                            end;
        end
      else
        begin
          if fCh1 and fCh2
            then
              begin
                if theConfiguration.Ch1Port < theConfiguration.Ch2Port
                  then Datel_RT_AdquireTwoChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 1, 2 )
                  else Datel_RT_AdquireTwoChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 2, 1 )
              end
            else if fCh1
                   then
                     begin
                       if (theConfiguration.Ch1Port mod 2) = 0
                         then Datel_RT_AdquireTwoChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 1, 0 )
                         else Datel_RT_AdquireTwoChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 0, 1 )
                     end
                   else if fCh2
                          then
                            begin
                              if (theConfiguration.Ch2Port mod 2) = 0
                                then Datel_RT_AdquireTwoChannel( theConfiguration.Ch2Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 2, 0 )
                                else Datel_RT_AdquireTwoChannel( theConfiguration.Ch1Port, SnapShot.Sample_Rate, theConfiguration.ClockSource, 0, 2 );
                            end;
        end;
  finally
    RTEnabled := false;
    RTCellCount := 0;
  end;
end;

function TRTThread.MinorAngle(Ang1, Ang2: single): single;
begin
  if Ang1 < Ang2
    then result := Ang1
    else result := Ang2;
end;

procedure TRTThread.RemoveReader;
begin
  Dec( fReaders );
  if fReaders = 0
    then Terminate;
end;

procedure TRTThread.RemoveSpeckles( MeanDB : PWords );
var
  S, I : integer;
  Umbral : word; //Cells to remove
  Start, Index : integer;
begin
  Umbral := theConfiguration.RTSpeckleUmbral div Snapshot^.Sample_Cell_Size;
  //Canal 1
  Index := 0;
  repeat
    //me posiciono en el primer valor distinto de cero
    while (MeanDB[Index] = 0) and (Index < fCellCount) do Inc(Index);
    if Index < fCellCount
      then Start := Index
      else Break;
    Inc( Index );
    //me posiciono en el siguiente cero
    while (MeanDB[Index] <> 0) and (Index < fCellCount) do Inc(Index);
    //Comparo con el umbral
    if Index-Start <= Umbral
      then
        for i := Start to Index-1 do
          MeanDB[i] := 0;
    Inc( Index );
  until Index >= fCellCount;
end;

procedure TRTThread.Advantech_RT_AdquireTwoChannel( Port : integer; SampleRate  : cardinal;
                                                    ClockSource : boolean; Ch1, Ch2 : byte );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done          : cardinal;
  Channel1,
  Channel2      : PWords;
  FinalChannel1,
  FinalChannel2 : PBytes;
  BufferSize    : cardinal;
  AzCod,
  ElCod         : cardinal;
  ElAng,
  AzAng         : single;
  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  Acq, Wrk      : boolean;
  Start         : LongWord;
  Pack          : pointer;
  PackSize      : integer;
  MinAng        : single;
  AntennaVelocity,
  SleepTime     : cardinal;
  i             : integer;
  Starting,
  Finishing,
  Freq          : int64;
begin
  RTEnabled := true;
  Channel1 := nil;
  Channel2 := nil;
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
        GetMem( Channel1, BufferSize );
        GetMem( Channel2, BufferSize );
        GetMem( FinalChannel1, fCellCount );
        GetMem( FinalChannel2, fCellCount );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Channel1, BufferSize );
        VirtualLock( Channel2, BufferSize );
        BufferAcq[Acq].Buffer  := GlobalLock( BufferAcq[Acq].Handle );
        BufferAcq[Wrk].Buffer  := GlobalLock( BufferAcq[Wrk].Handle );

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
        FAIDmaExStart.StartChan  := Port;        //Start by Chanel 0
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := fCellCount * 2; //Two Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        //Comienzo a adquirir
        AzCod := Deva.Read_Encoder_X;
        ElCod := Deva.Read_Encoder_Y;
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        while (not Terminated) and (RTEnabled) do
        begin
          try
            if (Ch1 <> 0) and (Ch2 <> 0)
              then MinAng := MinorAngle( theConfiguration.Ch1Beam, theConfiguration.Ch2Beam )
              else if Ch1 <> 0
                     then
                       begin
                         if Ch1 = 1
                           then MinAng := theConfiguration.Ch1Beam
                           else MinAng := theConfiguration.Ch2Beam;
                       end
                     else
                       begin
                         if Ch2 = 1
                           then MinAng := theConfiguration.Ch1Beam
                           else MinAng := theConfiguration.Ch2Beam;
                       end;
            MinAng := MinAng * 4096 / 360;
            if Snapshot.Velocity_Az > Snapshot.Velocity_El
              then AntennaVelocity := Abs(Snapshot.Velocity_Az)
              else AntennaVelocity := Abs(Snapshot.Velocity_El);
            if AntennaVelocity > 0
              then if Snapshot.Trigger_Rate > 0
                     then SleepTime := Trunc( (1000 * ((MinAng/AntennaVelocity)-(1/Snapshot.Trigger_Rate))) * SleepPercent / 100 )
                     else SleepTime := Trunc( (1000 * (MinAng/AntennaVelocity)) * SleepPercent / 100 )
              else SleepTime := MaximumSleepTime;

            if SleepTime > MaximumSleepTime
              then SleepTime := MaximumSleepTime;
            if SleepTime < MinimalSleepTime
              then SleepTime := MinimalSleepTime;
          except
            SleepTime := MinimalSleepTime;
          end;
          if Ch1 <> 0 then FillChar( Channel1^, BufferSize, 0 );
          if Ch2 <> 0 then FillChar( Channel2^, BufferSize, 0 );
          //Check for data ready
          QueryPerformanceCounter( Starting );
          try
            repeat
              Sleep( SleepTime );
              DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
              QueryPerformanceCounter( Finishing );
              if (Stopped <> 1) and ((Finishing-Starting)/Freq >= MaxRTLoopTime)
                then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
            until Stopped = 1;
          except
            RTEnabled := false;
            Continue;
          end;

          //Reinicio la adquisicion...
          DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
          Acq := not Acq;
          Wrk := not Wrk;
          FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
          AzAng := (AzCod * 360) / 4096;
          AzCod := Deva.Read_Encoder_X;
          ElAng := (ElCod * 360) / 4096;
          ElCod := Deva.Read_Encoder_Y;
          DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

          // Process data
          Advantech.ScatterTwoData( Channel1, Channel2, fCellCount, BufferAcq[Wrk].Buffer );
          //Channel 1
          if Ch1 <> 0
            then
              begin
                if Ch1 = 1
                  then ConvertToDB( Channel1, theCalibration.Calibration1 )
                  else ConvertToDB( Channel1, theCalibration.Calibration2 );
                if theConfiguration.RTSpeckleRemove
                  then RemoveSpeckles( Channel1 );
                PWord_To_PBytes( Channel1, FinalChannel1, fCellCount );
                //Compacto los datos para trasmitir menos datos
                ZCompress( FinalChannel1, fCellCount, Pack, PackSize );

                ChannelData[ Ch1 ][ fWriteIndex ].WR.BeginWrite;
                try
                  if Assigned( ChannelData[ Ch1 ][ fWriteIndex ].Data )
                    then FreeMem( ChannelData[ Ch1 ][ fWriteIndex ].Data );
                  ChannelData[ Ch1 ][ fWriteIndex ].Az := AzAng;
                  ChannelData[ Ch1 ][ fWriteIndex ].El := ElAng;
                  ChannelData[ Ch1 ][ fWriteIndex ].CellSize := Snapshot^.Sample_Cell_Size;
                  ChannelData[ Ch1 ][ fWriteIndex ].PackSize := PackSize;
                  ChannelData[ Ch1 ][ fWriteIndex ].UnPackSize := fCellCount;
                  ChannelData[ Ch1 ][ fWriteIndex ].Data := Pack;
                finally
                  ChannelData[ Ch1 ][ fWriteIndex ].WR.EndWrite;
                end;
              end;
          //Channel 2
          if Ch2 <> 0
            then
              begin
                if Ch2 = 1
                  then ConvertToDB( Channel2, theCalibration.Calibration1 )
                  else ConvertToDB( Channel2, theCalibration.Calibration2 );
                if theConfiguration.RTSpeckleRemove
                  then RemoveSpeckles( Channel2 );
                PWord_To_PBytes( Channel2, FinalChannel2, fCellCount );
                //Compacto los datos para trasmitir menos datos
                ZCompress( FinalChannel2, fCellCount, Pack, PackSize );
                
                ChannelData[ Ch2 ][ fWriteIndex ].WR.BeginWrite;
                try
                  if Assigned( ChannelData[ Ch2 ][ fWriteIndex ].Data )
                    then FreeMem( ChannelData[ Ch2 ][ fWriteIndex ].Data );
                  ChannelData[ Ch2 ][ fWriteIndex ].Az := AzAng;
                  ChannelData[ Ch2 ][ fWriteIndex ].El := ElAng;
                  ChannelData[ Ch2 ][ fWriteIndex ].CellSize := Snapshot^.Sample_Cell_Size;
                  ChannelData[ Ch2 ][ fWriteIndex ].PackSize := PackSize;
                  ChannelData[ Ch2 ][ fWriteIndex ].UnPackSize := fCellCount;
                  ChannelData[ Ch2 ][ fWriteIndex ].Data := Pack;
                finally
                  ChannelData[ Ch2 ][ fWriteIndex ].WR.EndWrite;
                end;
              end;

          fWriteIndex := (fWriteIndex + 1) mod ChannelDataSize;
          if fWriteIndex = 0
            then fWriteLap := not fWriteLap;
        end;
      finally
        ReleaseMutex( AcquiringMutex );
        RTEnabled := false;
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
        if assigned( Channel1 ) then VirtualUnlock( Channel1, BufferSize );
        if assigned( Channel2 ) then VirtualUnlock( Channel2, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Channel1 ) then FreeMem( Channel1 );
        if assigned( Channel2 ) then FreeMem( Channel2 );
        if assigned( FinalChannel1 ) then FreeMem( FinalChannel1 );
        if assigned( FinalChannel2 ) then FreeMem( FinalChannel2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
      end;
end;

var
  i : integer;

procedure TRTThread.Datel_RT_AdquireTwoChannel(Port: integer; SampleRate: cardinal; ClockSource: boolean; Ch1, Ch2: byte);
var
  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  Done          : cardinal;
  Channel1,
  Channel2      : PWords;
  FinalChannel1,
  FinalChannel2 : PBytes;
  BufferSize,
  MemSize       : cardinal;
  AzCod,
  ElCod         : cardinal;
  ElAng,
  AzAng         : single;
  Start         : LongWord;
  Pack          : pointer;
  PackSize      : integer;
  MinAng        : single;
  AntennaVelocity,
  SleepTime     : cardinal;
  i             : integer;
  Starting,
  Finishing,
  Freq          : int64;
begin
  RTEnabled := true;
  Channel1 := nil;
  Channel2 := nil;
  BufferSize := fCellCount * SizeOf( word );
  MemSize := fCellCount * SizeOf( cardinal );
  QueryPerformanceFrequency(Freq);
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);

        DMASize[0] := 2 * BufferSize;
        DMASize[1] := DMASize[0];
        //Allocate Memory
        GetMem( Channel1, BufferSize );
        GetMem( Channel2, BufferSize );
        GetMem( FinalChannel1, fCellCount );
        GetMem( FinalChannel2, fCellCount );

        //Protect Memory
        VirtualLock( Channel1, BufferSize );
        VirtualLock( Channel2, BufferSize );

        Set_PT_Sample_Count(PCI416F2, 2 * fCellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        AzCod := Deva.Read_Encoder_X;
        ElCod := Deva.Read_Encoder_Y;

        //Acquire Start
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

        while (not Terminated) and (RTEnabled) do
        begin
          try
            if (Ch1 <> 0) and (Ch2 <> 0)
              then MinAng := MinorAngle( theConfiguration.Ch1Beam, theConfiguration.Ch2Beam )
              else if Ch1 <> 0
                     then
                       begin
                         if Ch1 = 1
                           then MinAng := theConfiguration.Ch1Beam
                           else MinAng := theConfiguration.Ch2Beam;
                       end
                     else
                       begin
                         if Ch2 = 1
                           then MinAng := theConfiguration.Ch1Beam
                           else MinAng := theConfiguration.Ch2Beam;
                       end;
            MinAng := MinAng * 4096 / 360;
            if Snapshot.Velocity_Az > Snapshot.Velocity_El
              then AntennaVelocity := Abs(Snapshot.Velocity_Az)
              else AntennaVelocity := Abs(Snapshot.Velocity_El);
            if AntennaVelocity > 0
              then if Snapshot.Trigger_Rate > 0
                     then SleepTime := Trunc( (1000 * ((MinAng/AntennaVelocity)-(1/Snapshot.Trigger_Rate))) * SleepPercent / 100 )
                     else SleepTime := Trunc( (1000 * (MinAng/AntennaVelocity)) * SleepPercent / 100 )
              else SleepTime := MaxSleepTime;

            if SleepTime > MaximumSleepTime
              then SleepTime := MaxSleepTime;
            if SleepTime < MinimalSleepTime
              then SleepTime := MinimalSleepTime;
          except
            SleepTime := MinimalSleepTime;
          end;
          if Ch1 <> 0 then FillChar( Channel1^, BufferSize, 0 );
          if Ch2 <> 0 then FillChar( Channel2^, BufferSize, 0 );
          try
            //Check for data ready
            QueryPerformanceCounter( Starting );
            repeat
              Pci416_DMA_Status(PCI416F2, Done);
              QueryPerformanceCounter( Finishing );
              if (Done = 0) and ((Finishing-Starting)/Freq >= MaxRTLoopTime)
                then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
            until Done <> 0;
            Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
            Sleep( SleepTime );
          except
            RTEnabled := false;
            Continue;
          end;

          if PT_FIFO_Full(PCI416F2) = 0
            then
              begin
                AzAng := (AzCod * 360) / 4096;
                ElAng := (ElCod * 360) / 4096;

                // Reload DMA
                DMA_Tmp_Bank := DMA_Wrk_Bank;
                DMA_Wrk_Bank := DMA_Acq_Bank;
                DMA_Acq_Bank := DMA_Tmp_Bank;
                Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                  DMASize[DMA_Acq_Bank],
                                  DMAHnd[DMA_Acq_Bank]);
                Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

                AzCod := Deva.Read_Encoder_X;
                ElCod := Deva.Read_Encoder_Y;

                // Process data
                Datel.ScatterTwoData( Channel1, Channel2, fCellCount, DMAHnd[DMA_Wrk_Bank] );
                //Channel 1
                if Ch1 <> 0
                  then
                    begin
                      if Ch1 = 1
                        then ConvertToDB( Channel1, theCalibration.Calibration1 )
                        else ConvertToDB( Channel1, theCalibration.Calibration2 );
                      if theConfiguration.RTSpeckleRemove
                        then RemoveSpeckles( Channel1 );
                      PWord_To_PBytes( Channel1, FinalChannel1, fCellCount );
                      //Compacto los datos para trasmitir menos datos
                      ZCompress( FinalChannel1, fCellCount, Pack, PackSize );

                      ChannelData[ Ch1 ][ fWriteIndex ].WR.BeginWrite;
                      try
                        if Assigned( ChannelData[ Ch1 ][ fWriteIndex ].Data )
                          then FreeMem( ChannelData[ Ch1 ][ fWriteIndex ].Data );
                        ChannelData[ Ch1 ][ fWriteIndex ].Az := AzAng;
                        ChannelData[ Ch1 ][ fWriteIndex ].El := ElAng;
                        ChannelData[ Ch1 ][ fWriteIndex ].CellSize := Snapshot^.Sample_Cell_Size;
                        ChannelData[ Ch1 ][ fWriteIndex ].PackSize := PackSize;
                        ChannelData[ Ch1 ][ fWriteIndex ].UnPackSize := fCellCount;
                        ChannelData[ Ch1 ][ fWriteIndex ].Data := Pack;
                      finally
                        ChannelData[ Ch1 ][ fWriteIndex ].WR.EndWrite;
                      end;
                    end;
                //Channel 2
                if Ch2 <> 0
                  then
                    begin
                      if Ch2 = 1
                        then ConvertToDB( Channel2, theCalibration.Calibration1 )
                        else ConvertToDB( Channel2, theCalibration.Calibration2 );
                      if theConfiguration.RTSpeckleRemove
                        then RemoveSpeckles( Channel2 );
                      PWord_To_PBytes( Channel2, FinalChannel2, fCellCount );
                      //Compacto los datos para trasmitir menos datos
                      ZCompress( FinalChannel2, fCellCount, Pack, PackSize );
                      ChannelData[ Ch2 ][ fWriteIndex ].WR.BeginWrite;
                      try
                        if Assigned( ChannelData[ Ch2 ][ fWriteIndex ].Data )
                          then FreeMem( ChannelData[ Ch2 ][ fWriteIndex ].Data );
                        ChannelData[ Ch2 ][ fWriteIndex ].Az := AzAng;
                        ChannelData[ Ch2 ][ fWriteIndex ].El := ElAng;
                        ChannelData[ Ch2 ][ fWriteIndex ].CellSize := Snapshot^.Sample_Cell_Size;
                        ChannelData[ Ch2 ][ fWriteIndex ].PackSize := PackSize;
                        ChannelData[ Ch2 ][ fWriteIndex ].UnPackSize := fCellCount;
                        ChannelData[ Ch2 ][ fWriteIndex ].Data := Pack;
                      finally
                        ChannelData[ Ch2 ][ fWriteIndex ].WR.EndWrite;
                      end;
                    end;
                fWriteIndex := (fWriteIndex + 1) mod ChannelDataSize;
                if fWriteIndex = 0
                  then fWriteLap := not fWriteLap;
              end
            else
              begin
                // Discard data
                Reset_PT_FIFOs(PCI416F2);
                // Reload DMA
                Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                  DMASize[DMA_Acq_Bank],
                                  DMAHnd[DMA_Acq_Bank]);
                Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
              end;
        end;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);
        RTEnabled := false;
        if assigned( Channel1 ) then VirtualUnlock( Channel1, BufferSize );
        if assigned( Channel2 ) then VirtualUnlock( Channel2, BufferSize );
        if assigned( Channel1 ) then FreeMem( Channel1 );
        if assigned( Channel2 ) then FreeMem( Channel2 );
        if assigned( FinalChannel1 ) then FreeMem( FinalChannel1 );
        if assigned( FinalChannel2 ) then FreeMem( FinalChannel2 );
        ReleaseMutex( AcquiringMutex );
      end;
end;

initialization

  for i := 0 to ChannelDataSize-1 do
  begin
    ChannelData[ 1 ][i].WR := TMultiReadExclusiveWriteSynchronizer.Create;
    ChannelData[ 2 ][i].WR := TMultiReadExclusiveWriteSynchronizer.Create;
  end;

finalization

  for i := 0 to ChannelDataSize-1 do
  begin
    if Assigned( ChannelData[1][ i ].Data )
      then FreeMem( ChannelData[1][i].Data );
    if Assigned( ChannelData[2][ i ].Data )
      then FreeMem( ChannelData[2][i].Data );
    ChannelData[ 1 ][i].WR.Free;
    ChannelData[ 2 ][i].WR.Free;
  end;

end.
