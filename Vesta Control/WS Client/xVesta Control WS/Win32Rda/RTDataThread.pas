unit RTDataThread;

//{$DEFINE RealTimeData}
{$UNDEF RealTimeData}

interface

uses
  IdTCPServer, Classes;

type
  TRTDataThread =
    class( TIdPeerThread )
      public
        constructor Create(ACreateSuspended: Boolean = True); override;
        destructor  Destroy; override;

        procedure SendPulse;
        procedure SendFreqAD;
        procedure SendTriggerRate;
      protected
        procedure Run; override;
    end;

var
  RTData : TRTDataThread;

implementation

uses
  Elbrus, Deva, Constants, SysUtils, IdThread, Windows;

const
  SlowDataTime = 15 * 1000;

{ TRTDataThread }

procedure TRTDataThread.SendFreqAD;
begin
  Connection.WriteLn( FreqADCmd + IntToStr( Snapshot.Sample_Rate ) );
end;

procedure TRTDataThread.Run;
begin
{$IFDEF RealTimeData}
  SendFreqAD;
  SendTriggerRate;
  SendPulse;
  while not Terminated do
  try
    Sleep( SlowDataTime );
    Connection.CheckForDisconnect;
    SendFreqAD;
    SendTriggerRate;
    SendPulse;
  except
    RTData := nil;
    Terminate;
  end;
{$ELSE}
  Terminate;
{$ENDIF}
end;

procedure TRTDataThread.SendPulse;
begin
  Connection.WriteLn( PulseCmd + IntToStr( Snapshot.Pulse ) );
end;

constructor TRTDataThread.Create( ACreateSuspended : Boolean );
begin
  inherited Create( true );
  RTData := self;
  Priority := tpNormal;
  FreeOnTerminate := true;
  if not ACreateSuspended
    then Resume;
end;

destructor TRTDataThread.Destroy;
begin
  RTData := nil;
  inherited;
end;

procedure TRTDataThread.SendTriggerRate;
begin
  Connection.WriteLn( TriggerRateCmd + IntToStr( Snapshot.Trigger_Rate ) );
end;

end.
