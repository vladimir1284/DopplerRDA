unit PaintBeams;

interface

uses
  Classes, RTDisplay, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient;

const
  ClientRefreshFrequency = 50;

type
  TPaintBeams = class(TThread)
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

uses Windows, SysUtils, Shell_Client, LoginDialog, Registry, ZLibEx,
     Constants, Math;

{ TPaintBeams }

procedure TPaintBeams.AddCh1Beam;
begin
  if ShellClient.RT_Ch1.RTDisplay.PPI_RHI
    then ShellClient.RT_Ch1.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData )
    else ShellClient.RT_Ch1.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData );
  ShellClient.RT_Ch1.RTCh1.Checked := true;
  ShellClient.RT_Ch1.Azimuth       := Az;
  ShellClient.RT_Ch1.Elevation     := El;
end;

procedure TPaintBeams.AddCh2Beam;
begin
  if ShellClient.RT_Ch2.RTDisplay.PPI_RHI
    then ShellClient.RT_Ch2.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData )
    else ShellClient.RT_Ch2.RTDisplay.AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, BeamData );
  ShellClient.RT_Ch2.RTCh2.Checked := true;
  ShellClient.RT_Ch2.Azimuth       := Az;
  ShellClient.RT_Ch2.Elevation     := El;
end;

procedure TPaintBeams.ClearBeam;
begin
  ShellClient.RT_Ch1.RTDisplay.ClearBeams;
  ShellClient.RT_Ch2.RTDisplay.ClearBeams;
end;

constructor TPaintBeams.Create(CreateSuspended : Boolean );
begin
  inherited Create( True );
  FreeOnTerminate := true;
  Priority := tpTimeCritical;
  RTClient := TIdTCPClient.Create( nil );
  RTClient.Port := ShellClient.Configuration.Configuration.RTPort;
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

destructor TPaintBeams.Destroy;
begin
  RTClient.Free;
  inherited;
end;

procedure TPaintBeams.Execute;
var
  Command    : string;
  Starting,
  Finishing,
  Freq       : int64;
  SaveTimerEnabled : boolean;
  FormCaption : string;
begin
  SaveTimerEnabled := ShellClient.Timer1.Enabled;
  ShellClient.Timer1.Enabled := false;
  ShellClient.Caption := ShellClient.Caption + DisconnectError;
  ShellClient.Refrescar1.Checked := false;
  ShellClient.FasterTime := RTFasterTime;
  ShellClient.FastTime   := RTFastTime;
  ShellClient.MedTime    := RTMedTime;
  ShellClient.SlowTime   := RTSlowTime;
  try
    QueryPerformanceFrequency(Freq);
    Synchronize( ClearBeam );
    try
      RTClient.Connect( MaxTimeServerConnect );
      try
        ShellClient.Acquiring := true;
        Synchronize( RefreshRTData );
        QueryPerformanceCounter( Starting );
        while (not Terminated) and ShellClient.Acquiring do
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
    ShellClient.Acquiring      := false;
    ShellClient.FasterTime     := DefaultFasterTime;
    ShellClient.FastTime       := DefaultFastTime;
    ShellClient.MedTime        := DefaultMedTime;
    ShellClient.SlowTime       := DefaultSlowTime;
    if SaveTimerEnabled and (Pos(DisconnectError, ShellClient.Caption) > 0)
      then
        begin
          FormCaption := ShellClient.Caption;
          Delete( FormCaption, Pos(DisconnectError, ShellClient.Caption), Length(DisconnectError) );
          ShellClient.Caption := FormCaption;
        end;
    ShellClient.Timer1.Enabled := SaveTimerEnabled;
    ShellClient.Refrescar1.Checked := SaveTimerEnabled;
  end;
end;

procedure TPaintBeams.ProcessAllAppMessages;
begin
  ShellClient.ProcessAllMessages;
end;

procedure TPaintBeams.ReceiveCh1BeamData;
var
  PackSize,
  UnPackSize : word;
  OutSize : integer;
  Buffer : PBytes;
  BeamBuffer : pointer;
begin
  //Receive data
  ShellClient.ViewCh1 := true;
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

procedure TPaintBeams.ReceiveCh2BeamData;
var
  PackSize,
  UnPackSize : word;
  OutSize : integer;
  Buffer : PBytes;
  BeamBuffer : pointer;
begin
  //Receive data
  ShellClient.ViewCh2 := true;
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

procedure TPaintBeams.RefreshRadarData;
begin
  if ShellClient.Timer1.Enabled
    then ShellClient.RefreshRadar( nil );
end;

procedure TPaintBeams.RefreshRTData;
begin
  if ShellClient.ViewCh1
    then ShellClient.RT_Ch1.UpdateView;
  if ShellClient.ViewCh2
    then ShellClient.RT_Ch2.UpdateView;
end;

end.
