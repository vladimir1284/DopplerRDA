unit RTPaintBeams;

interface

uses
  Classes, RTDisplay, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

const
  ClientRefreshFrequency = 50;

type
  TRTPaintBeams = class(TThread)
  private
    RTClient : TIdTCPClient;
    BeamData : PBytes;
    RawCellSize,
    RawCellCount : cardinal;
    Az, El       : single;
  protected
    procedure ReceiveCh1BeamData;
    procedure ReceiveCh2BeamData;
    procedure ProcessAllAppMessages;
    procedure AddCh1Beam;
    procedure AddCh2Beam;
    procedure ClearBeam;
    procedure RefreshRadarData;
    procedure RefreshRTData;

    procedure Execute; override;
  public
    constructor Create(CreateSuspended : Boolean);
    destructor  Destroy; override;
  end;

implementation

uses
  Windows, SysUtils, Registry, ZLibEx,
  Constants, Shell_RTClient;

{ TPaintBeams }

procedure TRTPaintBeams.AddCh1Beam;
begin
  if Assigned( ShellRTClient.RT_Ch1 )
    then
      begin
        if ShellRTClient.RT_Ch1.RTDisplay.PPI_RHI
          then ShellRTClient.RT_Ch1.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData )
          else ShellRTClient.RT_Ch1.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData );
        ShellRTClient.RT_Ch1.RTCh2.Checked := true;
        ShellRTClient.RT_Ch1.Azimuth       := Az;
        ShellRTClient.RT_Ch1.Elevation     := El;
      end;
end;

procedure TRTPaintBeams.AddCh2Beam;
begin
  if Assigned( ShellRTClient.RT_Ch2 )
    then
      begin
        if ShellRTClient.RT_Ch2.RTDisplay.PPI_RHI
          then ShellRTClient.RT_Ch2.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData )
          else ShellRTClient.RT_Ch2.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData );
        ShellRTClient.RT_Ch2.RTCh2.Checked := true;
        ShellRTClient.RT_Ch2.Azimuth       := Az;
        ShellRTClient.RT_Ch2.Elevation     := El;
      end;
end;

procedure TRTPaintBeams.ClearBeam;
begin
  if Assigned( ShellRTClient.RT_Ch1 )
    then ShellRTClient.RT_Ch1.RTDisplay.ClearBeams;
  if Assigned( ShellRTClient.RT_Ch2 )
    then ShellRTClient.RT_Ch2.RTDisplay.ClearBeams;
end;

constructor TRTPaintBeams.Create(CreateSuspended : Boolean );
begin
  inherited Create( True );
  FreeOnTerminate := true;
  Priority := tpTimeCritical;
  RTClient := TIdTCPClient.Create( nil );
  RTClient.Port := ShellRTClient.GeneralConfiguration.RTPort;
  with TRegistry.Create do
    try
      if OpenKey(LoginKey, false) and ValueExists(HostNameValue)
        then RTClient.Host := ReadString(HostNameValue)
        else RTClient.Host := '127.0.0.1';
    finally
      Free;
    end;

  if not CreateSuspended
    then Resume;
end;

destructor TRTPaintBeams.Destroy;
begin
  RTClient.Free;
  inherited;
end;

procedure TRTPaintBeams.Execute;
var
  Command    : string;
  Starting,
  Finishing,
  Freq       : int64;
  SaveTimerEnabled : boolean;
  FormCaption : string;
begin
  SaveTimerEnabled := ShellRTClient.Timer1.Enabled;
  ShellRTClient.Timer1.Enabled := false;
  ShellRTClient.Caption := ShellRTClient.Caption + DisconnectError;
  ShellRTClient.Refrescar.Checked := false;
  ShellRTClient.FasterTime := RTFasterTime;
  ShellRTClient.FastTime   := RTFastTime;
  ShellRTClient.MedTime    := RTMedTime;
  ShellRTClient.SlowTime   := RTSlowTime;
  try
    QueryPerformanceFrequency(Freq);
    Synchronize( ClearBeam );
    try
      RTClient.Connect( MaxTimeServerConnect );
      try
        ShellRTClient.Acquiring := true;
        Synchronize( RefreshRTData );
        QueryPerformanceCounter( Starting );
        while (not Terminated) and ShellRTClient.Acquiring do
        begin
          Command := RTClient.ReadLn( '', ClientCommandTimeOut );
          if Command = Ch1BeamCommand
            then ReceiveCh1BeamData;
          if Command = Ch2BeamCommand
            then ReceiveCh2BeamData;
          if Command = ''
            then
              try
                Synchronize( ProcessAllAppMessages );
                RTClient.CheckForDisconnect;
                Sleep( 100 );
              except
                Terminate;
              end;
          QueryPerformanceCounter(Finishing);
          if (Finishing-Starting)*1000/Freq >= ClientRefreshFrequency
            then
              begin
                Synchronize( ProcessAllAppMessages );
                Synchronize( RefreshRadarData );
                QueryPerformanceCounter(Starting);
              end;
          Sleep( 10 );    
        end;
      finally
        RTClient.Disconnect;
      end;
    except
    end;
  finally
    ShellRTClient.Acquiring  := false;
    ShellRTClient.FasterTime := DefaultFasterTime;
    ShellRTClient.FastTime   := DefaultFastTime;
    ShellRTClient.MedTime    := DefaultMedTime;
    ShellRTClient.SlowTime   := DefaultSlowTime;
    if SaveTimerEnabled and (Pos(DisconnectError, ShellRTClient.Caption) > 0)
      then
        begin
          FormCaption := ShellRTClient.Caption;
          Delete( FormCaption, Pos(DisconnectError, ShellRTClient.Caption), Length(DisconnectError) );
          ShellRTClient.Caption := FormCaption;
        end;
    ShellRTClient.Timer1.Enabled := SaveTimerEnabled;
    ShellRTClient.Refrescar.Checked := SaveTimerEnabled;
  end;
end;

procedure TRTPaintBeams.ProcessAllAppMessages;
begin
  ShellRTClient.ProcessAllMessages;
end;

procedure TRTPaintBeams.ReceiveCh1BeamData;
var
  PackSize,
  UnPackSize : word;
  OutSize : integer;
  Buffer : PBytes;
  BeamBuffer : pointer;
begin
  //Receive data
  Buffer := nil;
  ShellRTClient.ViewCh1 := true;
  try
    Az := RTClient.ReadInteger / 100;
    El := RTClient.ReadInteger / 100;
    RawCellSize   := RTClient.ReadCardinal;
    PackSize   := RTClient.ReadInteger;
    UnPackSize := RTClient.ReadInteger;
    RawCellCount := UnPackSize;
    GetMem( Buffer, PackSize );
    RTClient.ReadBuffer( Buffer^, PackSize );

    ZDecompress( Buffer, PackSize, BeamBuffer, OutSize );

    BeamData := BeamBuffer;
    if UnPackSize = OutSize
      then Synchronize( AddCh1Beam );
  finally
    FreeMem( Buffer );
    if Assigned( BeamData )
      then FreeMem( BeamData );
  end;
end;

procedure TRTPaintBeams.ReceiveCh2BeamData;
var
  PackSize,
  UnPackSize : word;
  OutSize : integer;
  Buffer : PBytes;
  BeamBuffer : pointer;
begin
  //Receive data
  Buffer := nil;
  ShellRTClient.ViewCh2 := true;
  try
    Az := RTClient.ReadInteger / 100;
    El := RTClient.ReadInteger / 100;
    RawCellSize   := RTClient.ReadCardinal;
    PackSize   := RTClient.ReadInteger;
    UnPackSize := RTClient.ReadInteger;
    RawCellCount := UnPackSize;
    GetMem( Buffer, PackSize );
    RTClient.ReadBuffer( Buffer^, PackSize );

    ZDecompress( Buffer, PackSize, BeamBuffer, OutSize );

    BeamData := BeamBuffer;
    if UnPackSize = OutSize
      then Synchronize( AddCh2Beam );
  finally
    FreeMem( Buffer );
    if Assigned( BeamData )
      then FreeMem( BeamData );
  end;
end;

procedure TRTPaintBeams.RefreshRadarData;
begin
  if ShellRTClient.Timer1.Enabled
    then ShellRTClient.Timer1Timer( nil );
end;

procedure TRTPaintBeams.RefreshRTData;
begin
  if Assigned( ShellRTClient.RT_Ch1 ) and ShellRTClient.ViewCh1
    then ShellRTClient.RT_Ch1.UpdateView;
  if Assigned( ShellRTClient.RT_Ch2 ) and ShellRTClient.ViewCh2
    then ShellRTClient.RT_Ch2.UpdateView;
end;

end.
