unit TestAdvantech;

{$DEFINE DMA_TimeoutByTime}
//{$UNDEF DMA_TimeoutByTime}
//{$DEFINE TestCards}
{$UNDEF TestCards}
interface

uses
  Windows, ElbrusTypes, SysUtils, Driver;

type
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
{$IFDEF DMA_TimeoutByTime}
  MaxLoopTime = 10000; //us
{$ENDIF}
  MaxLoopCount = 100000;
  PermanentEchoFilterOrder = 3;

type
  TIntArray    = array of integer;
  TFeatureList = array of DEVFEATURES;
  TEntry =
    record
      CardIndex : integer;
      CardBoardId : cardinal;
      Entry : cardinal;
    end;
  TDigitalInputs  = array [DIRange] of TEntry;
  TDigitalOutputs = array [DORange] of TEntry;
  TAnalogInputs   = array [AIRange] of TEntry;
  TAnalogOutputs  = array [AORange] of TEntry;

var
  Adv_Dev_Count   : smallint;
  Adv_Dev_Handle  : TIntArray;
  Adv_Dev_Feature : TFeatureList;
  CardDigitalInputs  : TDigitalInputs;
  CardDigitalOutputs : TDigitalOutputs;
  CardAnalogInputs   : TAnalogInputs;
  CardAnalogOutputs  : TAnalogOutputs;

var
  PCI1710  : integer = -1;
  PCI1714  : integer = -1;
  PCI1720  : integer = -1;
  PCI1730  : integer = -1;
  PCI1780  : integer = -1;
  PCI1733  : integer = -1;

//General
procedure LoadDigitalInputsIndex;
procedure LoadDigitalOutputsIndex;
procedure LoadAnalogInputsIndex;
procedure LoadAnalogOutputsIndex;

procedure MatchDigitalInputsIndex;
procedure MatchDigitalOutputsIndex;
procedure MatchAnalogInputsIndex;
procedure MatchAnalogOutputsIndex;

procedure SaveDigitalInputsIndex;
procedure SaveDigitalOutputsIndex;
procedure SaveAnalogInputsIndex;
procedure SaveAnalogOutputsIndex;

// Drivers
procedure Init_Devices;
procedure Done_Devices;

// Digital Input
function Get_Digital_Input : DigitalInput;
function Get_Digital_Input_Bit( Bit : DIRange ) : boolean;
//Only for Real Time
function ReadAzPosition : cardinal;
function ReadElPosition : cardinal;

// Digital Output
procedure Set_Digital_Output    ( Bits : DigitalOutput );
procedure Set_Digital_Output_Bit( Bit  : DORange; State : boolean );

// Analog Input
function  Get_Analog_Input : AnalogInput;
procedure Set_Analog_Input_Gains  ( Gains   : AnalogGains );
function  Get_Analog_Input_Voltage_Channel( Binary : AnalogSample; Gain : GainCode ) : single;

// Analog Output
procedure Set_Analog_Output        ( Codes : AnalogOutput );
procedure Set_Analog_Output_Channel( Channel : AORange; Code : AnalogCode );

// Counters
procedure Set_Counter_Timer ( Timer : CounterRange; Code : word );
procedure Set_Counter_Timers( Codes : array of word );
function  Get_Freq_Counter : single;

// Frequency Generators
function  Set_Trigger_Rate  ( Rate : cardinal ) : cardinal; //en Hz
function  Set_Sample_Rate   ( Rate : cardinal ) : cardinal;

//Video
function Acquire_Single_Frame( CellCount  : cardinal;
                               out Ch1, Ch2 ) : boolean;

function Acquire_Az_SectorsOneChannel( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch, SM      : PDWords;
                                       Filter      : PDWords ) : boolean;

function Acquire_Az_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        SM1, SM2    : PDWords;
                                        Filter1, Filter2 : PDWords ) : boolean;

function Acquire_El_SectorsOneChannel( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       SectorCount : cardinal;
                                       Start       : integer;
                                       Finish      : integer;
                                       CellCount   : cardinal;
                                       Ch, SM      : PDWords;
                                       Filter      : PDWords ) : boolean;

function Acquire_El_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        SM1, SM2    : PDWords;
                                        Filter1, Filter2 : PDWords ) : boolean;

function Acquire_FramesOneChannel( Port : integer;
                                   SampleRate  : cardinal;
                                   ClockSource : boolean;
                                   FrameCount  : cardinal;
                                   ShotCount   : cardinal;
                                   CellCount   : cardinal;
                                   Ch, SM      : PDWords;
                                   out Missed  : integer ) : boolean;

function Acquire_FramesTwoChannels( Port : integer;
                                    SampleRate  : cardinal;
                                    ClockSource : boolean;
                                    FrameCount  : cardinal;
                                    ShotCount   : cardinal;
                                    CellCount   : cardinal;
                                    Ch1, Ch2    : PDWords;
                                    SM1, SM2    : PDWords;
                                    out Missed  : integer ) : boolean;

procedure AddFilterValue( ThreeShots : PDWords; Index : byte; FT : PDWords; CellCount : cardinal );
procedure ScatterTwoData( Ch1, Ch2 : pointer; Count : integer; Source : pointer );
procedure PWord_To_PBytes( Ch1 : PWords; Channel : PBytes; Count : integer );
procedure MoveWords( Source, Target : PWords; Count : integer );

//Parallel Port
function  Inp32(wAddr:word):byte; stdcall; external 'inpout32.dll';
function  Out32(wAddr:word;bOut:byte):byte; stdcall; external 'inpout32.dll';

var
  AcquiringMutex : integer = 0;

implementation

uses
  Registry,
  Deva,
  Math, Parameters, IniFiles, Constants;

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

procedure LoadDigitalInputsIndex;
var
  Setup : TIniFile;
  i : integer;
  Code : string;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( DIRange ) to High( DIRange ) do
    begin
      CardDigitalInputs[i].CardIndex := NoData;
      Code := Setup.ReadString( DigitalInputsKey, DI_Names[i], '' );
      while Pos( ' ', Code ) > 0 do
        Delete( Code, Pos( ' ', Code ), 1 );
      if Code <> ''
        then
          begin
            CardDigitalInputs[i].CardBoardId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
            CardDigitalInputs[i].Entry := StrToInt( Copy( Code, Pos( ',', Code )+1, Length(Code)-Pos( ',', Code ) ) );
          end
        else
          begin
            CardDigitalInputs[i].CardBoardId := 0;
            CardDigitalInputs[i].Entry := NoData;
          end;
    end;
  finally
    Setup.free;
  end;
end;

procedure LoadDigitalOutputsIndex;
var
  Setup : TIniFile;
  i : integer;
  Code : string;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( DORange ) to High( DORange ) do
    begin
      CardDigitalOutputs[i].CardIndex := NoData;
      Code := Setup.ReadString( DigitalOutputsKey, DO_Names[i], '' );
      while Pos( ' ', Code ) > 0 do
        Delete( Code, Pos( ' ', Code ), 1 );
      if Code <> ''
        then
          begin
            CardDigitalOutputs[i].CardBoardId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
            CardDigitalOutputs[i].Entry := StrToInt( Copy( Code, Pos( ',', Code )+1, Length(Code)-Pos( ',', Code ) ) );
          end
        else
          begin
            CardDigitalOutputs[i].CardBoardId := 0;
            CardDigitalOutputs[i].Entry := NoData;
          end;
    end;
  finally
    Setup.free;
  end;
end;

procedure LoadAnalogInputsIndex;
var
  Setup : TIniFile;
  i : integer;
  Code : string;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( AIRange ) to High( AIRange ) do
    begin
      CardAnalogInputs[i].CardIndex := NoData;
      Code := Setup.ReadString( AnalogInputsKey, AI_Names[i], '' );
      while Pos( ' ', Code ) > 0 do
        Delete( Code, Pos( ' ', Code ), 1 );
      if Code <> ''
        then
          begin
            CardAnalogInputs[i].CardBoardId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
            CardAnalogInputs[i].Entry := StrToInt( Copy( Code, Pos( ',', Code )+1, Length(Code)-Pos( ',', Code ) ) );
          end
        else
          begin
            CardAnalogInputs[i].CardBoardId := 0;
            CardAnalogInputs[i].Entry := NoData;
          end;
    end;
  finally
    Setup.free;
  end;
end;

procedure LoadAnalogOutputsIndex;
var
  Setup : TIniFile;
  i : integer;
  Code : string;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( AORange ) to High( AORange ) do
    begin
      CardAnalogOutputs[i].CardIndex := NoData;
      Code := Setup.ReadString( AnalogOutputsKey, AO_Names[i], '' );
      while Pos( ' ', Code ) > 0 do
        Delete( Code, Pos( ' ', Code ), 1 );
      if Code <> ''
        then
          begin
            CardAnalogOutputs[i].CardBoardId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
            CardAnalogOutputs[i].Entry := StrToInt( Copy( Code, Pos( ',', Code )+1, Length(Code)-Pos( ',', Code ) ) );
          end
        else
          begin
            CardAnalogOutputs[i].CardBoardId := 0;
            CardAnalogOutputs[i].Entry := NoData;
          end;
    end;
  finally
    Setup.free;
  end;
end;

procedure MatchDigitalInputsIndex;
var
  i, j : integer;
begin
  for i := Low( DIRange ) to High( DIRange ) do
    for j := 0 to Adv_Dev_Count-1 do
      if CardDigitalInputs[i].CardBoardId = Adv_Dev_Feature[j].dwBoardID
        then
          begin
            CardDigitalInputs[i].CardIndex := j;
            break;
          end;
end;

procedure MatchDigitalOutputsIndex;
var
  i, j : integer;
begin
  for i := Low( DORange ) to High( DORange ) do
    for j := 0 to Adv_Dev_Count-1 do
      if CardDigitalOutputs[i].CardBoardId = Adv_Dev_Feature[j].dwBoardID
        then
          begin
            CardDigitalOutputs[i].CardIndex := j;
            break;
          end;
end;

procedure MatchAnalogInputsIndex;
var
  i, j : integer;
begin
  for i := Low( AIRange ) to High( AIRange ) do
    for j := 0 to Adv_Dev_Count-1 do
      if CardAnalogInputs[i].CardBoardId = Adv_Dev_Feature[j].dwBoardID
        then
          begin
            CardAnalogInputs[i].CardIndex := j;
            break;
          end;
end;

procedure MatchAnalogOutputsIndex;
var
  i, j : integer;
begin
  for i := Low( AORange ) to High( AORange ) do
    for j := 0 to Adv_Dev_Count-1 do
      if CardAnalogOutputs[i].CardBoardId = Adv_Dev_Feature[j].dwBoardID
        then
          begin
            CardAnalogOutputs[i].CardIndex := j;
            break;
          end;
end;

procedure SaveDigitalInputsIndex;
var
  Setup : TIniFile;
  i : integer;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( DIRange ) to High( DIRange ) do
      Setup.WriteString( DigitalInputsKey, DI_Names[i], IntToStr( CardDigitalInputs[i].CardBoardId )+','+IntToStr( CardDigitalInputs[i].Entry) );
  finally
    Setup.free;
  end;
end;

procedure SaveDigitalOutputsIndex;
var
  Setup : TIniFile;
  i : integer;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( DORange ) to High( DORange ) do
      Setup.WriteString( DigitalOutputsKey, DO_Names[i], IntToStr( CardDigitalOutputs[i].CardBoardId )+','+IntToStr( CardDigitalOutputs[i].Entry) );
  finally
    Setup.free;
  end;
end;

procedure SaveAnalogInputsIndex;
var
  Setup : TIniFile;
  i : integer;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( AIRange ) to High( AIRange ) do
      Setup.WriteString( AnalogInputsKey, AI_Names[i], IntToStr( CardAnalogInputs[i].CardBoardId )+','+IntToStr( CardAnalogInputs[i].Entry) );
  finally
    Setup.free;
  end;
end;

procedure SaveAnalogOutputsIndex;
var
  Setup : TIniFile;
  i : integer;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( AORange ) to High( AORange ) do
      Setup.WriteString( AnalogOutputsKey, AI_Names[i], IntToStr( CardAnalogOutputs[i].CardBoardId )+','+IntToStr( CardAnalogOutputs[i].Entry) );
  finally
    Setup.free;
  end;
end;

// Digital Input
function Get_Digital_Input : DigitalInput;
var
 i : integer;
 Mask : cardinal;
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
    else result := false;
end;

function ReadAzPosition : cardinal;
var
  ReadPortWord : PT_ReadPortWord;
begin
  if PCI1710 > 0
    then
      begin
        ReadPortWord.port := 0;
        ReadPortWord.WordData := @result;
        DRV_ReadPortWord( Adv_Dev_Handle[ PCI1710 ], ReadPortWord );
        result := result and $FFF;
      end
    else result := 0;
end;

function ReadElPosition : cardinal;
var
  ReadByte : PT_DioReadPortByte;
  B        : smallint;
  Rst      : TCardinalBytes;
begin
  Rst.A := 0;
  ReadByte.Value := @B;
  if PCI1710 >= 0
    then
      begin
        ReadByte.Port := 3;
        DRV_DioReadPortByte(Adv_Dev_Handle[PCI1710], ReadByte);
        Rst.B0 := Byte(B);
      end;
  if PCI1780 >= 0
    then
      begin
        ReadByte.Port := 0;
        DRV_DioReadPortByte(Adv_Dev_Handle[PCI1780], ReadByte);
        Rst.B2 := Byte(B);
        ReadByte.Port := 1;
        DRV_DioReadPortByte(Adv_Dev_Handle[PCI1780], ReadByte);
        Rst.B3 := Byte(B);
      end;
  Result := Rst.A;
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
        DioWriteBit.state := smallint(State);
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
begin
  if PCI1710 >= 0
    then
      begin
        MAIBinaryIn.NumChan      := 16;
        MAIBinaryIn.StartChan    := 0;
        MAIBinaryIn.TrigMode     := Internal;
        MAIBinaryIn.ReadingArray := @Binaries;
        DRV_MAIBinaryIn(Adv_Dev_Handle[PCI1710], MAIBinaryIn);
        for i := Low(AIRange) to High(AIRange) do
          result[i] := Binaries[ CardAnalogInputs[ i ].Entry ];
      end;
end;

function Get_Analog_Input_Voltage_Channel( Binary : AnalogSample; Gain : GainCode ) : single;
var
  AIScale : PT_AIScale;
begin
  if PCI1710 >= 0
    then
      begin
        AIScale.reading  := Binary;
        AIScale.MaxCount := 4096;
        AIScale.offset   := 2048;
        AIScale.voltage  := @Result;
        case Gain of
         Gain_1   : AIScale.MaxVolt := 5.0;
         Gain_2   : AIScale.MaxVolt := 2.5;
         Gain_4   : AIScale.MaxVolt := 1.25;
         Gain_8   : AIScale.MaxVolt := 0.625;
         Gain_0_5 : AIScale.MaxVolt := 10.0;
        end;
        DRV_AIScale( Adv_Dev_Handle[PCI1710], AIScale );
      end;
end;

procedure Set_Analog_Input_Gains( Gains : AnalogGains );
var
  MAIConfig : PT_MAIConfig;
  i : integer;
  GainValues: AnalogGains;
begin
  if PCI1710 >= 0
    then
      begin
        for i := Low(AIRange) to High(AIRange) do
          GainValues[i] := Gains[ CardAnalogInputs[ i ].Entry ];
        MAIConfig.NumChan   := 16;
        MAIConfig.StartChan := 0;
        MAIConfig.GainArray := @GainValues;
        DRV_MAIConfig(Adv_Dev_Handle[PCI1710], MAIConfig);
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
        BinaryOut.BinData := Code;
        DRV_AOBinaryOut(Adv_Dev_Handle[CardAnalogOutputs[ Channel ].CardIndex], BinaryOut);
      end;
end;

// Frequency Generators

function Set_Trigger_Rate( Rate : cardinal ) : cardinal;
var
  FreqOutStart : PT_FreqOutStart;
  i, j         : byte;
  Diference    : integer;
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
    else result := Rate;
end;

function Set_Sample_Rate( Rate : cardinal ) : cardinal;
var
  FreqOutStart : PT_FreqOutStart;
  i, j         : byte;
  Diference    : integer;
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
    else result := Rate;
end;

// Counters

procedure Set_Counter_Timer( Timer : CounterRange; Code : word );
var
  FreqOutStart      : PT_FreqOutStart;
  CounterConfig     : PT_CounterConfig;
  CounterEventStart : PT_CounterEventStart;
  usMode            : integer;
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
      end;
end;

procedure Set_Counter_Timers( Codes : array of word );
var
  I : integer;
begin
  for I := Low(Codes) to High(Codes) do
    Set_Counter_Timer(I, Codes[I]);
end;

function Get_Freq_Counter : single;
begin
  result := 10000000;
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

procedure AddFilterValue( ThreeShots : PDWords; Index : byte; FT : PDWords; CellCount : cardinal );
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
    FRes := Abs( ThreeShots[X_1+i] - ((ThreeShots[X+i] + ThreeShots[X_2+i]) shr 1) );
    FT[ i ] := FT[ i ] + FRes;
  end;
end;

function Acquire_Single_Frame( CellCount  : cardinal;
                               out Ch1, Ch2 ) : boolean;
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
{$IFDEF DMA_TimeoutByTime}
  Starting,
  Finishing,
  Freq            : int64;
{$ENDIF}
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
        FAIDmaExStart.ClockSrc := 2;
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
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceFrequency(Freq);
{$ENDIF}
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceCounter(Starting);
{$ELSE}
        Loop := MaxLoopCount;
{$ENDIF}
        try
          repeat
            DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
{$IFDEF DMA_TimeoutByTime}
            QueryPerformanceCounter(Finishing);
            if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
            then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
{$ELSE}
            if Loop > 0
              then dec(Loop)
              else raise EAcqError.Create('DMA loop timeout');
{$ENDIF}
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

function Acquire_Az_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        SM1, SM2    : PDWords;
                                        Filter1, Filter2 : PDWords ) : boolean;
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Shots         : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  SqS_1, SqS_2  : pointer;      // Sum X^2
  FT1, FT2      : PDWords;
  FB1, FB2      : PDWords;
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
{$IFDEF DMA_TimeoutByTime}
  Starting,
  Finishing,
  Freq          : int64;
{$ENDIF}
begin
  Result := false;
  Sum_1 := nil;
  Sum_2 := nil;
  SqS_1 := nil;
  SqS_2 := nil;
  FB1  := nil;
  FT1  := nil;
  FB2  := nil;
  FT2  := nil;
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
        GetMem( SqS_1, BufferSize );
        GetMem( SqS_2, BufferSize );
        GetMem( FT1, BufferSize );
        GetMem( FT2, BufferSize );
        GetMem( FB1, FilterSize );
        GetMem( FB2, FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );
        VirtualLock( SqS_1, BufferSize );
        VirtualLock( SqS_2, BufferSize );
        VirtualLock( FT1, BufferSize );
        VirtualLock( FB1, FilterSize );
        VirtualLock( FT2, BufferSize );
        VirtualLock( FB2, FilterSize );
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
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceFrequency(Freq);
{$ENDIF}
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // PPI loop
          Shots := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          FillChar( SqS_1^, BufferSize, 0 );
          FillChar( SqS_2^, BufferSize, 0 );
          FillChar( FT1^,   BufferSize, 0 );
          FillChar( FT2^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div 4096) = CurrentSector do
            begin // Sector loop
{$IFDEF DMA_TimeoutByTime}
              QueryPerformanceCounter(Starting);
{$ELSE}
              Loop := MaxLoopCount;
{$ENDIF}
              try
                repeat
{$IFDEF DMA_TimeoutByTime}
                  QueryPerformanceCounter(Finishing);
                  if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
                    then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
{$ELSE}
                  if Loop > 0
                    then dec(Loop)
                    else raise EAcqError.Create('DMA loop timeout');
{$ENDIF}
                  DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
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
              AddData2TwoChannels( SqS_1, SqS_2, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter1 ) or Assigned( Filter2 )
                then
                  begin
                    FillChar( FB1^[(Shots mod PermanentEchoFilterOrder) * CellCount], BufferSize, 0 );
                    FillChar( FB2^[(Shots mod PermanentEchoFilterOrder) * CellCount], BufferSize, 0 );
                    AddDataTwoChannles( @FB1^[(Shots mod PermanentEchoFilterOrder) * CellCount],
                                        @FB2^[(Shots mod PermanentEchoFilterOrder) * CellCount],
                                        CellCount, BufferAcq[Wrk].Buffer );
                    //si mas de tres rayos calculo y sumo en Filter
                    if Shots >= PermanentEchoFilterOrder-1
                      then
                        begin
                          AddFilterValue( FB1, (Shots mod PermanentEchoFilterOrder), FT1, CellCount );
                          AddFilterValue( FB2, (Shots mod PermanentEchoFilterOrder), FT2, CellCount );
                        end;
                  end;
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
                // Square Mean
                if Assigned( SM1 )
                  then AverageData( SqS_1, @SM1^[Index], CellCount, Shots );
                if Assigned( SM2 )
                  then AverageData( SqS_2, @SM2^[Index], CellCount, Shots );
                // Filter Mean
                if Assigned( Filter1 ) and (Shots > PermanentEchoFilterOrder-1)
                  then AverageData( FT1, @Filter1^[Index], CellCount, Shots-(PermanentEchoFilterOrder-1) );
                if Assigned( Filter2 ) and (Shots > PermanentEchoFilterOrder-1)
                  then AverageData( FT2, @Filter2^[Index], CellCount, Shots-(PermanentEchoFilterOrder-1) );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        until CurrentSector = FirstSector;

        Result := true;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( SqS_1 ) then VirtualUnlock( SqS_1, BufferSize );
        if assigned( SqS_2 ) then VirtualUnlock( SqS_2, BufferSize );
        if assigned( FT1 ) then VirtualUnlock( FT1, BufferSize );
        if assigned( FB1 ) then VirtualUnlock( FB1, FilterSize );
        if assigned( FT2 ) then VirtualUnlock( FT2, BufferSize );
        if assigned( FB2 ) then VirtualUnlock( FB2, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( SqS_1 ) then FreeMem( SqS_1 );
        if assigned( SqS_2 ) then FreeMem( SqS_2 );
        if assigned( FT1 ) then FreeMem( FT1 );
        if assigned( FB1 ) then FreeMem( FB1 );
        if assigned( FT2 ) then FreeMem( FT2 );
        if assigned( FB2 ) then FreeMem( FB2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority( Thread, SavedPriority );
        ReleaseMutex( AcquiringMutex );
      end;
end;

function Acquire_Az_SectorsOneChannel( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       SectorCount : cardinal;
                                       CellCount   : cardinal;
                                       Ch, SM      : PDWords;
                                       Filter      : PDWords ) : boolean;
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  Shots         : cardinal;
  Sum, SqS      : pointer;
  FT            : PDWords;
  FB            : PDWords;
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
{$IFDEF DMA_TimeoutByTime}
  Starting,
  Finishing     : int64;
  Freq          : int64;
{$ENDIF}
begin
  Result := false;
  Sum := nil;
  SqS := nil;
  FB  := nil;
  FT  := nil;
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
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize div 2 );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize div 2 );
        GetMem( Sum, BufferSize );
        GetMem( SqS, BufferSize );
        GetMem( FT,  BufferSize );
        GetMem( FB, FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum, BufferSize );
        VirtualLock( SqS, BufferSize );
        VirtualLock( FT, BufferSize );
        VirtualLock( FB, FilterSize );
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
        FAIDmaExStart.Count      := CellCount; //One Channel
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
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceFrequency(Freq);
{$ENDIF}
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // PPI loop
          Shots := 0;
          FillChar( Sum^, BufferSize, 0 );
          FillChar( SqS^, BufferSize, 0 );
          FillChar( FT^, BufferSize, 0 );
          while ((Deva.Read_Encoder_X * SectorCount) div 4096) = CurrentSector do
            begin // Sector loop
{$IFDEF DMA_TimeoutByTime}
              QueryPerformanceCounter(Starting);
{$ELSE}
              Loop := MaxLoopCount;
{$ENDIF}
              try
                repeat
{$IFDEF DMA_TimeoutByTime}
                  QueryPerformanceCounter(Finishing);
                  if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
                    then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
{$ELSE}
                  if Loop > 0
                    then dec(Loop)
                    else raise EAcqError.Create('DMA loop timeout');
{$ENDIF}
                  DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
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
              AddDataOneChannel( BufferAcq[Wrk].Buffer, Sum, CellCount );
              AddData2OneChannel( SqS, nil, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter )
                then
                  begin
                    FillChar( FB^[(Shots mod PermanentEchoFilterOrder) * CellCount], BufferSize, 0 );
                    AddDataOneChannel( BufferAcq[Wrk].Buffer, @FB^[(Shots mod PermanentEchoFilterOrder) * CellCount], CellCount );
                    //si mas de tres rayos calculo y sumo en Filter
                    if Shots >= PermanentEchoFilterOrder - 1
                      then AddFilterValue( FB, (Shots mod PermanentEchoFilterOrder), FT, CellCount );
                  end;
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
                // Square Mean
                if Assigned( SM )
                  then AverageData( SqS, @SM^[Index], CellCount, Shots );
                // Filter Mean
                if Assigned( Filter ) and (Shots > PermanentEchoFilterOrder-1)
                  then AverageData( FT, @Filter^[Index], CellCount, Shots-(PermanentEchoFilterOrder-1) );
              end;
          CurrentSector := (Deva.Read_Encoder_X * SectorCount) div 4096;
        until CurrentSector = FirstSector;

        Result := true;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( SqS ) then VirtualUnlock( SqS, BufferSize );
        if assigned( FT ) then VirtualUnlock( FT, BufferSize );
        if assigned( FB ) then VirtualUnlock( FB, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( SqS ) then FreeMem( SqS );
        if assigned( FT ) then FreeMem( FT );
        if assigned( FB ) then FreeMem( FB );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority( Thread, SavedPriority );
        ReleaseMutex( AcquiringMutex );
      end;
end;

function Acquire_El_SectorsTwoChannels( Port : integer;
                                        SampleRate  : cardinal;
                                        ClockSource : boolean;
                                        SectorCount : cardinal;
                                        Start       : integer;
                                        Finish      : integer;
                                        CellCount   : cardinal;
                                        Ch1, Ch2    : PDWords;
                                        SM1, SM2    : PDWords;
                                        Filter1, Filter2 : PDWords ) : boolean;
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
  SqS_1, SqS_2  : pointer;      // Sum X^2
  FT1, FT2      : PDWords;
  FB1, FB2      : PDWords;
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
{$IFDEF DMA_TimeoutByTime}
  Starting,
  Finishing,
  Freq            : int64;
{$ENDIF}
begin
  Result := false;
  Sum_1 := nil;
  Sum_2 := nil;
  SqS_1 := nil;
  SqS_2 := nil;
  FB1   := nil;
  FT1   := nil;
  FB2   := nil;
  FT2   := nil;
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
        GetMem( SqS_1, BufferSize );
        GetMem( SqS_2, BufferSize );
        GetMem( FT1, BufferSize );
        GetMem( FT2, BufferSize );
        GetMem( FB1, FilterSize );
        GetMem( FB2, FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum_1, BufferSize );
        VirtualLock( Sum_2, BufferSize );
        VirtualLock( SqS_1, BufferSize );
        VirtualLock( SqS_2, BufferSize );
        VirtualLock( FT1, BufferSize );
        VirtualLock( FB1, FilterSize );
        VirtualLock( FT2, BufferSize );
        VirtualLock( FB2, FilterSize );
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
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceFrequency(Freq);
{$ENDIF}
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum_1^, BufferSize, 0 );
          FillChar( Sum_2^, BufferSize, 0 );
          FillChar( SqS_1^, BufferSize, 0 );
          FillChar( SqS_2^, BufferSize, 0 );
          FillChar( FT1^,   BufferSize, 0 );
          FillChar( FT2^,   BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096) = integer(CurrentSector) do
            begin // Sector loop
{$IFDEF DMA_TimeoutByTime}
              QueryPerformanceCounter(Starting);
{$ELSE}
              Loop := MaxLoopCount;
{$ENDIF}
              try
                repeat
{$IFDEF DMA_TimeoutByTime}
                  QueryPerformanceCounter(Finishing);
                  if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
                    then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
{$ELSE}
                  if Loop > 0
                    then dec(Loop)
                    else raise EAcqError.Create('DMA loop timeout');
{$ENDIF}
                  DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
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
              AddData2TwoChannels( SqS_1, SqS_2, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter1 ) or Assigned( Filter2 )
                then
                  begin
                    FillChar( FB1^[(ShotCount mod PermanentEchoFilterOrder) * CellCount], BufferSize, 0 );
                    FillChar( FB2^[(ShotCount mod PermanentEchoFilterOrder) * CellCount], BufferSize, 0 );
                    AddDataTwoChannles( @FB1^[(ShotCount mod PermanentEchoFilterOrder) * CellCount],
                                        @FB2^[(ShotCount mod PermanentEchoFilterOrder) * CellCount],
                                        CellCount, BufferAcq[Wrk].Buffer );
                    //si mas de tres rayos calculo y sumo en Filter
                    if ShotCount >= PermanentEchoFilterOrder-1
                      then
                        begin
                          AddFilterValue( FB1, (ShotCount mod PermanentEchoFilterOrder), FT1, CellCount );
                          AddFilterValue( FB2, (ShotCount mod PermanentEchoFilterOrder), FT2, CellCount );
                        end;
                  end;
              Inc( ShotCount );
              if ShotCount > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
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
                // Square Mean
                if Assigned( SM1 )
                  then AverageData( SqS_1, @SM1^[Index], CellCount, ShotCount );
                if Assigned( SM2 )
                  then AverageData( SqS_2, @SM2^[Index], CellCount, ShotCount );
                // Filter Mean
                if Assigned( Filter1 ) and (ShotCount > PermanentEchoFilterOrder-1)
                  then AverageData( FT1, @Filter1^[Index], CellCount, ShotCount-(PermanentEchoFilterOrder-1) );
                if Assigned( Filter2 ) and (ShotCount > PermanentEchoFilterOrder-1)
                  then AverageData( FT2, @Filter2^[Index], CellCount, ShotCount-(PermanentEchoFilterOrder-1) );
              end;
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;
        until CurrentSector >= FinishSector;
        Result := true;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( SqS_1 ) then VirtualUnlock( SqS_1, BufferSize );
        if assigned( SqS_2 ) then VirtualUnlock( SqS_2, BufferSize );
        if assigned( FT1 ) then VirtualUnlock( FT1, BufferSize );
        if assigned( FB1 ) then VirtualUnlock( FB1, FilterSize );
        if assigned( FT2 ) then VirtualUnlock( FT2, BufferSize );
        if assigned( FB2 ) then VirtualUnlock( FB2, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( SqS_1 ) then FreeMem( SqS_1 );
        if assigned( SqS_2 ) then FreeMem( SqS_2 );
        if assigned( FT1 ) then FreeMem( FT1 );
        if assigned( FB1 ) then FreeMem( FB1 );
        if assigned( FT2 ) then FreeMem( FT2 );
        if assigned( FB2 ) then FreeMem( FB2 );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end;
end;

function Acquire_El_SectorsOneChannel( Port : integer;
                                       SampleRate  : cardinal;
                                       ClockSource : boolean;
                                       SectorCount : cardinal;
                                       Start       : integer;
                                       Finish      : integer;
                                       CellCount   : cardinal;
                                       Ch, SM      : PDWords;
                                       Filter      : PDWords ) : boolean;
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
  Sum, SqS      : pointer;
  FT            : PDWords;
  FB            : PDWords;
  Thread        : integer;
  SavedPriority : integer;
  Index         : integer;
  BufferSize,
  FilterSize    : cardinal;
  StartSector   : integer;
  FinishSector  : integer;

  BufferAcq     : TBufferAcq;
  GainList      : PVideoGains;
  CurrentFrame  : cardinal;
  Acq, Wrk      : boolean;
{$IFDEF DMA_TimeoutByTime}
  Starting,
  Finishing,
  Freq          : int64;
{$ENDIF}
begin
  Result := false;
  Sum := nil;
  SqS := nil;
  FB  := nil;
  FT  := nil;
  Acq := false;
  Wrk := true;
  StartSector  := (Start  * integer(SectorCount)) div 4096;
  FinishSector := (Finish * integer(SectorCount)) div 4096;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * SizeOf( Cardinal );
  FilterSize := BufferSize * PermanentEchoFilterOrder;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize div 2 );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize div 2 );
        GetMem( Sum, BufferSize );
        GetMem( SqS, BufferSize );
        GetMem( FT,  BufferSize );
        GetMem( FB,  FilterSize );
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock( Sum, BufferSize );
        VirtualLock( SqS, BufferSize );
        VirtualLock( FT, BufferSize );
        VirtualLock( FB, FilterSize );
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
        FAIDmaExStart.Count      := CellCount; //One Channel
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);

        // Wait for sector start
        CurrentSector := Deva.Read_Encoder_Int_Y;
        while CurrentSector >= Deva.Read_Encoder_Int_Y do Sleep(0);

        //Comienzo a adquirir
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceFrequency(Freq);
{$ENDIF}
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );

        CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;
        repeat  // RHI loop
          ShotCount := 0;
          FillChar( Sum^, BufferSize, 0 );
          FillChar( SqS^, BufferSize, 0 );
          FillChar( FT^, BufferSize, 0 );
          while ((Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096) = integer(CurrentSector) do
            begin // Sector loop
{$IFDEF DMA_TimeoutByTime}
              QueryPerformanceCounter(Starting);
{$ELSE}
              Loop := MaxLoopCount;
{$ENDIF}
              try
                repeat
{$IFDEF DMA_TimeoutByTime}
                  QueryPerformanceCounter(Finishing);
                  if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
                    then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
{$ELSE}
                  if Loop > 0
                    then dec(Loop)
                    else raise EAcqError.Create('DMA loop timeout');
{$ENDIF}
                  DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
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
              AddDataOneChannel( BufferAcq[Wrk].Buffer, Sum, CellCount );
              AddData2OneChannel( SqS, nil, CellCount, BufferAcq[Wrk].Buffer );
              if Assigned( Filter )
                then
                  begin
                    FillChar( FB^[(ShotCount mod PermanentEchoFilterOrder) * CellCount], BufferSize, 0 );
                    AddDataOneChannel( BufferAcq[Wrk].Buffer, @FB^[(ShotCount mod PermanentEchoFilterOrder) * CellCount], CellCount );
                    //si mas de tres rayos calculo y sumo en Filter
                    if ShotCount >= PermanentEchoFilterOrder-1
                      then AddFilterValue( FB, (ShotCount mod PermanentEchoFilterOrder), FT, CellCount );
                  end;
              Inc( ShotCount );
              if ShotCount > Max_ShotCount
                then raise EAcqError.Create('Shotcount Overflow (>' + IntToStr(Max_ShotCount) + ')');
            end;
          Index := (CurrentSector - StartSector) * integer(CellCount);
          if ShotCount > 0
            then
              begin
                // Mean
                if Assigned( Ch )
                  then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
                // Square Mean
                if Assigned( SM )
                  then AverageData( SqS, @SM^[Index], CellCount, ShotCount );
                // Filter Mean
                if Assigned( Filter ) and (ShotCount > PermanentEchoFilterOrder-1)
                  then AverageData( FT, @Filter^[Index], CellCount, ShotCount-(PermanentEchoFilterOrder-1) );
              end;
          CurrentSector := (Deva.Read_Encoder_Int_Y * integer(SectorCount)) div 4096;
        until CurrentSector >= FinishSector;
        Result := true;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( SqS ) then VirtualUnlock( SqS, BufferSize );
        if assigned( FT )  then VirtualUnlock( FT, BufferSize );
        if assigned( FB )  then VirtualUnlock( FB, FilterSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( SqS ) then FreeMem( SqS );
        if assigned( FT )  then FreeMem( FT );
        if assigned( FB )  then FreeMem( FB );
        if assigned( BufferAcq[Acq].Buffer ) then GlobalFree( BufferAcq[Acq].Handle );
        if assigned( BufferAcq[Wrk].Buffer ) then GlobalFree( BufferAcq[Wrk].Handle );
        Dispose( GainList );
        SetThreadPriority(Thread, SavedPriority);
        ReleaseMutex(AcquiringMutex);
      end;
end;

function Acquire_FramesTwoChannels( Port : integer;
                                    SampleRate  : cardinal;
                                    ClockSource : boolean;
                                    FrameCount  : cardinal;
                                    ShotCount   : cardinal;
                                    CellCount   : cardinal;
                                    Ch1, Ch2    : PDWords;
                                    SM1, SM2    : PDWords;
                                    out Missed  : integer ) : boolean;
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  MissCount     : cardinal;
  Sum_1, Sum_2  : pointer;      // Sum X
  SqS_1, SqS_2  : pointer;      // Sum X^2
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
{$IFDEF DMA_TimeoutByTime}
  Starting,
  Finishing,
  Freq          : int64;
{$ENDIF}
begin
  Result := false;
  Sum_1 := nil;
  Sum_2 := nil;
  SqS_1 := nil;
  SqS_2 := nil;
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
        GetMem(SqS_1, BufferSize);
        GetMem(SqS_2, BufferSize);
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock(Sum_1, BufferSize);
        VirtualLock(Sum_2, BufferSize);
        VirtualLock(SqS_1, BufferSize);
        VirtualLock(SqS_2, BufferSize);
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
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceFrequency(Freq);
{$ENDIF}
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );
        MissCount := 0;

        for CurrentFrame := 0 to FrameCount - 1 do
          begin
            FillChar(Sum_1^, BufferSize, 0);
            FillChar(Sum_2^, BufferSize, 0);
            FillChar(SqS_1^, BufferSize, 0);
            FillChar(SqS_2^, BufferSize, 0);
            Index := 0;
            while Index < ShotCount do
              begin // Frame loop
{$IFDEF DMA_TimeoutByTime}
                QueryPerformanceCounter(Starting);
{$ELSE}
                Loop := MaxLoopCount;
{$ENDIF}
                try
                  repeat
{$IFDEF DMA_TimeoutByTime}
                    QueryPerformanceCounter(Finishing);
                    if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
                      then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
{$ELSE}
                    if Loop > 0
                      then dec(Loop)
                      else raise EAcqError.Create('DMA loop timeout');
{$ENDIF}
                    DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
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
                AddData2TwoChannels( SqS_1, SqS_2, CellCount, BufferAcq[Wrk].Buffer );
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
                  // Square Mean
                  if Assigned( SM1 )
                    then AverageData( SqS_1, @SM1^[Index], CellCount, ShotCount );
                  if Assigned( SM2 )
                    then AverageData( SqS_2, @SM2^[Index], CellCount, ShotCount );
                end;
          end;
        Missed := MissCount;
        Result := true;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum_1 ) then VirtualUnlock( Sum_1, BufferSize );
        if assigned( Sum_2 ) then VirtualUnlock( Sum_2, BufferSize );
        if assigned( SqS_1 ) then VirtualUnlock( SqS_1, BufferSize );
        if assigned( SqS_2 ) then VirtualUnlock( SqS_2, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum_1 ) then FreeMem( Sum_1 );
        if assigned( Sum_2 ) then FreeMem( Sum_2 );
        if assigned( SqS_1 ) then FreeMem( SqS_1 );
        if assigned( SqS_2 ) then FreeMem( SqS_2 );
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
                                   FrameCount  : cardinal;
                                   ShotCount   : cardinal;
                                   CellCount   : cardinal;
                                   Ch, SM      : PDWords;
                                   out Missed  : integer ) : boolean;
var
  FAIDmaExStart : PT_FAIDmaExStart;
  FAICheck      : PT_FAICheck ;
  Done, Loop    : cardinal;
  FirstSector   : cardinal;
  CurrentSector : cardinal;
  MissCount     : cardinal;
  Sum, SqS      : pointer;
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
{$IFDEF DMA_TimeoutByTime}
  Starting,
  Finishing,
  Freq          : int64;
{$ENDIF}
begin
  Result := false;
  Sum := nil;
  SqS := nil;
  Acq := false;
  Wrk := true;
  Thread := GetCurrentThread;
  SavedPriority := GetThreadPriority(Thread);
  BufferSize := CellCount * sizeof( Word ) * 4;
  if WaitForSingleObject(AcquiringMutex, 1000) = WAIT_OBJECT_0
    then
      try
        //Allocate Memory
        BufferAcq[Acq].Handle := GlobalAlloc( GPTR, BufferSize div 4 );
        BufferAcq[Wrk].Handle := GlobalAlloc( GPTR, BufferSize div 4);
        GetMem(Sum, BufferSize);
        GetMem(SqS, BufferSize);
        New( GainList );
        GainList^ := LoadVideoGains;

        //Protect Memory
        VirtualLock(Sum, BufferSize);
        VirtualLock(SqS, BufferSize);
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
        FAIDmaExStart.Count      := CellCount; //One Channel
        FAIDmaExStart.buffer0    := BufferAcq[Acq].Buffer;

        //Cambio de prioridad
        SetThreadPriority(Thread, AcquirePriority);
        //Comienzo a adquirir
{$IFDEF DMA_TimeoutByTime}
        QueryPerformanceFrequency(Freq);
{$ENDIF}
        DRV_FAIDmaExStart( Adv_Dev_Handle[PCI1714], FAIDmaExStart );
        MissCount := 0;

        for CurrentFrame := 0 to FrameCount - 1 do
          begin
            FillChar(Sum^, BufferSize, 0);
            FillChar(SqS^, BufferSize, 0);
            Index := 0;
            while Index < ShotCount do
              begin // Frame loop
{$IFDEF DMA_TimeoutByTime}
              QueryPerformanceCounter(Starting);
{$ELSE}
              Loop := MaxLoopCount;
{$ENDIF}
                try
                  repeat
{$IFDEF DMA_TimeoutByTime}
                  QueryPerformanceCounter(Finishing);
                  if (Finishing-Starting)*1000000/Freq >= MaxLoopTime
                    then raise EAcqError.Create('DMA loop timeout ' + FormatFloat( '0.00', (Finishing-Starting)*1000000/Freq ) + ' us');
{$ELSE}
                  if Loop > 0
                    then dec(Loop)
                    else raise EAcqError.Create('DMA loop timeout');
{$ENDIF}
                    DRV_FAICheck( Adv_Dev_Handle[PCI1714], FAICheck );
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
                AddDataOneChannel( BufferAcq[Wrk].Buffer, Sum, CellCount );
                AddData2OneChannel( SqS, nil, CellCount, BufferAcq[Wrk].Buffer );
                inc(Index);
              end;
            Index := CurrentFrame * CellCount;
            if ShotCount > 0
              then
                begin
                  // Mean
                  if Assigned( Ch )
                    then AverageData( Sum, @Ch^[Index], CellCount, ShotCount );
                  // Square Mean
                  if Assigned( SM )
                    then AverageData( SqS, @SM^[Index], CellCount, ShotCount );
                end;
          end;
        Missed := MissCount;
        Result := true;
      finally
        DRV_FAIStop( Adv_Dev_Handle[PCI1714] );

        if assigned( Sum ) then VirtualUnlock( Sum, BufferSize );
        if assigned( SqS ) then VirtualUnlock( SqS, BufferSize );
        GlobalUnlock( BufferAcq[Acq].Handle );
        GlobalUnlock( BufferAcq[Wrk].Handle );
        if assigned( Sum ) then FreeMem( Sum );
        if assigned( SqS ) then FreeMem( SqS );
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
{$IFDEF TestCards}
  if PCI1710 >= 0
    then Set_Analog_Input_Gains( Gains )
    else raise ECardError.Create( 'No se encontro la tarjeta PCI_1710' );
{$ELSE}
  if PCI1710 >= 0
    then Set_Analog_Input_Gains( Gains );
{$ENDIF}
end;

procedure Init_PCI1714;
begin
  AcquiringMutex := CreateMutex(nil, false, AcquiringMutexName);
{$IFDEF TestCards}
  if PCI1714 < 0
    then raise ECardError.Create( 'No se encontro la tarjeta PCI_1714' );
{$ENDIF}
end;

procedure Init_PCI1720;
var
  AOConfig : PT_AOConfig;
begin
{$IFDEF TestCards}
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
      end
    else raise ECardError.Create( 'No se encontro la tarjeta PCI_1720' );
{$ELSE}
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
{$ENDIF}
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
{$IFDEF TestCards}
  if PCI1780 >= 0
    then
      begin
        //Timers
        //Counters Sample Rate 10 MHz
        FreqOutStart.usChannel := 2;
        FreqOutStart.usDivider := 1;
        FreqOutStart.usFoutSrc := PA_FOUT_SRC_CLK_10MHZ;
        DRV_FreqOutStart( Adv_Dev_Handle[PCI1780], FreqOutStart );
      end
    else raise ECardError.Create( 'No se encontro la tarjeta PCI_1780' );
{$ELSE}
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
{$ENDIF}
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

procedure DonePCI1714;
begin
  CloseHandle( AcquiringMutex );
end;

procedure Init_Devices;
var
  I : integer;
  GetFeatures : PT_DeviceGetFeatures;
  AO : AnalogOutput;
begin
  DRV_DeviceGetNumOfList(Adv_Dev_Count);
  SetLength( Adv_Dev_Handle, Adv_Dev_Count );
  SetLength( Adv_Dev_Feature, Adv_Dev_Count );
  for I := 0 to Adv_Dev_Count - 1 do
    begin
      DRV_DeviceOpen(I, Adv_Dev_Handle[I]);
      GetFeatures.buffer := @Adv_Dev_Feature[I];
      GetFeatures.size   := sizeof(Adv_Dev_Feature[I]);
      DRV_DeviceGetFeatures(Adv_Dev_Handle[I], GetFeatures);
      case Adv_Dev_Feature[I].dwBoardID of
        BD_PCI1710  : PCI1710  := I;
        BD_PCI1714  : PCI1714  := I;
        BD_PCI1720  : PCI1720  := I;
        BD_PCI1730  : PCI1730  := I;
        BD_PCI1780  : PCI1780  := I;
        BD_PCI1733  : PCI1733  := I;
      end;
    end;
  LoadDigitalInputsIndex;
  LoadDigitalOutputsIndex;
  LoadAnalogInputsIndex;
  LoadAnalogOutputsIndex;

  MatchDigitalInputsIndex;
  MatchDigitalOutputsIndex;
  MatchAnalogInputsIndex;
  MatchAnalogOutputsIndex;

  Init_PCI1710;
  Init_PCI1714;
  Init_PCI1720;
  Init_PCI1730;
  Init_PCI1780;
  Set_Digital_Output(0);
  AO[0] := 2048;
  AO[1] := 2048;
  Set_Analog_Output(AO);
end;

procedure Done_Devices;
var
  I : integer;
begin
  DonePCI1780;
  DonePCI1714;
  for I := 0 to Adv_Dev_Count - 1 do
    DRV_DeviceClose( Adv_Dev_Handle[I] );
  Adv_Dev_Feature := nil;
  Adv_Dev_Handle := nil;
end;

end.
