unit EditFTPSettings;

interface

uses
  SysUtils, Forms, StdCtrls, Controls, Classes;

type
  TFTPSettings = class(TForm)
    Label1: TLabel;
    FTPPassword: TEdit;
    Label2: TLabel;
    FTPPort: TEdit;
    Label3: TLabel;
    FTPUser: TEdit;
    Label4: TLabel;
    FTPHost: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ProxyHost: TEdit;
    ProxyPort: TEdit;
    ProxyUser: TEdit;
    ProxyPassword: TEdit;
    Button1: TButton;
    Button2: TButton;
    FTPFolder: TEdit;
    Label9: TLabel;
    UseProxy: TCheckBox;
    MakeDirs: TCheckBox;
  private
    { Private declarations }
  public
    procedure LoadCurrentSettings( Settings : string );
    function  GenerateSettings : string;
  end;

var
  FTPSettings: TFTPSettings;

implementation

uses Constants;

{$R *.dfm}

// Private procedures & functions

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

{ TFTPSettings }

function TFTPSettings.GenerateSettings: string;
var
  Settings : string;
begin
  Settings := FTPHost.Text + ',' +
              FTPPort.Text + ',' +
              FTPUser.Text + ',' +
              FTPPassword.Text + ',' +
              FTPFolder.Text + ',' +
              ProxyHost.Text + ',' +
              ProxyPort.Text + ',' +
              ProxyUser.Text + ',' +
              ProxyPassword.Text + ',' +
              IntToStr( Ord( UseProxy.Checked ) ) + ',' +
              IntToStr( Ord( MakeDirs.Checked ) );
  result := Encode( Settings );
end;

procedure TFTPSettings.LoadCurrentSettings(Settings: string);
var
  SettingList : TStrings;
begin
  SettingList := TStringList.Create;
  try
    try
      SettingList.CommaText := Decode( Settings );
      FTPHost.Text       := SettingList[ FTPHostIndex ];
      FTPPort.Text       := SettingList[ FTPPortIndex ];
      FTPUser.Text       := SettingList[ FTPUserIndex ];
      FTPPassword.Text   := SettingList[ FTPPasswordIndex ];
      FTPFolder.Text     := SettingList[ FTPFolderIndex ];
      ProxyHost.Text     := SettingList[ ProxyHostIndex ];
      ProxyPort.Text     := SettingList[ ProxyPortIndex ];
      ProxyUser.Text     := SettingList[ ProxyUserIndex ];
      ProxyPassword.Text := SettingList[ ProxyPasswordIndex ];
      UseProxy.Checked := SettingList[ UseProxyIndex ] = IntToStr( Ord( true ) );
      MakeDirs.Checked := SettingList[ MakeDirsIndex ] = IntToStr( Ord( true ) );
    except
      FTPHost.Text       := '127.0.0.1';
      FTPPort.Text       := '21';
      FTPUser.Text       := '';
      FTPPassword.Text   := '';
      FTPFolder.Text     := '';
      MakeDirs.Checked := false;
      UseProxy.Checked := false;
      ProxyHost.Text     := '';
      ProxyPort.Text     := '';
      ProxyUser.Text     := '';
      ProxyPassword.Text := '';
    end;
  finally
    SettingList.Free;
  end;
end;

end.
