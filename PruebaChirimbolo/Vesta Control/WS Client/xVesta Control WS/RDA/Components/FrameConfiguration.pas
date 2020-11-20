unit FrameConfiguration;

interface

uses
  Types, SysUtils, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Controls, Classes, InvokeRegistry, ConfigurationWS, TxsRxsWS, CommonObjs;

type
  TFrame_Configuration = class(TFrame)
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
    TabSheet3: TTabSheet;
    Label10: TLabel;
    Label1: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Edit10: TEdit;
    UpDown1: TUpDown;
    CheckBox3: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox5: TCheckBox;
    ComboBox2: TComboBox;
    Edit16: TEdit;
    UpDown6: TUpDown;
    Edit17: TEdit;
    UpDown10: TUpDown;
    GroupBox1: TGroupBox;
    LRadarName: TLabel;
    LRadarOwner: TLabel;
    LRadarLongitude: TLabel;
    LRadarLatitude: TLabel;
    LRadarAltitude: TLabel;
    LRadarRange: TLabel;
    CheckBox8: TCheckBox;
    TabSheet4: TTabSheet;
    TabSheet1: TTabSheet;
    Label13: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    Edit2: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button3: TButton;
    TabSheet2: TTabSheet;
    Label44: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label18: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label87: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Edit37: TEdit;
    Edit27: TEdit;
    UpDown37: TUpDown;
    UpDown27: TUpDown;
    ComboBox17: TComboBox;
    UpDown2: TUpDown;
    Edit1: TEdit;
    UpDown5: TUpDown;
    Edit11: TEdit;
    UpDown35: TUpDown;
    UpDown34: TUpDown;
    UpDown33: TUpDown;
    UpDown32: TUpDown;
    UpDown31: TUpDown;
    UpDown36: TUpDown;
    Edit35: TEdit;
    Edit34: TEdit;
    Edit33: TEdit;
    Edit32: TEdit;
    Edit31: TEdit;
    Edit36: TEdit;
    UpDown25: TUpDown;
    UpDown24: TUpDown;
    UpDown23: TUpDown;
    UpDown22: TUpDown;
    UpDown21: TUpDown;
    UpDown26: TUpDown;
    Edit25: TEdit;
    Edit24: TEdit;
    Edit23: TEdit;
    Edit22: TEdit;
    Edit21: TEdit;
    Edit26: TEdit;
    TrackBar21: TTrackBar;
    TrackBar22: TTrackBar;
    TrackBar27: TTrackBar;
    TrackBar24: TTrackBar;
    TrackBar25: TTrackBar;
    TrackBar26: TTrackBar;
    TrackBar23: TTrackBar;
    TrackBar31: TTrackBar;
    TrackBar32: TTrackBar;
    TrackBar33: TTrackBar;
    TrackBar34: TTrackBar;
    TrackBar35: TTrackBar;
    TrackBar36: TTrackBar;
    TrackBar37: TTrackBar;
    TabSheet5: TTabSheet;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    ComboBox16: TComboBox;
    ComboBox15: TComboBox;
    ComboBox14: TComboBox;
    ComboBox13: TComboBox;
    ComboBox12: TComboBox;
    ComboBox11: TComboBox;
    ComboBox10: TComboBox;
    ComboBox9: TComboBox;
    ComboBox8: TComboBox;
    ComboBox7: TComboBox;
    ComboBox6: TComboBox;
    ComboBox5: TComboBox;
    ComboBox4: TComboBox;
    ComboBox3: TComboBox;
    ComboBox18: TComboBox;
    ComboBox19: TComboBox;
    TabSheet6: TTabSheet;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
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
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    ComboBox21: TComboBox;
    ComboBox23: TComboBox;
    ComboBox24: TComboBox;
    ComboBox25: TComboBox;
    ComboBox26: TComboBox;
    TabSheet7: TTabSheet;
    Label57: TLabel;
    Label58: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    ComboBox22: TComboBox;
    TabSheet8: TTabSheet;
    CheckBox7: TCheckBox;
    GroupBox2: TGroupBox;
    Label97: TLabel;
    Button4: TButton;
    ListBox1: TListBox;
    LabeledEdit1: TLabeledEdit;
    Button6: TButton;
    Button5: TButton;
    GroupBox3: TGroupBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    Button7: TButton;
    Button8: TButton;
    LabeledEdit6: TLabeledEdit;
    TabSheet9: TTabSheet;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    CheckBox6: TCheckBox;
    Label96: TLabel;
    Edit18: TEdit;
    Umbral: TUpDown;
    Label111: TLabel;
    CheckBox12: TCheckBox;
    Label112: TLabel;
    Edit44: TEdit;
    UpDown14: TUpDown;
    AzClockwise: TRadioGroup;
    ElClockwise: TRadioGroup;
    ExtraClockwise: TRadioGroup;
    RadioGroup1: TRadioGroup;
    CheckBox9: TCheckBox;
    Label118: TLabel;
    CheckBox4: TCheckBox;
    Label9: TLabel;
    txOsciloscopePort: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox20Select(Sender: TObject);
    procedure ComboBox21Select(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure UpDownPL(Sender: TObject; Button: TUDBtnType);
    procedure TrackBarPLChange(Sender: TObject);
    procedure UpDownPC(Sender: TObject; Button: TUDBtnType);
    procedure TrackBarPCChange(Sender: TObject);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure Button3Click(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    fUpdating : boolean;
    fConfiguration : IConfigurationWS;
    fTxsRxs : ITxsRxsWS;
    fAuthHeader : TAuthHeader;

    function  RateIndex( Rate : single ) : integer;
    procedure ChangePLRate( const TextValue : TEdit; const UpDownValue : TUpDown; const TrackValue : TTrackBar; const Value : integer; const Timer : byte );
    procedure ChangePCRate( const TextValue : TEdit; const UpDownValue : TUpDown; const TrackValue : TTrackBar; const Value : integer; const Timer : byte );
    procedure InitPCSinc( const Value : word );
    procedure InitPLSinc( const Value : word );
    function  GetControl: IConfigurationWS;
    function  GetTxsRxs: ITxsRxsWS;
    function  GetConfiguration: IConfigurationWS;
  public
    procedure Init( Value : IConfigurationWS; _TxsRxs : ITxsRxsWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property Configuration : IConfigurationWS read GetConfiguration;
    property Control       : IConfigurationWS read GetControl;
    property TxsRxs : ITxsRxsWS read GetTxsRxs;
  end;

implementation

{$R *.DFM}

uses
  Registry, ActiveX, ElbrusTypes, DirList, Shell_Client;

const
  ClientRootKey = {HKEY_CURRENT_USER} '\SOFTWARE\LDT\Vesta\RDAClient';
  LoginKey = ClientRootKey + '\Login';

const
  AutoLogValue = 'AutoLog';

{ TFrame_Configuration }

procedure TFrame_Configuration.UpdateView;
begin
  Button2Click(Button2);
end;

function TFrame_Configuration.RateIndex( Rate : single ) : integer;
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

procedure TFrame_Configuration.Button2Click(Sender: TObject);
var
  PC_Times,
  PL_Times,
  AI_Gains,
  Video_Gains     : PSafeArray;
  PCTimesArray,
  PLTimesArray    : TWordDynArray;
  AIGainsArray    : TWordDynArray;
  VideoGainsArray : TWordDynArray;
begin  // Restaurar
  if fUpdating then exit;
  if assigned(Configuration)
    then
      begin
        fUpdating := true;
        try
          try
            with Configuration do
              begin
                //Operador
                CheckBox1.Checked  := Automatic_Obs;
                CheckBox3.Checked  := Auto_Power_Off;
                CheckBox8.Checked  := ContinuosRegime;
                UpDown1.Position   := Timeout_Radar;
                UpDown6.Position   := WarmTime_Radar;
                UpDown10.Position  := RestTime_Radar;
                //General
                if Radar_ID < ComboBox2.Items.Count
                  then ComboBox2.ItemIndex := Radar_ID
                  else ComboBox2.Text := IntToStr(Radar_ID);
                ComboBox2Select( ComboBox2 );
                LabeledEdit7.Text := FormatFloat( '0.00', RadarTemperature );
                LabeledEdit8.Text := FormatFloat( '0.00', RadarPressure );
                //Filtros
                CheckBox6.Checked  := Speckle_Remove;
                CheckBox12.Checked := SpeckleRemoveAz;
                Umbral.Position    := SpeckleUmbral;
                UpDown14.Position  := SpeckleUmbralAz;
                //Observaciones
                UpDown3.Position    := Speed_Accuracy;
                UpDown4.Position    := Angle_Accuracy;
                Edit5.Text          := Format('%.2f', [Beam_Ch1]);
                Edit6.Text          := Format('%.2f', [Beam_Ch2]);
                ComboBox1.ItemIndex := Pack_Method;
                Edit2.Text          := Obs_Directory;
                CheckBox9.Checked   := CheckPPIParam;
                CheckBox4.Checked   := SpeckleRemoveAz;
                //Sincronismo
                ComboBox17.ItemIndex := N1Source;
                UpDown5.Position     := Trunc( PLRate );
                UpDown2.Position     := Trunc( PCRate );
                PLTimesArray := Get_PLTimes;
                if Length(PLTimesArray) = 7
                  then
                    begin
                      TrackBar21.Position := PLTimesArray[0];
                      TrackBar22.Position := PLTimesArray[1];
                      TrackBar23.Position := PLTimesArray[2];
                      TrackBar24.Position := PLTimesArray[3];
                      TrackBar25.Position := PLTimesArray[4];
                      TrackBar26.Position := PLTimesArray[5];
                      TrackBar27.Position := PLTimesArray[6];
                    end;
                PLTimesArray := nil;
                PCTimesArray := Get_PCTimes;
                if Length(PCTimesArray) = 7
                  then
                    begin
                      TrackBar31.Position := PCTimesArray[0];
                      TrackBar32.Position := PCTimesArray[1];
                      TrackBar33.Position := PCTimesArray[2];
                      TrackBar34.Position := PCTimesArray[3];
                      TrackBar35.Position := PCTimesArray[4];
                      TrackBar36.Position := PCTimesArray[5];
                      TrackBar37.Position := PCTimesArray[6];
                   end;
                PCTimesArray := nil;
                //Conversores AD
                AIGainsArray := Get_AIGains;
                if Length(AIGainsArray) = 16
                  then
                    begin
                      ComboBox19.ItemIndex := AIGainsArray[0];
                      ComboBox18.ItemIndex := AIGainsArray[1];
                      ComboBox3.ItemIndex  := AIGainsArray[2];
                      ComboBox4.ItemIndex  := AIGainsArray[3];
                      ComboBox5.ItemIndex  := AIGainsArray[4];
                      ComboBox6.ItemIndex  := AIGainsArray[5];
                      ComboBox7.ItemIndex  := AIGainsArray[6];
                      ComboBox8.ItemIndex  := AIGainsArray[7];
                      ComboBox9.ItemIndex  := AIGainsArray[8];
                      ComboBox10.ItemIndex := AIGainsArray[9];
                      ComboBox11.ItemIndex := AIGainsArray[10];
                      ComboBox12.ItemIndex := AIGainsArray[11];
                      ComboBox13.ItemIndex := AIGainsArray[12];
                      ComboBox14.ItemIndex := AIGainsArray[13];
                      ComboBox15.ItemIndex := AIGainsArray[14];
                      ComboBox16.ItemIndex := AIGainsArray[15];
                    end;
                AIGainsArray := nil;
                //Video
                txOsciloscopePort.Text := IntToStr(Osciloscope_Port);
                VideoGainsArray := Get_VideoGains;
                if Length(VideoGainsArray) = 4
                  then
                    begin
                      ComboBox23.ItemIndex := VideoGainsArray[0];
                      ComboBox24.ItemIndex := VideoGainsArray[1];
                      ComboBox25.ItemIndex := VideoGainsArray[2];
                      ComboBox26.ItemIndex := VideoGainsArray[3];
                    end;
                VideoGainsArray := nil;
                RadioGroup1.ItemIndex := Ord( ClockSource = true );
                ComboBox21.ItemIndex  := Ch2Port;
                Edit15.Text           := IntToStr( Ch1Port );
                ComboBox20.ItemIndex  := RateIndex( SampleRate );
                ComboBox20Select( ComboBox20 );
                //Deva
                ComboBox22.ItemIndex     := AngleCodeRate;
                AzClockwise.ItemIndex    := Ord( AngleClockwiseRotationX = true );
                ElClockwise.ItemIndex    := Ord( AngleClockwiseRotationY = true );
                ExtraClockwise.ItemIndex := Ord( AngleClockwiseRotationZ = true );
                //Correo
                CheckBox7.Checked        := SendMsgOnError;
                ListBox1.Items.CommaText := TargetAddress;
                LabeledEdit2.Text        := SMTPServer;
                LabeledEdit5.Text        := IntToStr( SMTPPort );
                LabeledEdit3.Text        := SMTPUser;
                LabeledEdit4.Text        := SMTPPassword;
                LabeledEdit6.Text        := SMTPFromAddress;
              end;
          except
          end;
        finally
          fUpdating := false;
        end;
      end;

  with TRegistry.Create do
    try
      CheckBox5.Checked := OpenKey(LoginKey, false) and ValueExists(AutoLogValue) and ReadBool(AutoLogValue);
    finally
      Free;
    end;
end;

procedure TFrame_Configuration.Button1Click(Sender: TObject);
var
  SAB : TSafeArrayBound;
  PC_Times,
  PL_Times,
  AI_Gains,
  Video_Gains     : TWordDynArray;
  i, V, C  : integer;
begin  // Configurar
  if Button1.Enabled
    then
      try
        if fAuthHeader.Level >= 4
          then
            begin
              //Operador
              Control.Timeout_Radar     := UpDown1.Position;
              Control.Auto_Power_Off    := CheckBox3.Checked;
              Control.Automatic_Obs     := CheckBox1.Checked;
              Control.ContinuosRegime   := CheckBox8.Checked;
              Control.WarmTime_Radar    := UpDown6.Position;
              Control.RestTime_Radar    := UpDown10.Position;
              Control.SaveConfig;
            end;
        if fAuthHeader.Level >= 5
          then
              begin
                //General
                Val(ComboBox2.Text, V, C);
                if (C = 0) and (V > 0)
                  then Control.Radar_ID := V
                  else Control.Radar_ID := ComboBox2.ItemIndex;
                Control.RadarTemperature := StrToFloat( LabeledEdit7.Text );
                Control.RadarPressure := StrToFloat( LabeledEdit8.Text );
                //Filtros
                Control.Speckle_Remove      := CheckBox6.Checked;
                Control.SpeckleRemoveAz     := CheckBox12.Checked;
                Control.SpeckleUmbral       := Umbral.Position;
                Control.SpeckleUmbralAz     := UpDown14.Position;
                //Observaciones
                Control.Obs_Directory := Edit2.Text;
                Control.Speed_Accuracy := UpDown3.Position;
                Control.Angle_Accuracy := UpDown4.Position;
                Control.Beam_Ch1       := StrToFloat(Edit5.Text);
                Control.Beam_Ch2       := StrToFloat(Edit6.Text);
                Control.Pack_Method    := ComboBox1.ItemIndex;
                Control.CheckPPIParam      := CheckBox9.Checked;
                Control.SpeckleRemoveAz := CheckBox4.Checked;
                //Sincronismo
                Control.N1Source      := ComboBox17.ItemIndex;
                Control.PLRate        := UpDown5.Position;
                Control.PCRate        := UpDown2.Position;

                SetLength(PL_Times, 7);
                PL_Times[0] := TrackBar21.Position;;
                PL_Times[1] := TrackBar22.Position;;
                PL_Times[2] := TrackBar23.Position;
                PL_Times[3] := TrackBar24.Position;
                PL_Times[4] := TrackBar25.Position;
                PL_Times[5] := TrackBar26.Position;
                PL_Times[6] := TrackBar27.Position;
                Control.Set_PLTimes( PL_Times );
                PL_Times := nil;

                SetLength(PC_Times, 7);
                PC_Times[0] := TrackBar31.Position;
                PC_Times[1] := TrackBar32.Position;
                PC_Times[2] := TrackBar33.Position;
                PC_Times[3] := TrackBar34.Position;
                PC_Times[4] := TrackBar35.Position;
                PC_Times[5] := TrackBar36.Position;
                PC_Times[6] := TrackBar37.Position;
                Control.Set_PCTimes( PC_Times );
                PC_Times := nil;

                //Conversores AD
                SetLength(AI_Gains, 16);
                AI_Gains[0]  := ComboBox19.ItemIndex;
                AI_Gains[1]  := ComboBox18.ItemIndex;
                AI_Gains[2]  := ComboBox3.ItemIndex;
                AI_Gains[3]  := ComboBox4.ItemIndex;
                AI_Gains[4]  := ComboBox5.ItemIndex;
                AI_Gains[5]  := ComboBox6.ItemIndex;
                AI_Gains[6]  := ComboBox7.ItemIndex;
                AI_Gains[7]  := ComboBox8.ItemIndex;
                AI_Gains[8]  := ComboBox9.ItemIndex;
                AI_Gains[9]  := ComboBox10.ItemIndex;
                AI_Gains[10] := ComboBox11.ItemIndex;
                AI_Gains[11] := ComboBox12.ItemIndex;
                AI_Gains[12] := ComboBox13.ItemIndex;
                AI_Gains[13] := ComboBox14.ItemIndex;
                AI_Gains[14] := ComboBox15.ItemIndex;
                AI_Gains[15] := ComboBox16.ItemIndex;
                Control.Set_AIGains( AI_Gains );
                AI_Gains := nil;

                //Video
                SetLength(Video_Gains, 4);
                Video_Gains[0] := ComboBox23.ItemIndex;
                Video_Gains[1] := ComboBox24.ItemIndex;
                Video_Gains[2] := ComboBox25.ItemIndex;
                Video_Gains[3] := ComboBox26.ItemIndex;
                Control.Set_VideoGains( Video_Gains );
                Video_Gains := nil;

                Control.ClockSource  := boolean( RadioGroup1.ItemIndex );
                Control.SampleRate   := Trunc( Combo_Freqs[ComboBox20.ItemIndex] );
                Control.Ch1Port      := StrToInt(Edit15.Text);
                Control.Ch2Port      := ComboBox21.ItemIndex;
                Control.Osciloscope_Port := StrToInt(txOsciloscopePort.Text);
                //Deva
                Control.AngleCodeRate           := ComboBox22.ItemIndex;
                Control.AngleClockwiseRotationX := boolean( AzClockwise.ItemIndex );
                Control.AngleClockwiseRotationY := boolean( ElClockwise.ItemIndex );
                Control.AngleClockwiseRotationZ := boolean( ExtraClockwise.ItemIndex );
                //Correo
                Control.SendMsgOnError  := CheckBox7.Checked;
                Control.TargetAddress   := ListBox1.Items.CommaText;
                Control.SMTPServer      := LabeledEdit2.Text;
                Control.SMTPPort        := StrToInt( LabeledEdit5.Text );
                Control.SMTPUser        := LabeledEdit3.Text;
                Control.SMTPPassword    := LabeledEdit4.Text;
                Control.SMTPFromAddress := LabeledEdit6.Text;

                Control.SaveAllConfig;
              end;
        with TRegistry.Create do
          try
            if OpenKey(LoginKey, true)
              then WriteBool(AutoLogValue, CheckBox5.Checked);
          finally
            Free;
          end;
        Button2Click(Button2);
        ShellClient.SunPosition.RefreshRadarPosition;
      except;
        Button2Click( Sender );
      end;
end;

procedure TFrame_Configuration.ComboBox20Select(Sender: TObject);
const
  Speed_of_Light = 300000000.0;  // m/s
var
  Freq_AD : single;
begin
  Freq_AD := Combo_Freqs[ ComboBox20.ItemIndex ];
  // Cell length
  Edit14.Text := Format('%.0f', [Speed_of_Light/(2*Freq_AD)]);
  // Cell count
  Edit13.Text := Format('%.0f', [Updown22.Position * Freq_AD/1000000]);
  Edit12.Text := Format('%.0f', [Updown32.Position * Freq_AD/1000000]);
end;

procedure TFrame_Configuration.ComboBox21Select(Sender: TObject);
begin
  case ComboBox21.ItemIndex of
    0: Edit15.Text := '1';
    1: Edit15.Text := '0';
    2: Edit15.Text := '3';
    3: Edit15.Text := '2';
  end;
end;

procedure TFrame_Configuration.TabSheet2Show(Sender: TObject);
begin
  InitPLSinc( 1000000 div UpDown5.Position );
  InitPCSinc( 1000000 div UpDown2.Position );
end;

procedure TFrame_Configuration.UpDownPL(Sender: TObject; Button: TUDBtnType);
begin
  case TComponent( Sender ).Tag of
   0: ChangePLRate( Edit21, UpDown21, TrackBar21, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   1: ChangePLRate( Edit22, UpDown22, TrackBar22, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   2: ChangePLRate( Edit23, UpDown23, TrackBar23, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   3: ChangePLRate( Edit24, UpDown24, TrackBar24, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   4: ChangePLRate( Edit25, UpDown25, TrackBar25, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   5: ChangePLRate( Edit26, UpDown26, TrackBar26, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   6: ChangePLRate( Edit27, UpDown27, TrackBar27, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
  end;
end;

procedure TFrame_Configuration.TrackBarPLChange(Sender: TObject);
begin
  case TComponent( Sender ).Tag of
   0: ChangePLRate( Edit21, UpDown21, TrackBar21, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   1: ChangePLRate( Edit22, UpDown22, TrackBar22, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   2: ChangePLRate( Edit23, UpDown23, TrackBar23, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   3: ChangePLRate( Edit24, UpDown24, TrackBar24, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   4: ChangePLRate( Edit25, UpDown25, TrackBar25, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   5: ChangePLRate( Edit26, UpDown26, TrackBar26, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   6: ChangePLRate( Edit27, UpDown27, TrackBar27, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
  end;
end;

procedure TFrame_Configuration.UpDownPC(Sender: TObject; Button: TUDBtnType);
begin
  case TComponent( Sender ).Tag of
   0: ChangePCRate( Edit31, UpDown31, TrackBar31, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   1: ChangePCRate( Edit32, UpDown32, TrackBar32, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   2: ChangePCRate( Edit33, UpDown33, TrackBar33, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   3: ChangePCRate( Edit34, UpDown34, TrackBar34, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   4: ChangePCRate( Edit35, UpDown35, TrackBar35, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   5: ChangePCRate( Edit36, UpDown36, TrackBar36, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
   6: ChangePCRate( Edit37, UpDown37, TrackBar37, TUpDown( Sender ).Position, TComponent( Sender ).Tag );
  end;
end;

procedure TFrame_Configuration.TrackBarPCChange(Sender: TObject);
begin
  case TComponent( Sender ).Tag of
   0: ChangePCRate( Edit31, UpDown31, TrackBar31, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   1: ChangePCRate( Edit32, UpDown32, TrackBar32, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   2: ChangePCRate( Edit33, UpDown33, TrackBar33, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   3: ChangePCRate( Edit34, UpDown34, TrackBar34, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   4: ChangePCRate( Edit35, UpDown35, TrackBar35, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   5: ChangePCRate( Edit36, UpDown36, TrackBar36, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
   6: ChangePCRate( Edit37, UpDown37, TrackBar37, TTrackBar( Sender ).Position, TComponent( Sender ).Tag );
  end;
end;

procedure TFrame_Configuration.ChangePCRate(const TextValue: TEdit; const UpDownValue: TUpDown; const TrackValue: TTrackBar; const Value: integer; const Timer : byte );
var
  TrackChangeEvent : TNotifyEvent;
  UpDownChangeEvent : TUDClickEvent;
begin
  try
    TrackChangeEvent := TrackValue.OnChange;
    TrackValue.OnChange := nil;
    UpDownChangeEvent := UpDownValue.OnClick;
    UpDownValue.OnClick := nil;

    UpDownValue.Position := Value;
    TrackValue.Position := Value;
    TextValue.Text := IntToStr( Value );

    if Assigned(TxsRxs) and (TxsRxs.TxRxPulso = tx_Pulse_Short)
      then
        case Timer of
          0: TxsRxs.N2 := Value;
          1: TxsRxs.N3 := Value;
          2: TxsRxs.N4 := Value;
          3: TxsRxs.N5 := Value;
          4: TxsRxs.N6 := Value;
          5: TxsRxs.N1CH1 := Value;
          6: TxsRxs.N1CH2 := Value;
        end;
  finally
    TrackValue.OnChange := TrackChangeEvent;
    UpDownValue.OnClick := UpDownChangeEvent;
  end;
end;

procedure TFrame_Configuration.ChangePLRate(const TextValue: TEdit; const UpDownValue: TUpDown; const TrackValue: TTrackBar; const Value: integer; const Timer : byte );
var
  TrackChangeEvent : TNotifyEvent;
  UpDownChangeEvent : TUDClickEvent;
begin
  try
    TrackChangeEvent := TrackValue.OnChange;
    TrackValue.OnChange := nil;
    UpDownChangeEvent := UpDownValue.OnClick;
    UpDownValue.OnClick := nil;

    UpDownValue.Position := Value;
    TrackValue.Position := Value;
    TextValue.Text := IntToStr( Value );

    if Assigned(TxsRxs) and (TxsRxs.TxRxPulso = tx_Pulse_Long)
      then
        case Timer of
          0: TxsRxs.N2 := Value;
          1: TxsRxs.N3 := Value;
          2: TxsRxs.N4 := Value;
          3: TxsRxs.N5 := Value;
          4: TxsRxs.N6 := Value;
          5: TxsRxs.N1CH1 := Value;
          6: TxsRxs.N1CH2 := Value;
        end;
  finally
    TrackValue.OnChange := TrackChangeEvent;
    UpDownValue.OnClick := UpDownChangeEvent;
  end;
end;

procedure TFrame_Configuration.InitPCSinc(const Value: word);
begin
  TrackBar31.Max := Value;
  TrackBar32.Max := Value;
  TrackBar33.Max := Value;
  TrackBar34.Max := Value;
  TrackBar35.Max := Value;
  TrackBar36.Max := Value;
  TrackBar37.Max := Value;
end;

procedure TFrame_Configuration.InitPLSinc(const Value: word);
begin
  TrackBar21.Max := Value;
  TrackBar22.Max := Value;
  TrackBar23.Max := Value;
  TrackBar24.Max := Value;
  TrackBar25.Max := Value;
  TrackBar26.Max := Value;
  TrackBar27.Max := Value;
end;

procedure TFrame_Configuration.UpDown5Click(Sender: TObject; Button: TUDBtnType);
begin
  InitPLSinc( 1000000 div UpDown5.Position );
end;

procedure TFrame_Configuration.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  InitPCSinc( 1000000 div UpDown2.Position );
end;

procedure TFrame_Configuration.Button3Click(Sender: TObject);
begin
  with TDirectoryList.Create( Self ) do
  try
    if ShowModal = mrOk
      then Edit2.Text := Directories.Path;
  finally    
    Free;
  end;
end;

procedure TFrame_Configuration.TabSheet5Show(Sender: TObject);
begin
  ComboBox19.Hint := AI_Names[ 0 ];
  ComboBox18.Hint := AI_Names[ 1 ];
  ComboBox3.Hint  := AI_Names[ 2 ];
  ComboBox4.Hint  := AI_Names[ 3 ];
  ComboBox5.Hint  := AI_Names[ 4 ];
  ComboBox6.Hint  := AI_Names[ 5 ];
  ComboBox7.Hint  := AI_Names[ 6 ];
  ComboBox8.Hint  := AI_Names[ 7 ];
  ComboBox9.Hint  := AI_Names[ 8 ];
  ComboBox10.Hint := AI_Names[ 9 ];
  ComboBox11.Hint := AI_Names[ 10 ];
  ComboBox12.Hint := AI_Names[ 11 ];
  ComboBox13.Hint := AI_Names[ 12 ];
  ComboBox14.Hint := AI_Names[ 13 ];
  ComboBox15.Hint := AI_Names[ 14 ];
  ComboBox16.Hint := AI_Names[ 15 ];

  Label47.Caption := '0: '  + AI_Names[ 0 ]  + ':';
  Label46.Caption := '1: '  + AI_Names[ 1 ]  + ':';
  Label45.Caption := '2: '  + AI_Names[ 2 ]  + ':';
  Label43.Caption := '3: '  + AI_Names[ 3 ]  + ':';
  Label42.Caption := '4: '  + AI_Names[ 4 ]  + ':';
  Label41.Caption := '5: '  + AI_Names[ 5 ]  + ':';
  Label40.Caption := '6: '  + AI_Names[ 6 ]  + ':';
  Label39.Caption := '7: '  + AI_Names[ 7 ]  + ':';
  Label38.Caption := '  8: ' + AI_Names[ 8 ]  + ':';
  Label37.Caption := '  9: ' + AI_Names[ 9 ]  + ':';
  Label36.Caption := '10: ' + AI_Names[ 10 ] + ':';
  Label35.Caption := '11: ' + AI_Names[ 11 ] + ':';
  Label34.Caption := '12: ' + AI_Names[ 12 ] + ':';
  Label33.Caption := '13: ' + AI_Names[ 13 ] + ':';
  Label32.Caption := '14: ' + AI_Names[ 14 ] + ':';
  Label31.Caption := '15: ' + AI_Names[ 15 ] + ':';
end;

procedure TFrame_Configuration.ComboBox2Select(Sender: TObject);
begin
  try
    LRadarName.Caption      := 'Nombre: ' + Control.Get_RadarName(ComboBox2.ItemIndex);
    LRadarOwner.Caption     := 'Lugar: ' + Control.Get_RadarOwner(ComboBox2.ItemIndex);
    LRadarRange.Caption     := 'Alcance: ' + IntToStr( Control.Get_RadarRange(ComboBox2.ItemIndex)) + ' Kms';
    LRadarLatitude.Caption  := 'Latitud: ' + FormatFloat( '0.00', Control.Get_RadarLatitude(ComboBox2.ItemIndex));
    LRadarLongitude.Caption := 'Longitud: ' + FormatFloat( '0.00',  Control.Get_RadarLongitude(ComboBox2.ItemIndex));
    LRadarAltitude.Caption  := 'Altitud: ' + FloatToStr( Control.Get_RadarAltitude(ComboBox2.ItemIndex)) + ' metros';
  except
  end;
end;

procedure TFrame_Configuration.ListBox1Click(Sender: TObject);
begin
  Button6.Enabled := ListBox1.SelCount <> 0;
end;

procedure TFrame_Configuration.Button5Click(Sender: TObject);
begin
  ListBox1.DeleteSelected;
  Button5.Enabled := ListBox1.Count > 0; 
end;

procedure TFrame_Configuration.Button4Click(Sender: TObject);
begin
  if ListBox1.Items.IndexOf(LabeledEdit1.Text)=-1
    then ListBox1.AddItem( LabeledEdit1.Text, nil );
end;

procedure TFrame_Configuration.Button6Click(Sender: TObject);
begin
  if (LabeledEdit1.Text <> '') and (ListBox1.Items.IndexOf(LabeledEdit1.Text)=-1) and
     (ListBox1.ItemIndex >= 0)
    then ListBox1.Items[ ListBox1.ItemIndex ] := LabeledEdit1.Text;
end;

procedure TFrame_Configuration.Button7Click(Sender: TObject);
begin
  if Control.TestSMTPConfig
    then ShowMessage( 'Configuracion correcta' )
    else ShowMessage( 'Hay algun problema en la configuracion' );
end;

procedure TFrame_Configuration.Button8Click(Sender: TObject);
begin
  if Control.SendTestEMail
    then ShowMessage( 'Correo enviado exitosamente' )
    else ShowMessage( 'Hay algun problema en la configuracion' );
end;

function TFrame_Configuration.GetControl: IConfigurationWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fConfiguration as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fConfiguration;
end;

procedure TFrame_Configuration.Init(Value: IConfigurationWS; _TxsRxs : ITxsRxsWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fTxsRxs := _TxsRxs;
  fConfiguration := Value;

  Button2.Enabled := assigned(fConfiguration);
  if Button2.Enabled
    then Button2Click(Button2);
  Button1.Enabled := assigned(fConfiguration);

  TabSheet1.Enabled := assigned(fConfiguration);
  TabSheet2.Enabled := assigned(fConfiguration);
  if not TabSheet2.Enabled
    then TabSheet2.OnShow := nil;
  TabSheet3.Enabled := assigned(fConfiguration);
  TabSheet4.Enabled := assigned(fConfiguration);
  TabSheet5.Enabled := assigned(fConfiguration);
  TabSheet6.Enabled := assigned(fConfiguration);
  TabSheet7.Enabled := assigned(fConfiguration);
  TabSheet8.Enabled := assigned(fConfiguration);
  TabSheet9.Enabled := assigned(fConfiguration);
end;

function TFrame_Configuration.GetTxsRxs: ITxsRxsWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fTxsRxs as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fTxsRxs;
end;

function TFrame_Configuration.GetConfiguration: IConfigurationWS;
begin
  result := fConfiguration;
end;

end.

