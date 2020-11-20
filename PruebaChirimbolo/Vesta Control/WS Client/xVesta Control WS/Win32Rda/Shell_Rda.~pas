unit Shell_Rda;

interface

uses
  Windows, Messages, SysUtils, Forms,
  ExtCtrls, ImgList, Menus, StdCtrls, Controls, Classes, Advantech,
  AppEvnts, IdHTTPWebBrokerBridge, IdTCPServer, TxRxWS, CyclopWS, InvokeRegistry, CommunicationObj;

type
  TShellRDA = class(TForm)
    MainMenu1: TMainMenu;
    RDA1: TMenuItem;
    Creditos1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ImageList2: TImageList;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  public
    procedure AppException(Sender: TObject; E: Exception);
  private
    FWebBrokerBridge: TIdHTTPWebBrokerBridge;
    CyclopAuthHeader : TCyclopAuthHeader;
    fCyclopWS : ICyclopWS;
    fTxRxWS : ITxRxWS;

    procedure OnConnectWS(AThread: TIdPeerThread);
  end;

var
  ShellRDA: TShellRDA;

implementation

{$R *.DFM}

uses
  AboutDialog, EventLog, Users, LogTools, Communication_Module;

procedure TShellRDA.FormCreate(Sender: TObject);
begin
  Application.OnException := AppException;

  // Create server.
  FWebBrokerBridge := TIdHTTPWebBrokerBridge.Create(Self);
  // Register web module class.
  FWebBrokerBridge.RegisterWebModuleClass(TCommunicationModule);
  // Set default port.
  FWebBrokerBridge.DefaultPort := 9999;

	FWebBrokerBridge.KeepAlive := true;
	FWebBrokerBridge.AutoStartSession := true;

  FWebBrokerBridge.OnConnect := OnConnectWS;

  // Start server.
  FWebBrokerBridge.Active := True;
end;

procedure TShellRDA.Button1Click(Sender: TObject);
var
  urlWS : string;
  Headers : ISOAPHeaders;
begin
  urlWS := 'http://localhost:49000/soap/ICyclopWS';
  fCyclopWS := GetICyclopWS(false, urlWS, nil);

  try
  if fCyclopWS.Login('control', 'txrx')
    then
      begin
        Headers := fCyclopWS as ISOAPHeaders;
        Headers.Get(TCyclopAuthHeader, TSoapHeader(CyclopAuthHeader));

        urlWS := 'http://localhost:49000/soap/ITxRxWS';
        fTxRxWS := GetITxRxWS(false, urlWS, nil);
      end;
  except
    fCyclopWS := nil;
    Headers := nil;
    CyclopAuthHeader := nil;
  end;
end;

procedure TShellRDA.Button2Click(Sender: TObject);
begin
  fTxRxWS.Set_Pulso_Largo;
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

procedure TShellRDA.OnConnectWS(AThread: TIdPeerThread);
begin
  AThread.Connection.Socket.UseNagle := false;
end;

procedure TShellRDA.Button3Click(Sender: TObject);
begin
  fTxRxWS.Set_Pulso_Corto;
end;

end.

