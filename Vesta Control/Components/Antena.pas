unit Antena;

interface

  uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Angle, Speed;

  type
    TNewDataEvent = procedure ( Sender : TObject; Position : TAngle ) of object;

    TAntennaType = (at_Azimut, at_Elevation);

    TAntenna = class(TCustomControl)
    public
      constructor Create( anOwner : TComponent );  override;
    protected
      procedure WndProc( var Msg : TMessage );  override;
      procedure Loaded;                         override;
      procedure Paint;                          override;
      procedure Locate;                         virtual;
    private
      fType          : TAntennaType;
      fCenter        : TPoint;
      fRadius        : integer;
      fDesired       : TAngle;
      fDesired2      : TAngle;
      fPosition      : TAngle;
      fCommand       : TAngle;
      fCounts        : array[0..3] of integer;
      fColors        : array[0..8] of TColor;
      fOnReach       : TNotifyEvent;
      fOnNewPosition : TNewDataEvent;
      fOnNewDesired  : TNewDataEvent;
      fOnNewDesired2 : TNewDataEvent;
      fOnTypeChanged : TNotifyEvent;
      fReadOnly      : boolean;
      procedure SetType    ( aType : TAntennaType );
      procedure SetDesired ( aDesired  : TAngle );
      procedure SetDesired2( aDesired  : TAngle );
      procedure SetPosition( aPosition : TAngle );
      procedure SetCommand ( aCommand  : TAngle );
      function  GetCount( aIndex : integer ) : integer;
      procedure SetCount( aIndex : integer; aCount : integer );
      function  GetColor( aIndex : integer ) : TColor;
      procedure SetColor( aIndex : integer; aColor : TColor );
    public
      property Center : TPoint  read fCenter;
      property Radius : integer read fRadius;
    published
      property AntennaType : TAntennaType    read fType     write SetType;
      property Desired     : TAngle          read fDesired  write SetDesired;
      property Desired2    : TAngle          read fDesired2 write SetDesired2;
      property Position    : TAngle          read fPosition write SetPosition;
      property Command     : TAngle          read fCommand  write SetCommand;
      property Count_Rect  : integer index 0 read GetCount  write SetCount;
      property Count_Circ  : integer index 1 read GetCount  write SetCount;
      property Count_Rad   : integer index 2 read GetCount  write SetCount;
      property Count_Small : integer index 3 read GetCount  write SetCount;
      property Color_Back  : TColor  index 0 read GetColor  write SetColor;
      property Color_Ray   : TColor  index 1 read GetColor  write SetColor;
      property Color_Mark  : TColor  index 2 read GetColor  write SetColor;
      property Color_Rect  : TColor  index 3 read GetColor  write SetColor;
      property Color_Circ  : TColor  index 4 read GetColor  write SetColor;
      property Color_Rad   : TColor  index 5 read GetColor  write SetColor;
      property Color_Small : TColor  index 6 read GetColor  write SetColor;
      property Color_Cmd   : TColor  index 7 read GetColor  write SetColor;
      property Color_Mark2 : TColor  index 8 read GetColor  write SetColor;
      property ReadOnly    : boolean         read fReadOnly write fReadOnly;
      property Align;
      property PopupMenu;
    published
      property OnReach       : TNotifyEvent  read fOnReach       write fOnReach;
      property OnNewPosition : TNewDataEvent read fOnNewPosition write fOnNewPosition;
      property OnNewDesired  : TNewDataEvent read fOnNewDesired  write fOnNewDesired;
      property OnNewDesired2 : TNewDataEvent read fOnNewDesired2 write fOnNewDesired2;
      property OnTypeChanged : TNotifyEvent  read fOnTypeChanged write fOnTypeChanged;
      property Anchors;
    protected
      procedure PaintBack( aCanvas : TCanvas );
      procedure PaintRay ( aCanvas : TCanvas );
      procedure PaintGrid( aCanvas : TCanvas );
    private
      P, D, C, D2  : TPoint;
      Dragging : boolean;
      Desired_1or2 : boolean;
      procedure LocateRay;
      function  FindAngle( X, Y : integer ) : TAngle;  virtual;
    end;

    TAzimut = class(TAntenna )
    public
      constructor Create( anOwner : TComponent );  override;
    end;

    TElevation = class(TAntenna )
    public
      constructor Create( anOwner : TComponent );  override;
    end;

  procedure Register;


implementation


// TAntenna methods

  constructor TAntenna.Create( anOwner : TComponent );
  begin
    inherited Create(anOwner);
    fColors[0] := clTeal;      // Background
    fColors[1] := clLime;      // Position Ray
    fColors[2] := clRed;       // Desired  Ray
    fColors[3] := clWhite;     // Rectangular
    fColors[4] := clWhite;     // Circular
    fColors[5] := clYellow;    // Radial
    fColors[6] := clWhite;     // Small
    fColors[7] := clMaroon;    // Command Ray
    fColors[8] := clBlack;     // Second Desired Ray
    fCounts[0] := 1;           // Rectangular
    fCounts[1] := 1;           // Circular
    fCounts[2] := 24;          // Radial
    fCounts[3] := 144;         // Small
    Dragging   := false;
    fDesired   := 0;
    fDesired2  := 0;
  end;

  procedure TAntenna.Paint;
  var
    B : TBitmap;
  begin
    Locate;
    B := TBitmap.Create;
    try
      B.Width  := Width;
      B.Height := Height;
      PaintBack(B.Canvas);
      PaintGrid(B.Canvas);
      PaintRay (B.Canvas);
      Canvas.Draw(0, 0, B);
    finally
      B.Free;
    end;
  end;

  procedure TAntenna.Locate;
  var
    T : integer;
  begin
    case AntennaType of
      at_Azimut:
        begin
          fCenter.X := Width div 2;
          fCenter.Y := Height div 2;
          if fCenter.X <= fCenter.Y
            then fRadius := fCenter.X
            else fRadius := fCenter.Y;
        end;
      at_Elevation:
        begin
          if Width < Height
            then T := Width  div 8
            else T := Height div 8;
          fCenter.X := T;
          fCenter.Y := Height - T;
          if (Width - T) <= fCenter.Y
            then fRadius := Width - T
            else fRadius := fCenter.Y;
        end;
    end;
  end;

  procedure TAntenna.WndProc( var Msg : TMessage );
  begin
    if not ((csDesigning in ComponentState) or ReadOnly)
      then
        with Msg do
          case Msg of
            WM_LBUTTONDOWN:
              begin
                SetCapture(Handle);
                Dragging := true;
                Desired_1or2 := true;
                Desired  := FindAngle(LParamLo, LParamHi);
              end;
            WM_LBUTTONUP:
              begin
                Dragging := false;
                ReleaseCapture;
              end;
            WM_RBUTTONDOWN:
              begin
                SetCapture(Handle);
                Dragging := true;
                Desired_1or2 := false;
                Desired2 := FindAngle(LParamLo, LParamHi);
              end;
            WM_RBUTTONUP:
              begin
                Dragging := false;
                ReleaseCapture;
              end;
            WM_MOUSEMOVE:
              if Dragging
                then if Desired_1or2
                       then Desired  := FindAngle(LParamLo, LParamHi)
                       else Desired2 := FindAngle(LParamLo, LParamHi);
          end;
    inherited WndProc(Msg);
  end;

  procedure TAntenna.Loaded;
  begin
    inherited;
    if assigned(fOnTypeChanged)
      then fOnTypeChanged(Self);
  end;

  procedure TAntenna.SetPosition( aPosition : TAngle );
  begin
    aPosition := aPosition mod round(CodesPerAngle * 360);
    if aPosition <> fPosition
      then
        begin
          fPosition := aPosition;
          Paint;
          if assigned(fOnNewPosition)
            then fOnNewPosition(Self, fPosition);
          if (fPosition = Desired) and assigned(fOnReach)
            then fOnReach(Self);
        end;
  end;

  procedure TAntenna.SetCommand( aCommand  : TAngle );
  begin
    aCommand := aCommand mod round(CodesPerAngle * 360);
    if aCommand <> fCommand
      then
        begin
          fCommand := aCommand;
          Paint;
        end;
  end;

  procedure TAntenna.SetDesired( aDesired : TAngle );
  begin
    aDesired := aDesired mod round(CodesPerAngle * 360);
    if aDesired <> fDesired
      then
        begin
          fDesired := aDesired;
          Paint;
          if assigned(fOnNewDesired)
            then fOnNewDesired(Self, fDesired);
        end;
  end;

  procedure TAntenna.SetType( aType : TAntennaType );
  begin
    fType := aType;
    Paint;
    if assigned(fOnTypeChanged)
      then fOnTypeChanged(Self);
  end;

  function TAntenna.GetCount( aIndex : integer ) : integer;
  begin
    GetCount := fCounts[aIndex];
  end;

  procedure TAntenna.SetCount( aIndex : integer; aCount : integer );
  begin
    if fCounts[aIndex] <> aCount
      then
        begin
          fCounts[aIndex] := aCount;
          Paint;
        end;
  end;

  function TAntenna.GetColor( aIndex : integer ) : TColor;
  begin
    GetColor := fColors[aIndex];
  end;

  procedure TAntenna.SetColor( aIndex : integer; aColor : TColor );
  begin
    if fColors[aIndex] <> aColor
      then
        begin
          fColors[aIndex] := aColor;
          Paint;
        end;
  end;

  procedure TAntenna.PaintBack( aCanvas : TCanvas );
  begin
    with aCanvas do
      begin
        Brush.Style := bsSolid;
        Pen.Style   := psClear;
        Brush.Color := Color;
        Rectangle(0, 0, Width + 1, Height + 1);
        Brush.Color := Color_Back;
        Ellipse(Center.X - Radius, Center.Y - Radius,
                Center.X + Radius, Center.Y + Radius);
      end;
  end;

  procedure TAntenna.PaintGrid( aCanvas : TCanvas );

    procedure PaintRectangularGrid;
    var
      S, P : TPoint;
      I    : integer;
    begin
      S.X := Radius div Count_Rect;
      S.Y := Radius div Count_Rect;
      P.X := 0;
      P.Y := 0;
      with aCanvas do
        begin
          Pen.Color := Color_Rect;
          for I := 0 to Count_Rect - 1 do
            begin
              MoveTo(Center.X + P.X, 0); LineTo(Center.X + P.X, Height);
              MoveTo(Center.X - P.X, 0); LineTo(Center.X - P.X, Height);
              MoveTo(0, Center.Y + P.Y); LineTo(Width, Center.Y + P.Y);
              MoveTo(0, Center.Y - P.Y); LineTo(Width, Center.Y - P.Y);
              inc(P.X, S.X);
              inc(P.Y, S.Y);
            end;
        end;
    end;

    procedure PaintCircularGrid;
    var
      S, P : TPoint;
      I    : integer;
    begin
      S.X := Radius div Count_Circ;
      S.Y := Radius div Count_Circ;
      P   := S;
      with aCanvas do
        begin
          Pen.Color := Color_Circ;
          for I := 1 to Count_Circ do
            begin
              Ellipse(Center.X - P.X, Center.Y - P.Y,
                      Center.X + P.X, Center.Y + P.Y);
              inc(P.X, S.X);
              inc(P.Y, S.Y);
            end;
        end;
    end;

    procedure PaintRadialGrid;
    var
      S, P : single;
      I    : integer;
    begin
      S := 2 * Pi / Count_Rad;
      P := 0;
      with aCanvas do
        begin
          Pen.Color := Color_Rad;
          for I := 1 to Count_Rad do
            begin
              MoveTo(Center.X + round(7 * Radius div 8 *  sin(P)),
                     Center.Y + round(7 * Radius div 8 * -cos(P)));
              LineTo(Center.X + round(    Radius       *  sin(P)),
                     Center.Y + round(    Radius       * -cos(P)));
              P := P + S;
            end;
        end;
    end;

    procedure PaintSmallGrid;
    var
      S, P : single;
      I    : integer;
    begin
      S := 2 * Pi / Count_Small;
      P := 0;
      with aCanvas do
        begin
          Pen.Color := Color_Small;
          for I := 1 to Count_Small do
            begin
              MoveTo(Center.X + round(15 * Radius div 16 *  sin(P)),
                     Center.Y + round(15 * Radius div 16 * -cos(P)));
              LineTo(Center.X + round(     Radius        *  sin(P)),
                     Center.Y + round(     Radius        * -cos(P)));
              P := P + S;
            end;
        end;
    end;

  begin
    aCanvas.Brush.Style := bsClear;
    aCanvas.Pen.Style   := psSolid;
    if Count_Rect  > 0 then PaintRectangularGrid;
    if Count_Circ  > 0 then PaintCircularGrid;
    if Count_Small > 0 then PaintSmallGrid;
    if Count_Rad   > 0 then PaintRadialGrid;
  end;

  procedure TAntenna.LocateRay;
  var
    PA, DA, CA, D2A : single;
  begin
    PA  := DegreeToRadian * CodeAngle(fPosition);
    DA  := DegreeToRadian * CodeAngle(fDesired);
    D2A := DegreeToRadian * CodeAngle(fDesired2);
    CA  := DegreeToRadian * CodeAngle(fCommand);
    case AntennaType of
      at_Azimut:
        begin
          P.X  := Center.X + round(Radius * sin(PA));
          P.Y  := Center.Y - round(Radius * cos(PA));
          D.X  := Center.X + round(Radius * sin(DA));
          D.Y  := Center.Y - round(Radius * cos(DA));
          D2.X := Center.X + round(Radius * sin(D2A));
          D2.Y := Center.Y - round(Radius * cos(D2A));
          C.X  := Center.X + round(Radius * sin(CA));
          C.Y  := Center.Y - round(Radius * cos(CA));
        end;
      at_Elevation:
        begin
          P.X  := Center.X + round(Radius * cos(PA));
          P.Y  := Center.Y - round(Radius * sin(PA));
          D.X  := Center.X + round(Radius * cos(DA));
          D.Y  := Center.Y - round(Radius * sin(DA));
          D2.X := Center.X + round(Radius * cos(D2A));
          D2.Y := Center.Y - round(Radius * sin(D2A));
          C.X  := Center.X + round(Radius * cos(CA));
          C.Y  := Center.Y - round(Radius * sin(CA));
        end;
    end;
  end;

  function TAntenna.FindAngle( X, Y : integer ) : TAngle;
  var
    Angle : single;
  begin
    if Center.Y <> Y
      then Angle := 180 / PI * arctan((X - Center.X)/(Center.Y - Y))
      else
        if X > Center.X
          then Angle :=  90
          else Angle := 270;
    if Y > Center.Y
      then Angle := Angle + 180;
    if Angle < 0
      then Angle := Angle + 360;
    Result := AngleCode(Angle);
    if AntennaType = at_Elevation
      then Result := AngleCode(90) - Result;
  end;

  procedure TAntenna.PaintRay( aCanvas : TCanvas );
  begin
    LocateRay;
    with aCanvas do
      begin
        Pen.Color := Color_Cmd;
        MoveTo(Center.X, Center.Y); LineTo(C.X, C.Y);
        Pen.Color := Color_Mark;
        MoveTo(Center.X, Center.Y); LineTo(D.X, D.Y);
        Pen.Color := Color_Mark2;
        MoveTo(Center.X, Center.Y); LineTo(D2.X, D2.Y);
        Pen.Color := Color_Ray;
        MoveTo(Center.X, Center.Y); LineTo(P.X, P.Y);
      end;
  end;


// TAzimut methods

  constructor TAzimut.Create( anOwner : TComponent );
  begin
    inherited Create(anOwner);
    fType := at_Azimut;
  end;

// TElevation methods

  constructor TElevation.Create( anOwner : TComponent );
  begin
    inherited Create(anOwner);
    fType := at_Elevation;
  end;

// Public procedures & functions

  procedure Register;
  begin
    RegisterComponents('Vesta', [TAzimut, TElevation]);
  end;

procedure TAntenna.SetDesired2(aDesired: TAngle);
begin
  aDesired := aDesired mod round(CodesPerAngle * 360);
  if aDesired <> fDesired2
    then
      begin
        fDesired2 := aDesired;
        Paint;
        if assigned(fOnNewDesired2)
          then fOnNewDesired2(Self, fDesired2);
      end;
end;

end.

