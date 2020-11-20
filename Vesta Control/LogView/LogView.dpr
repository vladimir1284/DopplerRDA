program LogView;

uses
  Forms,
  View in 'View.pas' {Form3},
  LogBoard in '..\RDA\Components\LogBoard.pas' {LogScreen},
  LogTools in '..\Win32Rda\LogTools.pas',
  AboutDialog in '..\General\AboutDialog.pas' {FAboutDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
