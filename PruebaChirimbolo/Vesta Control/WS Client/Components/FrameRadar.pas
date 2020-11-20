unit FrameRadar;

interface

uses
  Forms, Rda_TLB, StdCtrls, Tune, Onoff, Controls, Classes, ExtCtrls;

type
  TFrame_Radar = class(TFrame)
    btnRadar: TButton;
    ledStatus: TLed;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    ledTx1: TLed;
    ledDRX1: TLed;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    ledTx2: TLed;
    ledDRX2: TLed;
    ledListo: TLed;
    Label1: TLabel;
    Panel2: TPanel;
    Label15: TLabel;
    Panel3: TPanel;
    Label3: TLabel;
    ledAntenna: TLed;
    procedure btnRadarClick(Sender: TObject);
  private
    fRadar   : IRadar;
    fControl : IRadarControl;
    procedure SetRadar( Value : IRadar );
  public
    procedure UpdateView;
  published
    property Radar   : IRadar        read fRadar write SetRadar;
    property Control : IRadarControl read fControl;
  end;

implementation

{$R *.DFM}

procedure TFrame_Radar.SetRadar(Value: IRadar);
begin
  fRadar := Value;
  btnRadar.Enabled := false;

  if assigned(fRadar)
    then fRadar.QueryInterface(IRadarControl, fControl)
    else fControl := nil;

  UpdateView;
end;

procedure TFrame_Radar.UpdateView;
begin
  if assigned(fRadar)
    then
      with fRadar do
        begin
          ledStatus.State  := Status <> rsOff;
          ledAntenna.State := ledStatus.State and (AntennaStatus <> rsOff);
          ledTx1.State     := ledStatus.State and (Tx1Status <> rsOff);
          ledTx2.State     := ledStatus.State and (Tx2Status <> rsOff);
          ledDRX1.State    := ledStatus.State and (Rx1Status <> rsOff);
          ledDRX2.State    := ledStatus.State and (Rx2Status <> rsOff);

          if Red_Listo
            then ledListo.Color := ldGreen
            else ledListo.Color := ldRed;

          if (AntennaStatus = rsFailure) and ledAntenna.State
            then ledAntenna.Color := ldRed
            else ledAntenna.Color := ldGreen;

          if (Status = rsFailure) and ledStatus.State
            then ledStatus.Color := ldRed
            else ledStatus.Color := ldGreen;

          if (Tx1Status = rsFailure) and ledTx1.State
            then ledTx1.Color := ldRed
            else ledTx1.Color := ldGreen;

          if (Tx2Status = rsFailure) and ledTx2.State
            then ledTx2.Color := ldRed
            else ledTx2.Color := ldGreen;

          if (Rx1Status = rsFailure) and ledDRX1.State
            then ledDRX1.Color := ldRed
            else ledDRX1.Color := ldGreen;

          if (Rx2Status = rsFailure) and ledDRX2.State
            then ledDRX2.Color := ldRed
            else ledDRX2.Color := ldGreen;

          btnRadar.Enabled := Red_Listo;
          if Radar.Status = rsOff
            then btnRadar.Caption := 'Encender'
            else btnRadar.Caption := 'Apagar';
        end;
end;

procedure TFrame_Radar.btnRadarClick(Sender: TObject);
begin
  if assigned(Control)
    then
      if Radar.Status = rsOff
        then Control.Encender_Radar
        else Control.Apagar_Radar;
end;

end.
