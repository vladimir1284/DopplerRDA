unit DataExchange;

interface

uses
  IdTCPClient, IdTCPServer, Windows, Classes;

type
  TDataSender =
    class(TIdPeerThread)
      private
        { Private declarations }
      protected
        procedure Run; override;
      public
        constructor Create(ACreateSuspended: Boolean = True); override;
      public

    end;

implementation

uses Constants;

{ TDataExcanhe }

constructor TDataSender.Create(ACreateSuspended: Boolean);
begin
  inherited Create( true );
  Priority := tpHigher;

  if not ACreateSuspended
    then Resume;
end;

procedure TDataSender.Run;
var
  Command : string;
begin
  while (not Terminated) do
  begin
    Command := Connection.ReadLn( '', deClientCommandTimeOut);


    if Command = ''
      then
        try
          Connection.CheckForDisconnect;
          Sleep(1000);
        except
          Terminate;
        end;
  end;
end;

end.
