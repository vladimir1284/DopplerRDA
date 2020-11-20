unit LogWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  ILogWS = interface(IInvokable)
  ['{C615C512-39F3-4624-9998-CD947ABF9877}']
    function Get_MaxLogEntries: Integer; safecall;
    function LogMessageTitles: TWideStringDynArray; safecall;
    function LogMessage(MsgCode: Integer) : TLogEntry; safecall;

    property MaxLogEntries: Integer read Get_MaxLogEntries;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(ILogWS));

end.
 