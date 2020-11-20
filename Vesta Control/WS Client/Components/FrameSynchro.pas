unit FrameSynchro;

interface

uses 
  SysUtils, Forms, 
  Rda_TLB, StdCtrls, Onoff, Controls, Classes, ExtCtrls, Buttons;

type
  TFrame_Synchro = class(TFrame)
    ledPL: TLed;
    SpeedButton1: TSpeedButton;
    gbPRF_Rate: TGroupBox;
    led5: TLed;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    led4: TLed;
    SpeedButton7: TSpeedButton;
    led3: TLed;
    SpeedButton3: TSpeedButton;
    ledSimple: TLed;
    Panel1: TPanel;
    Panel2: TPanel;
    Label15: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    fSynchro : ISynchro;
    procedure SetSynchro( Value : ISynchro );
  public
    procedure UpdateView;
  published
    property Synchro : ISynchro read fSynchro write SetSynchro;
  end;

implementation

uses Shell_Client;

{$R *.DFM}

{ TFrame_Synchro }

procedure TFrame_Synchro.SetSynchro(Value: ISynchro);
begin
  fSynchro := Value;
  UpdateView;
end;

procedure TFrame_Synchro.UpdateView;
begin
  ledPL.State     := fSynchro.Pulse = tx_Pulse_Long;
  led5.State      := (fSynchro.Pulse = tx_Pulse_Short) and (fSynchro.PRF_Rate = tx_Dual_54);
  led4.State      := (fSynchro.Pulse = tx_Pulse_Short) and (fSynchro.PRF_Rate = tx_Dual_43);
  led3.State      := (fSynchro.Pulse = tx_Pulse_Short) and (fSynchro.PRF_Rate = tx_Dual_32);
  ledSimple.State := (fSynchro.Pulse = tx_Pulse_Short) and (fSynchro.PRF_Rate = tx_Dual_None);
end;

procedure TFrame_Synchro.SpeedButton1Click(Sender: TObject);
begin
  if assigned(Synchro)
    then Synchro.Set_Pulso_Largo;
  UpdateView;
end;

procedure TFrame_Synchro.SpeedButton3Click(Sender: TObject);
begin
  if assigned(Synchro)
    then Synchro.Set_Pulso_Corto(tx_Dual_None);
  UpdateView;
end;

procedure TFrame_Synchro.SpeedButton5Click(Sender: TObject);
begin
  if assigned(Synchro)
    then Synchro.Set_Pulso_Corto(tx_Dual_54);
  UpdateView;
end;

procedure TFrame_Synchro.SpeedButton6Click(Sender: TObject);
begin
  if assigned(Synchro)
    then Synchro.Set_Pulso_Corto(tx_Dual_43);
  UpdateView;
end;

procedure TFrame_Synchro.SpeedButton7Click(Sender: TObject);
begin
  if assigned(Synchro)
    then Synchro.Set_Pulso_Corto(tx_Dual_32);
  UpdateView;
end;

end.

