unit FrameRTControl;

interface

uses
  Forms, Rda_TLB, StdCtrls, Onoff, Controls, Classes;

type
  TFrame_RTControl = class(TFrame)
    Button1: TButton;
    Bulb1: TBulb;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    fLogin  : ILogin;
    procedure SetLogin( Value : ILogin );
  public
    procedure UpdateView;
  published
    property Login : ILogin read fLogin write SetLogin;
  end;

implementation

{$R *.DFM}

{ TFrame_Control }

procedure TFrame_RTControl.SetLogin(Value: ILogin);
begin
  fLogin := Value;
  Button1Click(Button1);
end;

procedure TFrame_RTControl.UpdateView;
begin
  if assigned(fLogin)
    then
      with fLogin do
        begin
          Button1.Enabled := fLogin.Level >= fLogin.ControllerLevel;
          Edit1.Text := ControllerName;
          Bulb1.State := InControl;
        end;
end;

procedure TFrame_RTControl.Button1Click(Sender: TObject);
begin
  if assigned(fLogin)
    then
      if Bulb1.State
        then fLogin.ReleaseControl
        else fLogin.TakeControl;
end;

end.

