unit FrameProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Rda_TLB;

type
  TFrame_ActionProgress = class(TFrame)
    Actions: TMemo;
  private
    fActionProgress : IActionProgress;
    procedure SetActionProgress( Value : IActionProgress );
  public
    procedure UpdateView;
  published
    property ActionProgress : IActionProgress read fActionProgress write SetActionProgress;
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TFrame_ActionProgress.SetActionProgress(Value: IActionProgress);
begin
  fActionProgress := Value;
  Actions.Lines.Clear;
  Actions.Lines.Delimiter := ';';
  UpdateView;
end;

procedure TFrame_ActionProgress.UpdateView;
begin
  Actions.Lines.Clear;
  if Assigned(ActionProgress)
    then Actions.Lines.DelimitedText := ActionProgress.Report;
end;

end.
