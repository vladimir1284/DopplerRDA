unit FrameDRX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, TeEngine, Series,
  TeeProcs, Chart, Rda_TLB, Onoff;

type
  TFrame_DRX = class(TFrame)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    powerChart: TChart;
    Series1: TFastLineSeries;
    spectrumChart: TChart;
    FastLineSeries1: TFastLineSeries;
    tabStalo: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    stTemperature: TStaticText;
    stPower: TStaticText;
    stFrequncy: TStaticText;
    ckExtRef: TCheckBox;
    ckRef_Unlocked: TCheckBox;
    ckRF_Output: TCheckBox;
    ckRF_Unlocked: TCheckBox;
    ckVoltageError: TCheckBox;
    ckRef_Output: TCheckBox;
    ckBlanking: TCheckBox;
    ckLockRecovery: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    txStaloFreq: TEdit;
    txStaloPower: TEdit;
    acquiring: TBulb;
    ckManualAFC: TCheckBox;
    Panel2: TPanel;
    Button7: TButton;
    txNCO: TEdit;
    Label9: TLabel;
    Label11: TLabel;
    Panel3: TPanel;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    ledFuente5N: TLed;
    Label13: TLabel;
    ledDRX: TLed;
    ledFuente15N: TLed;
    Label15: TLabel;
    ledFuente5P: TLed;
    ledFuente15P: TLed;
    Label16: TLabel;
    Label19: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    txIF: TStaticText;
    txTx: TStaticText;
    txPower: TStaticText;
    txNCO_Freq: TStaticText;
    GroupBox2: TGroupBox;
    btnOnOff: TButton;
    ledOn: TLed;
    ledStalo: TLed;
    Label14: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure acquiringClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ckManualAFCClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure btnOnOffClick(Sender: TObject);
  private
    fTxRx    : ITxRxStatus;
    fRx      : IRxStatus;
    fControl : IRxControl;
    procedure SetTxRx( Value : ITxRxStatus );
    procedure QueryStalo;
  public
    procedure UpdateView;
  published
    property TxRx    : ITxRxStatus  read fTxRx  write SetTxRx;
    property Rx      : IRxStatus    read fRx;
    property Control : IRxControl   read fControl;
  end;

implementation

uses Shell_Client;

{$R *.dfm}

procedure TFrame_DRX.SetTxRx(Value: ITxRxStatus);
begin
  fTxRx := Value;
  btnOnOff.Enabled  := false;
  tabStalo.Enabled  := false;
  acquiring.Enabled := false;

  if assigned(Value)
    then
      begin
        Value.QueryInterface(IRxStatus, fRx);
        Value.QueryInterface(IRxControl, fControl);

        ckManualAFC.Checked := fRx.AFC_Status;
        Panel2.Enabled := ckManualAFC.Checked;
      end
    else
      begin
        fRx := nil;
        fControl := nil;
      end;
end;

procedure TFrame_DRX.UpdateView;
var
  radar_on : boolean;
begin
  if Assigned(fRx)
    then
      with Rx do
        begin
          radar_on := ShellClient.Radar.Radar.Status <> rsOff;

          ledOn.State := radar_on and (Rx_Status <> rsOff);

          btnOnOff.Enabled  := radar_on;
          tabStalo.Enabled  := ledOn.State;
          acquiring.Enabled := ledOn.State;

          ledFuente5N.State  := ledOn.State;
          ledFuente5P.State  := ledOn.State;
          ledFuente15N.State := ledOn.State;
          ledFuente15P.State := ledOn.State;
          ledStalo.State     := ledOn.State;
          ledDRX.State       := ledOn.State;

          if (Rx_Status = rsFailure) and ledOn.State
            then ledOn.Color := ldRed
            else ledOn.Color := ldGreen;
          if ledFuente5P.State and not Fuente_5V_P
            then ledFuente5P.Color := ldRed
            else ledFuente5P.Color := ldGreen;
          if ledFuente15N.State and not Fuente_15V_N
            then ledFuente15N.Color := ldRed
            else ledFuente15N.Color := ldGreen;
          if ledFuente15N.State and not Fuente_5V_N
            then ledFuente5N.Color := ldRed
            else ledFuente5N.Color := ldGreen;
          if ledDRX.State and not DRX_Ready
            then ledDRX.Color := ldRed
            else ledDRX.Color := ldGreen;
          if ledFuente15P.State and not Fuente_15V_P
            then ledFuente15P.Color := ldRed
            else ledFuente15P.Color := ldGreen;
          if ledStalo.State and not Stalo_Locked
            then ledStalo.Color := ldRed
            else ledStalo.Color := ldGreen;

          txIF.Caption       := IntToStr(Tx_IF);
          txTx.Caption       := IntToStr(Tx_Frequency);
          txPower.Caption    := FloatToStr(Tx_PulsePower);
          txNCO_Freq.Caption := IntToStr(NCO_Frequency);

          if Rx_Status = rsOff
            then btnOnOff.Caption := 'Encender'
            else btnOnOff.Caption := 'Apagar';
        end;

  if PageControl1.ActivePageIndex = 2
    then QueryStalo;
end;

procedure TFrame_DRX.Button1Click(Sender: TObject);
begin
  if Assigned(fControl)
    then
      begin
        Control.Stalo_Reset;
        QueryStalo;
      end;
end;

procedure TFrame_DRX.Button2Click(Sender: TObject);
var
  freq : Int64;
begin
  if Assigned(fControl)
    then
      begin
        freq := StrToInt(txStaloFreq.Text);
        freq := freq  * 1000000;
        Control.Stalo_Freq := freq;
      end;
end;

procedure TFrame_DRX.Button3Click(Sender: TObject);
begin
  if Assigned(fControl)
    then Control.Stalo_Power := StrToFloat(txStaloFreq.Text);
end;

procedure TFrame_DRX.acquiringClick(Sender: TObject);
begin
  with Sender as TBulb do
  begin
    State := not State;
    if State
      then Rx.StartAcquiring;
  end;
end;

procedure TFrame_DRX.QueryStalo;
begin
  if Assigned(fControl)
    then
      begin
        Control.Stalo_Update;
        stTemperature.Caption  := FloatToStr(Rx.Stalo_Temperature);
        stFrequncy.Caption     := IntToStr(Rx.Stalo_Frequency);
        stPower.Caption        := FloatToStr(Rx.Stalo_Power);
        ckExtRef.Checked       := Rx.Stalo_ExtRef;
        ckRef_Unlocked.Checked := Rx.Stalo_Ref_Unlocked;
        ckRF_Output.Checked    := Rx.Stalo_RF_Output;
        ckRF_Unlocked.Checked  := Rx.Stalo_RF_Unlocked;
        ckVoltageError.Checked := Rx.Stalo_VoltageError;
        ckRef_Output.Checked   := Rx.Stalo_Ref_Output;
        ckBlanking.Checked     := Rx.Stalo_Blanking;
        ckLockRecovery.Checked := Rx.Stalo_LockRecovery;
      end;
end;

procedure TFrame_DRX.PageControl1Change(Sender: TObject);
begin
  if acquiring.State
    then Rx.StartAcquiring;

  if PageControl1.ActivePageIndex = 2
    then
      begin
        ckManualAFC.Checked := Rx.AFC_Status;
        Panel2.Enabled := ckManualAFC.Checked;
      end;
end;

procedure TFrame_DRX.Button4Click(Sender: TObject);
begin
  if Assigned(fControl)
    then Control.Stalo_Output := true;
end;

procedure TFrame_DRX.Button5Click(Sender: TObject);
begin
  if Assigned(fControl)
    then Control.Stalo_Output := false;
end;

procedure TFrame_DRX.ckManualAFCClick(Sender: TObject);
begin
  Panel2.Enabled := (Sender as TCheckBox).Checked;
  Control.AFC_Status := (Sender as TCheckBox).Checked;
end;

procedure TFrame_DRX.Button7Click(Sender: TObject);
var
  freq : Int64;
begin
  if Assigned(fControl)
    then
      begin
        freq := StrToInt(txNCO.Text);
        Control.NCO_Frequency := freq;
      end;
end;

procedure TFrame_DRX.btnOnOffClick(Sender: TObject);
var
  radar_on : boolean;
begin
  if Assigned(Control)
    then
      begin
        radar_on := ShellClient.Radar.Radar.Status <> rsOff;
        if radar_on
          then if Rx.Rx_Status = rsOff
                 then Control.Rx_Encender
                 else Control.Rx_Apagar;
      end;
end;

end.
