unit FrameRealTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls;

type
  TRealTime = class(TFrame)
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    fVideo   : IVideo;
    procedure SetVideo( Value : IVideo );
  published
    property Video   : IVideo        read fVideo write SetVideo;
    property Control : IVideoControl read fControl;
    property Pulse   : IPulse        read fPulse;
  public
    procedure StartAcquisition;
    procedure StopAcquisition;
    procedure UpdateView;
  end;

implementation

{$R *.dfm}

procedure TRealTime.StartAcquisition;
begin
  Timer1.Enabled := true;
  CheckBox1.Checked := true;
end;

procedure TRealTime.StopAcquisition;
begin
  Timer1.Enabled := false;
  CheckBox1.Checked := false;
end;

procedure TRealTime.Timer1Timer(Sender: TObject);
begin
  UpdateView;
end;

procedure TRealTime.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked
    then StartAcquisition
    else StopAcquisition;
end;

procedure TRealTime.UpdateView;
begin
//..
end;

procedure TRealTime.SetVideo(Value: IVideo);
begin
  fVideo := Value;
  if assigned(fVideo)
    then
      begin
        fVideo.QueryInterface(IVideoControl, fControl);
        fVideo.QueryInterface(IPulse, fPulse);
      end
    else
      begin
        fControl := nil;
        fPulse   := nil;
      end;
  if assigned(fControl)
    then
      begin
        fControl.Frecuencia_AD := ShellClient.GeneralConfiguration.Configuration.SampleRate;
        FreqAD.ItemIndex := RateIndex( ShellClient.GeneralConfiguration.Configuration.SampleRate );
      end;
  UpdateView;
end;

end.
