unit Onoff;

interface

  uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

  type
    TOnOff = class(TGraphicControl)
    public
      constructor Create( anOwner : TComponent );  override;
      destructor  Destroy;                         override;
    private
      fState     : boolean;
      fBitmap    : TBitmap;
      fOnChange  : TNotifyEvent;
      fOnTurnOn  : TNotifyEvent;
      fOnTurnOff : TNotifyEvent;
    protected
      procedure SetEnabled( aEnabled : boolean );  override;
      procedure SetState( aState : boolean );
    published
      property State : boolean read fState write SetState default false;
      property Anchors;
      property Enabled;
    published
      property OnChange  : TNotifyEvent read fOnChange  write fOnChange;
      property OnTurnOn  : TNotifyEvent read fOnTurnOn  write fOnTurnOn;
      property OnTurnOff : TNotifyEvent read fOnTurnOff write fOnTurnOff;
      property OnClick;
      property ShowHint;
    public
      property Bitmap : TBitmap read fBitmap;
    protected
      procedure Paint;  override;
    private
      procedure UpdateBitmap;
      function  BitmapName : string;  virtual;  abstract;
    end;

    TBulb = class(TOnOff)
    private
      function BitmapName : string;  override;
    end;

    TLedColor = ( ldRed, ldGreen, ldYellow );

    TLed = class(TOnOff)
    private
      theColor : TLedColor;
      procedure SetColor( aColor : TLedColor );
    published
      property Color : TLedColor read theColor write SetColor;
    private
      function BitmapName : string;  override;
    end;

  procedure Register;


implementation
{$R Onoff.res}


{ TOnOff methods }

  constructor TOnOff.Create( anOwner : TComponent );
  begin
    inherited Create( anOwner );
    Enabled := true;
    UpdateBitmap;
  end;

  destructor TOnOff.Destroy;
  begin
    fBitmap.Free;
    inherited;
  end;

  procedure TOnOff.SetEnabled( aEnabled : boolean );
  begin
    inherited;
    UpdateBitmap;
    Repaint;
  end;

  procedure TOnOff.SetState( aState : boolean );
  begin
    if Enabled and (fState <> aState)
      then
        begin
          fState  := aState;
          UpdateBitmap;
          Repaint;
          if assigned(fOnChange)
            then fOnChange( Self );
          if fState
            then
              begin
                if assigned(fOnTurnOn)
                  then fOnTurnOn( Self );
              end
            else
              begin
                if assigned(fOnTurnOff)
                  then fOnTurnOff( Self );
              end;
        end;
  end;

  procedure TOnOff.Paint;
  begin
    Canvas.Draw( 0, 0, fBitmap );
  end;

  procedure TOnOff.UpdateBitmap;
  begin
    if fBitMap = nil
      then fBitMap := TBitMap.Create;
    fBitmap.LoadFromResourceName( HInstance, BitmapName );
    SetBounds( Left, Top, Bitmap.Width, Bitmap.Height );
  end;


{TBulb methods}

  function TBulb.BitmapName : string;
  begin
    if Enabled
      then
        if State
          then Result := 'BulbOn'
          else Result := 'BulbOff'
      else Result := 'BulbDisabled';
  end;


{TLed methods}

  procedure TLed.SetColor( aColor : TLedColor );
  begin
    if theColor <> aColor
      then
        begin
          theColor := aColor;
          UpdateBitmap;
          Repaint;
        end;
  end;

  function TLed.BitmapName : string;
  begin
    if Enabled
      then
        if State
          then
            case Color of
              ldRed    : Result := 'RedLedOn';
              ldGreen  : Result := 'GreenLedOn';
              ldYellow : Result := 'YellowLedOn';
              else Result := 'LedDisabled';
            end
          else
            case Color of
              ldRed    : Result := 'RedLedOff';
              ldGreen  : Result := 'GreenLedOff';
              ldYellow : Result := 'YellowLedOff';
              else Result := 'LedDisabled';
            end
      else Result := 'LedDisabled';
  end;


{ Public procedures & functions }

  procedure Register;
  begin
    RegisterComponents('Vesta', [TBulb, TLed]);
  end;

end.

