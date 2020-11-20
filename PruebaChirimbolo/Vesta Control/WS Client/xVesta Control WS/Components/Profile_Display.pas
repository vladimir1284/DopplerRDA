unit Profile_Display;

interface

uses
  {$IFDEF MSWINDOWS}
  Windows, Messages, Graphics, Controls, Forms, Dialogs,
  {$ENDIF}
  {$IFDEF LINUX}
  QControls, Types, QGraphics,
  {$ENDIF}
  Classes,
  SysUtils,
  Measure;

type
  TProfileDisplay = class(TCustomControl)
  public
    constructor Create( anOwner : TComponent );  override;
  protected
    procedure Paint;  override;
  private
    fMeasure : TMeasure;
    fValues  : array[0..5] of double;
    fColors  : array[0..4] of TColor;
    fData    : TCodeArray;
    fDetail  : array[0..2] of boolean;
    procedure SetMeasure( Msr : TMeasure );
    procedure SetValue ( Index : integer; Value : double );
    procedure SetColor ( Index : integer; Color : TColor );
    procedure SetDetail( Index : integer; Value : boolean );
  published
    property Measure    : TMeasure         read fMeasure write SetMeasure;
    property Top        : double   index 0 read fValues[0] write SetValue;
    property Bottom     : double   index 1 read fValues[1] write SetValue;
    property Offset     : double   index 2 read fValues[2] write SetValue;
    property Scale      : double   index 3 read fValues[3] write SetValue;
    property Mark1      : double   index 4 read fValues[4] write SetValue;
    property Mark2      : double   index 5 read fValues[5] write SetValue;
    property Color_Back : TColor   index 0 read fColors[0] write SetColor;
    property Color_Prof : TColor   index 1 read fColors[1] write SetColor;
    property Color_Grid : TColor   index 2 read fColors[2] write SetColor;
    property Color_Mark : TColor   index 3 read fColors[3] write SetColor;
    property Color_Capt : TColor   index 4 read fColors[4] write SetColor;
    property Show_Grid  : boolean  index 0 read fDetail[0] write SetDetail;
    property Show_Mark  : boolean  index 1 read fDetail[1] write SetDetail;
    property Show_Capt  : boolean  index 2 read fDetail[2] write SetDetail;
    property Align;
  public
    procedure GetData( var   Data : TCodeArray );
    procedure SetData( const Data : TCodeArray );
    procedure Clear;
  private
    procedure PaintProfile( Canvas : TCanvas );
    procedure PaintGrid   ( Canvas : TCanvas );
    procedure PaintCaption( Canvas : TCanvas );
    procedure PaintEmpty  ( Canvas : TCanvas );
  end;

procedure Register;

implementation

{ TProfileDisplay }

constructor TProfileDisplay.Create(anOwner: TComponent);
begin
  inherited;
  fValues[0] := 20000;     // Top
  fValues[1] := 0;         // Bottom
  fColors[0] := clWindow;  // Background
  fColors[1] := clGray;    // Profile line
  fColors[2] := clBlack;   // Grid lines
  fColors[3] := clBlack;   // Mark lines
  fColors[4] := clBlack;   // Caption
  fDetail[0] := true;      // Show grid
  fDetail[1] := true;      // Show mark
  fDetail[2] := true;      // Show caption
  Clear;
end;

procedure TProfileDisplay.Clear;
begin
  fValues[2] := 0.0;       // Scale
  fValues[3] := 0.0;       // Offset
  fValues[4] := 0.0;       // Mark1
  fValues[5] := 0.0;       // Mark2
  fMeasure := unNone;  
  fData := nil;
  Repaint;
end;

procedure TProfileDisplay.Paint;
var
  B : TBitmap;
begin
  B := TBitmap.Create;
  try
    B.Width  := Width;
    B.Height := Height;
    PaintEmpty(B.Canvas);
    if assigned(fData)
      then PaintProfile(B.Canvas);
    if assigned(fData) or (csDesigning in ComponentState)
      then
        begin
          PaintGrid(B.Canvas);
          PaintCaption(B.Canvas);
        end;
    Canvas.Draw(0, 0, B);
  finally
    B.Free;
  end;
end;

procedure TProfileDisplay.SetColor(Index: integer; Color: TColor);
begin
  fColors[Index] := Color;
  Repaint;
end;

procedure TProfileDisplay.SetDetail( Index : integer; Value : boolean );
begin
  fDetail[Index] := Value;
  Repaint;
end;

procedure TProfileDisplay.SetMeasure(Msr: TMeasure);
begin
  fMeasure := Msr;
  Repaint;
end;

procedure TProfileDisplay.SetValue(Index: integer; Value: double);
begin
  fValues[Index] := Value;
  Repaint;
end;

procedure TProfileDisplay.GetData(var Data: TCodeArray);
begin
  Data := fData;
end;

procedure TProfileDisplay.SetData(const Data: TCodeArray);
begin
  fData := Data;
  Repaint;
end;

procedure TProfileDisplay.PaintEmpty( Canvas : TCanvas );
begin
  with Canvas do
    begin
      Pen.Style := psClear;
      Brush.Style := bsSolid;
      Brush.Color := Color_Back;
      Rectangle(0, 0, Width, Height);
    end;
end;

procedure TProfileDisplay.PaintCaption( Canvas : TCanvas );
var
  X, Y : integer;
  W, H : integer;
  S    : string;
  FS   : TFontStyles;
begin
  if Show_Capt
    then
      with Canvas do
        begin
          //
          S := '5 km';
          W := TextWidth (S);
          H := TextHeight(S);
          X := Width - W - 2;
          Y := round(3/4 * Height) - H - 2;
          TextOut(X, Y, S);
          //
          S := '10 km';
          W := TextWidth (S);
          H := TextHeight(S);
          X := Width - W - 2;
          Y := round(2/4 * Height) - H - 2;
          TextOut(X, Y, S);
          //
          S := '15 km';
          W := TextWidth (S);
          H := TextHeight(S);
          X := Width - W - 2;
          Y := round(1/4 * Height) - H - 2;
          TextOut(X, Y, S);
          //
          Y := 2;
          S := '0';
          X := round(Scale * Offset) + 2;
          TextOut(X, Y, S);
          //
          S := Format('%.0f', [Mark1]);
          X := round(Scale * (Offset + Mark1)) + 2;
          TextOut(X, Y, S);
          //
          S := Format('%.0f', [Mark2]);
          X := round(Scale * (Offset + Mark2)) + 2;
          TextOut(X, Y, S);
          //
          S := '[' + MeasureName(Measure) + ']';
          W := TextWidth (S);
          X := Width - W - 2;
          TextOut(X, Y, S);
          //
          FS := Font.Style;
          Font.Style := Font.Style + [fsBold];
          S := MeasureVar(Measure);
          W := TextWidth (S);
          H := TextHeight(S);
          X := Width - W - 2;
          Y := Height - H - 2;
          TextOut(X, Y, S);
          Font.Style := FS;
        end;
end;

procedure TProfileDisplay.PaintGrid( Canvas : TCanvas );
var
  C : integer;
begin
  with Canvas do
    begin
      if Show_Grid
        then
          begin
            Pen.Style := psDash;
            Pen.Color := Color_Grid;
            Pen.Width := 1;
            // 5 Km
            C := round(1/4 * Height);
            MoveTo(0, C);
            LineTo(Width, C);
            // 10 Km
            C := round(2/4 * Height);
            MoveTo(0, C);
            LineTo(Width, C);
            // 15 Km
            C := round(3/4 * Height);
            MoveTo(0, C);
            LineTo(Width, C);
          end;
      if Show_Mark
        then
          begin
            // X axis
            Pen.Style := psDot;
            Pen.Color := Color_Mark;
            Pen.Width := 1;
            // Mark1
            C := round(Scale * (Offset + Mark1));
            MoveTo(C, 0);
            LineTo(C, Height);
            // Mark2
            C := round(Scale * (Offset + Mark2));
            MoveTo(C, 0);
            LineTo(C, Height);
            // Offset
            Pen.Width := 2;
            Pen.Style := psDot;
            C := round(Scale * Offset);
            MoveTo(C, 0);
            LineTo(C, Height);
          end;
    end;
end;

procedure TProfileDisplay.PaintProfile( Canvas : TCanvas );
var
  I, C : integer;
  X, Y : integer;
begin
  C := Length(fData) - 1;
  with Canvas do
    begin
      Pen.Style := psSolid;
      Pen.Width := 3;
      Pen.Color := Color_Prof;
      X := round(Scale * (Offset + CodeMeasure(fData[0], fMeasure)));
      Y := Height;
      MoveTo(X, Y);
      for I := 1 to C do
        begin
          X := round(Scale * (Offset + CodeMeasure(fData[I], fMeasure)));
          Y := round((C - I) * Height/C);
          LineTo(X, Y);
        end;
    end;
end;

// Public procedures & functions

procedure Register;
begin
  RegisterComponents('Vesta', [TProfileDisplay]);
end;

end.

