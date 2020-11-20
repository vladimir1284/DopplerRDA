unit FrameTxRx;

interface

uses
  SysUtils, Forms, 
  Rda_TLB, Tune, Onoff, ExtCtrls, StdCtrls, Controls, Classes;

type
  TFrame_TxRx = class(TFrame)
    Panel6: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label10: TLabel;
    TuneGauge1: TTuneGauge;
    GroupBox5: TGroupBox;
    Led2: TLed;
    Led3: TLed;
    Label3: TLabel;
    Label2: TLabel;
    Led4: TLed;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    CheckBox4: TCheckBox;
    Led11: TLed;
    Label1: TLabel;
    Led1: TLed;
    ledStandBy: TLed;
    ledOn: TLed;
    StaticText13: TStaticText;
    Label5: TLabel;
    TuneGauge2: TTuneGauge;
    StaticText1: TStaticText;
    Label6: TLabel;
    TuneGauge3: TTuneGauge;
    StaticText2: TStaticText;
    Label7: TLabel;
    TuneGauge4: TTuneGauge;
    StaticText3: TStaticText;
    Label8: TLabel;
    TuneGauge5: TTuneGauge;
    StaticText4: TStaticText;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    TuneGauge6: TTuneGauge;
    TuneGauge7: TTuneGauge;
    TuneGauge8: TTuneGauge;
    TuneGauge9: TTuneGauge;
    TuneGauge10: TTuneGauge;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    Led5: TLed;
    Label16: TLabel;
    Label18: TLabel;
    Led8: TLed;
    Label19: TLabel;
    Label20: TLabel;
    Led9: TLed;
    Led6: TLed;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PanelClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
  private
    fTxRx    : ITxRxStatus;
    fTx      : ITxStatus;
    fMeasure : ITxRxMeasure;
    fControl : ITxControl;
    procedure SetTxRx( Value : ITxRxStatus );
    procedure SetGaugeParameters(Gauge : TTuneGauge; Min, Max, GoogMin, GoodMax : integer);
  public
    procedure UpdateView;
  published
    property TxRx    : ITxRxStatus  read fTxRx write SetTxRx;
    property Tx      : ITxStatus    read fTx;
    property Measure : ITxRxMeasure read fMeasure;
    property Control : ITxControl   read fControl;
  end;

implementation

uses Shell_Client;

{$R *.DFM}

{ TFrame_TxRx }

procedure TFrame_TxRx.SetTxRx(Value: ITxRxStatus);
begin
  fTxRx := Value;
  if assigned(fTxRx)
    then
      begin
        fTxRx.QueryInterface(ITxStatus, fTx);
        fTxRx.QueryInterface(ITxControl, fControl);
        fTxRx.QueryInterface(ITxRxMeasure, fMeasure);
      end
    else
      begin
        fTx := nil;
        fMeasure := nil;
        fControl := nil;
      end;
  Checkbox4.Enabled := assigned(fControl);
  Button1.Enabled   := assigned(fControl);
  Button2.Enabled   := assigned(fControl);
end;

procedure TFrame_TxRx.UpdateView;
begin
  if assigned(Measure)
    then
      with Measure do
        begin
          SetGaugeParameters(TuneGauge1 , MaxMin(Rango_Tx_Potencia        ).Min, MaxMin(Rango_Tx_Potencia        ).Max, MaxMin(Sector_Tx_Potencia        ).Min, MaxMin(Sector_Tx_Potencia        ).Max);
          SetGaugeParameters(TuneGauge2 , MaxMin(Rango_Tx_MPS_Volt        ).Min, MaxMin(Rango_Tx_MPS_Volt        ).Max, MaxMin(Sector_Tx_MPS_Volt        ).Min, MaxMin(Sector_Tx_MPS_Volt        ).Max);
          SetGaugeParameters(TuneGauge3 , MaxMin(Rango_Tx_MPS_Corr        ).Min, MaxMin(Rango_Tx_MPS_Corr        ).Max, MaxMin(Sector_Tx_MPS_Corr        ).Min, MaxMin(Sector_Tx_MPS_Corr        ).Max);
          SetGaugeParameters(TuneGauge4 , MaxMin(Rango_Tx_Fuente20V_N     ).Min, MaxMin(Rango_Tx_Fuente20V_N     ).Max, MaxMin(Sector_Tx_Fuente20V_N     ).Min, MaxMin(Sector_Tx_Fuente20V_N     ).Max);
          SetGaugeParameters(TuneGauge5 , MaxMin(Rango_Tx_Fuente20V_P     ).Min, MaxMin(Rango_Tx_Fuente20V_P     ).Max, MaxMin(Sector_Tx_Fuente20V_P     ).Min, MaxMin(Sector_Tx_Fuente20V_P     ).Max);
          SetGaugeParameters(TuneGauge10, MaxMin(Rango_Tx_Fuente24V       ).Min, MaxMin(Rango_Tx_Fuente24V       ).Max, MaxMin(Sector_Tx_Fuente24V       ).Min, MaxMin(Sector_Tx_Fuente24V       ).Max);
          SetGaugeParameters(TuneGauge9 , MaxMin(Rango_Tx_Fuente50V       ).Min, MaxMin(Rango_Tx_Fuente50V       ).Max, MaxMin(Sector_Tx_Fuente50V       ).Min, MaxMin(Sector_Tx_Fuente50V       ).Max);
          SetGaugeParameters(TuneGauge8 , MaxMin(Rango_Tx_Fuente100V      ).Min, MaxMin(Rango_Tx_Fuente100V      ).Max, MaxMin(Sector_Tx_Fuente100V      ).Min, MaxMin(Sector_Tx_Fuente100V      ).Max);
          SetGaugeParameters(TuneGauge7 , MaxMin(Rango_Tx_Fuente400V      ).Min, MaxMin(Rango_Tx_Fuente400V      ).Max, MaxMin(Sector_Tx_Fuente400V      ).Min, MaxMin(Sector_Tx_Fuente400V      ).Max);
          SetGaugeParameters(TuneGauge6 , MaxMin(Rango_Tx_Fuente_Filamento).Min, MaxMin(Rango_Tx_Fuente_Filamento).Max, MaxMin(Sector_Tx_Fuente_Filamento).Min, MaxMin(Sector_Tx_Fuente_Filamento).Max);
        end;
  if Assigned(Tx)
    then
      with Tx do
        begin
          TuneGauge1.Position  := Potencia_Code;
          TuneGauge2.Position  := MPS_Volt_Code;
          TuneGauge3.Position  := MPS_Corr_Code;
          TuneGauge4.Position  := Fuente_20VN_Code;
          TuneGauge5.Position  := Fuente_20VP_Code;
          TuneGauge10.Position := Fuente_24V_Code;
          TuneGauge9.Position  := Fuente_50V_Code;
          TuneGauge8.Position  := Fuente_100V_Code;
          TuneGauge7.Position  := Fuente_400V_Code;
          TuneGauge6.Position  := Fuente_Filamento_Code;

          StaticText13.Caption := FormatFloat('0.00', Potencia_Unit);
          StaticText1.Caption  := FormatFloat('0.00', MPS_Volt_Unit);
          StaticText2.Caption  := FormatFloat('0.00', MPS_Corr_Unit);
          StaticText3.Caption  := FormatFloat('0.00', Fuente_20VN_Unit);
          StaticText4.Caption  := FormatFloat('0.00', Fuente_20VP_Unit);
          StaticText9.Caption  := FormatFloat('0.00', Fuente_24V_Unit);
          StaticText8.Caption  := FormatFloat('0.00', Fuente_50V_Unit);
          StaticText7.Caption  := FormatFloat('0.00', Fuente_100V_Unit);
          StaticText6.Caption  := FormatFloat('0.00', Fuente_400V_Unit);
          StaticText5.Caption  := FormatFloat('0.00', Fuente_Filamento_Unit);

          Label15.Caption := 'Canal ' + IntToStr(TxRx.Numero);
          case TxRx.Longitud_Onda of
            wl_3cm:  Label17.Caption := '(3cm)';
            wl_10cm: Label17.Caption := '(10cm)';
            else     Label17.Caption := '(-)';
          end;
          Led1 .State := Tx_Caldeo;
          Led2 .State := Tx_Listo;
          Led3 .State := Tx_Anodo;
          Led4 .State := Tx_Averia;
          Led11.State := not TxRx.TxRx_Ajuste;
          ledStandBy.State := Tx_Standby;
          ledOn.State := Tx_PowerOn;
          TuneGauge1.Position := Potencia_Code;

          Button1.Enabled := Led11.State;
          Button2.Enabled := Led11.State and Led2.State;
        end;
end;

procedure TFrame_TxRx.Button1Click(Sender: TObject);
begin
  if assigned(Control)
    then if Tx.Tx_PowerOn
           then Control.Tx_Apagar
           else Control.Tx_Encender;
end;

procedure TFrame_TxRx.Button2Click(Sender: TObject);
begin
  if assigned(Control)
    then
      if Tx.Tx_Anodo
        then Control.Tx_Standby := true
        else Control.Tx_Standby := false;
end;

procedure TFrame_TxRx.PanelClick(Sender: TObject);
begin
  with Sender as TPanel do
    begin
      BevelOuter := bvLowered;
      Update;
      BevelOuter := bvRaised;
      Update;
    end;
end;

procedure TFrame_TxRx.CheckBox4Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.Trabajo := Checkbox4.Checked;
end;

procedure TFrame_TxRx.SetGaugeParameters(Gauge: TTuneGauge; Min, Max, GoogMin, GoodMax : integer);
begin
  Gauge.Min      := Min;
  Gauge.Max      := Max;
  Gauge.GoodMin  := GoogMin;
  Gauge.GoodMax  := GoodMax;
end;

end.

