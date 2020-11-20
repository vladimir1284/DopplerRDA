unit Tune;

interface

  uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ExtCtrls;

  type
    TTuneGauge = class( TGraphicControl )
      public
        constructor Create( anOwner : TComponent );  override;
      protected
        procedure Paint;  override;
      private
        fPosition  : integer;
        fDesigns   : array[0..3] of integer;
        fColors    : array[0..3] of TColor;
        fBevel     : TPanelBevel;
        procedure SetPosition( aPosition : integer );
        procedure SetDesign  ( Index, aDesign : integer );
        procedure SetColor   ( Index : integer; aColor  : TColor );
        procedure SetBevel   ( aBevel  : TPanelBevel );
      published
        property Position    : integer         read fPosition   write SetPosition;
        property Min         : integer index 0 read fDesigns[0] write SetDesign;
        property Max         : integer index 1 read fDesigns[1] write SetDesign;
        property GoodMin     : integer index 2 read fDesigns[2] write SetDesign;
        property GoodMax     : integer index 3 read fDesigns[3] write SetDesign;
        property Bevel       : TPanelBevel     read fBevel      write SetBevel;
        property ColorBad    : TColor  index 0 read fColors[0]  write SetColor;
        property ColorGood   : TColor  index 1 read fColors[1]  write SetColor;
        property ColorCursor : TColor  index 2 read fColors[2]  write SetColor;
        property ColorSide   : TColor  index 3 read fColors[3]  write SetColor;
        property Anchors;
      private { Events }
        fOnChange : TNotifyEvent;
      published
        property OnChange : TNotifyEvent read fOnChange write fOnChange;
      private
        procedure DrawBevel( Canvas : TCanvas );
        procedure DrawGauge( Canvas : TCanvas );
      public
        function InRange : boolean;
    end;

  procedure Register;


implementation


{ TTuneGauge methods }

  constructor TTuneGauge.Create( anOwner : TComponent );
  begin
    inherited Create( anOwner );
    fPosition   := 50;
    fDesigns[0] := 0;         { Min     }
    fDesigns[1] := 100;       { Max     }
    fDesigns[2] := 40;        { GoodMin }
    fDesigns[3] := 60;        { GoodMax }
    fBevel      := bvLowered;
    fColors[0]  := clGray;    { ColorBad    }
    fColors[1]  := clMaroon;  { ColorGood   }
    fColors[2]  := clYellow;  { ColorCursor }
    fColors[3]  := clBlack;   { ColorSide   }
  end;

  procedure TTuneGauge.DrawBevel( Canvas : TCanvas );
  begin
    with Canvas do
      begin
        Brush.Color := Color;
        case Bevel of
          bvRaised:
            begin
              MoveTo( 0, Height - 1 );
              Pen.Color := clWhite;
              LineTo( 0, 0 );
              LineTo( Width - 1, 0 );
              Pen.Color := clBlack;{clGray;}
              LineTo( Width - 1, Height - 1 );
              LineTo( 0, Height - 1 );
            end;
          bvLowered:
            begin
              MoveTo( 0, Height - 1 );
              Pen.Color := clBlack;{clGray;}
              LineTo( 0, 0 );
              LineTo( Width - 1, 0 );
              Pen.Color := clWhite;
              LineTo( Width - 1, Height - 1 );
              LineTo( 0, Height - 1 );
            end;
        end;
      end;
  end;

  procedure TTuneGauge.DrawGauge( Canvas : TCanvas );
  var
    Pos   : integer;
    Scale : single;
  begin
    with Canvas do
      begin
        if Max <> Min
          then Scale := Width / (Max - Min)
          else Scale := 0;
        Pos   := round((fPosition - Min) * Scale);
        Brush.Style := bsSolid;
        Pen.Style   := psClear;
        Brush.Color := ColorBad;
        Rectangle( 1, 1, Width, Height );
        Brush.Color := ColorGood;
        Rectangle( round((GoodMin - Min) * Scale), 1, round((GoodMax - Min) * Scale), Height );
        Brush.Style := bsClear;
        Pen.Style   := psSolid;
        Pen.Color := ColorSide;
        MoveTo( Pos - 1, 0 );  LineTo( Pos - 1, Height );
        MoveTo( Pos + 1, 0 );  LineTo( Pos + 1, Height );
        Pen.Color := ColorCursor;
        MoveTo( Pos, 0 );  LineTo( Pos, Height );
      end;
  end;

  function TTuneGauge.InRange : boolean;
  begin
    Result := (Position >= GoodMin) and (Position <= GoodMax); 
  end;
  
  procedure TTuneGauge.Paint;
  var
    B : TBitmap;
  begin
    if (Width > 0) and (Height > 0)
      then
        begin
          B := TBitmap.Create;
          try
            B.Width  := Width;
            B.Height := Height;
            DrawBevel( B.Canvas );
            DrawGauge( B.Canvas );
            Canvas.Draw( 0, 0, B );
          finally
            B.Free;
          end;
        end;
  end;

  procedure TTuneGauge.SetPosition( aPosition : integer );
  begin
    if aPosition < Min then fPosition := Min;
    if aPosition > Max then fPosition := Max;
    if fPosition <> aPosition
      then
        begin
          fPosition := aPosition;
          Paint;
          if assigned( fOnChange )
            then fOnChange( Self );
        end;
  end;

  procedure TTuneGauge.SetDesign( Index, aDesign : integer );
  begin
    if fDesigns[Index] <> aDesign
      then
        begin
          fDesigns[Index] := aDesign;
          Repaint;
        end;
  end;

  procedure TTuneGauge.SetBevel( aBevel : TPanelBevel );
  begin
    if fBevel <> aBevel
      then
        begin
          fBevel := aBevel;
          Repaint;
        end;
  end;

  procedure TTuneGauge.SetColor( Index : integer; aColor : TColor );
  begin
    if fColors[Index] <> aColor
      then
        begin
          fColors[Index] := aColor;
          Repaint;
        end;
  end;


{ Public procedures & functions }

  procedure Register;
  begin
    RegisterComponents('Vesta', [TTuneGauge]);
  end;


end.
 
