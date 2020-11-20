unit FrameMotor;

interface

uses
  Windows, SysUtils, Forms, 
  Rda_TLB, Antena, Menus, StdCtrls, ComCtrls, Onoff, Buttons, ExtCtrls,
  Controls, Classes, Tune;

type
  TFrame_Motor = class(TFrame)
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Bulb1: TBulb;
    Bulb2: TBulb;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit1: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel1: TPanel;
    PopupMenu2: TPopupMenu;
    Angulo1: TMenuItem;
    Codigo1: TMenuItem;
    PopupMenu1: TPopupMenu;
    RPM1: TMenuItem;
    CPS1: TMenuItem;
    Antenna: TAntenna;
    PopupMenu3: TPopupMenu;
    Calibracion1: TMenuItem;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Button2: TButton;
    Bulb3: TBulb;
    Button1: TButton;
    procedure AntennaNewDesired(Sender: TObject; Position: Smallint);
    procedure MenuItemClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Calibracion1Click(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AntennaNewDesired2(Sender: TObject; Position: Smallint);
    procedure AntennaTypeChanged(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  protected
    function  AngleText( Position : integer ) : string;
    function  SpeedText( Speed    : integer ) : string;
    function  TextAngle( Text : string ) : integer;
    function  TextSpeed( Text : string ) : integer;
  private
    fMotor        : IMotorStatus;
    fControl      : IMotorControl;
    fObservations : IObservations;
    fTemplateName : string;
    procedure SetMotor( Value : IMotorStatus );
    procedure SetObservations( Value : IObservations );
    procedure Calibration;
    procedure SetGaugeParameters(Gauge : TTuneGauge; Min, Max, GoogMin, GoodMax : integer);
  public
    procedure UpdateView;
  published
    property Motor        : IMotorStatus  read fMotor        write SetMotor;
    property Control      : IMotorControl read fControl;
    property Observations : IObservations read fObservations write SetObservations;
  end;

var
  Frame_Motor: TFrame_Motor;

implementation

{$R *.DFM}

uses
  ElbrusTypes,
  Angle, Speed,
  MotorCalib, Shell_Client;

{ TFrame_Motor }

procedure TFrame_Motor.SetMotor(Value: IMotorStatus);
begin
  fMotor := Value;
  if assigned(fMotor)
    then fMotor.QueryInterface(IMotorControl, fControl)
    else fControl := nil;
  if assigned(Motor)
    then UpDown2.Position := Motor.SP_Velocidad;
  Antenna.Enabled := assigned(fMotor);
  CheckBox1.Enabled := assigned(fMotor);
  CheckBox2.Enabled := assigned(fMotor);
  UpDown1.Enabled := assigned(fMotor);
  SpeedButton1.Enabled := false;  //...
end;

procedure TFrame_Motor.SetObservations(Value: IObservations);
begin
  fObservations := Value;
  UpdateView;
end;

function TFrame_Motor.AngleText(Position: integer): string;
begin
  if Codigo1.Checked
    then Result := IntToStr(Position)
    else
      if (Antenna.AntennaType = at_Elevation) and
         (Position >= 2048)
        then Result := Format('%.1f', [CodeAngle(Position) - 360])
        else Result := Format('%.1f', [CodeAngle(Position)]);
end;

function TFrame_Motor.SpeedText(Speed: integer): string;
begin
  if CPS1.Checked
    then Result := IntToStr(Speed)
    else Result := Format('%.1f', [CodeSpeed(Speed)]);
end;

function TFrame_Motor.TextAngle(Text: string): integer;
begin
  if Codigo1.Checked
    then Result := StrToInt(Text)
    else Result := AngleCode(StrToFloat(Text));
end;

function TFrame_Motor.TextSpeed(Text: string): integer;
begin
  if CPS1.Checked
    then Result := StrToInt(Text)
    else Result := SpeedCode(StrToFloat(Text));
end;

procedure TFrame_Motor.AntennaNewDesired(Sender: TObject; Position: Smallint);
begin
  if assigned(Control)
    then Control.SP_Posicion := Position;
  UpdateView;
end;

procedure TFrame_Motor.UpdateView;
begin
  if assigned(Motor)
    then
      with Motor do
      begin
        Bulb3.State := Lazo_Sector;
        Bulb1.State := CheckBox1.Checked and (Abs(Posicion - SP_Posicion ) <= ShellClient.Configuration.Configuration.Angle_Accuracy);
        Bulb2.State := (Bulb3.State and (Abs( Abs(Velocidad) - Abs(SP_Velocidad) ) <= ShellClient.Configuration.Configuration.Speed_Accuracy)) or
                       (CheckBox2.Checked and (Abs(Velocidad - SP_Velocidad ) <= ShellClient.Configuration.Configuration.Speed_Accuracy));
        Antenna.Command  := SP_Posicion;
        Antenna.Position := Posicion;
        UpDown1.Position := Antenna.Command;
        Edit1.Text := AngleText(UpDown1.Position);
        Edit2.Text := SpeedText(UpDown2.Position);
        Edit3.Text := AngleText(Antenna.Position);
        Edit4.Text := SpeedText(Velocidad);
        if Control = nil
          then UpDown2.Position := Motor.SP_Velocidad;
        UpDown2.Enabled := (Bulb3.State) or (not Bulb3.State and CheckBox2.Checked);
      end;
  if assigned(fObservations)
    then SpeedButton1.Enabled := assigned(fObservations.Buscar(fTemplateName));
end;

procedure TFrame_Motor.MenuItemClick(Sender: TObject);
begin
  inherited;
  (Sender as TMenuItem).Checked := true;
  UpdateView;
end;

procedure TFrame_Motor.CheckBox1Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.Lazo_Posicion := CheckBox1.Checked;
  if CheckBox1.Checked
    then
      begin
        Control.Lazo_Sector := false;
        if CheckBox2.Checked
          then CheckBox2.Checked := false;
      end;
end;

procedure TFrame_Motor.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked
    then
      begin
        if CheckBox1.Checked
          then CheckBox1.Checked := false;
        Control.Lazo_Sector := false;
      end
    else
      begin
        UpDown2.Position := 0;
        UpDown2Click(UpDown2, btNext);
      end;
end;

procedure TFrame_Motor.Button2Click(Sender: TObject);
begin
  if CheckBox1.Checked
    then CheckBox1.Checked := false;
  if CheckBox2.Checked
    then CheckBox2.Checked := false;
  if assigned(Control)
    then Control.Lazo_Sector := not Bulb3.State;
end;

procedure TFrame_Motor.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  Antenna.Desired := (Sender as TUpDown).Position;
end;

procedure TFrame_Motor.Calibracion1Click(Sender: TObject);
begin
  Calibration;
end;

procedure TFrame_Motor.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  if assigned(Control)
    then Control.SP_Velocidad := UpDown2.Position;
  UpdateView;
end;

procedure TFrame_Motor.SpeedButton1Click(Sender: TObject);
begin
  if assigned(fObservations)
    then fObservations.Ejecutar(fTemplateName);
end;

procedure TFrame_Motor.Calibration;
begin
  if assigned(fControl)
    then
      with TMotorCalib_Dialog.Create(Self) do
        try
          if Antenna.AntennaType = at_Azimut
            then Caption := 'Motor Azimut'
            else Caption := 'Motor Elevacion';
          Edit1.Text := Format('%.1f', [fControl.Lazo_Posicion_K]);
          Edit2.Text := Format('%.1f', [fControl.Lazo_Velocidad_K]);
          if ShowModal = ID_OK
            then
              begin
                try
                  fControl.Lazo_Posicion_K := StrToFloat(Edit1.Text);
                except on EConvertError do
                end;
                try
                  fControl.Lazo_Velocidad_K := StrToFloat(Edit2.Text);
                except on EConvertError do
                end;
              end;
        finally
          Release;
        end;
end;

procedure TFrame_Motor.Button1Click(Sender: TObject);
begin
  Calibration;
end;

procedure TFrame_Motor.AntennaNewDesired2(Sender: TObject; Position: Smallint);
begin
  if assigned(Control)
    then Control.Marca_Posicion := Position;
  UpdateView;
end;

procedure TFrame_Motor.AntennaTypeChanged(Sender: TObject);
begin
  case Antenna.AntennaType of
    at_Azimut:
      begin
        fTemplateName := Plantilla_RHI;
        SpeedButton1.Caption := 'RH&I';
        UpDown1.Min :=     0;
        UpDown1.Max :=  4095;
      end;
    at_Elevation:
      begin
        fTemplateName := Plantilla_PPI;
        SpeedButton1.Caption := 'PP&I';
        UpDown1.Min := -2048;
        UpDown1.Max :=  2047;
      end;
  end;
  UpdateView;end;

procedure TFrame_Motor.SetGaugeParameters(Gauge: TTuneGauge; Min, Max, GoogMin, GoodMax: integer);
begin
  Gauge.Min      := Min;
  Gauge.Max      := Max;
  Gauge.GoodMin  := GoogMin;
  Gauge.GoodMax  := GoodMax;
end;

end.

