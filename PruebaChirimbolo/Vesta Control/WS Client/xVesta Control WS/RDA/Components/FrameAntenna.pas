unit FrameAntenna;

interface

uses
  Forms, StdCtrls, Onoff, Controls, Classes, CommonObjs, AntennaWS, InvokeRegistry;

type
  TFrame_Antenna = class(TFrame)
    Led2: TLed;
    Led1: TLed;
    Led4: TLed;
    Led5: TLed;
    Led3: TLed;
    Button1: TButton;
    Bulb1: TBulb;
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    fUpdating : boolean;
    fAntenna : IAntennaWS;
    fAuthHeader : TAuthHeader;

    function GetAntenna : IAntennaWS;
    function GetAntennaControl: IAntennaWS;
  public
    procedure Init( Value : IAntennaWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property Antenna : IAntennaWS read GetAntenna;
    property Control : IAntennaWS read GetAntennaControl;
  end;

implementation

{$R *.DFM}

{ TFrame_Antenna }

procedure TFrame_Antenna.UpdateView;
begin
  if fUpdating
    then exit;
  if assigned(Antenna)
    then
      begin
        fUpdating := true;
        try
          try
            Led1.State  := Antenna.Antena_Listo;
            Led2.State  := Antenna.Cupula_Abierta;
            Led3.State  := Antenna.Averia_Excitacion;
            Led4.State  := Antenna.Limite_P;
            Led5.State  := Antenna.Limite_N;
            Bulb1.State := Antenna.Acc_On;
          except
          end;
        finally
          fUpdating := false;
        end;
      end;
end;

procedure TFrame_Antenna.Button1Click(Sender: TObject);
begin
  if assigned(Control)
    then
      if Bulb1.State
        then Control.Apagar_Acc
        else Control.Encender_Acc;
end;

procedure TFrame_Antenna.Button2Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.Apagar_Acc;
end;

procedure TFrame_Antenna.Init(Value: IAntennaWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fAntenna := Value;

  UpdateView;
end;

function TFrame_Antenna.GetAntenna: IAntennaWS;
begin
  result := fAntenna;
end;

function TFrame_Antenna.GetAntennaControl: IAntennaWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fAntenna as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fAntenna;
end;

end.

