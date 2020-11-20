unit RTDisplay;

interface

uses
  Windows, SysUtils, Classes, Controls, StdCtrls, Types, Graphics, Dialogs, Messages, Themes, Scale, Measure;

const
  NoData = 255;
  RadarSize = 5;
  DefaultBoardRange = 500;
  ScrollBarsSize = 15;
  Sample_Excluded = $FFFF;
  Data_Excluded   = $FF;
  DefaultTransparentColor = clBtnFace;
  DefaultBackground = clBtnFace;
  ScaleWidth = 30;
  DBZOffset = 80;

type
  PBytes = ^TBytes;
  TBytes = array[0..0] of byte;
  PSingles = ^TSingles;
  TSingles = array[0..0] of single;

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

  TDataType = (dtDBZ, dtDBT, dtSpeed, dtSpectrum, dtPowerZ, dtPowerT);

type
  TRTDisplay = class(TCustomControl)
  private
    fColorScale : TScale;
    fColorScalePath,
    fOutlinePath : TFileName;
    fPaintRect : TRect;
    Rings,
    Radar,
    Map,
    OutlineMap,
    Board,
    Glance, AuxGlance : TBitmap;
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
    fOnPaint : TNotifyEvent;
    fDataType : TDataType;
    fMeasure : TMeasure;
    fPotMet : double;
    procedure SetPotMet(const Value: double);
  private
    function  GetSnippetHeight: integer;
    function  GetSnippetWidth: integer;
    function  DefaultDBScale : TScale;
    function  DefaultDBZScale : TScale;
    function  DefaultVScale : TScale;
    function  DefaultWScale : TScale;
    function  DefaultColorScale : TScale;
    function  GetMapRange: integer;
    function  GetRange: integer;
    function  GetBoardScale: integer;

    procedure SetOutLineMap(const Value: boolean);
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
    procedure SetDataType(const Value: TDataType);

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
    function  Small2Big( Src : PSingles; SSize, DSize, SCount, DCount : cardinal ): PSingles;
    function  Big2Small( Src : PSingles; SSize, DSize, SCount, DCount : cardinal ): PSingles;
    function  StretchCells( Src : PSingles; SrcSize, DstSize, SrcCount, DstCount : cardinal ) : PSingles;
    procedure CenterScrollBars;
    procedure PaintScale( Area : TRect );
  protected
    procedure Paint; override;
    procedure WMEraseBkgnd( var Message : TWmEraseBkgnd ); message WM_ERASEBKGND;
    procedure WMMOUSEWHEEL( var Message : TWMMouseWheel ); message WM_MOUSEWHEEL;
    procedure WMLBUTTONDOWN( var Message : TWMLButtonDown ); message WM_LBUTTONDOWN;
  public
    HScroll,
    VScroll : TScrollBar;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure AddBeam( Az, El : double; RawCellSize, RawCellCount : integer; Data : PSingles );
    procedure AddBeamWithoutPaint( Az, El : double; RawCellSize, RawCellCount : integer; Data : PSingles );
    procedure RefreshGlance;
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
    property BoardImage : TBitmap read Board;
    property ColorScale : TScale read fColorScale;
    property NoDataColor : TColor read TransparentColor;
    property Canvas;
  public
    procedure Center;
  published
    property PotMet : double read fPotMet write SetPotMet;
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
    property DataType : TDataType read fDataType write SetDataType;
    property Zoom : integer read fZoom write SetZoom;
    property MapScale : integer read fMapScale write SetMapScale;
    property BoardRange : integer read fBoardRange write SetBoardRange;
    property Measure : TMeasure read fMeasure;

    //Rings
    property ShowRings : boolean read fShowRings write SetShowRings;
    property RingsColor : TColor read fRingsColor write SetRingsColor;
    property RingDistance : integer read fRingDistance write SetRingDistance;

    property Align;
    property Anchors;
    property PopupMenu;
    //Events
    property OnPaint : TNotifyEvent read fOnPaint write fOnPaint;
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

uses
  Forms, Math;

const
  GaseousAttenuation    = 0.016;  


procedure Register;
begin
  RegisterComponents('Vesta', [TRTDisplay]);
end;

{ TRTDisplay }

procedure TRTDisplay.AddBeam(Az, El: double; RawCellSize, RawCellCount: integer; Data: PSingles);
begin
  AddBeamWithoutPaint( Az, El, RawCellSize, RawCellCount, Data );
  RefreshGlance;
end;

procedure TRTDisplay.AdjustGlance;
begin
  Glance.Width := fPaintRect.Right;
  Glance.Height := fPaintRect.Bottom;
  AuxGlance.Width := fPaintRect.Right;
  AuxGlance.Height := fPaintRect.Bottom;
end;

procedure TRTDisplay.AdjustScrollBars;
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

function TRTDisplay.Big2Small(Src: PSingles; SSize, DSize, SCount, DCount: cardinal): PSingles;
var
  I, J : cardinal;
  S, D : cardinal;
begin
  result := AllocMem(DCount * sizeof(single));
  I := 0;
  J := 0;
  S := SSize;
  D := 0;
  while J < DCount do
    begin
      if S <= D
        then
          begin
            inc(I);
            if I > SCount then Break;
            inc(S, SSize);
          end;
      if (D - S) >= DSize
        then result[J] := Src[I]
        else
          if SCount - I > 0
            then result[J] := (Src[I] * (D - S) + Src[I + 1] * (DSize - (D - S))) / DSize
            else result[J] := (Src[I] * (D - S)) / DSize;
      inc(J);
      inc(D, DSize);
    end;
end;

procedure TRTDisplay.Center;
begin
  CenterScrollBars;
  RefreshGlance;
end;

procedure TRTDisplay.CenterScrollBars;
begin
  HScroll.OnChange := nil;
  HScroll.Position := (100 - HScroll.PageSize + 1) div 2;
  HScroll.OnChange := ScrollChange;

  VScroll.OnChange := nil;
  VScroll.Position := (100 - VScroll.PageSize + 1) div 2;
  VScroll.OnChange := ScrollChange;
end;

procedure TRTDisplay.ClearBeams;
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

constructor TRTDisplay.Create(AOwner: TComponent);
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

  //ColorScale
  fColorScale := DefaultColorScale;
  //Init Data
  InitData;
  //Radar
  InitRadar;
  //Map
  Map := nil;
  OutlineMap := nil;
  //Board
  InitBoard;
  //ScrollBars
  InitScrollBars;
  //Glance
  InitGlance;
  //Rings
  InitRings;
end;

function TRTDisplay.DefaultColorScale: TScale;
begin
  case fDataType of
    dtDBT,
    dtDBZ      : result := DefaultDBZScale;
    dtPowerZ,
    dtPowerT   : result := DefaultDBScale;
    dtSpeed    : result := DefaultVScale;
    dtSpectrum : result := DefaultWScale;
  else
    result := DefaultDBZScale;
  end;
end;

function TRTDisplay.DegreeToRadian(Degree: double): extended;
begin
  result := Degree * (PI / 180);
end;

destructor TRTDisplay.Destroy;
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

procedure TRTDisplay.DoneBoard;
begin
  Board.Free;
  Rings.Free;
end;

procedure TRTDisplay.DoneGlance;
begin
  Glance.Free;
  AuxGlance.Free;
end;

procedure TRTDisplay.DoneRadar;
begin
  Radar.Free;
end;

procedure TRTDisplay.DoneScrollBars;
begin
  HScroll.OnChange := nil;
  HScroll.OnEnter := nil;
  VScroll.OnChange := nil;
  VScroll.OnEnter := nil;
  HScroll.Free;
  VScroll.Free;
end;

function TRTDisplay.GetBoardScale: integer;
begin
  result := Round( Range / fBoardRange );
end;

function TRTDisplay.GetMapRange: integer;
begin
  if Assigned( Map )
    then result := Map.Width div 2
    else result := 0;
end;

function TRTDisplay.GetRange: integer;
begin
  result := fCellCount * fCellSize;
end;

function TRTDisplay.GetSnippetHeight: integer;
begin
  result := SnippetSize.Y;
end;

function TRTDisplay.GetSnippetRect(Origin, Size: TPoint): TRect;
begin
  Result := Rect( Origin.X, Origin.Y, Origin.X+Size.X, Origin.Y+Size.Y );
end;

function TRTDisplay.GetSnippetSize: TPoint;
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

function TRTDisplay.GetSnippetWidth: integer;
begin
  result := SnippetSize.X;
end;

procedure TRTDisplay.InitBoard;
begin
  Board := TBitmap.Create;
  Board.PixelFormat := pf24bit;
  Board.Canvas.Pen.Style := psSolid;
  Board.Canvas.Brush.Style := bsSolid;
  Board.Canvas.Pen.Color := TransparentColor;
  Board.Canvas.Brush.Color := TransparentColor;

  //Rings
  Rings := TBitmap.Create;
  Rings.PixelFormat := pf24bit;
  Rings.Canvas.Pen.Style := psSolid;
  Rings.Canvas.Brush.Style := bsSolid;
  Rings.Canvas.Pen.Color := fRingsColor;
  Rings.Canvas.Brush.Color := DefaultTransparentColor;

  ResizeBoard;
end;

procedure TRTDisplay.InitData;
begin
//  TransparentColor := DefaultTransparentColor;
  TransparentColor := fColorScale.ValueColor[ 0 ];
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

procedure TRTDisplay.InitGlance;
begin
  Glance := TBitmap.Create;
  Glance.PixelFormat := pf24bit;
  Glance.Canvas.Pen.Style := psSolid;
  Glance.Canvas.Pen.Color := fMapColor;
  Glance.Canvas.Brush.Style := bsSolid;
  Glance.Canvas.Brush.Color := fMapColor;

  AuxGlance := TBitmap.Create;
  AuxGlance.PixelFormat := pf24bit;
  AuxGlance.Canvas.Pen.Style := psSolid;
  AuxGlance.Canvas.Brush.Style := bsSolid;
  AuxGlance.Canvas.Pen.Color := fMapColor;
  AuxGlance.Canvas.Brush.Color := fMapColor;
  AuxGlance.Transparent := true;
  AdjustGlance;
end;

procedure TRTDisplay.InitRadar;
begin
  Radar := TBitmap.Create;
  Radar.PixelFormat := pf24bit;
  Radar.Canvas.Pen.Style := psSolid;
  Radar.Canvas.Brush.Style := bsSolid;
  Radar.Canvas.Pen.Color := TransparentColor;
  Radar.Canvas.Brush.Color := TransparentColor;
  Radar.TransparentColor := TransparentColor;
  Radar.Transparent := true;
  Radar.Width := RadarSize;
  Radar.Height := RadarSize;
  Radar.Canvas.Pen.Color := clRed;
  Radar.Canvas.Brush.Color := clRed;
  Radar.Canvas.Ellipse( Radar.Canvas.ClipRect );
end;

procedure TRTDisplay.InitRings;
begin
  fRingsColor := clWhite;
  fRingDistance := 100000;
  fShowRings := false;
end;

procedure TRTDisplay.InitScrollBars;
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

function TRTDisplay.InterceptRatio(Ratio, Angle: double): T2DCoord;
begin
  Angle := NormalizeAngle( Angle );
  Result.X := Ratio * Sin( DegreeToRadian( Angle ) );
  Result.Y := Ratio * Cos( DegreeToRadian( Angle ) );
end;

function TRTDisplay.Major(const Size1, Size2: integer): integer;
begin
  if Size1 > Size2
    then result := Size1
    else Result := Size2;
end;

function TRTDisplay.Minor(const Size1, Size2: integer): integer;
begin
  if Size1 < Size2
    then result := Size1
    else Result := Size2;
end;

function TRTDisplay.NormalizeAngle(Angle: double): Double;
begin
  Result := (Trunc( Angle ) mod 360) + Frac( Angle );
  if Result < 0
    then Result := Result + 360;
end;

procedure TRTDisplay.Paint;
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

  Canvas.Draw( 0, 0, Glance );
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
  if Assigned( fOnPaint )
    then fOnPaint( self );      
end;

procedure TRTDisplay.PaintScale(Area: TRect);
var
  i, ZoneHeight : integer;
  Zone : TRect;
  Measure : TMeasure;
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
          Canvas.TextOut( Zone.Left + (((Zone.Right - Zone.Left)-(Canvas.TextWidth( IntToStr( Trunc(CodeMeasure( fColorScale.Value[ i ], fMeasure ))) ))) div 2),
                          Zone.Top + (((Zone.Bottom - Zone.Top)-(Canvas.TextHeight( IntToStr( Trunc(CodeMeasure( fColorScale.Value[ i ], fMeasure ))) ))) div 2),
                          IntToStr( Trunc(CodeMeasure( fColorScale.Value[ i ], fMeasure ))) );
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

procedure TRTDisplay.PassFocus(Sender: TObject);
begin
  SetFocus;
end;

procedure TRTDisplay.RefreshGlance;
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

  Glance.Canvas.Brush.Color := MapColor;
  Glance.Canvas.Pen.Color := MapColor;
  Glance.Canvas.Rectangle( Glance.Canvas.ClipRect );
  CopyArea := GetSnippetRect( Point( ScrollX, ScrollY ), SnippetSize );
  if fShowMap or fShowOutLine
    then
      MapArea := Rect( Round( MapRange + ((BoardScale/MapScale)*(CopyArea.Left-BoardRange) ) ),
                       Round( MapRange - ((BoardScale/MapScale)*(BoardRange-CopyArea.Top) ) ),
                       Round( MapRange + ((BoardScale/MapScale)*(CopyArea.Right-BoardRange) ) ),
                       Round( MapRange - ((BoardScale/MapScale)*(BoardRange-CopyArea.Bottom) ) ));

  AuxGlance.TransparentColor := TransparentColor;
  if fShowMap and Assigned( Map )
    then
      begin
        Glance.Canvas.CopyRect( fPaintRect, Map.Canvas, MapArea );
        AuxGlance.Canvas.CopyRect( fPaintRect, Board.Canvas, CopyArea );
        Glance.Canvas.Draw( 0, 0, AuxGlance );
      end
    else
      begin
        Glance.Canvas.Brush.Color := fMapColor;
        Glance.Canvas.Pen.Color := fMapColor;
        Glance.Canvas.Rectangle( Glance.Canvas.ClipRect );
        AuxGlance.Canvas.CopyRect( fPaintRect, Board.Canvas, CopyArea );
        Glance.Canvas.Draw( 0, 0, AuxGlance );
      end;

  if fShowRings and (fRingDistance > 0) and (fRingDistance < Range)
    then
      begin
        AuxGlance.TransparentColor := DefaultTransparentColor;
        AuxGlance.Canvas.CopyRect( fPaintRect, Rings.Canvas, CopyArea );
        Glance.Canvas.Draw( 0, 0, AuxGlance );
      end;

  if fShowOutLine and Assigned( OutlineMap )
    then
      begin
        AuxGlance.TransparentColor := clBlack;
        AuxGlance.Canvas.CopyRect( fPaintRect, OutlineMap.Canvas, MapArea );
        Glance.Canvas.Draw( 0, 0, AuxGlance );
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
              Glance.Canvas.Draw( RadarLoc.X, RadarLoc.Y, Radar );
            end;
      end;
  if not (csDesigning in ComponentState)
    then Invalidate;
end;

procedure TRTDisplay.PaintRings;
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

procedure TRTDisplay.Resize(Sender: TObject);
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

procedure TRTDisplay.ResizeBoard;
var
  Bitmap : TBitmap;
  Area : TRect;
begin
  Bitmap := TBitmap.Create;
  try
    Bitmap.Width := Board.Width;
    Bitmap.Height := Board.Height;
    Bitmap.Canvas.Draw( 0, 0, Board );

    Board.Width := fBoardRange * 2;
    Board.Height := fBoardRange * 2;
    Board.Canvas.Rectangle( Board.Canvas.ClipRect );

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

procedure TRTDisplay.ResizeScrollBars;
begin
  HScroll.Width := fPaintRect.Right;
  HScroll.Top := fPaintRect.Bottom + 1;

  VScroll.Height := fPaintRect.Bottom;
  VScroll.Left := fPaintRect.Right + 1;
end;

procedure TRTDisplay.ScrollChange(Sender: TObject);
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

procedure TRTDisplay.SetBackgroundColor(const Value: TColor);
begin
  fBackgroundColor := Value;
  Invalidate;
end;

procedure TRTDisplay.SetBoardRange(const Value: integer);
begin
  fBoardRange := Value;
  ResizeBoard;
  AdjustScrollBars;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetCellCount(const Value: integer);
begin
  fCellCount := Value;
  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetCellSize(const Value: integer);
begin
  fCellSize := Value;
  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetColorScalePath(const Value: TFileName);
begin
  if (FileExists( Value )) and (UpperCase( ExtractFileExt(Value) ) =  UpperCase('.PAL'))
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

procedure TRTDisplay.SetMapColor(const Value: TColor);
begin
  fMapColor := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetMapPath(const Value: TFileName);
begin
  if (FileExists( Value )) and (ExtractFileExt(Value)='.bmp')
    then
      begin
        fMapPath := Value;
        if not Assigned( Map )
          then Map := TBitmap.Create;
        Map.PixelFormat := pf24bit;
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

procedure TRTDisplay.SetMapScale(const Value: integer);
begin
  fMapScale := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetOutLineMap(const Value: boolean);
begin
  if fPPI_RHI
    then fShowOutLine := Value
    else fShowOutLine := false;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetOutlinePath(const Value: TFileName);
begin
  if (FileExists( Value )) and (ExtractFileExt(Value)='.bmp')
    then
      begin
        fOutlinePath := Value;
        if not Assigned( OutlineMap )
          then OutlineMap := TBitmap.Create;
        OutlineMap.PixelFormat := pf24bit;
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

procedure TRTDisplay.SetPaintRect(const Value: TRect);
begin
  fPaintRect := Value;
end;

procedure TRTDisplay.SetPPI_RHI(const Value: boolean);
begin
  fPPI_RHI := Value;
  if not fPPI_RHI
    then fShowMap := false;
  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetRingDistance(const Value: integer);
begin
  fRingDistance := Value;
  PaintRings;
  if fShowRings
    then RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetRingsColor(const Value: TColor);
begin
  fRingsColor := Value;
  PaintRings;
  if fShowRings
    then RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetShowMap(const Value: boolean);
begin
  if fPPI_RHI
    then fShowMap := Value
    else fShowMap := false;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetShowRadar(const Value: boolean);
begin
  fShowRadar := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetShowRings(const Value: boolean);
begin
  fShowRings := Value;
  RefreshGlance;
  if csDesigning in ComponentState
    then Invalidate;
end;

procedure TRTDisplay.SetZoom(const Value: integer);
begin
  fZoom := Value;
  AdjustScrollBars;
  ScrollChange( nil );
  if csDesigning in ComponentState
    then Invalidate;
end;

function TRTDisplay.Small2Big(Src: PSingles; SSize, DSize, SCount, DCount: cardinal): PSingles;
var
  Area : single;
  SIndex, DIndex, S, D  : cardinal;
begin
  result := AllocMem(DCount * sizeof(single));
  S := 0;
  D := 0;
  SIndex := 0;
  DIndex := 0;
  while DIndex < DCount do
  begin
    Area := 0;
    if SIndex < SCount
      then Area := Area + Src[SIndex] * (SSize-(D-S))
      else exit;
    inc(SIndex);
    inc(S, SSize);
    inc(D, DSize);
    while D - S >= SSize do
    begin
      if SIndex < SCount
        then Area := Area + Src[SIndex] * SSize
        else exit;
      Inc(SIndex);
      Inc(S, SSize);
    end;
    if SIndex < SCount
      then Area := Area + Src[SIndex] * (D - S)
      else exit;
    result[DIndex] := Area / DSize;
    Inc(DIndex);
  end;
end;

function TRTDisplay.StretchCells(Src: PSingles; SrcSize, DstSize, SrcCount, DstCount: cardinal): PSingles;
begin
  if SrcSize < DstSize
    then result := Small2Big(Src, SrcSize, DstSize, SrcCount, DstCount)
    else result := Big2Small(Src, SrcSize, DstSize, SrcCount, DstCount);
end;

function TRTDisplay.TranslatePoint(PointRange: word; aRange, Ratio: double; Point: T2DCoord): TPoint;
begin
  Result.X := (PointRange - TranslateX( PointRange, aRange, Ratio)) + TranslateX( PointRange, aRange, (Ratio + Point.X) );
  Result.Y := (PointRange - TranslateX( PointRange, aRange, Ratio)) + TranslateX( PointRange, aRange, (Ratio - Point.Y) );
end;

function TRTDisplay.TranslateX(PointRange: word; aRange, X: double): word;
begin
  result := Trunc( X * PointRange / aRange);
end;

procedure TRTDisplay.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  Message.Result := 1;
end;

procedure TRTDisplay.AddBeamWithoutPaint(Az, El: double; RawCellSize, RawCellCount: integer; Data: PSingles);
var
  i : integer;
  Angle : double;
  DisplayCellCount : integer;
  MajorRatio, MinorRatio : double;
  LT, RT, RB, LB : T2DCoord;
  LeftTop, RightTop,
  RightBottom, LeftBottom : TPoint;
  TempBuffer : PSingles;
  Buffer : PBytes;
  ProjectedCellSize : integer;
  Distance : double;
begin
  if fPPI_RHI
    then
      begin
        Angle := Az;
        ProjectedCellSize := Abs( Round(RawCellSize * Cos( DegreeToRadian( El ) )) );
      end
    else
      begin
        Angle := 90 - El;
        ProjectedCellSize := RawCellSize;
      end;

  DisplayCellCount := fCellCount;      
  TempBuffer := StretchCells(Data, ProjectedCellSize, fCellSize, RawCellCount, DisplayCellCount);
  Buffer := AllocMem(DisplayCellCount);
  for i := 0 to DisplayCellCount-1 do
  begin
    if TempBuffer[i] > 0
      then
        begin
          if (fDataType = dtDBZ) or (fDataType = dtDBT)
            then
              begin
                Distance := (i+1) * fCellSize / 1000;
                TempBuffer[i] := TempBuffer[i] + (20 * Log10(Distance)) + (Distance * GaseousAttenuation) + fPotMet;
              end;
          Buffer[i] := MeasureCode(TempBuffer[i], fMeasure);
        end
      else Buffer[i] := NoData;
  end;

  try
    for i := DisplayCellCount-1 downto 0 do
    begin
      MajorRatio := (i+1) *  fCellSize;
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
              if Buffer[ i ] <> NoData
                then
                  begin
                    Pen.Color := fColorScale[ Buffer[ i ] ];
                    Brush.Color := fColorScale[ Buffer[ i ] ];
                  end
                else
                  begin
                    Pen.Color := TransparentColor;
                    Brush.Color := TransparentColor;
                  end;
              Polygon( [ LeftTop, RightTop, RightBottom, LeftBottom ] );
            end;
          end;
    end;
  finally
    FreeMem(TempBuffer);
    FreeMem(Buffer);
  end;
end;

function TRTDisplay.DefaultDBZScale: TScale;
var
  Buffer : array of string;
begin
  try
    SetLength( Buffer, 19 );
    Buffer[0]  := 'Reflectividad';
    Buffer[1]  := ' 17 0 ';
    Buffer[2]  := '  85   0   0 117 ';
    Buffer[3]  := '  90   0 255 255 ';
    Buffer[4]  := '  95   0 204 255 ';
    Buffer[5]  := ' 100   0 153 255 débil ';
    Buffer[6]  := ' 105   0 255  66 ';
    Buffer[7]  := ' 110   0 204  51 ';
    Buffer[8]  := ' 115  51 153 102 moderado ';
    Buffer[9]  := ' 120 255 255   0 ';
    Buffer[10] := ' 125 255 204   0 ';
    Buffer[11] := ' 130 255 153   0 fuerte ';
    Buffer[12] := ' 135 255   0   0 ';
    Buffer[13] := ' 140 204   0   0 ';
    Buffer[14] := ' 145 153   0   0 severo ';
    Buffer[15] := ' 150 204   0 255 ';
    Buffer[16] := ' 155 153   0 255 ';
    Buffer[17] := ' 160 127  31 170 extremo ';
    Buffer[18] := ' 198  90   0  90 ';
    result := TScale.Load( Buffer );
  finally
    Buffer := nil;
  end;
end;

procedure TRTDisplay.WMMOUSEWHEEL(var Message: TWMMouseWheel);
begin
  VScroll.Position := VScroll.Position - (VScroll.SmallChange * Message.WheelDelta div WHEEL_DELTA);
end;

procedure TRTDisplay.WMLBUTTONDOWN(var Message: TWMLButtonDown);
begin
  SetFocus;
end;

procedure TRTDisplay.SetDataType(const Value: TDataType);
begin
  fDataType := Value;
  case fDataType of
    dtDBZ,
    dtDBT      : fMeasure := unDBZ;
    dtPowerZ,
    dtPowerT   : fMeasure := unDB;
    dtSpeed    : fMeasure := unMS;
    dtSpectrum : fMeasure := unMS;
  else fMeasure := unNone;
  end;

  ClearBeams;
  if csDesigning in ComponentState
    then Invalidate;
end;

function TRTDisplay.DefaultVScale: TScale;
var
  Buffer : array of string;
begin
  try
    SetLength( Buffer, 19 );
    Buffer[0]  := 'Reflectividad';
    Buffer[1]  := ' 17 0 ';
    Buffer[2]  := '   0   0   0 117 ';
    Buffer[3]  := '   1   0 255 255 ';
    Buffer[4]  := '   2   0 204 255 ';
    Buffer[5]  := '   3   0 153 255 débil ';
    Buffer[6]  := '   5   0 255  66 ';
    Buffer[7]  := '   7   0 204  51 ';
    Buffer[8]  := '  10  51 153 102 moderado ';
    Buffer[9]  := '  15 255 255   0 ';
    Buffer[10] := '  20 255 204   0 ';
    Buffer[11] := '  25 255 153   0 fuerte ';
    Buffer[12] := '  30 255   0   0 ';
    Buffer[13] := '  35 204   0   0 ';
    Buffer[14] := '  40 153   0   0 severo ';
    Buffer[15] := '  50 204   0 255 ';
    Buffer[16] := '  60 153   0 255 ';
    Buffer[17] := '  70 127  31 170 extremo ';
    Buffer[18] := ' 198  90   0  90 ';
    result := TScale.Load( Buffer );
  finally
    Buffer := nil;
  end;
end;

function TRTDisplay.DefaultWScale: TScale;
var
  Buffer : array of string;
begin
  try
    SetLength( Buffer, 19 );
    Buffer[0]  := 'Reflectividad';
    Buffer[1]  := ' 17 0 ';
    Buffer[2]  := '   0   0   0 117 ';
    Buffer[3]  := '   1   0 255 255 ';
    Buffer[4]  := '   2   0 204 255 ';
    Buffer[5]  := '   3   0 153 255 débil ';
    Buffer[6]  := '   5   0 255  66 ';
    Buffer[7]  := '   7   0 204  51 ';
    Buffer[8]  := '  10  51 153 102 moderado ';
    Buffer[9]  := '  15 255 255   0 ';
    Buffer[10] := '  20 255 204   0 ';
    Buffer[11] := '  25 255 153   0 fuerte ';
    Buffer[12] := '  30 255   0   0 ';
    Buffer[13] := '  35 204   0   0 ';
    Buffer[14] := '  40 153   0   0 severo ';
    Buffer[15] := '  50 204   0 255 ';
    Buffer[16] := '  60 153   0 255 ';
    Buffer[17] := '  70 127  31 170 extremo ';
    Buffer[18] := ' 198  90   0  90 ';
    result := TScale.Load( Buffer );
  finally
    Buffer := nil;
  end;
end;

procedure TRTDisplay.SetPotMet(const Value: double);
begin
  fPotMet := Value;
end;

function TRTDisplay.DefaultDBScale: TScale;
var
  Buffer : array of string;
begin
  try
    SetLength( Buffer, 19 );
    Buffer[0]  := 'Reflectividad';
    Buffer[1]  := ' 17 0 ';
    Buffer[2]  := '   0   0   0 117 ';
    Buffer[3]  := '   1   0 255 255 ';
    Buffer[4]  := '   2   0 204 255 ';
    Buffer[5]  := '   3   0 153 255 débil ';
    Buffer[6]  := '   5   0 255  66 ';
    Buffer[7]  := '   7   0 204  51 ';
    Buffer[8]  := '  10  51 153 102 moderado ';
    Buffer[9]  := '  15 255 255   0 ';
    Buffer[10] := '  20 255 204   0 ';
    Buffer[11] := '  25 255 153   0 fuerte ';
    Buffer[12] := '  30 255   0   0 ';
    Buffer[13] := '  35 204   0   0 ';
    Buffer[14] := '  40 153   0   0 severo ';
    Buffer[15] := '  50 204   0 255 ';
    Buffer[16] := '  60 153   0 255 ';
    Buffer[17] := '  70 127  31 170 extremo ';
    Buffer[18] := ' 198  90   0  90 ';
    result := TScale.Load( Buffer );
  finally
    Buffer := nil;
  end;
end;

end.
