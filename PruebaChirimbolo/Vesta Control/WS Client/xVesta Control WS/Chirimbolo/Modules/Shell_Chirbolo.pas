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
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar1: TProgressBar;
    TrackBar1: TTrackBar;
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
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    UpDown1: TUpDown;
    Edit10: TEdit;
    UpDown10: TUpDown;
    Edit28: TEdit;
    TrackBar2: TTrackBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Led1: TLed;
    Led2: TLed;
    Led3: TLed;
    Led4: TLed;
    Led5: TLed;
    Led6: TLed;
    Led7: TLed;
    Led8: TLed;
    Led9: TLed;
    Led10: TLed;
    Led11: TLed;
    Led12: TLed;
    Led13: TLed;
    Led14: TLed;
    Led15: TLed;
    Led16: TLed;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    Led17: TLed;
    Led18: TLed;
    Led20: TLed;
    Led21: TLed;
    Led22: TLed;
    Led23: TLed;
    Led24: TLed;
    Led25: TLed;
    Led26: TLed;
    Led27: TLed;
    Led28: TLed;
    Led29: TLed;
    Led30: TLed;
    Led31: TLed;
    Led32: TLed;
    Led19: TLed;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Button1: TButton;
    Azimut1: TAzimut;
    Elevation1: TElevation;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit26: TEdit;
    UpDown8: TUpDown;
    Edit27: TEdit;
    UpDown9: TUpDown;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    ScrollBox1: TScrollBox;
    Video1: TVideo;
    Label15: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown5: TUpDown;
    UpDown6: TUpDown;
    UpDown7: TUpDown;
    UpDown11: TUpDown;
    Edit32: TEdit;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    SpeedButton43: TSpeedButton;
    SpeedButton44: TSpeedButton;
    SpeedButton45: TSpeedButton;
    SpeedButton46: TSpeedButton;
    SpeedButton47: TSpeedButton;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    SpeedButton53: TSpeedButton;
    SpeedButton54: TSpeedButton;
    SpeedButton55: TSpeedButton;
    SpeedButton56: TSpeedButton;
    SpeedButton57: TSpeedButton;
    SpeedButton58: TSpeedButton;
    SpeedButton59: TSpeedButton;
    SpeedButton60: TSpeedButton;
    SpeedButton61: TSpeedButton;
    SpeedButton62: TSpeedButton;
    SpeedButton63: TSpeedButton;
    SpeedButton64: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit29: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Button2: TButton;
    Button5: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    CheckBox2: TCheckBox;
    Label36: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit17Change(Sender: TObject);
    procedure Edit20Change(Sender: TObject);
    procedure Edit28Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton73Click(Sender: TObject);
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
  Advantech, Datel,
  Deva, RDAReg, Mutex, Math, Angle, Speed, Constants;

type
  TSaveNumber =
    class
      fNumber : integer;
      constructor Create( aNumber : integer );
      property Number : integer read fNumber;
    end;

var
  Ch1, Ch2 : array[0..3999] of word;

procedure TShellChirimbolo.FormCreate(Sender: TObject);
const
  Gains : AnalogGains = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
begin
  RegistryMutex := TMutex.Create(nil, false, RegistryMutexName);
  AcquiringMutex := CreateMutex(nil, false, AcquiringMutexName);
  Init_PCI416;
  Init_Devices;
  Init_Encoder;
  QueryPerformanceFrequency(Freq);
  Interval := Freq div 5;  // 1/5 sec
  Last_Az  := 0;
  Last_El  := 0;
  Last     := 0;
  Set_Analog_Input_Gains(Gains);
  Button3.Click;  // Trigger rate
  Button4.Click;  // Sample rate
  Edit20Change( Edit20 );  // Counter 0
  Edit20Change( Edit21 );  // Counter 1
  Edit20Change( Edit22 );  // Counter 2
  Edit20Change( Edit23 );  // Counter 3
  Edit20Change( Edit24 );  // Counter 4
  Edit20Change( Edit25 );  // Counter 5
  Edit20Change( Edit32 );  // Counter 6

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
  Edit1. Hint := AI_Names[0];
  Edit2. Hint := AI_Names[1];
  Edit3. Hint := AI_Names[2];
  Edit4. Hint := AI_Names[3];
  Edit5. Hint := AI_Names[4];
  Edit6. Hint := AI_Names[5];
  Edit7. Hint := AI_Names[6];
  Edit8. Hint := AI_Names[7];
  Edit9. Hint := AI_Names[8];
  Edit10.Hint := AI_Names[9];
  Edit11.Hint := AI_Names[10];
  Edit12.Hint := AI_Names[11];
  Edit13.Hint := AI_Names[12];
  Edit14.Hint := AI_Names[13];
  Edit15.Hint := AI_Names[14];
  Edit16.Hint := AI_Names[15];

  SpeedButton1. Hint := DO_Names[0];
  SpeedButton2. Hint := DO_Names[1];
  SpeedButton3. Hint := DO_Names[2];
  SpeedButton4. Hint := DO_Names[3];
  SpeedButton5. Hint := DO_Names[4];
  SpeedButton6. Hint := DO_Names[5];
  SpeedButton7. Hint := DO_Names[6];
  SpeedButton8. Hint := DO_Names[7];
  SpeedButton9. Hint := DO_Names[8];
  SpeedButton10.Hint := DO_Names[9];
  SpeedButton11.Hint := DO_Names[10];
  SpeedButton12.Hint := DO_Names[11];
  SpeedButton13.Hint := DO_Names[12];
  SpeedButton14.Hint := DO_Names[13];
  SpeedButton15.Hint := DO_Names[14];
  SpeedButton16.Hint := DO_Names[15];
  SpeedButton17.Hint := DO_Names[16];
  SpeedButton18.Hint := DO_Names[17];
  SpeedButton19.Hint := DO_Names[18];
  SpeedButton20.Hint := DO_Names[19];
  SpeedButton21.Hint := DO_Names[20];
  SpeedButton22.Hint := DO_Names[21];
  SpeedButton23.Hint := DO_Names[22];
  SpeedButton24.Hint := DO_Names[23];
  SpeedButton25.Hint := DO_Names[24];
  SpeedButton26.Hint := DO_Names[25];
  SpeedButton27.Hint := DO_Names[26];
  SpeedButton28.Hint := DO_Names[27];
  SpeedButton29.Hint := DO_Names[28];
  SpeedButton30.Hint := DO_Names[29];
  SpeedButton31.Hint := DO_Names[30];
  SpeedButton32.Hint := DO_Names[31];
  Led1.Hint  := DI_Names[0];
  Led2.Hint  := DI_Names[1];
  Led3.Hint  := DI_Names[2];
  Led4.Hint  := DI_Names[3];
  Led5.Hint  := DI_Names[4];
  Led6.Hint  := DI_Names[5];
  Led7.Hint  := DI_Names[6];
  Led8.Hint  := DI_Names[7];
  Led9.Hint  := DI_Names[8];
  Led10.Hint := DI_Names[9];
  Led11.Hint := DI_Names[10];
  Led12.Hint := DI_Names[11];
  Led13.Hint := DI_Names[12];
  Led14.Hint := DI_Names[13];
  Led15.Hint := DI_Names[14];
  Led16.Hint := DI_Names[15];
  Led17.Hint := DI_Names[16];
  Led18.Hint := DI_Names[17];
  Led19.Hint := DI_Names[18];
  Led20.Hint := DI_Names[19];
  Led21.Hint := DI_Names[20];
  Led22.Hint := DI_Names[21];
  Led23.Hint := DI_Names[22];
  Led24.Hint := DI_Names[23];
  Led25.Hint := DI_Names[24];
  Led26.Hint := DI_Names[25];
  Led27.Hint := DI_Names[26];
  Led28.Hint := DI_Names[27];
  Led29.Hint := DI_Names[28];
  Led30.Hint := DI_Names[29];
  Led31.Hint := DI_Names[30];
  Led32.Hint := DI_Names[31];

  Timer1.Enabled := true;
end;

procedure TShellChirimbolo.FormDestroy(Sender: TObject);
begin
  Done_PCI416;
  Done_Encoder;
  Done_Devices;
  try
    CloseHandle( AcquiringMutex );
  except
  end;
  RegistryMutex.Free;
end;

procedure TShellChirimbolo.Timer1Timer(Sender: TObject);
var
  DI : DigitalInput;
  AI : AnalogInput;
  Az, El : cardinal;
  CellCount : integer;
begin
  DI := Get_Digital_Input;
  AI := Get_Analog_Input;
  Led1 .State := (DI and $00000001) <> 0;
  Led2 .State := (DI and $00000002) <> 0;
  Led3 .State := (DI and $00000004) <> 0;
  Led4 .State := (DI and $00000008) <> 0;
  Led5 .State := (DI and $00000010) <> 0;
  Led6 .State := (DI and $00000020) <> 0;
  Led7 .State := (DI and $00000040) <> 0;
  Led8 .State := (DI and $00000080) <> 0;
  Led9 .State := (DI and $00000100) <> 0;
  Led10.State := (DI and $00000200) <> 0;
  Led11.State := (DI and $00000400) <> 0;
  Led12.State := (DI and $00000800) <> 0;
  Led13.State := (DI and $00001000) <> 0;
  Led14.State := (DI and $00002000) <> 0;
  Led15.State := (DI and $00004000) <> 0;
  Led16.State := (DI and $00008000) <> 0;
  Led17.State := (DI and $00010000) <> 0;
  Led18.State := (DI and $00020000) <> 0;
  Led19.State := (DI and $00040000) <> 0;
  Led20.State := (DI and $00080000) <> 0;
  Led21.State := (DI and $00100000) <> 0;
  Led22.State := (DI and $00200000) <> 0;
  Led23.State := (DI and $00400000) <> 0;
  Led24.State := (DI and $00800000) <> 0;
  Led25.State := (DI and $01000000) <> 0;
  Led26.State := (DI and $02000000) <> 0;
  Led27.State := (DI and $04000000) <> 0;
  Led28.State := (DI and $08000000) <> 0;
  Led29.State := (DI and $10000000) <> 0;
  Led30.State := (DI and $20000000) <> 0;
  Led31.State := (DI and $40000000) <> 0;
  Led32.State := (DI and $80000000) <> 0;

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
  Edit1 .Text := IntToStr(AI[ 0] - 2048);
  Edit2 .Text := IntToStr(AI[ 1] - 2048);
  Edit3 .Text := IntToStr(AI[ 2] - 2048);
  Edit4 .Text := IntToStr(AI[ 3] - 2048);
  Edit5 .Text := IntToStr(AI[ 4] - 2048);
  Edit6 .Text := IntToStr(AI[ 5] - 2048);
  Edit7 .Text := IntToStr(AI[ 6] - 2048);
  Edit8 .Text := IntToStr(AI[ 7] - 2048);
  Edit9 .Text := IntToStr(AI[ 8] - 2048);
  Edit10.Text := IntToStr(AI[ 9] - 2048);
  Edit11.Text := IntToStr(AI[10] - 2048);
  Edit12.Text := IntToStr(AI[11] - 2048);
  Edit13.Text := IntToStr(AI[12] - 2048);
  Edit14.Text := IntToStr(AI[13] - 2048);
  Edit15.Text := IntToStr(AI[14] - 2048);
  Edit16.Text := IntToStr(AI[15] - 2048);

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

  if CheckBox2.Checked
    then
      begin
        Write_IndividualOutputs( 1, Azimut1.Position );
        Write_IndividualOutputs( 2, Elevation1.Position );
      end;
  if CheckBox1.Checked
    then
      try
        FillChar( Ch1, SizeOf( Ch1 ), 0 );
        FillChar( Ch2, SizeOf( Ch2 ), 0 );

        CellCount := Trunc(1000 * UpDown9.Position / UpDown8.Position);

        if PCI1714 > -1
          then Advantech.Acquire_Single_Frame( CellCount, Ch1, Ch2 )
          else Datel.Acquire_Single_Frames( 1, CellCount, Ch1, Ch2 );
        Video1.SetData1( Ch1 );
        Video1.SetData2( Ch2 );
      except
        on EAcqError do
          CheckBox1.Checked := false;
        else
          begin
            CheckBox1.Checked := false;
            raise;
          end;
      end;
end;

procedure TShellChirimbolo.TrackBar1Change(Sender: TObject);
begin
  Set_Analog_Output_Channel( 0, TrackBar1.Position );
  UpDown1.Position := TrackBar1.Position;
end;

procedure TShellChirimbolo.TrackBar2Change(Sender: TObject);
begin
  Set_Analog_Output_Channel( 1, TrackBar2.Position );
  UpDown10.Position := TrackBar2.Position;
end;

procedure TShellChirimbolo.SpeedButton1Click(Sender: TObject);
begin
  with Sender as TSpeedButton do
    Set_Digital_Output_Bit(Tag, Down);
end;

procedure TShellChirimbolo.Edit17Change(Sender: TObject);
begin
  TrackBar1.Position := UpDown1.Position;
  TrackBar1Change(TrackBar1);
end;

procedure TShellChirimbolo.Edit28Change(Sender: TObject);
begin
  TrackBar2.Position := UpDown10.Position;
  TrackBar2Change(TrackBar2);
end;

procedure TShellChirimbolo.Edit20Change(Sender: TObject);
begin
  with Sender as TEdit do
    try
      Set_Counter_Timer(Tag, StrToInt(Text));
    except
      on EConvertError do
        Text := '0';
    end;
end;

procedure TShellChirimbolo.Button1Click(Sender: TObject);
var
  Value : DigitalOutput;
begin
  Value := StrToInt64( Edit29.Text );
  SpeedButton1.Down  := (Value and $00000001) <> 0 ;
  SpeedButton2.Down  := (Value and $00000002) <> 0 ;
  SpeedButton3.Down  := (Value and $00000004) <> 0 ;
  SpeedButton4.Down  := (Value and $00000008) <> 0 ;
  SpeedButton5.Down  := (Value and $00000010) <> 0 ;
  SpeedButton6.Down  := (Value and $00000020) <> 0 ;
  SpeedButton7.Down  := (Value and $00000040) <> 0 ;
  SpeedButton8.Down  := (Value and $00000080) <> 0 ;
  SpeedButton9.Down  := (Value and $00000100) <> 0 ;
  SpeedButton10.Down := (Value and $00000200) <> 0 ;
  SpeedButton11.Down := (Value and $00000400) <> 0 ;
  SpeedButton12.Down := (Value and $00000800) <> 0 ;
  SpeedButton13.Down := (Value and $00001000) <> 0 ;
  SpeedButton14.Down := (Value and $00002000) <> 0 ;
  SpeedButton15.Down := (Value and $00004000) <> 0 ;
  SpeedButton16.Down := (Value and $00008000) <> 0 ;
  SpeedButton17.Down := (Value and $00010000) <> 0 ;
  SpeedButton18.Down := (Value and $00020000) <> 0 ;
  SpeedButton19.Down := (Value and $00040000) <> 0 ;
  SpeedButton20.Down := (Value and $00080000) <> 0 ;
  SpeedButton21.Down := (Value and $00100000) <> 0 ;
  SpeedButton22.Down := (Value and $00200000) <> 0 ;
  SpeedButton23.Down := (Value and $00400000) <> 0 ;
  SpeedButton24.Down := (Value and $00800000) <> 0 ;
  SpeedButton25.Down := (Value and $01000000) <> 0 ;
  SpeedButton26.Down := (Value and $02000000) <> 0 ;
  SpeedButton27.Down := (Value and $04000000) <> 0 ;
  SpeedButton28.Down := (Value and $08000000) <> 0 ;
  SpeedButton29.Down := (Value and $10000000) <> 0 ;
  SpeedButton30.Down := (Value and $20000000) <> 0 ;
  SpeedButton31.Down := (Value and $40000000) <> 0 ;
  SpeedButton32.Down := (Value and $80000000) <> 0 ;
  Set_Digital_Output( Value );
end;

procedure TShellChirimbolo.CheckBox2Click(Sender: TObject);
begin
 if (Sender as TCheckBox).Checked
   then
     begin
       SpeedButton1.OnClick := nil;
       SpeedButton2.OnClick := nil;
       SpeedButton3.OnClick := nil;
       SpeedButton4.OnClick := nil;
       SpeedButton5.OnClick := nil;
       SpeedButton6.OnClick := nil;
       SpeedButton7.OnClick := nil;
       SpeedButton8.OnClick := nil;
       SpeedButton9.OnClick := nil;
       SpeedButton10.OnClick := nil;
       SpeedButton11.OnClick := nil;
       SpeedButton12.OnClick := nil;
       SpeedButton13.OnClick := nil;
       SpeedButton14.OnClick := nil;
       SpeedButton15.OnClick := nil;
       SpeedButton16.OnClick := nil;
       SpeedButton17.OnClick := nil;
       SpeedButton18.OnClick := nil;
       SpeedButton19.OnClick := nil;
       SpeedButton20.OnClick := nil;
       SpeedButton21.OnClick := nil;
       SpeedButton22.OnClick := nil;
       SpeedButton23.OnClick := nil;
       SpeedButton24.OnClick := nil;
       SpeedButton25.OnClick := nil;
       SpeedButton26.OnClick := nil;
       SpeedButton27.OnClick := nil;
       SpeedButton28.OnClick := nil;
       SpeedButton29.OnClick := nil;
       SpeedButton30.OnClick := nil;
       SpeedButton31.OnClick := nil;
       SpeedButton32.OnClick := nil;
     end
   else
     begin
       SpeedButton1.OnClick := SpeedButton1Click;
       SpeedButton2.OnClick := SpeedButton1Click;
       SpeedButton3.OnClick := SpeedButton1Click;
       SpeedButton4.OnClick := SpeedButton1Click;
       SpeedButton5.OnClick := SpeedButton1Click;
       SpeedButton6.OnClick := SpeedButton1Click;
       SpeedButton7.OnClick := SpeedButton1Click;
       SpeedButton8.OnClick := SpeedButton1Click;
       SpeedButton9.OnClick := SpeedButton1Click;
       SpeedButton10.OnClick := SpeedButton1Click;
       SpeedButton11.OnClick := SpeedButton1Click;
       SpeedButton12.OnClick := SpeedButton1Click;
       SpeedButton13.OnClick := SpeedButton1Click;
       SpeedButton14.OnClick := SpeedButton1Click;
       SpeedButton15.OnClick := SpeedButton1Click;
       SpeedButton16.OnClick := SpeedButton1Click;
       SpeedButton17.OnClick := SpeedButton1Click;
       SpeedButton18.OnClick := SpeedButton1Click;
       SpeedButton19.OnClick := SpeedButton1Click;
       SpeedButton20.OnClick := SpeedButton1Click;
       SpeedButton21.OnClick := SpeedButton1Click;
       SpeedButton22.OnClick := SpeedButton1Click;
       SpeedButton23.OnClick := SpeedButton1Click;
       SpeedButton24.OnClick := SpeedButton1Click;
       SpeedButton25.OnClick := SpeedButton1Click;
       SpeedButton26.OnClick := SpeedButton1Click;
       SpeedButton27.OnClick := SpeedButton1Click;
       SpeedButton28.OnClick := SpeedButton1Click;
       SpeedButton29.OnClick := SpeedButton1Click;
       SpeedButton30.OnClick := SpeedButton1Click;
       SpeedButton31.OnClick := SpeedButton1Click;
       SpeedButton32.OnClick := SpeedButton1Click;
     end;
end;

procedure TShellChirimbolo.Button3Click(Sender: TObject);
begin
  try
    If PCI416F2 > -1
      then UpDown8.Position := Trunc( Datel.Set_Trigger_Rate(StrToInt(Edit26.Text)) )
      else if PCI1714 > -1
            then UpDown8.Position := Trunc( Advantech.Set_Trigger_Rate( StrToInt(Edit26.Text) ) )
            else UpDown8.Position := 0;
  except
    UpDown8.Position := 0;
  end;
end;

procedure TShellChirimbolo.Button4Click(Sender: TObject);
begin
  try
    if PCI416F2 > -1
      then UpDown9.Position := Trunc( Datel.Set_Sample_Rate( 1000*StrToInt(Edit27.Text)) ) div 1000
      else if PCI1714 > -1
             then UpDown9.Position := Trunc( Advantech.Set_Sample_Rate( 1000*StrToInt(Edit27.Text)) ) div 1000
             else UpDown9.Position := 0;
  except
    UpDown9.Position := 0;
  end;
end;

procedure TShellChirimbolo.CheckBox1Click(Sender: TObject);
begin
  if not (Sender as TCheckBox).Checked
    then
     begin
       FillChar( Ch1, SizeOf( Ch1 ), 0 );
       FillChar( Ch2, SizeOf( Ch2 ), 0 );
       Video1.SetData1( Ch1 );
       Video1.SetData2( Ch2 );
     end;
end;

procedure TShellChirimbolo.Button2Click(Sender: TObject);
var
  Value : longword;
begin
  Value := StrToInt64( Edit33.Text );
  SpeedButton33.Down := (Value and $00000001) <> 0 ;
  SpeedButton34.Down := (Value and $00000002) <> 0 ;
  SpeedButton35.Down := (Value and $00000004) <> 0 ;
  SpeedButton36.Down := (Value and $00000008) <> 0 ;
  SpeedButton37.Down := (Value and $00000010) <> 0 ;
  SpeedButton38.Down := (Value and $00000020) <> 0 ;
  SpeedButton39.Down := (Value and $00000040) <> 0 ;
  SpeedButton40.Down := (Value and $00000080) <> 0 ;
  SpeedButton41.Down := (Value and $00000100) <> 0 ;
  SpeedButton42.Down := (Value and $00000200) <> 0 ;
  SpeedButton43.Down := (Value and $00000400) <> 0 ;
  SpeedButton44.Down := (Value and $00000800) <> 0 ;
  SpeedButton45.Down := (Value and $00001000) <> 0 ;
  SpeedButton46.Down := (Value and $00002000) <> 0 ;
  SpeedButton47.Down := (Value and $00004000) <> 0 ;
  SpeedButton48.Down := (Value and $00008000) <> 0 ;
  Write_Az( Value );
end;

procedure TShellChirimbolo.Button5Click(Sender: TObject);
var
  Value : cardinal;
begin
  Value := StrToInt64( Edit34.Text );
  SpeedButton49.Down := (Value and $00000001) <> 0 ;
  SpeedButton50.Down := (Value and $00000002) <> 0 ;
  SpeedButton51.Down := (Value and $00000004) <> 0 ;
  SpeedButton52.Down := (Value and $00000008) <> 0 ;
  SpeedButton53.Down := (Value and $00000010) <> 0 ;
  SpeedButton54.Down := (Value and $00000020) <> 0 ;
  SpeedButton55.Down := (Value and $00000040) <> 0 ;
  SpeedButton56.Down := (Value and $00000080) <> 0 ;
  SpeedButton57.Down := (Value and $00000100) <> 0 ;
  SpeedButton58.Down := (Value and $00000200) <> 0 ;
  SpeedButton59.Down := (Value and $00000400) <> 0 ;
  SpeedButton60.Down := (Value and $00000800) <> 0 ;
  SpeedButton61.Down := (Value and $00001000) <> 0 ;
  SpeedButton62.Down := (Value and $00002000) <> 0 ;
  SpeedButton63.Down := (Value and $00004000) <> 0 ;
  SpeedButton64.Down := (Value and $00008000) <> 0 ;
  Write_El( Value );
end;

procedure TShellChirimbolo.SpeedButton33Click(Sender: TObject);
begin
  with Sender as TSpeedButton do
    Write_Output(Tag, Down);
end;

procedure TShellChirimbolo.SpeedButton73Click(Sender: TObject);
begin
end;

{ TSaveNumber }

constructor TSaveNumber.Create(aNumber: integer);
begin
  fNumber := aNumber;
end;

end.

