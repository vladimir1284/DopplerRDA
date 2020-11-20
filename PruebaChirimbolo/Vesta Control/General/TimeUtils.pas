unit TimeUtils;

interface

uses
  Windows,
  SysUtils;

function LocalTimeToZTime( DateTime : TDateTime ) : TDateTime;
function ZTimeToLocalTime( DateTime : TDateTime ) : TDateTime;
function DayLightTime ( DateTime : TDateTime ) : boolean;

implementation

// Public procedures & functions

function LocalTimeToZTime( DateTime : TDateTime ) : TDateTime;
var
  DosDateTime : longint;
  LocFileTime : TFileTime;
  UTCFileTime : TFileTime;
  SystemTime  : TSystemTime;
begin
  DosDateTime := DateTimeToFileDate(DateTime);
  DosDateTimeToFileTime(LongRec(DosDateTime).Hi, LongRec(DosDateTime).Lo,
                        LocFileTime);
  LocalFileTimeToFileTime(LocFileTime, UTCFileTime);
  FileTimeToSystemTime(UTCFileTime, SystemTime);
  with SystemTime do
    Result := EncodeDate(wYear, wMonth, wDay) +
              EncodeTime(wHour, wMinute, wSecond, wMilliseconds);
end;

function ZTimeToLocalTime( DateTime : TDateTime ) : TDateTime;
var
  DosDateTime : longint;
  LocFileTime : TFileTime;
  UTCFileTime : TFileTime;
  SystemTime  : TSystemTime;
begin
  with SystemTime do
    begin
      DecodeDate(DateTime, wYear, wMonth, wDay);
      DecodeTime(DateTime, wHour, wMinute, wSecond, wMilliseconds);
    end;
  SystemTimeToFileTime(SystemTime, UTCFileTime);
  FileTimeToLocalFileTime(UTCFileTime, LocFileTime);
  FileTimeToDosDateTime(LocFileTime, LongRec(DosDateTime).Hi, LongRec(DosDateTime).Lo);
  Result := FileDateToDateTime(DosDateTime);
end;

function DayLightTime( DateTime : TDateTime ) : boolean;
var
  TimeZone  : TTimeZoneInformation;
  LocalTime : TSystemTime;
  OtherTime : TSystemTime;
const
  TIME_ZONE_ID_UNKNOWN  = 0;
  TIME_ZONE_ID_STANDARD = 1;
  TIME_ZONE_ID_DAYLIGHT = 2;
begin
  with OtherTime do
    begin
      DecodeDate(DateTime, wYear, wMonth, wDay);
      DecodeTime(DateTime, wHour, wMinute, wSecond, wMilliseconds);
      wDayOfWeek := DayOfWeek(Time);
    end;
  GetLocalTime(LocalTime);
  SetLocalTime(OtherTime);
  Result := GetTimeZoneInformation(TimeZone) = 2;
  SetLocalTime(LocalTime);
end;

end.
