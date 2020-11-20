unit LogTools;

interface

uses
  Classes;

const
  MaxLogLines = 500;
  MaxLogSize  = 1000;
  FileName = 'Logs.log';

type
  TLogCategory = ( lcInformation, lcWarning, lcError );
  TLogMessage =
    class
      private
        fDateTime : TDateTime;
        fCategory : TLogCategory;
        fUser,
        fTitle,
        fMessage,
        fZone     : string;
        fCode     : integer;
      public
        constructor Create( ADateTime : TDateTime; ACategory : TLogCategory; AnUser, AZone, ATitle, AMessage : string );
        constructor Blank;
        constructor LoadFromReader( Source : TReader );
      public
        procedure Save( Target : TWriter );
        procedure Load( Source : TReader );
      public
        property DateTime : TDateTime read fDateTime write fDateTime;
        property Category : TLogCategory read fCategory write fCategory;
        property CurrentUser : string read fUser write fUser;
        property Title : string read fTitle write fTitle;
        property LogMessage : string read fMessage write fMessage;
        property Zone : string read fZone write fZone;
        property Code : integer read fCode write fCode;
    end;

  TLogMessageList =
    class
      private
        fList : TList;
        fNewMessages : word;
        fPackPath : string;
      private
        function GetLogMessage(Index: word): TLogMessage;
        function GetCount: integer;
        function CreateNewCode : integer;
      public
        constructor Create;
        destructor  Destroy; override;
      public
        procedure Save( Target : TWriter );
        procedure Load( Source : TReader );
        procedure PackLogMessages;
        procedure AddLog( const ADateTime : TDateTime; const ACategory : TLogCategory; const AnUser, AZone, ATitle, AMessage : string );
        procedure Clear;
        function  Find( const ACode : integer ) : TLogMessage;
      public
        property  LogMessages[ Index : word ] : TLogMessage read GetLogMessage; default;
        property  Count : integer read GetCount;
        property  PackPath : string read fPackPath write fPackPath;
    end;

implementation

uses
  SysUtils;

{ TLogMessage }

constructor TLogMessage.Blank;
begin
  inherited Create;
  fDateTime := Now;
  fCategory := lcInformation;
  fUser := '';
  fZone := '';
  fTitle := '';
  fMessage := '';
end;

constructor TLogMessage.Create(ADateTime: TDateTime; ACategory: TLogCategory; AnUser, AZone, ATitle, AMessage: string);
begin
  inherited Create;
  fDateTime := ADateTime;
  fCategory := ACategory;
  fUser := AnUser;
  fZone := AZone;
  fTitle := ATitle;
  fMessage := AMessage;
end;

procedure TLogMessage.Load(Source : TReader);
begin
  fDateTime := Source.ReadDate;
  fCategory := TLogCategory( Source.ReadInteger );
  fCode := Source.ReadInteger;
  fUser := Source.ReadString;
  fZone := Source.ReadString;
  fTitle := Source.ReadString;
  fMessage := Source.ReadString;
end;

constructor TLogMessage.LoadFromReader( Source : TReader );
begin
  inherited Create;
  Load( Source );
end;

procedure TLogMessage.Save(Target: TWriter);
begin
  Target.WriteDate( fDateTime );
  Target.WriteInteger( Ord(fCategory) );
  Target.WriteInteger( fCode );
  Target.WriteString( fUser );
  Target.WriteString( fZone );
  Target.WriteString( fTitle );
  Target.WriteString( fMessage );
end;

{ TLogMessageList }

procedure TLogMessageList.AddLog(const ADateTime : TDateTime; const ACategory : TLogCategory; const AnUser, AZone, ATitle, AMessage : string);
var
  LogMessage : TLogMessage;
begin
  LogMessage := TLogMessage.Create( ADateTime, ACategory, AnUser, AZone, ATitle, AMessage );
  LogMessage.Code := CreateNewCode;
  Inc( fNewMessages );
  if fNewMessages > MaxLogLines
    then PackLogMessages;
  if fList.Count < MaxLogLines
    then fList.Add( pointer( LogMessage ) )
    else
      begin
        TLogMessage( fList[0] ).Free;
        fList.Delete( 0 );
        fList.Add( pointer( LogMessage ) );
      end;
end;

procedure TLogMessageList.Clear;
begin
  while fList.Count > 0 do
  begin
    TLogMessage( fList[0] ).Free;
    fList.Delete( 0 );
  end;
end;

constructor TLogMessageList.Create;
begin
  inherited Create;
  fList := TList.Create;
end;

function TLogMessageList.CreateNewCode: integer;
var
  i, j : integer;
  Exist : boolean;
begin
  for i := 0 to MaxLogLines do
  begin
    Exist := false;
    for j := 0 to fList.Count-1 do
      if TLogMessage( fList[j] ).Code = i
        then
          begin
            Exist := true;
            Break;
          end;
    if not Exist
      then
        begin
          result := i;
          Break;
        end;
  end;
end;

destructor TLogMessageList.Destroy;
begin
  Clear;
  fList.Free;
  inherited;
end;

function TLogMessageList.Find(const ACode: integer): TLogMessage;
var
  i : integer;
begin
  result := nil;
  for i := 0 to fList.Count-1 do
    if TLogMessage( fList[i] ).Code = ACode
      then result := TLogMessage( fList[i] );
end;

function TLogMessageList.GetCount: integer;
begin
  result := fList.Count;
end;

function TLogMessageList.GetLogMessage(Index: word): TLogMessage;
begin
  result := TLogMessage( fList[Index] );
end;

procedure TLogMessageList.Load(Source: TReader);
var
  i, Count : integer;
begin
  Count := Source.ReadInteger;
  fNewMessages := Source.ReadInteger;
  for i := 0 to Count-1 do
    fList.Add( pointer( TLogMessage.LoadFromReader( Source ) ) );
end;

procedure TLogMessageList.PackLogMessages;
var
  Target : TWriter;
  Stream : TStream;
  PackName : string;
  i : integer;
begin
  fNewMessages := 1;
  if fPackPath <> ''
    then
      begin
        PackName := DateTimeToStr( LogMessages[0].DateTime ) + '_' + DateTimeToStr( LogMessages[Count-1].DateTime ) + '.log';
        for i := 1 to Length( PackName ) do
        begin
          if PackName[i] = ':' then PackName[i] := '_';
          if PackName[i] = '\' then PackName[i] := '_';
          if PackName[i] = ' ' then PackName[i] := '_';
          if PackName[i] = '/' then PackName[i] := '_';
        end;
        Stream := TFileStream.Create( fPackPath + PackName, fmCreate );
        Target := TWriter.Create( Stream, MaxLogLines*MaxLogSize );
        try
          Save( Target );
        finally
          Target.Free;
          Stream.Free;
        end;
      end;
end;

procedure TLogMessageList.Save(Target: TWriter);
var
  i : integer;
begin
  Target.WriteInteger( fList.Count );
  Target.WriteInteger( fNewMessages );
  for i := 0 to fList.Count-1 do
    TLogMessage( fList[i] ).Save( Target );
end;

end.
