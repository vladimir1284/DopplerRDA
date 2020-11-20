unit TxRxForm;

interface

uses
  Forms, ComCtrls, Classes, Controls, FrameCalibration;

type
  TTxRxs_Form = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TxRx1: TFrame_Calibration;
    TxRx2: TFrame_Calibration;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TxRxs_Form: TTxRxs_Form;

implementation

uses
  Shell_RTClient;

{$R *.dfm}

procedure TTxRxs_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ShellRTClient.TxRx.Checked := false;
  TxRxs_Form := nil;
end;

procedure TTxRxs_Form.FormCreate(Sender: TObject);
begin
  Width := 250;
  Height := 330;
  TxRx1.Button2Click( nil );
  TxRx2.Button2Click( nil );
end;

procedure TTxRxs_Form.FormActivate(Sender: TObject);
begin
  TxRx1.Button2Click( nil );
  TxRx2.Button2Click( nil );
end;

end.
