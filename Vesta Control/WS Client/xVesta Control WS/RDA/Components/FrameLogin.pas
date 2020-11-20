unit FrameLogin;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Onoff, ExtCtrls, Rda_TLB;

type
  TFrame_Login = class(TFrame)
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Bulb1: TBulb;
    Label2: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    fOnLogin           : TNotifyEvent;
    fOnLogout          : TNotifyEvent;
    fOnControlTaken    : TNotifyEvent;
    fOnControlReleased : TNotifyEvent;
  published
    property OnLogin           : TNotifyEvent read fOnLogin           write fOnLogin;
    property OnLogout          : TNotifyEvent read fOnLogout          write fOnLogout;
    property OnControlTaken    : TNotifyEvent read fOnControlTaken    write fOnControlTaken;
    property OnControlReleased : TNotifyEvent read fOnControlReleased write fOnControlReleased;
  private
    fLogin  : ILogin;
    fLogged : boolean;
    procedure SetLogin( Value : ILogin );
  public
    procedure UpdateView;
  published
    property Login : ILogin read fLogin write SetLogin;
  end;

implementation

{$R *.DFM}

{ TFrame_Login }

procedure TFrame_Login.SetLogin(Value: ILogin);
begin
  fLogin := Value;
  Edit1.Enabled   := assigned(fLogin);
  Edit2.Enabled   := assigned(fLogin);
  Edit3.Enabled   := assigned(fLogin);
  Button1.Enabled := assigned(fLogin);
  Button1Click(Button1);  //???
end;

procedure TFrame_Login.UpdateView;
const
  B1Capt : array[boolean] of string = ('Login', 'Logout');
  B2Capt : array[boolean] of string = ('Tomar Control', 'Liberar Control');
begin
  if assigned(fLogin)
    then Edit1.Text := fLogin.ControllerName;
  Bulb1.State := fLogged and (Edit1.Text <> '') and
                 (CompareText(Edit1.Text, Edit2.Text) = 0);
  Button1.Caption := B1Capt[fLogged];
  Button2.Caption := B2Capt[Bulb1.State];
end;

procedure TFrame_Login.Button1Click(Sender: TObject);
begin
  if not fLogged
    then fLogged := fLogin.Login(Edit2.Text, Edit3.Text) = S_OK
    else
      begin
        fLogin.Logout;
        fLogged := false;
      end;
  Edit2.ReadOnly := fLogged;
  Edit3.ReadOnly := fLogged;
  Button2.Enabled := fLogged;
  UpdateView;
  if fLogged and assigned(fOnLogin)
    then fOnLogin(Self);
  if not fLogged and assigned(fOnLogout)
    then fOnLogout(Self);
end;

procedure TFrame_Login.Button2Click(Sender: TObject);
begin
  if not Bulb1.State  // InControl
    then fLogin.TakeControl
    else fLogin.ReleaseControl;
  UpdateView;
end;

end.

