unit Layout;

interface

uses
  Classes, Rda_TLB;

type
  TLayout = class(TInterfacedObject, ITemplate, ITemplateControl)
  public
    constructor Create( Name : string );
    constructor Clone( Name : string; Source : ITemplate );
    destructor  Destroy;  override;
  public  // ITemplate
    function  Get_Nombre: WideString; safecall;
    function  Get_Opciones: Integer; safecall;
    function  Get_Direcciones: WideString; safecall;
    function  Get_FTPSettings: WideString; safecall;
    function  Get_SentFTP: WordBool; safecall;
    function  Get_Periodo: TDateTime; safecall;
    function  Get_Demora: TDateTime; safecall;
    function  Get_Tipo: Integer; safecall;
    function  Get_Inicio: Integer; safecall;
    function  Get_Fin: Integer; safecall;
    function  Get_Velocidad: Integer; safecall;
    function  Get_Angulos: Integer; safecall;
    function  Get_Formatos: Integer; safecall;
    function  Angulo(Index: Integer; out Angle: Integer): HResult; safecall;
    function  Formato(Index: Integer; out Wave: Integer; out Cells: Integer; out Length: Integer): HResult; safecall;
    function  Get_Automatica: WordBool; safecall;
    procedure Set_Automatica(Value: WordBool); safecall;
    function  Get_Anterior: TDateTime; safecall;
    function  Get_Proxima: TDateTime; safecall;
    function  Get_Frecuencia_Muestra: Integer; safecall;
    function  Get_Sectores: Integer; safecall;
    function  Get_Pulso: TxPulse; safecall;
    function  Get_CRT1: TxRxOptions; safecall;
    function  Get_CMG1: TxRxOptions; safecall;
    function  Get_CMS1: TxRxOptions; safecall;
    function  Get_CRT2: TxRxOptions; safecall;
    function  Get_CMG2: TxRxOptions; safecall;
    function  Get_CMS2: TxRxOptions; safecall;
    function  Get_Sector_Inicio: Integer; safecall;
    function  Get_Sector_Fin: Integer; safecall;
    //Filter
    function Get_CH10cm_B0: Double; safecall;
    function Get_CH10cm_B1: Double; safecall;
    function Get_CH10cm_B2: Double; safecall;
    function Get_CH10cm_A1: Double; safecall;
    function Get_CH10cm_A2: Double; safecall;
    function Get_CH10cm_Threshold: Double; safecall;
    function Get_CH3cm_B0: Double; safecall;
    function Get_CH3cm_B1: Double; safecall;
    function Get_CH3cm_B2: Double; safecall;
    function Get_CH3cm_A1: Double; safecall;
    function Get_CH3cm_A2: Double; safecall;
    function Get_CH3cm_Threshold: Double; safecall;
    function Get_Filter: WordBool; safecall;
    function Get_SaveFilter: WordBool; safecall;
    function Get_ApplyFilter: WordBool; safecall;
    function Get_MaxAngleEchoFilter: Single; safecall;
    function Get_MaxHeightEchoFilter: Integer; safecall;
    function Get_MaxDistanceEchoFilter: Integer; safecall;
  public  // ITemplateControl
    procedure Set_Nombre(const Value: WideString); safecall;
    procedure Set_Opciones(Value: Integer); safecall;
    procedure Set_Direcciones(const Value: WideString); safecall;
    procedure Set_FTPSettings(const Value: WideString); safecall;
    procedure Set_SentFTP(Value: WordBool); safecall;
    procedure Set_Periodo(Value: TDateTime); safecall;
    procedure Set_Demora(Value: TDateTime); safecall;
    procedure Set_Tipo(Value: Integer); safecall;
    procedure Set_Inicio(Value: Integer); safecall;
    procedure Set_Fin(Value: Integer); safecall;
    procedure Set_Velocidad(Value: Integer); safecall;
    procedure Set_Angulos(Value: Integer); safecall;
    procedure Set_Formatos(Value: Integer); safecall;
    function  SetAngulo(Index: Integer; Angle: Integer): HResult; safecall;
    function  SetFormato(Index: Integer; Wave: Integer; Cells: Integer; Length: Integer): HResult; safecall;
    procedure Set_Anterior(Value: TDateTime); safecall;
    procedure Set_Proxima(Value: TDateTime); safecall;
    procedure Eliminar; safecall;
    procedure Set_Frecuencia_Muestra(Value: Integer); safecall;
    procedure Set_Sectores(Value: Integer); safecall;
    procedure Set_Pulso(Value: TxPulse); safecall;
    procedure Set_CRT1(Value: TxRxOptions); safecall;
    procedure Set_CMG1(Value: TxRxOptions); safecall;
    procedure Set_CMS1(Value: TxRxOptions); safecall;
    procedure Set_CRT2(Value: TxRxOptions); safecall;
    procedure Set_CMG2(Value: TxRxOptions); safecall;
    procedure Set_CMS2(Value: TxRxOptions); safecall;
    //Filter
    procedure Set_CH10cm_B0(Value: Double); safecall;
    procedure Set_CH10cm_B1(Value: Double); safecall;
    procedure Set_CH10cm_B2(Value: Double); safecall;
    procedure Set_CH10cm_A1(Value: Double); safecall;
    procedure Set_CH10cm_A2(Value: Double); safecall;
    procedure Set_CH10cm_Threshold(Value: Double); safecall;
    procedure Set_CH3cm_B0(Value: Double); safecall;
    procedure Set_CH3cm_B1(Value: Double); safecall;
    procedure Set_CH3cm_B2(Value: Double); safecall;
    procedure Set_CH3cm_A1(Value: Double); safecall;
    procedure Set_CH3cm_A2(Value: Double); safecall;
    procedure Set_CH3cm_Threshold(Value: Double); safecall;
    procedure Set_Filter(Value: WordBool); safecall;
    procedure Set_SaveFilter(Value: WordBool); safecall;
    procedure Set_ApplyFilter(Value: WordBool); safecall;
    procedure Set_MaxAngleEchoFilter(Param1: Single); safecall;
    procedure Set_MaxHeightEchoFilter(Param1: Integer); safecall;
    procedure Set_MaxDistanceEchoFilter(Param1: Integer); safecall;
  private
    fName       : string;
    fFlags      : cardinal;
    fAddress    : string;
    fFTPSettings: string;
    fPeriod     : TDateTime;
    fDelay      : TDateTime;
    fKind       : integer;
    fStart      : integer;
    fFinish     : integer;
    fSpeed      : integer;
    fAngles     : integer;
    fFormats    : integer;
    fAngleList  : pointer;
    fFormatList : pointer;
    fAutomatic  : boolean;
    fSentFTP    : boolean;
    fLastTime   : TDateTime;
    fNextTime   : TDateTime;
    fADRate     : cardinal;
    fSectors    : integer;
    fPulse      : TxPulse;
    fTR1, fTR2  : TxRxData;
    fCH10cm_B0,
    fCH10cm_B1,
    fCH10cm_B2,
    fCH10cm_A1,
    fCH10cm_A2,
    fCH3cm_B0,
    fCH3cm_B1,
    fCH3cm_B2,
    fCH3cm_A1,
    fCH3cm_A2 : double;
    fFilter,
    fSaveFilter,
    fApplyFilter : boolean;
    fCH10cm_Threshold,
    fCH3cm_Threshold : double;
    fMaxAngleEchoFilter : double;
    fMaxHeightEchoFilter,
    fMaxDistanceEchoFilter : integer;
  public
    function  LoadTemplate( Name : string ) : boolean;
    procedure InitTemplate( Name : string );
    procedure CloneTemplate( Name : string; Source : ITemplate);
    procedure SaveTemplate;
    procedure KillTemplate;
  public
    property TR1 : TxRxData read fTR1;
    property TR2 : TxRxData read fTR2;
  end;

const
  ADay    = 1;
  AnHour  = ADay/24;
  AMinute = AnHour/60;
  ASecond = AMinute/60;

procedure InitLayouts;
function  EnumTemplates : TStrings;
function  TemplateExists( Name : string ) : boolean;

implementation

uses
  Windows,
  SysUtils,
  RDAReg,
  Angle, Speed,
  Parameters, Registry;

type
  PAngleList  = ^TAngleList;
  TAngleList  = array[0..0] of integer;
  PFormatList = ^TFormatList;
  TFormatList = array[0..0] of FormatData;

const
  TemplateKey = RDARootKey + '\Templates';

const
  NameValue        = 'Name';
  FlagValue        = 'Flag';
  AddressValue     = 'Address';
  FTPSettingsValue = 'FTPSettings';
  PeriodValue      = 'Period';
  DelayValue       = 'Delay';
  KindValue        = 'Kind';
  StartValue       = 'Start';
  FinishValue      = 'Finish';
  SpeedValue       = 'Speed';
  AnglesValue      = 'Angles';
  FormatsValue     = 'Formats';
  AngleListValue   = 'AngleList';
  FormatListValue  = 'FormatList';
  AutomaticValue   = 'Automatic';
  FTPValue         = 'SentFTP';
  LastTimeValue    = 'LastTime';
  NextTimeValue    = 'NextTime';
  ADRateValue      = 'ADRate';
  SectorsValue     = 'Sectors';
  TR1Value         = 'TR1';
  TR2Value         = 'TR2';
  PulseValue       = 'Pulse';
  CH10cm_B0Value          = 'CH10cm_B0';
  CH10cm_B1Value          = 'CH10cm_B1';
  CH10cm_B2Value          = 'CH10cm_B2';
  CH10cm_A1Value          = 'CH10cm_A1';
  CH10cm_A2Value          = 'CH10cm_A2';
  CH3cm_B0Value           = 'CH3cm_B0';
  CH3cm_B1Value           = 'CH3cm_B1';
  CH3cm_B2Value           = 'CH3cm_B2';
  CH3cm_A1Value           = 'CH3cm_A1';
  CH3cm_A2Value           = 'CH3cm_A2';
  FilterValue             = 'Filter';
  SaveFilterValue         = 'SaveFilter';
  ApplyFilterValue        = 'ApplyFilter';
  CH10cm_ThresholdValue   = 'CH10cm_Threshold';
  CH3cm_ThresholdValue    = 'CH3cm_Threshold';
  MaxAngleEchoFilterValue    = 'MaxAngleEchoFilter';
  MaxHeightEchoFilterValue   = 'MaxHeightEchoFilter';
  MaxDistanceEchoFilterValue = 'MaxDistanceEchoFilter';

// Public procedures & functions

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

{ TLayout }

constructor TLayout.Create(Name: string);
begin
  inherited Create;
  if not LoadTemplate(Name)
    then InitTemplate(Name);
end;

destructor TLayout.Destroy;
begin
  FreeMem(fAngleList);
  FreeMem(fFormatList);
  inherited;
end;

function TLayout.LoadTemplate(Name: string) : boolean;
var
  Size : integer;
begin
  with TRDAReg.Create do
    try
      Result := false;
      if OpenKey(TemplateKey + '\' + Name, false)
        then
          begin
            fName    := ReadString(NameValue);
            fFlags   := ReadInteger(FlagValue);
            fAddress := ReadString(AddressValue);
            fFTPSettings := ReadString(FTPSettingsValue);
            fPeriod  := ReadDateTime(PeriodValue);
            fDelay   := ReadDateTime(DelayValue);
            fKind    := ReadInteger(KindValue);
            fStart   := ReadInteger(StartValue);
            fFinish  := ReadInteger(FinishValue);
            fSpeed   := ReadInteger(SpeedValue);
            fAngles  := ReadInteger(AnglesValue);
            fFormats := ReadInteger(FormatsValue);
            fADRate  := ReadInteger(ADRateValue);
            fSectors := ReadInteger(SectorsValue);
            Size := fAngles * sizeof(integer);
            ReallocMem(fAngleList, Size);
            ReadBinaryData(AngleListValue, fAngleList^, Size);
            Size := fFormats * sizeof(FormatData);
            ReallocMem(fFormatList, Size);
            ReadBinaryData(FormatListValue, fFormatList^, Size);
            fAutomatic := ReadBool(AutomaticValue);
            fSentFTP := ReadBool(FTPValue);
            fLastTime  := ReadDateTime(LastTimeValue);
            fNextTime  := ReadDateTime(NextTimeValue);
            ReadBinaryData(TR1Value, fTR1, sizeof(fTR1));
            ReadBinaryData(TR2Value, fTR2, sizeof(fTR2));
            fPulse := ReadInteger(PulseValue);
            //filter
            fCH10cm_B0 := ReadFloat(CH10cm_B0Value);
            fCH10cm_B1 := ReadFloat(CH10cm_B1Value);
            fCH10cm_B2 := ReadFloat(CH10cm_B2Value);
            fCH10cm_A1 := ReadFloat(CH10cm_A1Value);
            fCH10cm_A2 := ReadFloat(CH10cm_A2Value);
            fCH3cm_B0  := ReadFloat(CH3cm_B0Value);
            fCH3cm_B1  := ReadFloat(CH3cm_B1Value);
            fCH3cm_B2  := ReadFloat(CH3cm_B2Value);
            fCH3cm_A1  := ReadFloat(CH3cm_A1Value);
            fCH3cm_A2  := ReadFloat(CH3cm_A2Value);
            fFilter    := ReadBool(FilterValue);
            fSaveFilter := ReadBool(SaveFilterValue);
            fApplyFilter := ReadBool(ApplyFilterValue);
            fCH10cm_Threshold := ReadFloat(CH10cm_ThresholdValue);
            fCH3cm_Threshold := ReadFloat(CH3cm_ThresholdValue);
            fMaxAngleEchoFilter := ReadFloat(MaxAngleEchoFilterValue);
            fMaxHeightEchoFilter := ReadInteger(MaxHeightEchoFilterValue);
            fMaxDistanceEchoFilter := ReadInteger(MaxDistanceEchoFilterValue);

            Result := true;
          end;
    finally
      Free;
    end;
end;

procedure TLayout.KillTemplate;
begin
  with TRDAReg.Create do
    try
      if OpenKey(TemplateKey, false)
        then DeleteKey(fName);
      fName := '';
    finally
      Free;
    end;
end;

procedure TLayout.SaveTemplate;
var
  Size : integer;
begin
  if fName <> ''
    then
      with TRDAReg.Create do
        try
          if OpenKey(TemplateKey + '\' + fName, true)
            then
              begin
                WriteString(NameValue, fName);
                WriteInteger(FlagValue, fFlags);
                WriteString(AddressValue, fAddress);
                WriteString(FTPSettingsValue, fFTPSettings);
                WriteDateTime(PeriodValue, fPeriod);
                WriteDateTime(DelayValue, fDelay);
                WriteInteger(KindValue, fKind);
                WriteInteger(StartValue, fStart);
                WriteInteger(FinishValue, fFinish);
                WriteInteger(SpeedValue, fSpeed);
                WriteInteger(AnglesValue, fAngles);
                WriteInteger(ADRateValue, fADRate);
                WriteInteger(SectorsValue, fSectors);
                WriteInteger(FormatsValue, fFormats);
                Size := fAngles * sizeof(integer);
                WriteBinaryData(AngleListValue, fAngleList^, Size);
                Size := fFormats * sizeof(FormatData);
                WriteBinaryData(FormatListValue, fFormatList^, Size);
                WriteBool(AutomaticValue, fAutomatic);
                WriteBool(FTPValue, fSentFTP);
                WriteDateTime(LastTimeValue, fLastTime);
                WriteDateTime(NextTimeValue, fNextTime);
                WriteBinaryData(TR1Value, fTR1, sizeof(fTR1));
                WriteBinaryData(TR2Value, fTR2, sizeof(fTR2));
                WriteInteger(PulseValue, fPulse);
                //filter
                WriteFloat(CH10cm_ThresholdValue, fCH10cm_Threshold);
                WriteFloat(CH3cm_ThresholdValue, fCH3cm_Threshold);
                WriteFloat(CH10cm_B0Value, fCH10cm_B0);
                WriteFloat(CH10cm_B1Value, fCH10cm_B1);
                WriteFloat(CH10cm_B2Value, fCH10cm_B2);
                WriteFloat(CH10cm_A1Value, fCH10cm_A1);
                WriteFloat(CH10cm_A2Value, fCH10cm_A2);
                WriteFloat(CH3cm_B0Value, fCH3cm_B0);
                WriteFloat(CH3cm_B1Value, fCH3cm_B1);
                WriteFloat(CH3cm_B2Value, fCH3cm_B2);
                WriteFloat(CH3cm_A1Value, fCH3cm_A1);
                WriteFloat(CH3cm_A2Value, fCH3cm_A2);
                WriteBool(FilterValue, fFilter);
                WriteBool(SaveFilterValue, fSaveFilter);
                WriteBool(ApplyFilterValue, fApplyFilter);
                WriteFloat(MaxAngleEchoFilterValue, fMaxAngleEchoFilter);
                WriteInteger(MaxHeightEchoFilterValue, fMaxHeightEchoFilter);
                WriteInteger(MaxDistanceEchoFilterValue, fMaxDistanceEchoFilter);
              end;
        finally
          Free;
        end;
end;

procedure TLayout.InitTemplate( Name : string );
begin
  fName       := Name;
  fFlags      := tf_Create_Dir or tf_Include_Year or tf_Include_Month;
  fPeriod     := AnHour;
  fKind       := dk_PPI;
  fStart      := ang_0;
  fFinish     := ang_360;
  fSpeed      := spd_4;
  fAngles     := 1;
  fFormats    := 1;
  fADRate     := LoadSampleRate;
  fSectors    := 256;
  fAngleList  := AllocMem(1 * sizeof(integer));
  fFormatList := AllocMem(1 * sizeof(FormatData));
  PAngleList(fAngleList)^[0]   := ang_0;
  fFTPSettings := '';
  fSentFTP := false;
  with PFormatList(fFormatList)^[0] do
    begin
      Onda   := wl_10cm;
      Celdas := 100;
      Long   := 1000;
    end;
  fPulse := tx_Pulse_Long;
  fTR1.CRT := xo_Nevermind;
  fTR1.CMG := xo_Nevermind;
  fTR1.CMS := xo_Nevermind;
  fTR2.CRT := xo_Nevermind;
  fTR2.CMG := xo_Nevermind;
  fTR2.CMS := xo_Nevermind;
  //Filter
  fCH10cm_B0 := 0;
  fCH10cm_B1 := 0;
  fCH10cm_B2 := 0;
  fCH10cm_A1 := 0;
  fCH10cm_A2 := 0;
  fCH10cm_Threshold := 0;
  fCH3cm_B0 := 0;
  fCH3cm_B1 := 0;
  fCH3cm_B2 := 0;
  fCH3cm_A1 := 0;
  fCH3cm_A2 := 0;
  fCH3cm_Threshold := 0;
  fFilter := false;
  fSaveFilter := false;
  fApplyFilter := false;
  fMaxAngleEchoFilter := 5;
  fMaxHeightEchoFilter := 1000;
  fMaxDistanceEchoFilter := 50000;
  SaveTemplate;
end;

function TLayout.Angulo(Index: Integer; out Angle: Integer): HResult;
begin
  if Index < fAngles
    then
      begin
        Angle  := PAngleList(fAngleList)^[Index];
        Result := S_OK;
      end
    else Result := E_INVALIDARG;
end;

function TLayout.Get_Angulos: Integer;
begin
  Result := fAngles;
end;

function TLayout.Get_Demora: TDateTime;
begin
  Result := fDelay;
end;

function TLayout.Get_Direcciones: WideString;
begin
  Result := fAddress;
end;

function TLayout.Get_Fin: Integer;
begin
  Result := fFinish;
end;

function TLayout.Get_Formatos: Integer;
begin
  Result := fFormats;
end;

function TLayout.Get_Inicio: Integer;
begin
  Result := fStart;
end;

function TLayout.Get_Nombre: WideString;
begin
  Result := fName;
end;

function TLayout.Get_Opciones: Integer;
begin
  Result := fFlags;
end;

function TLayout.Get_Periodo: TDateTime;
begin
  Result := fPeriod;
end;

function TLayout.Get_Tipo: Integer;
begin
  Result := fKind;
end;

function TLayout.Get_Velocidad: Integer;
begin
  Result := fSpeed;
end;

procedure TLayout.Set_Demora(Value: TDateTime);
begin
  fDelay := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Direcciones(const Value: WideString);
begin
  fAddress := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Fin(Value: Integer);
begin
  fFinish := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Inicio(Value: Integer);
begin
  fStart := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Nombre(const Value: WideString);
begin
  KillTemplate;
  fName := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Opciones(Value: Integer);
begin
  fFlags := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Periodo(Value: TDateTime); 
begin
  fPeriod := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Tipo(Value: Integer);
begin
  fKind := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Velocidad(Value: Integer);
begin
  fSpeed := Value;
  SaveTemplate;
end;

function TLayout.SetAngulo(Index, Angle: Integer): HResult;
begin
  if Index < fAngles
    then
      begin
        PAngleList(fAngleList)^[Index] := Angle;
        SaveTemplate;
        Result := S_OK;
      end
    else Result := E_INVALIDARG;
end;

function TLayout.Formato(Index: Integer; out Wave, Cells, Length: Integer): HResult;
begin
  if Index < fFormats
    then
      with PFormatList(fFormatList)^[Index] do
        begin
          Wave   := Onda;
          Cells  := Celdas;
          Length := Long;
          Result := S_OK;
        end
    else Result := E_INVALIDARG;
end;

function TLayout.SetFormato(Index, Wave, Cells, Length: Integer): HResult;
begin
  if Index < fFormats
    then
      with PFormatList(fFormatList)^[Index] do
        begin
          Onda   := Wave;
          Celdas := Cells;
          Long   := Length;
          SaveTemplate;
          Result := S_OK;
        end
    else Result := E_INVALIDARG;
end;

function TLayout.Get_Anterior: TDateTime;
begin
  Result := fLastTime;
end;

function TLayout.Get_Automatica: WordBool;
begin
  Result := fAutomatic;
end;

function TLayout.Get_Proxima: TDateTime;
begin
  Result := fNextTime;
end;

procedure TLayout.Set_Anterior(Value: TDateTime);
begin
  fLastTime := Value;
  fNextTime := fPeriod * (trunc(fLastTime/fPeriod) + 1) + fDelay;
  SaveTemplate;
end;

procedure TLayout.Set_Automatica(Value: WordBool);
begin
  fAutomatic := Value;
  if fAutomatic
    then fNextTime := fPeriod * (trunc(Now/fPeriod) + 1) + fDelay
    else fNextTime := 0;
  SaveTemplate;
end;

procedure TLayout.Set_Proxima(Value: TDateTime);
begin
  fNextTime := Value;
  SaveTemplate;
end;

procedure TLayout.Eliminar;
begin
  KillTemplate;
end;

procedure TLayout.Set_Angulos(Value: Integer);
begin
  fAngles := Value;
  ReallocMem(fAngleList, fAngles * sizeof(integer));
  SaveTemplate;
end;

procedure TLayout.Set_Formatos(Value: Integer);
begin
  fFormats := Value;
  ReallocMem(fFormatList, fFormats * sizeof(FormatData));
  SaveTemplate;
end;

function TLayout.Get_Sectores: Integer;
begin
  Result := fSectors;
end;

procedure TLayout.Set_Sectores(Value: Integer);
begin
  fSectors := Value;
  SaveTemplate;
end;

function TLayout.Get_Pulso: TxPulse;
begin
  Result := fPulse;
end;

procedure TLayout.Set_Pulso(Value: TxPulse);
begin
  fPulse := Value;
  SaveTemplate;
end;

function TLayout.Get_CMG1: TxRxOptions;
begin
  Result := fTR1.CMG;
end;

function TLayout.Get_CMG2: TxRxOptions;
begin
  Result := fTR2.CMG;
end;

function TLayout.Get_CMS1: TxRxOptions;
begin
  Result := fTR1.CMS;
end;

function TLayout.Get_CMS2: TxRxOptions;
begin
  Result := fTR2.CMS;
end;

function TLayout.Get_CRT1: TxRxOptions;
begin
  Result := fTR1.CRT;
end;

function TLayout.Get_CRT2: TxRxOptions;
begin
  Result := fTR2.CRT;
end;

procedure TLayout.Set_CMG1(Value: TxRxOptions);
begin
  fTR1.CMG := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CMG2(Value: TxRxOptions);
begin
  fTR2.CMG := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CMS1(Value: TxRxOptions);
begin
  fTR1.CMS := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CMS2(Value: TxRxOptions);
begin
  fTR2.CMS := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CRT1(Value: TxRxOptions);
begin
  fTR1.CRT := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CRT2(Value: TxRxOptions);
begin
  fTR2.CRT := Value;
  SaveTemplate;
end;

// Initialization & finalization

procedure InitLayouts;
var
  I : integer;
begin
  with EnumTemplates do
    try
      for I := 0 to Count - 1 do
        with TLayout.Create(Strings[I]) do
          try
            if Get_Automatica
              then Set_Automatica(true);
          finally
            Free;
          end;
    finally
      Free;
    end;
end;

function TLayout.Get_Sector_Fin: Integer;
begin
  Result := pred(fFinish) * fSectors div 4096;
end;

function TLayout.Get_Sector_Inicio: Integer;
begin
  Result := fStart * fSectors div 4096;
end;

function TLayout.Get_FTPSettings: WideString;
begin
  Result := fFTPSettings;
end;

procedure TLayout.Set_FTPSettings(const Value: WideString);
begin
  fFTPSettings := Value;
  SaveTemplate;
end;

function TLayout.Get_SentFTP: WordBool;
begin
  Result := fSentFTP;
end;

procedure TLayout.Set_SentFTP(Value: WordBool);
begin
  fSentFTP := Value;
  SaveTemplate;
end;

function TLayout.Get_Frecuencia_Muestra: Integer;
begin
  Result := fADRate;
end;

procedure TLayout.Set_Frecuencia_Muestra(Value: Integer);
begin
  fADRate := Value;
  SaveTemplate;
end;

function TLayout.Get_ApplyFilter: WordBool;
begin
  result := fApplyFilter;
end;

function TLayout.Get_CH10cm_A1: Double;
begin
  result := fCH10cm_A1;
end;

function TLayout.Get_CH10cm_A2: Double;
begin
  result := fCH10cm_A2;
end;

function TLayout.Get_CH10cm_B0: Double;
begin
  result := fCH10cm_B0;
end;

function TLayout.Get_CH10cm_B1: Double;
begin
  result := fCH10cm_B1;
end;

function TLayout.Get_CH10cm_B2: Double;
begin
  result := fCH10cm_B2;
end;

function TLayout.Get_CH10cm_Threshold: Double;
begin
  result := fCH10cm_Threshold;
end;

function TLayout.Get_CH3cm_A1: Double;
begin
  result := fCH3cm_A1;
end;

function TLayout.Get_CH3cm_A2: Double;
begin
  result := fCH3cm_A2;
end;

function TLayout.Get_CH3cm_B0: Double;
begin
  result := fCH3cm_B0;
end;

function TLayout.Get_CH3cm_B1: Double;
begin
  result := fCH3cm_B1;
end;

function TLayout.Get_CH3cm_B2: Double;
begin
  result := fCH3cm_B2;
end;

function TLayout.Get_CH3cm_Threshold: Double;
begin
  result := fCH3cm_Threshold;
end;

function TLayout.Get_Filter: WordBool;
begin
  result := fFilter;
end;

function TLayout.Get_SaveFilter: WordBool;
begin
  result := fSaveFilter;
end;

procedure TLayout.Set_ApplyFilter(Value: WordBool);
begin
  fApplyFilter := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_A1(Value: Double);
begin
  fCH10cm_A1 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_A2(Value: Double);
begin
  fCH10cm_A2 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_B0(Value: Double);
begin
  fCH10cm_B0 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_B1(Value: Double);
begin
  fCH10cm_B1 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_B2(Value: Double);
begin
  fCH10cm_B2 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_Threshold(Value: Double);
begin
  fCH10cm_Threshold := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_A1(Value: Double);
begin
  fCH3cm_A1 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_A2(Value: Double);
begin
  fCH3cm_A2 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_B0(Value: Double);
begin
  fCH3cm_B0 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_B1(Value: Double);
begin
  fCH3cm_B1 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_B2(Value: Double);
begin
  fCH3cm_B2 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_Threshold(Value: Double);
begin
  fCH3cm_Threshold := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Filter(Value: WordBool);
begin
  fFilter := Value;
  SaveTemplate;
end;

procedure TLayout.Set_SaveFilter(Value: WordBool);
begin
  fSaveFilter := Value;
  SaveTemplate;
end;

procedure TLayout.CloneTemplate(Name: string; Source: ITemplate);
var
  i : integer;
  Ang, fWave, fCells, fLenght : Integer;
begin
  fName       := Name;
  fFlags      := Source.Opciones;
  fPeriod     := Source.Periodo;
  fKind       := Source.Tipo;
  fStart      := Source.Inicio;
  fFinish     := Source.Fin;
  fSpeed      := Source.Velocidad;
  fAngles     := Source.Angulos;
  fFormats    := Source.Formatos;
  fADRate     := Source.Frecuencia_Muestra;
  fSectors    := Source.Sectores;
  fAngleList  := AllocMem(fAngles * sizeof(integer));
  fFormatList := AllocMem(fFormats * sizeof(FormatData));
  for i := 0 to fAngles-1 do
  begin
    Source.Angulo(i, Ang);
    PAngleList(fAngleList)^[i] := Ang;
  end;
  fFTPSettings := Source.FTPSettings;
  fSentFTP := Source.SentFTP;

  for i := 0 to fFormats-1 do
    with PFormatList(fFormatList)^[i] do
    begin
      Source.Formato(i, fWave, fCells, fLenght);
      Onda   := fWave;
      Celdas := fCells;
      Long   := fLenght;
    end;
  fPulse := Source.Pulso;
  fTR1.CRT := Source.CRT1;
  fTR1.CMG := Source.CMG1;
  fTR1.CMS := Source.CMS1;
  fTR2.CRT := Source.CRT2;
  fTR2.CMG := Source.CMG2;
  fTR2.CMS := Source.CMS2;
  //Filter
  fCH10cm_B0 := Source.CH10cm_B0;
  fCH10cm_B1 := Source.CH10cm_B1;
  fCH10cm_B2 := Source.CH10cm_B2;
  fCH10cm_A1 := Source.CH10cm_A1;
  fCH10cm_A2 := Source.CH10cm_A2;
  fCH10cm_Threshold := Source.CH10cm_Threshold;
  fCH3cm_B0 := Source.CH3cm_B0;
  fCH3cm_B1 := Source.CH3cm_B1;
  fCH3cm_B2 := Source.CH3cm_B2;
  fCH3cm_A1 := Source.CH3cm_A1;
  fCH3cm_A2 := Source.CH3cm_A2;
  fCH3cm_Threshold := Source.CH3cm_Threshold;
  fFilter := Source.Filter;
  fSaveFilter := Source.SaveFilter;
  fApplyFilter := Source.ApplyFilter;
  fMaxAngleEchoFilter := Source.MaxAngleEchoFilter;
  fMaxHeightEchoFilter := Source.MaxHeightEchoFilter;
  fMaxDistanceEchoFilter := Source.MaxDistanceEchoFilter;

  SaveTemplate;
end;

constructor TLayout.Clone(Name: string; Source: ITemplate);
begin
  inherited Create;
  CloneTemplate(Name, Source);
end;

function TLayout.Get_MaxAngleEchoFilter: Single;
begin
  result := fMaxAngleEchoFilter;
end;

function TLayout.Get_MaxDistanceEchoFilter: Integer;
begin
  result := fMaxHeightEchoFilter;
end;

function TLayout.Get_MaxHeightEchoFilter: Integer;
begin
  result := fMaxDistanceEchoFilter;
end;

procedure TLayout.Set_MaxAngleEchoFilter(Param1: Single);
begin
  fMaxAngleEchoFilter := Param1;
  SaveTemplate;
end;

procedure TLayout.Set_MaxDistanceEchoFilter(Param1: Integer);
begin
  fMaxHeightEchoFilter := Param1;
  SaveTemplate;
end;

procedure TLayout.Set_MaxHeightEchoFilter(Param1: Integer);
begin
  fMaxDistanceEchoFilter := Param1;
  SaveTemplate;
end;

end.

