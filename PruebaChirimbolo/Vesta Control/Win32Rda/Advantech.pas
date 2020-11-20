unit Advantech;

interface

uses
  Classes, Windows, ElbrusTypes, SysUtils, Driver, Constants, Mutex;

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
  CFG_DeviceNumber = 0;
  CFG_BoardID      = 1;
  CFG_SwitchID     = 2;
  CFG_SlotID       = 2;

  AdvantechMutexName = 'Advantech_Mutex';

var
  AdvantechMutex : TMutex    = nil;

type
  TDevList     = array of PT_DevList;
  TIntArray    = array of integer;
  TFeatureList = array of DEVFEATURES;
  TEntry =
    record
      Signal       : cardinal;
      SignalName   : string;
      CardIndex    : integer;
      CardBoardId  : cardinal;
      CardSwitchId : cardinal;
      Entry        : cardinal;
      DefaultValue : integer;
    end;
    
  TSignalMap      = array of TEntry;
  TDigitalInputs  = array [DIRange] of TEntry;
  TDigitalOutputs = array [DORange] of TEntry;
  TAnalogInputs   = array [AIRange] of TEntry;
  TAnalogOutputs  = array [AORange] of TEntry;

var
  Adv_Dev_Count   : smallint;
  Adv_Dev_Handle  : TIntArray;
  Adv_Dev_Feature : TFeatureList;
  Adv_Dev_List    : TDevList;
  Adv_Dev_BoardIDs    : array of cardinal;
  Adv_Dev_PropertyIDs : array of cardinal;

  CardDigitalInputs  : TSignalMap;
  CardDigitalOutputs : TSignalMap;
  CardAnalogInputs   : TSignalMap;
  CardAnalogOutputs  : TSignalMap;

//General
procedure LoadInputSignals(SignalMap : TSignalMap; SignalNames : TSignalNames; SignalSection : string);
procedure MatchInputSignals(SignalMap : TSignalMap);

// Drivers
procedure Init_Devices;
procedure Done_Devices;

// Digital Input
function  Get_Digital_Input : DigitalInput;
function  Get_Digital_Input_Bit( Bit : DIRange ) : boolean;

// Digital Output
function Set_Digital_Output    ( Bits : DigitalOutput ) : DigitalOutput;
function Set_Digital_Output_Bit( Bit  : DORange; State : boolean ) : boolean;

// Analog Input
function  Get_Analog_Input : AnalogInput;
function  Get_Analog_Input_Channel( Channel : AIRange ) : AnalogSample;
function  Get_Analog_Input_Voltage_Channel( Channel : integer; Gain : GainCode ) : single;
function  Scale_Analog_Input_Channel( Channel : integer; Binary : AnalogSample; Gain : GainCode ) : single;
procedure Set_Analog_Input_Gains(Gains   : AnalogGains);
procedure Set_Analog_Input_Gain_Channel( Channel : integer; Gain : GainCode);

// Analog Output
procedure Set_Analog_Output        ( Codes : AnalogOutput );
procedure Set_Analog_Output_Channel( Channel : AORange; Code : AnalogCode );

implementation

uses
  Registry,
  Deva,
  Math, Parameters, EventLog, LogTools, IniFiles,
  Config;

const
  MissLimit       = 1000;
  MaxTimeElapsed  = 120000;
  MinimalFrequencyInterval = 10;
  NoData = 5000;

type
  TCardinalBytes = packed record
  case cardinal of
    0 : (A : cardinal);
    1 : (B0, B1, B2, B3 : byte);
  end;

//General

procedure LoadInputSignals(SignalMap : TSignalMap; SignalNames : TSignalNames; SignalSection : string);
var
  Setup : TIniFile;
  i : integer;
  Code : string;
begin
  Setup := TIniFile.Create( ExtractFilePath( ParamStr(0) ) + ConfigFile );
  try
    for i := Low( SignalMap ) to High( SignalMap ) do
    begin
      SignalMap[i].Signal       := i;
      SignalMap[i].SignalName   := SignalNames[i];
      SignalMap[i].CardIndex    := NoData;
      SignalMap[i].CardBoardId  := 0;
      SignalMap[i].CardSwitchId := NoData;
      SignalMap[i].Entry        := NoData;
      SignalMap[i].DefaultValue := NoData;

      Code := Setup.ReadString( SignalSection, SignalNames[i], '0' );
      if Code <> ''
        then
          begin
            while Pos(' ', Code) > 0 do
              Delete(Code, Pos(' ', Code), 1);
            try
              Code := Code + ',';
              SignalMap[i].CardBoardId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
              Delete(Code, 1, Pos( ',', Code ));
              if SignalMap[i].CardBoardId <> 0
                then
                  begin
                    if Code <> ''
                      then
                        begin
                          SignalMap[i].CardSwitchId := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
                          Delete(Code, 1, Pos( ',', Code ));
                          if Code <> ''
                            then
                              begin
                                SignalMap[i].Entry := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
                                Delete(Code, 1, Pos( ',', Code ));
                                if Code <> ''
                                  then SignalMap[i].DefaultValue := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
                              end
                            else raise Exception.Create('');
                        end
                      else raise Exception.Create('');
                  end
                else
                  begin
                    if Code <> ''
                      then SignalMap[i].DefaultValue := StrToInt( Copy( Code, 1, Pos( ',', Code )-1 ) );
                  end;
            except
              SignalMap[i].CardBoardId  := 0;
              SignalMap[i].CardIndex    := NoData;
              SignalMap[i].CardSwitchId := NoData;
              SignalMap[i].Entry        := NoData;
              SignalMap[i].DefaultValue := NoData;
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
  begin
        if SignalMap[i].CardBoardId <> 0
      then
        for j := 0 to Adv_Dev_Count-1 do
          if (SignalMap[i].CardBoardId = Adv_Dev_BoardIDs[j]) and (SignalMap[i].CardSwitchId = Adv_Dev_PropertyIDs[j])
            then
              begin
                SignalMap[i].CardIndex := j;
                break;
              end;
  end;
end;

// Digital Input
function Get_Digital_Input : DigitalInput;
var
 i : integer;
begin
  result := 0;
  if AdvantechMutex.WaitFor(1000)
    then
      try
        for i := Low(DIRange) to High(DIRange) do
          result := result or (DigitalInput(Ord(Get_Digital_Input_Bit(i))) shl i);
      finally
        AdvantechMutex.Release;
      end;
end;

function Get_Digital_Input_Bit( Bit : DIRange ) : boolean;
var
  DioReadBit : PT_DioReadBit;
  Rst        : smallint;
  Index      : byte;
begin
  if CardDigitalInputs[ Bit ].DefaultValue <> NoData
    then result := CardDigitalInputs[ Bit ].DefaultValue <> 0
    else
      if CardDigitalInputs[ Bit ].CardIndex <> NoData
        then
          begin
            Index := CardDigitalInputs[ Bit ].Entry;
            DioReadBit.state := @Rst;
            DioReadBit.bit   := Index mod 8;
            DioReadBit.port  := Index div 8;
            DRV_DioReadBit(Adv_Dev_Handle[CardDigitalInputs[ Bit ].CardIndex], DioReadBit);
            Result := boolean(Rst);
          end
        else result := false;  
end;

// Digital Output
function Set_Digital_Output( Bits : DigitalOutput ) : DigitalOutput;
var
  i : integer;
  State : boolean;
begin
  result := Bits;
  if AdvantechMutex.WaitFor(1000)
    then
      try
        result := 0;
        for i := Low( DORange ) to High( DORange ) do
        begin
          State := (Bits and (cardinal(1) shl i)) <> 0;
          result := result or (Ord(Set_Digital_Output_Bit(i, State)) shl i);
        end;
      finally
        AdvantechMutex.Release;
      end;
end;

function Set_Digital_Output_Bit( Bit : DORange; State : boolean ) : boolean;
var
  DioWriteBit : PT_DioWriteBit;
  Index      : byte;
begin
  if CardDigitalOutputs[ Bit ].CardIndex <> NoData
    then
      begin
        Index := CardDigitalOutputs[ Bit ].Entry;
        DioWriteBit.bit := Index mod 8;

        if CardDigitalOutputs[ Bit ].DefaultValue <> NoData
          then DioWriteBit.state := CardDigitalOutputs[ Bit ].DefaultValue
          else DioWriteBit.state := smallint(State);

        case CardDigitalOutputs[ Bit ].CardBoardId of
          BD_PCI1730: DioWriteBit.port  := (Index div 8)+2;
        else DioWriteBit.port  := Index div 8;
        end;

        DRV_DioWriteBit(Adv_Dev_Handle[ CardDigitalOutputs[ Bit ].CardIndex ], DioWriteBit);
        result := Boolean(DioWriteBit.state);
      end
    else if CardDigitalOutputs[ Bit ].DefaultValue <> NoData
           then result := CardDigitalOutputs[ Bit ].DefaultValue <> 0
           else result := State;
end;

// Analog Input

function Get_Analog_Input_Channel( Channel : AIRange ) : AnalogSample;
var
  AIBinaryIn : PT_AIBinaryIn;
  Rst        : smallint;
begin
  if CardAnalogInputs[Channel].DefaultValue <> NoData
    then result := CardAnalogInputs[Channel].DefaultValue
    else
      begin
        Rst := 0;
        if CardAnalogInputs[Channel].CardIndex <> NoData
          then
            begin
              AIBinaryIn.reading  := @Rst;
              AIBinaryIn.TrigMode := INTERNAL;
              AIBinaryIn.chan     := CardAnalogInputs[Channel].Entry;

              DRV_AIBinaryIn(Adv_Dev_Handle[CardAnalogInputs[Channel].CardIndex], AIBinaryIn);
              Result := AnalogSample(Rst);
            end
          else result := 0;
      end;
end;

function Get_Analog_Input : AnalogInput;
var
  i : integer;
begin
  if AdvantechMutex.WaitFor(1000)
    then
      try
        for i := Low(AIRange) to High(AIRange) do
          result[i] := Get_Analog_Input_Channel(i);
      finally
        AdvantechMutex.Release;
      end;
end;

function Get_Analog_Input_Voltage_Channel(Channel : integer; Gain : GainCode) : single;
var
  AIVoltageIn : PT_AIVoltageIn;
begin
  if AdvantechMutex.WaitFor(1000)
    then
      try
        if CardAnalogInputs[ Channel ].CardIndex <> NoData
          then
            begin
              AIVoltageIn.chan     := CardAnalogInputs[Channel].Entry;
              AIVoltageIn.gain     := Gain;
              AIVoltageIn.TrigMode := INTERNAL;
              AIVoltageIn.voltage  := @result;

              DRV_AIVoltageIn(Adv_Dev_Handle[CardAnalogInputs[Channel].CardIndex], AIVoltageIn);
            end
          else result := 0;
      finally
        AdvantechMutex.Release;
      end;
end;

function Scale_Analog_Input_Channel( Channel : integer; Binary : AnalogSample; Gain : GainCode ) : single;
var
  AIScale : PT_AIScale;
begin
  if AdvantechMutex.WaitFor(1000)
    then
      try
        if CardAnalogInputs[ Channel ].CardIndex <> NoData
          then
            begin
              AIScale.reading  := Binary;
              AIScale.MaxCount := 4096;
              AIScale.offset   := 2048;
              AIScale.voltage  := @result;

              if (CardAnalogInputs[ Channel ].CardBoardId = BD_USB4711B) or
                 (CardAnalogInputs[ Channel ].CardBoardId = BD_USB4711) or
                 (CardAnalogInputs[ Channel ].CardBoardId = BD_PCI1710)
                then
                  begin
                    case Gain of
                     Gain_1   : AIScale.MaxVolt := 5.0;
                     Gain_2   : AIScale.MaxVolt := 2.5;
                     Gain_4   : AIScale.MaxVolt := 1.25;
                     Gain_8   : AIScale.MaxVolt := 0.625;
                     Gain_0_5 : AIScale.MaxVolt := 10.0;
                    end;

                    DRV_AIScale( Adv_Dev_Handle[CardAnalogInputs[ Channel ].CardIndex], AIScale );
                  end
                else  result := 0;
            end
          else result := 0;
      finally
        AdvantechMutex.Release;
      end;
end;

procedure Set_Analog_Input_Gain_Channel( Channel : integer; Gain : GainCode);
var
  AIConfig : PT_AIConfig;
begin
  if CardAnalogInputs[Channel].CardIndex <> NoData
    then
      begin
        AIConfig.DasChan := CardAnalogInputs[Channel].Entry;
        AIConfig.DasGain := Gain;
        DRV_AIConfig(Adv_Dev_Handle[CardAnalogInputs[Channel].CardIndex], AIConfig);
      end;
end;

procedure Set_Analog_Input_Gains( Gains : AnalogGains );
var
  i : integer;
begin
  if AdvantechMutex.WaitFor(1000)
    then
      try
        for i := Low(AIRange) to High(AIRange) do
          Set_Analog_Input_Gain_Channel(i, Gains[i]);
      finally
        AdvantechMutex.Release;
      end;
end;

// Analog Output
procedure Set_Analog_Output( Codes : AnalogOutput );
var
  i : integer;
begin
  if AdvantechMutex.WaitFor(1000)
    then
      try
        for i := Low(AORange) to High(AORange) do
          Set_Analog_Output_Channel( i, Codes[i] );
      finally
        AdvantechMutex.Release;
      end;
end;

procedure Set_Analog_Output_Channel( Channel : AORange; Code : AnalogCode );
var
  BinaryOut : PT_AOBinaryOut;
begin
  if CardAnalogOutputs[ Channel ].CardIndex <> NoData
    then
      begin
        BinaryOut.chan := CardAnalogOutputs[ Channel ].Entry;
        if CardAnalogOutputs[ Channel ].DefaultValue = NoData
         then BinaryOut.BinData := Code
         else BinaryOut.BinData := CardAnalogOutputs[ Channel ].DefaultValue;
        DRV_AOBinaryOut(Adv_Dev_Handle[CardAnalogOutputs[ Channel ].CardIndex], BinaryOut);
      end;
end;

// Initialization & finalization

procedure InitAnalogOutputs;
var
  AOConfig : PT_AOConfig;
begin
  if CardAnalogOutputs[ao_Azimut].CardIndex <> NoData
    then
      begin
        //Configure Ouput Voltage Range +- 10V
        AOConfig.chan := CardAnalogOutputs[ao_Azimut].Entry;
        AOConfig.MinValue := -10;
        AOConfig.MaxValue :=  10;
        AOConfig.RefSrc   :=  0;     //Internal Source
        DRV_AOConfig( Adv_Dev_Handle[CardAnalogOutputs[ao_Azimut].CardIndex], AOConfig );
      end;

    if CardAnalogOutputs[ao_Elevacion].CardIndex <> NoData
      then
        begin
          //Configure Ouput Voltage Range +- 10V
          AOConfig.chan := CardAnalogOutputs[ao_Elevacion].Entry;
          AOConfig.MinValue := -10;
          AOConfig.MaxValue :=  10;
          AOConfig.RefSrc   :=  0;     //Internal Source
          DRV_AOConfig( Adv_Dev_Handle[CardAnalogOutputs[ao_Elevacion].CardIndex], AOConfig );
        end;

  if CardAnalogOutputs[ao_Tx1_MPS].CardIndex <> NoData
    then
      begin
        //Configure Ouput Voltage Range +- 10V
        AOConfig.chan := CardAnalogOutputs[ao_Tx1_MPS].Entry;
        AOConfig.MinValue := 0;
        AOConfig.MaxValue := 10;
        AOConfig.RefSrc   := 0;     //Internal Source
        DRV_AOConfig( Adv_Dev_Handle[CardAnalogOutputs[ao_Tx1_MPS].CardIndex], AOConfig );
      end;

  if CardAnalogOutputs[ao_Tx2_MPS].CardIndex <> NoData
    then
      begin
        //Configure Ouput Voltage Range +- 10V
        AOConfig.chan := CardAnalogOutputs[ao_Tx2_MPS].Entry;
        AOConfig.MinValue := 0;
        AOConfig.MaxValue := 10;
        AOConfig.RefSrc   := 0;     //Internal Source
        DRV_AOConfig( Adv_Dev_Handle[CardAnalogOutputs[ao_Tx2_MPS].CardIndex], AOConfig );
      end;
end;

procedure InitAnalogInputs;
begin
  Set_Analog_Input_Gains(theConfiguration.AI_Gains);
end;

procedure Init_Devices;
var
  I : integer;
  GetFeatures : PT_DeviceGetFeatures;
  AO : AnalogOutput;
  PropertyLength : integer;
begin
  DRV_DeviceGetNumOfList(Adv_Dev_Count);
  SetLength( Adv_Dev_List, Adv_Dev_Count );
  DRV_DeviceGetList(Adv_Dev_List[0], Adv_Dev_Count, Adv_Dev_Count);
  SetLength( Adv_Dev_Handle, Adv_Dev_Count );
  SetLength( Adv_Dev_Feature, Adv_Dev_Count );
  SetLength( Adv_Dev_BoardIDs, Adv_Dev_Count );
  SetLength( Adv_Dev_PropertyIDs, Adv_Dev_Count );
  for I := 0 to Adv_Dev_Count - 1 do
    begin
      DRV_DeviceOpen(I, Adv_Dev_Handle[I]);
      GetFeatures.buffer := @Adv_Dev_Feature[I];
      GetFeatures.size   := sizeof(Adv_Dev_Feature[I]);
      DRV_DeviceGetFeatures(Adv_Dev_Handle[I], GetFeatures);

      PropertyLength := SizeOf(cardinal);
      DRV_DeviceGetProperty(Adv_Dev_Handle[I], CFG_BoardID,  @Adv_Dev_BoardIDs[I],    PropertyLength);
      DRV_DeviceGetProperty(Adv_Dev_Handle[I], CFG_SwitchID, @Adv_Dev_PropertyIDs[I], PropertyLength);
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

  InitAnalogOutputs;
  InitAnalogInputs;

  Set_Digital_Output(0);
  AO[0] := 2048;
  AO[1] := 2048;
  AO[2] := 0;
  AO[3] := 0;
  Set_Analog_Output(AO);
end;

procedure Done_Devices;
var
  I : integer;
begin
  for I := 0 to Adv_Dev_Count - 1 do
    DRV_DeviceClose( Adv_Dev_Handle[I] );
  Adv_Dev_List := nil;
  Adv_Dev_Feature := nil;
  Adv_Dev_Handle := nil;
end;

initialization
  AdvantechMutex := TMutex.Create(nil, false, '');

finalization
  FreeAndNil(AdvantechMutex);

end.
