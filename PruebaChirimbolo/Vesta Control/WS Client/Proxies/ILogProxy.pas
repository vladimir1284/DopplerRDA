// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/ILogWS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:46:38 AM - 1.33.2.5)
// ************************************************************************ //

unit ILogProxy;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:TWideStringDynArray - "http://www.borland.com/namespaces/Types"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  TLogEntry            = class;                 { "urn:CommunicationObj" }



  // ************************************************************************ //
  // Namespace : urn:CommunicationObj
  // ************************************************************************ //
  TLogEntry = class(TRemotable)
  private
    FMsgCode: Integer;
    FDateTime: TXSDateTime;
    FCategory: Integer;
    FClient: WideString;
    FTitle: WideString;
    FMsg: WideString;
    FZone: WideString;
  public
    destructor Destroy; override;
  published
    property MsgCode: Integer read FMsgCode write FMsgCode;
    property DateTime: TXSDateTime read FDateTime write FDateTime;
    property Category: Integer read FCategory write FCategory;
    property Client: WideString read FClient write FClient;
    property Title: WideString read FTitle write FTitle;
    property Msg: WideString read FMsg write FMsg;
    property Zone: WideString read FZone write FZone;
  end;


  // ************************************************************************ //
  // Namespace : urn:LogWSIntf-ILogWS
  // soapAction: urn:LogWSIntf-ILogWS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ILogWSbinding
  // service   : ILogWSservice
  // port      : ILogWSPort
  // URL       : http://localhost:8888/soap/ILogWS
  // ************************************************************************ //
  ILogWS = interface(IInvokable)
  ['{42593513-52ED-91CB-7A96-6A959CD2D821}']
    function  Get_MaxLogEntries: Integer; stdcall;
    function  LogMessageTitles: TWideStringDynArray; stdcall;
    function  LogMessage(const MsgCode: Integer): TLogEntry; stdcall;
  end;

function GetILogWS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ILogWS;


implementation

function GetILogWS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ILogWS;
const
  defWSDL = 'http://localhost:8888/wsdl/ILogWS';
  defURL  = 'http://localhost:8888/soap/ILogWS';
  defSvc  = 'ILogWSservice';
  defPrt  = 'ILogWSPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ILogWS);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor TLogEntry.Destroy;
begin
  if Assigned(FDateTime) then
    FDateTime.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ILogWS), 'urn:LogWSIntf-ILogWS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ILogWS), 'urn:LogWSIntf-ILogWS#%operationName%');
  RemClassRegistry.RegisterXSClass(TLogEntry, 'urn:CommunicationObj', 'TLogEntry');

end.