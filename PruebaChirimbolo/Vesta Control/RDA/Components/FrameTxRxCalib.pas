unit FrameTxRxCalib;

interface

uses 
  Rda_TLB, FrameCalibration, ComCtrls, FrameTx, Forms, Controls, Classes,
  Menus, FrameDRX, StdCtrls, ExtCtrls;

type
  TFrame_TxRx_Calibration = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel6: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    TabSheet3: TTabSheet;
    DRX: TFrame_DRX;
    Calibration: TFrame_Calibration;
    Tx: TFrame_Tx;
    procedure CalibrationButton1Click(Sender: TObject);
    procedure CalibrationButton2Click(Sender: TObject);
  private
    fPotMet : double;
    fTxRx   : ITxRxStatus;
    procedure SetTxRx( Value : ITxRxStatus );
  public
    procedure UpdateView;
  published
    property TxRx : ITxRxStatus read fTxRx write SetTxRx;
    property PotMet : double read fPotMet;
  end;

implementation

uses
  SysUtils;

{$R *.DFM}

{ TFrame_TxRx_Calibration }

procedure TFrame_TxRx_Calibration.SetTxRx(Value: ITxRxStatus);
begin
  fTxRx := Value;
  if assigned(fTxRx)
    then
      begin
        Enabled := true;
        PageControl1.Enabled := true;

        Label15.Caption := 'Canal ' + IntToStr(fTxRx.Numero);
        case fTxRx.Longitud_Onda of
          wl_3cm:  Label17.Caption := '(3cm)';
          wl_10cm: Label17.Caption := '(10cm)';
          else     Label17.Caption := '(-)';
        end;

        Tx.TxRx          := Value;
        DRX.TxRx         := Value;
        Calibration.TxRx := Value;
      end
    else
      begin
        Enabled := false;
        PageControl1.Enabled := false;

        Tx.TxRx          := nil;
        DRX.TxRx         := nil;
        Calibration.TxRx := nil;
      end;

  try
    if Assigned(fTxRx) and Assigned(Calibration.Calibration)
      then if fTxRx.Tx_Pulso = tx_Pulse_Short
             then fPotMet := Calibration.Calibration.PotMetPC
             else fPotMet := Calibration.Calibration.PotMetPL;
  except
    fPotMet := 0;
  end;
end;

procedure TFrame_TxRx_Calibration.UpdateView;
begin
  case PageControl1.ActivePageIndex of
    0: Tx.UpdateView;
    1: DRX.UpdateView;
    2: begin
         try
           Calibration.UpdateView;
           if Assigned(Calibration.Calibration)
             then if fTxRx.Tx_Pulso = tx_Pulse_Short
                    then fPotMet := Calibration.Calibration.PotMetPC
                    else if fTxRx.Tx_Pulso = tx_Pulse_Long
                           then fPotMet := Calibration.Calibration.PotMetPL
                           else fPotMet := 0;
         except
           fPotMet := 0;
         end;
       end;
  end;
end;

procedure TFrame_TxRx_Calibration.CalibrationButton1Click(Sender: TObject);
begin
  Calibration.Button1Click(Sender);
end;

procedure TFrame_TxRx_Calibration.CalibrationButton2Click(Sender: TObject);
begin
  Calibration.Button2Click(Sender);
end;

end.

