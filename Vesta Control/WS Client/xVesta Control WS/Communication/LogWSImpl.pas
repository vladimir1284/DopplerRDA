{ Invokable implementation File for TLogWS which implements ILogWS }

unit LogWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, LogWSIntf, CommunicationObj, LogTools, EventLog;

type

  { TLogWS }
  TLogWS = class(TCommObj, ILogWS)
  public
    function Get_MaxLogEntries: Integer; safecall;
    function LogMessageTitles: TWideStringDynArray; safecall;
    function LogMessage(MsgCode: Integer) : TLogEntry; safecall;

    function  GenerateLogName( LogMessage : TLogMessage ) : string;
  end;

implementation

uses Users, SysUtils;

{ TLogWS }
function TLogWS.GenerateLogName(LogMessage: TLogMessage): string;
begin
  if Assigned( LogMessage )
    then result := IntToStr( LogMessage.Code ) + ';' +
                   IntToStr( Ord(LogMessage.Category)) + ';' +
                   DateTimeToStr( LogMessage.DateTime ) + ';' +
                   LogMessage.CurrentUser + ';' +
                   LogMessage.Zone + ';' +
                   LogMessage.Title + ';'
    else result := '';
end;

function TLogWS.Get_MaxLogEntries: Integer;
begin
  result := MaxLogLines;
end;

function TLogWS.LogMessage(MsgCode: Integer): TLogEntry;
var
  LogMessage : TLogMessage;
begin
  result := TLogEntry.Create;
  result.MsgCode := MsgCode;
  LogMessage := LogMessages.LogMessages.Find( MsgCode );
  if Assigned( LogMessage )
    then
      begin
        result.DateTime := LogMessage.DateTime;
        result.Category := Ord( LogMessage.Category );
        result.Client := LogMessage.CurrentUser;
        result.Title := LogMessage.Title;
        result.Msg := LogMessage.LogMessage;
        result.Zone := LogMessage.Zone;
      end
    else
      begin
        result.DateTime := Now;
        result.Category := 0;
        result.Client := '';
        result.Title := '';
        result.Msg := '';
        result.Zone := '';
      end;
end;

function TLogWS.LogMessageTitles: TWideStringDynArray;
var
  i   : integer;
begin
  try
    SetLength(result, EventLog.LogMessages.Count);
    for I := 0 to EventLog.LogMessages.LogMessages.Count-1 do
      result[i] := GenerateLogName( EventLog.LogMessages.LogMessages[i] );
  except
  end;
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TLogWS);

end.
 