Unit Datel;

interface

uses
  Windows, ElbrusTypes,
  SysUtils, Pci416, Rda_TLB, Constants;

type
  ELoopTimeError = class(Exception);
  EAcqError = class(Exception);

  TBufferStruct = record
    Handle : HGLOBAL;
    Buffer : pointer;
  end;
  TBufferAcq = array[ boolean ] of TBufferStruct;

const
  AcquiringMutexName = 'PCI1714_Acquiring_Mutex';
  AcquirePriority = THREAD_PRIORITY_TIME_CRITICAL;
  MaxLoopTime = 10 * 1000; //ms
  PermanentEchoFilterOrder = 3;
  MaxTimeElapsed  = 120000;

// PCI416
procedure Init_PCI416;
procedure Done_PCI416;

// Acquisition
function Set_Sample_Rate ( Rate : cardinal ) : cardinal;
function Set_Trigger_Rate( Rate : cardinal ) : cardinal;

//Video
function Acquire_Single_Frames( FrameCount : cardinal;
                                CellCount  : cardinal;
                                out Ch1, Ch2 ) : boolean;

procedure Acquire_Az_SectorsOneChannel( SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch          : PDWords;
                                        LoopTimeout : double );

procedure Acquire_Az_SectorsOneChannelFilter( SectorCount : cardinal;
                                              CellCount   : cardinal;
                                              Ch          : PDWords;
                                              Filter      : PDWords;
                                              B0, B1, B2, A1, A2 : double;
                                              LoopTimeout : double );

procedure Acquire_Az_SectorsTwoChannels( SectorCount : cardinal;
                                         CellCount   : cardinal;
                                         Ch1, Ch2    : PDWords;
                                         LoopTimeout : double );

procedure Acquire_Az_SectorsTwoChannelsFilter( SectorCount : cardinal;
                                               CellCount   : cardinal;
                                               Ch1, Ch2    : PDWords;
                                               Filter1,
                                               Filter2     : PDWords;
                                               Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 : double;
                                               Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 : double;
                                               LoopTimeout : double );

procedure Acquire_El_SectorsOneChannel( SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch          : PDWords;
                                        Template    : ITemplate;
                                        Filter      : PDWords;
                                        LoopTimeout : double );

procedure Acquire_El_SectorsTwoChannels( SectorCount : cardinal;
                                         Start       : integer;
                                         Finish      : integer;
                                         CellCount   : cardinal;
                                         Ch1, Ch2    : PDWords;
                                         Template    : ITemplate;
                                         Filter1,
                                         Filter2     : PDWords;
                                         LoopTimeout : double );

function Acquire_FramesOneChannel( FrameCount  : cardinal;
                                   ShotCount   : cardinal;
                                   CellCount   : cardinal;
                                   Ch          : PDWords;
                                   LoopTimeout : double ) : boolean;

function Acquire_FramesTwoChannels( FrameCount  : cardinal;
                                    ShotCount   : cardinal;
                                    CellCount   : cardinal;
                                    Ch1, Ch2    : PDWords;
                                    LoopTimeout : double ) : boolean;

procedure AddFilterValue( PreviousFilter, ThreeShots : PDWords; Index : byte; FT : PDWords; CellCount : cardinal; B0, B1, B2, A1, A2 : double );
procedure ScatterTwoData( Ch1, Ch2 : pointer; Count : integer; Source : pointer );
procedure ScatterData( Ch1, Ch2 : pointer; Count : integer; Source : pointer );
procedure PWord_To_PBytes( Ch1 : PWords; Channel : PBytes; Count : integer );
procedure MoveWords( Source, Target : PWords; Count : integer );

var
  PCI416F2 : integer = -1;
  Pci416_Board_Count : word;
  Caps     : TGetCaps;
  ADMStats : TADM_Stats;

implementation

uses
  Deva, Advantech, Elbrus, Angle;

const
  MissLimit       = 1000;
  MaxLoopCount    = 100000;

{$DEFINE GO_TO_SLEEP}  

// Private procedures & functions

procedure Clear_All;
begin
  if PCI416F2 >= 0
    then
      begin
        Set_PT_Command_Reg(PCI416F2, 0);
        Set_PT_Convert_Enable(PCI416F2, 0);
        Reset_PT_Fifos(PCI416F2);
        Enable_PT_DMA_Logic(PCI416F2, 0);
        Enable_DMA_Transfers(PCI416F2, 0);
        Set_PT_Pretrigger(PCI416F2, 0);
      end;
end;

procedure AverageData( Source   : PDWords;
                       Dest     : PDWords;
                       Count    : integer;
                       Divider  : cardinal );
asm
//      mov     ecx, Count
        jecxz   @@Exit
        push    esi
        push    edi
        push    ebx
        push    ebp
        mov     esi, Source
        mov     edi, Dest
        mov     ebx, Divider
        xor     ebp, ebp
@@Loop:
        xor     edx, edx
        mov     eax, [esi + ebp]
        div     ebx
        mov     [edi + ebp], eax
        add     ebp, 4
        dec     ecx
        jnz     @@Loop
        pop     ebp
        pop     ebx
        pop     edi
        pop     esi
@@Exit:
end;

procedure AddData( Ch1, Ch2 : pointer;     // Sum X
                   Count    : integer;
                   Source   : pointer );
asm
//      mov     ecx, Count
        jecxz   @@Exit
        push    esi
        push    edi
        mov     esi, Ch1
        mov     edi, Ch2
        mov     ebp, Source
@@Loop:
        movzx   eax, word ptr [ebp + 0]
        movzx   edx, word ptr [ebp + 2]
        add     [esi], eax
        add     [edi], edx
        add     ebp, 4
        add     esi, 4
        add     edi, 4
        dec     ecx
        jnz     @@Loop
        pop     edi
        pop     esi
@@Exit:
end;

procedure AddData2( Ch1, Ch2 : pointer;    // Sum X^2
                    Count    : integer;
                    Source   : pointer );
asm
//      mov     ecx, Count
        jecxz   @@Exit
        push    esi
        push    edi
        push    ebp
        mov     esi, Ch1
        mov     edi, Ch2
        mov     ebp, Source
@@Loop:
        movzx   eax, word ptr [ebp]
        mul     eax
        add     ebp, 2
        add     [esi], eax
        movzx   eax, word ptr [ebp]
        mul     eax
        add     ebp, 2
        add     [edi], eax
        add     esi, 4
        add     edi, 4
        dec     ecx
        jnz     @@Loop
        pop     ebp
        pop     edi
        pop     esi
@@Exit:
end;

procedure ScatterData( Ch1, Ch2 : pointer;
                       Count    : integer;
                       Source   : pointer );
asm
//      mov     ecx, Count
        jecxz   @@Exit
        push    esi
        push    ebx
        mov     esi, Source
        mov     ebx, Ch1
//      mov     edx, Ch2
@@Loop:
        mov     eax, [esi]
        mov     word ptr [ebx], ax
        shr     eax, 16
        mov     word ptr [edx], ax
        add     ebx, 2
        add     edx, 2
        add     esi, 4
        dec     ecx
        jnz     @@Loop
        pop     ebx
        pop     esi
@@Exit:
end;

procedure ScatterTwoData( Ch1, Ch2 : pointer;
                          Count    : integer;
                          Source   : pointer );
asm
        jecxz   @@Exit
        push    esi
        push    ebx
        mov     esi, Source
@@Loop:
        mov     ebx, [esi]
        mov     word ptr [eax], bx
        shr     ebx, 16
        mov     word ptr [edx], bx
        add     eax, 2
        add     edx, 2
        add     esi, 4
        dec     ecx
        jnz     @@Loop
        pop     ebx
        pop     esi
@@Exit:
end;

procedure PWord_To_PBytes( Ch1 : PWords; Channel : PBytes; Count : integer );
asm
        jecxz   @@Exit
        push    ebx
@@Loop:
        mov     bx, word ptr [eax]
        mov     [edx], bl

        add     edx, 1
        add     eax, 2
        dec     ecx
        jnz     @@Loop
        pop     ebx
@@Exit:
end;

procedure MoveWords( Source, Target : PWords; Count : integer );
asm
        jecxz   @@Exit
        push    ebx
        shr     ecx, 1
@@Loop:
        mov     bx, word ptr [eax]
        mov     [edx], bx

        add     edx, 2
        add     eax, 2
        dec     ecx
        jnz     @@Loop
        pop     ebx
@@Exit:
end;

// Public procedures & functions

function Set_Sample_Rate( Rate : cardinal ) : cardinal;
begin
  if (PCI416F2 >= 0) and
     (Set_PT_AD_Clock_Rate(PCI416F2, Rate) = 0)
    then Result := Rate
    else Result := 0;
end;

function Set_Trigger_Rate( Rate : cardinal ) : cardinal;
var
  TriggerRate : double;
begin
  if PCI416F2 >= 0
    then
      begin
        if Rate > 0
          then
            begin
              Set_PT_Trigger_Rate(PCI416F2, Rate, TriggerRate);
              Rate := Trunc( TriggerRate ); 
            end
          else Reset_PT_Trigger_Timer(PCI416F2);
        Result := Rate;
      end
    else Result := 0;
end;

//Video

function Acquire_Single_Frames( FrameCount : cardinal;
                                CellCount  : cardinal;
                                out Ch1, Ch2 ) : boolean;
var
  BufSize    : TDMASizes;
  DMAHandle  : PWordArray;
  Done       : cardinal;
  Starting,
  Finishing,
  Freq       : int64;
begin
  Result := false;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);

        BufSize[0] := 2 * FrameCount * CellCount * sizeof(word);
        BufSize[1] := 0;

        Set_PT_Sample_Count(PCI416F2, 2 * CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        Pci416_Setup_DMA(PCI416F2, DMA_SINGLE, BufSize, DMAHandle);

        Set_PT_Led(PCI416F2, 1);
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
        QueryPerformanceFrequency(Freq);
        QueryPerformanceCounter(Starting);
        repeat
          {$IFDEF GO_TO_SLEEP}
          Sleep(0);
          {$ENDIF}
          Pci416_DMA_Status(PCI416F2, Done);
          QueryPerformanceCounter( Finishing );
          if (Done = 0) and ((Finishing-Starting)/Freq >= MaxLoopTime)
            then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
        until Done <> 0;

        Result := PT_FIFO_Full(PCI416F2) = 0;
        if Result  // Process data
          then ScatterData(@Ch1, @Ch2, FrameCount * CellCount, DMAHandle);
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);
        ReleaseMutex(AcquiringMutex);
      end;
end;

procedure AddDataChannel( Ch : pointer; Count : integer; Source : pointer );
var
  i : word;
begin
  for i := 0 to Count-1 do
    PDWords(CH)^[i] := PDWords(CH)^[i] + (PWords(Source)^[i]);
end;

procedure Acquire_Az_SectorsOneChannel( SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch          : PDWords;
                                        LoopTimeout : double );
var
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  ShotCount     : cardinal;
  Sum           : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : cardinal;
  Done,
  MissCount     : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck

  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  CurrentFrame  : cardinal;
  Start         : LongWord;
  Starting,
  Finishing,
  Freq          : int64;
begin
  Sum := nil;
  MissCount := 0;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);
        //Allocate Memory
        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        GetMem( Sum, BufferSize );

        //Protect Memory
        VirtualLock( Sum, BufferSize );

        Set_PT_Sample_Count(PCI416F2, CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);

        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        //Comienzo a adquirir
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

        QueryPerformanceFrequency(Freq);
        repeat  // PPI loop
          ShotCount := 0;
          FillChar( Sum, BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              repeat
                Pci416_DMA_Status(PCI416F2, Done);
                QueryPerformanceCounter( Finishing );
                if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                  then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
              until Done <> 0;
              //Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);

              if PT_FIFO_Full(PCI416F2) = 0
                then
                  begin
                    // Reload DMA
                    DMA_Tmp_Bank := DMA_Wrk_Bank;
                    DMA_Wrk_Bank := DMA_Acq_Bank;
                    DMA_Acq_Bank := DMA_Tmp_Bank;
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

                    // Process data
                    AddDataChannel( Sum, CellCount, DMAHnd[DMA_Wrk_Bank] );

                    inc(ShotCount);
                    if ShotCount > Max_ShotCount
                      then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
                  end
                else
                  begin
                    // Discard data
                    Reset_PT_FIFOs(PCI416F2);
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
                    inc(MissCount);
                    if MissCount > MissLimit
                      then raise EAcqError.Create('Too many missed samples');
                  end;
            end;
          Index := CurrentSector * CellCount;
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch )
                  then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        until CurrentSector = FirstSector;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( Sum ) then FreeMem( Sum );
        ReleaseMutex( AcquiringMutex );
        SetThreadPriority( Thread, SavedPriority );
      end;
end;

procedure Acquire_Az_SectorsOneChannelFilter( SectorCount : cardinal;
                                              CellCount   : cardinal;
                                              Ch          : PDWords;
                                              Filter      : PDWords;
                                              B0, B1, B2, A1, A2 : double;
                                              LoopTimeout : double );
var
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  ShotCount     : cardinal;
  Sum           : pointer;      // Sum X
  FT            : PDWords;
  FB            : PDWords;
  FN            : PDWords;
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;
  Done,
  MissCount     : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck

  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  CurrentFrame  : cardinal;
  Start         : LongWord;
  Starting,
  Finishing,
  Freq          : int64;

  ShotIndex : byte;
  TotalShots : cardinal;
begin
  Sum := nil;
  MissCount := 0;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);
        //Allocate Memory
        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        GetMem( Sum, BufferSize );
        GetMem( FT, BufferSize );
        GetMem( FB, FilterSize );
        GetMem( FN, FilterSize );

        //Protect Memory
        VirtualLock( Sum, BufferSize );
        VirtualLock( FT, BufferSize );
        VirtualLock( FB, FilterSize );
        VirtualLock( FN, FilterSize );

        Set_PT_Sample_Count(PCI416F2, CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);

        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        //Comienzo a adquirir
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

        TotalShots := 0;
        QueryPerformanceFrequency(Freq);
        repeat  // PPI loop
          ShotCount := 0;
          FillChar( Sum, BufferSize, 0 );
          FillChar( FT^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              repeat
                Pci416_DMA_Status(PCI416F2, Done);
                QueryPerformanceCounter( Finishing );
                if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                  then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
              until Done <> 0;
              //Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);

              if PT_FIFO_Full(PCI416F2) = 0
                then
                  begin
                    // Reload DMA
                    DMA_Tmp_Bank := DMA_Wrk_Bank;
                    DMA_Wrk_Bank := DMA_Acq_Bank;
                    DMA_Acq_Bank := DMA_Tmp_Bank;
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

                    // Process data
                    AddDataChannel( Sum, CellCount, DMAHnd[DMA_Wrk_Bank] );
                    if Assigned( Filter )
                      then
                        begin
                          ShotIndex := TotalShots mod PermanentEchoFilterOrder;
                          FillChar( FB^[ShotIndex * CellCount], BufferSize, 0 );
                          FillChar( FN^[ShotIndex * CellCount], BufferSize, 0 );
                          AddDataChannel( @FB^[ShotIndex * CellCount], CellCount, DMAHnd[DMA_Wrk_Bank] );

                          //si mas de tres rayos calculo y sumo en Filter
                          if TotalShots >= PermanentEchoFilterOrder-1
                            then AddFilterValue( FN, FB, ShotIndex, FT, CellCount, B0, B1, B2, A1, A2 );
                        end;
                    Inc( TotalShots );

                    inc(ShotCount);
                    if ShotCount > Max_ShotCount
                      then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
                  end
                else
                  begin
                    // Discard data
                    Reset_PT_FIFOs(PCI416F2);
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
                    inc(MissCount);
                    if MissCount > MissLimit
                      then raise EAcqError.Create('Too many missed samples');
                  end;
            end;
          Index := CurrentSector * CellCount;
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch )
                  then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
                // Filter Mean
                if Assigned( Filter ) and (ShotCount > PermanentEchoFilterOrder-1)
                  then
                    if TotalShots > ShotCount
                      then AverageData( FT, @Filter^[Index], CellCount, ShotCount )
                      else AverageData( FT, @Filter^[Index], CellCount, ShotCount-(PermanentEchoFilterOrder-1) );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        until CurrentSector = FirstSector;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( FT )  then VirtualUnlock( FT, BufferSize );
        if assigned( FB )  then VirtualUnlock( FB, FilterSize );

        if assigned( Sum ) then FreeMem( Sum );
        if assigned( FT )  then FreeMem( FT );
        if assigned( FB )  then FreeMem( FB );
        if assigned( FN )  then FreeMem( FN );

        ReleaseMutex( AcquiringMutex );
        SetThreadPriority( Thread, SavedPriority );
      end;
end;

procedure Acquire_Az_SectorsTwoChannels( SectorCount : cardinal;
                                         CellCount   : cardinal;
                                         Ch1, Ch2    : PDWords;
                                         LoopTimeout : double );
var
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  ShotCount     : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : cardinal;
  Done,
  MissCount     : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck

  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  CurrentFrame  : cardinal;
  Start         : LongWord;
  Starting,
  Finishing,
  Freq          : int64;
begin
  Sum_1 := nil;
  Sum_2 := nil;

  MissCount := 0;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);
        //Allocate Memory
        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        GetMem( Sum_1, BufferSize );
        GetMem( Sum_2, BufferSize );

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );

        Set_PT_Sample_Count(PCI416F2, 2 * CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);

        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        //Comienzo a adquirir
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

        QueryPerformanceFrequency(Freq);
        repeat  // PPI loop
          ShotCount := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              repeat
                Pci416_DMA_Status(PCI416F2, Done);
                QueryPerformanceCounter( Finishing );
                if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                  then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
              until Done <> 0;
              //Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);

              if PT_FIFO_Full(PCI416F2) = 0
                then
                  begin
                    // Reload DMA
                    DMA_Tmp_Bank := DMA_Wrk_Bank;
                    DMA_Wrk_Bank := DMA_Acq_Bank;
                    DMA_Acq_Bank := DMA_Tmp_Bank;
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

                    // Process data
                    AddData (Sum_1, Sum_2, CellCount, DMAHnd[DMA_Wrk_Bank]);

                    inc(ShotCount);
                    if ShotCount > Max_ShotCount
                      then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
                  end
                else
                  begin
                    // Discard data
                    Reset_PT_FIFOs(PCI416F2);
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
                    inc(MissCount);
                    if MissCount > MissLimit
                      then raise EAcqError.Create('Too many missed samples');
                  end;
            end;
          Index := CurrentSector * CellCount;
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch1 )
                  then AverageData( Sum_1, @Ch1^[Index], CellCount, ShotCount );
                if Assigned( Ch2 )
                  then AverageData( Sum_2, @Ch2^[Index], CellCount, ShotCount );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        until CurrentSector = FirstSector;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );

        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        ReleaseMutex( AcquiringMutex );
        SetThreadPriority( Thread, SavedPriority );
      end;
end;

procedure Acquire_Az_SectorsTwoChannelsFilter( SectorCount : cardinal;
                                               CellCount   : cardinal;
                                               Ch1, Ch2    : PDWords;
                                               Filter1,
                                               Filter2     : PDWords;
                                               Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 : double;
                                               Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 : double;
                                               LoopTimeout : double );
var
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  ShotCount     : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;
  Done,
  MissCount     : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck

  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  CurrentFrame  : cardinal;
  Start         : LongWord;
  Starting,
  Finishing,
  Freq          : int64;

  //Filter
  FT1, FT2      : PDWords;
  FB1, FB2      : PDWords;
  FN1, FN2      : PDWords;

  ShotIndex : byte;
  TotalShots : cardinal;
begin
  FB1  := nil;
  FT1  := nil;
  FB2  := nil;
  FT2  := nil;
  FN1  := nil;
  FN2  := nil;
  
  Sum_1 := nil;
  Sum_2 := nil;

  MissCount := 0;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);
        //Allocate Memory
        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        GetMem( Sum_1, BufferSize );
        GetMem( Sum_2, BufferSize );
        GetMem( FT1, BufferSize );
        GetMem( FT2, BufferSize );
        GetMem( FB1, FilterSize );
        GetMem( FB2, FilterSize );
        GetMem( FN1, FilterSize );
        GetMem( FN2, FilterSize );

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );
        VirtualLock( FT1, BufferSize );
        VirtualLock( FB1, FilterSize );
        VirtualLock( FT2, BufferSize );
        VirtualLock( FB2, FilterSize );
        VirtualLock( FN1, FilterSize );
        VirtualLock( FN2, FilterSize );

        Set_PT_Sample_Count(PCI416F2, 2 * CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);

        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        //Comienzo a adquirir
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

        TotalShots := 0;
        QueryPerformanceFrequency(Freq);
        repeat  // PPI loop
          ShotCount := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          FillChar( FT1^,   BufferSize, 0 );
          FillChar( FT2^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              repeat
                Pci416_DMA_Status(PCI416F2, Done);
                QueryPerformanceCounter( Finishing );
                if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                  then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
              until Done <> 0;
              //Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);

              if PT_FIFO_Full(PCI416F2) = 0
                then
                  begin
                    // Reload DMA
                    DMA_Tmp_Bank := DMA_Wrk_Bank;
                    DMA_Wrk_Bank := DMA_Acq_Bank;
                    DMA_Acq_Bank := DMA_Tmp_Bank;
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);

                    // Process data
                    AddData (Sum_1, Sum_2, CellCount, DMAHnd[DMA_Wrk_Bank]);
                    //Filter
                    if Assigned( Filter1 ) or Assigned( Filter2 )
                      then
                        begin
                          ShotIndex := TotalShots mod PermanentEchoFilterOrder;
                          FillChar( FB1^[ShotIndex * CellCount], BufferSize, 0 );
                          FillChar( FB2^[ShotIndex * CellCount], BufferSize, 0 );
                          FillChar( FN1^[ShotIndex * CellCount], BufferSize, 0 );
                          FillChar( FN2^[ShotIndex * CellCount], BufferSize, 0 );
                          AddData (@FB1^[ShotIndex * CellCount], @FB2^[ShotIndex * CellCount], CellCount, DMAHnd[DMA_Wrk_Bank]);

                          //si mas de tres rayos calculo y sumo en Filter
                          if TotalShots >= PermanentEchoFilterOrder-1
                            then
                              begin
                                AddFilterValue( FN1, FB1, ShotIndex, FT1, CellCount, Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 );
                                AddFilterValue( FN2, FB2, ShotIndex, FT2, CellCount, Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 );
                              end;
                        end;
                    Inc( TotalShots );

                    inc(ShotCount);
                    if ShotCount > Max_ShotCount
                      then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
                  end
                else
                  begin
                    // Discard data
                    Reset_PT_FIFOs(PCI416F2);
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    //Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
                    inc(MissCount);
                    if MissCount > MissLimit
                      then raise EAcqError.Create('Too many missed samples');
                  end;
            end;
          Index := CurrentSector * CellCount;
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch1 )
                  then AverageData( Sum_1, @Ch1^[Index], CellCount, ShotCount );
                if Assigned( Ch2 )
                  then AverageData( Sum_2, @Ch2^[Index], CellCount, ShotCount );
                // Filter Mean
                if Assigned( Filter1 ) and (ShotCount > PermanentEchoFilterOrder-1)
                  then
                    if TotalShots > ShotCount
                      then AverageData( FT1, @Filter1^[Index], CellCount, ShotCount )
                      else AverageData( FT1, @Filter1^[Index], CellCount, ShotCount-(PermanentEchoFilterOrder-1) );

                if Assigned( Filter2 ) and (ShotCount > PermanentEchoFilterOrder-1)
                  then
                    if TotalShots > ShotCount
                      then AverageData( FT2, @Filter2^[Index], CellCount, ShotCount )
                      else AverageData( FT2, @Filter2^[Index], CellCount, ShotCount-(PermanentEchoFilterOrder-1) );

              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div AntennaMaxValue;
        until CurrentSector = FirstSector;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( FT1 ) then VirtualUnlock( FT1, BufferSize );
        if assigned( FB1 ) then VirtualUnlock( FB1, FilterSize );
        if assigned( FT2 ) then VirtualUnlock( FT2, BufferSize );
        if assigned( FB2 ) then VirtualUnlock( FB2, FilterSize );

        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( FT1 ) then FreeMem( FT1 );
        if assigned( FB1 ) then FreeMem( FB1 );
        if assigned( FT2 ) then FreeMem( FT2 );
        if assigned( FB2 ) then FreeMem( FB2 );
        if assigned( FN1 ) then FreeMem( FN1 );
        if assigned( FN2 ) then FreeMem( FN2 );
        ReleaseMutex( AcquiringMutex );
        SetThreadPriority( Thread, SavedPriority );
      end;
end;

procedure Acquire_El_SectorsTwoChannels( SectorCount : cardinal;
                                         Start       : integer;
                                         Finish      : integer;
                                         CellCount   : cardinal;
                                         Ch1, Ch2    : PDWords;
                                         Template    : ITemplate;
                                         Filter1,
                                         Filter2     : PDWords;
                                         LoopTimeout : double );
var
  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  Done,
  MissCount     : cardinal;
  CurrentSector : integer;
  ShotCount     : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  CurrentFrame  : cardinal;
  Starting,
  Finishing,
  Freq            : int64;
begin
  Sum_1 := nil;
  Sum_2 := nil;
  MissCount := 0;
  StartSector  := (Start  * integer(SectorCount)) div AntennaMaxValue;
  FinishSector := (Finish * integer(SectorCount)) div AntennaMaxValue;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);

        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        //Allocate Memory
        GetMem( Sum_1, BufferSize );
        GetMem( Sum_2, BufferSize );

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );

        Set_PT_Sample_Count(PCI416F2, 2 * CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        SetThreadPriority(Thread, AcquirePriority);

        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        // Wait for sector start
        CurrentSector := Deva.Read_Encoder_Int_Y;
        while CurrentSector >= Deva.Read_Encoder_Int_Y do Sleep(0);
        CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div AntennaMaxValue;

        //Comienzo a adquirir
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
        QueryPerformanceFrequency(Freq);

        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div AntennaMaxValue) = integer(CurrentSector) do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              repeat
                Pci416_DMA_Status(PCI416F2, Done);
                QueryPerformanceCounter( Finishing );
                if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                  then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
              until Done <> 0;

              DMA_Tmp_Bank := DMA_Wrk_Bank;
              DMA_Wrk_Bank := DMA_Acq_Bank;
              DMA_Acq_Bank := DMA_Tmp_Bank;
              if PT_FIFO_Full(PCI416F2) = 0
                then
                  begin
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    // Process data
                    AddData (Sum_1, Sum_2, CellCount, DMAHnd[DMA_Wrk_Bank]);
                    inc(ShotCount);
                    if ShotCount > Max_ShotCount
                      then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
                  end
                else
                  begin
                    // Discard data
                    Reset_PT_FIFOs(PCI416F2);
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    inc(MissCount);
                    if MissCount > MissLimit
                      then raise EAcqError.Create('Too many missed samples');
                  end;
            end;
          Index := (CurrentSector - StartSector) * integer(CellCount);
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch1 )
                  then AverageData( Sum_1, @Ch1^[Index], CellCount, ShotCount );
                if Assigned( Ch2 )
                  then AverageData( Sum_2, @Ch2^[Index], CellCount, ShotCount );
              end;
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div AntennaMaxValue;
          //Lazo de la antena...
          SetDACodeAz(round(SnapShot.Position_Loop_Az_K * Distance(SnapShot.SP_Position_Az, Deva.Read_Encoder_X)))
        until CurrentSector >= FinishSector;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        ReleaseMutex(AcquiringMutex);
        SetThreadPriority(Thread, SavedPriority);
      end;
end;

procedure Acquire_El_SectorsOneChannel( SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch          : PDWords;
                                        Template    : ITemplate;
                                        Filter      : PDWords;
                                        LoopTimeout : double );
var
  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  Done,
  MissCount     : cardinal;
  CurrentSector : integer;
  ShotCount     : cardinal;
  Sum           : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  CurrentFrame  : cardinal;
  Starting,
  Finishing,
  Freq            : int64;
begin
  Sum := nil;
  MissCount := 0;
  StartSector  := (Start  * integer(SectorCount)) div AntennaMaxValue;
  FinishSector := (Finish * integer(SectorCount)) div AntennaMaxValue;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);

        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        //Allocate Memory
        GetMem( Sum, BufferSize );

        //Protect Memory
        VirtualLock( Sum, BufferSize );

        Set_PT_Sample_Count(PCI416F2, CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        SetThreadPriority(Thread, AcquirePriority);

        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        // Wait for sector start
        CurrentSector := Deva.Read_Encoder_Int_Y;
        while CurrentSector >= Deva.Read_Encoder_Int_Y do Sleep(0);
        CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div AntennaMaxValue;

        //Comienzo a adquirir
        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
        QueryPerformanceFrequency(Freq);

        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum^, BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div AntennaMaxValue) = integer(CurrentSector) do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              repeat
                Pci416_DMA_Status(PCI416F2, Done);
                QueryPerformanceCounter( Finishing );
                if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                  then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
              until Done <> 0;

              DMA_Tmp_Bank := DMA_Wrk_Bank;
              DMA_Wrk_Bank := DMA_Acq_Bank;
              DMA_Acq_Bank := DMA_Tmp_Bank;
              if PT_FIFO_Full(PCI416F2) = 0
                then
                  begin
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    // Process data
                    AddDataChannel( Sum, CellCount, DMAHnd[DMA_Wrk_Bank] );

                    inc(ShotCount);
                    if ShotCount > Max_ShotCount
                      then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
                  end
                else
                  begin
                    // Discard data
                    Reset_PT_FIFOs(PCI416F2);
                    // Reload DMA
                    Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                      DMASize[DMA_Acq_Bank],
                                      DMAHnd[DMA_Acq_Bank]);
                    inc(MissCount);
                    if MissCount > MissLimit
                      then raise EAcqError.Create('Too many missed samples');
                  end;
            end;
          Index := (CurrentSector - StartSector) * integer(CellCount);
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch )
                  then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
              end;
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div AntennaMaxValue;
          //Lazo de la antena...
          SetDACodeAz(round(SnapShot.Position_Loop_Az_K * Distance(SnapShot.SP_Position_Az, Deva.Read_Encoder_X)))
        until CurrentSector >= FinishSector;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( Sum ) then FreeMem( Sum );
        ReleaseMutex(AcquiringMutex);
        SetThreadPriority(Thread, SavedPriority);
      end;
end;

function Acquire_FramesTwoChannels( FrameCount  : cardinal;
                                    ShotCount   : cardinal;
                                    CellCount   : cardinal;
                                    Ch1, Ch2    : PDWords;
                                    LoopTimeout : double ) : boolean;
var
  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  Done,
  MissCount     : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : integer;
  CurrentFrame  : cardinal;
  Starting,
  Finishing,
  Freq          : int64;
begin
  Result := false;
  Sum_1 := nil;
  Sum_2 := nil;
  MissCount := 0;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);

        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        //Allocate Memory
        GetMem(Sum_1, BufferSize);
        GetMem(Sum_2, BufferSize);

        //Protect Memory
        VirtualLock(Sum_1, BufferSize);
        VirtualLock(Sum_2, BufferSize);

        Set_PT_Sample_Count(PCI416F2, 2 * CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
        QueryPerformanceFrequency(Freq);

        for CurrentFrame := 0 to FrameCount - 1 do
          begin
            FillChar(Sum_1^, BufferSize, 0);
            FillChar(Sum_2^, BufferSize, 0);
            Index := 0;
            while Index < ShotCount do
              begin // Frame loop
                QueryPerformanceCounter(Starting);
                repeat
                  Pci416_DMA_Status(PCI416F2, Done);
                  QueryPerformanceCounter( Finishing );
                  if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                    then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
                until Done <> 0;

                DMA_Tmp_Bank := DMA_Wrk_Bank;
                DMA_Wrk_Bank := DMA_Acq_Bank;
                DMA_Acq_Bank := DMA_Tmp_Bank;
                if PT_FIFO_Full(PCI416F2) = 0
                  then
                    begin
                      // Reload DMA
                      Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                        DMASize[DMA_Acq_Bank],
                                        DMAHnd[DMA_Acq_Bank]);
                      // Process data
                      AddData (Sum_1, Sum_2, CellCount, DMAHnd[DMA_Wrk_Bank]);
                      inc(Index);
                    end
                  else
                    begin
                      // Discard data
                      Reset_PT_FIFOs(PCI416F2);
                      // Reload DMA
                      Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                        DMASize[DMA_Acq_Bank],
                                        DMAHnd[DMA_Acq_Bank]);
                      inc(MissCount);
                      if MissCount > MissLimit
                        then raise EAcqError.Create('Too many missed samples');
                    end;
              end;
            Index := CurrentFrame * CellCount;
            if ShotCount > 0
              then
                begin
                  // Mean
                  if Assigned( Ch1 )
                    then AverageData( Sum_1, @Ch1^[Index], CellCount, ShotCount );
                  if Assigned( Ch2 )
                    then AverageData( Sum_2, @Ch2^[Index], CellCount, ShotCount );
                end;
          end;
        Result := true;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        ReleaseMutex(AcquiringMutex);
        SetThreadPriority(Thread, SavedPriority);
      end
    else raise EAcqError.Create( 'Ya estan adquiriendo' );
end;

function Acquire_FramesOneChannel( FrameCount  : cardinal;
                                   ShotCount   : cardinal;
                                   CellCount   : cardinal;
                                   Ch          : PDWords;
                                   LoopTimeout : double ) : boolean;
var
  DMASize       : TDMASizes;
  DMAHnd        : TDMAHandles;
  DMA_Acq_Bank  : integer;
  DMA_Wrk_Bank  : integer;
  DMA_Tmp_Bank  : integer;
  Done,
  MissCount     : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Sum           : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : integer;
  CurrentFrame  : cardinal;
  Starting,
  Finishing,
  Freq          : int64;
begin
  Result := false;
  Sum := nil;
  MissCount := 0;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        Set_PT_Led(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_EXTERNAL);
        Reset_PT_FIFOs(PCI416F2);

        DMASize[0] := BufferSize;
        DMASize[1] := DMASize[0];
        //Allocate Memory
        GetMem(Sum, BufferSize);

        //Protect Memory
        VirtualLock(Sum, BufferSize);

        ADMStats.scan_select := 1;
        ADMStats.autoincr_scan := 1;

        ADMStats.scan_select := 0;
        ADMStats.autoincr_scan := 0;

        Set_PT_Sample_Count(PCI416F2, CellCount);
        Set_PT_AD_Channel(PCI416F2, ADMStats.channel_scan);
        Set_PT_Scan_Select(PCI416F2, ADMStats.scan_select);
        Set_PT_Auto_Increment(PCI416F2, ADMStats.autoincr_scan);
        Set_PT_Marker_Select(PCI416F2, 0);

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        DMA_Acq_Bank := 0;
        DMA_Wrk_Bank := 1;
        Pci416_Setup_DMA(PCI416F2, DMA_DOUBLE, DMASize, DMAHnd[DMA_Acq_Bank]);

        Set_PT_Convert_Enable(PCI416F2, 1);
        Set_PT_Trigger_Mode(PCI416F2, T_INTERNAL);
        QueryPerformanceFrequency(Freq);

        for CurrentFrame := 0 to FrameCount - 1 do
          begin
            FillChar(Sum^, BufferSize, 0);
            Index := 0;
            while Index < ShotCount do
              begin // Frame loop
                QueryPerformanceCounter(Starting);
                repeat
                  Pci416_DMA_Status(PCI416F2, Done);
                  QueryPerformanceCounter( Finishing );
                  if (Done = 0) and ((Finishing-Starting)/Freq >= LoopTimeout)
                    then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000/Freq ) + ' ms');
                until Done <> 0;

                DMA_Tmp_Bank := DMA_Wrk_Bank;
                DMA_Wrk_Bank := DMA_Acq_Bank;
                DMA_Acq_Bank := DMA_Tmp_Bank;
                if PT_FIFO_Full(PCI416F2) = 0
                  then
                    begin
                      // Reload DMA
                      Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                        DMASize[DMA_Acq_Bank],
                                        DMAHnd[DMA_Acq_Bank]);
                      // Process data
                      AddDataChannel( Sum, CellCount, DMAHnd[DMA_Wrk_Bank] );

                      inc(Index);
                    end
                  else
                    begin
                      // Discard data
                      Reset_PT_FIFOs(PCI416F2);
                      // Reload DMA
                      Pci416_Reload_DMA(PCI416F2, DMA_Acq_Bank,
                                        DMASize[DMA_Acq_Bank],
                                        DMAHnd[DMA_Acq_Bank]);
                      inc(MissCount);
                      if MissCount > MissLimit
                        then raise EAcqError.Create('Too many missed samples');
                    end;
              end;
            Index := CurrentFrame * CellCount;
            if ShotCount > 0
              then
                begin
                  // Mean
                  if Assigned( Ch )
                    then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
                end;
          end;
        Result := true;
      finally
        Set_PT_Convert_Enable(PCI416F2, 0);
        Pci416_Stop_DMA(PCI416F2, Done);
        Set_PT_Led(PCI416F2, 0);
        Pci416_Close_DMABuf_Hndl(PCI416F2);

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( Sum ) then FreeMem( Sum );
        ReleaseMutex(AcquiringMutex);
        SetThreadPriority(Thread, SavedPriority);
      end
    else raise EAcqError.Create( 'Ya estan adquiriendo' );
end;

procedure AddFilterValue( PreviousFilter, ThreeShots : PDWords; Index : byte; FT : PDWords; CellCount : cardinal; B0, B1, B2, A1, A2 : double );
var
  X, X_1, X_2 : cardinal;
  i : cardinal;
  FRes : cardinal;
begin
  case Index of
   0 : begin
         X   := 0;
         X_1 := CellCount + CellCount;
         X_2 := CellCount;
       end;
   1 : begin
         X   := CellCount;
         X_1 := 0;
         X_2 := CellCount + CellCount;
       end;
   2 : begin
         X   := CellCount + CellCount;
         X_1 := CellCount;
         X_2 := 0;
       end;
  end;
  for i := 0 to CellCount-1 do
  begin
    PreviousFilter[X+i] := Abs(Trunc(B0*ThreeShots[X+i] + B1*ThreeShots[X_1+i] + B2*ThreeShots[X_2+i] - A1*PreviousFilter[X_1+i] - A2*PreviousFilter[X_2+i]));
    FT[ i ] := FT[ i ] + PreviousFilter[X+i];
  end;
end;

// Initialization & finalization

procedure Init_PCI416;
var
  I : integer;
begin
  AcquiringMutex := CreateMutex(nil, false, AcquiringMutexName);
  Pci416_Init(Pci416_Board_Count);
  I := 0;
  while I < Pci416_Board_Count do
    begin
      Get_ADM_Stats(I, ADMStats);
      if ADMStats.Model = ord('F')
        then Break;
      inc(I);
    end;
  if I < Pci416_Board_Count
    then
      begin
        PCI416F2 := I;
        Pci416_GetCaps(PCI416F2, sizeof(Caps), Caps);
        Clear_All;
      end;
end;

procedure Done_PCI416;
begin
  pci416_close(0);
  CloseHandle(AcquiringMutex);
end;

end.

