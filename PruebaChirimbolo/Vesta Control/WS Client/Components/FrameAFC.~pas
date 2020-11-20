unit FrameAFC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, TeEngine, Series,
  TeeProcs, Chart, Rda_TLB, Onoff;

type
  TFrame_AFC = class(TFrame)
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    powerChart: TChart;
    Series1: TFastLineSeries;
    spectrumChart: TChart;
    FastLineSeries1: TFastLineSeries;
    TabSheet3: TTabSheet;
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
    TabSheet4: TTabSheet;
    txrxChart: TChart;
    FastLineSeries2: TFastLineSeries;
    Button7: TButton;
    txNCO: TEdit;
    Label9: TLabel;
    Label11: TLabel;
    Panel3: TPanel;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Led3: TLed;
    Label13: TLabel;
    Led4: TLed;
    Label14: TLabel;
    Led2: TLed;
    Label15: TLabel;
    Led1: TLed;
    Led5: TLed;
    Label16: TLabel;
    Label19: TLabel;
    Led6: TLed;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    txIF: TStaticText;
    txTx: TStaticText;
    txPower: TStaticText;
    txNCO_Freq: TStaticText;
    Panel6: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox2: TGroupBox;
    Button6: TButton;
    ledOn: TLed;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure acquiringClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ckManualAFCClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    fRx      : IRxStatus;
    fControl : IRxControl;
    procedure SetTxRx( Value : ITxRxStatus );
    procedure QueryStalo;
  public
    procedure UpdateView;
  published
    property TxRx    : ITxRxStatus  write SetTxRx;
    property Rx      : IRxStatus    read  fRx;
    property Control : IRxControl   read  fControl;
  end;

implementation

{$R *.dfm}

procedure TFrame_AFC.SetTxRx(Value: ITxRxStatus);
begin
  if assigned(Value)
    then
      begin
        Value.QueryInterface(IRxStatus, fRx);
        Value.QueryInterface(IRxControl, fControl);
        ckManualAFC.Checked := fRx.AFC_Status;
        Panel2.Enabled := ckManualAFC.Checked;
        QueryStalo;
      end
    else
      begin
        fRx := nil;
        fControl := nil;
      end;
end;

procedure TFrame_AFC.UpdateView;
begin
  if Assigned(fRx)
    then
      with fRx do
        begin
          txIF.Caption := IntToStr(Tx_IF);
          txTx.Caption := IntToStr(Tx_Frequency);
          txPower.Caption := FloatToStr(Tx_PulsePower);
          txNCO_Freq.Caption := IntToStr(NCO_Frequency);
        end;
  if PageControl1.ActivePageIndex = 3
    then QueryStalo;
end;

procedure TFrame_AFC.Button1Click(Sender: TObject);
begin
  if Assigned(fControl)
    then
      begin
        Control.Stalo_Reset;
        QueryStalo;
      end;
end;

procedure TFrame_AFC.Button2Click(Sender: TObject);
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

procedure TFrame_AFC.Button3Click(Sender: TObject);
begin
  if Assigned(fControl)
    then Control.Stalo_Power := StrToFloat(txStaloFreq.Text);
end;

procedure TFrame_AFC.acquiringClick(Sender: TObject);
begin
  with Sender as TBulb do
  begin
    State := not State;
    if State
      then Rx.StartAcquiring;
  end;
end;

procedure TFrame_AFC.QueryStalo;
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

procedure TFrame_AFC.PageControl1Change(Sender: TObject);
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

procedure TFrame_AFC.Button4Click(Sender: TObject);
begin
  if Assigned(fControl)
    then Control.Stalo_Output := true;
end;

procedure TFrame_AFC.Button5Click(Sender: TObject);
begin
  if Assigned(fControl)
    then Control.Stalo_Output := false;
end;

procedure TFrame_AFC.ckManualAFCClick(Sender: TObject);
begin
  Panel2.Enabled := (Sender as TCheckBox).Checked;
  Control.AFC_Status := (Sender as TCheckBox).Checked;
end;

procedure TFrame_AFC.Button7Click(Sender: TObject);
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

end.
