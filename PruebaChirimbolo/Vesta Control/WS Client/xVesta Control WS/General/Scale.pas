unit Scale;

interface

uses
  SysUtils, Classes,
  Referenced, Measure;

type
  HPalette = word;

  EScaleError       = class(Exception);
    EInvalidPalette = class(EScaleError);

  TPalCaptns = array of string;
  TPalColors = array of longint;
  TPalValues = array of TCode;

type
  TScale = class(TReferenced)
  public
    constructor Create( const aName : string; aSize : integer );
    constructor Load( const aFileName : string ); overload;
    constructor Load( const aBuffer : array of string ); overload;
    procedure   Save( const aFileName : string );
  private
    fFileName  : string;
    fName      : string;
    fMeasure   : TMeasure;
    fSize      : integer;
    fLook      : boolean;
    fColors    : TPalColors;
    fValues    : TPalValues;
    fCaptions  : TPalCaptns;
    procedure SetSize      ( V : integer );
    function  GetColor     ( I : integer ) : longint;
    procedure SetColor     ( I : integer; C : longint );
    function  GetValue     ( I : integer ) : TCode;
    procedure SetValue     ( I : integer; V : TCode );
    function  GetCaption   ( I : integer ) : string;
    procedure SetCaption   ( I : integer; S : string );
    function  GetValueColor( V : TCode ) : longint;
    function  GetIndex     ( V : TCode ) : integer;
    function  GetColorValue(Color: Integer): byte;
    function  GetInt(const List: string; Index : integer ): byte;
    function  GetStr(const List: string; Index : integer ): string;
  public
    property FileName  : string     read fFileName;
    property Name      : string     read fName      write fName;
    property Measure   : TMeasure   read fMeasure   write fMeasure;
    property Size      : integer    read fSize      write SetSize;
    property Look      : boolean    read fLook      write fLook;
    property Colors    : TPalColors read fColors;
    property Values    : TPalValues read fValues;
    property Captions  : TPalCaptns read fCaptions;
    property Color     [I : integer] : longint  read GetColor   write SetColor;
    property Value     [I : integer] : TCode    read GetValue   write SetValue;
    property Caption   [I : integer] : string   read GetCaption write SetCaption;
    property ValueColor[V : byte]    : longint  read GetValueColor;  default;
    property ColorValue[Color : longint] : byte read GetColorValue;
    property Index     [V : byte]    : integer  read GetIndex;
  public
    procedure Insert( Index : integer );
    procedure Delete( Index : integer );
  private
    procedure Allocate;
  end;

implementation

// TScale methods

constructor TScale.Create( const aName : string; aSize : integer );
begin
  inherited Create;
  fName := aName;
  fSize := aSize;
  Allocate;
end;

constructor TScale.Load( const aFileName : string );
var
  F       : text;
  I       : integer;
  R, G, B : byte;
  S       : string;
begin
  inherited Create;
  fFileName := aFileName;
  assign(F, fFileName);
  try
    reset(F);
    try
      readln(F, fName);
      readln(F, fSize, byte(fLook));
      Allocate;
      for I := 0 to fSize - 1 do
        begin
          readln(F, fValues[I], R, G, B, S);
          fColors[I] := longint(B) shl 16 or longint(G) shl 8 or longint(R);
          fCaptions[I] := Trim(S);
        end;
    finally
      close(F);
    end;
  except
    on E : Exception do
      begin
        E.Message := 'No se pudo abrir el archivo de escala:'#13#10 +
                     fFileName + #13#10 +
                     E.Message;
        raise;
      end;
  end;
end;

procedure TScale.Save( const aFileName : string );
var
  F       : text;
  I       : integer;
  R, G, B : byte;
  C       : longint;
begin
  fFileName := aFileName;
  assign(F, fFileName);
  rewrite(F);
  try
    writeln(F, fName);
    writeln(F, fSize:3, byte(fLook):2);
    for I := 0 to fSize - 1 do
      begin
        C := fColors[I];
        R :=  C and $000000FF;
        G := (C and $0000FF00) shr 8;
        B := (C and $00FF0000) shr 16;
        writeln(F, fValues[I]:4, R:4, G:4, B:4, ' ', fCaptions[I]);
      end;
  finally
    close(F);
  end;
end;

procedure TScale.SetSize( V : integer );
var
  OldColors   : TPalColors;
  OldValues   : TPalValues;
  OldCaptions : TPalCaptns;
  OldSize     : integer;
  CopyCount   : integer;
begin
  OldColors   := Copy(fColors);
  OldValues   := Copy(fValues);
  OldCaptions := Copy(fCaptions);
  OldSize     := fSize;
  fSize := V;
  Allocate;
  if V <= OldSize
    then CopyCount := V
    else CopyCount := OldSize;
  move(OldColors  [0], fColors  [0], CopyCount * sizeof(longint));
  move(OldValues  [0], fValues  [0], CopyCount * sizeof(byte));
  move(OldCaptions[0], fCaptions[0], CopyCount * sizeof(string));
end;

function TScale.GetColor( I : integer ) : longint;
begin
  Result := fColors[I];
end;

procedure TScale.SetColor( I : integer; C : longint );
begin
  fColors[I] := C;
end;

function TScale.GetValue( I : integer ) : TCode;
begin
  Result := fValues[I];
end;

procedure TScale.SetValue( I : integer; V : TCode );
begin
  fValues[I] := V;
end;

function TScale.GetCaption( I : integer ) : string;
begin
  Result := fCaptions[I];
end;

procedure TScale.SetCaption( I : integer; S : string );
begin
  fCaptions[I] := S;
end;

function TScale.GetValueColor( V : byte ) : longint;
begin
  Result := fColors[GetIndex(V)];
end;

function TScale.GetIndex( V : byte ) : integer;
var
  I : integer;
begin
  I := 0;
  while (I < Size - 1) and (V > fValues[I])
    do inc(I);
  Result := I;
end;

procedure TScale.Insert( Index : integer );
var
  CopyCount : integer;
begin
  CopyCount := fSize - Index;
  SetSize(fSize + 1);
  move(fColors  [Index], fColors  [Index + 1], CopyCount * sizeof(longint));
  move(fValues  [Index], fValues  [Index + 1], CopyCount * sizeof(byte));
  move(fCaptions[Index], fCaptions[Index + 1], CopyCount * sizeof(string));
end;

procedure TScale.Delete( Index : integer );
var
  CopyCount : integer;
begin
  CopyCount := fSize - Index - 1;
  move(fColors  [Index + 1], fColors  [Index], CopyCount * sizeof(longint));
  move(fValues  [Index + 1], fValues  [Index], CopyCount * sizeof(byte));
  move(fCaptions[Index + 1], fCaptions[Index], CopyCount * sizeof(string));
  SetSize(fSize - 1);
end;

procedure TScale.Allocate;
begin
  SetLength(fColors,   fSize);
  SetLength(fValues,   fSize);
  SetLength(fCaptions, fSize);
end;

function TScale.GetColorValue(Color: Integer): byte;
var
  I : integer;
begin
  I := Size-1;
  while (I > 0) and (Color <> fColors[I])
    do dec(I);
  Result := I;
end;

constructor TScale.Load(const aBuffer: array of string);
var
  F        : text;
  I, Index : integer;
  R, G, B  : byte;
  S, Str   : string;
begin
  inherited Create;
  fFileName := '';
  Index := 0;
  try
    fName := aBuffer[ Index ];
    Inc( Index );
    Str := aBuffer[ Index ];
    fSize := GetInt( Str, 1 );
    Allocate;
    for I := 0 to fSize - 1 do
      begin
        Inc( Index );
        Str := aBuffer[ Index ];
        fValues[I] := GetInt( Str, 1 );
        R := GetInt( Str, 2 );
        G := GetInt( Str, 3 );
        B := GetInt( Str, 4 );
        S := GetStr( Str, 5 );
        fColors[I] := longint(B) shl 16 or longint(G) shl 8 or longint(R);
        fCaptions[I] := Trim(S);
      end;
  except
    on E : Exception do
      begin
        E.Message := 'No se pudo leer el buffer de escala:'#13#10 +  E.Message;
        raise;
      end;
  end;
end;

function TScale.GetInt(const List: string; Index : integer ): byte;
var
  First, Last : integer;
  Num, Buffer : string;
  Count : integer;
begin
  try
    if (List <> '') or (Index > 0)
      then
        begin
          Last := 0;
          First := 0;
          Count := 0;
          while (First < Length( List )) and (Index > Count) do
          begin
            First := Last + 1;
            while (First <= Length( List )) and (not (List[First] in ['0','1','2','3','4','5','6','7','8','9'])) do Inc( First );
            if First > Length( List ) then break;
            Last := First + 1;
            while (Last <= Length( List )) and (List[Last] <> ' ') do Inc( Last );
            Inc( Count );
          end;
          if Index = Count
            then result := StrToInt( Copy( List, First, Last-First ) )
            else result := 0;
        end
      else result := 0;
  except
    result := 0;
  end;
end;

function TScale.GetStr(const List: string; Index: integer): string;
var
  First, Last : integer;
  Num, Buffer : string;
  Count : integer;
begin
  try
    if (List <> '') or (Index > 0)
      then
        begin
          Last := 0;
          First := 0;
          Count := 0;
          while (First < Length( List )) and (Index > Count) do
          begin
            First := Last + 1;
            while (First <= Length( List )) and (List[First] = ' ') do Inc( First );
            if First > Length( List ) then break;
            Last := First + 1;
            while (Last <= Length( List )) and (List[Last] <> ' ') do Inc( Last );
            Inc( Count );
          end;
          if Index = Count
            then result := Copy( List, First, Last-First )
            else result := '';
        end
      else result := '';
  except
    result := '';
  end;
end;

end.

