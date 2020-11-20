unit Shell_Chirbolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, ComCtrls, StdCtrls,
  Driver, Onoff, Video, Antena;

type
  TShellChirimbolo = class(TForm)
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    tabDeva: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    tbMPS1: TTrackBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    ProgressBar4: TProgressBar;
    ProgressBar5: TProgressBar;
    ProgressBar6: TProgressBar;
    ProgressBar7: TProgressBar;
    ProgressBar8: TProgressBar;
    ProgressBar9: TProgressBar;
    ProgressBar10: TProgressBar;
    ProgressBar11: TProgressBar;
    ProgressBar12: TProgressBar;
    ProgressBar13: TProgressBar;
    ProgressBar14: TProgressBar;
    ProgressBar15: TProgressBar;
    ProgressBar16: TProgressBar;
    txAI1: TEdit;
    txAI2: TEdit;
    txAI3: TEdit;
    txAI4: TEdit;
    txAI5: TEdit;
    txAI6: TEdit;
    txAI7: TEdit;
    txAI8: TEdit;
    txAI9: TEdit;
    txAI11: TEdit;
    txAI12: TEdit;
    txAI13: TEdit;
    txAI14: TEdit;
    txAI15: TEdit;
    txAI16: TEdit;
    Edit17: TEdit;
    udMPS1: TUpDown;
    txAI10: TEdit;
    udMPS2: TUpDown;
    Edit28: TEdit;
    tbMPS2: TTrackBar;
    sb31: TSpeedButton;
    sb30: TSpeedButton;
    sb29: TSpeedButton;
    sb28: TSpeedButton;
    sb27: TSpeedButton;
    sb26: TSpeedButton;
    sb25: TSpeedButton;
    sb24: TSpeedButton;
    sb23: TSpeedButton;
    sb22: TSpeedButton;
    sb21: TSpeedButton;
    sb20: TSpeedButton;
    sb19: TSpeedButton;
    sb18: TSpeedButton;
    sb17: TSpeedButton;
    sb16: TSpeedButton;
    l31: TLed;
    l30: TLed;
    l29: TLed;
    l28: TLed;
    l27: TLed;
    l26: TLed;
    l25: TLed;
    l24: TLed;
    l23: TLed;
    l22: TLed;
    l21: TLed;
    l20: TLed;
    l19: TLed;
    l18: TLed;
    l17: TLed;
    l16: TLed;
    sb15: TSpeedButton;
    sb14: TSpeedButton;
    sb13: TSpeedButton;
    sb12: TSpeedButton;
    sb11: TSpeedButton;
    sb10: TSpeedButton;
    sb9: TSpeedButton;
    sb8: TSpeedButton;
    sb7: TSpeedButton;
    sb6: TSpeedButton;
    sb5: TSpeedButton;
    sb4: TSpeedButton;
    sb3: TSpeedButton;
    sb2: TSpeedButton;
    sb1: TSpeedButton;
    sb0: TSpeedButton;
    l15: TLed;
    l14: TLed;
    l12: TLed;
    l11: TLed;
    l10: TLed;
    l9: TLed;
    l8: TLed;
    l7: TLed;
    l6: TLed;
    l5: TLed;
    l4: TLed;
    l3: TLed;
    l2: TLed;
    l1: TLed;
    l0: TLed;
    l13: TLed;
    Button1: TButton;
    Azimut1: TAzimut;
    Elevation1: TElevation;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit29: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label36: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    sb63: TSpeedButton;
    sb62: TSpeedButton;
    sb61: TSpeedButton;
    sb60: TSpeedButton;
    sb59: TSpeedButton;
    sb58: TSpeedButton;
    sb57: TSpeedButton;
    sb56: TSpeedButton;
    sb55: TSpeedButton;
    sb54: TSpeedButton;
    sb53: TSpeedButton;
    sb52: TSpeedButton;
    sb51: TSpeedButton;
    sb50: TSpeedButton;
    sb49: TSpeedButton;
    sb48: TSpeedButton;
    sb47: TSpeedButton;
    sb46: TSpeedButton;
    sb45: TSpeedButton;
    sb44: TSpeedButton;
    sb43: TSpeedButton;
    sb42: TSpeedButton;
    sb41: TSpeedButton;
    sb40: TSpeedButton;
    sb39: TSpeedButton;
    sb38: TSpeedButton;
    sb37: TSpeedButton;
    sb36: TSpeedButton;
    sb35: TSpeedButton;
    sb34: TSpeedButton;
    sb33: TSpeedButton;
    sb32: TSpeedButton;
    l32: TLed;
    l33: TLed;
    l34: TLed;
    l35: TLed;
    l36: TLed;
    l37: TLed;
    l38: TLed;
    l39: TLed;
    l40: TLed;
    l41: TLed;
    l42: TLed;
    l43: TLed;
    l44: TLed;
    l45: TLed;
    l46: TLed;
    l47: TLed;
    l48: TLed;
    l49: TLed;
    l50: TLed;
    l51: TLed;
    l52: TLed;
    l53: TLed;
    l54: TLed;
    l55: TLed;
    l56: TLed;
    l57: TLed;
    l58: TLed;
    l59: TLed;
    l60: TLed;
    l61: TLed;
    l62: TLed;
    l63: TLed;
    ProgressBar17: TProgressBar;
    ProgressBar18: TProgressBar;
    ProgressBar19: TProgressBar;
    ProgressBar20: TProgressBar;
    txAI17: TEdit;
    txAI18: TEdit;
    txAI19: TEdit;
    txAI20: TEdit;
    ProgressBar21: TProgressBar;
    ProgressBar22: TProgressBar;
    ProgressBar23: TProgressBar;
    txAI21: TEdit;
    txAI22: TEdit;
    txAI23: TEdit;
    Edit27: TEdit;
    udAz: TUpDown;
    Edit32: TEdit;
    udEl: TUpDown;
    tbAz: TTrackBar;
    tbEl: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ProgressBar24: TProgressBar;
    txAI24: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tbAzChange(Sender: TObject);
    procedure sbClick(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Edit28Change(Sender: TObject);
    procedure tbElChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tbMPS1Change(Sender: TObject);
    procedure tbMPS2Change(Sender: TObject);
    procedure mps1change(Sender: TObject);
    procedure mps2change(Sender: TObject);
  private
    Freq     : int64;
    Count    : int64;
    Last     : int64;
    Time     : int64;
    Interval : int64;
    Last_Az  : integer;
    Last_El  : integer;
    Prec     : single;
    Velocity_Az,
    Velocity_El,
    Position_Az,
    Position_El : integer;
  end;

var
  ShellChirimbolo: TShellChirimbolo;

implementation

{$R *.DFM}

uses
  ElbrusTypes,
  Advantech, Deva, RDAReg, Mutex, Math, Angle, Speed, Config;

type
  TSaveNumber =
    class
      fNumber : integer;
      constructor Create( aNumber : integer );
      property Number : integer read fNumber;
    end;

procedure TShellChirimbolo.FormCreate(Sender: TObject);
begin
  Panel2.Width := tabDeva.Width div 2;

  theConfiguration  := TConfig.Create;

  Init_Devices;
  Init_Encoder;

  QueryPerformanceFrequency(Freq);
  Interval := Freq div 5;  // 1/5 sec
  Last_Az  := 0;
  Last_El  := 0;
  Last     := 0;

  Set_Analog_Input_Gains(theConfiguration.AI_Gains);

  ProgressBar1. Hint := AI_Names[0];
  ProgressBar2. Hint := AI_Names[1];
  ProgressBar3. Hint := AI_Names[2];
  ProgressBar4. Hint := AI_Names[3];
  ProgressBar5. Hint := AI_Names[4];
  ProgressBar6. Hint := AI_Names[5];
  ProgressBar7. Hint := AI_Names[6];
  ProgressBar8. Hint := AI_Names[7];
  ProgressBar9. Hint := AI_Names[8];
  ProgressBar10.Hint := AI_Names[9];
  ProgressBar11.Hint := AI_Names[10];
  ProgressBar12.Hint := AI_Names[11];
  ProgressBar13.Hint := AI_Names[12];
  ProgressBar14.Hint := AI_Names[13];
  ProgressBar15.Hint := AI_Names[14];
  ProgressBar16.Hint := AI_Names[15];
  ProgressBar17.Hint := AI_Names[16];
  ProgressBar18.Hint := AI_Names[17];
  ProgressBar19.Hint := AI_Names[18];
  ProgressBar20.Hint := AI_Names[19];
  ProgressBar21.Hint := AI_Names[20];
  ProgressBar22.Hint := AI_Names[21];
  ProgressBar23.Hint := AI_Names[22];
  ProgressBar24.Hint := AI_Names[23];
  txAI1. Hint := AI_Names[0];
  txAI2. Hint := AI_Names[1];
  txAI3. Hint := AI_Names[2];
  txAI4. Hint := AI_Names[3];
  txAI5. Hint := AI_Names[4];
  txAI6. Hint := AI_Names[5];
  txAI7. Hint := AI_Names[6];
  txAI8. Hint := AI_Names[7];
  txAI9. Hint := AI_Names[8];
  txAI10.Hint := AI_Names[9];
  txAI11.Hint := AI_Names[10];
  txAI12.Hint := AI_Names[11];
  txAI13.Hint := AI_Names[12];
  txAI14.Hint := AI_Names[13];
  txAI15.Hint := AI_Names[14];
  txAI16.Hint := AI_Names[15];
  txAI17.Hint := AI_Names[16];
  txAI18.Hint := AI_Names[17];
  txAI19.Hint := AI_Names[18];
  txAI20.Hint := AI_Names[19];
  txAI21.Hint := AI_Names[20];
  txAI22.Hint := AI_Names[21];
  txAI23.Hint := AI_Names[22];
  txAI24.Hint := AI_Names[23];

  sb0.Hint  := DO_Names[0];
  sb1.Hint  := DO_Names[1];
  sb2.Hint  := DO_Names[2];
  sb3.Hint  := DO_Names[3];
  sb4.Hint  := DO_Names[4];
  sb5.Hint  := DO_Names[5];
  sb6.Hint  := DO_Names[6];
  sb7.Hint  := DO_Names[7];
  sb8.Hint  := DO_Names[8];
  sb9.Hint  := DO_Names[9];
  sb10.Hint := DO_Names[10];
  sb11.Hint := DO_Names[11];
  sb12.Hint := DO_Names[12];
  sb13.Hint := DO_Names[13];
  sb14.Hint := DO_Names[14];
  sb15.Hint := DO_Names[15];
  sb16.Hint := DO_Names[16];
  sb17.Hint := DO_Names[17];
  sb18.Hint := DO_Names[18];
  sb19.Hint := DO_Names[19];
  sb20.Hint := DO_Names[20];

  l0.Hint  := DI_Names[0];
  l1.Hint  := DI_Names[1];
  l2.Hint  := DI_Names[2];
  l3.Hint  := DI_Names[3];
  l4.Hint  := DI_Names[4];
  l5.Hint  := DI_Names[5];
  l6.Hint  := DI_Names[6];
  l7.Hint  := DI_Names[7];
  l8.Hint  := DI_Names[8];
  l9.Hint  := DI_Names[9];
  l10.Hint := DI_Names[10];
  l11.Hint := DI_Names[11];
  l12.Hint := DI_Names[12];
  l13.Hint := DI_Names[13];
  l14.Hint := DI_Names[14];
  l15.Hint := DI_Names[15];
  l16.Hint := DI_Names[16];
  l17.Hint := DI_Names[17];
  l18.Hint := DI_Names[18];
  l19.Hint := DI_Names[19];
  l20.Hint := DI_Names[20];
  l21.Hint := DI_Names[21];
  l22.Hint := DI_Names[22];
  l23.Hint := DI_Names[23];
  l24.Hint := DI_Names[24];
  l25.Hint := DI_Names[25];
  l26.Hint := DI_Names[26];
  l27.Hint := DI_Names[27];
  l28.Hint := DI_Names[28];
  l29.Hint := DI_Names[29];
  l30.Hint := DI_Names[30];
  l31.Hint := DI_Names[31];
  l32.Hint := DI_Names[32];
  l33.Hint := DI_Names[33];
  l34.Hint := DI_Names[34];
  l35.Hint := DI_Names[35];
  l36.Hint := DI_Names[36];
  l37.Hint := DI_Names[37];
  l38.Hint := DI_Names[38];
  l39.Hint := DI_Names[39];
  l40.Hint := DI_Names[40];
  l41.Hint := DI_Names[41];
  l42.Hint := DI_Names[42];
  l43.Hint := DI_Names[43];
  l44.Hint := DI_Names[44];

  Timer1.Enabled := true;
end;

procedure TShellChirimbolo.FormDestroy(Sender: TObject);
begin
  Done_Encoder;
  Done_Devices;
end;

procedure TShellChirimbolo.Timer1Timer(Sender: TObject);
var
  DI : DigitalInput;
  AI : AnalogInput;
begin
  DI := Get_Digital_Input;
  AI := Get_Analog_Input;

  l0.State  := (DI and Round(Power(2, 0))) <> 0;
  l1.State  := (DI and Round(Power(2, 1))) <> 0;
  l2.State  := (DI and Round(Power(2, 2))) <> 0;
  l3.State  := (DI and Round(Power(2, 3))) <> 0;
  l4.State  := (DI and Round(Power(2, 4))) <> 0;
  l5.State  := (DI and Round(Power(2, 5))) <> 0;
  l6.State  := (DI and Round(Power(2, 6))) <> 0;
  l7.State  := (DI and Round(Power(2, 7))) <> 0;
  l8.State  := (DI and Round(Power(2, 8))) <> 0;
  l9.State  := (DI and Round(Power(2, 9))) <> 0;
  l10.State := (DI and Round(Power(2, 10))) <> 0;
  l11.State := (DI and Round(Power(2, 11))) <> 0;
  l12.State := (DI and Round(Power(2, 12))) <> 0;
  l13.State := (DI and Round(Power(2, 13))) <> 0;
  l14.State := (DI and Round(Power(2, 14))) <> 0;
  l15.State := (DI and Round(Power(2, 15))) <> 0;
  l16.State := (DI and Round(Power(2, 16))) <> 0;
  l17.State := (DI and Round(Power(2, 17))) <> 0;
  l18.State := (DI and Round(Power(2, 18))) <> 0;
  l19.State := (DI and Round(Power(2, 19))) <> 0;
  l20.State := (DI and Round(Power(2, 20))) <> 0;
  l21.State := (DI and Round(Power(2, 21))) <> 0;
  l22.State := (DI and Round(Power(2, 22))) <> 0;
  l23.State := (DI and Round(Power(2, 23))) <> 0;
  l24.State := (DI and Round(Power(2, 24))) <> 0;
  l25.State := (DI and Round(Power(2, 25))) <> 0;
  l26.State := (DI and Round(Power(2, 26))) <> 0;
  l27.State := (DI and Round(Power(2, 27))) <> 0;
  l28.State := (DI and Round(Power(2, 28))) <> 0;
  l29.State := (DI and Round(Power(2, 29))) <> 0;
  l30.State := (DI and Round(Power(2, 30))) <> 0;
  l31.State := (DI and Round(Power(2, 31))) <> 0;
  l32.State := (DI and Round(Power(2, 32))) <> 0;
  l33.State := (DI and Round(Power(2, 33))) <> 0;
  l34.State := (DI and Round(Power(2, 34))) <> 0;
  l35.State := (DI and Round(Power(2, 35))) <> 0;
  l36.State := (DI and Round(Power(2, 36))) <> 0;
  l37.State := (DI and Round(Power(2, 37))) <> 0;
  l38.State := (DI and Round(Power(2, 38))) <> 0;
  l39.State := (DI and Round(Power(2, 39))) <> 0;
  l40.State := (DI and Round(Power(2, 40))) <> 0;
  l41.State := (DI and Round(Power(2, 41))) <> 0;
  l42.State := (DI and Round(Power(2, 42))) <> 0;
  l43.State := (DI and Round(Power(2, 43))) <> 0;
  l44.State := (DI and Round(Power(2, 44))) <> 0;

  ProgressBar1 .Position := AI[ 0];
  ProgressBar2 .Position := AI[ 1];
  ProgressBar3 .Position := AI[ 2];
  ProgressBar4 .Position := AI[ 3];
  ProgressBar5 .Position := AI[ 4];
  ProgressBar6 .Position := AI[ 5];
  ProgressBar7 .Position := AI[ 6];
  ProgressBar8 .Position := AI[ 7];
  ProgressBar9 .Position := AI[ 8];
  ProgressBar10.Position := AI[ 9];
  ProgressBar11.Position := AI[10];
  ProgressBar12.Position := AI[11];
  ProgressBar13.Position := AI[12];
  ProgressBar14.Position := AI[13];
  ProgressBar15.Position := AI[14];
  ProgressBar16.Position := AI[15];
  ProgressBar17.Position := AI[16];
  ProgressBar18.Position := AI[17];
  ProgressBar19.Position := AI[18];
  ProgressBar20.Position := AI[19];
  ProgressBar21.Position := AI[20];
  ProgressBar22.Position := AI[21];
  ProgressBar23.Position := AI[22];
  ProgressBar24.Position := AI[23];
  txAI1 .Text := IntToStr(AI[ 0] - 2048);
  txAI2 .Text := IntToStr(AI[ 1] - 2048);
  txAI3 .Text := IntToStr(AI[ 2] - 2048);
  txAI4 .Text := IntToStr(AI[ 3] - 2048);
  txAI5 .Text := IntToStr(AI[ 4] - 2048);
  txAI6 .Text := IntToStr(AI[ 5] - 2048);
  txAI7 .Text := IntToStr(AI[ 6] - 2048);
  txAI8 .Text := IntToStr(AI[ 7] - 2048);
  txAI9 .Text := IntToStr(AI[ 8] - 2048);
  txAI10.Text := IntToStr(AI[ 9] - 2048);
  txAI11.Text := IntToStr(AI[10] - 2048);
  txAI12.Text := IntToStr(AI[11] - 2048);
  txAI13.Text := IntToStr(AI[12] - 2048);
  txAI14.Text := IntToStr(AI[13] - 2048);
  txAI15.Text := IntToStr(AI[14] - 2048);
  txAI16.Text := IntToStr(AI[15] - 2048);
  txAI17.Text := IntToStr(AI[16] - 2048);
  txAI18.Text := IntToStr(AI[17] - 2048);
  txAI19.Text := IntToStr(AI[18] - 2048);
  txAI20.Text := IntToStr(AI[19] - 2048);
  txAI21.Text := IntToStr(AI[20] - 2048);
  txAI22.Text := IntToStr(AI[21] - 2048);
  txAI23.Text := IntToStr(AI[22] - 2048);
  txAI24.Text := IntToStr(AI[23] - 2048);

  Position_Az := Read_Encoder_X;
  Position_El := Read_Encoder_Y;
  Azimut1.Position    := Position_Az;
  Elevation1.Position := Position_El;
  // Velocity estimation
  QueryPerformanceCounter(Count);
  Time := Count - Last;
  if Time > Interval
    then
      begin
        Prec := Freq/Time;
        Last := Count;
        Velocity_Az := round(Distance(Position_Az, Last_Az) * Prec);
        Velocity_El := round(Distance(Position_El, Last_El) * Prec);
        Last_Az := Position_Az;
        Last_El := Position_El;
        Edit30.Text := Format('%.1f', [CodeSpeed(Velocity_Az)]);
        Edit31.Text := Format('%.1f', [CodeSpeed(Velocity_El)]);
      end;
  Edit18.Text := IntToStr(Position_Az);
  Edit19.Text := IntToStr(Position_El);
end;

procedure TShellChirimbolo.tbAzChange(Sender: TObject);
begin
  Set_Analog_Output_Channel(ao_Azimut, tbAz.Position);
  udAz.Position := tbAz.Position;
end;

procedure TShellChirimbolo.tbElChange(Sender: TObject);
begin
  Set_Analog_Output_Channel(ao_Elevacion, tbEl.Position );
  udEl.Position := tbEl.Position;
end;

procedure TShellChirimbolo.sbClick(Sender: TObject);
begin
  with Sender as TSpeedButton do
    if Tag <= High(DORange)
      then Set_Digital_Output_Bit(Tag, Down);
end;

procedure TShellChirimbolo.Edit17Change(Sender: TObject);
begin
  tbAz.Position := udAz.Position;
end;

procedure TShellChirimbolo.Edit28Change(Sender: TObject);
begin
  tbEl.Position := udEl.Position;
end;

procedure TShellChirimbolo.Button1Click(Sender: TObject);
var
  Value : DigitalOutput;
begin
  Value := StrToInt64( Edit29.Text );
  sb0.Down  := (Value and Round(Power(2, 0 ))) <> 0;
  sb1.Down  := (Value and Round(Power(2, 1 ))) <> 0;
  sb2.Down  := (Value and Round(Power(2, 2 ))) <> 0;
  sb3.Down  := (Value and Round(Power(2, 3 ))) <> 0;
  sb4.Down  := (Value and Round(Power(2, 4 ))) <> 0;
  sb5.Down  := (Value and Round(Power(2, 5 ))) <> 0;
  sb6.Down  := (Value and Round(Power(2, 6 ))) <> 0;
  sb7.Down  := (Value and Round(Power(2, 7 ))) <> 0;
  sb8.Down  := (Value and Round(Power(2, 8 ))) <> 0;
  sb9.Down  := (Value and Round(Power(2, 9 ))) <> 0;
  sb10.Down := (Value and Round(Power(2, 10))) <> 0;
  sb11.Down := (Value and Round(Power(2, 11))) <> 0;
  sb12.Down := (Value and Round(Power(2, 12))) <> 0;
  sb13.Down := (Value and Round(Power(2, 13))) <> 0;
  sb14.Down := (Value and Round(Power(2, 14))) <> 0;
  sb15.Down := (Value and Round(Power(2, 15))) <> 0;
  sb16.Down := (Value and Round(Power(2, 16))) <> 0;
  sb17.Down := (Value and Round(Power(2, 17))) <> 0;
  sb18.Down := (Value and Round(Power(2, 18))) <> 0;
  sb19.Down := (Value and Round(Power(2, 19))) <> 0;
  sb20.Down := (Value and Round(Power(2, 20))) <> 0;

  Set_Digital_Output( Value );
end;

procedure TShellChirimbolo.SpeedButton33Click(Sender: TObject);
begin
  with Sender as TSpeedButton do
    Write_Output(Tag, Down);
end;

{ TSaveNumber }

constructor TSaveNumber.Create(aNumber: integer);
begin
  fNumber := aNumber;
end;

procedure TShellChirimbolo.FormResize(Sender: TObject);
begin
  Panel2.Width := tabDeva.Width div 2;
end;

procedure TShellChirimbolo.tbMPS1Change(Sender: TObject);
begin
  Set_Analog_Output_Channel(ao_Tx1_MPS, tbMPS1.Position );
  udMPS1.Position := tbMPS1.Position;
end;

procedure TShellChirimbolo.tbMPS2Change(Sender: TObject);
begin
  Set_Analog_Output_Channel(ao_Tx2_MPS, tbMPS2.Position );
  udMPS2.Position := tbMPS2.Position;
end;

procedure TShellChirimbolo.mps1change(Sender: TObject);
begin
  tbMPS1.Position := udMPS1.Position;
end;

procedure TShellChirimbolo.mps2change(Sender: TObject);
begin
  tbMPS2.Position := udMPS2.Position;
end;

end.

