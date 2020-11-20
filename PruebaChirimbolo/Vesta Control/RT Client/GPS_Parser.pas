unit GPS_Parser;

interface

uses
  Classes, SysUtils;

const
  Block_ID = '$GPRMC';
  GPS_ID   = '$GPGGA';

type
  TGPS_Parser =
    class
      private
        fDate,
        fTime       : TDateTime;
        fLatitude,
        fLongitude,
        fCurse,
        fVelocity   : double;
        fSource     : TStream;
        Synchronization : TMultiReadExclusiveWriteSynchronizer;
        function GetCurse: double;
        function GetDate: TDateTime;
        function GetLatitude: double;
        function GetLongitude: double;
        function GetTime: TDateTime;
        function GetVelocity: double;
      private
        procedure SearchNextMark( const Mark : string; Direction : boolean );
        function  GetLine : string;
        procedure PopulateFields;
      public
        constructor Create;                                        overload;
        constructor Create( Source : TStream; Origin : boolean );  overload;
        procedure   Fill( Source : string; Origin : boolean );
        destructor  Destroy; override;
      public
        procedure First;
        procedure Last;
        procedure Next;
        procedure Previous;
      public
        property Date      : TDateTime read GetDate;
        property Time      : TDateTime read GetTime;
        property Latitude  : double    read GetLatitude;
        property Longitude : double    read GetLongitude;
        property Curse     : double    read GetCurse;
        property Velocity  : double    read GetVelocity;
    end;

implementation

uses TimeUtils;

{ TGPS_Parser }

constructor TGPS_Parser.Create;
begin
  inherited Create;
  Synchronization := TMultiReadExclusiveWriteSynchronizer.Create;
end;

constructor TGPS_Parser.Create(Source: TStream; Origin: boolean);
begin
  Create;
  if Assigned( Source )
    then
      begin
        Synchronization.BeginWrite;
        try
          fSource := Source;
          if Origin
            then First
            else Last;
        finally
          Synchronization.EndWrite;
        end;
      end;
end;

destructor TGPS_Parser.Destroy;
begin
  if Assigned( fSource )
    then fSource.Free;
  Synchronization.Free;
  inherited;
end;

procedure TGPS_Parser.Fill(Source: string; Origin: boolean);
begin
  Synchronization.BeginWrite;
  try
    fSource := TFileStream.Create( Source, fmOpenRead );
    if Origin
      then First
      else Last;
  finally
    fSource.Free;
    Synchronization.EndWrite;
  end;
end;

procedure TGPS_Parser.First;
begin
  if Assigned( fSource )
    then
      begin
        fSource.Seek( 0, soFromBeginning );
        SearchNextMark( Block_ID, true );
        PopulateFields;
      end;
end;

function TGPS_Parser.GetCurse: double;
begin
  Synchronization.BeginRead;
  try
    result := fCurse;
  finally
    Synchronization.EndRead;
  end;
end;

function TGPS_Parser.GetDate: TDateTime;
begin
  Synchronization.BeginRead;
  try
    result := fDate;
  finally
    Synchronization.EndRead;
  end;
end;

function TGPS_Parser.GetLatitude: double;
begin
  Synchronization.BeginRead;
  try
    result := fLatitude;
  finally
    Synchronization.EndRead;
  end;
end;

function TGPS_Parser.GetLine: string;
var
  ch : char;
begin
  result := '';
  ch := #0;
  try
    repeat
      if fSource.Read( ch, 1 ) < 1
        then raise Exception.Create( '' );
      result := result + ch;
    until ch = '''';
  except
    result := '';
  end;
end;

function TGPS_Parser.GetLongitude: double;
begin
  Synchronization.BeginRead;
  try
    result := fLongitude;
  finally
    Synchronization.EndRead;
  end;
end;

function TGPS_Parser.GetTime: TDateTime;
begin
  Synchronization.BeginRead;
  try
    result := fTime;
  finally
    Synchronization.EndRead;
  end;
end;

function TGPS_Parser.GetVelocity: double;
begin
  Synchronization.BeginRead;
  try
    result := fVelocity;
  finally
    Synchronization.EndRead;
  end;
end;

procedure TGPS_Parser.Last;
begin
  if Assigned( fSource )
    then
      begin
        fSource.Seek( 0, soFromEnd );
        SearchNextMark( Block_ID, false );
        PopulateFields;
      end;  
end;

procedure TGPS_Parser.Next;
begin
  if Assigned( fSource )
    then
      begin
        SearchNextMark( Block_ID, true );
        PopulateFields;
      end;  
end;

procedure TGPS_Parser.PopulateFields;
var
  FormatSettings : TFormatSettings;
  Line : string;
  i : integer;
  StDate, StTime : string;
  Year, Month, Day, Hour, Min, Sec, MSec : integer;
begin
  with FormatSettings do
  begin
    DecimalSeparator := '.';
  end;
  Line := GetLine;
  //$GPRMC,215200.614,A,2125.0000,N,07750.0000,W,12.40,98.29,280807,,*14

  //Time
  Delete( Line, 1, Pos( ',', Line) );
  StTime := Copy( Line, 1, Pos( ',', Line)-1 );
  if ( Pos('.', StTime) > 0)
    then Delete(StTime, Pos('.', StTime), Length(StTime) - Pos('.', StTime) + 1);
  fTime := ZTimeToLocalTime( StrToTime(StTime, FormatSettings) );

  //Latitude & Longtude
  Delete( Line, 1, Pos( ',', Line) );
  Delete( Line, 1, Pos( ',', Line) );
  fLatitude := StrToFloat( Copy( Line, 1, Pos( ',', Line)-1 ), FormatSettings ) / 100;
  Delete( Line, 1, Pos( ',', Line) );
  Delete( Line, 1, Pos( ',', Line) );
  fLongitude := StrToFloat( Copy( Line, 1, Pos( ',', Line)-1 ), FormatSettings ) / 100;
  Delete( Line, 1, Pos( ',', Line) );
  Delete( Line, 1, Pos( ',', Line) );

  //Curse
  fCurse := StrToFloat( Copy( Line, 1, Pos( ',', Line)-1 ), FormatSettings );
  Delete( Line, 1, Pos( ',', Line) );

  //Speed
  fVelocity := StrToFloat( Copy( Line, 1, Pos( ',', Line)-1 ), FormatSettings );
  Delete( Line, 1, Pos( ',', Line) );

  //Date
  StDate := Copy( Line, 1, Pos( ',', Line)-1 );
  Day   := StrToInt( Copy( StDate, 1, 2 ) );
  Month := StrToInt( Copy( StDate, 3, 2 ) );
  Year  := StrToInt( Copy( StDate, 5, 2 ) );
  fDate := EncodeDate( Year, Month, Day );
end;

procedure TGPS_Parser.Previous;
begin
  if Assigned( fSource )
    then
      begin
        SearchNextMark( Block_ID, false );
        SearchNextMark( Block_ID, false );
        PopulateFields;
      end;  
end;

procedure TGPS_Parser.SearchNextMark(const Mark: string; Direction: boolean);
var
 ch : char;
 Buffer : string;
begin
  Buffer := '';
  repeat
    if Direction
      then
        begin
          if fSource.Read( ch, 1 ) < 1
            then raise Exception.Create( '' );
          Buffer := Buffer + ch;
        end
      else
        begin
          fSource.Seek( -1, soFromCurrent );
          if fSource.Read( ch, 1 ) < 1
            then raise Exception.Create( '' );
          Buffer := ch + Buffer;
          fSource.Seek( -1, soFromCurrent );
        end;
  until Pos( Mark, Buffer ) > 0;
  if Direction
    then fSource.Seek( -1*Length(Mark), soFromCurrent );
end;

end.
