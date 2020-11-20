unit AboutDialog;

interface

uses
  Windows, SysUtils, Forms, Graphics,
  Classes, Controls, StdCtrls, ExtCtrls;

type
  TFAboutDialog = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  end;

implementation

{$R *.DFM}

uses
  VersionInfo;

// Component methods

procedure TFAboutDialog.FormCreate(Sender: TObject);
var
  Icon : TIcon;
begin
  Caption := Application.Title;
  Icon := TIcon.Create;
  Icon.Handle := LoadIcon(HInstance, 'MAINICON');
  Image1.Picture.Icon := Icon;
  Label1.Caption := GetVersionString(vs_CompanyName);
  Label2.Caption := GetVersionString(vs_ProductName) +
                    ' - ' + GetVersionString(vs_FileDescription) +
                    ' [' + GetVersionString(vs_FileVersion) + ']';
  Label3.Caption := GetVersionString(vs_LegalCopyright) +
                    FormatDateTime(' (ddddd t)', FileDateToDateTime(FileAge(ParamStr(0))));
  Label4.Caption := GetVersionString(vs_LegalTrademarks);
end;

end.

