unit FrameTxRxCalib;

interface

uses 
  FrameCalibration, ComCtrls, FrameTxRx, Forms, Controls, Classes,
  Menus, CommonObjs, InvokeRegistry, TxRxChWS, CalibrationWS;

type
  TFrame_TxRx_Calibration = class(TFrame)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Status: TFrame_TxRx;
    Calibration: TFrame_Calibration;
    procedure CalibrationButton1Click(Sender: TObject);
    procedure CalibrationButton2Click(Sender: TObject);
  private
    fPotMet : double;
    function GetUpdating: boolean;
  public
    procedure Init(TxRxChannel: ITxRxChWS; CalibrationChannel : ICalibrationWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read GetUpdating;
  published
    property PotMet : double read fPotMet;
  end;

implementation

{$R *.DFM}

{ TFrame_TxRx_Calibration }

procedure TFrame_TxRx_Calibration.UpdateView;
begin
  Status.UpdateView;

  if Status.TxRx.Tx_Pulso = tx_Pulse_Short
    then fPotMet := Calibration.Calibration.PotMetPC
    else fPotMet := Calibration.Calibration.PotMetPL;
end;

procedure TFrame_TxRx_Calibration.CalibrationButton1Click(Sender: TObject);
begin
  Calibration.Button1Click(Sender);
end;

procedure TFrame_TxRx_Calibration.CalibrationButton2Click(Sender: TObject);
begin
  Calibration.Button2Click(Sender);
end;

procedure TFrame_TxRx_Calibration.Init(TxRxChannel: ITxRxChWS; CalibrationChannel : ICalibrationWS; AuthHeader: TAuthHeader);
begin
  Enabled := assigned(TxRxChannel);
  Status.Init(TxRxChannel, AuthHeader);
  Calibration.Init(CalibrationChannel, TxRxChannel, AuthHeader);

  if Status.TxRx.Tx_Pulso = tx_Pulse_Short
    then fPotMet := Calibration.Calibration.PotMetPC
    else fPotMet := Calibration.Calibration.PotMetPL;
end;

function TFrame_TxRx_Calibration.GetUpdating: boolean;
begin
  result := Status.Updating or Calibration.Updating;
end;

end.

