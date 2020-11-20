unit Plane;

interface

uses
  Types,
  Classes;

type
  PCell = ^TCell;
  TCell = byte;

type
  PCellArray = ^TCellArray;
  TCellArray = array[0..maxint div sizeof(TCell) - 1] of TCell;
  TRow = PCellArray;
  TRay = PCellArray;

type
  TCoord = smallint;

  TPlanePoint = packed record
    case integer of
      1 : (X, Y : TCoord);
      2 : (R, A : TCoord);
  end;

  TPointArray = array of TPlanePoint;

  TPlaneArea = packed record
    case integer of
      1 : (A, B : TPlanePoint);
      2 : (Left, Top, Right, Bottom : TCoord);
  end;

type
  TPlaneKind = (pkHorizontal, pkVertical);

type
  TPlane = class(TPersistent)
  public
    constructor Initialize( const anArea : TPlaneArea; aCells : PCellArray );
    destructor  Destroy;  override;
  public
    procedure Assign( Source : TPersistent );  override;
  private
    fArea      : TPlaneArea;
    fSize      : TPlanePoint;
    fCells     : PCellArray;
    fCellCount : integer;
    function  GetCell     ( C1, C2 : TCoord ) : TCell;
    procedure SetCell     ( C1, C2 : TCoord; Value : TCell );
    procedure SetArea     ( const A : TPlaneArea );
    procedure SetOrigin   ( O : TPlanePoint );
    procedure SetEnding   ( E : TPlanePoint );
    procedure SetWidth    ( W : smallint );
    procedure SetHeight   ( H : smallint );
    function  GetCellArray( C2 : TCoord ) : PCellArray;
    procedure ReadCells   ( Reader : TReader );
    procedure WriteCells  ( Writer : TWriter );
    procedure SetCells    ( C : PCellArray );
  public
    property Cell     [C1, C2 : TCoord] : TCell      read GetCell write SetCell;  default;
    property CellArray[    C2 : TCoord] : PCellArray read GetCellArray;
    property Ray      [    C2 : TCoord] : TRay       read GetCellArray;
    property Row      [    C2 : TCoord] : TRow       read GetCellArray;
  public
    property Origin    : TPlanePoint read fArea.A write SetOrigin;
    property Ending    : TPlanePoint read fArea.B write SetEnding;
    property Size      : TPlanePoint read fSize;
    property Width     : smallint    read fSize.X write SetWidth;
    property Height    : smallint    read fSize.Y write SetHeight;
    property Radiuses  : smallint    read fSize.X write SetWidth;
    property Angles    : smallint    read fSize.Y write SetHeight;
    property Columns   : smallint    read fSize.X write SetWidth;
    property Rows      : smallint    read fSize.Y write SetHeight;
    property Area      : TPlaneArea  read fArea   write SetArea;
    property Cells     : PCellArray  read fCells  write SetCells;
    property CellCount : integer     read fCellCount;
  public
    procedure ReadState ( Reader : TReader );  virtual;
    procedure WriteState( Writer : TWriter );  virtual;
    procedure Clear;
  public
    procedure SaveBinary( const FileName : string );
    function  InBounds  ( C1, C2 : TCoord ) : boolean;  virtual;
  end;

type  // Location
  P2DLocation = ^T2DLocation;
  T2DLocation = packed record
    Longitude : single;
    Latitude  : single;
  end;

type
  P3DLocation = ^T3DLocation;
  T3DLocation = packed record
    Longitude : single;
    Latitude  : single;
    Altitude  : single;
  end;

function Loct2Dist( const L : T2DLocation ) : TPlanePoint;
function Dist2Loct( const D : TPlanePoint ) : T2DLocation;

function Location2D( Lg, Lt : single ) : T2DLocation;
function PlanePoint( X, Y : integer ) : TPlanePoint;
function PlaneArea ( X1, Y1, X2, Y2 : integer ) : TPlaneArea;

function InArea( const anArea : TPlaneArea; C1, C2 : TCoord ) : boolean;

function  ReadPlane ( Reader : TReader; Plane : TPlane ) : TPlane;
procedure WritePlane( Writer : TWriter; Plane : TPlane );

function  ReadPlanePoint ( Reader : TReader ) : TPlanePoint;
procedure WritePlanePoint( Writer : TWriter; Point : TPlanePoint );

function  ReadPoint ( Reader : TReader ) : TPoint;
procedure WritePoint( Writer : TWriter; Point : TPoint );

function  ReadPlaneArea  ( Reader : TReader ) : TPlaneArea;
procedure WritePlaneArea ( Writer : TWriter; Area : TPlaneArea );

implementation

uses
  SysUtils,
  {$IFDEF MSWINDOWS}
  ZLibEx,
  {$ENDIF}
  {$IFDEF LINUX}
  LibZEx,
  {$ENDIF}
  Math;

const
  DegLg2km = 111.322;  // at equator
  DegLt2km = 110.720;  // at 21 deg.
//DegLg2km = 103.570;  // at 21 deg.
//DegLt2km = 110.569;  // at equator

// Public procedures & functions

function Loct2Dist( const L : T2DLocation ) : TPlanePoint;
begin
  Result.X := round(DegLg2km * cos(L.Latitude * Pi/180) * L.Longitude);
  Result.Y := round(DegLt2km * L.Latitude);
end;

function Dist2Loct( const D : TPlanePoint ) : T2DLocation;
begin
  Result.Latitude  := D.Y/DegLt2km;
  Result.Longitude := D.X/(DegLg2km * cos(Result.Latitude * Pi/180));
end;

function Location2D( Lg, Lt : single ) : T2DLocation;
begin
  Result.Longitude := Lg;
  Result.Latitude  := Lt;
end;

function PlanePoint( X, Y : integer ) : TPlanePoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

function PlaneArea( X1, Y1, X2, Y2 : integer ) : TPlaneArea;
begin
  Result.Left   := X1;
  Result.Top    := Y1;
  Result.Right  := X2;
  Result.Bottom := Y2;
end;

function InArea( const anArea : TPlaneArea; C1, C2 : TCoord ) : boolean;
begin
  with anArea do
    Result := (C1 >= Left) and (C1 <= Right) and
              (C2 >= Top)  and (C2 <= Bottom);
end;

function ReadPlane( Reader : TReader; Plane : TPlane ) : TPlane;
begin
  Reader.ReadSignature;
  if Plane = nil
    then Plane := Classes.FindClass(Reader.ReadString).Create as TPlane
    else Reader.ReadString;
  Plane.ReadState(Reader);
  Result := Plane;
end;

procedure WritePlane( Writer : TWriter; Plane : TPlane );
begin
  Writer.WriteSignature;
  Writer.WriteString(Plane.ClassName);
  Plane.WriteState(Writer);
end;

function ReadPlanePoint( Reader : TReader ) : TPlanePoint;
begin
  Result.X := Reader.ReadInteger;
  Result.Y := Reader.ReadInteger;
end;

procedure WritePlanePoint( Writer : TWriter; Point : TPlanePoint );
begin
  Writer.WriteInteger(Point.X);
  Writer.WriteInteger(Point.Y);
end;

function ReadPoint( Reader : TReader ) : TPoint;
begin
  Result.X := Reader.ReadInteger;
  Result.Y := Reader.ReadInteger;
end;

procedure WritePoint( Writer : TWriter; Point : TPoint );
begin
  Writer.WriteInteger(Point.X);
  Writer.WriteInteger(Point.Y);
end;

function ReadPlaneArea( Reader : TReader ) : TPlaneArea;
begin
  Result.Left   := Reader.ReadInteger;
  Result.Top    := Reader.ReadInteger;
  Result.Right  := Reader.ReadInteger;
  Result.Bottom := Reader.ReadInteger;
end;

procedure WritePlaneArea( Writer : TWriter; Area : TPlaneArea );
begin
  Writer.WriteInteger(Area.Left);
  Writer.WriteInteger(Area.Top);
  Writer.WriteInteger(Area.Right);
  Writer.WriteInteger(Area.Bottom);
end;

{ TPlane }

constructor TPlane.Initialize( const anArea : TPlaneArea; aCells : PCellArray );
begin
  inherited Create;
  Cells := aCells;
  SetArea(anArea);
  if aCells = nil
    then Clear;
end;

destructor TPlane.Destroy;
begin
  if assigned(fCells)
    then ReallocMem(fCells, 0);
  inherited Destroy;
end;

procedure TPlane.Assign( Source : TPersistent );
begin
  if Source is TPlane
    then
      with Source as TPlane do
        begin
          Self.SetArea(Area);
          Move(Cells^, Self.Cells^, Width * Height * sizeof(TCell));
        end
    else inherited Assign(Source);
end;

function TPlane.GetCell( C1, C2 : TCoord ) : TCell;
begin
  Result := fCells^[(C2 - Origin.Y) * Width + (C1 - Origin.X)];
end;

procedure TPlane.SetCell( C1, C2 : TCoord; Value : TCell );
begin
  fCells^[(C2 - Origin.Y) * Width + (C1 - Origin.X)] := Value;
end;

procedure TPlane.SetArea( const A : TPlaneArea );
begin
  fArea.A.X  := MinIntValue([A.A.X, A.B.X]);
  fArea.A.Y  := MinIntValue([A.A.Y, A.B.Y]);
  fArea.B.X  := MaxIntValue([A.A.X, A.B.X]);
  fArea.B.Y  := MaxIntValue([A.A.Y, A.B.Y]);
  fSize.X    := fArea.B.X - fArea.A.X + 1;
  fSize.Y    := fArea.B.Y - fArea.A.Y + 1;
  fCellCount := fSize.X * fSize.Y * sizeof(TCell);
  ReallocMem(fCells, fCellCount);
end;

procedure TPlane.SetWidth( W : smallint );
var
  OldWidth : integer;
  OldCells : PCellArray;
  I        : integer;
begin
  if W <> Width
    then
      begin
        OldWidth := Width;
        OldCells := fCells;
        fCells   := nil;
        try
          SetArea(PlaneArea(Origin.X, Origin.Y, Origin.X + W - 1, Ending.Y));
          FillChar(fCells^, fCellCount, 0);
          if OldWidth < Width
            then
              for I := 0 to Height - 1 do
                move(OldCells^[I*OldWidth], fCells^[I*Width], OldWidth)
            else
              for I := 0 to Height - 1 do
                move(OldCells^[I*OldWidth], fCells^[I*Width], Width);
        finally
          ReallocMem(OldCells, 0);
        end;
      end;
end;

procedure TPlane.SetHeight( H : smallint );
var
  OldHeight : integer;
begin
  if H <> Height
    then
      begin
        OldHeight := Height;
        SetArea(PlaneArea(Origin.X, Origin.Y, Ending.X, Origin.Y + H - 1));
        if OldHeight < Height
          then FillChar(fCells^[OldHeight * Width], (Height - OldHeight) * Width, 0);
      end;
end;

procedure TPlane.SetOrigin( O : TPlanePoint );
begin
  if longint(Origin) <> longint(O)
    then SetArea(PlaneArea(O.X, O.Y, Ending.X, Ending.Y));
end;

procedure TPlane.SetEnding( E : TPlanePoint );
begin
  if longint(Ending) <> longint(E)
    then SetArea(PlaneArea(Origin.X, Origin.Y, E.X, E.Y));
end;

function TPlane.GetCellArray( C2 : TCoord ) : PCellArray;
begin
  Result := @fCells^[(C2 - Origin.Y) * Width];
end;

procedure TPlane.ReadCells( Reader : TReader );
var
  PBuf : pointer;
  Size : integer;
begin
  Size := Reader.ReadInteger;
  GetMem(PBuf, Size);
  Reader.Read(PBuf^, Size);
  if assigned(fCells)
    then ReallocMem(fCells, 0);
  ZDecompress(PBuf, Size, pointer(fCells), fCellCount, fCellCount);
  FreeMem(PBuf, Size);
end;

procedure TPlane.WriteCells( Writer : TWriter );
var
  PBuf : pointer;
  Size : integer;
begin
  ZCompress(fCells, fCellCount, PBuf, Size);
  Writer.WriteInteger(Size);
  Writer.Write(PBuf^, Size);
  ReallocMem(PBuf, 0);
end;

procedure TPlane.SetCells( C : PCellArray );
begin
  if assigned(fCells)
    then ReallocMem(fCells, 0);
  fCells := C;
end;

procedure TPlane.ReadState( Reader : TReader );
begin
  SetArea(ReadPlaneArea(Reader));
  if assigned(fCells)
    then ReadCells(Reader);
end;

procedure TPlane.WriteState( Writer : TWriter );
begin
  WritePlaneArea(Writer, Area);
  if assigned(fCells)
    then WriteCells(Writer);
end;

procedure TPlane.Clear;
begin
  FillChar(fCells^, fCellCount, 0);
end;

procedure TPlane.SaveBinary(const FileName: string);
var
  F : integer;
begin
  F := FileOpen(FileName, fmOpenWrite);
  try
    FileWrite(F, fCells^, fCellCount);
  finally
    FileClose(F);
  end;
end;

function TPlane.InBounds( C1, C2 : TCoord ) : boolean;
begin
  dec(C1, Origin.X);
  dec(C2, Origin.Y);
  Result := (C1 < Size.X) and (C2 < Size.Y);
end;

end.

