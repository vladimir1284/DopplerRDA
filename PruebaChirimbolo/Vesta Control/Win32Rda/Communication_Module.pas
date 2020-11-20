{ SOAP Web Module - WAD }
unit Communication_Module;

interface

uses
  SysUtils, Classes, HTTPApp, InvokeRegistry, WSDLIntf, TypInfo,
  WebServExp, WSDLBind, XMLSchema, WSDLPub, SOAPPasInv, SOAPHTTPPasInv,
  SOAPHTTPDisp, WebBrokerSOAP, IdFTP, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent, IdMessage;

const
  MaxConnectionError = 'Muchos usuarios conectados, espere a que alguno se desconecte';

type
  TCommunicationModule = class(TWebModule)
    HTTPSoapDispatcher1: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker1: THTTPSoapPascalInvoker;
    WSDLHTMLPublish1: TWSDLHTMLPublish;
    EMailMessage: TIdMessage;
    SMTPServer: TIdSMTP;
    FTP: TIdFTP;
    procedure WebModule2DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CommunicationModule: TCommunicationModule;

implementation

uses WebReq;

{$R *.dfm}

procedure TCommunicationModule.WebModule2DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WSDLHTMLPublish1.ServiceInfo(Sender, Request, Response, Handled);
end;

initialization
    if WebRequestHandler <> nil then
      WebRequestHandler.WebModuleClass := TCommunicationModule;

end.
