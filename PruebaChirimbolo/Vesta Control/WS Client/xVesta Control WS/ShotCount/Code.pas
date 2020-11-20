unit Code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    LabeledEdit1: TLabeledEdit;
    N1: TUpDown;
    Degree: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Speed: TUpDown;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Shots : word;
begin
  Shots := Trunc((60000*StrToFloat(Degree.Text))/(N1.Position*360*Speed.Position));
  Label1.Caption := IntToStr( Shots ) + ' rayos';
end;

end.
