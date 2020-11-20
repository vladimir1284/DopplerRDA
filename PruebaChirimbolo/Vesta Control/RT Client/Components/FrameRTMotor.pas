unit FrameRTMotor;

interface

uses
  SysUtils, Forms, 
  Rda_TLB, Menus, StdCtrls, ExtCtrls, Controls, Classes, Antena;

type
  TFrame_RTMotor = class(TFrame)
    Panel2: TPanel;
    Edit4: TEdit;
    Edit3: TEdit;
    Panel1: TPanel;
    PopupMenu2: TPopupMenu;
    Angulo1: TMenuItem;
    Codigo1: TMenuItem;
    PopupMenu1: TPopupMenu;
    RPM1: TMenuItem;
    CPS1: TMenuItem;
    Antenna: TAntenna;
    Label1: TLabel;
    Label2: TLabel;
    procedure RPM1Click(Sender: TObject);
  protected
    function  AngleText( Position : integer ) : string;
    function  SpeedText( Speed    : integer ) : string;
    function  TextAngle( Text : string ) : integer;
    function  TextSpeed( Text : string ) : integer;
  private
    fMotor   : IMotorStatus;
    fControl : IMotorControl;
    procedure SetMotor( Value : IMotorStatus );
  public
    procedure UpdateView;
  published
    property Motor   : IMotorStatus  read fMotor write SetMotor;
    property Control : IMotorControl read fControl;
  end;

var
  Frame_RTMotor: TFrame_RTMotor;

implementation

{$R *.DFM}

uses
  ElbrusTypes,
  Angle, Speed;

{ TFrame_Motor }

procedure TFrame_RTMotor.SetMotor(Value: IMotorStatus);
begin
  fMotor := Value;
  if assigned(fMotor)
    then fMotor.QueryInterface(IMotorControl, fControl)
    else fControl := nil;
end;

function TFrame_RTMotor.AngleText(Position: integer): string;
begin
  if Codigo1.Checked
    then Result := IntToStr(Position)
    else
      if (Antenna.AntennaType = at_Elevation) and
         (Position >= 2048)
        then Result := Format('%.1f', [CodeAngle(Position) - 360])
        else Result := Format('%.1f', [CodeAngle(Position)]);
end;

function TFrame_RTMotor.SpeedText(Speed: integer): string;
begin
  if CPS1.Checked
    then Result := IntToStr(Speed)
    else Result := Format('%.1f', [CodeSpeed(Speed)]);
end;

function TFrame_RTMotor.TextAngle(Text: string): integer;
begin
  if Codigo1.Checked
    then Result := StrToInt(Text)
    else Result := AngleCode(StrToFloat(Text));
end;

function TFrame_RTMotor.TextSpeed(Text: string): integer;
begin
  if CPS1.Checked
    then Result := StrToInt(Text)
    else Result := SpeedCode(StrToFloat(Text));
end;

procedure TFrame_RTMotor.UpdateView;
begin
  if assigned(Motor)
    then
      begin
        Antenna.Position := Motor.Posicion;
        Edit3.Text := AngleText(Antenna.Position);
        Edit4.Text := SpeedText(Motor.Velocidad);
      end;
end;

procedure TFrame_RTMotor.RPM1Click(Sender: TObject);
begin
  inherited;
  (Sender as TMenuItem).Checked := true;
  UpdateView;
end;

end.

