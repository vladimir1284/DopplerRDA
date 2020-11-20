unit UtStr;

interface

const
  chBEEP  = ^G;
  chBS    = ^H;
  chTAB   = ^I;
  chLF    = ^J;
  chNP    = ^L;
  chCR    = ^M;
  chSPACE = ' ';

const
  HexChr : array[0..$F] of char = '0123456789ABCDEF';

type
  CharSet = set of char;

function ReplaceChar( const S : string; Src, Dst : char) : string;

function DupStr ( const S : string; Count : integer ) : string;
function DupChar(       C : char;   Count : integer ) : string;
function Spaces (                   Count : integer ) : string;

function RightStr( const S : string; Count : integer ) : string;
function LeftStr ( const S : string; Count : integer ) : string;

function  BeforeStr( const Sub, S : string ) : string;
function  AfterStr ( const Sub, S : string ) : string;
procedure SplitStr ( const Sub, S : string; var Before, After : string );

function PadStrLeft  ( const S : string; C : char; Width : integer ) : string;
function PadStrRight ( const S : string; C : char; Width : integer ) : string;
function PadStrCenter( const S : string; C : char; Width : integer ) : string;

function TrimCtrl  ( const S : string ) : string;
function TrimBlanks( const S : string ) : string;
function TrimChars ( const S : string; const Chars : CharSet ) : string;

implementation

function ReplaceChar( const S : string; Src, Dst : char) : string;
var
  I : integer;
begin
  Result := S;
  for I := 1 to length(Result) do
    if Result[I] = Src
      then Result[I] := Dst;
end;

function DupStr( const S : string; Count : integer ) : string;
var
  I, J : integer;
begin
  SetLength(Result, Count * Length(S));
  J := 1;
  for I := 0 to Count - 1 do
    begin
      Move(S[1], Result[J], Length(S));
      inc(J, Length(S));
    end;
end;

function DupChar( C : char; Count : integer ) : string;
begin
  if Count > 0
    then
      begin
        SetLength(Result, Count);
        FillChar(Result[1], Count, C);
      end
    else Result := '';
end;

function Spaces( Count : integer ) : string;
begin
  Result := DupChar(chSpace, Count);
end;

function RightStr( const S : string; Count : integer ) : string;
begin
  Result := copy(S, Length(S) - Count + 1, Count);
end;

function LeftStr( const S : string; Count : integer ) : string;
begin
  Result := copy(S, 1, Count);
end;

function BeforeStr( const Sub, S : string ) : string;
var
  P : integer;
begin
  P := Pos(Sub, S);
  if P > 0
    then Result := copy(S, 1, P - 1)
    else Result := S;
end;

function AfterStr( const Sub, S : string ) : string;
var
  P : integer;
begin
  P := Pos(Sub, S);
  if P > 0
    then
      begin
        inc(P, Length(Sub));
        Result := copy(S, P, Length(S) - P + 1);
      end
    else Result := '';
end;

procedure SplitStr( const Sub, S : string; var Before, After : string );
var
  P : integer;
begin
  P := Pos(Sub, S);
  if P > 0
    then
      begin
        Before := copy(S, 1, P - 1);
        inc(P, length(Sub));
        After  := copy(S, P, Length(S) - P + 1);
      end
    else
      begin
        Before := S;
        After  := '';
      end;
end;

function PadStrLeft( const S : string; C : char; Width : integer ) : string;
begin
  Result := ReplaceChar(S, chSpace, C) + DupChar(C, Width - length(S));
end;

function PadStrRight( const S : string; C : char; Width : integer ) : string;
begin
  Result := DupChar(C, Width - length(S)) + ReplaceChar(S, chSpace, C);
end;

function PadStrCenter( const S : string; C : char; Width : integer ) : string;
begin
  Result := DupChar(C, (Width - length(S)) div 2) +
            ReplaceChar(S, chSpace, C) +
            DupChar(C, (Width - length(S)) div 2 + (Width - length(S)) mod 2);
end;

function TrimCtrl( const S : string ) : string;
var
  I : integer;
const
  EditChars : set of char = ['A'..'Z', 'a'..'z',
                             '0'..'9', ' ', '_',
                             #08, #10, #13];
begin
  Result := '';
  for I := 1 to length(S) do
    if S[I] in EditChars
      then Result := Result + S[I];
end;

function TrimBlanks( const S : string ) : string;
var
  I : integer;
const
  EditChars : set of char = ['A'..'Z', 'a'..'z',
                             '0'..'9', '_'];
begin
  Result := '';
  for I := 1 to length(S) do
    if S[I] in EditChars
      then Result := Result + S[I];
end;

function TrimChars( const S : string; const Chars : CharSet ) : string;
var
  I : integer;
begin
  Result := '';
  for I := 1 to length(S) do
    if not (S[I] in Chars)
      then Result := Result + S[I];
end;

end.

