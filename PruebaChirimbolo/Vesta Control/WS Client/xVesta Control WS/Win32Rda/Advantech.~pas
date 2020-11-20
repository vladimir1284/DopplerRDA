unit Advantech;

interface

uses
  Windows, ElbrusTypes, SysUtils, Driver;

type
  ELoopTimeError = class(Exception);
  EAcqError = class(Exception);
  ECardError = class(Exception);

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

  CFG_DeviceNumber = 0;
  CFG_BoardID = 1;
  CFG_SwitchID = 2;

type
  TDevList     = array of PT_DevList;
  TIntArray    = array of integer;
  TFeatureList = array of DEVFEATURES;
  TEntry =
    record
      CardIndex : integer;
      CardBoardId : cardinal;
      CardSwitchId : cardinal;
      Entry : cardinal;
      DefaultValue : integer;
    end;
  TSignalMap = array of TEntry;
  TDigitalInputs  = array [DIRange] of TEntry;
  TDigitalOutputs = array [DORange] of TEntry;
  TAnalogInputs   = array [AIRange] of TEntry;
  TAnalogOutputs  = array [AORange] of TEntry;

var
  Adv_Dev_Count   : smallint;
  Adv_Dev_Handle  : TIntArray;
  Adv_Dev_Feature : TFeatureList;
  Adv_Dev_Address : TIntArray;
  Adv_Dev_List    : TDevList;
  Adv_Dev_BoardIDs    : array of cardinal;
  Adv_Dev_PropertyIDs : array of cardinal;

  CardDigitalInputs  : TSignalMap;
  CardDigitalOutputs : TSignalMap;
  CardAnalogInputs   : TSignalMap;
  CardAnalogOutputs  : TSignalMap;

var
  PCL812PG : integer = -1;
  PCL836   : integer = -1;
  PCL728   : integer = -1;
  PCI1720  : integer = -1;
  PCI1780  : integer = -1;
  PCI1730  : integer = -1;
  PCI1733  : integer = -1;
  PCI1710  : integer = -1;
  PCI1714  : integer = -1;
  Watchdog : integer = -1;
  USB4750  : integer = -1;
  USB4711  : integer = -1;
  USB4711B : integer = -1;
  USB4761  : integer = -1;
  USB4751  : integer = -1;
  USB4751L : integer = -1;

//General
procedure LoadInputSignals(SignalMap : TSignalMap; SignalNames : TStringList; SignalSection : string);
procedure MatchInputSignals(SignalMap : TSignalMap);

// Drivers
procedure Init_Devices;
procedure Done_Devices;

// Frequency Generators
procedure Set_FOut_Timer ( Timer : FOutRange; Code : word );
procedure Set_FOut_Timers( Codes : array of word );

// Digital Input
function  Get_Digital_Input : DigitalInput;
function  Get_Digital_Input_Bit( Bit : DIRange ) : boolean;

// Digital Output
procedure Set_Digital_Output    ( Bits : DigitalOutput );
procedure Set_Digital_Output_Bit( Bit  : DORange; State : boolean );

// Analog Input
function  Get_Analog_Input : AnalogInput;
function  Get_Analog_Input_Voltage_Channel( Channel : integer; Binary : AnalogSample; Gain : GainCode ) : single;
procedure Set_Analog_Input_Gains  ( Gains   : AnalogGains );

// Analog Output
procedure Set_Analog_Output        ( Codes : AnalogOutput );
procedure Set_Analog_Output_Channel( Channel : AORange; Code : AnalogCode );

// Counters
procedure Set_Counter_Timer ( Timer : CounterRange; Code : word );
procedure Set_Counter_Timers( Codes : array of word );

// Frequency Generators
function  Set_Trigger_Rate( Rate : cardinal ) : cardinal; //en Hz
function  Set_Sample_Rate( Rate : cardinal ) : cardinal;

//Video
procedure Acquire_Az_SectorsOneChannel( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch          : PDWords;
                                        LoopTimeout : double );

procedure Acquire_Az_SectorsOneChannelFilter( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch          : PDWords;
                                        Filter      : PDWords;
                                        B0, B1, B2, A1, A2 : double;
                                        LoopTimeout : double );

procedure Acquire_Az_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        LoopTimeout : double );

procedure Acquire_Az_SectorsTwoChannelsFilter( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        Filter1,
                                        Filter2     : PDWords;
                                        Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 : double;
                                        Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 : double;
                                        LoopTimeout : double );

procedure Acquire_El_SectorsOneChannel( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       Start       : integer;
                                       Finish      : integer;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch          : PDWords;
                                       LoopTimeout : double );

procedure Acquire_El_SectorsOneChannelFilter( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       Start       : integer;
                                       Finish      : integer;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch          : PDWords;
                                       Filter      : PDWords;
                                       B0, B1, B2, A1, A2 : double;
                                       LoopTimeout : double );

procedure Acquire_El_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        LoopTimeout : double );

procedure Acquire_El_SectorsTwoChannelsFilter( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        Filter1,
                                        Filter2     : PDWords;
                                        Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 : double;
                                        Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 : double;
                                        LoopTimeout : double );

function Acquire_FramesOneChannel( Port : integer;
                                   SampleRate  : cardinal;
                                   ClockSource : boolean;
                                   TriggerSource : integer;
                                   FrameCount  : cardinal;
                                   ShotCount   : cardinal;
                                   CellCount   : cardinal;
                                   Ch          : PDWords;
                                   LoopTimeout : double ) : boolean;

function Acquire_FramesTwoChannels( Port : integer;
                                    SampleRate  : cardinal;
                                    ClockSource : boolean;
                                    TriggerSource : integer;
                                    FrameCount  : cardinal;
                                    ShotCount   : cardinal;
                                    CellCount   : cardinal;
                                    Ch1, Ch2    : PDWords;
                                    LoopTimeout : double ) : boolean;

function Acquire_Single_Frame( CellCount  : cardinal; out Ch1, Ch2 ) : boolean;

procedure AddFilterValue( PreviousFilter, ThreeShots : PDWords; Index : byte; FT : PDWords; CellCount : cardinal; B0, B1, B2, A1, A2 : double );
procedure ScatterTwoData( Ch1, Ch2 : pointer; Count : integer; Source : pointer );
procedure PWord_To_PBytes( Ch1 : PWords; Channel : PBytes; Count : integer );
procedure MoveWords( Source, Target : PWords; Count : integer );

var
  AcquiringMutex : integer = 0;

implementation

uses
  Registry,
  Deva,
  Math, Parameters, EventLog, Constants, LogTools, IniFiles,
  Config;

const
  MissLimit       = 1000;
  MaxTimeElapsed  = 120000;
  MinimalFrequencyInterval = 10;
  NoData = 255;

type
  TCardinalBytes = packed record
  case cardinal of
    0 : (A : cardinal);
    1 : (B0, B1, B2, B3 : byte);
  end;

//General

procedure LoadInputSignals(SignalMap : TSignalMap; SignalNames : TStringList; SignalSection : string);
var
  Setup : TIniFile;
  i : integer;
  Code : string;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( SignalMap ) to High( SignalMap ) do
    begin
      SignalMap[i].CardIndex    := NoData;
      SignalMap[i].CardBoardId  := 0;
      SignalMap[i].CardSwitchId := NoData;
      SignalMap[i].Entry        := NoData;
      SignalMap[i].DefaultValue := -1;

      Code := Setup.ReadString( SignalSection, SignalNames[i], '255,255,255' );
      if Code <> ''
        then
          begin
            while Pos( ' ', Code ) > 0 do
              Delete( Code, Pos( ' ', Code ), 1 );
            try
              Code := Code + ',';
              SignalMap[i].CardBoardId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
              Delete(Code, 1, Pos( ',', Code ));
              SignalMap[i].CardSwitchId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
              Delete(Code, 1, Pos( ',', Code ));
              SignalMap[i].Entry := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
              Delete(Code, 1, Pos( ',', Code ));
              if Code <> ''
                then SignalMap[i].DefaultValue := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
            except
              SignalMap[i].CardIndex    := NoData;
              SignalMap[i].CardBoardId  := 0;
              SignalMap[i].CardSwitchId := NoData;
              SignalMap[i].Entry        := NoData;
              SignalMap[i].DefaultValue := -1;
            end;
          end;
    end;
  finally
    Setup.free;
  end;
end;

procedure MatchInputSignals(SignalMap : TSignalMap);
var
  i, j : integer;
begin
  for i := Low( SignalMap ) to High( SignalMap ) do
    for j := 0 to Adv_Dev_Count-1 do
      if (SignalMap[i].CardBoardId = Adv_Dev_BoardIDs[j]) and (SignalMap[i].CardSwitchId = Adv_Dev_PropertyIDs[j])
        then
          begin
            SignalMap[i].CardIndex := j;
            break;
          end;
end;


// Frequency Generators

procedure Set_FOut_Timer( Timer : FOutRange; Code : word );
var
  WritePortByte : PT_WritePortByte;
begin
  if PCL836 >= 0
    then
      begin
        WritePortByte.port := Adv_Dev_Address[PCL836] + 0 + 4 * (Timer div 3) + Timer mod 3;
        WritePortByte.ByteData := Code and $00FF;
        DRV_WritePortByte(Adv_Dev_Handle[PCL836], WritePortByte);
        WritePortByte.ByteData := Code shr 8;
        DRV_WritePortByte(Adv_Dev_Handle[PCL836], WritePortByte);
      end;
end;

procedure Set_FOut_Timers( Codes : array of word );
var
  I : integer;
begin
  for I := Low(Codes) to High(Codes) do
    Set_FOut_Timer(I, Codes[I]);
end;

// Digital Input
function Get_Digital_Input : DigitalInput;
var
 i : integer;
begin
  result := 0;
  for i := Low(DIRange) to High(DIRange) do
    result := result or (cardinal(Get_Digital_Input_Bit(i)) shl i);
end;

function Get_Digital_Input_Bit( Bit : DIRange ) : boolean;
var
  DioReadBit : PT_DioReadBit;
  Rst        : smallint;
  Index      : byte;
begin
  if CardDigitalInputs[ Bit ].CardIndex <> NoData
    then
      begin
        Index := CardDigitalInputs[ Bit ].Entry;
        DioReadBit.state := @Rst;
        DioReadBit.bit   := Index mod 8;
        case CardDigitalInputs[ Bit ].CardBoardId of
         BD_PCI1730: DioReadBit.port  := (Index div 8)+2;
        else DioReadBit.port  := Index div 8;
        end;
        DRV_DioReadBit(Adv_Dev_Handle[CardDigitalInputs[ Bit ].CardIndex], DioReadBit);
        Result := boolean(Rst);
      end
    else if CardDigitalInputs[ Bit ].DefaultValue <> -1
           then result := CardDigitalInputs[ Bit ].DefaultValue <> 0
           else result := false;
end;

// Digital Output
procedure Set_Digital_Output( Bits : DigitalOutput );
var
  i : integer;
begin
  for i := Low( DORange ) to High( DORange ) do
    Set_Digital_Output_Bit( i, (Bits and (cardinal(1) shl i)) <> 0  );
end;

procedure Set_Digital_Output_Bit( Bit : DORange; State : boolean );
var
  DioWriteBit : PT_DioWriteBit;
  Index      : byte;
begin
  if CardDigitalOutputs[ Bit ].CardIndex <> NoData
    then
      begin
        Index := CardDigitalOutputs[ Bit ].Entry;
        DioWriteBit.bit   := Index mod 8;

        if CardDigitalOutputs[ Bit ].DefaultValue = -1
          then DioWriteBit.state := smallint(State)
          else DioWriteBit.state := CardDigitalOutputs[ Bit ].DefaultValue;

        case CardDigitalOutputs[ Bit ].CardBoardId of
         BD_PCI1730: DioWriteBit.port  := (Index div 8)+2;
        else DioWriteBit.port  := Index div 8;
        end;
        DRV_DioWriteBit(Adv_Dev_Handle[ CardDigitalOutputs[ Bit ].CardIndex ], DioWriteBit);
      end;
end;

// Analog Input

function Get_Analog_Input : AnalogInput;
var
  MAIBinaryIn : PT_MAIBinaryIn;
  Binaries : AnalogInput;
  i : integer;
  UsingCard : boolean;
begin
  UsingCard := false;
  for i := Low(AIRange) to High(AIRange) do
    UsingCard := UsingCard or (CardAnalogInputs[ i ].CardIndex <> NoData);

  if UsingCard
    then
      begin
        MAIBinaryIn.NumChan      := 16;
        MAIBinaryIn.StartChan    := 0;
        MAIBinaryIn.TrigMode     := Internal;
        MAIBinaryIn.ReadingArray := @Binaries;
        DRV_MAIBinaryIn(Adv_Dev_Handle[CardAnalogInputs[ 0 ].CardIndex], MAIBinaryIn);
      end;

  for i := Low(AIRange) to High(AIRange) do
    if CardAnalogInputs[ i ].CardIndex = NoData
      then if CardAnalogInputs[ i ].DefaultValue <> -1
             then Binaries[ CardAnalogInputs[ i ].Entry ] := CardAnalogInputs[ i ].DefaultValue
             else Binaries[ CardAnalogInputs[ i ].Entry ] := 0;

  for i := Low(AIRange) to High(AIRange) do
    result[i] := Binaries[ CardAnalogInputs[ i ].Entry ];
end;

function Get_Analog_Input_Voltage_Channel( Channel : integer; Binary : AnalogSample; Gain : GainCode ) : single;
var
  AIScale : PT_AIScale;
begin
  if CardAnalogInputs[ Channel ].CardIndex <> NoData
    then
      begin
        AIScale.reading  := Binary;
        AIScale.MaxCount := 4096;
        AIScale.offset   := 2048;
        AIScale.voltage  := @Result;

        if CardAnalogInputs[ Channel ].CardIndex = PCL812PG
          then
            case Gain of
             Gain_1   : AIScale.MaxVolt := 10.0;
             Gain_2   : AIScale.MaxVolt := 5.0;
             Gain_4   : AIScale.MaxVolt := 2.5;
             Gain_8   : AIScale.MaxVolt := 1.25;
             Gain_16  : AIScale.MaxVolt := 0.625;
            end;

        if CardAnalogInputs[ Channel ].CardIndex = USB4711
          then
            case Gain of
             Gain_1   : AIScale.MaxVolt := 5.0;
             Gain_2   : AIScale.MaxVolt := 2.5;
             Gain_4   : AIScale.MaxVolt := 1.25;
             Gain_8   : AIScale.MaxVolt := 0.625;
             Gain_0_5 : AIScale.MaxVolt := 10.0;
            end;

        if CardAnalogInputs[ Channel ].CardIndex = PCI1710
          then
            case Gain of
             Gain_1   : AIScale.MaxVolt := 5.0;
             Gain_2   : AIScale.MaxVolt := 2.5;
             Gain_4   : AIScale.MaxVolt := 1.25;
             Gain_8   : AIScale.MaxVolt := 0.625;
             Gain_0_5 : AIScale.MaxVolt := 10.0;
            end;

        if CardAnalogInputs[ Channel ].CardIndex = PCI1714
          then
            case Gain of
             Gain_1   : AIScale.MaxVolt := 5.0;
             Gain_2   : AIScale.MaxVolt := 2.5;
             Gain_4   : AIScale.MaxVolt := 1.0;
             Gain_8   : AIScale.MaxVolt := 0.5;
            end;

        DRV_AIScale( Adv_Dev_Handle[CardAnalogInputs[ Channel ].CardIndex], AIScale );
      end;
end;

procedure Set_Analog_Input_Gains( Gains : AnalogGains );
var
  MAIConfig : PT_MAIConfig;
  i : integer;
  GainValues: AnalogGains;
begin
  if CardAnalogInputs[ 0 ].CardIndex <> NoData
    then
      begin
        for i := Low(AIRange) to High(AIRange) do
          GainValues[i] := Gains[ CardAnalogInputs[ i ].Entry ];
        MAIConfig.NumChan   := 16;
        MAIConfig.StartChan := 0;
        MAIConfig.GainArray := @GainValues;
        DRV_MAIConfig(Adv_Dev_Handle[CardAnalogInputs[ 0 ].CardIndex], MAIConfig);
      end;
end;

// Analog Output
procedure Set_Analog_Output( Codes : AnalogOutput );
var
  i : integer;
begin
  for i := Low(AORange) to High(AORange) do
    Set_Analog_Output_Channel( i, Codes[i] );
end;

procedure Set_Analog_Output_Channel( Channel : AORange; Code : AnalogCode );
var
  BinaryOut : PT_AOBinaryOut;
begin
  if CardAnalogOutputs[ Channel ].CardIndex <> NoData
    then
      begin
        BinaryOut.chan := CardAnalogOutputs[ Channel ].Entry;
        if CardAnalogOutputs[ Channel ].DefaultValue = -1
         then BinaryOut.BinData := Code
         else BinaryOut.BinData := CardAnalogOutputs[ Channel ].DefaultValue;
        DRV_AOBinaryOut(Adv_Dev_Handle[CardAnalogOutputs[ Channel ].CardIndex], BinaryOut);
      end;
end;

// Frequency Generators

function Set_Trigger_Rate( Rate : cardinal ) : cardinal;
var
  FreqOutStart : PT_FreqOutStart;
  i, j         : byte;
  Diference    : integer;

  Divisor : integer;
begin
  if (PCI1780 >= 0) and (Rate > 0)
      then
        begin
          DRV_FreqOutReset( Adv_Dev_Handle[PCI1780], 1 );
          for i := 1 to 16 do
            for j := 0 to 4 do
            begin
              Diference := Abs(Trunc((1000*Power(10,j)/i) - Rate));
              if (Diference <= MinimalFrequencyInterval) and (Diference >= 0)
                then
                  begin
                    FreqOutStart.usChannel := 1;
                    FreqOutStart.usDivider  := i;
                    case j of
                      0: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_1KHZ;
                      1: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_10KHZ;
                      2: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_100KHZ;
                      3: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_1MHZ;
                      4: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_10MHZ;
                    end;
                    DRV_FreqOutStart( Adv_Dev_Handle[PCI1780], FreqOutStart );
                    result := Trunc( Trunc(1000*Power(10,j)) / FreqOutStart.usDivider );
                    exit;
                  end;
            end;
          raise Exception.Create( 'Frecuencia no permitida' );
        end
      else if (PCL836 >= 0) and (Rate > 0)
            then
              begin
                Divisor := 10000000 div Rate;
                if (Abs((10000000/Divisor)-Rate) <= MinimalFrequencyInterval) and (Abs((10000000/Divisor)-Rate) >= 0)
                  then
                    begin
                      Set_FOut_Timer( 1, Divisor );
                      result := 10000000 div Divisor;
                    end
                  else raise Exception.Create( 'Frecuencia no permitida' );
              end
            else result := Rate;
end;

function Set_Sample_Rate( Rate : cardinal ) : cardinal;
var
  FreqOutStart : PT_FreqOutStart;
  i, j         : byte;
  Diference    : integer;

  Divisor : integer;  
begin
  if (PCI1780 >= 0) and (Rate > 0)
    then
      begin
        DRV_FreqOutReset( Adv_Dev_Handle[PCI1780], 0 );
        for i := 1 to 16 do
          for j := 0 to 4 do
          begin
            Diference := Abs(Trunc(1000*(Power(10,j)/i) - Rate));
            if (Diference <= MinimalFrequencyInterval) and (Diference >= 0)
              then
                begin
                  FreqOutStart.usChannel := 0;
                  FreqOutStart.usDivider  := i;
                  case j of
                    0: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_1KHZ;
                    1: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_10KHZ;
                    2: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_100KHZ;
                    3: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_1MHZ;
                    4: FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_10MHZ;
                  end;
                  DRV_FreqOutStart( Adv_Dev_Handle[PCI1780], FreqOutStart );
                  result := Trunc( Trunc(1000*Power(10,j)) / FreqOutStart.usDivider );
                  exit;
                end;
          end;
        raise Exception.Create( 'Frecuencia no permitida' );
      end
    else if (PCL836 >= 0) and (Rate > 0)
          then
            begin
              Divisor := 10000000 div Rate;
              if (Abs(Rate-(10000000/Divisor)) <= MinimalFrequencyInterval) and (Abs(Rate-(10000000/Divisor)) >= 0)
                then
                  begin
                    Set_FOut_Timer( 0, Divisor );
                    result := 10000000 div Divisor;
                  end
                else raise Exception.Create( 'Frecuencia no permitida' );
            end
          else result := Rate;
end;

// Counters

procedure Set_Counter_Timer( Timer : CounterRange; Code : word );
var
  //pci1714
  FreqOutStart      : PT_FreqOutStart;
  CounterConfig     : PT_CounterConfig;
  CounterEventStart : PT_CounterEventStart;
  usMode            : integer;
  //plc836
  WritePortByte : PT_WritePortByte;
begin
  if PCI1780 >= 0
    then
      begin
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], Timer );
        usMode := MODE_F;
        CounterConfig.usCounter := Timer;
        CounterConfig.usInitValue := Code * 10;
        CounterConfig.usCountMode := usMode;
        CounterConfig.usCountDirect := PA_MODE_COUNT_DOWN;
        CounterConfig.usCountEdge := PA_MODE_COUNT_RISE_EDGE;
        CounterConfig.usOutputEnable := PA_MODE_ENABLE_OUTPUT;
        CounterConfig.usOutputMode := PA_MODE_ACT_HIGH_TC_PULSE;
        CounterConfig.usClkSrc := PA_MODE_COUNT_SRC_FOUT_2;
        CounterConfig.usGateSrc := PA_MODE_GATE_SRC_GATE_N;
        CounterConfig.usGatePolarity := PA_MODE_GATE_POSITIVE;
        DRV_CounterConfig( Adv_Dev_Handle[PCI1780], CounterConfig );
        CounterEventStart.counter := Timer;
        DRV_CounterEventStart( Adv_Dev_Handle[PCI1780], CounterEventStart);
      end
    else if (PCL836 >= 0) and (Timer < 6)
          then
            begin
              WritePortByte.port := Adv_Dev_Address[PCL836] + 8 + 4 * (Timer div 3) + Timer mod 3;
              WritePortByte.ByteData := Code and $00FF;
              DRV_WritePortByte(Adv_Dev_Handle[PCL836], WritePortByte);
              WritePortByte.ByteData := Code shr 8;
              DRV_WritePortByte(Adv_Dev_Handle[PCL836], WritePortByte);
            end;
end;

procedure Set_Counter_Timers( Codes : array of word );
var
  I : integer;
begin
  for I := Low(Codes) to High(Codes) do
    Set_Counter_Timer(I, Codes[I]);
end;

//Video

procedure Clear_All;
begin
  if PCI1714 >= 0
    then
      begin
      end;
end;

procedure ScatterData( Ch1, Ch2 : pointer;
                       Count    : integer;
                       Source   : pointer );
asm
        jecxz   @@Exit
        push    esi
        push    ebx
        mov     esi, Source
        mov     ebx, Ch1
        mov     edx, Ch2
@@Loop:
        mov     eax, [esi]
        cmp     ax, $87FF
        jg      @@Ch1Standard
        jmp     @@Channel2
@@Ch1Standard:
        and     ax, $7FF
        mov     word ptr [ebx], ax
@@Channel2:
        shr     eax, 16
        cmp     ax, $87FF
        jg      @@Ch2Standard
        jmp     @@Continue
@@Ch2Standard:
        and     ax, $7FF
        mov     word ptr [edx], ax
@@Continue:
        add     ebx, 2
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
        cmp     bx, $87FF
        jg      @@Ch1Standard
        jmp     @@Channel2
@@Ch1Standard:
        and     bx, $7FF
        mov     [eax], bx
@@Channel2:
        shr     ebx, 16
        cmp     bx, $87FF
        jg      @@Ch2Standard
        jmp     @@Continue
@@Ch2Standard:
        and     bx, $7FF
        mov     [edx], bx
@@Continue:
        add     eax, 2
        add     edx, 2
        add     esi, 4
        dec     ecx
        jnz     @@Loop
        pop     ebx
        pop     esi
@@Exit:
end;

procedure AddDataTwoChannles( Ch1, Ch2 : pointer;     // Sum X
                              Count    : integer;
                              Source   : pointer );
asm
        jecxz   @@Exit
        push    esi
        push    ebx
        mov     esi, Source
@@Loop:
        movzx   ebx, word ptr [esi + 0]
        cmp     ebx, $87FF
        jg      @@Ch1Standard
        jmp     @@Channel2
@@Ch1Standard:
        and     ebx, $7FF
        add     [eax], ebx

@@Channel2:
        movzx   ebx, word ptr [esi + 2]
        cmp     ebx, $87FF
        jg      @@Ch2Standard
        jmp     @@Continue
@@Ch2Standard:
        and     ebx, $7FF
        add     [edx], ebx
@@Continue:
        add     eax, 4
        add     edx, 4
        add     esi, 4
        dec     ecx
        jnz     @@Loop
        pop     ebx
        pop     esi
@@Exit:
end;

procedure AddDataOneChannel( Source, Ch1 : pointer; Count : integer );
asm
        jecxz   @@Exit
        push    ebx
@@Loop:
        movzx   ebx, word ptr [eax]
        cmp     ebx, $87FF
        jg      @@SampleStandard
        jmp     @@Continue
@@SampleStandard:
        and     ebx, $7FF
        add     [edx], ebx

@@Continue:
        add     eax, 2
        add     edx, 4
        dec     ecx
        jnz     @@Loop
        pop     ebx
@@Exit:
end;

procedure AddData2TwoChannels( Ch1, Ch2 : pointer;    // Sum X^2
                               Count    : integer;
                               Source   : pointer );
asm
        jecxz   @@Exit
        push    esi
        push    edi
        push    ebp
        mov     esi, Ch1
        mov     edi, Ch2
        mov     ebp, Source
@@Loop:
        movzx   eax, word ptr [ebp]
        cmp     eax, $87FF
        jg      @@Ch1Standard
        jmp     @@Channel2
@@Ch1Standard:
        and     eax, $7FF
        mul     eax
        add     [esi], eax
@@Channel2:
        add     ebp, 2
        movzx   eax, word ptr [ebp]
        cmp     eax, $87FF
        jg      @@Ch2Standard
        jmp     @@Continue
@@Ch2Standard:
        and     eax, $7FF
        mul     eax
        add     [edi], eax
@@Continue:
        add     ebp, 2
        add     esi, 4
        add     edi, 4
        dec     ecx
        jnz     @@Loop
        pop     ebp
        pop     edi
        pop     esi
@@Exit:
end;

procedure AddData2OneChannel( Ch1, Ch2 : pointer;    // Sum X^2
                              Count    : integer;
                              Source   : pointer );
asm
        jecxz   @@Exit
        push    esi
        push    ebp
        mov     esi, Ch1
        mov     ebp, Source
@@Loop:
        movzx   eax, word ptr [ebp]
        cmp     eax, $87FF
        jg      @@SampleStandard
        jmp     @@Continue
@@SampleStandard:
        and     eax, $7FF
        mul     eax
        add     [esi], eax
@@Continue:
        add     ebp, 2
        add     esi, 4
        dec     ecx
        jnz     @@Loop
        pop     ebp
        pop     esi
@@Exit:
end;

procedure AverageData( Source   : PDWords;
                       Dest     : PDWords;
                       Count    : integer;
                       Divider  : cardinal );
asm
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

procedure AddDataChannel( Ch : pointer; Count : integer; Source : pointer );
var
  i : word;
begin
  for i := 0 to Count-1 do
    if PWords(Source)^[i] > $87FF
      then PDWords(CH)^[i] := PDWords(CH)^[i] + (PWords(Source)^[i] and $7FF);
end;


{
procedure AverageData( Source   : PDWords; Dest : PDWords; Count : integer; Divider : cardinal );
var
  i : cardinal;
begin
  for i := 0 to Count-1 do
  try
    Dest[i] := Dest[i] div Divider;
  except
    Dest[i] := 0;
  end;
end;
}

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

function Acquire_FramesTwoChannels( Port : integer;
                                    SampleRate  : cardinal;
                                    ClockSource : boolean;
                                    TriggerSource : integer;
                                    FrameCount  : cardinal;
                                    ShotCount   : cardinal;
                                    CellCount   : cardinal;
                                    Ch1, Ch2    : PDWords;
                                    LoopTimeout : double ) : boolean;
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : integer;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;
begin
  Result := false;
  Sum_1 := nil;
  Sum_2 := nil;
  Acq := false;
  Wrk := true;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem(Sum_1, BufferSize);
        GetMem(Sum_2, BufferSize);
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock(Sum_1, BufferSize);
        VirtualLock(Sum_2, BufferSize);
        BufferAcq[Acq].Buffer  := GlobalLock( BufferAcq[Acq].Handle );
        BufferAcq[Wrk].Buffer  := GlobalLock( BufferAcq[Wrk].Handle );

        //Check DMA Status
        FAICheck.ActiveBuf := @ActiveBuf;
        FAICheck.stopped   := @Stopped;
        FAICheck.retrieved := @Retrieved;
        FAICheck.overrun   := @Overrun;
        FAICheck.HalfReady := @HalfReady;

        //Initialize DMA
        if TriggerSource < 2
         then FAIDmaExStart.TrigSrc := TriggerSource
         else FAIDmaExStart.TrigSrc := 0;
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
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        for CurrentFrame := 0 to FrameCount - 1 do
          begin
            FillChar(Sum_1^, BufferSize, 0);
            FillChar(Sum_2^, BufferSize, 0);
            Index := 0;
            while Index < ShotCount do
              begin // Frame loop
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
                except
                  DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
                  raise;
                end;

                //Reinicio la adquisicion...
                DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
                Acq := not Acq;
                Wrk := not Wrk;
                FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
                DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

                // Process data
                AddDataTwoChannles ( Sum_1, Sum_2, CellCount, BufferAcq[Wrk].Buffer );
                inc(Index);
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
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end
    else raise EAcqError.Create( 'Ya estan adquiriendo' );
end;

function Acquire_FramesOneChannel( Port : integer;
                                   SampleRate  : cardinal;
                                   ClockSource : boolean;
                                   TriggerSource : integer;
                                   FrameCount  : cardinal;
                                   ShotCount   : cardinal;
                                   CellCount   : cardinal;
                                   Ch          : PDWords;
                                   LoopTimeout : double ) : boolean;
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Sum           : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : integer;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;
begin
  if Port mod 2 = 1
    then raise Exception.Create('Puerto invalido');
  Result := false;
  Sum := nil;
  Acq := false;
  Wrk := true;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( word );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem(Sum, BufferSize * 2);
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock(Sum, BufferSize * 2);
        BufferAcq[Acq].Buffer  := GlobalLock( BufferAcq[Acq].Handle );
        BufferAcq[Wrk].Buffer  := GlobalLock( BufferAcq[Wrk].Handle );

        //Check DMA Status
        FAICheck.ActiveBuf := @ActiveBuf;
        FAICheck.stopped   := @Stopped;
        FAICheck.retrieved := @Retrieved;
        FAICheck.overrun   := @Overrun;
        FAICheck.HalfReady := @HalfReady;

        //Initialize DMA
        if TriggerSource < 2
         then FAIDmaExStart.TrigSrc := TriggerSource
         else FAIDmaExStart.TrigSrc := 0;
        FAIDmaExStart.TrigMode   := 1;        //Post Mode
        if ClockSource
          then FAIDmaExStart.ClockSrc := 0
          else FAIDmaExStart.ClockSrc := 2;
        FAIDmaExStart.TrigEdge   := 0;        //Rise
        FAIDmaExStart.SRCType    := 0;        //Digital
        FAIDmaExStart.CyclicMode := 0;        //Non-Cyclic
        FAIDmaExStart.NumChans   := 1;
        FAIDmaExStart.StartChan  := Port;     //Start by Chanel 0
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := CellCount;
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        for CurrentFrame := 0 to FrameCount - 1 do
          begin
            FillChar(Sum^, BufferSize * 2, 0);
            Index := 0;
            while Index < ShotCount do
              begin // Frame loop
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
                except
                  DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
                  raise;
                end;

                //Reinicio la adquisicion...
                DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
                Acq := not Acq;
                Wrk := not Wrk;
                FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
                DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

                // Process data
                AddDataChannel( Sum, CellCount, BufferAcq[Wrk].Buffer );
                inc(Index);
              end;
            Index := CurrentFrame * CellCount;
            if (ShotCount > 0) and Assigned( Ch )
              then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
          end;
        Result := true;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize * 2 );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end
    else raise EAcqError.Create( 'Ya estan adquiriendo' );
end;

// Initialization & finalization

procedure Init_PCI1710;
const
  Gains : AnalogGains = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
begin
  if PCI1710 >= 0
    then Set_Analog_Input_Gains( Gains );
end;

procedure Init_PCI1714;
const
  Gains : AnalogGains = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
begin
  if PCI1714 >= 0
    then Set_Analog_Input_Gains(Gains);
end;

procedure Init_PCI1720;
var
  AOConfig : PT_AOConfig;
begin
  if PCI1720 >= 0
    then
      begin
        //Configure Ouput Voltage Range +- 10V
        AOConfig.chan := 0;
        AOConfig.MinValue := -10;
        AOConfig.MaxValue :=  10;
        AOConfig.RefSrc   :=  0;     //Internal Source
        DRV_AOConfig( Adv_Dev_Handle[PCI1720], AOConfig );
        AOConfig.chan := 1;
        DRV_AOConfig( Adv_Dev_Handle[PCI1720], AOConfig );
      end;
end;

procedure Init_PCI1730;
begin
  if PCI1730 >= 0
    then
      begin
      end;
end;

procedure Init_PCI1780;
var
  FreqOutStart : PT_FreqOutStart;
begin
  if PCI1780 >= 0
    then
      begin
        //Timers
        //Counters Sample Rate 10 MHz
        FreqOutStart.usChannel := 2;
        FreqOutStart.usDivider := 1;
        FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_10MHZ;
        DRV_FreqOutStart( Adv_Dev_Handle[PCI1780], FreqOutStart );
      end;
end;

procedure DonePCI1780;
begin
  if PCI1780 >= 0
    then
      begin
        //Timers
        DRV_FreqOutReset( Adv_Dev_Handle[PCI1780], 0 );
        DRV_FreqOutReset( Adv_Dev_Handle[PCI1780], 1 );
        DRV_FreqOutReset( Adv_Dev_Handle[PCI1780], 2 );
        //Counters
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], 0 );
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], 1 );
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], 2 );
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], 3 );
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], 4 );
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], 5 );
        DRV_CounterReset( Adv_Dev_Handle[PCI1780], 6 );
      end;
end;

procedure Init_PCL836;
var
  Handle : integer;
  BaseIO : integer;
  WritePortByte : PT_WritePortByte;
begin
  if PCL836 >= 0
    then
      if (PCI1714 > -1) and (PCI1780 = -1)
        then
          begin
            //el sincronismo lo pone la pcl836
            Handle := Adv_Dev_Handle[PCL836];
            BaseIO := Adv_Dev_Address[PCL836];
            // FOuts as square wave generator
            WritePortByte.port := BaseIO + 03;
            WritePortByte.ByteData := $36;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 0
            WritePortByte.ByteData := $76;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 1
            WritePortByte.ByteData := $B6;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 2
            // Counter input from External Clock Without digital filter
            WritePortByte.ByteData := $00;
            WritePortByte.port := BaseIO + 18;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 0
            WritePortByte.port := BaseIO + 19;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 1
            WritePortByte.port := BaseIO + 20;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 2
            WritePortByte.port := BaseIO + 21;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 3
            WritePortByte.port := BaseIO + 22;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 4
            WritePortByte.port := BaseIO + 23;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 5
            // FOut masks
            WritePortByte.port := BaseIO + 24;
            WritePortByte.ByteData := $07;   //sacar por el conector los tres primeros fout
            DRV_WritePortByte(Handle, WritePortByte);
            // Counters as hardware triggered strobe
            WritePortByte.port := BaseIO + 11;
            WritePortByte.ByteData := $3A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 0
            WritePortByte.ByteData := $7A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 1
            WritePortByte.ByteData := $BA;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 2
            WritePortByte.port := BaseIO + 15;
            WritePortByte.ByteData := $3A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 3
            WritePortByte.ByteData := $7A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 4
            WritePortByte.ByteData := $BA;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 5
            // FOuts default to 1us period
            Set_FOut_Timer(2, 10 );
            // Counters
            Set_Counter_Timers([$FFFF, $FFFF, $FFFF, $FFFF, $FFFF, $FFFF]);
          end
        else
          begin
            //el sincronismo lo pone la datel, la pcl836 pone los timers
            Handle := Adv_Dev_Handle[PCL836];
            BaseIO := Adv_Dev_Address[PCL836];
            // FOuts as square wave generator
            WritePortByte.port := BaseIO + 03;
            WritePortByte.ByteData := $36;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 0
            WritePortByte.ByteData := $76;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 1
            WritePortByte.ByteData := $B6;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 2
            WritePortByte.port := BaseIO + 07;
            WritePortByte.ByteData := $36;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 3
            WritePortByte.ByteData := $76;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 4
            WritePortByte.ByteData := $B6;
            DRV_WritePortByte(Handle, WritePortByte);  //FOut 5
            // Counter input from FOuts
            WritePortByte.ByteData := $02;
            WritePortByte.port := BaseIO + 18;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 0
            WritePortByte.port := BaseIO + 19;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 1
            WritePortByte.port := BaseIO + 20;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 2
            WritePortByte.port := BaseIO + 21;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 3
            WritePortByte.port := BaseIO + 22;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 4
            WritePortByte.port := BaseIO + 23;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 5
            // FOut masks
            WritePortByte.port := BaseIO + 24;
            WritePortByte.ByteData := $00;  //**000000b
            DRV_WritePortByte(Handle, WritePortByte);
            // Counters as hardware triggered strobe
            WritePortByte.port := BaseIO + 11;
            WritePortByte.ByteData := $3A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 0
            WritePortByte.ByteData := $7A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 1
            WritePortByte.ByteData := $BA;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 2
            WritePortByte.port := BaseIO + 15;
            WritePortByte.ByteData := $3A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 3
            WritePortByte.ByteData := $7A;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 4
            WritePortByte.ByteData := $BA;
            DRV_WritePortByte(Handle, WritePortByte);  // Counter 5
            // FOuts default to 1us period
            Set_FOut_Timers([10, 10, 10, 10, 10, 10]);
            // Counters
            Set_Counter_Timers([$FFFF, $FFFF, $FFFF, $FFFF, $FFFF, $FFFF]);
          end;
end;

procedure Init_PCL812PG;
var
  CounterFreqStart : PT_CounterFreqStart;
const
  Gains : AnalogGains = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
begin
  if PCL812PG >= 0
    then
      begin
        Set_Analog_Input_Gains(Gains);
        CounterFreqStart.Counter := 0;
        DRV_CounterFreqStart(Adv_Dev_Handle[PCL812PG], CounterFreqStart);
      end;
end;

procedure Init_PCL728;
begin
  if PCL728 >= 0
    then
      begin
      end;
end;

procedure DonePCI1714;
begin
end;

function GetAdvDevAddress( Index : integer ) : integer;
const
  SvcKey = 'SYSTEM\CurrentControlSet\Services\';
  AdvKey = SvcKey + 'ADSDAQ\';
var
  KeyName : string;
begin
  Result := 0;
  with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      KeyName := 'Device' + Format('%3.3d', [Index]);
      if OpenKey(AdvKey + KeyName, false)
        then
          begin
            KeyName := ReadString('KernelKey') + '\' + KeyName;
            CloseKey;
            if OpenKey(SvcKey + KeyName, false)
              then Result := ReadInteger('BaseAddress');
          end;
    finally
      Free;
    end;
end;

procedure DonePCL812PG;
begin
  if PCL812PG > 0
    then DRV_CounterReset(Adv_Dev_Handle[PCL812PG], 0);
end;

procedure Init_USB4711;
var
  AOConfig : PT_AOConfig;
begin
  if USB4711 >= 0
    then
      begin
        //Configure Ouput Voltage Range +- 10V
        AOConfig.chan := 0;
        AOConfig.MinValue := -10;
        AOConfig.MaxValue :=  10;
        AOConfig.RefSrc   :=  0;     //Internal Source
        DRV_AOConfig( Adv_Dev_Handle[USB4711], AOConfig );
        AOConfig.chan := 1;
        DRV_AOConfig( Adv_Dev_Handle[USB4711], AOConfig );
      end;
end;

procedure Init_Devices;
var
  I : integer;
  GetFeatures : PT_DeviceGetFeatures;
  AO : AnalogOutput;
  Status : cardinal;
  PropertyLength : integer;
begin
  DRV_DeviceGetNumOfList(Adv_Dev_Count);
  SetLength( Adv_Dev_List, Adv_Dev_Count );
  DRV_DeviceGetList(Adv_Dev_List[0], Adv_Dev_Count, Adv_Dev_Count);
  SetLength( Adv_Dev_Handle, Adv_Dev_Count );
  SetLength( Adv_Dev_Feature, Adv_Dev_Count );
  SetLength( Adv_Dev_Address, Adv_Dev_Count );
  SetLength( Adv_Dev_BoardIDs, Adv_Dev_Count );
  SetLength( Adv_Dev_PropertyIDs, Adv_Dev_Count );
  for I := 0 to Adv_Dev_Count - 1 do
    begin
      DRV_DeviceOpen(I, Adv_Dev_Handle[I]);
      try
        Adv_Dev_Address[I] := GetAdvDevAddress(I);
      except
        Adv_Dev_Address[I] := 0;
      end;
      GetFeatures.buffer := @Adv_Dev_Feature[I];
      GetFeatures.size   := sizeof(Adv_Dev_Feature[I]);
      DRV_DeviceGetFeatures(Adv_Dev_Handle[I], GetFeatures);

      PropertyLength := SizeOf(cardinal);
      DRV_DeviceGetProperty(Adv_Dev_Handle[I], CFG_BoardID, @Adv_Dev_BoardIDs[I], PropertyLength);
      DRV_DeviceGetProperty(Adv_Dev_Handle[I], CFG_SwitchID, @Adv_Dev_PropertyIDs[I], PropertyLength);

      case Adv_Dev_BoardIDs[I] of
        BD_PCL812PG : PCL812PG := I;
        BD_PCL836   : PCL836   := I;
        BD_PCL728   : PCL728   := I;
        BD_PCI1714  : PCI1714  := I;
        BD_PCI1720  : PCI1720  := I;
        BD_PCI1780  : PCI1780  := I;
        BD_PCI1730  : PCI1730  := I;
        BD_PCI1733  : PCI1733  := I;
        BD_PCI1710  : PCI1710  := I;
        BD_USB4750  : USB4750  := I;
        BD_USB4711  : USB4711  := I;
        BD_USB4711B : USB4711B := I;
        BD_USB4761  : USB4761  := I;
        BD_USB4751  : USB4751  := I;
        BD_USB4751L : USB4751L := I;
        else Watchdog := I;
      end;
    end;

  SetLength(CardDigitalInputs,  High(DIRange)+1);
  SetLength(CardDigitalOutputs, High(DORange)+1);
  SetLength(CardAnalogInputs,   High(AIRange)+1);
  SetLength(CardAnalogOutputs,  High(AORange)+1);

  LoadInputSignals(CardDigitalInputs,  DI_Names, DigitalInputsKey);
  LoadInputSignals(CardDigitalOutputs, DO_Names, DigitalOutputsKey);
  LoadInputSignals(CardAnalogInputs,   AI_Names, AnalogInputsKey);
  LoadInputSignals(CardAnalogOutputs,  AO_Names, AnalogOutputsKey);

  MatchInputSignals(CardDigitalInputs);
  MatchInputSignals(CardDigitalOutputs);
  MatchInputSignals(CardAnalogInputs);
  MatchInputSignals(CardAnalogOutputs);

  Init_PCL836;
  Init_PCI1780;
  Init_PCL812PG;
  Init_PCI1710;
  Init_PCL728;
  Init_PCI1720;
  Init_PCI1714;
  Init_USB4711;
  Set_Digital_Output(0);
  AO[0] := 2048;
  AO[1] := 2048;
  Set_Analog_Output(AO);
end;

procedure Done_Devices;
var
  I : integer;
begin
  DonePCL812PG;
  DonePCI1780;
  DonePCI1714;
  for I := 0 to Adv_Dev_Count - 1 do
    DRV_DeviceClose( Adv_Dev_Handle[I] );
  Adv_Dev_List := nil;
  Adv_Dev_Feature := nil;
  Adv_Dev_Handle := nil;
end;

function Acquire_Single_Frame( CellCount  : cardinal; out Ch1, Ch2 ) : boolean;
var
  FAIDmaExStart   : PT_FAIDmaExStart;
  FAICheck        : PT_FAICheck ;
  hDMABuffer      : HGLOBAL;
  DMABuffer       : pointer;
  Loop            : cardinal;
  GainList        : PVideoGains;
  BufferSize      : Cardinal;

  ActiveBuf       : Smallint;     // return by FAICheck
  Overrun         : Smallint;     // return by FAICheck
  Stopped         : Smallint;     // return by FAICheck
  Retrieved       : Longint;      // return by FAICheck
  HalfReady       : Smallint;     // return by FAICheck

  Thread          : integer;
  SavedPriority   : integer;
  Starting,
  Finishing,
  Freq            : int64;
begin
  BufferSize := 2 * CellCount * SizeOf(word);
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  Result := false;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        hDMABuffer := GlobalAlloc( GPTR, BufferSize );
        DMABuffer  := GlobalLock( hDMABuffer );
        New( GainList );
        GainList^ := LoadVideoGains;

        FAICheck.ActiveBuf := @ActiveBuf;
        FAICheck.stopped   := @Stopped;
        FAICheck.retrieved := @Retrieved;
        FAICheck.overrun   := @Overrun;
        FAICheck.HalfReady := @HalfReady;

        FAIDmaExStart.TrigSrc    := 1;        //External Trigger
        FAIDmaExStart.TrigMode   := 1;        //Post Mode
        FAIDmaExStart.ClockSrc   := 2;
        FAIDmaExStart.TrigEdge   := 0;        //Rise
        FAIDmaExStart.SRCType    := 0;        //Digital
        FAIDmaExStart.CyclicMode := 0;        //Non-Cyclic
        FAIDmaExStart.NumChans   := 2;
        FAIDmaExStart.StartChan  := 0;        //Start by Chanel 0
        FAIDmaExStart.SampleRate := 1000000;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := CellCount * 2;
        FAIDmaExStart.buffer0    := DMABuffer;

        SetThreadPriority(Thread, AcquirePriority);

        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);

        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        QueryPerformanceCounter(Starting);
        try
          repeat
            DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
            QueryPerformanceCounter(Finishing);
            if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
            then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
          until Stopped = 1;
        except
          DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
          raise;
        end;

        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
        ScatterData( @Ch1, @Ch2, CellCount, DMABuffer );
        result := true;
      finally
        GlobalUnlock( hDMABuffer );
        GlobalFree( hDMABuffer );
        Dispose( GainList );
        SetThreadPriority( Thread, SavedPriority );
        ReleaseMutex(AcquiringMutex);
      end;
end;


procedure Acquire_Az_SectorsOneChannel( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch          : PDWords;
                                       LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Shots         : cardinal;
  Sum           : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  Start         : LongWord;
  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;
begin
  Sum := nil;
  Acq := false;
  Wrk := true;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum, BufferSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum, BufferSize );
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
        FAIDmaExStart.NumChans   := 1;
        FAIDmaExStart.StartChan  := Port;        //Start by Chanel 0
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := CellCount; //One Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // PPI loop
          Shots := 0;
          FillChar( Sum^, BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div 4096) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataChannel( Sum, CellCount, BufferAcq[Wrk].Buffer );
              Inc( Shots );
              if Shots > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;

          Index := CurrentSector * CellCount;
          if Shots > 0
            then
              begin
                // Mean
                if Assigned( Ch )
                  then AverageData( Sum, @Ch^[Index], CellCount, Shots );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        until CurrentSector = FirstSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority( Thread, SavedPriority );
        ReleaseMutex( AcquiringMutex );
      end;
end;

procedure Acquire_Az_SectorsOneChannelFilter( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch          : PDWords;
                                       Filter      : PDWords;
                                       B0, B1, B2, A1, A2 : double;
                                       LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Shots         : cardinal;
  Sum           : pointer;      // Sum X
  FT            : PDWords;
  FB            : PDWords;
  FN            : PDWords;
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  Start         : LongWord;
  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;
  ShotIndex : byte;
  TotalShots : cardinal;
begin
  Sum := nil;
  FB  := nil;
  FT  := nil;
  FN  := nil;
  Acq := false;
  Wrk := true;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum, BufferSize );
        GetMem( FT, BufferSize );
        GetMem( FB, FilterSize );
        GetMem( FN, FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum, BufferSize );
        VirtualLock( FT, BufferSize );
        VirtualLock( FB, FilterSize );
        VirtualLock( FN, FilterSize );
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
        FAIDmaExStart.NumChans   := 1;
        FAIDmaExStart.StartChan  := Port;        //Start by Chanel 0
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := CellCount; //One Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        TotalShots := 0;
        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // PPI loop
          Shots := 0;
          FillChar( Sum^, BufferSize, 0 );
          FillChar( FT^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div 4096) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataChannel( Sum, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter )
                then
                  begin
                    ShotIndex := TotalShots mod PermanentEchoFilterOrder;
                    FillChar( FB^[ShotIndex * CellCount], BufferSize, 0 );
                    AddDataChannel( @FB^[ShotIndex * CellCount], CellCount, BufferAcq[Wrk].Buffer );

                    //si mas de tres rayos calculo y sumo en Filter
                    if TotalShots >= PermanentEchoFilterOrder-1
                      then AddFilterValue( FN, FB, ShotIndex, FT, CellCount, B0, B1, B2, A1, A2 );
                  end;
              Inc( Shots );
              Inc( TotalShots );
              if Shots > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;

          Index := CurrentSector * CellCount;
          if Shots > 0
            then
              begin
                // Mean
                if Assigned( Ch )
                  then AverageData( Sum, @Ch^[Index], CellCount, Shots );
                // Filter Mean
                if Assigned( Filter ) and (Shots > PermanentEchoFilterOrder-1)
                  then
                    if TotalShots > Shots
                      then AverageData( FT, @Filter^[Index], CellCount, Shots )
                      else AverageData( FT, @Filter^[Index], CellCount, Shots-(PermanentEchoFilterOrder-1) );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        until CurrentSector = FirstSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( FT ) then VirtualUnlock( FT, BufferSize );
        if assigned( FB ) then VirtualUnlock( FB, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( FT ) then FreeMem( FT );
        if assigned( FB ) then FreeMem( FB );
        if assigned( FN ) then FreeMem( FN );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority( Thread, SavedPriority );
        ReleaseMutex( AcquiringMutex );
      end;
end;

procedure Acquire_Az_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Shots         : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize    : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  Start         : LongWord;
  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;
begin
  Sum_1 := nil;
  Sum_2 := nil;
  Acq := false;
  Wrk := true;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum_1, BufferSize );
        GetMem( Sum_2, BufferSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );
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
        FAIDmaExStart.Count      := CellCount * 2; //Two Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // PPI loop
          Shots := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div 4096) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataTwoChannles ( Sum_1, Sum_2, CellCount, BufferAcq[Wrk].Buffer );
              Inc( Shots );
              if Shots > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;

          Index := CurrentSector * CellCount;
          if Shots > 0
            then
              begin
                // Mean
                if Assigned( Ch1 )
                  then AverageData( Sum_1, @Ch1^[Index], CellCount, Shots );
                if Assigned( Ch2 )
                  then AverageData( Sum_2, @Ch2^[Index], CellCount, Shots );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        until CurrentSector = FirstSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority( Thread, SavedPriority );
        ReleaseMutex( AcquiringMutex );
      end;
end;

procedure Acquire_Az_SectorsTwoChannelsFilter( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        Filter1,
                                        Filter2     : PDWords;
                                        Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 : double;
                                        Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 : double;
                                        LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Shots         : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  FT1, FT2      : PDWords;
  FB1, FB2      : PDWords;
  FN1, FN2      : PDWords;
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  Start         : LongWord;
  GlobalStarting,
  Starting,
  Finishing,
  Freq          : int64;
  ShotIndex : byte;
  TotalShots : cardinal;
begin
  Sum_1 := nil;
  Sum_2 := nil;
  FB1  := nil;
  FT1  := nil;
  FB2  := nil;
  FT2  := nil;
  FN1  := nil;
  FN2  := nil;
  Acq := false;
  Wrk := true;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum_1, BufferSize );
        GetMem( Sum_2, BufferSize );
        GetMem( FT1, BufferSize );
        GetMem( FT2, BufferSize );
        GetMem( FB1, FilterSize );
        GetMem( FB2, FilterSize );
        GetMem( FN1, FilterSize );
        GetMem( FN2, FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );
        VirtualLock( FT1, BufferSize );
        VirtualLock( FB1, FilterSize );
        VirtualLock( FT2, BufferSize );
        VirtualLock( FB2, FilterSize );
        VirtualLock( FN1, FilterSize );
        VirtualLock( FN2, FilterSize );
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
        FAIDmaExStart.Count      := CellCount * 2; //Two Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        Start := GetTickCount;
        repeat
          FirstSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
          if GetTickCount - Start > MaxTimeElapsed
            then raise EAcqError.Create('Antenna timeout');
        until FirstSector <> CurrentSector;
        CurrentSector := FirstSector;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        TotalShots := 0;
        repeat  // PPI loop
          Shots := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          FillChar( FT1^,   BufferSize, 0 );
          FillChar( FT2^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div 4096) = CurrentSector do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataTwoChannles ( Sum_1, Sum_2, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter1 ) or Assigned( Filter2 )
                then
                  begin
                    ShotIndex := TotalShots mod PermanentEchoFilterOrder;
                    FillChar( FB1^[ShotIndex * CellCount], BufferSize, 0 );
                    FillChar( FB2^[ShotIndex * CellCount], BufferSize, 0 );
                    FillChar( FN1^[ShotIndex * CellCount], BufferSize, 0 );
                    FillChar( FN2^[ShotIndex * CellCount], BufferSize, 0 );
                    AddDataTwoChannles( @FB1^[ShotIndex * CellCount], @FB2^[ShotIndex * CellCount], CellCount, BufferAcq[Wrk].Buffer );

                    //si mas de tres rayos calculo y sumo en Filter
                    if TotalShots >= PermanentEchoFilterOrder-1
                      then
                        begin
                          AddFilterValue( FN1, FB1, ShotIndex, FT1, CellCount, Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 );
                          AddFilterValue( FN2, FB2, ShotIndex, FT2, CellCount, Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 );
                        end;
                  end;
              Inc( Shots );
              Inc( TotalShots );
              if Shots > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;

          Index := CurrentSector * CellCount;
          if Shots > 0
            then
              begin
                // Mean
                if Assigned( Ch1 )
                  then AverageData( Sum_1, @Ch1^[Index], CellCount, Shots );
                if Assigned( Ch2 )
                  then AverageData( Sum_2, @Ch2^[Index], CellCount, Shots );
                // Filter Mean
                if Assigned( Filter1 ) and (Shots > PermanentEchoFilterOrder-1)
                  then
                    if TotalShots > Shots
                      then AverageData( FT1, @Filter1^[Index], CellCount, Shots )
                      else AverageData( FT1, @Filter1^[Index], CellCount, Shots-(PermanentEchoFilterOrder-1) );

                if Assigned( Filter2 ) and (Shots > PermanentEchoFilterOrder-1)
                  then
                    if TotalShots > Shots
                      then AverageData( FT2, @Filter2^[Index], CellCount, Shots )
                      else AverageData( FT2, @Filter2^[Index], CellCount, Shots-(PermanentEchoFilterOrder-1) );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        until CurrentSector = FirstSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( FT1 ) then VirtualUnlock( FT1, BufferSize );
        if assigned( FB1 ) then VirtualUnlock( FB1, FilterSize );
        if assigned( FT2 ) then VirtualUnlock( FT2, BufferSize );
        if assigned( FB2 ) then VirtualUnlock( FB2, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( FT1 ) then FreeMem( FT1 );
        if assigned( FB1 ) then FreeMem( FB1 );
        if assigned( FT2 ) then FreeMem( FT2 );
        if assigned( FB2 ) then FreeMem( FB2 );
        if assigned( FN1 ) then FreeMem( FN1 );
        if assigned( FN2 ) then FreeMem( FN2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority( Thread, SavedPriority );
        ReleaseMutex( AcquiringMutex );
      end;
end;

procedure Acquire_El_SectorsOneChannel( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       Start       : integer;
                                       Finish      : integer;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch          : PDWords;
                                       LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  Done, Loop    : cardinal;
  CurrentSector : integer;
  ShotCount     : cardinal;
  Sum           : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : cardinal;
  BufferSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  GlobalStarting,
  Starting,
  Finishing,
  Freq            : int64;
begin
  Sum := nil;
  Acq := false;
  Wrk := true;
  StartSector  := (Start  * integer(SectorCount)) div 4096;
  FinishSector := (Finish * integer(SectorCount)) div 4096;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum, BufferSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum, BufferSize );
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
        FAIDmaExStart.NumChans   := 1;
        FAIDmaExStart.StartChan  := Port;        //Start by Chanel 0
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := CellCount; //One Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := Deva.Read_Encoder_Int_Y;
        while CurrentSector >= Deva.Read_Encoder_Int_Y do Sleep(0);
        CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum^, BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096) = integer(CurrentSector) do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataChannel( Sum, CellCount, BufferAcq[Wrk].Buffer );
              Inc( ShotCount );
              if ShotCount > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;
          Index := (CurrentSector - StartSector) * CellCount;
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch )
                  then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
              end;
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;
        until CurrentSector >= FinishSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end;
end;

procedure Acquire_El_SectorsOneChannelFilter( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       Start       : integer;
                                       Finish      : integer;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch          : PDWords;
                                       Filter      : PDWords;
                                       B0, B1, B2, A1, A2 : double;
                                       LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  Done, Loop    : cardinal;
  CurrentSector : integer;
  ShotCount     : cardinal;
  Sum           : pointer;      // Sum X
  FT            : PDWords;
  FB            : PDWords;
  FN            : PDWords;
  Thread        : integer;
  SavedPriority : integer;
  Index         : cardinal;
  BufferSize,
  FilterSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  GlobalStarting,
  Starting,
  Finishing,
  Freq            : int64;
  ShotIndex : byte;
  TotalShots : cardinal;
begin
  Sum := nil;
  FB   := nil;
  FT   := nil;
  FN  := nil;
  Acq := false;
  Wrk := true;
  StartSector  := (Start  * integer(SectorCount)) div 4096;
  FinishSector := (Finish * integer(SectorCount)) div 4096;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum, BufferSize );
        GetMem( FT, BufferSize );
        GetMem( FB, FilterSize );
        GetMem( FN, FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum, BufferSize );
        VirtualLock( FT, BufferSize );
        VirtualLock( FB, FilterSize );
        VirtualLock( FN, FilterSize );
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
        FAIDmaExStart.NumChans   := 1;
        FAIDmaExStart.StartChan  := Port;        //Start by Chanel 0
        FAIDmaExStart.SampleRate := SampleRate;
        FAIDmaExStart.TrigVol    := 0;
        FAIDmaExStart.ulDelayCnt := 2;        //Not used
        FAIDmaExStart.GainList   := @GainList[0];
        FAIDmaExStart.Count      := CellCount; //One Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := Deva.Read_Encoder_Int_Y;
        while CurrentSector >= Deva.Read_Encoder_Int_Y do Sleep(0);
        CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        TotalShots := 0;
        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum^, BufferSize, 0 );
          FillChar( FT^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096) = integer(CurrentSector) do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataChannel( Sum, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter )
                then
                  begin
                    ShotIndex := TotalShots mod PermanentEchoFilterOrder;
                    FillChar( FB^[ShotIndex * CellCount], BufferSize, 0 );
                    FillChar( FN^[ShotIndex * CellCount], BufferSize, 0 );
                    AddDataChannel( @FB^[ShotIndex * CellCount], CellCount, BufferAcq[Wrk].Buffer );
                    //si mas de tres rayos calculo y sumo en Filter
                    if TotalShots >= PermanentEchoFilterOrder-1
                      then AddFilterValue( FN, FB, ShotIndex, FT, CellCount, B0, B1, B2, A1, A2 );
                  end;
              Inc( ShotCount );
              Inc( TotalShots );
              if ShotCount > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;
          Index := (CurrentSector - StartSector) * CellCount;
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
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;
        until CurrentSector >= FinishSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( FT ) then VirtualUnlock( FT, BufferSize );
        if assigned( FB ) then VirtualUnlock( FB, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( FT ) then FreeMem( FT );
        if assigned( FB ) then FreeMem( FB );
        if assigned( FN ) then FreeMem( FN );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end;
end;

procedure Acquire_El_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  Done, Loop    : cardinal;
  CurrentSector : integer;
  ShotCount     : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  Thread        : integer;
  SavedPriority : integer;
  Index         : cardinal;
  BufferSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  GlobalStarting,
  Starting,
  Finishing,
  Freq            : int64;
begin
  Sum_1 := nil;
  Sum_2 := nil;
  Acq := false;
  Wrk := true;
  StartSector  := (Start  * integer(SectorCount)) div 4096;
  FinishSector := (Finish * integer(SectorCount)) div 4096;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum_1, BufferSize );
        GetMem( Sum_2, BufferSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );
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
        FAIDmaExStart.Count      := CellCount * 2; //Two Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := Deva.Read_Encoder_Int_Y;
        while CurrentSector >= Deva.Read_Encoder_Int_Y do Sleep(0);
        CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096) = integer(CurrentSector) do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataTwoChannles ( Sum_1, Sum_2, CellCount, BufferAcq[Wrk].Buffer );
              Inc( ShotCount );
              if ShotCount > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;
          Index := (CurrentSector - StartSector) * CellCount;
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch1 )
                  then AverageData( Sum_1, @Ch1^[Index], CellCount, ShotCount );
                if Assigned( Ch2 )
                  then AverageData( Sum_2, @Ch2^[Index], CellCount, ShotCount );
              end;
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;
        until CurrentSector >= FinishSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end;
end;

procedure Acquire_El_SectorsTwoChannelsFilter( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        Filter1,
                                        Filter2     : PDWords;
                                        Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 : double;
                                        Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 : double;
                                        LoopTimeout : double );
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;

  ActiveBuf     : Smallint;     // return by FAICheck
  Overrun       : Smallint;     // return by FAICheck
  Stopped       : Smallint;     // return by FAICheck
  Retrieved     : Longint;      // return by FAICheck
  HalfReady     : Smallint;     // return by FAICheck

  Done, Loop    : cardinal;
  CurrentSector : integer;
  ShotCount     : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  FT1, FT2      : PDWords;
  FB1, FB2      : PDWords;
  FN1, FN2      : PDWords;
  Thread        : integer;
  SavedPriority : integer;
  Index         : cardinal;
  BufferSize,
  FilterSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
  GlobalStarting,
  Starting,
  Finishing,
  Freq            : int64;
  ShotIndex : byte;
  TotalShots : cardinal;
begin
  Sum_1 := nil;
  Sum_2 := nil;
  FB1   := nil;
  FT1   := nil;
  FB2   := nil;
  FT2   := nil;
  FN1  := nil;
  FN2  := nil;
  Acq := false;
  Wrk := true;
  StartSector  := (Start  * integer(SectorCount)) div 4096;
  FinishSector := (Finish * integer(SectorCount)) div 4096;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize );
        GetMem( Sum_1, BufferSize );
        GetMem( Sum_2, BufferSize );
        GetMem( FT1, BufferSize );
        GetMem( FT2, BufferSize );
        GetMem( FB1, FilterSize );
        GetMem( FB2, FilterSize );
        GetMem( FN1, FilterSize );
        GetMem( FN2, FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );
        VirtualLock( FT1, BufferSize );
        VirtualLock( FB1, FilterSize );
        VirtualLock( FT2, BufferSize );
        VirtualLock( FB2, FilterSize );
        VirtualLock( FN1, FilterSize );
        VirtualLock( FN2, FilterSize );
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
        FAIDmaExStart.Count      := CellCount * 2; //Two Channels
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        // Wait for sector start
        CurrentSector := Deva.Read_Encoder_Int_Y;
        while CurrentSector >= Deva.Read_Encoder_Int_Y do Sleep(0);
        CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
        QueryPerformanceFrequency(Freq);
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        TotalShots := 0;
        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          FillChar( FT1^,   BufferSize, 0 );
          FillChar( FT2^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096) = integer(CurrentSector) do
            begin // Sector loop
              QueryPerformanceCounter(Starting);
              GlobalStarting := Starting;
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

              //Reinicio la adquisicion...
              DRV_FAIStop( Adv_Dev_Handle[PCI1714] );
              Acq := not Acq;
              Wrk := not Wrk;
              FAIDmaExStart.buffer0 := BufferAcq[Acq].Buffer;
              DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

              // Process data
              AddDataTwoChannles ( Sum_1, Sum_2, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter1 ) or Assigned( Filter2 )
                then
                  begin
                    ShotIndex := TotalShots mod PermanentEchoFilterOrder;
                    FillChar( FB1^[ShotIndex * CellCount], BufferSize, 0 );
                    FillChar( FB2^[ShotIndex * CellCount], BufferSize, 0 );
                    FillChar( FN1^[ShotIndex * CellCount], BufferSize, 0 );
                    FillChar( FN2^[ShotIndex * CellCount], BufferSize, 0 );
                    AddDataTwoChannles( @FB1^[ShotIndex * CellCount], @FB2^[ShotIndex * CellCount], CellCount, BufferAcq[Wrk].Buffer );
                    //si mas de tres rayos calculo y sumo en Filter
                    if TotalShots >= PermanentEchoFilterOrder-1
                      then
                        begin
                          AddFilterValue( FN1, FB1, ShotIndex, FT1, CellCount, Ch1B0, Ch1B1, Ch1B2, Ch1A1, Ch1A2 );
                          AddFilterValue( FN2, FB2, ShotIndex, FT2, CellCount, Ch2B0, Ch2B1, Ch2B2, Ch2A1, Ch2A2 );
                        end;
                  end;
              Inc( ShotCount );
              Inc( TotalShots );
              if ShotCount > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;
          Index := (CurrentSector - StartSector) * CellCount;
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
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;
        until CurrentSector >= FinishSector;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( FT1 ) then VirtualUnlock( FT1, BufferSize );
        if assigned( FB1 ) then VirtualUnlock( FB1, FilterSize );
        if assigned( FT2 ) then VirtualUnlock( FT2, BufferSize );
        if assigned( FB2 ) then VirtualUnlock( FB2, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( FT1 ) then FreeMem( FT1 );
        if assigned( FB1 ) then FreeMem( FB1 );
        if assigned( FT2 ) then FreeMem( FT2 );
        if assigned( FB2 ) then FreeMem( FB2 );
        if assigned( FN1 ) then FreeMem( FN1 );
        if assigned( FN2 ) then FreeMem( FN2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end;
end;

end.
