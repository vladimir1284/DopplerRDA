unit Shell_Rda;

interface

uses
  Windows, Messages, SysUtils, Forms,
  ExtCtrls, ImgList, Menus, StdCtrls, Controls, Classes, Advantech,
  AppEvnts, IdHTTPWebBrokerBridge, InvokeRegistry, IdBaseComponent,
  IdComponent, IdTCPServer;

type
  TShellRDA = class(TForm)
    MainMenu1: TMainMenu;
    RDA1: TMenuItem;
    Creditos1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ImageList2: TImageList;
    Timer1: TTimer;
    lDRX1: TLabel;
    lDRX2: TLabel;
    IdTCPServer1: TIdTCPServer;
    procedure FormCreate(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  public
    procedure AppException(Sender: TObject; E: Exception);
  private
    FWebBrokerBridge: TIdHTTPWebBrokerBridge;
  end;

var
  ShellRDA: TShellRDA;

implementation

{$R *.DFM}

uses
  Statistics,
  AboutDialog, EventLog, Users, LogTools, Communication_Module, Constants,
  ManagerDRX, Graphics, Config;

procedure TShellRDA.FormCreate(Sender: TObject);
begin
  Application.OnException := AppException;

  // Create server.
  FWebBrokerBridge := TIdHTTPWebBrokerBridge.Create(Self);
  // Register web module class.
  FWebBrokerBridge.RegisterWebModuleClass(TCommunicationModule);

  // Set default port.
  FWebBrokerBridge.DefaultPort := theConfiguration.WS_Port;

  // Start server.
  FWebBrokerBridge.Active := True;
  Timer1Timer(nil);  
end;

procedure TShellRDA.Creditos1Click(Sender: TObject);
begin
  with TFAboutDialog.Create(Self) do
    try
      ShowModal;
    finally
      Release;
    end;
end;

procedure TShellRDA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Hide;
  Action := caFree;

  // Stop server.
  FWebBrokerBridge.Active := False;
  // Free server component.
  FreeAndNil(FWebBrokerBridge);
end;

procedure TShellRDA.AppException(Sender: TObject; E: Exception);
begin
  LogMessages.AddLogRawMessage( Now, lcError, GetController, 'General', 'Error no resuelto', E.Message );
end;

procedure TShellRDA.Timer1Timer(Sender: TObject);
begin
  lDRX1.Enabled := DRX1.Ready;
  lDRX2.Enabled := DRX2.Ready;
end;

end.

