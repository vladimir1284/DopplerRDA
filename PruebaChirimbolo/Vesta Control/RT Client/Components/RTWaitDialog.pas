unit RTWaitDialog;

interface

uses
  SysUtils, Classes, Forms, Dialogs, StdCtrls, Controls;

type
  TFWait = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;

var
  FWait: TFWait;

implementation

{$R *.DFM}

procedure TFWait.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

