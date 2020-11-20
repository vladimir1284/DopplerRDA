unit Bargauge;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

  type
    TBarStyle = (bsLeftRight, bsRightLeft, bsBottomUp, bsTopDown);

    TNotify = procedure ( aProgress : integer ) of object;

    TBarGauge = class(TGraphicControl)
      public
        constructor Create( anOwner : TComponent );  override;
      protected
        procedure Paint;  override;
      private
        fValue  : integer;
        fMax    : integer;
        fMin    : integer;
        fMargin : integer;
        fStep   : integer;
        fGap    : integer;
        fBevel  : TPanelBevel;
        fColor  : TColor;
        fStyle  : TBarStyle;
        procedure SetValue ( aValue  : integer );
        procedure SetMax   ( aMax    : integer );
        procedure SetMin   ( aMin    : integer );
        procedure SetMargin( aMargin : integer );
        procedure SetStep  ( aStep   : integer );
        procedure SetGap   ( aGap    : integer );
        procedure SetBevel ( aBevel  : TPanelBevel );
        procedure SetColor ( aColor  : TColor );
        procedure SetStyle ( aStyle  : TBarStyle );
      published
        property Value    : integer     read fValue  write SetValue;
        property Min      : integer     read fMin    write SetMin;
        property Max      : integer     read fMax    write SetMax;
        property Margin   : integer     read fMargin write SetMargin;
        property Step     : integer     read fStep   write SetStep;
        property Gap      : integer     read fGap    write SetGap;
        property Bevel    : TPanelBevel read fBevel  write SetBevel;
        property BarColor : TColor      read fColor  write SetColor;
        property Style    : TBarStyle   read fStyle  write SetStyle;
        property Align;
        property Caption;
        property Color;
        property Font;
        property ParentFont;
        property Visible;
        property Anchors;
      private { Events }
        fOnChange : TNotifyEvent;
        function GetNotify : TNotify;
      published
        property OnChange : TNotifyEvent read fOnChange write fOnChange;
        property Notify   : TNotify      read GetNotify;
      private
        procedure DrawBevel;
        procedure DrawGauge;
    end;


  procedure Register;


implementation


{ TBarGauge methods }

  constructor TBarGauge.Create( anOwner : TComponent );
  begin
    inherited;
    fValue  := 0;                  { Value }
    fMin    := 0;                  { Min }
    fMax    := 100;                { Max }
    fMargin := 2;                  { Margin }
    fStep   := 10;                 { Step }
    fGap    := 1;                  { Gap }
    fBevel  := bvLowered;          { Bevel }
    fColor  := clHighLight;        { BarColor }
    fOnChange := nil;
  end;

  procedure TBarGauge.DrawBevel;
  begin
    with Canvas do
      begin
        Brush.Style := bsSolid;
        Brush.Color := Color;
        case Bevel of
          bvRaised:
            begin
              MoveTo( 0, Height - 1 );
              Pen.Color := clWhite;
              LineTo( 0, 0 );
              LineTo( Width - 1, 0 );
              Pen.Color := clGray;
              LineTo( Width - 1, Height - 1 );
              LineTo( 0, Height - 1 );
            end;
          bvLowered:
            begin
              MoveTo( 0, Height - 1 );
              Pen.Color := clGray;
              LineTo( 0, 0 );
              LineTo( Width - 1, 0 );
              Pen.Color := clWhite;
              LineTo( Width - 1, Height - 1 );
              LineTo( 0, Height - 1 );
            end;
        end;
      end;
  end;

  procedure TBarGauge.DrawGauge;
  var
    S, F : integer;
    Last : integer;
  begin
    with Canvas do
      begin
        Pen.Color   := BarColor;
        Brush.Color := BarColor;
        case fStyle of
          bsLeftRight, bsRightLeft : Last := ((Width  - 2 * fMargin) * fValue) div (fMax - fMin);
          bsBottomUp,  bsTopDown   : Last := ((Height - 2 * fMargin) * fValue) div (fMax - fMin);
          else raise Exception.Create( 'Invalid Bargauge style' );
        end;
        S := fMargin;
        F := S + fStep;
        while F < Last do
          begin
            case fStyle of
              bsLeftRight : Rectangle( S, fMargin, F, Height - fMargin );
              bsRightLeft : Rectangle( Width - F, fMargin, Width - S, Height - fMargin );
              bsBottomUp  : Rectangle( fMargin, Height - F, Width - fMargin, Height - S );
              bsTopDown   : Rectangle( fMargin, S, Width - fMargin, F );
            end;
            inc( S, fStep + fGap );
            inc( F, fStep + fGap );
          end;
        if fValue >= 100
          then
            case fStyle of
              bsLeftRight : Rectangle( S, fMargin, Width - fMargin, Height - fMargin );
              bsRightLeft : Rectangle( fMargin, fMargin, Width - S, Height - fMargin );
              bsBottomUp  : Rectangle( fMargin, fMargin, Width - fMargin, Height - S );
              bsTopDown   : Rectangle( fMargin, S, Width - fMargin, Height - fMargin );
            end
          else
            begin
              Pen.Color   := Color;
              Brush.Color := Color;
              case fStyle of
                bsLeftRight : Rectangle( S, fMargin, Width - fMargin, Height - fMargin );
                bsRightLeft : Rectangle( fMargin, fMargin, Width - S, Height - fMargin );
                bsBottomUp  : Rectangle( fMargin, fMargin, Width - fMargin, Height - S );
                bsTopDown   : Rectangle( fMargin, S, Width - fMargin, Height - fMargin );
              end;
            end;
        Pen.Color   := Color;
        Brush.Style := bsClear;
        Font        := Self.Font;
        S := Width  div 2 - TextWidth ( Caption ) div 2;
        F := Height div 2 - TextHeight( Caption ) div 2;
        TextRect( Rect( fMargin, fMargin, Width - fMargin, Height - fMargin ), S, F, Caption );
      end;
  end;

  procedure TBarGauge.Paint;
  begin
    DrawBevel;
    DrawGauge;
  end;

  procedure TBarGauge.SetValue( aValue : integer );
  begin
    if aValue <> fValue
      then
        begin
          if aValue < Min
            then fValue := Min
            else
              if aValue > Max
                then fValue := Max
                else fValue := aValue;
          Paint;
          if assigned( fOnChange )
            then fOnChange( Self );
        end;
  end;

  procedure TBarGauge.SetMin( aMin : integer );
  begin
    if aMin < fMax
      then
        begin
          fMin := aMin;
          Repaint;
        end;
  end;

  procedure TBarGauge.SetMax( aMax : integer );
  begin
    if aMax > fMin
      then
        begin
          fMax := aMax;
          Repaint;
        end;
  end;

  procedure TBarGauge.SetStep( aStep : integer );
  begin
    if aStep > 0
      then fStep := aStep
      else fStep := 1;
    Repaint;
  end;

  procedure TBarGauge.SetGap( aGap : integer );
  begin
    fGap := aGap;
    Repaint;
  end;

  procedure TBarGauge.SetMargin( aMargin : integer );
  begin
    fMargin := aMargin;
    Repaint;
  end;

  procedure TBarGauge.SetBevel( aBevel : TPanelBevel );
  begin
    fBevel := aBevel;
    Repaint;
  end;

  procedure TBarGauge.SetColor( aColor : TColor );
  begin
    fColor := aColor;
    Repaint;
  end;

  procedure TBarGauge.SetStyle( aStyle : TBarStyle );
  begin
    fStyle := aStyle;
    Repaint;
  end;

  function TBarGauge.GetNotify : TNotify;
  begin
    GetNotify := Self.SetValue;
  end;


{ Public procedures & functions }

  procedure Register;
  begin
    RegisterComponents('Vesta', [TBarGauge]);
  end;


end.

