unit MotorCalib;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls;

type
  TMotorCalib_Dialog = class(TForm)
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MotorCalib_Dialog: TMotorCalib_Dialog;

implementation

{$R *.DFM}

end.
