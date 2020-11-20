unit FrameTxRx;

interface

uses
  SysUtils, Forms, Tune, Onoff, ExtCtrls, StdCtrls, Controls, Classes, CommonObjs, TxRxChWS, InvokeRegistry;

type
  TFrame_TxRx = class(TFrame)
    Panel6: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    TuneGauge1: TTuneGauge;
    Bulb4: TBulb;
    GroupBox5: TGroupBox;
    Led2: TLed;
    Led3: TLed;
    Led1: TLed;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Led4: TLed;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    TuneGauge2: TTuneGauge;
    TuneGauge3: TTuneGauge;
    TuneGauge4: TTuneGauge;
    Bulb1: TBulb;
    Bulb2: TBulb;
    Bulb3: TBulb;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    Led7: TLed;
    Led5: TLed;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Led8: TLed;
    Label8: TLabel;
    Led6: TLed;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel4: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    CheckBox4: TCheckBox;
    Led11: TLed;
    Potencia: TStaticText;
    Ruido: TStaticText;
    Ganancia: TStaticText;
    Sintonia: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure PanelClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
  private
    fUpdating : boolean;
    fTxRx : ITxRxChWS;

    fAuthHeader : TAuthHeader;
    function GetControl: ITxRxChWS;
    function GetMeasure: ITxRxChWS;
    function GetTxRx: ITxRxChWS;
  public
    procedure Init(TxRxChannel: ITxRxChWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property TxRx    : ITxRxChWS read GetTxRx;
    property Measure : ITxRxChWS read GetMeasure;
    property Control : ITxRxChWS read GetControl;
    property MRL5M   : ITxRxChWS read GetControl;
  end;

implementation

uses Shell_Client;

{$R *.DFM}

{ TFrame_TxRx }

procedure TFrame_TxRx.UpdateView;
begin
  if fUpdating then exit;
  fUpdating := true;
  try
    try
      if assigned(MRL5M)
        then
          with MRL5M do
            begin
              Bulb2.State := Rx_CMG;
              Bulb3.State := Rx_CMS;
            end;
      if assigned(Measure)
        then
          with Measure do
            begin
              with MaxMin(Rango_Tx_Potencia) do
                begin
                  TuneGauge1.Min := Min;
                  TuneGauge1.Max := Max;
                end;
              with MaxMin(Rango_Rx_Ruido) do
                begin
                  TuneGauge2.Min := Min;
                  TuneGauge2.Max := Max;
                end;
              with MaxMin(Rango_Rx_Ganancia) do
                begin
                  TuneGauge3.Min := Min;
                  TuneGauge3.Max := Max;
                end;
              with MaxMin(Rango_Rx_Sintonia) do
                begin
                  TuneGauge4.Min := Min;
                  TuneGauge4.Max := Max;
                end;
              with MaxMin(Sector_Tx_Potencia) do
                begin
                  TuneGauge1.GoodMin := Min;
                  TuneGauge1.GoodMax := Max;
                end;
              with MaxMin(Sector_Rx_Ruido) do
                begin
                  TuneGauge2.GoodMin := Min;
                  TuneGauge2.GoodMax := Max;
                end;
              with MaxMin(Sector_Rx_Ganancia) do
                begin
                  TuneGauge3.GoodMin := Min;
                  TuneGauge3.GoodMax := Max;
                end;
              with MaxMin(Sector_Rx_Sintonia) do
                begin
                  TuneGauge4.GoodMin := Min;
                  TuneGauge4.GoodMax := Max;
                end;
            end;
      if Assigned(TxRx)
        then
          with TxRx do
            begin
              Label15.Caption := 'Canal ' + IntToStr(Numero);
              case Longitud_Onda of
                wl_3cm:  Label17.Caption := '(3cm)';
                wl_10cm: Label17.Caption := '(10cm)';
                else     Label17.Caption := '(-)';
              end;
              Led1 .State := Tx_Caldeo;
              Led2 .State := Tx_Listo;
              Led3 .State := Tx_Anodo;
              Led4 .State := Tx_Averia;
              Led5 .State := Rx_Caldeo;
              Led6 .State := Rx_Anodo;
              Led7 .State := Led6.State;
              Led8 .State := Rx_Averia;
              Led11.State := not TxRx_Ajuste;
              Bulb4.State := Tx_Standby;
              Bulb1.State := Rx_Correccion;
              TuneGauge1.Position := Tx_Potencia;
              TuneGauge2.Position := Rx_Ruido;
              TuneGauge3.Position := Rx_Ganancia;
              TuneGauge4.Position := Rx_Sintonia;
              Potencia.Caption := 'KW';
              Sintonia.Caption := FormatFloat( '0.0', Rx_Sintonia_Voltage ) + ' Volts';
              Ganancia.Caption := FormatFloat( '0.0', Rx_Ganancia_Voltage ) + ' Volts';
              Ruido.Caption    := FormatFloat( '0.0', Rx_Ruido_Voltage ) + ' Volts';

              Button1.Enabled := Led11.State;
              Button2.Enabled := Led11.State and Led2.State;
              Button3.Enabled := Led11.State;
              Checkbox3.Enabled := Led11.State;
              Checkbox1.Enabled := assigned(MRL5M) and Led11.State;
              Checkbox2.Enabled := Checkbox1.Enabled;
              Panel1.Enabled := assigned(MRL5M) and Bulb2.State;
              Panel2.Enabled := Panel1.Enabled;
              Panel3.Enabled := assigned(MRL5M) and Bulb3.State;
              Panel4.Enabled := Panel3.Enabled;
            end;
    except
    end;
  finally
    fUpdating := false;
  end;
end;

procedure TFrame_TxRx.Button1Click(Sender: TObject);
begin
  if assigned(Control)
    then if ShellClient.GeneralConfiguration.Configuration.Get_RadarBrand(ShellClient.GeneralConfiguration.Configuration.Radar_ID) = rbRC32B
           then Control.Tx_Encender
           else if Led1.State
                  then Control.Tx_Apagar
                  else Control.Tx_Encender;
end;

procedure TFrame_TxRx.Button2Click(Sender: TObject);
begin
  if assigned(Control)
    then
      if Led3.State
        then Control.Tx_Standby := true
        else Control.Tx_Standby := false;
end;

procedure TFrame_TxRx.Button3Click(Sender: TObject);
begin
  if assigned(Control)
    then
      if Led5.State
        then Control.Rx_Apagar
        else Control.Rx_Encender;
end;

procedure TFrame_TxRx.PanelClick(Sender: TObject);
begin
  with Sender as TPanel do
    begin
      BevelOuter := bvLowered;
      Update;
      if assigned(MRL5M)
        then
          case Tag of
            1: MRL5M.Rx_Ganancia_P;
            2: MRL5M.Rx_Ganancia_N;
            3: MRL5M.Rx_Sintonia_P;
            4: MRL5M.Rx_Sintonia_N;
          end;
      BevelOuter := bvRaised;
      Update;
    end;
end;

procedure TFrame_TxRx.CheckBox3Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.Rx_Correccion := (Sender as TCheckBox).Checked;
end;

procedure TFrame_TxRx.CheckBox1Click(Sender: TObject);
begin
  if assigned(MRL5M)
    then MRL5M.Rx_CMG := (Sender as TCheckBox).Checked;
end;

procedure TFrame_TxRx.CheckBox2Click(Sender: TObject);
begin
  if assigned(MRL5M)
    then MRL5M.Rx_CMS := (Sender as TCheckBox).Checked;
end;

procedure TFrame_TxRx.CheckBox4Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.Trabajo := Checkbox4.Checked;
end;

procedure TFrame_TxRx.Init(TxRxChannel: ITxRxChWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;

  fAuthHeader := AuthHeader;
  fTxRx := TxRxChannel;

  Checkbox4.Enabled := assigned(Control);
  Button1.Enabled := assigned(Control);
  Button2.Enabled := assigned(Control);
  Button3.Enabled := assigned(Control);
  Checkbox3.Enabled := assigned(Control);
  Checkbox1.Enabled := assigned(MRL5M);
  Checkbox2.Enabled := assigned(MRL5M);
  Panel1.Enabled := assigned(MRL5M);
  Panel2.Enabled := assigned(MRL5M);
  Panel3.Enabled := assigned(MRL5M);
  Panel4.Enabled := assigned(MRL5M);
  UpdateView;
end;

function TFrame_TxRx.GetControl: ITxRxChWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fTxRx as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fTxRx;
end;

function TFrame_TxRx.GetMeasure: ITxRxChWS;
begin
  result := fTxRx;
end;

function TFrame_TxRx.GetTxRx: ITxRxChWS;
begin
  result := fTxRx;
end;

end.

