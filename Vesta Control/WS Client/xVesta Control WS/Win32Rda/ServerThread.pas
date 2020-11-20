unit ServerThread;

interface

uses
  IdTCPClient, IdTCPServer, Windows, Classes, Advantech;

const
  ThreadTimeOut = 10000;
  DisconnectCheckFrequency = 10000; //ms

type
  TRTServerThread =
    class( TIdPeerThread )
      private
        fReadIndex : word;
        fReadLap   : boolean;
      public
        constructor Create(ACreateSuspended: Boolean = True); override;
        procedure   SendCh1BeamData;
        procedure   SendCh2BeamData;
      protected
        procedure Run; override;
    end;

implementation

uses
  RTManager, Constants;

{ TRTServerThread }

constructor TRTServerThread.Create(ACreateSuspended: Boolean);
begin
  inherited Create( true );
  Priority := tpTimeCritical;
  if not ACreateSuspended
    then Resume;
end;

procedure TRTServerThread.Run;
var
  Starting,
  Finishing,
  Freq       : int64;
begin
  if RTEnabled
    then
      try
        QueryPerformanceFrequency(Freq);
        QueryPerformanceCounter(Starting);
        RTThread.AddReader;
        fReadIndex := RTThread.WriteIndex;
        fReadLap := RTThread.WriteLap;
        try
          //Inicio del protocolo
          while (not Terminated) and (RTEnabled) do
          begin
            while (RTEnabled) and (not Terminated) and
                  (((fReadLap = RTThread.WriteLap) and (fReadIndex<RTThread.WriteIndex)) or
                  ((fReadLap <> RTThread.WriteLap) and (fReadIndex>RTThread.WriteIndex))) do
              try
                //Envio los datos
                if RTThread.Ch1Enabled
                  then SendCh1BeamData;
                if RTThread.Ch2Enabled
                  then SendCh2BeamData;
                fReadIndex := (fReadIndex + 1) mod ChannelDataSize;
                if fReadIndex = 0
                  then fReadLap := not fReadLap;
                QueryPerformanceCounter(Finishing);
                if (Finishing-Starting)*1000/Freq >= DisconnectCheckFrequency
                  then
                    begin
                      Connection.CheckForDisconnect;
                      QueryPerformanceCounter(Starting);
                    end;
                Sleep( 10 );
              except
                Terminate;
              end;
            if not Terminated
              then
                begin
                  Connection.CheckForDisconnect;
                  if (((fReadLap = RTThread.WriteLap) and (fReadIndex>RTThread.WriteIndex)) or
                     ((fReadLap <> RTThread.WriteLap) and (fReadIndex<=RTThread.WriteIndex)))
                    then
                      begin
                        fReadIndex := RTThread.WriteIndex;
                        fReadLap   := RTThread.WriteLap;
                      end;
                  Sleep( 100 );
                end;
          end;
        finally
          if RTEnabled and Assigned( RTThread )
            then RTThread.RemoveReader;
          Terminate;
        end;
      except
      end;
end;

procedure TRTServerThread.SendCh1BeamData;
var
  Buff : TBeamDataRec;
begin
  Connection.WriteLn( Ch1BeamCommand );
  try
    ChannelData[1][ fReadIndex ].WR.BeginRead;
    try
      Buff.Az := ChannelData[1][ fReadIndex ].Az;
      Buff.El := ChannelData[1][ fReadIndex ].El;
      Buff.CellSize := ChannelData[1][ fReadIndex ].CellSize;
      Buff.PackSize := ChannelData[1][ fReadIndex ].PackSize;
      Buff.UnPackSize := ChannelData[1][ fReadIndex ].UnPackSize;
      GetMem( Buff.Data, Buff.PackSize );
      Move( ChannelData[1][ fReadIndex ].Data^, Buff.Data^, Buff.PackSize );
    finally
      ChannelData[1][ fReadIndex ].WR.EndRead;
    end;

    Connection.WriteInteger( Trunc(Buff.Az * 100) );
    Connection.WriteInteger( Trunc(Buff.El * 100) );
    Connection.WriteCardinal( Buff.CellSize );
    Connection.WriteInteger( Buff.PackSize );
    Connection.WriteInteger( Buff.UnPackSize );
    Connection.WriteBuffer( Buff.Data^, Buff.PackSize );
  finally
    if Assigned( Buff.Data )
      then FreeMem( Buff.Data );
  end;
end;

procedure TRTServerThread.SendCh2BeamData;
var
  Buff : TBeamDataRec;
begin
  Connection.WriteLn( Ch2BeamCommand );
  try
    ChannelData[2][ fReadIndex ].WR.BeginRead;
    try
      Buff.Az := ChannelData[2][ fReadIndex ].Az;
      Buff.El := ChannelData[2][ fReadIndex ].El;
      Buff.CellSize := ChannelData[2][ fReadIndex ].CellSize;
      Buff.PackSize := ChannelData[2][ fReadIndex ].PackSize;
      Buff.UnPackSize := ChannelData[2][ fReadIndex ].UnPackSize;
      GetMem( Buff.Data, Buff.PackSize );
      Move( ChannelData[2][ fReadIndex ].Data^, Buff.Data^, Buff.PackSize );
    finally
      ChannelData[2][ fReadIndex ].WR.EndRead;
    end;

    Connection.WriteInteger( Trunc(Buff.Az * 100) );
    Connection.WriteInteger( Trunc(Buff.El * 100) );
    Connection.WriteCardinal( Buff.CellSize );
    Connection.WriteInteger( Buff.PackSize );
    Connection.WriteInteger( Buff.UnPackSize );
    Connection.WriteBuffer( Buff.Data^, Buff.PackSize );
  finally
    if Assigned( Buff.Data )
      then FreeMem( Buff.Data );
  end;
end;

end.
