unit FrameAntenna;

interface

uses
  Forms, Rda_TLB, StdCtrls, Onoff, Controls, Classes, ComCtrls, Tune,
  ExtCtrls;

type
  TFrame_Antenna = class(TFrame)
    ledCupula: TLed;
    ledStatus: TLed;
    ledLimiteP: TLed;
    ledLimiteN: TLed;
    ledExitacion: TLed;
    btnAcc: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ComboBox1: TComboBox;
    Label10: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    TuneGauge1: TTuneGauge;
    TuneGauge2: TTuneGauge;
    TuneGauge3: TTuneGauge;
    StaticText13: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Label7: TLabel;
    TuneGauge4: TTuneGauge;
    StaticText3: TStaticText;
    pnlRays: TPanel;
    Panel2: TPanel;
    Label8: TLabel;
    ledLocal: TLed;
    Label9: TLabel;
    ledVentilacion: TLed;
    Panel1: TPanel;
    Panel3: TPanel;
    Label15: TLabel;
    procedure btnAccClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
  private
    fAntenna : IAntenna;
    fControl : IAntennaControl;
    procedure SetAntenna( Value : IAntenna );
    procedure SetGaugeParameters(Gauge : TTuneGauge; Min, Max, GoogMin, GoodMax : integer);
  public
    procedure UpdateView;
  published
    property Antenna : IAntenna        read fAntenna write SetAntenna;
    property Control : IAntennaControl read fControl;
  end;

implementation

{$R *.DFM}

uses
  SysUtils, Shell_Client;

{ TFrame_Antenna }

procedure TFrame_Antenna.SetAntenna(Value: IAntenna);
var
  rays : integer;
begin
  fAntenna := Value;
  btnAcc.Enabled := false;

  if assigned(fAntenna)
    then
      begin
        fAntenna.QueryInterface(IAntennaControl, fControl);

        rays := fAntenna.SyncMark;
        if rays = 0
          then ComboBox1.ItemIndex := Ord(fAntenna.SyncMarkDirection = true)
          else ComboBox1.ItemIndex := 2;
        UpDown1.Position := rays;
        UpDown1.Enabled := ComboBox1.ItemIndex = 2;
        Edit1.Enabled := ComboBox1.ItemIndex = 2;
      end
    else fControl := nil;
end;

procedure TFrame_Antenna.UpdateView;
var
  radar_on : boolean;
begin
  if assigned(Antenna)
    then
      with Antenna do
        begin
          SetGaugeParameters(TuneGauge1, MaxMin(Rango_Fuente_Excitacion).Min, MaxMin(Rango_Fuente_Excitacion).Max, MaxMin(Sector_Fuente_Excitacion).Min, MaxMin(Sector_Fuente_Excitacion).Max);
          SetGaugeParameters(TuneGauge2, MaxMin(Rango_Fuente_5V        ).Min, MaxMin(Rango_Fuente_5V        ).Max, MaxMin(Sector_Fuente_5V        ).Min, MaxMin(Sector_Fuente_5V        ).Max);
          SetGaugeParameters(TuneGauge3, MaxMin(Rango_Fuente_12V       ).Min, MaxMin(Rango_Fuente_12V       ).Max, MaxMin(Sector_Fuente_12V       ).Min, MaxMin(Sector_Fuente_12V       ).Max);
          SetGaugeParameters(TuneGauge4, MaxMin(Rango_Fuente_24V       ).Min, MaxMin(Rango_Fuente_24V       ).Max, MaxMin(Sector_Fuente_24V       ).Min, MaxMin(Sector_Fuente_24V       ).Max);

          TuneGauge1.Position := Fuente_Exitacion_Code;
          TuneGauge2.Position := Fuente_5V_Code;
          TuneGauge3.Position := Fuente_12V_Code;
          TuneGauge4.Position := Fuente_24V_Code;

          StaticText13.Caption := FormatFloat('0.00', Fuente_Exitacion_Unit);
          StaticText1.Caption  := FormatFloat('0.00', Fuente_5V_Unit);
          StaticText2.Caption  := FormatFloat('0.00', Fuente_12V_Unit);
          StaticText3.Caption  := FormatFloat('0.00', Fuente_24V_Unit);

          radar_on := ShellClient.Radar.Radar.Status <> rsOff;

          ledStatus.State      := radar_on and (Status <> rsOff);
          ledLimiteP.State     := radar_on and Limite_P;
          ledLimiteN.State     := radar_on and Limite_N;
          ledCupula.State      := radar_on;
          ledLocal.State       := radar_on;
          ledVentilacion.State := ledStatus.State;
          ledExitacion.State   := ledStatus.State;

          if (Status = rsFailure) and ledStatus.State
            then ledStatus.Color := ldRed
            else ledStatus.Color := ldGreen;
          if ledCupula.State and not Cupula_Cerrada
            then ledCupula.Color := ldRed
            else ledCupula.Color := ldGreen;
          if ledLocal.State and Local
            then ledLocal.Color := ldRed
            else ledLocal.Color := ldGreen;
          if ledVentilacion.State and not Ventilacion
            then ledVentilacion.Color := ldRed
            else ledVentilacion.Color := ldGreen;
          if ledExitacion.State and not Excitacion
            then ledVentilacion.Color := ldRed
            else ledVentilacion.Color := ldGreen;

          btnAcc.Enabled  := radar_on;

          if Antenna.Status = rsOff
            then btnAcc.Caption := 'Encender'
            else btnAcc.Caption := 'Apagar';
        end;
end;

procedure TFrame_Antenna.btnAccClick(Sender: TObject);
var
  radar_on : boolean;
begin
  if assigned(Control)
    then
      begin
      radar_on := ShellClient.Radar.Radar.Status <> rsOff;
      if radar_on
        then
          if Antenna.Status = rsOff
            then Control.Encender_Acc
            else Control.Apagar_Acc;
      end;
end;

procedure TFrame_Antenna.Button2Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.Apagar_Acc;
end;

procedure TFrame_Antenna.ComboBox1Change(Sender: TObject);
begin
  Edit1.Enabled := ComboBox1.ItemIndex = 2;
  UpDown1.Enabled := ComboBox1.ItemIndex = 2;

  if ComboBox1.ItemIndex = 2
    then Control.Set_SyncMark(false, UpDown1.Position)
    else Control.Set_SyncMark(ComboBox1.ItemIndex = 1, 0);
end;

procedure TFrame_Antenna.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  Control.Set_SyncMark(false, UpDown1.Position);
end;

procedure TFrame_Antenna.SetGaugeParameters(Gauge: TTuneGauge; Min, Max, GoogMin, GoodMax: integer);
begin
  Gauge.Min      := Min;
  Gauge.Max      := Max;
  Gauge.GoodMin  := GoogMin;
  Gauge.GoodMax  := GoodMax;
end;

end.

