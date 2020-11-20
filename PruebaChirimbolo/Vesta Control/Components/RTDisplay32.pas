unit RTDisplay32;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Types, Graphics, Dialogs, Messages, Themes, Scale, GR32;

const
  RadarSize = 5;
  DefaultBoardRange = 500;
  ScrollBarsSize = 15;
  Sample_Excluded = $FFFF;
  Data_Excluded   = $FF;
  DefaultTransparentColor = clBtnFace;
  DefaultBackground = clBtnFace;
  ScaleWidth = 30;

type
  PBytes = ^TBytes;
  TBytes = array[0..0] of byte;

  T2DCoord =
    record
      X, Y : double;
    end;

  TPlaneRect =
    record
      case integer of
       0: (LeftTop, RightBottom : T2DCoord);
       1: (Left, Top, Right, Bottom : double);
    end;

type
  TRTDisplay32 = class(TCustomControl)
  private
    fColorScale : TScale;
    fColorScalePath,
    fOutlinePath : TFileName;
    HScroll,
    VScroll : TScrollBar;
    fPaintRect : TRect;
    Rings,
    Radar,
    Map,
    OutlineMap,
    Board,
    Glance, AuxGlance : TBitmap32;
    fMapPath : TFileName;
    fCellCount,
    fCellSize,
    fRingDistance,
    fMapScale : integer;
    fShowRings,
    fShowMap,
    fShowOutLine,
    fShowRadar : boolean;
    fRingsColor,
    fMapColor,
    TransparentColor,
    fBackgroundColor : TColor;
    fBeamWidth : double;
    fPPI_RHI : boolean;
    fZoom : integer;
    fBoardRange : integer;
    PageSizeX,
    PageSizeY : integer;
    ScrollX,
    ScrollY : integer;
    SnippetSize : TPoint;
  private
    function  GetSnippetHeight: integer;
    function  GetSnippetWidth: integer;
    procedure SetOutLineMap(const Value: boolean);
    function  DefaultColorScale : TScale;
    function  GetMapRange: integer;
    function  GetRange: integer;
    function  GetBoardScale: integer;
    procedure SetRingDistance(const Value: integer);
    procedure SetShowRings(const Value: boolean);
    procedure SetRingsColor(const Value: TColor);
    procedure SetShowRadar(const Value: boolean);
    procedure SetColorScalePath(const Value: TFileName);
    procedure SetPaintRect(const Value: TRect);
    procedure SetBoardRange(const Value: integer);
    procedure SetZoom(const Value: integer);
    procedure SetPPI_RHI(const Value: boolean);
    procedure SetBackgroundColor(const Value: TColor);
    procedure SetShowMap(const Value: boolean);
    procedure SetCellSize(const Value: integer);
    procedure SetMapScale(const Value: integer);
    procedure SetMapPath(const Value: TFileName);
    procedure SetOutlinePath(const Value: TFileName);
    procedure SetCellCount(const Value: integer);
    procedure SetMapColor(const Value: TColor);

    //To Paint
    procedure PassFocus( Sender : TObject );
    function  Minor( const Size1, Size2 : integer ) : integer;
    function  Major( const Size1, Size2 : integer ) : integer;
    procedure InitRadar;
    procedure DoneRadar;
    procedure InitGlance;
    procedure DoneGlance;
    procedure InitBoard;
    procedure DoneBoard;
    procedure PaintRings;
    procedure InitData;
    procedure InitRings;
    procedure InitScrollBars;
    procedure DoneScrollBars;
    procedure ResizeBoard;
    procedure AdjustGlance;
    procedure ResizeScrollBars;
    procedure AdjustScrollBars;
    procedure ScrollChange(Sender: TObject);
    procedure Resize(Sender: TObject);
    function  DegreeToRadian( Degree : double ) : extended;
    function  NormalizeAngle( Angle : double ) : Double;
    function  InterceptRatio( Ratio, Angle : double ) : T2DCoord;
    function  TranslateX( PointRange : word; aRange, X : double ) : word;
    function  TranslatePoint( PointRange : word; aRange, Ratio : double; Point : T2DCoord ) : TPoint;

    //To View
    function  GetSnippetSize : TPoint;
    function  GetSnippetRect( Origin, Size : TPoint ) : TRect;
    function  Small2Big( Src : PBytes; SSize, DSize, DCount : cardinal ): PBytes;
    function  Big2Small( Src : PBytes; SSize, DSize, DCount : cardinal ): PBytes;
    function  StretchCells( Src : PBytes; SrcSize, DstSize, DstCount : cardinal ) : PBytes;
    procedure CenterScrollBars;
    procedure PaintScale( Area : TRect );
    procedure RefreshGlance;
  protected
    procedure Paint; override;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure AddBeam( AntennaPos : double; RawCellSize, RawCellCount : integer; Data : PBytes );
    procedure ClearBeams;
  public
    property PaintRect : TRect read fPaintRect;
    property Range : integer read GetRange;            //Alcance en metros
    property BoardScale : integer read GetBoardScale;  //metros x puntos
    property MapRange : integer read GetMapRange;      //Alcance en puntos
    property SnippetWidth : integer read GetSnippetWidth;
    property SnippetHeight : integer read GetSnippetHeight;
    property SnippetX : integer read ScrollX;
    property SnippetY : integer read ScrollY;
    property BoardImage : TBitmap32 read Board;
    property ColorScale : TScale read fColorScale;

    procedure Center;
  published
    property MapPath : TFileName read fMapPath write SetMapPath;
    property OutlinePath : TFileName read fOutlinePath write SetOutlinePath;
    property ScalePath : TFileName read fColorScalePath write SetColorScalePath;
    property CellSize : integer read fCellSize write SetCellSize;
    property CellCount : integer read fCellCount write SetCellCount;
    property ShowMap : boolean read fShowMap write SetShowMap;
    property ShowOutline : boolean read fShowOutLine write SetOutLineMap;
    property ShowRadar : boolean read fShowRadar write SetShowRadar;
    property BackgroundColor : TColor read fBackgroundColor write SetBackgroundColor;
    property MapColor : TColor read fMapColor write SetMapColor;
    property BeamWidth : double read fBeamWidth write fBeamWidth;
    property PPI_RHI : boolean read fPPI_RHI write SetPPI_RHI;
    property Zoom : integer read fZoom write SetZoom;
    property MapScale : integer read fMapScale write SetMapScale;
    property BoardRange : integer read fBoardRange write SetBoardRange;
    //Rings
    property ShowRings : boolean read fShowRings write SetShowRings;
    property RingsColor : TColor read fRingsColor write SetRingsColor;
    property RingDistance : integer read fRingDistance write SetRingDistance;

    property Align;
    property Anchors;
    property PopupMenu;
    //Events
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnMouseWheel;
    property OnMouseWheelDown;
    property OnMouseWheelUp;
    property OnClick;
    property OnDblClick;
  end;

procedure Register;

implementation

uses Forms;

procedure Register;
begin
  RegisterComponents('Vesta', [TRTDisplay32]);
end;

{ TRTDisplay32 }

procedure TRTDisplay32.AddBeam(AntennaPos: double; RawCellSize, RawCellCount: integer; Data: PBytes);
var
  i : integer;
  Angle : double;
  DisplayCellCount : integer;
  MajorRatio, MinorRatio : double;
  LT, RT, RB, LB : T2DCoord;
  LeftTop, RightTop,
  RightBottom, LeftBottom : TPoint;
  Buffer : PBytes;
begin
  if RawCellSize <> fCellSize
    then Buffer := StretchCells( Data, RawCellSize, fCellSize, fCellCount )
    else Buffer := Data;

  if fCellCount > RawCellCount
    then DisplayCellCount := RawCellCount
    else DisplayCellCount := fCellCount;

  if fPPI_RHI
    then Angle := AntennaPos
    else Angle := 90 - AntennaPos;

  for i := DisplayCellCount-1 downto 0 do
  begin
    MajorRatio := (i+1) * fCellSize;
    MinorRatio := i * fCellSize;
    LT := InterceptRatio( MajorRatio, Angle - (fBeamWidth / 2) );
    RT := InterceptRatio( MajorRatio, Angle + (fBeamWidth / 2) );
    RB := InterceptRatio( MinorRatio, Angle + (fBeamWidth / 2) );
    LB := InterceptRatio( MinorRatio, Angle - (fBeamWidth / 2) );

    LeftTop     := TranslatePoint( fBoardRange, Range, MajorRatio, LT );
    RightTop    := TranslatePoint( fBoardRange, Range, MajorRatio, RT );
    RightBottom := TranslatePoint( fBoardRange, Range, MinorRatio, RB );
    LeftBottom  := TranslatePoint( fBoardRange, Range, MinorRatio, LB );

    if Assigned( fColorScale )
      then
        begin
          with Board.Canvas do
          begin
            Pen.Style := psSolid;
            Brush.Style := bsSolid;
            Pen.Color := fColorScale[ Buffer[ i ] ];
            Brush.Color := fColorScale[ Buffer[ i ] ];
            Polygon( [ LeftTop, RightTop, RightBottom, LeftBottom ] );
          end;
        end;
  end;
  RefreshGlance;
end;

procedure TRTDisplay32.AdjustGlance;
begin
  Glance.Width := fPaintRect.Right;
  Glance.Height := fPaintRect.Bottom;
  AuxGlance.Width := fPaintRect.Right;
  AuxGlance.Height := fPaintRect.Bottom;
end;

procedure TRTDisplay32.AdjustScrollBars;
var
  Size : TPoint;
begin
  Size := GetSnippetSize;
  //Horizontal
  PageSizeX := 100 * Size.X div (fBoardRange*2);
  if PageSizeX < 100
    then HScroll.PageSize := PageSizeX
    else HScroll.PageSize := 101;
  HScroll.Visible := PageSizeX < 100;

  //Vertical
  PageSizeY := 100 * Size.Y div (fBoardRange*2);
  if PageSizeY < 100
    then VScroll.PageSize := PageSizeY
    else VScroll.PageSize := 101;
  VScroll.Visible := PageSizeY < 100;
end;

function TRTDisplay32.Big2Small(Src: PBytes; SSize, DSize, DCount: cardinal): PBytes;
var
  I, J : cardinal;
  S, D : cardinal;
begin
  GetMem( result, DCount );
  I := 0;
  J := 0;
  S := SSize;
  D := 0;
  while J < DCount do
    begin
      if S < D
        then
          begin
            inc(I);
            inc(S, SSize);
          end;
      if (D - S) >= DSize
        then result[J] := Src[I]
        else
          if (Src[I] = Sample_Excluded) or (Src[I + 1] = Sample_Excluded)
            then result[J] := Src[I] + Src[I + 1] - Sample_Excluded
            else result[J] := (Src[I] * (D - S) + Src[I + 1] * (DSize - (D - S))) div DSize;
      inc(J);
      inc(D, DSize);
    end;
end;

procedure TRTDisplay32.Center;
begin
  CenterScrollBars;
  RefreshGlance;
end;

procedure TRTDisplay32.CenterScrollBars;
begin
  HScroll.OnChange := nil;
  HScroll.Position := (100 - HScroll.PageSize + 1) div 2;
  HScroll.OnChange := ScrollChange;

  VScroll.OnChange := nil;
  VScroll.Position := (100 - VScroll.PageSize + 1) div 2;
  VScroll.OnChange := ScrollChange;
end;

procedure TRTDisplay32.ClearBeams;
begin
  with Board.Canvas do
  begin
    Pen.Style := psClear;
    Brush.Style := bsClear;
    Brush.Color := TransparentColor;
    Rectangle( ClipRect );
  end;
  RefreshGlance;
end;

constructor TRTDisplay32.Create(AOwner: TComponent);
var
  fSize : integer;
begin
  inherited Create( AOwner );
  //General
  Height := 115;
  Width := 115;
  Constraints.MinHeight := 115;
  Constraints.MinWidth := 115;
  OnResize := Resize;

  fSize := Minor( Width-ScrollBarsSize, Height-ScrollBarsSize );
  fPaintRect := Rect( 0, 0, fSize, fSize );

  //Init Data
  InitData;
  //Radar
  InitRadar;
  //Map
  Map := nil;
  OutlineMap := nil;
  //ColorScale
//  fColorScale := nil;
  fColorScale := DefaultColorScale;
  //Board
  InitBoard;
  //ScrollBars
  InitScrollBars;
  //Glance
  InitGlance;
  //Rings
  InitRings;
end;

function TRTDisplay32.DefaultColorScale: TScale;
var
  Buffer : array of string;
begin
  try
    SetLength( Buffer, 18 );
    Buffer[0]  := 'Potencia';
    Buffer[1]  := ' 16 0';
    Buffer[2]  := '   0 200 200 200 ';
    Buffer[3]  := '  18 148 217 220 ';
    Buffer[4]  := '  19 120 181 199 ';
    Buffer[5]  := '  20  81 152 204 ';
    Buffer[6]  := '  21 113 108 185 ';
    Buffer[7]  := '  22  44 131 156 ';
    Buffer[8]  := '  23  67 190 169 ';
    Buffer[9]  := '  63  48 199 123 ';
    Buffer[10] := '  64  75 164  60 ';
    Buffer[11] := '  65 151 170  85 ';
    Buffer[12] := '  66 207 197  58 ';
    Buffer[13] := '  67 228 242 134 ';
    Buffer[14] := '  68 254 207  67 ';
    Buffer[15] := '  69 243 153  80 ';
    Buffer[16] := '  70 255   0   0 ';
    Buffer[17] := ' 198 210  36 180 ';
    result := TScale.Load( Buffer );
  finally
    Buffer := nil;
  end;
end;

function TRTDisplay32.DegreeToRadian(Degree: double): extended;
begin
  result := Degree * (PI / 180);
end;

destructor TRTDisplay32.Destroy;
begin
  OnResize := nil;
  DoneScrollBars;
  DoneRadar;
  DoneBoard;
  DoneGlance;
  if Assigned( Map )
    then Map.Free;
  if Assigned( OutlineMap )
    then OutlineMap.Free;
  inherited;
end;

procedure TRTDisplay32.DoneBoard;
begin
  Board.Free;
  Rings.Free;
end;

procedure TRTDisplay32.DoneGlance;
begin
  Glance.Free;
  AuxGlance.Free;
end;

procedure TRTDisplay32.DoneRadar;
begin
  Radar.Free;
end;

procedure TRTDisplay32.DoneScrollBars;
begin
  HScroll.OnChange := nil;
  HScroll.OnEnter := nil;
  VScroll.OnChange := nil;
  VScroll.OnEnter := nil;
  HScroll.Free;
  VScroll.Free;
end;

function TRTDisplay32.GetBoardScale: integer;
begin
  result := Round( Range / fBoardRange );
end;

function TRTDisplay32.GetMapRange: integer;
begin
  if Assigned( Map )
    then result := Map.Width div 2
    else result := 0;
end;

function TRTDisplay32.GetRange: integer;
begin
  result := fCellCount * fCellSize;
end;

function TRTDisplay32.GetSnippetHeight: integer;
begin
  result := SnippetSize.Y;
end;

function TRTDisplay32.GetSnippetRect(Origin, Size: TPoint): TRect;
begin
  Result := Rect( Origin.X, Origin.Y, Origin.X+Size.X, Origin.Y+Size.Y );
end;

function TRTDisplay32.GetSnippetSize: TPoint;
var
  SizeX, SizeY : integer;
begin
  if fZoom > 0
    then
      begin
        if 100 * PaintRect.Right div Zoom <= fBoardRange*2
          then SizeX := 100 * PaintRect.Right div Zoom
          else SizeX := fBoardRange*2;
        if 100 * PaintRect.Bottom div Zoom <= fBoardRange*2
          then SizeY := 100 * PaintRect.Bottom div Zoom
          else SizeY := fBoardRange*2;
      end
    else
      begin
        SizeX := fBoardRange * 2;
        SizeY := fBoardRange * 2;
      end;
  result := Point( SizeX, SizeY );
end;

function TRTDisplay32.GetSnippetWidth: integer;
begin
  result := SnippetSize.X;
end;

procedure TRTDisplay32.InitBoard;
begin
  Board := TBitmap32.Create;

  //Rings
  Rings := TBitmap32.Create;

  ResizeBoard;
end;

procedure TRTDisplay32.InitData;
begin
  TransparentColor := DefaultTransparentColor;
  fMapScale := 1000;
  PageSizeX := 0;
  PageSizeY := 0;
  fCellCount := 3000;
  fCellSize := 150;
  fMapPath := '';
  fBackgroundColor := DefaultBackground;
  fPPI_RHI := true;
  fBeamWidth := 1.5;
  fShowMap := false;
  fZoom := 100;
  fBoardRange := DefaultBoardRange;
end;

procedure TRTDisplay32.InitGlance;
begin
  Glance := TBitmap32.Create;

  AuxGlance := TBitmap32.Create;
  AdjustGlance;
end;

procedure TRTDisplay32.InitRadar;
begin
  Radar := TBitmap32.Create;
  Radar.Width := RadarSize;
  Radar.Height := RadarSize;
//  Radar.Canvas.Ellipse( Radar.Canvas.ClipRect );
end;

procedure TRTDisplay32.InitRings;
begin
  fRingsColor := clWhite;
  fRingDistance := 100000;
  fShowRings := false;
end;

procedure TRTDisplay32.InitScrollBars;
begin
  //Horizontal Scroll Bar
  HScroll := TScrollBar.Create( Self );
  HScroll.Parent := self;
  HScroll.Kind := sbHorizontal;
  HScroll.LargeChange := 10;
  HScroll.SmallChange := 1;
  HScroll.Min := 0;
  HScroll.Max := 100;
  HScroll.OnChange := ScrollChange;
  HScroll.Height := ScrollBarsSize;
  HScroll.Left := 0;
  HScroll.OnEnter := PassFocus;

  //Vertical Scroll Bar
  VScroll := TScrollBar.Create( Self );
  VScroll.Parent := self;
  VScroll.Kind := sbVertical;
  VScroll.LargeChange := 10;
  VScroll.SmallChange := 1;
  VScroll.Min := 0;
  VScroll.Max := 100;
  VScroll.OnChange := ScrollChange;
  VScroll.Width := ScrollBarsSize;
  VScroll.Top := 0;
  VScroll.OnEnter := PassFocus;

  ResizeScrollBars;
  AdjustScrollBars;
end;

function TRTDisplay32.InterceptRatio(Ratio, Angle: double): T2DCoord;
begin
  Angle := NormalizeAngle( Angle );
  Result.X := Ratio * Sin( DegreeToRadian( Angle ) );
  Result.Y := Ratio * Cos( DegreeToRadian( Angle ) );
end;

function TRTDisplay32.Major(const Size1, Size2: integer): integer;
begin
  if Size1 > Size2
    then result := Size1
    else Result := Size2;
end;

function TRTDisplay32.Minor(const Size1, Size2: integer): integer;
begin
  if Size1 < Size2
    then result := Size1
    else Result := Size2;
end;

function TRTDisplay32.NormalizeAngle(Angle: double): Double;
begin
  Result := (Trunc( Angle ) mod 360) + Frac( Angle );
  if Result < 0
    then Result := Result + 360;
end;

procedure TRTDisplay32.Paint;
var
  Area : TRect;
begin
  inherited;
  if csDesigning in ComponentState
    then
      begin
        fPaintRect := Rect( 0, 0, Width-ScrollBarsSize-ScaleWidth-1, Height-ScrollBarsSize-1 );
        AdjustGlance;
        ResizeScrollBars;
        AdjustScrollBars;
        CenterScrollBars;
        RefreshGlance;
      end;

  Glance.DrawTo( Canvas.Handle, 0, 0 );
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Color := fBackgroundColor;
  Canvas.Brush.Style := bsSolid;
  Canvas.Brush.Color := fBackgroundColor;
  //Borrando el background
  if (not VScroll.Visible) and (not HScroll.Visible)
    then
      begin
        Area := Rect( 0, fPaintRect.Bottom-1, Width, Height );
        Canvas.Rectangle( Area );
        Area := Rect( fPaintRect.Right-1, 0, Width, Height-HScroll.Height-1 );
        PaintScale( Area );
      end
    else
      begin
       Area := Rect( HScroll.Width, fPaintRect.Bottom, Width, Height );
       Canvas.Rectangle( Area );
       Area := Rect( HScroll.Width + VScroll.Width + 2, 0, Width, Height-HScroll.Height );
       PaintScale( Area );
      end;
end;

procedure TRTDisplay32.PaintScale(Area: TRect);
var
  i, ZoneHeight : integer;
  Zone : TRect;
begin
  if Assigned( fColorScale )
    then
      begin
        ZoneHeight := (Area.Bottom-Area.Top+1) div fColorScale.Size;
        Canvas.Pen.Color := clWhite;
        for i := 0 to fColorScale.Size-1 do
        begin
          Zone := Rect( Area.Left, Area.Bottom-((i+1)*ZoneHeight), Area.Right, Area.Bottom-(i*ZoneHeight) );
          Canvas.Brush.Color := fColorScale.Colors[ i ];
          Canvas.Rectangle( Zone );
          Canvas.TextOut( Zone.Left + (((Zone.Right - Zone.Left)-(Canvas.TextWidth( IntToStr( fColorScale.Value[ i ] ) ))) div 2),
                          Zone.Top + (((Zone.Bottom - Zone.Top)-(Canvas.TextHeight( IntToStr( fColorScale.Value[ i ] ) ))) div 2),
                          IntToStr( fColorScale.Value[ i ] ) );
        end;
        Canvas.Pen.Color := fBackgroundColor;
        Canvas.Brush.Color := fBackgroundColor;
        Zone := Rect( Area.Left, Area.Top, Area.Right, Area.Bottom - (fColorScale.Size * ZoneHeight) );
        Canvas.Rectangle( Zone );
      end
    else
      begin
        Canvas.Pen.Color := fBackgroundColor;
        Canvas.Brush.Color := fBackgroundColor;
        Canvas.Rectangle( Area );
      end;
end;

procedure TRTDisplay32.PassFocus(Sender: TObject);
begin
  SetFocus;
end;

procedure TRTDisplay32.RefreshGlance;
var
  CopyArea, MapArea : TRect;
  RadarLoc : TPoint;
begin
  if csLoading in ComponentState
    then exit;

  //Custom Paint
  SnippetSize := GetSnippetSize;

  //Horizontal Scroll Bar
  if PageSizeX < 101
    then ScrollX := HScroll.Position * (Board.Width-SnippetSize.X) div (100 - HScroll.PageSize + 1)
    else ScrollX := ((fBoardRange*2) - SnippetSize.X) div 2;

  //Vertical Scroll Bar
  if PageSizeY < 101
    then ScrollY := VScroll.Position * (Board.Height-SnippetSize.Y) div (100 - VScroll.PageSize + 1)
    else ScrollY := ((fBoardRange*2)-SnippetSize.Y) div 2;

  Glance.Clear( Color32( MapColor ) );
  CopyArea := GetSnippetRect( Point( ScrollX, ScrollY ), SnippetSize );
  if fShowMap or fShowOutLine
    then
      MapArea := Rect( Round( MapRange + ((BoardScale/MapScale)*(CopyArea.Left-BoardRange) ) ),
                       Round( MapRange - ((BoardScale/MapScale)*(BoardRange-CopyArea.Top) ) ),
                       Round( MapRange + ((BoardScale/MapScale)*(CopyArea.Right-BoardRange) ) ),
                       Round( MapRange - ((BoardScale/MapScale)*(BoardRange-CopyArea.Bottom) ) ));

  if fShowMap and Assigned( Map )
    then
      begin
        Glance.Draw( fPaintRect, MapArea, Map );
        AuxGlance.Draw( fPaintRect, CopyArea, Board );
        Glance.Draw( 0, 0, AuxGlance );
      end
    else
      begin
        Glance.Clear( Color32( fMapColor ) );
        AuxGlance.Draw( fPaintRect, CopyArea, Board );
        Glance.Draw( 0, 0, AuxGlance );
      end;

  if fShowRings and (fRingDistance > 0) and (fRingDistance < Range)
    then
      begin
//        AuxGlance.TransparentColor := DefaultTransparentColor;
//        AuxGlance.Canvas.CopyRect( fPaintRect, Rings.Canvas, CopyArea );
//        Glance.Canvas.Draw( 0, 0, AuxGlance );
      end;

  if fShowOutLine and Assigned( OutlineMap )
    then
      begin
//        AuxGlance.TransparentColor := clBlack;
//        AuxGlance.Canvas.CopyRect( fPaintRect, OutlineMap.Canvas, MapArea );
//        Glance.Canvas.Draw( 0, 0, AuxGlance );
      end;

  if fShowRadar
    then
      begin
        RadarLoc := Point( ((Board.Width div 2)-ScrollX), ((Board.Height div 2)-ScrollY) );
        if ((RadarLoc.X >= 0) and (RadarLoc.X <= SnippetSize.X )) and
           ((RadarLoc.Y >= 0) and (RadarLoc.Y <= SnippetSize.Y ))
          then
            begin
              RadarLoc := Point( (RadarLoc.X * Glance.Width div SnippetSize.X)-(RadarSize div 2),
                                 (RadarLoc.Y * Glance.Height div SnippetSize.Y)-(RadarSize div 2) );
//              Glance.Canvas.Draw( RadarLoc.X, RadarLoc.Y, Radar );
            end;
      end;
  if not (csDesigning in ComponentState)
    then Invalidate;
end;

procedure TRTDisplay32.PaintRings;
var
  Ratio, IncRatio : word;
  Area  : TRect;
  Dx, Dy : integer;
begin
  Rings.Canvas.Brush.Style := bsSolid;
  Rings.Canvas.Brush.Color := DefaultTransparentColor;
  Rings.Canvas.Rectangle( Rings.Canvas.ClipRect );
  if csLoading in ComponentState
    then exit;
  Rings.Canvas.Pen.Color := fRingsColor;
  Rings.Canvas.Brush.Style := bsClear;
  if (fRingDistance > 0) and (fRingDistance < Range)
    then
      begin
        IncRatio := fRingDistance div BoardScale;
        Ratio := IncRatio;
        while Ratio <= BoardRange do
        begin
          Area := Rect( 0, 0, Ratio*2, Ratio*2 );
          Dx := BoardRange - Ratio;
          Dy := BoardRange - Ratio;
          OffsetRect( Area, Dx, Dy );
          Rings.Canvas.Ellipse( Area );
          Inc( Ratio, IncRatio );
        end;
      end;
end;

procedure TRTDisplay32.Resize(Sender: TObject);
begin
  if csDesigning in ComponentState
    then Invalidate
    else
      begin
        fPaintRect := Rect( 0, 0, Width-ScrollBarsSize-ScaleWidth, Height-ScrollBarsSize );
        AdjustGlance;
        ResizeScrollBars;
        AdjustScrollBars;
        CenterScrollBars;
        RefreshGlance;
      end;
end;

procedure TRTDisplay32.ResizeBoard;
var
  Bitmap : TBitmap32;
  Area : TRect;
begin
  Bitmap := TBitmap32.Create;
  try
    Bitmap.Width := Board.Width;
    Bitmap.Height := Board.Height;
//    Bitmap.Canvas.Draw( 0, 0, Board );

    Board.Width := fBoardRange * 2;
    Board.Height := fBoardRange * 2;
//    Board.Canvas.Rectangle( Board.Canvas.ClipRect );

    Rings.Width := fBoardRange * 2;
    Rings.Height := fBoardRange * 2;
    PaintRings;

    if Bitmap.Width < Board.Width
     then
       begin
         Area := Bitmap.Canvas.ClipRect;
         OffsetRect( Area, (Board.Width-Bitmap.Width) div 2, (Board.Width-Bitmap.Width) div 2 );
         Board.Canvas.CopyRect( Area, Bitmap.Canvas, Bitmap.Canvas.ClipRect );
       end
     else
       begin
         Area := Board.Canvas.ClipRect;
         OffsetRect( Area, (Bitmap.Width-Board.Width) div 2, (Bitmap.Width-Board.Width) div 2 );
         Board.Canvas.CopyRect( Board.Canvas.ClipRect, Bitmap.Canvas, Area );
       end;
  finally
    Bitmap.Free;
  end;
end;

procedure TRTDisplay32.ResizeScrollBars;
begin
  HScroll.Width := fPaintRect.Right;
  HScroll.Top := fPaintRect.Bottom + 1;

  VScroll.Height := fPaintRect.Bottom;
  VScroll.Left := fPaintRect.Right + 1;
end;

procedure TRTDisplay32.ScrollChange(Sender: TObject);
begin
  if HScroll.Position + HScroll.PageSize  > 101
    then
      begin
        HScroll.OnChange := nil;
        HScroll.Position := 100 - HScroll.PageSize + 1;
        HScroll.OnChange := ScrollChange;
      end;
  if VScroll.Position + VScroll.PageSize > 101
    then
      begin
        VScroll.OnChange := nil;
        VScroll.Position := 100 - VScroll.PageSize + 1;
        VScroll.OnChange := ScrollChange;
      end;
  RefreshGlance;
end;

procedure TRTDisplay32.SetBackgroundColor(const Value: TColor);
begin
  fBackgroundColor := Value;
  Invalidate;
end;

procedure TRTDisplay32.SetBoardRange(const Value: integer);
begin
  fBoardRange := Value;
  ResizeBoard;
  AdjustScrollBars;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetCellCount(const Value: integer);
begin
  fCellCount := Value;
  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetCellSize(const Value: integer);
begin
  fCellSize := Value;
  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetColorScalePath(const Value: TFileName);
begin
  if (FileExists( Value )) and (ExtractFileExt(Value)='.pal')
    then
      try
        fColorScalePath := Value;
        fColorScale := TScale.Load( fColorScalePath );
        TransparentColor := fColorScale.ValueColor[ 0 ];
      except
        fColorScale := DefaultColorScale;
        TransparentColor := fColorScale.ValueColor[ 0 ];
        fColorScalePath := '';
      end
    else
      begin
        fColorScale := DefaultColorScale;
        TransparentColor := fColorScale.ValueColor[ 0 ];
        fColorScalePath := '';
      end;
  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetMapColor(const Value: TColor);
begin
  fMapColor := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetMapPath(const Value: TFileName);
begin
  if (FileExists( Value )) and (ExtractFileExt(Value)='.bmp')
    then
      begin
        fMapPath := Value;
        if not Assigned( Map )
          then Map := TBitmap32.Create;
        Map.LoadFromFile( fMapPath );
      end
    else
      begin
        fMapPath := '';
        if Assigned( Map )
          then Map.Free;
        Map := nil;
      end;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetMapScale(const Value: integer);
begin
  fMapScale := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetOutLineMap(const Value: boolean);
begin
  if fPPI_RHI
    then fShowOutLine := Value
    else fShowOutLine := false;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetOutlinePath(const Value: TFileName);
begin
  if (FileExists( Value )) and (ExtractFileExt(Value)='.bmp')
    then
      begin
        fOutlinePath := Value;
        if not Assigned( OutlineMap )
          then OutlineMap := TBitmap32.Create;
        OutlineMap.LoadFromFile( fOutlinePath );
      end
    else
      begin
        fOutlinePath := '';
        if Assigned( OutlineMap )
          then OutlineMap.Free;
        OutlineMap := nil;
      end;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetPaintRect(const Value: TRect);
begin
  fPaintRect := Value;
end;

procedure TRTDisplay32.SetPPI_RHI(const Value: boolean);
begin
  fPPI_RHI := Value;
  if not fPPI_RHI
    then fShowMap := false;
  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetRingDistance(const Value: integer);
begin
  fRingDistance := Value;
  PaintRings;
  if fShowRings
    then RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetRingsColor(const Value: TColor);
begin
  fRingsColor := Value;
  PaintRings;
  if fShowRings
    then RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetShowMap(const Value: boolean);
begin
  if fPPI_RHI
    then fShowMap := Value
    else fShowMap := false;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetShowRadar(const Value: boolean);
begin
  fShowRadar := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetShowRings(const Value: boolean);
begin
  fShowRings := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay32.SetZoom(const Value: integer);
begin
  fZoom := Value;
  AdjustScrollBars;
  ScrollChange( nil );
  if csDesigning in ComponentState
    then Invalidate;
end;

function TRTDisplay32.Small2Big(Src: PBytes; SSize, DSize, DCount: cardinal): PBytes;
var
  V, M : integer;

  procedure AddCell( Cell, Size : integer );
  begin
    if Cell <> Sample_Excluded
      then
        begin
          inc(M, Size);
          inc(V, Cell * Size);
        end;
  end;

var
  I, J : cardinal;
  S, D : cardinal;
begin
  GetMem( result, DCount );
  S := 0;
  D := 0;
  I := 0;
  J := 0;
  while J < DCount do
    begin
      V := 0;
      M := 0;
      AddCell(Src[I], SSize - (D - S));
      inc(I);
      inc(S, SSize);
      inc(D, DSize);
      while D - S >= SSize do
        begin
          AddCell(Src[I], SSize);
          inc(I);
          inc(S, SSize);
        end;
      AddCell(Src[I], D - S);
      if M > 0
        then result[J] := V div M
        else result[J] := Data_Excluded;
      inc(J);
    end;
end;

function TRTDisplay32.StretchCells(Src: PBytes; SrcSize, DstSize, DstCount: cardinal): PBytes;
begin
  if SrcSize <= DstSize
    then result := Small2Big( Src, SrcSize, DstSize, DstCount)
    else result := Big2Small( Src, SrcSize, DstSize, DstCount);
end;

function TRTDisplay32.TranslatePoint(PointRange: word; aRange, Ratio: double; Point: T2DCoord): TPoint;
begin
  Result.X := (PointRange - TranslateX( PointRange, aRange, Ratio)) + TranslateX( PointRange, aRange, (Ratio + Point.X) );
  Result.Y := (PointRange - TranslateX( PointRange, aRange, Ratio)) + TranslateX( PointRange, aRange, (Ratio - Point.Y) );
end;

function TRTDisplay32.TranslateX(PointRange: word; aRange, X: double): word;
begin
  result := Trunc( X * PointRange / aRange);
end;

procedure TRTDisplay32.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

end.
