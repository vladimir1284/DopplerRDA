unit FrameVideo;

interface

uses
  SysUtils, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Onoff, ExtCtrls, Menus, ElbrusTypes, Rda_TLB,
  ActnList, Classes, Video, Constants;

type
  TFrame_Video = class(TFrame)
    Popup1: TPopupMenu;
    Celdas1: TMenuItem;
    Kilometros1: TMenuItem;
    Tiempo1: TMenuItem;
    Panel4: TPanel;
    Panel1: TPanel;
    Bulb1: TBulb;
    Button15: TButton;
    Button14: TButton;
    Button12: TButton;
    Button13: TButton;
    ScrollBar1: TScrollBar;
    Video1: TVideo;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    rgSignal: TRadioGroup;
    Panel3: TPanel;
    Panel6: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit7: TEdit;
    Edit8: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure Video1Change(Sender: TObject);
    procedure Video1NewData(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure Label13MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label13MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label13MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Bulb1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure MenuItem_click(Sender: TObject);
    procedure rgSignalClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    function  ValueToStr( Value : single ) : string;
    function  CellToStr ( Channel : integer; Cell  : integer ) : string;
  private
    fVideo    : IVideo;
    fControl  : IVideoControl;
    fOsc_On,
    fRT_On    : boolean;
    fAdjust   : boolean;
    fPotMet1,
    fPotMet2  : double;

    procedure SetVideo( Value : IVideo );
    procedure SetData(Channel, AcqCells, CellSize : integer; Data : pointer);
  public
    procedure UpdateView;
    procedure UpdateData(channel : integer; data : pointer; CellCount, CellSize : integer; points, pixels, level : integer);

    function  Acquiring_dBT_DBZ : boolean;
    function  Acquiring_dBT_DB  : boolean;
    function  Acquiring_dBZ_DBZ : boolean;
    function  Acquiring_dBZ_DB  : boolean;
    function  Acquiring_Speed   : boolean;
    function  Acquiring_Width   : boolean;
    function  Acquiring_Calibration : boolean;
    procedure StopAcquiring;
  published
    property Video   : IVideo        read fVideo write SetVideo;
    property Control : IVideoControl read fControl;
  end;

implementation

{$R *.DFM}

uses
  ActiveX, Shell_Client, Math;

const
  Light_Speed = 300000;  // km/s

  signal_dbz_dbz     = 0;
  signal_dbz_db      = 1;
  signal_dbt_dbz     = 2;
  signal_dbt_db      = 3;
  signal_v           = 4;
  signal_w           = 5;
  signal_calibration = 6;

procedure TFrame_Video.SetVideo(Value: IVideo);
begin
  fVideo := Value;
  fAdjust := true;
  if assigned(fVideo)
    then fVideo.QueryInterface(IVideoControl, fControl)
    else fControl := nil;
end;

procedure TFrame_Video.UpdateView;
begin
  if (Bulb1.State) and assigned(Video)
    then
      begin
        fPotMet1 := ShellClient.TxRx1.PotMet;
        fPotMet2 := ShellClient.TxRx2.PotMet;
      end;
end;

function TFrame_Video.CellToStr(Channel : integer; Cell: integer): string;
begin
  if Celdas1.Checked
    then Result := IntToStr(Cell)
    else if Kilometros1.Checked
           then Result := Format('%.1f km', [Cell * Light_Speed/(2*Video.Frequency(Channel))])
           else if Tiempo1.Checked
                  then Result := Format('%.0f µs', [Cell * 1000000 / Video.Frequency(Channel)]);
end;

function TFrame_Video.ValueToStr(Value: single): string;
begin
  Result := Format('%.1f', [Value]);
end;

procedure TFrame_Video.Video1Change(Sender: TObject);
begin
  with Sender as TVideo do
    begin
      Label1.Color := Color_CH1;
      Label2.Color := Color_CH2;
    end;
end;

procedure TFrame_Video.Video1NewData(Sender: TObject);
begin
  with Sender as TVideo do
    begin
      Edit1.Text := ValueToStr(Value1);
      Edit2.Text := ValueToStr(Value2);
      Edit3.Text := Format('%.2f', [Average1]);
      Edit4.Text := Format('%.2f', [Average2]); 
      Edit5.Text := CellToStr(0, Position);
      Edit6.Text := CellToStr(0, OtherPos);
      Edit7.Text := CellToStr(1, Position);
      Edit8.Text := CellToStr(1, OtherPos);
    end;
end;

procedure TFrame_Video.Button15Click(Sender: TObject);
begin
  with Video1 do
    if SamplePixels > 1
      then SamplePixels := pred(SamplePixels)
      else SamplePoints := succ(SamplePoints);
end;

procedure TFrame_Video.Button14Click(Sender: TObject);
begin
  with Video1 do
    if SamplePoints > 1
      then SamplePoints := pred(SamplePoints)
      else SamplePixels := succ(SamplePixels)
end;

procedure TFrame_Video.Button12Click(Sender: TObject);
begin
  with Video1 do
    if ValuePoints > 1
      then ValuePoints := pred(ValuePoints)
      else ValuePixels := succ(ValuePixels)
end;

procedure TFrame_Video.Button13Click(Sender: TObject);
begin
  with Video1 do
    if ValuePixels > 1
      then ValuePixels := pred(ValuePixels)
      else ValuePoints := succ(ValuePoints);
end;

procedure TFrame_Video.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  Video1.Position := (Sender as TUpDown).Position;
end;

procedure TFrame_Video.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  Video1.OtherPos := (Sender as TUpDown).Position;
end;

procedure TFrame_Video.Label13MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft
    then (Sender as TLabel).Tag := Y;
end;

procedure TFrame_Video.Label13MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  with Sender as TLabel do
    if Tag <> -1
      then
        begin
          Top := Top + Y - Tag;
          if Sender = Label1
            then Video1.Level1 := Video1.Height - Top
            else Video1.Level2 := Video1.Height - Top;
        end;
end;

procedure TFrame_Video.Label13MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft
    then (Sender as TLabel).Tag := -1;
end;

procedure TFrame_Video.Bulb1Click(Sender: TObject);
var
  Trash : pointer;
begin
  with Sender as TBulb do
  begin
    State := not State;
    if State
      then Video.StartAcquiring(CheckBox1.Checked, CheckBox2.Checked)
      else
        begin
          //Video1.DataSize := 2000;
          GetMem(Trash, SizeOf(double) * Video1.DataSize);
          try
            FillChar(Trash^, SizeOf(double) * Video1.DataSize, 0);
            Video1.SetData1(Trash^);
            Video1.SetData2(Trash^);
          finally
            FreeMem( Trash );
          end;
       end;
  end;
end;

procedure TFrame_Video.CheckBox1Click(Sender: TObject);
begin
  Video1.Mask1 := not CheckBox1.Checked;
  Label1.Visible := CheckBox1.Checked;
  if Bulb1.State
    then Video.StartAcquiring(CheckBox1.Checked, CheckBox2.Checked);
end;

procedure TFrame_Video.CheckBox2Click(Sender: TObject);
begin
  Video1.Mask2 := not CheckBox2.Checked;
  Label2.Visible := CheckBox2.Checked;
  if Bulb1.State
    then Video.StartAcquiring(CheckBox1.Checked, CheckBox2.Checked);
end;

procedure TFrame_Video.MenuItem_click(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := true;
end;

procedure TFrame_Video.UpdateData(channel : integer; data: pointer; CellCount, CellSize, points, pixels, level: integer);
var
  i : integer;
begin
  if fAdjust
    then
      begin
        //Video1.DataSize := CellCount;
        Video1.ValuePoints := points;
        Video1.ValuePixels := pixels;

        if Acquiring_dBT_DBZ or Acquiring_dBZ_DBZ
          then level := level + 60;

        if(channel = 0)
           then
             begin
               Video1.Level1 := level;
               Label1.Top := Video1.Height - Video1.Level1;
             end
           else
             begin
               Video1.Level2 := level + 20;
               Label2.Top := Video1.Height - Video1.Level2;
             end;

        fAdjust := false;
      end;

  SetData(channel, CellCount, CellSize, data);
end;

procedure TFrame_Video.SetData(Channel, AcqCells, CellSize: integer; Data: pointer);
var
  i  : integer;
  PotMet   : double;
  CellDistance : double;
  DistanceCorrection : double;
  GaseousAttenuationCorrection : double;
  Buffer : pointer;
begin
  GetMem(Buffer, SizeOf(single) * Video1.DataSize);
  try
    FillChar(Buffer^, SizeOf(single) * Video1.DataSize, 0);

    if Acquiring_dBT_DBZ or Acquiring_dBZ_DBZ
      then
        begin
          if channel = 0
            then PotMet := fPotMet1
            else PotMet := fPotMet2;

          for i := 0 to AcqCells-1 do
          begin
            if PSingles(Data)^[i] > 0
              then
                begin
                  CellDistance := CellSize * (i+1) / 1000;
                  DistanceCorrection := 20 * Log10(CellDistance);
                  GaseousAttenuationCorrection := GaseousAttenuation * CellDistance;
                  PSingles(Data)^[i] := PSingles(Data)^[i] + DistanceCorrection + GaseousAttenuationCorrection;
                end;
            PSingles(Buffer)^[i] := PSingles(Data)^[i] + PotMet;
          end;
        end
      else
          for i := 0 to AcqCells-1 do
            PSingles(Buffer)^[i] := PSingles(Data)^[i];

    if(channel = 0)
       then Video1.SetData1(Buffer^)
       else Video1.SetData2(Buffer^);
  finally
    FreeMem(Buffer);
  end;
end;

procedure TFrame_Video.rgSignalClick(Sender: TObject);
begin
  fAdjust := true;
  if Bulb1.State
    then Video.StartAcquiring(CheckBox1.Checked, CheckBox2.Checked);
end;

function TFrame_Video.Acquiring_Calibration: boolean;
begin
  result := Bulb1.State and (rgSignal.ItemIndex = signal_calibration);
end;

function TFrame_Video.Acquiring_dBT_DB: boolean;
begin
  result := Bulb1.State and (rgSignal.ItemIndex = signal_dbt_db);
end;

function TFrame_Video.Acquiring_dBT_DBZ: boolean;
begin
  result := Bulb1.State and (rgSignal.ItemIndex = signal_dbt_dbz);
end;

function TFrame_Video.Acquiring_dBZ_DB: boolean;
begin
  result := Bulb1.State and (rgSignal.ItemIndex = signal_dbz_db);
end;

function TFrame_Video.Acquiring_dBZ_DBZ: boolean;
begin
  result := Bulb1.State and (rgSignal.ItemIndex = signal_dbz_dbz);
end;

function TFrame_Video.Acquiring_Speed: boolean;
begin
  result := Bulb1.State and (rgSignal.ItemIndex = signal_v);
end;

function TFrame_Video.Acquiring_Width: boolean;
begin
  result := Bulb1.State and (rgSignal.ItemIndex = signal_w);
end;

procedure TFrame_Video.StopAcquiring;
begin
  Bulb1.State := false;
end;

procedure TFrame_Video.Button1Click(Sender: TObject);
begin
  ShellClient.RT_Ch1.Show;
end;

procedure TFrame_Video.Button2Click(Sender: TObject);
begin
  ShellClient.RT_Ch2.Show;
end;

end.

