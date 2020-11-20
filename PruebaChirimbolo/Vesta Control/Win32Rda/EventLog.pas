unit EventLog;

interface

uses
  Classes, LogTools, SyncObjs;

const
  MaxSMTPServerConnectionTime = 5000;

type
  TLog =
    class
      private
        fLogMessages : TLogMessageList;
      private
        fLock : TCriticalSection;
        function  LogFilePath : string;
        function  LogFileName : string;
        procedure CreateBlankLog;
        function  GetLogMessagesCount: integer;
      public
        property  LogMessages : TLogMessageList read fLogMessages;
        property  Count : integer read GetLogMessagesCount;
      public
        constructor Create;
        destructor  Destroy; override;
        procedure   SaveLogs;
        procedure   AddLogMessage(const ACategory : TLogCategory; const AnUser, AZone, ATitle, AMessage : string );
        procedure   AddLogRawMessage( const ADateTime : TDateTime; const ACategory : TLogCategory; const AnUser, AZone, ATitle, AMessage : string );
        //email
        procedure ConfigureServer;
        function  TestEmailServerConfig : boolean;
        procedure SendEMail( const ASubject : string; ABody : TStrings );
        function  SendTestEmail : boolean;
        procedure SendErrorEmail( const ErrorName, ErrorMsg : string );
        procedure SendWarningEmail( const WarningName, WarningMsg : string );
        procedure SendCheckEmail( const Text : string );
    end;

var
  LogMessages : TLog;

implementation

uses
  SysUtils, IdSMTP,
  Radars, Description, Config, Elbrus, IdMessage, Communication_Module;

{ TLog }

procedure TLog.ConfigureServer;
begin
  with CommunicationModule.SMTPServer, theConfiguration do
  begin
    AuthenticationType := atLogin;
    Host     := SMTPServer;
    Port     := SMTPPort;
    Username := SMTPUser;
    Password := SMTPPassword;
  end;
end;

constructor TLog.Create;
var
  Source : TReader;
  Stream : TStream;
begin
  inherited;
  fLock := TCriticalSection.Create;
  fLogMessages := TLogMessageList.Create;
  if not FileExists( LogFileName )
    then CreateBlankLog;
  Stream := TFileStream.Create( LogFileName, fmOpenRead );
  Source := TReader.Create( Stream, MaxLogLines*MaxLogSize );
  try
    fLogMessages.Load( Source );
    fLogMessages.PackPath := LogFilePath;
  finally
    Source.Free;
    Stream.Free;
  end;
end;

destructor TLog.Destroy;
begin
  SaveLogs;
  fLogMessages.Free;
  fLock.Free;
  inherited;
end;

function TLog.LogFilePath: string;
begin
  result := ExtractFilePath( ParamStr(0) ) + '\Logs\'
end;

procedure TLog.AddLogMessage(const ACategory : TLogCategory; const AnUser, AZone, ATitle, AMessage : string );
begin
  AddLogRawMessage(Now, ACategory, AnUser, AZone, ATitle, AMessage );
  if (ACategory = lcError) and (theConfiguration.SendMsgOnError)
    then SendErrorEmail( ATitle, AMessage );
end;

procedure TLog.SendErrorEmail(const ErrorName, ErrorMsg: string);
var
  Body : TStrings;
  Subject : string;
begin
  Body := TStringList.Create;
  try
    Subject := 'Un mensaje de error del Radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name + ' : ' + ErrorName;
    Body.Add( 'El radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name +
              ' le ha enviado un correo de error ' );
    Body.Add( 'Fecha: ' + DateToStr( Now ) + ' Hora: ' + TimeToStr( Now ) );
    Body.Add( 'Observación: ' + Snapshot.ObsName );
    Body.Add( 'Error:' );
    Body.Add( ErrorMsg );

    try
      SendEMail( Subject, Body );
    except
    end;
  finally
    Body.Free;
  end;
end;

function TLog.SendTestEmail : boolean;
var
  Body : TStrings;
  Subject : string;
begin
  Body := TStringList.Create;
  try
    Subject := 'Un mensaje de prueba del Radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name;
    Body.Add( 'El radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name +
              ' le ha enviado un correo de prueba '+
              'como parte de la comprobacion de la configuracion del sistema de alarma ');
    Body.Add( 'Fecha: ' + DateToStr( Now ) + ' Hora: ' + TimeToStr( Now ) );

    try
      SendEMail( Subject, Body );
      result := true;
    except
      result := false;
    end;
  finally
    Body.Free;
  end;
end;

function TLog.TestEmailServerConfig: boolean;
begin
  with CommunicationModule.SMTPServer do
    try
      try
        ConfigureServer;
        Connect( MaxSMTPServerConnectionTime );
        result := Authenticate;
      finally
        if Connected
          then Disconnect;
      end;
    except
      result := false;
    end;
end;

function TLog.GetLogMessagesCount: integer;
begin
  result := fLogMessages.Count;
end;

procedure TLog.AddLogRawMessage( const ADateTime : TDateTime; const ACategory : TLogCategory; const AnUser, AZone, ATitle, AMessage : string );
begin
  fLock.Enter;
  try
    fLogMessages.AddLog( ADateTime, ACategory, AnUser, AZone, ATitle, AMessage );
    SaveLogs;
  finally
    fLock.Leave;
  end;
end;

procedure TLog.SendWarningEmail(const WarningName, WarningMsg: string);
var
  Body : TStrings;
  Subject : string;
begin
  Body := TStringList.Create;
  try
    Subject := 'Un mensaje de aviso del Radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name + ' : ' + WarningName;
    Body.Add( 'El radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name +
              ' le ha enviado un correo de aviso ' );
    Body.Add( 'Fecha: ' + DateToStr( Now ) + ' Hora: ' + TimeToStr( Now ) );
    Body.Add( 'Observación: ' + Snapshot.ObsName );
    Body.Add( 'Aviso:' );
    Body.Add( WarningMsg );

    try
      SendEMail( Subject, Body );
    except
    end;
  finally
    Body.Free;
  end;
end;

procedure TLog.SendCheckEmail(const Text: string);
var
  Body : TStrings;
  Subject : string;
begin
  Body := TStringList.Create;
  try
    Subject := 'Un mensaje de chequeo del Radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name;
    Body.Add( 'El radar de ' + Find( TRadar( theConfiguration.RadarID ) ).Name +
              ' le ha enviado un correo de autochequeo ' );
    Body.Add( 'Fecha: ' + DateToStr( Now ) + ' Hora: ' + TimeToStr( Now ) );
    Body.Add( 'Resultado:' );
    Body.Add( Text );

    try
      SendEMail( Subject, Body );
    except
    end;
  finally
    Body.Free;
  end;
end;

procedure TLog.SendEMail(const ASubject: string; ABody: TStrings);
var
  ToList : TStrings;
  i      : integer;
begin
  with CommunicationModule.SMTPServer, CommunicationModule.EMailMessage do
  try
    ConfigureServer;
    //Config Error Message
    ContentType := 'text/plain';
    From.Address := theConfiguration.SMTPFromAddress;
    Date := Now;
    ToList := TStringList.Create;
    ToList.CommaText := theConfiguration.TargetAddress;
    Recipients.Clear;
    for i := 0 to ToList.Count-1 do
    begin
      Recipients.Add;
      Recipients[i].Address := ToList[i];
    end;
    Subject := ASubject;
    Body.Clear;
    Body.Assign( ABody );
    Connect( MaxSMTPServerConnectionTime );
    Send( CommunicationModule.EMailMessage );
  finally
    ToList.Free;
    if Connected
      then Disconnect;
  end;
end;

procedure TLog.CreateBlankLog;
var
  Target : TWriter;
  Stream : TStream;
begin
  Stream := TFileStream.Create( LogFileName, fmCreate );
  Target := TWriter.Create( Stream, MaxLogSize );
  try
    Target.WriteInteger( 0 );
    Target.WriteInteger( 0 );
  finally
    Target.Free;
    Stream.Free;
  end;
end;

function TLog.LogFileName: string;
begin
  result := LogFilePath + FileName;
end;

procedure TLog.SaveLogs;
var
  Target : TWriter;
  Stream : TStream;
begin
  Stream := TFileStream.Create( LogFileName, fmCreate );
  Target := TWriter.Create( Stream, MaxLogLines*MaxLogSize );
  try
    fLogMessages.Save( Target );
  finally
    Target.Free;
    Stream.Free;
  end;
end;

initialization
  LogMessages := TLog.Create;

finalization
  LogMessages.Free;

end.
