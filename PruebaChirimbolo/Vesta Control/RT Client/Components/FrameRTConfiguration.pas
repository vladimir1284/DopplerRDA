unit FrameRTConfiguration;

interface

uses
  SysUtils, Forms, Dialogs,
  Rda_TLB, ExtCtrls, ComCtrls, StdCtrls, Controls, Classes;

type
  TFrame_RTConfiguration = class(TFrame)
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Label1: TLabel;
    ComboBox2: TComboBox;
    GroupBox1: TGroupBox;
    LRadarName: TLabel;
    LRadarOwner: TLabel;
    LRadarLongitude: TLabel;
    LRadarLatitude: TLabel;
    LRadarAltitude: TLabel;
    LRadarRange: TLabel;
    Video: TTabSheet;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    ComboBox20: TComboBox;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox21: TComboBox;
    ComboBox23: TComboBox;
    ComboBox24: TComboBox;
    ComboBox25: TComboBox;
    ComboBox26: TComboBox;
    Label106: TLabel;
    Label107: TLabel;
    Edit41: TEdit;
    UpDown11: TUpDown;
    Label108: TLabel;
    Edit42: TEdit;
    UpDown12: TUpDown;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Label9: TLabel;
    CheckBox1: TCheckBox;
    Label6: TLabel;
    CheckBox2: TCheckBox;
    Label7: TLabel;
    Edit3: TEdit;
    UpDown1: TUpDown;
    AdClockSource: TRadioGroup;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox20Select(Sender: TObject);
    procedure ComboBox21Select(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    fConfiguration : IConfiguration;
    fControl       : IConfigurationControl;
    procedure SetConfiguration( Value : IConfiguration );
    function  RateIndex( Rate : single ) : integer;
  public
    procedure UpdateView;
  published
    property Configuration : IConfiguration        read fConfiguration write SetConfiguration;
    property Control       : IConfigurationControl read fControl;
  end;

implementation

{$R *.DFM}

uses
  Registry, ActiveX, ElbrusTypes, Shell_RTClient;

const
  ClientRootKey = {HKEY_CURRENT_USER} '\SOFTWARE\LDT\Vesta\RTClient';
  LoginKey = ClientRootKey + '\Login';

const
  AutoLogValue = 'AutoLog';

{ TFrame_Configuration }

procedure TFrame_RTConfiguration.SetConfiguration(Value: IConfiguration);
begin
  fConfiguration := Value;
  if assigned(fConfiguration)
    then fConfiguration.QueryInterface(IConfigurationControl, fControl)
    else fControl := nil;

  Button2.Enabled := assigned(fConfiguration);
  if Button2.Enabled
    then Button2Click(Button2);
  Button1.Enabled := assigned(fControl) or assigned(fConfiguration);

  General.Enabled := assigned(fControl);
  Video.Enabled := assigned(fControl);
end;

procedure TFrame_RTConfiguration.UpdateView;
begin
  Button2Click(Button2);
end;

function TFrame_RTConfiguration.RateIndex( Rate : single ) : integer;
var
  I, B : integer;
  D : single;
begin
  B := Low(Combo_Freqs);
  D := abs(Combo_Freqs[B] - Rate);
  for I := Low(Combo_Freqs) + 1 to High(Combo_Freqs) do
    if abs(Combo_Freqs[I] - Rate) < D
      then
        begin
          B := I;
          D := abs(Combo_Freqs[B] - Rate)
        end;
  Result := B;
end;

procedure TFrame_RTConfiguration.Button2Click(Sender: TObject);
var
  Video_Gains     : PSafeArray;
  VideoGainsArray : VideoGains;
  i : integer;
begin  // Restaurar
  if assigned(fConfiguration)
    then
      with fConfiguration do
        begin
          if Radar_ID < ComboBox2.Items.Count
            then ComboBox2.ItemIndex := Radar_ID
            else ComboBox2.Text := IntToStr(Radar_ID);
          AdClockSource.ItemIndex := Ord( ClockSource = true );
          ComboBox2Select( ComboBox2 );
          Edit2.Text := Format('%.2f', [Beam_Ch1]);
          Edit1.Text := Format('%.2f', [Beam_Ch2]);
          UpDown1.Position := RT_SpeckleUmbral;
          UpDown11.Position := RTPort;
          Edit41.Text := IntToStr( UpDown11.Position );
          UpDown12.Position := RTMaxClients;
          Edit42.Text := IntToStr( UpDown12.Position );
          CheckBox2.Checked := RT_Speckle_Remove;
          if VideoGains( Video_Gains ) = S_OK
            then
              begin
                for i := 0 to 3 do
                  VideoGainsArray[i] := PWords(Video_Gains.pvData)^[I];
                ComboBox23.ItemIndex := VideoGainsArray[0];
                ComboBox24.ItemIndex := VideoGainsArray[1];
                ComboBox25.ItemIndex := VideoGainsArray[2];
                ComboBox26.ItemIndex := VideoGainsArray[3];
                SafeArrayDestroy( Video_Gains );
              end;
          ComboBox20.ItemIndex := RateIndex( SampleRate );
          ComboBox20Select( ComboBox20 );
          ComboBox21.ItemIndex := Ch1Port;
          Edit15.Text := IntToStr( Ch2Port );
        end;
  with TRegistry.Create do
    try
      CheckBox1.Checked := OpenKey(LoginKey, false) and
                           ValueExists(AutoLogValue) and
                           ReadBool(AutoLogValue);
    finally
      Free;
    end;
end;

procedure TFrame_RTConfiguration.Button1Click(Sender: TObject);
var
  SAB : TSafeArrayBound;
  Video_Gains     : PSafeArray;
  VideoGainsArray : VideoGains;
  i, V, C  : integer;
begin  // Configurar
  if Button1.Enabled
    then
      try
        if assigned(fConfiguration)
          then
            with fConfiguration do
            begin
              RT_Speckle_Remove := CheckBox2.Checked;
              RT_SpeckleUmbral := UpDown1.Position;
              Save;
            end;
        if assigned(fControl)
          then
            with fControl do
              begin
                Val(ComboBox2.Text, V, C);
                if (C = 0) and (V > 0)
                  then Radar_ID := V
                  else Radar_ID := ComboBox2.ItemIndex;
                ClockSource := boolean( AdClockSource.ItemIndex );
                Beam_Ch1 := StrToFloat(Edit2.Text);
                Beam_Ch2 := StrToFloat(Edit1.Text);
                RTPort := UpDown11.Position;
                RTMaxClients := UpDown12.Position;
                SAB.cElements := 4;
                Video_Gains := SafeArrayCreate( VT_UI2, 1, SAB );
                VideoGainsArray[0] := ComboBox23.ItemIndex;
                VideoGainsArray[1] := ComboBox24.ItemIndex;
                VideoGainsArray[2] := ComboBox25.ItemIndex;
                VideoGainsArray[3] := ComboBox26.ItemIndex;
                for i := 0 to 3 do
                  PWords(Video_Gains.pvData)^[I] := VideoGainsArray[i];
                VideoGains( Video_Gains );
                SafeArrayDestroy( Video_Gains );

                SampleRate := Combo_Freqs[ComboBox20.ItemIndex];
                Ch1Port := ComboBox21.ItemIndex;
                Ch2Port := StrToInt(Edit15.Text);
                Save;
              end;
        with TRegistry.Create do
          try
            if OpenKey(LoginKey, true)
              then WriteBool(AutoLogValue, CheckBox1.Checked);
          finally
            Free;
          end;
        Button2Click(Button2);
        if Assigned( ShellRTClient.RT_Ch1 )
          then
            begin
              ShellRTClient.RT_Ch1.RTDisplay.BeamWidth := fConfiguration.Beam_Ch1;
              ShellRTClient.RT_Ch1.RefreshData;
            end;
        if Assigned( ShellRTClient.RT_Ch2 )
          then
            begin
              ShellRTClient.RT_Ch2.RTDisplay.BeamWidth := fConfiguration.Beam_Ch2;
              ShellRTClient.RT_Ch2.RefreshData;
            end;
      except;
        Button2Click( Sender );
      end;
end;

procedure TFrame_RTConfiguration.ComboBox20Select(Sender: TObject);
const
  Speed_of_Light = 300000000.0;  // m/s
var
  Freq_AD : single;
begin
  Freq_AD := Combo_Freqs[ ComboBox20.ItemIndex ];
  // Cell length
  Edit14.Text := Format('%.0f', [Speed_of_Light/(2*Freq_AD)]);
end;

procedure TFrame_RTConfiguration.ComboBox21Select(Sender: TObject);
begin
  case ComboBox21.ItemIndex of
    0: Edit15.Text := '1';
    1: Edit15.Text := '0';
    2: Edit15.Text := '3';
    3: Edit15.Text := '2';
  end;
end;

procedure TFrame_RTConfiguration.ComboBox2Select(Sender: TObject);
begin
  try
    LRadarName.Caption      := 'Nombre: ' + fConfiguration.RadarName[ ComboBox2.ItemIndex ];
    LRadarOwner.Caption     := 'Lugar: ' + fConfiguration.RadarOwner[ ComboBox2.ItemIndex ];
    LRadarRange.Caption     := 'Tipo: ' + IntToStr( fConfiguration.RadarRange[ ComboBox2.ItemIndex ] ) + ' Kms';
    LRadarLatitude.Caption  := 'Latitud: ' + FormatFloat( '0.0000', fConfiguration.RadarLatitude[ ComboBox2.ItemIndex ] );
    LRadarLongitude.Caption := 'Longitud: ' + FormatFloat( '0.0000',  fConfiguration.RadarLongitude[ ComboBox2.ItemIndex ] );
    LRadarAltitude.Caption  := 'Altitud: ' + FloatToStr( fConfiguration.RadarAltitude[ ComboBox2.ItemIndex ] ) + ' metros';
  except
  end;
end;

procedure TFrame_RTConfiguration.Button7Click(Sender: TObject);
begin
  if fControl.TestSMTPConfig
    then ShowMessage( 'Configuracion correcta' )
    else ShowMessage( 'Hay algun problema en la configuracion' );
end;

procedure TFrame_RTConfiguration.Button8Click(Sender: TObject);
begin
  if fControl.SendTestEMail
    then ShowMessage( 'Correo enviado exitosamente' )
    else ShowMessage( 'Hay algun problema en la configuracion' );
end;

end.

