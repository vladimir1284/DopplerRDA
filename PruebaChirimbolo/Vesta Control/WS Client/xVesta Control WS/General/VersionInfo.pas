unit VersionInfo;

interface

uses
  {$IFDEF MSWINDOWS}
  Windows,
  {$ENDIF}
  {$IFDEF LINUX}
  Types,
  {$ENDIF}
  Classes;

type
  TVersionNumber = packed record
    case integer of
      0 : (Minor, Major, Build, Release : word);
      1 : (MS, LS : cardinal);
      2 : (Bytes : array[0..7] of byte);
  end;

const  // version strings
  vs_CompanyName      = 'CompanyName';
  vs_FileDescription  = 'FileDescription';
  vs_FileVersion      = 'FileVersion';
  vs_InternalName     = 'InternalName';
  vs_LegalCopyright   = 'LegalCopyright';
  vs_LegalTrademarks  = 'LegalTrademarks';
  vs_OriginalFilename = 'OriginalFilename';
  vs_ProductName      = 'ProductName';
  vs_ProductVersion   = 'ProductVersion';
  vs_Comments         = 'Comments';

function FileVersion    : TVersionNumber;
function ProductVersion : TVersionNumber;

function VersionToStr( const Version : TVersionNumber ) : string;

function FileDate : TFileTime;

function GetVersionString( const S : string ) : string;

implementation

uses
  SysUtils;

{$IFDEF MSWINDOWS}
var
  VersionSize   : integer = 0;
  VersionHandle : THandle = 0;
  VersionData   : pointer = nil;
  FixedData     : PVSFixedFileInfo = nil;
  FixedSize     : cardinal = 0;
  LangCharData  : PInteger = nil;
  LangCharSize  : cardinal = 0;
{$ENDIF}

// Public procedures & functions

function VersionToStr( const Version : TVersionNumber ) : string;
begin
  with Version do
    Result := IntToStr(Major)   + '.' +
              IntToStr(Minor)   + '.' +
              IntToStr(Release) + '.' +
              IntToStr(Build);
end;

function FileVersion : TVersionNumber;
begin
{$IFDEF MSWINDOWS}
  if assigned(FixedData)
    then
      begin
        Result.MS := FixedData.dwFileVersionMS;
        Result.LS := FixedData.dwFileVersionLS;
      end
    else
      begin
        Result.MS := 0;
        Result.LS := 0;
      end;
{$ENDIF}
{$IFDEF LINUX}
  Result.MS := 0;
  Result.LS := 0;
{$ENDIF}
end;

function ProductVersion : TVersionNumber;
begin
{$IFDEF MSWINDOWS}
  if assigned(FixedData)
    then
      begin
        Result.MS := FixedData.dwProductVersionMS;
        Result.LS := FixedData.dwProductVersionLS;
      end
    else
      begin
        Result.MS := 0;
        Result.LS := 0;
      end;
{$ENDIF}
{$IFDEF LINUX}
  Result.MS := 0;
  Result.LS := 0;
{$ENDIF}
end;

function FileDate : TFileTime;
begin
{$IFDEF MSWINDOWS}
  if assigned(FixedData)
    then
      begin
        Result.dwHighDateTime := FixedData.dwFileDateMS;
        Result.dwLowDateTime  := FixedData.dwFileDateLS;
      end
    else
      begin
        Result.dwHighDateTime := 0;
        Result.dwLowDateTime  := 0;
      end;
{$ENDIF}
{$IFDEF LINUX}
  Result.dwHighDateTime := 0;
  Result.dwLowDateTime  := 0;
{$ENDIF}
end;

function GetVersionString( const S : string ) : string;
var
  QueryStr : array[0..1000] of char;
  VerStr   : pointer;
  VerSize  : cardinal;
begin
{$IFDEF MSWINDOWS}
  if assigned(LangCharData)
    then
      begin
        StrFmt(QueryStr, '\StringFileInfo\%.4x%.4x\%s',
                         [LoWord(LangCharData^),
                          HiWord(LangCharData^),
                          S] );
        VerStr  := nil;
        VerSize := 0;
        VerQueryValue(VersionData, QueryStr, VerStr, VerSize);
        Result := StrPas(pchar(VerStr));
      end
    else Result := '';
{$ENDIF}
{$IFDEF LINUX}
  Result := '';
{$ENDIF}
end;

{$IFDEF MSWINDOWS}
initialization
  VersionSize := GetFileVersionInfoSize(pchar(paramstr(0)), VersionHandle);
  GetMem(VersionData, VersionSize);
  if GetFileVersionInfo(pchar(paramstr(0)), VersionHandle, VersionSize, VersionData)
    then
      begin
        VerQueryValue(VersionData, '\', pointer(FixedData), FixedSize);
        VerQueryValue(VersionData, '\VarFileInfo\Translation', pointer(LangCharData), LangCharSize);
      end;
finalization
  ReallocMem(VersionData, 0);
{$ENDIF}

end.

