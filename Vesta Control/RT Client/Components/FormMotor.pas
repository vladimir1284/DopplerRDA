unit FormMotor;

interface

uses
  Forms, FrameRTMotor, ExtCtrls, Controls, Classes;

type
  TMotors = class(TForm)
    Splitter1: TSplitter;
    AZMotor: TFrame_RTMotor;
    ElMotor: TFrame_RTMotor;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Motors: TMotors;

implementation

uses
  Shell_RTClient;

{$R *.dfm}

procedure TMotors.FormCreate(Sender: TObject);
begin
  Width := 500;
  Height := 330;
  AZMotor.UpdateView;
  ElMotor.UpdateView;
end;

procedure TMotors.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ShellRTClient.Antena.Checked := false;
  AZMotor.Motor := nil;
  ElMotor.Motor := nil;
  Motors := nil;
end;

end.