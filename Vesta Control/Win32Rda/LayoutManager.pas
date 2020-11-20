unit LayoutManager;

interface

uses
  Classes, CommunicationObj;

type  
  TLayoutManager = class
    public
      function  LoadTemplate(Name : string ) : TTemplateInfo;
      function  InitTemplate(Name : string ) : TTemplateInfo;
      function  CloneTemplate(Name: string; Source: TTemplateInfo) : TTemplateInfo;
      procedure SaveTemplate(template : TTemplateInfo);
      procedure KillTemplate(Name : string);
      function  TemplateExists( TemplateName : string ) : boolean;
  end;

procedure InitLayouts;
function  EnumTemplates : TStrings;
function  TemplateExists( Name : string ) : boolean;

implementation

uses
  Users, RDAReg, Angle, Speed, Parameters, SysUtils, Elbrus, Registry;

const
  TemplateKey = RDARootKey + '\Templates';

const
  NameValue                  = 'Name';
  FlagValue                  = 'Flag';
  AddressValue               = 'Address';
  FTPSettingsValue           = 'FTPSettings';
  PeriodValue                = 'Period';
  DelayValue                 = 'Delay';
  KindValue                  = 'Kind';
  StartValue                 = 'Start';
  FinishValue                = 'Finish';
  SpeedValue                 = 'Speed';
  AnglesValue                = 'Angles';
  FormatsValue               = 'Formats';
  AngleListValue             = 'AngleList';
  FormatListValue            = 'FormatList';
  AutomaticValue             = 'Automatic';
  FTPValue                   = 'SentFTP';
  LastTimeValue              = 'LastTime';
  NextTimeValue              = 'NextTime';
  ADRateValue                = 'ADRate';
  SectorsValue               = 'Sectors';
  TR1Value                   = 'TR1';
  TR2Value                   = 'TR2';
  PulseValue                 = 'Pulse';
  CH10cm_B0Value             = 'CH10cm_B0';
  CH10cm_B1Value             = 'CH10cm_B1';
  CH10cm_B2Value             = 'CH10cm_B2';
  CH10cm_A1Value             = 'CH10cm_A1';
  CH10cm_A2Value             = 'CH10cm_A2';
  CH3cm_B0Value              = 'CH3cm_B0';
  CH3cm_B1Value              = 'CH3cm_B1';
  CH3cm_B2Value              = 'CH3cm_B2';
  CH3cm_A1Value              = 'CH3cm_A1';
  CH3cm_A2Value              = 'CH3cm_A2';
  FilterValue                = 'Filter';
  SaveFilterValue            = 'SaveFilter';
  ApplyFilterValue           = 'ApplyFilter';
  CH10cm_ThresholdValue      = 'CH10cm_Threshold';
  CH3cm_ThresholdValue       = 'CH3cm_Threshold';
  MaxAngleEchoFilterValue    = 'MaxAngleEchoFilter';
  MaxHeightEchoFilterValue   = 'MaxHeightEchoFilter';
  MaxDistanceEchoFilterValue = 'MaxDistanceEchoFilter';
  CH3cm_ManualAFCValue    = 'CH3cm_ManualAFC';
  CH3cm_StaloPowerValue   = 'CH3cm_StaloPower';
  CH3cm_StaloFreqValue    = 'CH3cm_StaloFreq';
  CH3cm_NCOValue          = 'CH3cm_NCO';
  CH10cm_ManualAFCValue   = 'CH10cm_ManualAFC';
  CH10cm_StaloPowerValue  = 'CH10cm_StaloPower';
  CH10cm_StaloFreqValue   = 'CH10cm_StaloFreq';
  CH10cm_NCOValue         = 'CH10cm_NCO';

const
  ADay    = 1;
  AnHour  = ADay/24;
  AMinute = AnHour/60;
  ASecond = AMinute/60;

type
  _FormatData = packed record
    Onda: Integer;
    Celdas: Integer;
    Long: Integer;
    PotMet: Single;
  end;

  _TxRxData = packed record
    CRT: LongWord;
    CMG: LongWord;
    CMS: LongWord;
  end;

  PAngleList  = ^TAngleList;
  TAngleList  = array[0..0] of integer;
  PFormatList = ^TFormatList;
  TFormatList = array[0..0] of _FormatData;

// Public procedures & functions

procedure InitLayouts;
var
  I : integer;
  LayoutManager : TLayoutManager;
begin
  with EnumTemplates do
    try
      LayoutManager := TLayoutManager.Create;
      try
        for I := 0 to Count - 1 do
          with LayoutManager.LoadTemplate(Strings[I]) do
            try
              if Automatic
                then Automatic := true;
            finally
              Free;
            end;
      finally
        LayoutManager.Free;
      end;
    finally
      Free;
    end;
end;

function EnumTemplates : TStrings;
begin
  Result := TStringList.Create;
  with TRDAReg.Create do
    try
      if OpenKey(TemplateKey, true)
        then GetKeyNames(Result);
    finally
      Free;
    end;
end;

function TemplateExists( Name : string ) : boolean;
begin
  if Name <> ''
    then
      with TRDAReg.Create do
        try
          Result := OpenKey(TemplateKey + '\' + Name, false);
        finally
          Free;
        end
    else Result := false;
end;

{ TLayoutManager }

function TLayoutManager.CloneTemplate(Name: string; Source: TTemplateInfo) : TTemplateInfo;
var
  i : integer;
  TemplateInfo: TTemplateInfo;
begin
  TemplateInfo := TTemplateInfo.Create;

  TemplateInfo.Name       := Name;
  TemplateInfo.Flags      := Source.Flags;
  TemplateInfo.Period     := Source.Period;
  TemplateInfo.Kind       := Source.Kind;
  TemplateInfo.Start      := Source.Start;
  TemplateInfo.Finish     := Source.Finish;
  TemplateInfo.Speed      := Source.Speed;
  TemplateInfo.Angles     := Source.Angles;
  TemplateInfo.Formats    := Source.Formats;

  for i := 0 to TemplateInfo.Angles-1 do
    TemplateInfo.AngleList[i] := Source.AngleList[i];

  TemplateInfo.FTPSettings := Source.FTPSettings;
  TemplateInfo.SentFTP := Source.SentFTP;

  for i := 0 to TemplateInfo.Formats-1 do
    begin
      TemplateInfo.FormatList[i].Onda := Source.FormatList[i].Onda;
      TemplateInfo.FormatList[i].Celdas := Source.FormatList[i].Celdas;
      TemplateInfo.FormatList[i].Long := Source.FormatList[i].Long;
      TemplateInfo.FormatList[i].PotMet := Source.FormatList[i].PotMet;
    end;

  TemplateInfo.Pulse := Source.Pulse;

  TemplateInfo.CH3cm_ManualAFC   := Source.CH3cm_ManualAFC;
  TemplateInfo.CH10cm_ManualAFC  := Source.CH10cm_ManualAFC;
  TemplateInfo.CH3cm_StaloPower  := Source.CH3cm_StaloPower;
  TemplateInfo.CH10cm_StaloPower := Source.CH10cm_StaloPower;
  TemplateInfo.CH3cm_StaloFreq   := Source.CH3cm_StaloFreq;
  TemplateInfo.CH10cm_StaloFreq  := Source.CH10cm_StaloFreq;
  TemplateInfo.CH3cm_NCO         := Source.CH3cm_NCO;
  TemplateInfo.CH10cm_NCO        := Source.CH10cm_NCO;


  SaveTemplate(TemplateInfo);
  result := TemplateInfo;
end;  

function TLayoutManager.InitTemplate(Name: string): TTemplateInfo;
begin
  result := TTemplateInfo.Create;

  result.Name    := Name;
  result.Flags   := tf_Create_Dir or tf_Include_Year or tf_Include_Month;
  result.Period  := AnHour;
  result.Kind    := dk_PPI;
  result.Start   := ang_0;
  result.Finish  := ang_360;
  result.Speed   := spd_4;
  result.Angles  := 1;
  result.Formats := 1;

  result.AngleList[0] := ang_0;

  result.FormatList[0].Onda   := wl_10cm;
  result.FormatList[0].Celdas := 100;
  result.FormatList[0].Long   := 1000;

  result.FTPSettings := '';
  result.SentFTP := false;

  result.Pulse   := tx_Pulse_Long;

  result.CH3cm_ManualAFC   := false;
  result.CH10cm_ManualAFC  := false;
  result.CH3cm_StaloPower  := 19;
  result.CH10cm_StaloPower := 19;
  result.CH3cm_StaloFreq   := 2950;
  result.CH10cm_StaloFreq  := 2950;
  result.CH3cm_NCO         := 30000000;
  result.CH10cm_NCO        := 30000000;

  SaveTemplate(result);
end;

procedure TLayoutManager.KillTemplate(Name: string);
begin
  with TRDAReg.Create do
    try
      if OpenKey(TemplateKey, false)
        then DeleteKey(Name);
    finally
      Free;
    end;
end;

function TLayoutManager.LoadTemplate(Name: string): TTemplateInfo;
var
  Size : integer;
  AngleList  : pointer;
  FormatList : pointer;
  i : integer;
begin
  result := nil;
  with TRDAReg.Create do
    try
      if OpenKey(TemplateKey + '\' + Name, false)
        then
          begin
            result := TTemplateInfo.Create;

            result.Name        := ReadString(NameValue);
            result.Flags       := ReadInteger(FlagValue);
            result.Address     := ReadString(AddressValue);
            result.FTPSettings := ReadString(FTPSettingsValue);
            result.Period      := ReadDateTime(PeriodValue);
            result.Delay       := ReadDateTime(DelayValue);
            result.Kind        := DesignKindEnum(ReadInteger(KindValue));
            result.Start       := ReadInteger(StartValue);
            result.Finish      := ReadInteger(FinishValue);
            result.Speed       := ReadInteger(SpeedValue);
            result.Angles      := ReadInteger(AnglesValue);
            result.Formats     := ReadInteger(FormatsValue);
            result.Automatic   := ReadBool(AutomaticValue);
            result.SentFTP     := ReadBool(FTPValue);
            result.LastTime    := ReadDateTime(LastTimeValue);
            result.NextTime    := ReadDateTime(NextTimeValue);
            result.Pulse       := TxPulseEnum( ReadInteger(PulseValue) );

            result.CH3cm_ManualAFC   := ReadBool(CH3cm_ManualAFCValue);
            result.CH3cm_StaloPower  := ReadFloat(CH3cm_StaloPowerValue);
            result.CH3cm_StaloFreq   := ReadInteger(CH3cm_StaloFreqValue);
            result.CH3cm_NCO         := ReadInteger(CH3cm_NCOValue);
            result.CH10cm_ManualAFC  := ReadBool(CH10cm_ManualAFCValue);
            result.CH10cm_StaloPower := ReadFloat(CH10cm_StaloPowerValue);
            result.CH10cm_StaloFreq  := ReadInteger(CH10cm_StaloFreqValue);
            result.CH10cm_NCO        := ReadInteger(CH10cm_NCOValue);


            Size := result.Angles * sizeof(integer);
            AngleList := AllocMem(Size);
            ReadBinaryData(AngleListValue, AngleList^, Size);
            for i := 0 to result.Angles-1 do
              result.AngleList[i] :=  PAngleList(AngleList)^[i];

            FreeMem(AngleList, Size);

            Size := result.Formats * sizeof(_FormatData);
            FormatList := AllocMem(Size);
            ReadBinaryData(FormatListValue, FormatList^, Size);

            for i := 0 to result.Formats-1 do
            begin
              result.FormatList[i] := FormatData.Create;

              with PFormatList(FormatList)^[i] do
                begin
                  result.FormatList[i].Onda := TWaveLengthEnum(Onda);
                  result.FormatList[i].Celdas := Celdas;
                  result.FormatList[i].Long := Long;
                  result.FormatList[i].PotMet := PotMet;
                end;
            end;
            FreeMem(FormatList, Size);

          end;
    finally
      Free;
    end;
end;

procedure TLayoutManager.SaveTemplate(template: TTemplateInfo);
var
  Size, i : integer;
  AngleList  : pointer;
  FormatList : pointer;
  fTR1, fTR2  : _TxRxData;
begin
  if template.Name <> ''
    then
      with TRDAReg.Create do
        try
          if OpenKey(TemplateKey + '\' + template.Name, true)
            then
              begin
                WriteString(NameValue, template.Name);
                WriteInteger(FlagValue, template.Flags);
                WriteString(AddressValue, template.Address);
                WriteString(FTPSettingsValue, template.FTPSettings);
                WriteDateTime(PeriodValue, template.Period);
                WriteDateTime(DelayValue, template.Delay);
                WriteInteger(KindValue, Ord(template.Kind));
                WriteInteger(StartValue, template.Start);
                WriteInteger(FinishValue, template.Finish);
                WriteInteger(SpeedValue, template.Speed);
                WriteInteger(AnglesValue, template.Angles);
                WriteInteger(FormatsValue, template.Formats);

                Size := template.Angles * sizeof(integer);
                AngleList := AllocMem(Size);
                for i := 0 to template.Angles-1 do
                  PAngleList(AngleList)^[i] := template.AngleList[i];

                WriteBinaryData(AngleListValue, AngleList^, Size);
                FreeMem(AngleList, Size);

                Size := template.Formats * sizeof(_FormatData);
                FormatList := AllocMem(Size);

                for i := 0 to template.Formats-1 do
                  with PFormatList(FormatList)^[i] do
                    begin
                      Onda   := Ord(template.FormatList[i].Onda);
                      Celdas := template.FormatList[i].Celdas;
                      Long   := template.FormatList[i].Long;
                      PotMet := template.FormatList[i].PotMet;
                    end;

                WriteBinaryData(FormatListValue, FormatList^, Size);
                FreeMem(FormatList, Size);

                WriteBool(AutomaticValue, template.Automatic);
                WriteBool(FTPValue, template.SentFTP);
                WriteDateTime(LastTimeValue, template.LastTime);
                WriteDateTime(NextTimeValue, template.NextTime);

                WriteBinaryData(TR1Value, fTR1, sizeof(fTR1));
                WriteBinaryData(TR2Value, fTR2, sizeof(fTR2));
                WriteInteger(PulseValue, Ord(template.Pulse));

                //AFC
                WriteBool(CH3cm_ManualAFCValue, template.CH3cm_ManualAFC);
                WriteFloat(CH3cm_StaloPowerValue, template.CH3cm_StaloPower);
                WriteInteger(CH3cm_StaloFreqValue, template.CH3cm_StaloFreq);
                WriteInteger(CH3cm_NCOValue, template.CH3cm_NCO);
                WriteBool(CH10cm_ManualAFCValue, template.CH10cm_ManualAFC);
                WriteFloat(CH10cm_StaloPowerValue, template.CH10cm_StaloPower);
                WriteInteger(CH10cm_StaloFreqValue, template.CH10cm_StaloFreq);
                WriteInteger(CH10cm_NCOValue, template.CH10cm_NCO);
              end;
        finally
          Free;
        end;
end;

function TLayoutManager.TemplateExists(TemplateName: string): boolean;
begin
  with TRDAReg.Create do
    try
      result := OpenKey(TemplateKey + '\' + TemplateName, false)
    finally
      Free;
    end;
end;

end.
