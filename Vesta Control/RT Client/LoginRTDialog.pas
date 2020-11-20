unit LoginRTDialog;

interface

uses
  Windows,
  SysUtils, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFLogin = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  end;

var
  FLogin: TFLogin;

const
  ClientRootKey = {HKEY_CURRENT_USER} '\SOFTWARE\LDT\Vesta\RTClient';
  LoginKey = ClientRootKey + '\Login';

const
  HostNameValue = 'HostName';
  UserNameValue = 'UserName';
  PasswordValue = 'Password';
  AutoLogValue  = 'AutoLog';

implementation

{$R *.DFM}

uses
  Registry;

function Encode( S : string ) : string;
var
  I : integer;
begin
  SetLength(Result, Length(S));
  for I := 1 to Length(Result) do
    Result[I] := succ(S[I]);
end;

function Decode( S : string ) : string;
var
  I : integer;
begin
  SetLength(Result, Length(S));
  for I := 1 to Length(Result) do
    Result[I] := pred(S[I]);
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  with TRegistry.Create do
    try
      if OpenKey(LoginKey, false)
        then
          begin
            if ValueExists(HostNameValue)
              then Edit1.Text := ReadString(HostNameValue);
            if ValueExists(UserNameValue)
              then Edit2.Text := ReadString(UserNameValue);
            if ValueExists(PasswordValue)
              then Edit3.Text := Decode( ReadString(PasswordValue) );
            CheckBox1.Checked := ValueExists(PasswordValue);
          end;
    finally
      Free;
    end;
  if Edit1.Text = ''
    then ActiveControl := Edit1
    else
      if Edit2.Text = ''
        then ActiveControl := Edit2
        else ActiveControl := Edit3;
end;

procedure TFLogin.FormDestroy(Sender: TObject);
begin
  with TRegistry.Create do
    try
      if OpenKey(LoginKey, true)
        then
          begin
            WriteString(HostNameValue, Edit1.Text);
            WriteString(UserNameValue, Edit2.Text);
            if CheckBox1.Checked
              then WriteString(PasswordValue, Encode( Edit3.Text ) )
              else DeleteValue(PasswordValue);
          end;
    finally
      Free;
    end;
end;

end.

