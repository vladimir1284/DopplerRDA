unit FrameRadar;

interface

uses
  Forms, StdCtrls, Tune, Onoff, Controls, Classes, CommonObjs, RadarWS, InvokeRegistry;

type
  TFrame_Radar = class(TFrame)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Led1: TLed;
    Led2: TLed;
    TuneGauge1: TTuneGauge;
    TuneGauge2: TTuneGauge;
    Label3: TLabel;
    Led3: TLed;
    procedure Button1Click(Sender: TObject);
  private
    fUpdating : boolean;
    fRadar : IRadarWS;
    fAuthHeader : TAuthHeader;

    function GetControl : IRadarWS;
    function GetRadar: IRadarWS;
  public
    procedure Init( Value : IRadarWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property Radar   : IRadarWS read GetRadar;
    property Control : IRadarWS read GetControl;
  end;

implementation

{$R *.DFM}

procedure TFrame_Radar.UpdateView;
begin
  if fUpdating then exit;
  if assigned(Radar)
    then
      begin
        fUpdating := true;
        try
          try
            with Radar do
              begin
                Led3.State := Red_Listo;
                Led1.State := Radar_On_P;
                Led2.State := Radar_On_N;
                TuneGauge1.Position := Muestra_P;
                TuneGauge2.Position := Muestra_N;
              end;
          except
          end;
        finally
          fUpdating := false;
        end;
      end;
end;

procedure TFrame_Radar.Button1Click(Sender: TObject);
begin
  if assigned(Control)
    then
      if Led1.State or Led2.State
        then Control.Apagar_Radar
        else Control.Encender_Radar;
end;

procedure TFrame_Radar.Init(Value: IRadarWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fRadar := Value;

  Button1.Enabled := assigned(Control);
  UpdateView;
end;

function TFrame_Radar.GetControl: IRadarWS;
begin
  result := fRadar;
end;

function TFrame_Radar.GetRadar: IRadarWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fRadar as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fRadar;
end;

end.

