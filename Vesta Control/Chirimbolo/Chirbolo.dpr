program Chirbolo;
uses
  Forms,
  Dialogs,
  Windows,
  SysUtils,
  Shell_Chirbolo in 'Modules\Shell_Chirbolo.pas' {ShellChirimbolo},
  Deva in '..\General\Deva.pas',
  Constants in '..\General\Constants.pas',
  Parameters in '..\General\Parameters.pas',
  RDAReg in '..\Win32Rda\RDAReg.pas',
  ElbrusTypes in '..\General\ElbrusTypes.pas',
  Advantech in '..\Win32Rda\Advantech.pas',
  Config in '..\Win32Rda\Config.pas';

{$R *.RES}

var
  OnlyOneServer : THandle;

begin
  try
    OnlyOneServer := CreateMutex( nil, true, OnlyOneRdaServerName );
    if (OnlyOneServer = 0) or (GetLastError = ERROR_ALREADY_EXISTS)
      then raise Exception.Create( 'Ya esta ejecutandose un servidor RDA' );

    Application.Initialize;
    Application.Title := 'Chirimbolo';
    Application.CreateForm(TShellChirimbolo, ShellChirimbolo);
  Application.Run;
  except
    on E : Exception do
      ShowMessage( E.Message );
  end;
end.

