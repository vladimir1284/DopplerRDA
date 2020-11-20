unit Video;

interface

  uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls;

  type
    TSample = single;

  type
    PDataBank = ^TDataBank;
    TDataBank = array[0..0] of TSample;

    TVideo = class(TGraphicControl)
    public
      constructor Create( anOwner : TComponent );  override;
      destructor  Destroy;                         override;
    protected
      procedure WndProc( var Msg : TMessage );  override;
      procedure Paint;                          override;
    public
      procedure Update;  override;
    private
      fSampleTime : integer;  // Nano Seconds!!                    
      fPosition   : integer;
      fOtherPos   : integer;
      fColors     : array[0..5] of TColor;
      fRatios     : array[0..4] of integer;
      fLevels     : array[0..2] of integer;
      fMasks      : array[0..3] of boolean;
      fScrollBar  : TScrollBar;
      fDataSize   : integer;
      fData       : array[0..1] of PDataBank;
      fOnChange   : TNotifyEvent;
      fOnNewData  : TNotifyEvent;
      fOnNewPos   : TNotifyEvent;
      fOnUpdated  : TNotifyEvent;
      procedure SetSampleTime( T : integer );
      procedure SetPosition( P : integer );
      procedure SetOtherPos( P : integer );
      function  GetColor( I : integer ) : TColor;
      procedure SetColor( I : integer; C :  TColor );
      function  GetRatio( I : integer ) : integer;
      procedure SetRatio( I, R : integer );
      procedure SetScrollBar( SB : TScrollBar );
      function  GetCHValue( I : integer ) : TSample;
      function  GetAverage( I : integer ) : double;
      procedure SetMask( I : integer; M : boolean );
      procedure SetLevel( I, L : integer );
      procedure SetDataSize( S : integer );
    published
      property SampleTime   : integer         read fSampleTime write SetSampleTime;
      property Position     : integer         read fPosition   write SetPosition;
      property OtherPos     : integer         read fOtherPos   write SetOtherPos;
      property Color_Back   : TColor  index 0 read GetColor    write SetColor;
      property Color_Ch1    : TColor  index 1 read GetColor    write SetColor;
      property Color_Ch2    : TColor  index 2 read GetColor    write SetColor;
      property Color_Grid   : TColor  index 3 read GetColor    write SetColor;
      property Color_Mark   : TColor  index 4 read GetColor    write SetColor;
      property Color_Other  : TColor  index 5 read GetColor    write SetColor;
      property SamplePoints : integer index 0 read GetRatio    write SetRatio;
      property SamplePixels : integer index 1 read GetRatio    write SetRatio;
      property ValuePoints  : integer index 2 read GetRatio    write SetRatio;
      property ValuePixels  : integer index 3 read GetRatio    write SetRatio;
      property GridPixels   : integer index 4 read GetRatio    write SetRatio;
      property Mask1        : boolean index 0 read fMasks[0]   write SetMask;
      property Mask2        : boolean index 1 read fMasks[1]   write SetMask;
      property MaskPosition : boolean index 2 read fMasks[2]   write SetMask;
      property MaskOtherPos : boolean index 3 read fMasks[3]   write SetMask;
      property Value1       : TSample index 0 read GetCHValue;
      property Value2       : TSample index 1 read GetCHValue;
      property Average1     : double  index 0 read GetAverage;
      property Average2     : double  index 1 read GetAverage;
      property Level1       : integer index 0 read fLevels[0]  write SetLevel;
      property Level2       : integer index 1 read fLevels[1]  write SetLevel;
      property StartCell    : integer index 2 read fLevels[2]  write SetLevel;
      property ScrollBar    : TScrollBar      read fScrollBar  write SetScrollBar;
      property DataSize     : integer         read fDataSize   write SetDataSize;
      property Align;
      property PopupMenu;
      property Enabled;
    published
      property OnChange  : TNotifyEvent read fOnChange  write fOnChange;
      property OnNewData : TNotifyEvent read fOnNewData write fOnNewData;
      property OnNewPos  : TNotifyEvent read fOnNewPos  write fOnNewPos;
      property OnUpdated : TNotifyEvent read fOnUpdated write fOnUpdated;
      property OnMouseDown;
      property OnMouseMove;
      property OnMouseUp;
      property Anchors;
    public
      procedure SetData1         ( var D );
      procedure SetData2         ( var D );
      procedure SetInterlacedData( var D );
    private
      procedure PaintData( aCanvas : TCanvas );
    private
      DragLeft  : boolean;
      DragRight : boolean;
      function FindPosition( X, Y : integer ) : integer;
      function FindDisplacement( D : integer ) : integer;
    private
      procedure ScrollStart( Sender : TObject );
    end;

  procedure Register;

implementation

{ TVideo methods }

  constructor TVideo.Create( anOwner : TComponent );
  begin
    inherited Create( anOwner );
    fSampleTime := 100;
    fDataSize := 0;
    fData[0] := nil;
    fData[1] := nil;
    fPosition := 0;
    fOtherPos := 0;
    fColors[0] := clTeal;   { Background }
    fColors[1] := clYellow; { Channel 1  }
    fColors[2] := clRed;    { Channel 2  }
    fColors[3] := clSilver; { Grid       }
    fColors[4] := clBlack;  { Mark       }
    fColors[5] := clMaroon; { Other      }
    fRatios[0] := 1;
    fRatios[1] := 1;
    fRatios[2] := 1;
    fRatios[3] := 1;
    fRatios[4] := 32;       { GridPixels }
    fLevels[0] := 32;
    fLevels[1] := 50;
    fLevels[2] := 0;
    DataSize := 2048;
  end;

  destructor TVideo.Destroy;
  begin
    if assigned(fData[0])
      then FreeMem(fData[0]);
    if assigned(fData[1])
      then FreeMem(fData[1]);
    inherited Destroy;
  end;

  procedure TVideo.WndProc( var Msg : TMessage );
  begin
    if not (csDesigning in ComponentState)
      then
        with Msg do
          case Msg of
            WM_LBUTTONDOWN:
              if not MaskPosition
                then
                  begin
                    DragLeft  := true;
                    Position  := FindPosition( LParamLo, LParamHi );
                  end;
            WM_RBUTTONDOWN:
              if not MaskOtherPos
                then
                  begin
                    DragRight := true;
                    OtherPos  := FindPosition( LParamLo, LParamHi );
                  end;
            WM_LBUTTONUP:
              DragLeft  := false;
            WM_RBUTTONUP:
              DragRight := false;
            WM_MOUSEMOVE:
              begin
                if DragLeft  then Position := FindPosition( LParamLo, LParamHi );
                if DragRight then OtherPos := FindPosition( LParamLo, LParamHi );
              end;
          end;
    inherited WndProc( Msg );
  end;

  procedure TVideo.Paint;
  var
    B : TBitmap;
  begin
    B := TBitmap.Create;
    B.Width  := Width;
    B.Height := Height;
    PaintData( B.Canvas );
    Canvas.Draw( 0, 0, B );
    B.Free;
  end;

  procedure TVideo.Update;
  begin
    Paint;
    inherited Update;
    if assigned(fOnUpdated)
      then fOnUpdated(Self);
  end;
  
  procedure TVideo.SetDataSize( S : integer );
  begin
    if fDataSize <> S
      then
        begin
          fDataSize := S;
          ReallocMem( fData[0], fDataSize * sizeof(TSample) );
          ReallocMem( fData[1], fDataSize * sizeof(TSample) );
          FillChar( fData[0]^,  fDataSize * sizeof(TSample), 0 );
          FillChar( fData[1]^,  fDataSize * sizeof(TSample), 0 );
          if fPosition >= fDataSize
            then fPosition := pred(fDataSize);
          if fOtherPos >= fDataSize
            then fOtherPos := pred(fDataSize);
          if assigned(fScrollBar)
            then fScrollBar.SetParams( ScrollBar.Position, 0, fDataSize );
        end;
  end;

  procedure TVideo.SetData1( var D );
  begin
    move( D, fData[0]^, fDataSize * sizeof(TSample) );
    Update;
    if assigned(fOnNewData)
      then fOnNewData( Self );
  end;

  procedure TVideo.SetData2( var D );
  begin
    move( D, fData[1]^, fDataSize * sizeof(TSample) );
    Update;
    if assigned(fOnNewData)
      then fOnNewData( Self );
  end;

  procedure TVideo.SetInterlacedData( var D );
  var
    I, J : integer;
    Data : TDataBank absolute D;
  begin
    J := 0;
    for I := 0 to fDataSize - 1 do
      begin
        fData[0]^[I] := TSample(Data[J]);
        inc( J );
        fData[1]^[I] := TSample(Data[J]);
        inc( J );
      end;
    Update;
    if assigned(fOnNewData)
      then fOnNewData( Self );
  end;
  
  procedure TVideo.SetSampleTime( T : integer );
  begin
    fSampleTime := T;
    //...
  end;

  procedure TVideo.SetPosition( P : integer );
  begin
    if P < 0 then P := 0;
    if P >= DataSize then P := DataSize - 1;
    if P <> fPosition
      then
        begin
          fPosition := P;
          Update;
          if assigned(fOnNewPos)
            then fOnNewPos( Self );
        end;
  end;

  procedure TVideo.SetOtherPos( P : integer );
  begin
    if P < 0 then P := 0;
    if P > DataSize then P := DataSize;
    if P <> fOtherPos
      then
        begin
          fOtherPos := P;
          Update;
          if assigned(fOnNewPos)
            then fOnNewPos( Self );
        end;
  end;

  function TVideo.GetColor( I : integer ) : TColor;
  begin
    Result := fColors[I];
  end;

  procedure TVideo.SetColor( I : integer; C :  TColor );
  begin
    if fColors[I] <> C
      then
        begin
          fColors[I] := C;
          if assigned(fOnChange)
            then fOnChange( Self );
          Update;
        end;
  end;

  function TVideo.GetRatio( I : integer ) : integer;
  begin
    Result := fRatios[I];
  end;

  procedure TVideo.SetRatio( I, R : integer );
  begin
    if fRatios[I] <> R
     then
       begin
         fRatios[I] := R;
         if assigned(fScrollBar)
           then
             with fScrollBar do
               begin
                 SmallChange := SamplePoints;
                 if SamplePixels > 0
                   then LargeChange := GridPixels * SamplePoints div SamplePixels;
               end;
         if assigned(fOnChange)
           then fOnChange( Self );
         Update;
       end;
  end;

  procedure TVideo.SetScrollBar( SB : TScrollBar );
  begin
    fScrollBar := SB;
    if assigned(fScrollBar)
      then
        begin
          fScrollBar.SetParams( ScrollBar.Position, 0, fDataSize );
          fScrollBar.OnChange := ScrollStart;
        end;
  end;

  function TVideo.GetCHValue( I : integer ) : TSample;
  begin
    if assigned(fData[I])
      then Result := fData[I]^[fPosition]
      else Result := 0;
  end;

  function TVideo.GetAverage( I : integer ) : double;
  var
    J : integer;
    S : double;
    C : cardinal;
  begin
    if assigned(fData[I])
      then
        begin
          S := 0;
          C := 0;
          J := fPosition;
          while J <> fOtherPos do
            begin
              S := S + fData[I]^[J];
              inc( C );
              inc( J );
              if J = fDataSize
                then J := 0;
            end;
          if C > 0
            then Result := S / C
            else Result := 0;
        end
      else Result := 0;
  end;

  procedure TVideo.SetMask( I : integer; M : boolean );
  begin
    if fMasks[I] <> M
      then
        begin
          fMasks[I] := M;
          Update;
        end;
  end;

  procedure TVideo.SetLevel( I, L : integer );
  begin
    if fLevels[I] <> L
      then
        begin
          fLevels[I] := L;
          Update;
        end;
  end;

  procedure TVideo.PaintData( aCanvas : TCanvas );

    procedure PaintChannel( Data : PDataBank; StartCell, Level : integer );
    var
      X, Y : integer;
      D, I : integer;
      S    : double;
    begin
      if (SamplePoints > 0) and (ValuePoints > 0)
        then
          with aCanvas do
            begin
              Pen.Style := psDot;
              MoveTo(Width, Level);
              LineTo(0, Level);
              Pen.Style := psSolid;
              X := 0;
              Y := Level - Round(Data^[StartCell] * ValuePixels / ValuePoints);
              MoveTo( X, Y );
              D := (StartCell div SamplePoints) * SamplePoints + SamplePoints;
              while (X < Width + SamplePixels) and (D <= DataSize) do
                begin
                  LineTo( X, Y );
                  S := 0;
                  for I := D - SamplePoints to D - 1 do
                    S := S + Data^[I];
                  S := (S/SamplePoints) * (ValuePixels/ValuePoints);
                  if S > 10000
                    then S := 10000;
                  if S < -10000
                    then S := -10000;
                  Y := Level - Round(S);
                  LineTo( X, Y );
                  inc( X, SamplePixels );
                  inc( D, SamplePoints );
                end;
            end;
    end;

    procedure PaintGrid;
    var
      I : integer;
    begin
      I := 0;
      if GridPixels > 0
        then
          with aCanvas do
            while I < Height do
              begin
                MoveTo( 0, I );
                LineTo( Width, I );
                inc( I, GridPixels );
              end;
      I := 0;
      if GridPixels > 0
        then
          with aCanvas do
            while I < Width do
              begin
                MoveTo( I, 0 );
                LineTo( I, Height );
                inc( I, GridPixels );
              end;
    end;

    procedure PaintMark;
    var
      X : integer;
    begin
      if not MaskOtherPos
        then
          begin
            aCanvas.Pen.Color := Color_Other;
            X := FindDisplacement( fOtherPos );
            with aCanvas do
              begin
                MoveTo( X, 0 );
                LineTo( X, Height );
              end;
          end;
      if not MaskPosition
        then
          begin
            aCanvas.Pen.Color := Color_Mark;
            X := FindDisplacement( fPosition );
            with aCanvas do
              begin
                MoveTo( X, 0 );
                LineTo( X, Height );
              end;
          end;
    end;

  begin
    with aCanvas do
      begin
        Brush.Color := Color_Back;
        Pen.Style   := psClear;
        Rectangle( 0, 0, Width + 1, Height + 1 );
        Pen.Style := psSolid;
        Pen.Color := Color_Grid;
        PaintGrid;
        Pen.Color := Color_CH1;
        if not Mask1 and assigned(fData[0])
          then PaintChannel( fData[0], StartCell, Height - Level1 );
        Pen.Color := Color_CH2;
        if not Mask2 and assigned(fData[1])
          then PaintChannel( fData[1], StartCell, Height - Level2 );
        PaintMark;
      end;
  end;

  function TVideo.FindPosition( X, Y : integer ) : integer;
  var
    SC : integer;
  begin
    if SamplePixels > 0
      then
        begin
          SC := StartCell div SamplePoints * SamplePoints;
          Result := SC + round(X * SamplePoints / SamplePixels);
        end
      else Result := 0;
  end;

  function TVideo.FindDisplacement( D : integer ) : integer;
  var
    SC : integer;
  begin
    if SamplePoints > 0
      then
        begin
          SC := StartCell div SamplePoints * SamplePoints;
          Result := round((D - SC) * SamplePixels / SamplePoints)
        end
      else Result := 0;
  end;

  procedure TVideo.ScrollStart( Sender : TObject );
  begin
    StartCell := (Sender as TScrollBar).Position;
  end;

  
{ Public procedures & functions }

  procedure Register;
  begin
    RegisterComponents( 'Vesta', [TVideo] );
  end;

end.

