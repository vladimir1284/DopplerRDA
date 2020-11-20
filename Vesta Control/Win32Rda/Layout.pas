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
    function  Movement(index: Integer; out Angle: Integer; out Speed: Integer; out Pulse: Integer; out Rate: Integer): HResult; safecall;
    function  Get_Automatica: WordBool; safecall;
    procedure Set_Automatica(Value: WordBool); safecall;
    function  Get_Anterior: TDateTime; safecall;
    function  Get_Proxima: TDateTime; safecall;
    function  Get_Pulso: TxPulse; safecall;
    function  Get_Sector_Inicio: Integer; safecall;
    function  Get_Sector_Fin: Integer; safecall;
    function  Get_PulseRate: TxDualPulse; safecall;
    function  Get_Sectores: Integer; safecall;
    //Filter
    function Get_Filter: WordBool; safecall;
    function Get_FilterCH1: Integer; safecall;
    function Get_FilterCH2: Integer; safecall;
    function Get_Filter_MaxAngle: Double; safecall;
    function Get_Filter_MaxHeigh: Integer; safecall;
    function Get_Filter_Distance: Integer; safecall;
    function Get_FilterSQI: WordBool; safecall;
    function Get_FilterCI: WordBool; safecall;
    function Get_FilterSIG: WordBool; safecall;
    function Get_FilterLOG: WordBool; safecall;
    function Get_FilterCCOR: WordBool; safecall;
    //AFC
    function Get_CH3cm_ManualAFC: WordBool; safecall;
    function Get_CH3cm_StaloPower: Double; safecall;
    function Get_CH3cm_StaloFreq: Integer; safecall;
    function Get_CH3cm_NCO: Integer; safecall;
    function Get_CH10cm_ManualAFC: WordBool; safecall;
    function Get_CH10cm_StaloPower: Double; safecall;
    function Get_CH10cm_StaloFreq: Integer; safecall;
    function Get_CH10cm_NCO: Integer; safecall;
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
    function  SetMovement(index: Integer; Angle: Integer; Speed: Integer; Pulse: Integer; Rate: Integer): HResult; safecall;
    procedure Set_Anterior(Value: TDateTime); safecall;
    procedure Set_Proxima(Value: TDateTime); safecall;
    procedure Eliminar; safecall;
    procedure Set_Pulso(Value: TxPulse); safecall;
    procedure Set_PulseRate(Value: TxDualPulse); safecall;
    procedure Set_Sectores(Value: Integer); safecall;
    //Filter
    procedure Set_Filter(Value: WordBool); safecall;
    procedure Set_FilterCH1(Value: Integer); safecall;
    procedure Set_FilterCH2(Value: Integer); safecall;
    procedure Set_Filter_MaxAngle(Value: Double); safecall;
    procedure Set_Filter_MaxHeigh(Value: Integer); safecall;
    procedure Set_Filter_MaxDistance(Value: Integer); safecall;
    procedure Set_FilterSQI(Value: WordBool); safecall;
    procedure Set_FilterCI(Value: WordBool); safecall;
    procedure Set_FilterSIG(Value: WordBool); safecall;
    procedure Set_FilterLOG(Value: WordBool); safecall;
    procedure Set_FilterCCOR(Value: WordBool); safecall;
    //AFC
    procedure Set_CH3cm_ManualAFC(Value: WordBool); safecall;
    procedure Set_CH3cm_StaloPower(Value: Double); safecall;
    procedure Set_CH3cm_StaloFreq(Value: Integer); safecall;
    procedure Set_CH3cm_NCO(Value: Integer); safecall;
    procedure Set_CH10cm_ManualAFC(Value: WordBool); safecall;
    procedure Set_CH10cm_StaloPower(Value: Double); safecall;
    procedure Set_CH10cm_StaloFreq(Value: Integer); safecall;
    procedure Set_CH10cm_NCO(Value: Integer); safecall;
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
    fMovementList : pointer;
    fAutomatic  : boolean;
    fSentFTP    : boolean;
    fLastTime   : TDateTime;
    fNextTime   : TDateTime;
    fPulse      : TxPulse;
    fPulseRate  : TxDualPulse;
    fFilter : boolean;
    fCH3cm_ManualAFC,
    fCH10cm_ManualAFC : boolean;
    fCH3cm_StaloPower,
    fCH10cm_StaloPower : double;
    fCH3cm_StaloFreq,
    fCH10cm_StaloFreq : integer;
    fCH3cm_NCO_Freq,
    fCH10cm_NCO_Freq : integer;
    fFilterCh1,
    fFilterCh2,
    fFilter_MaxHeigh,
    fFilter_MaxDistance : integer;
    fFilter_MaxAngle : double;
    fFilter_SQI,
    fFilter_CI,
    fFilter_SIG,
    fFilter_LOG,
    fFilter_CCOR : boolean;
    fSectors : integer;
  public
    function  LoadTemplate( Name : string ) : boolean;
    procedure InitTemplate( Name : string );
    procedure CloneTemplate( Name : string; Source : ITemplate);
    procedure SaveTemplate;
    procedure KillTemplate;
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
  Parameters, Registry, Constants, Elbrus;

type
  PAngleList  = ^TAngleList;
  TAngleList  = array[0..0] of integer;
  PFormatList = ^TFormatList;
  TFormatList = array[0..0] of FormatData;
  PMovementList = ^TMovementList;
  TMovementList = array[0..0] of MovementData;

const
  TemplateKey = RDARootKey + '\Templates';

const
  NameValue               = 'Name';
  FlagValue               = 'Flag';
  AddressValue            = 'Address';
  FTPSettingsValue        = 'FTPSettings';
  PeriodValue             = 'Period';
  DelayValue              = 'Delay';
  KindValue               = 'Kind';
  StartValue              = 'Start';
  FinishValue             = 'Finish';
  SpeedValue              = 'Speed';
  AnglesValue             = 'Angles';
  FormatsValue            = 'Formats';
  AngleListValue          = 'AngleList';
  FormatListValue         = 'FormatList';
  MovementListValue       = 'MovementList';
  AutomaticValue          = 'Automatic';
  FTPValue                = 'SentFTP';
  LastTimeValue           = 'LastTime';
  NextTimeValue           = 'NextTime';
  PulseValue              = 'Pulse';
  PulseRateValue          = 'PulseRate';
  FilterValue             = 'Filter';
  FilterCh1Value          = 'FilterCh1';
  FilterCh2Value          = 'FilterCh2';
  Filter_MaxAngleValue    = 'Filter_MaxAngle';
  Filter_MaxHeighValue    = 'Filter_MaxHeigh';
  Filter_MaxDistanceValue = 'Filter_MaxDistance';
  Filter_SQIValue         = 'Filter_SQI';
  Filter_CIValue          = 'Filter_CI';
  Filter_SIGValue         = 'Filter_SIG';
  Filter_LOGValue         = 'Filter_LOG';
  Filter_CCORValue        = 'Filter_CCOR';
  CH3cm_ManualAFCValue    = 'CH3cm_ManualAFC';
  CH3cm_StaloPowerValue   = 'CH3cm_StaloPower';
  CH3cm_StaloFreqValue    = 'CH3cm_StaloFreq';
  CH3cm_NCOValue          = 'CH3cm_NCO';
  CH10cm_ManualAFCValue   = 'CH10cm_ManualAFC';
  CH10cm_StaloPowerValue  = 'CH10cm_StaloPower';
  CH10cm_StaloFreqValue   = 'CH10cm_StaloFreq';
  CH10cm_NCOValue         = 'CH10cm_NCO';
  SectorsValue            = 'Sectors';

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
  FreeMem(fMovementList);

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
            fSectors := ReadInteger(SectorsValue);
            Size := fAngles * sizeof(integer);
            ReallocMem(fAngleList, Size);
            ReadBinaryData(AngleListValue, fAngleList^, Size);
            Size := fFormats * sizeof(FormatData);
            ReallocMem(fFormatList, Size);
            ReadBinaryData(FormatListValue, fFormatList^, Size);

            Size := fAngles * sizeof(MovementData);
            ReallocMem(fMovementList, Size);
            ReadBinaryData(MovementListValue, fMovementList^, Size);

            fAutomatic := ReadBool(AutomaticValue);
            fSentFTP := ReadBool(FTPValue);
            fLastTime  := ReadDateTime(LastTimeValue);
            fNextTime  := ReadDateTime(NextTimeValue);
            fPulse := ReadInteger(PulseValue);
            fPulseRate := ReadInteger(PulseRateValue);
            //filter
            fFilter             := ReadBool(FilterValue);
            fFilterCh1          := ReadInteger(FilterCh1Value);
            fFilterCh2          := ReadInteger(FilterCh2Value);
            fFilter_MaxAngle    := ReadFloat(Filter_MaxAngleValue);
            fFilter_MaxHeigh    := ReadInteger(Filter_MaxHeighValue);
            fFilter_MaxDistance := ReadInteger(Filter_MaxDistanceValue);
            fFilter_SQI         := ReadBool(Filter_SQIValue);
            fFilter_CI          := ReadBool(Filter_CIValue);
            fFilter_SIG         := ReadBool(Filter_SIGValue);
            fFilter_LOG         := ReadBool(Filter_LOGValue);
            fFilter_CCOR        := ReadBool(Filter_CCORValue);

            fCH3cm_ManualAFC   := ReadBool(CH3cm_ManualAFCValue);
            fCH3cm_StaloPower  := ReadFloat(CH3cm_StaloPowerValue);
            fCH3cm_StaloFreq   := ReadInteger(CH3cm_StaloFreqValue);
            fCH3cm_NCO_Freq    := ReadInteger(CH3cm_NCOValue);
            fCH10cm_ManualAFC  := ReadBool(CH10cm_ManualAFCValue);
            fCH10cm_StaloPower := ReadFloat(CH10cm_StaloPowerValue);
            fCH10cm_StaloFreq  := ReadInteger(CH10cm_StaloFreqValue);
            fCH10cm_NCO_Freq   := ReadInteger(CH10cm_NCOValue);

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
                WriteInteger(FormatsValue, fFormats);
                Size := fAngles * sizeof(integer);
                WriteBinaryData(AngleListValue, fAngleList^, Size);
                Size := fFormats * sizeof(FormatData);
                WriteBinaryData(FormatListValue, fFormatList^, Size);
                Size := fAngles * sizeof(MovementData);
                WriteBinaryData(MovementListValue, fMovementList^, Size);
                WriteBool(AutomaticValue, fAutomatic);
                WriteBool(FTPValue, fSentFTP);
                WriteDateTime(LastTimeValue, fLastTime);
                WriteDateTime(NextTimeValue, fNextTime);
                WriteInteger(PulseValue, fPulse);
                WriteInteger(PulseRateValue, fPulseRate);
                WriteInteger(SectorsValue, fSectors);
                //filter
                WriteBool(FilterValue, fFilter);
                WriteInteger(FilterCh1Value, fFilterCh1);
                WriteInteger(FilterCh2Value, fFilterCh2);
                WriteFloat(Filter_MaxAngleValue, fFilter_MaxAngle);
                WriteInteger(Filter_MaxHeighValue, fFilter_MaxHeigh);
                WriteInteger(Filter_MaxDistanceValue, fFilter_MaxDistance);
                WriteBool(Filter_SQIValue, fFilter_SQI);
                WriteBool(Filter_CIValue, fFilter_CI);
                WriteBool(Filter_SIGValue, fFilter_SIG);
                WriteBool(Filter_LOGValue, fFilter_LOG);
                WriteBool(Filter_CCORValue, fFilter_CCOR);
                //AFC
                WriteBool(CH3cm_ManualAFCValue, fCH3cm_ManualAFC);
                WriteFloat(CH3cm_StaloPowerValue, fCH3cm_StaloPower);
                WriteInteger(CH3cm_StaloFreqValue, fCH3cm_StaloFreq);
                WriteInteger(CH3cm_NCOValue, fCH3cm_NCO_Freq);
                WriteBool(CH10cm_ManualAFCValue, fCH10cm_ManualAFC);
                WriteFloat(CH10cm_StaloPowerValue, fCH10cm_StaloPower);
                WriteInteger(CH10cm_StaloFreqValue, fCH10cm_StaloFreq);
                WriteInteger(CH10cm_NCOValue, fCH10cm_NCO_Freq);
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
  fSectors    := 360;
  fAngles     := 1;
  fFormats    := 1;
  fAngleList  := AllocMem(1 * sizeof(integer));
  fFormatList := AllocMem(1 * sizeof(FormatData));
  fMovementList := AllocMem(1 * sizeof(MovementData));
  PAngleList(fAngleList)^[0]   := ang_0;
  fFTPSettings := '';
  fSentFTP := false;
  with PFormatList(fFormatList)^[0] do
  begin
    Onda   := wl_10cm;
    Celdas := 100;
    Long   := 1000;
  end;
  with PMovementList(fMovementList)^[0] do
  begin
    Angle := ang_0;
    Speed := spd_4;
    Pulse := tx_Pulse_Long;
    Rate  := tx_Dual_None;
  end;
  fPulse := tx_Pulse_Long;
  fPulseRate := tx_Dual_None;
  //Filter
  fFilter := false;
  fFilterCh1 := 0;
  fFilterCh2 := 0;
  fFilter_MaxAngle := 0;
  fFilter_MaxHeigh := 0;
  fFilter_MaxDistance := 0;
  fFilter_SQI  := false;
  fFilter_CI   := false;
  fFilter_SIG  := false;
  fFilter_LOG  := false;
  fFilter_CCOR := false;

  fCH3cm_ManualAFC   := false;
  fCH10cm_ManualAFC  := false;
  fCH3cm_StaloPower  := 19;
  fCH10cm_StaloPower := 19;
  fCH3cm_StaloFreq   := 2950;
  fCH10cm_StaloFreq  := 2950;
  fCH3cm_NCO_Freq    := 30000000;
  fCH10cm_NCO_Freq   := 30000000;

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
  ReallocMem(fMovementList, fAngles * sizeof(MovementData));
  SaveTemplate;
end;

procedure TLayout.Set_Formatos(Value: Integer);
begin
  fFormats := Value;
  ReallocMem(fFormatList, fFormats * sizeof(FormatData));
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
  Result := pred(fFinish) * fSectors div AntennaMaxValue;
end;

function TLayout.Get_Sector_Inicio: Integer;
begin
  Result := fStart * fSectors div AntennaMaxValue;
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

function TLayout.Get_Filter: WordBool;
begin
  result := fFilter;
end;

procedure TLayout.Set_Filter(Value: WordBool);
begin
  fFilter := Value;
  SaveTemplate;
end;

procedure TLayout.CloneTemplate(Name: string; Source: ITemplate);
var
  i : integer;
  Ang, fWave, fCells, fLenght : Integer;
  _Ang, _Speed, _Pulse, _Rate : Integer;
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
  fAngleList  := AllocMem(fAngles * sizeof(integer));
  fFormatList := AllocMem(fFormats * sizeof(FormatData));
  fMovementList := AllocMem(fAngles * sizeof(MovementData));
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

  for i := 0 to fAngles-1 do
    with PMovementList(fMovementList)^[i] do
    begin
      Source.Movement(i, _Ang, _Speed, _Pulse, _Rate);
      Angle := _Ang;
      Speed := _Speed;
      Pulse := _Pulse;
      Rate  := _Rate;
    end;

  fPulse := Source.Pulso;
  fPulseRate := Source.PulseRate;
  //Filter
  fFilter := Source.Filter;
  fFilterCh1 := Source.FilterCH1;
  fFilterCh2 := Source.FilterCH2;
  fFilter_MaxAngle := Source.Filter_MaxAngle;
  fFilter_MaxHeigh := Source.Filter_MaxHeigh;
  fFilter_MaxDistance := Source.Filter_Distance;
  fFilter_SQI  := Source.FilterSQI;
  fFilter_CI   := Source.FilterCI;
  fFilter_SIG  := Source.FilterSIG;
  fFilter_LOG  := Source.FilterLOG;
  fFilter_CCOR := Source.FilterCCOR;

  fCH3cm_ManualAFC   := Source.CH3cm_ManualAFC;
  fCH10cm_ManualAFC  := Source.CH10cm_ManualAFC;
  fCH3cm_StaloPower  := Source.CH3cm_StaloPower;
  fCH10cm_StaloPower := Source.CH10cm_StaloPower;
  fCH3cm_StaloFreq   := Source.CH3cm_StaloFreq;
  fCH10cm_StaloFreq  := Source.CH10cm_StaloFreq;
  fCH3cm_NCO_Freq    := Source.CH3cm_NCO;
  fCH10cm_NCO_Freq   := Source.CH10cm_NCO;

  SaveTemplate;
end;

constructor TLayout.Clone(Name: string; Source: ITemplate);
begin
  inherited Create;
  CloneTemplate(Name, Source);
end;

function TLayout.Get_PulseRate: TxDualPulse;
begin
  Result := fPulseRate;
end;

procedure TLayout.Set_PulseRate(Value: TxDualPulse);
begin
  fPulseRate := Value;
  SaveTemplate;
end;

function TLayout.Get_CH10cm_ManualAFC: WordBool;
begin
  result := fCH10cm_ManualAFC;
end;

function TLayout.Get_CH10cm_NCO: Integer;
begin
  result := fCH10cm_NCO_Freq;
end;

function TLayout.Get_CH10cm_StaloFreq: Integer;
begin
  result := fCH10cm_StaloFreq;
end;

function TLayout.Get_CH10cm_StaloPower: Double;
begin
  result := fCH10cm_StaloPower;
end;

function TLayout.Get_CH3cm_ManualAFC: WordBool;
begin
  result := fCH3cm_ManualAFC;
end;

function TLayout.Get_CH3cm_NCO: Integer;
begin
  result := fCH3cm_NCO_Freq;
end;

function TLayout.Get_CH3cm_StaloFreq: Integer;
begin
  result := fCH3cm_StaloFreq;
end;

function TLayout.Get_CH3cm_StaloPower: Double;
begin
  result := fCH3cm_StaloPower;
end;

procedure TLayout.Set_CH10cm_ManualAFC(Value: WordBool);
begin
  fCH10cm_ManualAFC := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_StaloFreq(Value: Integer);
begin
  fCH10cm_StaloFreq := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_StaloPower(Value: Double);
begin
  fCH10cm_StaloPower := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_ManualAFC(Value: WordBool);
begin
  fCH3cm_ManualAFC := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_NCO(Value: Integer);
begin
  fCH3cm_NCO_Freq := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_StaloFreq(Value: Integer);
begin
  fCH3cm_StaloFreq := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH3cm_StaloPower(Value: Double);
begin
  fCH3cm_StaloPower := Value;
  SaveTemplate;
end;

procedure TLayout.Set_CH10cm_NCO(Value: Integer);
begin
  fCH10cm_NCO_Freq := Value;
  SaveTemplate;
end;

function TLayout.Movement(index: Integer; out Angle, Speed, Pulse, Rate: Integer): HResult;
begin
  if Index < fAngles
    then
      begin
        Angle := PMovementList(fMovementList)^[Index].Angle;
        Speed := PMovementList(fMovementList)^[Index].Speed;
        Pulse := PMovementList(fMovementList)^[Index].Pulse;
        Rate  := PMovementList(fMovementList)^[Index].Rate;
        Result := S_OK;
      end
    else Result := E_INVALIDARG;
end;

function TLayout.SetMovement(index, Angle, Speed, Pulse, Rate: Integer): HResult;
begin
  if Index < fAngles
    then
      begin
        PMovementList(fMovementList)^[Index].Angle := Angle;
        PMovementList(fMovementList)^[Index].Speed := Speed;
        PMovementList(fMovementList)^[Index].Pulse := Pulse;
        PMovementList(fMovementList)^[Index].Rate  := Rate;
        SaveTemplate;
        Result := S_OK;
      end
    else Result := E_INVALIDARG;
end;

function TLayout.Get_Filter_Distance: Integer;
begin
  result := fFilter_MaxDistance;
end;

function TLayout.Get_Filter_MaxAngle: Double;
begin
  result := fFilter_MaxAngle;
end;

function TLayout.Get_Filter_MaxHeigh: Integer;
begin
  result := fFilter_MaxHeigh;
end;

function TLayout.Get_FilterCH1: Integer;
begin
  result := fFilterCh1;
end;

function TLayout.Get_FilterCH2: Integer;
begin
  result := fFilterCh2;
end;

procedure TLayout.Set_Filter_MaxAngle(Value: Double);
begin
  fFilter_MaxAngle := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Filter_MaxDistance(Value: Integer);
begin
  fFilter_MaxDistance := Value;
  SaveTemplate;
end;

procedure TLayout.Set_Filter_MaxHeigh(Value: Integer);
begin
  fFilter_MaxHeigh := Value;
  SaveTemplate;
end;

procedure TLayout.Set_FilterCH1(Value: Integer);
begin
  fFilterCh1 := Value;
  SaveTemplate;
end;

procedure TLayout.Set_FilterCH2(Value: Integer);
begin
  fFilterCh2 := Value;
  SaveTemplate;
end;

function TLayout.Get_FilterCCOR: WordBool;
begin
  result := fFilter_CCOR;
end;

function TLayout.Get_FilterCI: WordBool;
begin
  result := fFilter_CI;
end;

function TLayout.Get_FilterLOG: WordBool;
begin
  result := fFilter_LOG;
end;

function TLayout.Get_FilterSIG: WordBool;
begin
  result := fFilter_SIG;
end;

function TLayout.Get_FilterSQI: WordBool;
begin
  result := fFilter_SQI;
end;

procedure TLayout.Set_FilterCCOR(Value: WordBool);
begin
  fFilter_CCOR := Value;
  SaveTemplate;
end;

procedure TLayout.Set_FilterCI(Value: WordBool);
begin
  fFilter_CI := Value;
  SaveTemplate;
end;

procedure TLayout.Set_FilterLOG(Value: WordBool);
begin
  fFilter_LOG := Value;
  SaveTemplate;
end;

procedure TLayout.Set_FilterSIG(Value: WordBool);
begin
  fFilter_SIG := Value;
  SaveTemplate;
end;

procedure TLayout.Set_FilterSQI(Value: WordBool);
begin
  fFilter_SQI := Value;
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

end.
