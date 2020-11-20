unit Template;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, RDAObj, Rda_TLB, Layout;

type
  TTemplate =
    class( TRDAObject, ITemplate, ITemplateControl )
      public
        constructor Create( UserName : string; Level : integer;
                            Name : string );
        constructor Clone( UserName : string; Level : integer; Name : string; Source : ITemplate );
      private
        fTemplate : ITemplate;
        fControl  : ITemplateControl;
      protected  // ITemplate
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
        //filter
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
      protected  // ITemplateControl
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
    end;

const
  Class_Template: TGUID = '{9AF7AB8B-68F1-46C7-BF3C-9FDE75FB6309}';

implementation

uses
  ComServ;

{ TTemplate }

constructor TTemplate.Create( UserName : string; Level : integer; Name : string );
begin
  inherited Create(UserName, Level);
  fTemplate := TLayout.Create(Name);
  fControl  := fTemplate as ITemplateControl;
end;

procedure TTemplate.Eliminar;
begin
  if InControl
    then fControl.Eliminar;
end;

procedure TTemplate.Set_Anterior(Value: TDateTime);
begin
  if InControl
    then fControl.Set_Anterior(Value);
end;

function TTemplate.SetAngulo(Index, Angle: Integer): HResult;
begin
  if InControl
    then fControl.SetAngulo(Index, Angle);
end;

function TTemplate.SetFormato(Index, Wave, Cells, Length: Integer): HResult;
begin
  if InControl
    then fControl.SetFormato(Index, Wave, Cells, Length);
end;

procedure TTemplate.Set_Demora(Value: TDateTime);
begin
  if InControl
    then fControl.Set_Demora(Value);
end;

procedure TTemplate.Set_Direcciones(const Value: WideString);
begin
  if InControl
    then fControl.Set_Direcciones(Value);
end;

procedure TTemplate.Set_Fin(Value: Integer);
begin
  if InControl
    then fControl.Set_Fin(Value);
end;

procedure TTemplate.Set_Inicio(Value: Integer);
begin
  if InControl
    then fControl.Set_Inicio(Value);
end;

procedure TTemplate.Set_Nombre(const Value: WideString);
begin
  if InControl
    then fControl.Set_Nombre(Value);
end;

procedure TTemplate.Set_Opciones(Value: Integer);
begin
  if InControl
    then fControl.Set_Opciones(Value);
end;

procedure TTemplate.Set_Periodo(Value: TDateTime);
begin
  if InControl
    then fControl.Set_Periodo(Value);
end;

procedure TTemplate.Set_Proxima(Value: TDateTime);
begin
  if InControl
    then fControl.Set_Proxima(Value);
end;

procedure TTemplate.Set_Tipo(Value: Integer);
begin
  if InControl
    then fControl.Set_Tipo(Value);
end;

procedure TTemplate.Set_Velocidad(Value: Integer);
begin
  if InControl
    then fControl.Set_Velocidad(Value);
end;

function TTemplate.Angulo(Index: Integer; out Angle: Integer): HResult;
begin
  Result := fTemplate.Angulo(Index, Angle);
end;

function TTemplate.Formato(Index: Integer; out Wave, Cells, Length: Integer): HResult;
begin
  Result := fTemplate.Formato(Index, Wave, Cells, Length);
end;

function TTemplate.Get_Angulos: Integer;
begin
  Result := fTemplate.Get_Angulos;
end;

function TTemplate.Get_Anterior: TDateTime;
begin
  Result := fTemplate.Get_Anterior;
end;

function TTemplate.Get_Automatica: WordBool;
begin
  Result := fTemplate.Get_Automatica;
end;

function TTemplate.Get_Demora: TDateTime;
begin
  Result := fTemplate.Get_Demora;
end;

function TTemplate.Get_Direcciones: WideString;
begin
  Result := fTemplate.Get_Direcciones;
end;

function TTemplate.Get_Fin: Integer;
begin
  Result := fTemplate.Get_Fin;
end;

function TTemplate.Get_Formatos: Integer;
begin
  Result := fTemplate.Get_Formatos;
end;

function TTemplate.Get_Inicio: Integer;
begin
  Result := fTemplate.Get_Inicio;
end;

function TTemplate.Get_Nombre: WideString;
begin
  Result := fTemplate.Get_Nombre;
end;

function TTemplate.Get_Opciones: Integer;
begin
  Result := fTemplate.Get_Opciones;
end;

function TTemplate.Get_Periodo: TDateTime;
begin
  Result := fTemplate.Get_Periodo;
end;

function TTemplate.Get_Proxima: TDateTime;
begin
  Result := fTemplate.Get_Proxima;
end;

function TTemplate.Get_Tipo: Integer;
begin
  Result := fTemplate.Get_Tipo;
end;

function TTemplate.Get_Velocidad: Integer;
begin
  Result := fTemplate.Get_Velocidad;
end;

procedure TTemplate.Set_Automatica(Value: WordBool);
begin
  if InControl
    then fTemplate.Set_Automatica(Value);
end;

procedure TTemplate.Set_Angulos(Value: Integer);
begin
  if InControl
    then fControl.Set_Angulos(Value);
end;

procedure TTemplate.Set_Formatos(Value: Integer);
begin
  if InControl
    then fControl.Set_Formatos(Value);
end;

function TTemplate.Get_Pulso: TxPulse;
begin
  Result := fTemplate.Get_Pulso;
end;

procedure TTemplate.Set_Pulso(Value: TxPulse);
begin
  if InControl
    then fControl.Set_Pulso(Value);
end;

function TTemplate.Get_Sector_Fin: Integer;
begin
  Result := fTemplate.Get_Sector_Fin;
end;

function TTemplate.Get_Sector_Inicio: Integer;
begin
  Result := fTemplate.Get_Sector_Inicio;
end;

procedure TTemplate.Set_FTPSettings(const Value: WideString);
begin
  if InControl
    then fControl.Set_FTPSettings(Value);
end;

function TTemplate.Get_FTPSettings: WideString;
begin
  Result := fTemplate.Get_FTPSettings;
end;

function TTemplate.Get_SentFTP: WordBool;
begin
  Result := fTemplate.Get_SentFTP;
end;

procedure TTemplate.Set_SentFTP(Value: WordBool);
begin
  if InControl
    then fControl.Set_SentFTP(Value);
end;

function TTemplate.Get_Filter: WordBool;
begin
  Result := fTemplate.Get_Filter;
end;

procedure TTemplate.Set_Filter(Value: WordBool);
begin
  if InControl
    then fControl.Set_Filter(Value);
end;

constructor TTemplate.Clone(UserName: string; Level: integer; Name: string; Source: ITemplate);
begin
  inherited Create(UserName, Level);
  fTemplate := TLayout.Clone(Name, Source);
  fControl  := fTemplate as ITemplateControl;
end;

function TTemplate.Get_PulseRate: TxDualPulse;
begin
  Result := fTemplate.Get_PulseRate;
end;

procedure TTemplate.Set_PulseRate(Value: TxDualPulse);
begin
  if InControl
    then fControl.Set_PulseRate(Value);
end;

function TTemplate.Get_CH10cm_ManualAFC: WordBool;
begin
  Result := fTemplate.Get_CH10cm_ManualAFC;
end;

function TTemplate.Get_CH10cm_NCO: Integer;
begin
  Result := fTemplate.Get_CH10cm_NCO;
end;

function TTemplate.Get_CH10cm_StaloFreq: Integer;
begin
  Result := fTemplate.Get_CH10cm_StaloFreq;
end;

function TTemplate.Get_CH10cm_StaloPower: Double;
begin
  Result := fTemplate.Get_CH10cm_StaloPower;
end;

function TTemplate.Get_CH3cm_ManualAFC: WordBool;
begin
  Result := fTemplate.Get_CH3cm_ManualAFC;
end;

function TTemplate.Get_CH3cm_NCO: Integer;
begin
  Result := fTemplate.Get_CH3cm_NCO;
end;

function TTemplate.Get_CH3cm_StaloFreq: Integer;
begin
  Result := fTemplate.Get_CH3cm_StaloFreq;
end;

function TTemplate.Get_CH3cm_StaloPower: Double;
begin
  Result := fTemplate.Get_CH3cm_StaloPower;
end;

procedure TTemplate.Set_CH10cm_ManualAFC(Value: WordBool);
begin
  if InControl
    then fControl.Set_CH10cm_ManualAFC(Value);
end;

procedure TTemplate.Set_CH10cm_StaloFreq(Value: Integer);
begin
  if InControl
    then fControl.Set_CH10cm_StaloFreq(Value);
end;

procedure TTemplate.Set_CH10cm_StaloPower(Value: Double);
begin
  if InControl
    then fControl.Set_CH10cm_StaloPower(Value);
end;

procedure TTemplate.Set_CH3cm_ManualAFC(Value: WordBool);
begin
  if InControl
    then fControl.Set_CH3cm_ManualAFC(Value);
end;

procedure TTemplate.Set_CH3cm_NCO(Value: Integer);
begin
  if InControl
    then fControl.Set_CH3cm_NCO(Value);
end;

procedure TTemplate.Set_CH3cm_StaloFreq(Value: Integer);
begin
  if InControl
    then fControl.Set_CH3cm_StaloFreq(Value);
end;

procedure TTemplate.Set_CH3cm_StaloPower(Value: Double);
begin
  if InControl
    then fControl.Set_CH3cm_StaloPower(Value);
end;

procedure TTemplate.Set_CH10cm_NCO(Value: Integer);
begin
  if InControl
    then fControl.Set_CH10cm_NCO(Value);
end;

function TTemplate.Movement(index: Integer; out Angle, Speed, Pulse, Rate: Integer): HResult;
begin
  Result := fTemplate.Movement(Index, Angle, Speed, Pulse, Rate);
end;

function TTemplate.SetMovement(index, Angle, Speed, Pulse, Rate: Integer): HResult;
begin
  if InControl
    then fControl.SetMovement(Index, Angle, Speed, Pulse, Rate);
end;

function TTemplate.Get_Filter_Distance: Integer;
begin
  Result := fTemplate.Get_Filter_Distance;
end;

function TTemplate.Get_Filter_MaxAngle: Double;
begin
  Result := fTemplate.Get_Filter_MaxAngle;
end;

function TTemplate.Get_Filter_MaxHeigh: Integer;
begin
  Result := fTemplate.Get_Filter_MaxHeigh;
end;

function TTemplate.Get_FilterCH1: Integer;
begin
  Result := fTemplate.Get_FilterCH1;
end;

function TTemplate.Get_FilterCH2: Integer;
begin
  Result := fTemplate.Get_FilterCH2;
end;

procedure TTemplate.Set_Filter_MaxAngle(Value: Double);
begin
  if InControl
    then fControl.Set_Filter_MaxAngle(Value);
end;

procedure TTemplate.Set_Filter_MaxDistance(Value: Integer);
begin
  if InControl
    then fControl.Set_Filter_MaxDistance(Value);
end;

procedure TTemplate.Set_Filter_MaxHeigh(Value: Integer);
begin
  if InControl
    then fControl.Set_Filter_MaxHeigh(Value);
end;

procedure TTemplate.Set_FilterCH1(Value: Integer);
begin
  if InControl
    then fControl.Set_FilterCH1(Value);
end;

procedure TTemplate.Set_FilterCH2(Value: Integer);
begin
  if InControl
    then fControl.Set_FilterCH2(Value);
end;

function TTemplate.Get_FilterCCOR: WordBool;
begin
  Result := fTemplate.Get_FilterCCOR;
end;

function TTemplate.Get_FilterCI: WordBool;
begin
  Result := fTemplate.Get_FilterCI;
end;

function TTemplate.Get_FilterLOG: WordBool;
begin
  Result := fTemplate.Get_FilterLOG;
end;

function TTemplate.Get_FilterSIG: WordBool;
begin
  Result := fTemplate.Get_FilterSIG;
end;

function TTemplate.Get_FilterSQI: WordBool;
begin
  Result := fTemplate.Get_FilterSQI;
end;

procedure TTemplate.Set_FilterCCOR(Value: WordBool);
begin
  if InControl
    then fControl.Set_FilterCCOR(Value);
end;

procedure TTemplate.Set_FilterCI(Value: WordBool);
begin
  if InControl
    then fControl.Set_FilterCI(Value);
end;

procedure TTemplate.Set_FilterLOG(Value: WordBool);
begin
  if InControl
    then fControl.Set_FilterLOG(Value);
end;

procedure TTemplate.Set_FilterSIG(Value: WordBool);
begin
  if InControl
    then fControl.Set_FilterSIG(Value);
end;

procedure TTemplate.Set_FilterSQI(Value: WordBool);
begin
  if InControl
    then fControl.Set_FilterSQI(Value);
end;

function TTemplate.Get_Sectores: Integer;
begin
  Result := fTemplate.Get_Sectores;
end;

procedure TTemplate.Set_Sectores(Value: Integer);
begin
  if InControl
    then fControl.Set_Sectores(Value);
end;

initialization
  TComObjectFactory.Create(ComServer, TTemplate, Class_Template,
    'Template', '', ciMultiInstance, tmApartment);
end.
