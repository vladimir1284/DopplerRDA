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
  Users, RDAReg, Angle, Speed, Parameters, SysUtils;

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
  TemplateInfo.ADRate     := Source.ADRate;
  TemplateInfo.Sectors    := Source.Sectors;

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
  TemplateInfo.TR1.CRT := Source.TR1.CRT;
  TemplateInfo.TR1.CMG := Source.TR1.CMG;
  TemplateInfo.TR1.CMS := Source.TR1.CMS;
  TemplateInfo.TR2.CRT := Source.TR2.CRT;
  TemplateInfo.TR2.CMG := Source.TR2.CMG;
  TemplateInfo.TR2.CMS := Source.TR2.CMS;
  //Filter
  TemplateInfo.CH10cm_B0 := Source.CH10cm_B0;
  TemplateInfo.CH10cm_B1 := Source.CH10cm_B1;
  TemplateInfo.CH10cm_B2 := Source.CH10cm_B2;
  TemplateInfo.CH10cm_A1 := Source.CH10cm_A1;
  TemplateInfo.CH10cm_A2 := Source.CH10cm_A2;
  TemplateInfo.CH10cm_Threshold := Source.CH10cm_Threshold;
  TemplateInfo.CH3cm_B0 := Source.CH3cm_B0;
  TemplateInfo.CH3cm_B1 := Source.CH3cm_B1;
  TemplateInfo.CH3cm_B2 := Source.CH3cm_B2;
  TemplateInfo.CH3cm_A1 := Source.CH3cm_A1;
  TemplateInfo.CH3cm_A2 := Source.CH3cm_A2;
  TemplateInfo.CH3cm_Threshold := Source.CH3cm_Threshold;

  TemplateInfo.Filter := Source.Filter;
  TemplateInfo.SaveFilter := Source.SaveFilter;
  TemplateInfo.ApplyFilter := Source.ApplyFilter;
  TemplateInfo.MaxAngleEchoFilter := Source.MaxAngleEchoFilter;
  TemplateInfo.MaxHeightEchoFilter := Source.MaxHeightEchoFilter;
  TemplateInfo.MaxDistanceEchoFilter := Source.MaxDistanceEchoFilter;

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
  result.ADRate  := LoadSampleRate;
  result.Sectors := 256;

  result.AngleList[0] := ang_0;

  result.FormatList[0].Onda   := wl_10cm;
  result.FormatList[0].Celdas := 100;
  result.FormatList[0].Long   := 1000;

  result.FTPSettings := '';
  result.SentFTP := false;

  result.Pulse   := tx_Pulse_Long;

  result.TR1.CRT := xo_Nevermind;
  result.TR1.CMG := xo_Nevermind;
  result.TR1.CMS := xo_Nevermind;
  result.TR2.CRT := xo_Nevermind;
  result.TR2.CMG := xo_Nevermind;
  result.TR2.CMS := xo_Nevermind;
  //Filter
  result.CH10cm_B0 := 0;
  result.CH10cm_B1 := 0;
  result.CH10cm_B2 := 0;
  result.CH10cm_A1 := 0;
  result.CH10cm_A2 := 0;
  result.CH10cm_Threshold := 0;
  result.CH3cm_B0 := 0;
  result.CH3cm_B1 := 0;
  result.CH3cm_B2 := 0;
  result.CH3cm_A1 := 0;
  result.CH3cm_A2 := 0;
  result.CH3cm_Threshold := 0;
  result.Filter := false;
  result.SaveFilter := false;
  result.ApplyFilter := false;
  result.MaxAngleEchoFilter := 5;
  result.MaxHeightEchoFilter := 1000;
  result.MaxDistanceEchoFilter := 50000;
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
  fTR1, fTR2  : _TxRxData;
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
            result.ADRate      := ReadInteger(ADRateValue);
            result.Sectors     := ReadInteger(SectorsValue);
            result.Pulse       := TxPulseEnum( ReadInteger(PulseValue) );

            //filter
            result.CH10cm_B0   := ReadFloat(CH10cm_B0Value);
            result.CH10cm_B1   := ReadFloat(CH10cm_B1Value);
            result.CH10cm_B2   := ReadFloat(CH10cm_B2Value);
            result.CH10cm_A1   := ReadFloat(CH10cm_A1Value);
            result.CH10cm_A2   := ReadFloat(CH10cm_A2Value);
            result.CH3cm_B0    := ReadFloat(CH3cm_B0Value);
            result.CH3cm_B1    := ReadFloat(CH3cm_B1Value);
            result.CH3cm_B2    := ReadFloat(CH3cm_B2Value);
            result.CH3cm_A1    := ReadFloat(CH3cm_A1Value);
            result.CH3cm_A2    := ReadFloat(CH3cm_A2Value);

            result.Filter                := ReadBool(FilterValue);
            result.SaveFilter            := ReadBool(SaveFilterValue);
            result.ApplyFilter           := ReadBool(ApplyFilterValue);
            result.CH10cm_Threshold      := ReadFloat(CH10cm_ThresholdValue);
            result.CH3cm_Threshold       := ReadFloat(CH3cm_ThresholdValue);
            result.MaxAngleEchoFilter    := ReadFloat(MaxAngleEchoFilterValue);
            result.MaxHeightEchoFilter   := ReadInteger(MaxHeightEchoFilterValue);
            result.MaxDistanceEchoFilter := ReadInteger(MaxDistanceEchoFilterValue);

            ReadBinaryData(TR1Value, fTR1, sizeof(fTR1));
            ReadBinaryData(TR2Value, fTR2, sizeof(fTR2));

            result.TR1.CRT := TxRxOptionsEnum(fTR1.CRT);
            result.TR1.CMG := TxRxOptionsEnum(fTR1.CMG);
            result.TR1.CMS := TxRxOptionsEnum(fTR1.CMS);
            result.TR2.CRT := TxRxOptionsEnum(fTR2.CRT);
            result.TR2.CMG := TxRxOptionsEnum(fTR2.CMG);
            result.TR2.CMS := TxRxOptionsEnum(fTR2.CMS);

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
                WriteInteger(ADRateValue, template.ADRate);
                WriteInteger(SectorsValue, template.Sectors);
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

                fTR1.CRT := Ord(template.TR1.CRT);
                fTR1.CMG := Ord(template.TR1.CMG);
                fTR1.CMS := Ord(template.TR1.CMS);
                fTR2.CRT := Ord(template.TR2.CRT);
                fTR2.CMG := Ord(template.TR2.CMG);
                fTR2.CMS := Ord(template.TR2.CMS);

                WriteBinaryData(TR1Value, fTR1, sizeof(fTR1));
                WriteBinaryData(TR2Value, fTR2, sizeof(fTR2));
                WriteInteger(PulseValue, Ord(template.Pulse));
                //filter
                WriteFloat(CH10cm_ThresholdValue, template.CH10cm_Threshold);
                WriteFloat(CH3cm_ThresholdValue, template.CH3cm_Threshold);
                WriteFloat(CH10cm_B0Value, template.CH10cm_B0);
                WriteFloat(CH10cm_B1Value, template.CH10cm_B1);
                WriteFloat(CH10cm_B2Value, template.CH10cm_B2);
                WriteFloat(CH10cm_A1Value, template.CH10cm_A1);
                WriteFloat(CH10cm_A2Value, template.CH10cm_A2);
                WriteFloat(CH3cm_B0Value, template.CH3cm_B0);
                WriteFloat(CH3cm_B1Value, template.CH3cm_B1);
                WriteFloat(CH3cm_B2Value, template.CH3cm_B2);
                WriteFloat(CH3cm_A1Value, template.CH3cm_A1);
                WriteFloat(CH3cm_A2Value, template.CH3cm_A2);
                WriteBool(FilterValue, template.Filter);
                WriteBool(SaveFilterValue, template.SaveFilter);
                WriteBool(ApplyFilterValue, template.ApplyFilter);
                WriteFloat(MaxAngleEchoFilterValue, template.MaxAngleEchoFilter);
                WriteInteger(MaxHeightEchoFilterValue, template.MaxHeightEchoFilter);
                WriteInteger(MaxDistanceEchoFilterValue, template.MaxDistanceEchoFilter);
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
