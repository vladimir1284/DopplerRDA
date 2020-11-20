unit FrameConfiguration;

interface

uses
  SysUtils, Forms, Dialogs, Constants,
  Rda_TLB, StdCtrls, ExtCtrls, ComCtrls, Controls, Classes, Tune;

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
    TabSheet5: TTabSheet;
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
    Label109: TLabel;
    CheckBox11: TCheckBox;
    Label110: TLabel;
    Edit43: TEdit;
    UpDown13: TUpDown;
    CheckBox6: TCheckBox;
    Label96: TLabel;
    Edit18: TEdit;
    Umbral: TUpDown;
    Label111: TLabel;
    AzClockwise: TRadioGroup;
    ElClockwise: TRadioGroup;
    ExtraClockwise: TRadioGroup;
    ScrollBox1: TScrollBox;
    _Tx1_Potencia: TGroupBox;
    TuneGauge1: TTuneGauge;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    UpDown2: TUpDown;
    Edit7: TEdit;
    UpDown5: TUpDown;
    Edit8: TEdit;
    UpDown7: TUpDown;
    Edit11: TEdit;
    UpDown8: TUpDown;
    Edit12: TEdit;
    _Tx1_MPS_Voltaje: TGroupBox;
    TuneGauge2: TTuneGauge;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    ComboBox4: TComboBox;
    Edit13: TEdit;
    UpDown9: TUpDown;
    Edit14: TEdit;
    UpDown11: TUpDown;
    Edit15: TEdit;
    UpDown12: TUpDown;
    Edit9: TEdit;
    UpDown14: TUpDown;
    Edit19: TEdit;
    _Tx1_MPS_Corriente: TGroupBox;
    TuneGauge3: TTuneGauge;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    ComboBox5: TComboBox;
    Edit20: TEdit;
    UpDown15: TUpDown;
    Edit21: TEdit;
    UpDown16: TUpDown;
    Edit22: TEdit;
    UpDown17: TUpDown;
    Edit23: TEdit;
    UpDown18: TUpDown;
    Edit24: TEdit;
    _Tx1_fuente_20V_N: TGroupBox;
    TuneGauge4: TTuneGauge;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    ComboBox7: TComboBox;
    Edit25: TEdit;
    UpDown19: TUpDown;
    Edit26: TEdit;
    UpDown20: TUpDown;
    Edit27: TEdit;
    UpDown21: TUpDown;
    Edit28: TEdit;
    UpDown22: TUpDown;
    Edit29: TEdit;
    _Tx1_fuente_100V_P: TGroupBox;
    TuneGauge5: TTuneGauge;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    ComboBox8: TComboBox;
    Edit30: TEdit;
    UpDown23: TUpDown;
    Edit31: TEdit;
    UpDown24: TUpDown;
    Edit32: TEdit;
    UpDown25: TUpDown;
    Edit33: TEdit;
    UpDown26: TUpDown;
    Edit34: TEdit;
    _Tx1_fuente_400V_P: TGroupBox;
    TuneGauge6: TTuneGauge;
    Label37: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    ComboBox9: TComboBox;
    Edit35: TEdit;
    UpDown27: TUpDown;
    Edit36: TEdit;
    UpDown28: TUpDown;
    Edit37: TEdit;
    UpDown29: TUpDown;
    Edit38: TEdit;
    UpDown30: TUpDown;
    Edit39: TEdit;
    _Tx1_Fuente_Filamento: TGroupBox;
    TuneGauge8: TTuneGauge;
    Label94: TLabel;
    Label95: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    ComboBox10: TComboBox;
    Edit40: TEdit;
    UpDown31: TUpDown;
    Edit41: TEdit;
    UpDown32: TUpDown;
    Edit42: TEdit;
    UpDown33: TUpDown;
    Edit44: TEdit;
    UpDown34: TUpDown;
    Edit45: TEdit;
    _Tx1_fuente_50V_P: TGroupBox;
    TuneGauge9: TTuneGauge;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    ComboBox11: TComboBox;
    Edit46: TEdit;
    UpDown35: TUpDown;
    Edit47: TEdit;
    UpDown36: TUpDown;
    Edit48: TEdit;
    UpDown37: TUpDown;
    Edit49: TEdit;
    UpDown38: TUpDown;
    Edit50: TEdit;
    _Tx1_fuente_24V_P: TGroupBox;
    TuneGauge10: TTuneGauge;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    ComboBox12: TComboBox;
    Edit51: TEdit;
    UpDown39: TUpDown;
    Edit52: TEdit;
    UpDown40: TUpDown;
    Edit53: TEdit;
    UpDown41: TUpDown;
    Edit59: TEdit;
    UpDown46: TUpDown;
    Edit60: TEdit;
    _Tx2_Potencia: TGroupBox;
    TuneGauge11: TTuneGauge;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    ComboBox13: TComboBox;
    Edit61: TEdit;
    UpDown47: TUpDown;
    Edit62: TEdit;
    UpDown48: TUpDown;
    Edit63: TEdit;
    UpDown49: TUpDown;
    Edit64: TEdit;
    UpDown50: TUpDown;
    Edit65: TEdit;
    _Tx2_MPS_Voltaje: TGroupBox;
    TuneGauge12: TTuneGauge;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    ComboBox14: TComboBox;
    Edit66: TEdit;
    UpDown51: TUpDown;
    Edit67: TEdit;
    UpDown52: TUpDown;
    Edit68: TEdit;
    UpDown53: TUpDown;
    Edit69: TEdit;
    UpDown54: TUpDown;
    Edit70: TEdit;
    _Tx2_MPS_Corriente: TGroupBox;
    TuneGauge13: TTuneGauge;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    ComboBox15: TComboBox;
    Edit71: TEdit;
    UpDown55: TUpDown;
    Edit72: TEdit;
    UpDown56: TUpDown;
    Edit73: TEdit;
    UpDown57: TUpDown;
    Edit74: TEdit;
    UpDown58: TUpDown;
    Edit75: TEdit;
    _Tx2_Fuente_Filamento: TGroupBox;
    TuneGauge14: TTuneGauge;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    ComboBox16: TComboBox;
    Edit76: TEdit;
    UpDown59: TUpDown;
    Edit77: TEdit;
    UpDown60: TUpDown;
    Edit78: TEdit;
    UpDown61: TUpDown;
    Edit79: TEdit;
    UpDown62: TUpDown;
    Edit80: TEdit;
    _Tx2_fuente_50V_P: TGroupBox;
    TuneGauge15: TTuneGauge;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    ComboBox17: TComboBox;
    Edit81: TEdit;
    UpDown63: TUpDown;
    Edit82: TEdit;
    UpDown64: TUpDown;
    Edit83: TEdit;
    UpDown65: TUpDown;
    Edit84: TEdit;
    UpDown66: TUpDown;
    Edit85: TEdit;
    _Tx2_fuente_400V_P: TGroupBox;
    TuneGauge16: TTuneGauge;
    Label164: TLabel;
    Label165: TLabel;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    ComboBox18: TComboBox;
    Edit86: TEdit;
    UpDown67: TUpDown;
    Edit87: TEdit;
    UpDown68: TUpDown;
    Edit88: TEdit;
    UpDown69: TUpDown;
    Edit89: TEdit;
    UpDown70: TUpDown;
    Edit90: TEdit;
    _Tx2_fuente_24V_P: TGroupBox;
    TuneGauge17: TTuneGauge;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    ComboBox19: TComboBox;
    Edit91: TEdit;
    UpDown71: TUpDown;
    Edit92: TEdit;
    UpDown72: TUpDown;
    Edit93: TEdit;
    UpDown73: TUpDown;
    Edit94: TEdit;
    UpDown74: TUpDown;
    Edit95: TEdit;
    _Tx2_fuente_20V_N: TGroupBox;
    TuneGauge19: TTuneGauge;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    ComboBox21: TComboBox;
    Edit101: TEdit;
    UpDown79: TUpDown;
    Edit102: TEdit;
    UpDown80: TUpDown;
    Edit103: TEdit;
    UpDown81: TUpDown;
    Edit104: TEdit;
    UpDown82: TUpDown;
    Edit105: TEdit;
    _Tx2_fuente_100V_P: TGroupBox;
    TuneGauge20: TTuneGauge;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    ComboBox23: TComboBox;
    Edit106: TEdit;
    UpDown83: TUpDown;
    Edit107: TEdit;
    UpDown84: TUpDown;
    Edit108: TEdit;
    UpDown85: TUpDown;
    Edit109: TEdit;
    UpDown86: TUpDown;
    Edit110: TEdit;
    _Fuente_Excitacion: TGroupBox;
    TuneGauge21: TTuneGauge;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    ComboBox24: TComboBox;
    Edit111: TEdit;
    UpDown87: TUpDown;
    Edit112: TEdit;
    UpDown88: TUpDown;
    Edit113: TEdit;
    UpDown89: TUpDown;
    Edit114: TEdit;
    UpDown90: TUpDown;
    Edit115: TEdit;
    _Fuente_5V_P: TGroupBox;
    TuneGauge22: TTuneGauge;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    ComboBox25: TComboBox;
    Edit116: TEdit;
    UpDown91: TUpDown;
    Edit117: TEdit;
    UpDown92: TUpDown;
    Edit118: TEdit;
    UpDown93: TUpDown;
    Edit119: TEdit;
    UpDown94: TUpDown;
    Edit120: TEdit;
    _Fuente_12V_P: TGroupBox;
    TuneGauge23: TTuneGauge;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    ComboBox26: TComboBox;
    Edit121: TEdit;
    UpDown95: TUpDown;
    Edit122: TEdit;
    UpDown96: TUpDown;
    Edit123: TEdit;
    UpDown97: TUpDown;
    Edit124: TEdit;
    UpDown98: TUpDown;
    Edit125: TEdit;
    _Fuente_24V_P: TGroupBox;
    TuneGauge24: TTuneGauge;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    Label235: TLabel;
    ComboBox27: TComboBox;
    Edit126: TEdit;
    UpDown99: TUpDown;
    Edit127: TEdit;
    UpDown100: TUpDown;
    Edit128: TEdit;
    UpDown101: TUpDown;
    Edit129: TEdit;
    UpDown102: TUpDown;
    Edit130: TEdit;
    Label268: TLabel;
    Label269: TLabel;
    Label270: TLabel;
    StaticText0: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    Label271: TLabel;
    Label272: TLabel;
    _Taco_Az: TGroupBox;
    TuneGauge29: TTuneGauge;
    Label273: TLabel;
    Label274: TLabel;
    Label275: TLabel;
    Label276: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    Label279: TLabel;
    Label280: TLabel;
    ComboBox32: TComboBox;
    Edit151: TEdit;
    UpDown119: TUpDown;
    Edit152: TEdit;
    UpDown120: TUpDown;
    Edit153: TEdit;
    UpDown121: TUpDown;
    Edit154: TEdit;
    UpDown122: TUpDown;
    Edit155: TEdit;
    StaticText28: TStaticText;
    _Taco_El: TGroupBox;
    TuneGauge30: TTuneGauge;
    Label281: TLabel;
    Label282: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Label285: TLabel;
    Label286: TLabel;
    Label287: TLabel;
    Label288: TLabel;
    ComboBox33: TComboBox;
    Edit156: TEdit;
    UpDown123: TUpDown;
    Edit157: TEdit;
    UpDown124: TUpDown;
    Edit158: TEdit;
    UpDown125: TUpDown;
    Edit159: TEdit;
    UpDown126: TUpDown;
    Edit160: TEdit;
    StaticText29: TStaticText;
    Panel2: TPanel;
    Panel3: TPanel;
    ListView1: TListView;
    Panel4: TPanel;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Label289: TLabel;
    cbDefaultFilter: TComboBox;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    ckSQI: TCheckBox;
    ckCI: TCheckBox;
    ckSIG: TCheckBox;
    ckLOG: TCheckBox;
    ckCCOR: TCheckBox;
    GroupBox4: TGroupBox;
    Label290: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    txMaxLenght: TEdit;
    txMaxHeigh: TEdit;
    txMaxAngle: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox2Select(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    fConfiguration : IConfiguration;
    fControl       : IConfigurationControl;
    procedure SetConfiguration( Value : IConfiguration );

    function  IntsToMaxMin( V1, V2 : integer ) : integer;
    procedure SetGaugeParameters(Gauge : TTuneGauge; Min, Max, GoogMin, GoodMax, Value : integer);
    procedure Load_AI_Settings;
    procedure Save_AI_Settings;
  private
    fFilters : TList;
    procedure FreeFilters;
    procedure UpdateFilters;
    procedure FillFilterItem( Item : TListItem; Desc : FilterData );
    procedure InitHints;
  public
    procedure UpdateView;
    procedure UpdateAI;
  published
    property Configuration : IConfiguration        read fConfiguration write SetConfiguration;
    property Control       : IConfigurationControl read fControl;
  end;

implementation

{$R *.DFM}

uses
  Registry, ActiveX, ElbrusTypes, DirList, Shell_Client, Math, EditFilter, Windows;

const
  ClientRootKey = {HKEY_CURRENT_USER} '\SOFTWARE\LDT\Vesta\RDAClient';
  LoginKey = ClientRootKey + '\Login';

const
  AutoLogValue = 'AutoLog';

{ TFrame_Configuration }

procedure TFrame_Configuration.SetConfiguration(Value: IConfiguration);
begin
  fFilters := TList.Create;;
  fConfiguration := Value;
  if assigned(fConfiguration)
    then fConfiguration.QueryInterface(IConfigurationControl, fControl)
    else fControl := nil;

  Button2.Enabled := assigned(fConfiguration);
  Button1.Enabled := assigned(fControl) or assigned(fConfiguration);

  TabSheet1.Enabled := assigned(fControl);
  TabSheet3.Enabled := assigned(fControl);
  TabSheet4.Enabled := assigned(fControl);
  TabSheet5.Enabled := assigned(fControl);
  TabSheet7.Enabled := assigned(fControl);
  TabSheet8.Enabled := assigned(fControl);
  TabSheet9.Enabled := assigned(fConfiguration);

  InitHints;
end;

procedure TFrame_Configuration.UpdateView;
begin
  Button2Click(Button2);
end;

procedure TFrame_Configuration.Button2Click(Sender: TObject);
var
  i : integer;
begin  // Restaurar
  if assigned(fConfiguration)
    then
      with fConfiguration do
        begin
          //Operador
          CheckBox1.Checked  := Automatic_Obs;
          CheckBox3.Checked  := Auto_Power_Off;
          CheckBox8.Checked  := ContinuosRegime;
          CheckBox11.Checked := RT_Speckle_Remove;
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
          UpDown13.Position  := RT_SpeckleUmbral;

          FreeFilters;
          fFilters.Count := FilterCount;
          for I := 0 to fFilters.Count-1 do
            begin
              fFilters[I] := AllocMem(sizeof(FilterData));
              with FilterData(fFilters[I]^) do
                Filter(I, Name, B0, B1, B2, B3, B4, C1, C2, C3, C4);
            end;

          txMaxAngle.Text  := FormatFloat('0.0', FilterAngle);
          txMaxHeigh.Text  := IntToStr(FilterHeigh);
          txMaxLenght.Text := IntToStr(FilterDistance);

          ckSQI.Checked  := FilterSQI;
          ckCI.Checked   := FilterCI;
          ckSIG.Checked  := FilterSIG;
          ckLOG.Checked  := FilterLOG;
          ckCCOR.Checked := FilterCCOR;

          //Observaciones
          UpDown3.Position    := Speed_Accuracy;
          UpDown4.Position    := Angle_Accuracy;
          Edit5.Text          := Format('%.2f', [Beam_Ch1]);
          Edit6.Text          := Format('%.2f', [Beam_Ch2]);
          ComboBox1.ItemIndex := Pack_Method;
          Edit2.Text          := Obs_Directory;
          //Conversores AD
          Load_AI_Settings;
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

          UpdateFilters;
          //poner el correcto
          cbDefaultFilter.ItemIndex := DefaultFilter;
        end;
  with TRegistry.Create do
    try
      CheckBox5.Checked := OpenKey(LoginKey, false) and
                           ValueExists(AutoLogValue) and
                           ReadBool(AutoLogValue);
    finally
      Free;
    end;
end;

procedure TFrame_Configuration.Button1Click(Sender: TObject);
var
  V, C, I  : integer;
  F : FilterData;
begin  // Configurar
  if Button1.Enabled
    then
      try
        if assigned(fConfiguration)
          then
            with fConfiguration do
            begin
              //Operador
              Timeout_Radar     := UpDown1.Position;
              Auto_Power_Off    := CheckBox3.Checked;
              Automatic_Obs     := CheckBox1.Checked;
              ContinuosRegime   := CheckBox8.Checked;
              WarmTime_Radar    := UpDown6.Position;
              RestTime_Radar    := UpDown10.Position;
              RT_Speckle_Remove := CheckBox11.Checked;
              RT_SpeckleUmbral  := UpDown13.Position;
              Save;
            end;
        if assigned(fControl)
          then
            with Control do
              begin
                //General
                Val(ComboBox2.Text, V, C);
                if (C = 0) and (V > 0)
                  then Radar_ID := V
                  else Radar_ID := ComboBox2.ItemIndex;
                RadarTemperature := StrToFloat( LabeledEdit7.Text );
                RadarPressure := StrToFloat( LabeledEdit8.Text );
                //Filtros
                Speckle_Remove      := CheckBox6.Checked;

                FilterCount := fFilters.Count;
                for I := 0 to fFilters.Count - 1 do
                begin
                  F := FilterData(fFilters[I]^);
                  SetFilter(I, F.Name, F.B0, F.B1, F.B2, F.B3, F.B4, F.C1, F.C2, F.C3, F.C4);
                end;
                DefaultFilter := cbDefaultFilter.ItemIndex;

                FilterAngle    := StrToFloat(txMaxAngle.Text);
                FilterHeigh    := StrToInt(txMaxHeigh.Text);
                FilterDistance := StrToInt(txMaxLenght.Text);

                FilterSQI  := ckSQI.Checked;
                FilterCI   := ckCI.Checked;
                FilterSIG  := ckSIG.Checked;
                FilterLOG  := ckLOG.Checked;
                FilterCCOR := ckCCOR.Checked;

                //Observaciones
                Set_Obs_Directory(Edit2.Text);
                Speed_Accuracy := UpDown3.Position;
                Angle_Accuracy := UpDown4.Position;
                Beam_Ch1       := StrToFloat(Edit5.Text);
                Beam_Ch2       := StrToFloat(Edit6.Text);
                Pack_Method    := ComboBox1.ItemIndex;
                //Conversores AD
                Save_AI_Settings;
                //Deva
                AngleCodeRate           := ComboBox22.ItemIndex;
                AngleClockwiseRotationX := boolean( AzClockwise.ItemIndex );
                AngleClockwiseRotationY := boolean( ElClockwise.ItemIndex );
                AngleClockwiseRotationZ := boolean( ExtraClockwise.ItemIndex );
                //Correo
                SendMsgOnError  := CheckBox7.Checked;
                TargetAddress   := ListBox1.Items.CommaText;
                SMTPServer      := LabeledEdit2.Text;
                SMTPPort        := StrToInt( LabeledEdit5.Text );
                SMTPUser        := LabeledEdit3.Text;
                SMTPPassword    := LabeledEdit4.Text;
                SMTPFromAddress := LabeledEdit6.Text;

                Save;
              end;
        with TRegistry.Create do
          try
            if OpenKey(LoginKey, true)
              then WriteBool(AutoLogValue, CheckBox5.Checked);
          finally
            Free;
          end;
        Button2Click(Button2);
        if Assigned(ShellClient.RT_Ch1)
          then
            begin
              ShellClient.RT_Ch1.RTDisplay.BeamWidth := fConfiguration.Beam_Ch1;
              ShellClient.RT_Ch1.RefreshData;
            end;
        if Assigned(ShellClient.RT_Ch2)
          then
            begin
              ShellClient.RT_Ch2.RTDisplay.BeamWidth := fConfiguration.Beam_Ch2;
              ShellClient.RT_Ch2.RefreshData;
            end;
        ShellClient.SunPosition.RefreshRadarPosition;
      except;
        Button2Click( Sender );
      end;
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

procedure TFrame_Configuration.ComboBox2Select(Sender: TObject);
begin
  try
    LRadarName.Caption      := 'Nombre: ' + fConfiguration.RadarName[ ComboBox2.ItemIndex ];
    LRadarOwner.Caption     := 'Lugar: ' + fConfiguration.RadarOwner[ ComboBox2.ItemIndex ];
    LRadarRange.Caption     := 'Alcance: ' + IntToStr( fConfiguration.RadarRange[ ComboBox2.ItemIndex ] ) + ' Kms';
    LRadarLatitude.Caption  := 'Latitud: ' + FormatFloat( '0.00', fConfiguration.RadarLatitude[ ComboBox2.ItemIndex ] );
    LRadarLongitude.Caption := 'Longitud: ' + FormatFloat( '0.00',  fConfiguration.RadarLongitude[ ComboBox2.ItemIndex ] );
    LRadarAltitude.Caption  := 'Altitud: ' + FloatToStr( fConfiguration.RadarAltitude[ ComboBox2.ItemIndex ] ) + ' metros';
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

procedure TFrame_Configuration.Load_AI_Settings;
var
  AI_Gains, AI_Factors : PSafeArray;
  AIGainsArray : AnalogGains;
  AIFactorsArray : AnalogVoltages;
  i : integer;
begin
  if Configuration <> nil
    then
      begin
        if Configuration.AIGains(AI_Gains) = S_OK
          then
            begin
              for i := Low(AIRange) to High(AIRange) do
                AIGainsArray[i] := PWords(AI_Gains.pvData)^[I];

              ComboBox24.ItemIndex := AIGainsArray[ai_Fuente_Excitacion   ];
              ComboBox25.ItemIndex := AIGainsArray[ai_Fuente_5V_P         ];
              ComboBox26.ItemIndex := AIGainsArray[ai_Fuente_12V_P        ];
              ComboBox27.ItemIndex := AIGainsArray[ai_Fuente_24V_P        ];
              ComboBox32.ItemIndex := AIGainsArray[ai_Taco_Az             ];
              ComboBox33.ItemIndex := AIGainsArray[ai_Taco_El             ];
              ComboBox3.ItemIndex  := AIGainsArray[ai_Tx1_Potencia        ];
              ComboBox4.ItemIndex  := AIGainsArray[ai_Tx1_MPS_Voltaje     ];
              ComboBox5.ItemIndex  := AIGainsArray[ai_Tx1_MPS_Corriente   ];
              ComboBox12.ItemIndex := AIGainsArray[ai_Tx1_fuente_24V_P    ];
              ComboBox7.ItemIndex  := AIGainsArray[ai_Tx1_fuente_24V_N    ];
              ComboBox11.ItemIndex := AIGainsArray[ai_Tx1_fuente_50V_P    ];
              ComboBox8.ItemIndex  := AIGainsArray[ai_Tx1_fuente_100V_P   ];
              ComboBox9.ItemIndex  := AIGainsArray[ai_Tx1_fuente_400V_P   ];
              ComboBox10.ItemIndex := AIGainsArray[ai_Tx1_Fuente_Filamento];
              ComboBox13.ItemIndex := AIGainsArray[ai_Tx2_Potencia        ];
              ComboBox14.ItemIndex := AIGainsArray[ai_Tx2_MPS_Voltaje     ];
              ComboBox15.ItemIndex := AIGainsArray[ai_Tx2_MPS_Corriente   ];
              ComboBox19.ItemIndex := AIGainsArray[ai_Tx2_fuente_24V_P    ];
              ComboBox21.ItemIndex := AIGainsArray[ai_Tx2_fuente_24V_N    ];
              ComboBox17.ItemIndex := AIGainsArray[ai_Tx2_fuente_50V_P    ];
              ComboBox23.ItemIndex := AIGainsArray[ai_Tx2_fuente_100V_P   ];
              ComboBox18.ItemIndex := AIGainsArray[ai_Tx2_fuente_400V_P   ];
              ComboBox16.ItemIndex := AIGainsArray[ai_Tx2_Fuente_Filamento];

              SafeArrayDestroy(AI_Gains);
            end;

        if Configuration.AIFactors(AI_Factors) = S_OK
          then
            begin
              for i := Low(AIRange) to High(AIRange) do
                AIFactorsArray[i] := PSingles(AI_Factors.pvData)^[I];

              Edit115.Text := Format('%.2f', [AIFactorsArray[ai_Fuente_Excitacion]]);
              Edit120.Text := Format('%.2f', [AIFactorsArray[ai_Fuente_5V_P         ]]);
              Edit125.Text := Format('%.2f', [AIFactorsArray[ai_Fuente_12V_P        ]]);
              Edit130.Text := Format('%.2f', [AIFactorsArray[ai_Fuente_24V_P        ]]);
              Edit155.Text := Format('%.2f', [AIFactorsArray[ai_Taco_Az             ]]);
              Edit160.Text := Format('%.2f', [AIFactorsArray[ai_Taco_El             ]]);
              Edit12.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_Potencia        ]]);
              Edit19.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_MPS_Voltaje     ]]);
              Edit24.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_MPS_Corriente   ]]);
              Edit60.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_fuente_24V_P    ]]);
              Edit29.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_fuente_24V_N    ]]);
              Edit50.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_fuente_50V_P    ]]);
              Edit34.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_fuente_100V_P   ]]);
              Edit39.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_fuente_400V_P   ]]);
              Edit45.Text  := Format('%.2f', [AIFactorsArray[ai_Tx1_Fuente_Filamento]]);
              Edit65.Text  := Format('%.2f', [AIFactorsArray[ai_Tx2_Potencia        ]]);
              Edit70.Text  := Format('%.2f', [AIFactorsArray[ai_Tx2_MPS_Voltaje     ]]);
              Edit75.Text  := Format('%.2f', [AIFactorsArray[ai_Tx2_MPS_Corriente   ]]);
              Edit95.Text  := Format('%.2f', [AIFactorsArray[ai_Tx2_fuente_24V_P    ]]);
              Edit105.Text := Format('%.2f', [AIFactorsArray[ai_Tx2_fuente_24V_N    ]]);
              Edit85.Text  := Format('%.2f', [AIFactorsArray[ai_Tx2_fuente_50V_P    ]]);
              Edit110.Text := Format('%.2f', [AIFactorsArray[ai_Tx2_fuente_100V_P   ]]);
              Edit90.Text  := Format('%.2f', [AIFactorsArray[ai_Tx2_fuente_400V_P   ]]);
              Edit80.Text  := Format('%.2f', [AIFactorsArray[ai_Tx2_Fuente_Filamento]]);

              SafeArrayDestroy(AI_Factors);
            end;
      end;

  if ShellClient.Antenna.Antenna <> nil
    then
      with ShellClient.Antenna.Antenna do
      begin
        UpDown87.Position  := MaxMin(Rango_Fuente_Excitacion).Min;
        UpDown91.Position  := MaxMin(Rango_Fuente_5V        ).Min;
        UpDown95.Position  := MaxMin(Rango_Fuente_12V       ).Min;
        UpDown99.Position  := MaxMin(Rango_Fuente_24V       ).Min;

        UpDown88.Position  := MaxMin(Rango_Fuente_Excitacion).Max;
        UpDown92.Position  := MaxMin(Rango_Fuente_5V        ).Max;
        UpDown96.Position  := MaxMin(Rango_Fuente_12V       ).Max;
        UpDown100.Position := MaxMin(Rango_Fuente_24V       ).Max;

        UpDown89.Position  := MaxMin(Sector_Fuente_Excitacion).Min;
        UpDown93.Position  := MaxMin(Sector_Fuente_5V        ).Min;
        UpDown97.Position  := MaxMin(Sector_Fuente_12V       ).Min;
        UpDown101.Position := MaxMin(Sector_Fuente_24V       ).Min;

        UpDown90.Position  := MaxMin(Sector_Fuente_Excitacion).Max;
        UpDown94.Position  := MaxMin(Sector_Fuente_5V        ).Max;
        UpDown98.Position  := MaxMin(Sector_Fuente_12V       ).Max;
        UpDown102.Position := MaxMin(Sector_Fuente_24V       ).Max;

        SetGaugeParameters(TuneGauge21, UpDown87.Position, UpDown88.Position,  UpDown89.Position,  UpDown90.Position,  Fuente_Exitacion_Code);
        SetGaugeParameters(TuneGauge22, UpDown91.Position, UpDown92.Position,  UpDown93.Position,  UpDown94.Position,  Fuente_5V_Code);
        SetGaugeParameters(TuneGauge23, UpDown95.Position, UpDown96.Position,  UpDown97.Position,  UpDown98.Position,  Fuente_12V_Code);
        SetGaugeParameters(TuneGauge24, UpDown99.Position, UpDown100.Position, UpDown101.Position, UpDown102.Position, Fuente_24V_Code);
        StaticText0.Caption := FormatFloat( '0.00', Fuente_Exitacion_Unit);
        StaticText1.Caption := FormatFloat( '0.00', Fuente_5V_Unit);
        StaticText2.Caption := FormatFloat( '0.00', Fuente_12V_Unit);
        StaticText3.Caption := FormatFloat( '0.00', Fuente_24V_Unit);
      end;

  if ShellClient.MotorAz.Motor <> nil
    then
      with ShellClient.MotorAz.Motor do
      begin
        UpDown119.Position := MaxMin(Range_Taco).Min;
        UpDown120.Position := MaxMin(Range_Taco).Max;
        UpDown121.Position := MaxMin(Sector_Taco).Min;
        UpDown122.Position := MaxMin(Sector_Taco).Max;

        SetGaugeParameters(TuneGauge29, UpDown119.Position, UpDown120.Position, UpDown121.Position, UpDown122.Position, Taco_Code);
        StaticText28.Caption := FormatFloat( '0.00', Taco_Unit);
      end;

  if ShellClient.MotorEl.Motor <> nil
    then
      with ShellClient.MotorEl.Motor do
      begin
        UpDown123.Position := MaxMin(Range_Taco).Min;
        UpDown124.Position := MaxMin(Range_Taco).Max;
        UpDown125.Position := MaxMin(Sector_Taco).Min;
        UpDown126.Position := MaxMin(Sector_Taco).Max;

        SetGaugeParameters(TuneGauge30, UpDown123.Position, UpDown124.Position, UpDown125.Position, UpDown126.Position, Taco_Code);
        StaticText29.Caption := FormatFloat( '0.00', Taco_Unit);
      end;

  if ShellClient.TxRx1.Calibration.Measure <> nil
    then
      with ShellClient.TxRx1.Calibration.Measure do
      begin
        UpDown2.Position  := MaxMin(Rango_Tx_Potencia        ).Min;
        UpDown9.Position  := MaxMin(Rango_Tx_MPS_Volt        ).Min;
        UpDown15.Position := MaxMin(Rango_Tx_MPS_Corr        ).Min;
        UpDown19.Position := MaxMin(Rango_Tx_Fuente24V_N     ).Min;
        UpDown39.Position := MaxMin(Rango_Tx_Fuente24V_P     ).Min;
        UpDown35.Position := MaxMin(Rango_Tx_Fuente50V       ).Min;
        UpDown23.Position := MaxMin(Rango_Tx_Fuente100V      ).Min;
        UpDown27.Position := MaxMin(Rango_Tx_Fuente400V      ).Min;
        UpDown31.Position := MaxMin(Rango_Tx_Fuente_Filamento).Min;

        UpDown5.Position  := MaxMin(Rango_Tx_Potencia        ).Max;
        UpDown11.Position := MaxMin(Rango_Tx_MPS_Volt        ).Max;
        UpDown16.Position := MaxMin(Rango_Tx_MPS_Corr        ).Max;
        UpDown20.Position := MaxMin(Rango_Tx_Fuente24V_N     ).Max;
        UpDown40.Position := MaxMin(Rango_Tx_Fuente24V_P     ).Max;
        UpDown36.Position := MaxMin(Rango_Tx_Fuente50V       ).Max;
        UpDown24.Position := MaxMin(Rango_Tx_Fuente100V      ).Max;
        UpDown28.Position := MaxMin(Rango_Tx_Fuente400V      ).Max;
        UpDown32.Position := MaxMin(Rango_Tx_Fuente_Filamento).Max;

        UpDown7.Position  := MaxMin(Sector_Tx_Potencia        ).Min;
        UpDown12.Position := MaxMin(Sector_Tx_MPS_Volt        ).Min;
        UpDown17.Position := MaxMin(Sector_Tx_MPS_Corr        ).Min;
        UpDown21.Position := MaxMin(Sector_Tx_Fuente24V_N     ).Min;
        UpDown41.Position := MaxMin(Sector_Tx_Fuente24V_P     ).Min;
        UpDown37.Position := MaxMin(Sector_Tx_Fuente50V       ).Min;
        UpDown25.Position := MaxMin(Sector_Tx_Fuente100V      ).Min;
        UpDown29.Position := MaxMin(Sector_Tx_Fuente400V      ).Min;
        UpDown33.Position := MaxMin(Sector_Tx_Fuente_Filamento).Min;

        UpDown8.Position  := MaxMin(Sector_Tx_Potencia        ).Max;
        UpDown14.Position := MaxMin(Sector_Tx_MPS_Volt        ).Max;
        UpDown18.Position := MaxMin(Sector_Tx_MPS_Corr        ).Max;
        UpDown22.Position := MaxMin(Sector_Tx_Fuente24V_N     ).Max;
        UpDown46.Position := MaxMin(Sector_Tx_Fuente24V_P     ).Max;
        UpDown38.Position := MaxMin(Sector_Tx_Fuente50V       ).Max;
        UpDown26.Position := MaxMin(Sector_Tx_Fuente100V      ).Max;
        UpDown30.Position := MaxMin(Sector_Tx_Fuente400V      ).Max;
        UpDown34.Position := MaxMin(Sector_Tx_Fuente_Filamento).Max;
      end;
  if ShellClient.TxRx1.Tx.Tx <> nil
    then   
      with ShellClient.TxRx1.Tx.Tx do
      begin
        SetGaugeParameters(TuneGauge1,  UpDown2.Position , UpDown5.Position , UpDown7.Position , UpDown8.Position , Potencia_Code);
        SetGaugeParameters(TuneGauge2,  UpDown9.Position , UpDown11.Position, UpDown12.Position, UpDown14.Position, MPS_Volt_Code);
        SetGaugeParameters(TuneGauge3,  UpDown15.Position, UpDown16.Position, UpDown17.Position, UpDown18.Position, MPS_Corr_Code);
        SetGaugeParameters(TuneGauge4,  UpDown19.Position, UpDown20.Position, UpDown21.Position, UpDown22.Position, Fuente_24VN_Code);
        SetGaugeParameters(TuneGauge10, UpDown39.Position, UpDown40.Position, UpDown41.Position, UpDown46.Position, Fuente_24VP_Code);
        SetGaugeParameters(TuneGauge9,  UpDown35.Position, UpDown36.Position, UpDown37.Position, UpDown38.Position, Fuente_50V_Code);
        SetGaugeParameters(TuneGauge5,  UpDown23.Position, UpDown24.Position, UpDown25.Position, UpDown26.Position, Fuente_100V_Code);
        SetGaugeParameters(TuneGauge6,  UpDown27.Position, UpDown28.Position, UpDown29.Position, UpDown30.Position, Fuente_400V_Code);
        SetGaugeParameters(TuneGauge8,  UpDown31.Position, UpDown32.Position, UpDown33.Position, UpDown34.Position, Fuente_Filamento_Code);

        StaticText8.Caption  := FormatFloat( '0.00', Potencia_Unit);
        StaticText11.Caption := FormatFloat( '0.00', MPS_Volt_Unit);
        StaticText12.Caption := FormatFloat( '0.00', MPS_Corr_Unit);
        StaticText13.Caption := FormatFloat( '0.00', Fuente_24VN_Unit);
        StaticText18.Caption := FormatFloat( '0.00', Fuente_24VP_Unit);
        StaticText19.Caption := FormatFloat( '0.00', Fuente_50V_Unit);
        StaticText20.Caption := FormatFloat( '0.00', Fuente_100V_Unit);
        StaticText21.Caption := FormatFloat( '0.00', Fuente_400V_Unit);
        StaticText22.Caption := FormatFloat( '0.00', Fuente_Filamento_Unit);
      end;

  if ShellClient.TxRx2.Calibration.Measure <> nil
    then
      with ShellClient.TxRx2.Calibration.Measure do
      begin
        UpDown47.Position := MaxMin(Rango_Tx_Potencia        ).Min;
        UpDown51.Position := MaxMin(Rango_Tx_MPS_Volt        ).Min;
        UpDown55.Position := MaxMin(Rango_Tx_MPS_Corr        ).Min;
        UpDown79.Position := MaxMin(Rango_Tx_Fuente24V_N     ).Min;
        UpDown71.Position := MaxMin(Rango_Tx_Fuente24V_P     ).Min;
        UpDown63.Position := MaxMin(Rango_Tx_Fuente50V       ).Min;
        UpDown83.Position := MaxMin(Rango_Tx_Fuente100V     ).Min;
        UpDown67.Position := MaxMin(Rango_Tx_Fuente400V     ).Min;
        UpDown59.Position := MaxMin(Rango_Tx_Fuente_Filamento).Min;

        UpDown48.Position := MaxMin(Rango_Tx_Potencia        ).Max;
        UpDown52.Position := MaxMin(Rango_Tx_MPS_Volt        ).Max;
        UpDown56.Position := MaxMin(Rango_Tx_MPS_Corr        ).Max;
        UpDown80.Position := MaxMin(Rango_Tx_Fuente24V_N     ).Max;
        UpDown72.Position := MaxMin(Rango_Tx_Fuente24V_P     ).Max;
        UpDown64.Position := MaxMin(Rango_Tx_Fuente50V       ).Max;
        UpDown84.Position := MaxMin(Rango_Tx_Fuente100V     ).Max;
        UpDown68.Position := MaxMin(Rango_Tx_Fuente400V     ).Max;
        UpDown60.Position := MaxMin(Rango_Tx_Fuente_Filamento).Max;

        UpDown49.Position := MaxMin(Sector_Tx_Potencia        ).Min;
        UpDown53.Position := MaxMin(Sector_Tx_MPS_Volt        ).Min;
        UpDown57.Position := MaxMin(Sector_Tx_MPS_Corr        ).Min;
        UpDown81.Position := MaxMin(Sector_Tx_Fuente24V_N     ).Min;
        UpDown73.Position := MaxMin(Sector_Tx_Fuente24V_P     ).Min;
        UpDown65.Position := MaxMin(Sector_Tx_Fuente50V       ).Min;
        UpDown85.Position := MaxMin(Sector_Tx_Fuente100V      ).Min;
        UpDown69.Position := MaxMin(Sector_Tx_Fuente400V     ).Min;
        UpDown61.Position := MaxMin(Sector_Tx_Fuente_Filamento).Min;

        UpDown50.Position := MaxMin(Sector_Tx_Potencia        ).Max;
        UpDown54.Position := MaxMin(Sector_Tx_MPS_Volt        ).Max;
        UpDown58.Position := MaxMin(Sector_Tx_MPS_Corr        ).Max;
        UpDown82.Position := MaxMin(Sector_Tx_Fuente24V_N     ).Max;
        UpDown74.Position := MaxMin(Sector_Tx_Fuente24V_P     ).Max;
        UpDown66.Position := MaxMin(Sector_Tx_Fuente50V       ).Max;
        UpDown86.Position := MaxMin(Sector_Tx_Fuente100V      ).Max;
        UpDown70.Position := MaxMin(Sector_Tx_Fuente400V      ).Max;
        UpDown62.Position := MaxMin(Sector_Tx_Fuente_Filamento).Max;
      end;
  if ShellClient.TxRx2.Tx.Tx <> nil
    then
      with ShellClient.TxRx2.Tx.Tx do
      begin
        SetGaugeParameters(TuneGauge11, UpDown47.Position, UpDown48.Position, UpDown49.Position, UpDown50.Position, Potencia_Code);
        SetGaugeParameters(TuneGauge12, UpDown51.Position, UpDown52.Position, UpDown53.Position, UpDown54.Position, MPS_Volt_Code);
        SetGaugeParameters(TuneGauge13, UpDown55.Position, UpDown56.Position, UpDown57.Position, UpDown58.Position, MPS_Corr_Code);
        SetGaugeParameters(TuneGauge19, UpDown79.Position, UpDown80.Position, UpDown81.Position, UpDown82.Position, Fuente_24VN_Code);
        SetGaugeParameters(TuneGauge17, UpDown71.Position, UpDown72.Position, UpDown73.Position, UpDown74.Position, Fuente_24VP_Code);
        SetGaugeParameters(TuneGauge15, UpDown63.Position, UpDown64.Position, UpDown65.Position, UpDown66.Position, Fuente_50V_Code);
        SetGaugeParameters(TuneGauge20, UpDown83.Position, UpDown84.Position, UpDown85.Position, UpDown86.Position, Fuente_100V_Code);
        SetGaugeParameters(TuneGauge16, UpDown67.Position, UpDown68.Position, UpDown69.Position, UpDown70.Position, Fuente_400V_Code);
        SetGaugeParameters(TuneGauge14, UpDown59.Position, UpDown60.Position, UpDown61.Position, UpDown62.Position, Fuente_Filamento_Code);

        StaticText9.Caption  := FormatFloat( '0.00', Potencia_Unit);
        StaticText10.Caption := FormatFloat( '0.00', MPS_Volt_Unit);
        StaticText17.Caption := FormatFloat( '0.00', MPS_Corr_Unit);
        StaticText16.Caption := FormatFloat( '0.00', Fuente_24VN_Unit);
        StaticText27.Caption := FormatFloat( '0.00', Fuente_24VP_Unit);
        StaticText26.Caption := FormatFloat( '0.00', Fuente_50V_Unit);
        StaticText25.Caption := FormatFloat( '0.00', Fuente_100V_Unit);
        StaticText24.Caption := FormatFloat( '0.00', Fuente_400V_Unit);
        StaticText23.Caption := FormatFloat( '0.00', Fuente_Filamento_Unit);
      end;
end;

function TFrame_Configuration.IntsToMaxMin( V1, V2 : integer ) : integer;
begin
  with MaxMin(Result) do
    begin
      Min := V1;
      Max := V2;
    end;
end;

procedure TFrame_Configuration.Save_AI_Settings;
var
  SAB : TSafeArrayBound;
  AI_Gains, AI_Factors : PSafeArray;
  AIGainsArray : AnalogGains;
  AIFactorsArray : AnalogVoltages;
  i : integer;
begin
  if Control <> nil
    then
      begin
        SAB.cElements := 28;
        AI_Gains := SafeArrayCreate( VT_UI2, 1, SAB );
        try
          AIGainsArray[ai_Taco_Az             ] := ComboBox32.ItemIndex;
          AIGainsArray[ai_Taco_El             ] := ComboBox33.ItemIndex;
          AIGainsArray[ai_Fuente_Excitacion   ] := ComboBox24.ItemIndex;
          AIGainsArray[ai_Fuente_5V_P         ] := ComboBox25.ItemIndex;
          AIGainsArray[ai_Fuente_12V_P        ] := ComboBox26.ItemIndex;
          AIGainsArray[ai_Fuente_24V_P        ] := ComboBox27.ItemIndex;
          AIGainsArray[ai_Tx1_Potencia        ] := ComboBox3.ItemIndex;
          AIGainsArray[ai_Tx1_MPS_Voltaje     ] := ComboBox4.ItemIndex;
          AIGainsArray[ai_Tx1_MPS_Corriente   ] := ComboBox5.ItemIndex;
          AIGainsArray[ai_Tx1_fuente_24V_P    ] := ComboBox12.ItemIndex;
          AIGainsArray[ai_Tx1_fuente_24V_N    ] := ComboBox7.ItemIndex;
          AIGainsArray[ai_Tx1_fuente_50V_P    ] := ComboBox11.ItemIndex;
          AIGainsArray[ai_Tx1_fuente_100V_P   ] := ComboBox8.ItemIndex;
          AIGainsArray[ai_Tx1_fuente_400V_P   ] := ComboBox9.ItemIndex;
          AIGainsArray[ai_Tx1_Fuente_Filamento] := ComboBox10.ItemIndex;
          AIGainsArray[ai_Tx2_Potencia        ] := ComboBox13.ItemIndex;
          AIGainsArray[ai_Tx2_MPS_Voltaje     ] := ComboBox14.ItemIndex;
          AIGainsArray[ai_Tx2_MPS_Corriente   ] := ComboBox15.ItemIndex;
          AIGainsArray[ai_Tx2_fuente_24V_P    ] := ComboBox19.ItemIndex;
          AIGainsArray[ai_Tx2_fuente_24V_N    ] := ComboBox21.ItemIndex;
          AIGainsArray[ai_Tx2_fuente_50V_P    ] := ComboBox17.ItemIndex;
          AIGainsArray[ai_Tx2_fuente_100V_P   ] := ComboBox23.ItemIndex;
          AIGainsArray[ai_Tx2_fuente_400V_P   ] := ComboBox18.ItemIndex;
          AIGainsArray[ai_Tx2_Fuente_Filamento] := ComboBox16.ItemIndex;
          for i := Low(AIRange) to High(AIRange) do
            PWords(AI_Gains.pvData)^[I] := AIGainsArray[i];

          Control.AIGains( AI_Gains );
        finally
          SafeArrayDestroy( AI_Gains );
        end;

        AI_Factors := SafeArrayCreate( VT_R8, 1, SAB );
        try
          AIFactorsArray[ai_Taco_Az             ] := StrToFloat(Edit155.Text);
          AIFactorsArray[ai_Taco_El             ] := StrToFloat(Edit160.Text);
          AIFactorsArray[ai_Fuente_Excitacion   ] := StrToFloat(Edit115.Text);
          AIFactorsArray[ai_Fuente_5V_P         ] := StrToFloat(Edit120.Text);
          AIFactorsArray[ai_Fuente_12V_P        ] := StrToFloat(Edit125.Text);
          AIFactorsArray[ai_Fuente_24V_P        ] := StrToFloat(Edit130.Text);
          AIFactorsArray[ai_Tx1_Potencia        ] := StrToFloat(Edit12.Text);
          AIFactorsArray[ai_Tx1_MPS_Voltaje     ] := StrToFloat(Edit19.Text);
          AIFactorsArray[ai_Tx1_MPS_Corriente   ] := StrToFloat(Edit24.Text);
          AIFactorsArray[ai_Tx1_fuente_24V_P    ] := StrToFloat(Edit60.Text);
          AIFactorsArray[ai_Tx1_fuente_24V_N    ] := StrToFloat(Edit29.Text);
          AIFactorsArray[ai_Tx1_fuente_50V_P    ] := StrToFloat(Edit50.Text);
          AIFactorsArray[ai_Tx1_fuente_100V_P   ] := StrToFloat(Edit34.Text);
          AIFactorsArray[ai_Tx1_fuente_400V_P   ] := StrToFloat(Edit39.Text);
          AIFactorsArray[ai_Tx1_Fuente_Filamento] := StrToFloat(Edit45.Text);
          AIFactorsArray[ai_Tx2_Potencia        ] := StrToFloat(Edit65.Text);
          AIFactorsArray[ai_Tx2_MPS_Voltaje     ] := StrToFloat(Edit70.Text);
          AIFactorsArray[ai_Tx2_MPS_Corriente   ] := StrToFloat(Edit75.Text);
          AIFactorsArray[ai_Tx2_fuente_24V_P    ] := StrToFloat(Edit95.Text);
          AIFactorsArray[ai_Tx2_fuente_24V_N    ] := StrToFloat(Edit105.Text);
          AIFactorsArray[ai_Tx2_fuente_50V_P    ] := StrToFloat(Edit85.Text);
          AIFactorsArray[ai_Tx2_fuente_100V_P   ] := StrToFloat(Edit110.Text);
          AIFactorsArray[ai_Tx2_fuente_400V_P   ] := StrToFloat(Edit90.Text);
          AIFactorsArray[ai_Tx2_Fuente_Filamento] := StrToFloat(Edit80.Text);
          for i := Low(AIRange) to High(AIRange) do
            PSingles(AI_Factors.pvData)^[I] := AIFactorsArray[i];

          Control.AIFactors( AI_Factors );
        finally
          SafeArrayDestroy( AI_Factors );
        end;
      end;

  if ShellClient.Antenna.Control <> nil
    then
      with ShellClient.Antenna.Control do
      begin
        Rango_Fuente_Excitacion  := IntsToMaxMin(UpDown87.Position, UpDown88.Position);
        Rango_Fuente_5V          := IntsToMaxMin(UpDown91.Position, UpDown92.Position);
        Rango_Fuente_12V         := IntsToMaxMin(UpDown95.Position, UpDown96.Position);
        Rango_Fuente_24V         := IntsToMaxMin(UpDown99.Position, UpDown100.Position);
        Sector_Fuente_Excitacion := IntsToMaxMin(UpDown89.Position, UpDown90.Position);
        Sector_Fuente_5V         := IntsToMaxMin(UpDown93.Position, UpDown94.Position);
        Sector_Fuente_12V        := IntsToMaxMin(UpDown97.Position, UpDown98.Position);
        Sector_Fuente_24V        := IntsToMaxMin(UpDown101.Position, UpDown102.Position);
      end;

  if ShellClient.TxRx1.Calibration.MeasureControl <> nil
    then
      with ShellClient.TxRx1.Calibration.MeasureControl do
      begin
        Rango_Tx_Potencia         := IntsToMaxMin(UpDown2.Position, UpDown5.Position);
        Rango_Tx_MPS_Volt         := IntsToMaxMin(UpDown9.Position, UpDown11.Position);
        Rango_Tx_MPS_Corr         := IntsToMaxMin(UpDown15.Position, UpDown16.Position);
        Rango_Tx_Fuente24V_N      := IntsToMaxMin(UpDown19.Position, UpDown20.Position);
        Rango_Tx_Fuente24V_P      := IntsToMaxMin(UpDown39.Position, UpDown40.Position);
        Rango_Tx_Fuente50V        := IntsToMaxMin(UpDown35.Position, UpDown36.Position);
        Rango_Tx_Fuente100V       := IntsToMaxMin(UpDown23.Position, UpDown24.Position);
        Rango_Tx_Fuente400V       := IntsToMaxMin(UpDown27.Position, UpDown28.Position);
        Rango_Tx_Fuente_Filamento := IntsToMaxMin(UpDown31.Position, UpDown32.Position);

        Sector_Tx_Potencia         := IntsToMaxMin(UpDown7.Position, UpDown8.Position);
        Sector_Tx_MPS_Volt         := IntsToMaxMin(UpDown12.Position, UpDown14.Position);
        Sector_Tx_MPS_Corr         := IntsToMaxMin(UpDown17.Position, UpDown18.Position);
        Sector_Tx_Fuente24V_N      := IntsToMaxMin(UpDown21.Position, UpDown22.Position);
        Sector_Tx_Fuente24V_P      := IntsToMaxMin(UpDown41.Position, UpDown46.Position);
        Sector_Tx_Fuente50V        := IntsToMaxMin(UpDown37.Position, UpDown38.Position);
        Sector_Tx_Fuente100V       := IntsToMaxMin(UpDown25.Position, UpDown26.Position);
        Sector_Tx_Fuente400V       := IntsToMaxMin(UpDown29.Position, UpDown30.Position);
        Sector_Tx_Fuente_Filamento := IntsToMaxMin(UpDown33.Position, UpDown34.Position);
      end;

  if ShellClient.TxRx2.Calibration.MeasureControl <> nil
    then
      with ShellClient.TxRx2.Calibration.MeasureControl do
      begin
        Rango_Tx_Potencia         := IntsToMaxMin(UpDown47.Position, UpDown48.Position);
        Rango_Tx_MPS_Volt         := IntsToMaxMin(UpDown51.Position, UpDown52.Position);
        Rango_Tx_MPS_Corr         := IntsToMaxMin(UpDown55.Position, UpDown56.Position);
        Rango_Tx_Fuente24V_N      := IntsToMaxMin(UpDown79.Position, UpDown80.Position);
        Rango_Tx_Fuente24V_P      := IntsToMaxMin(UpDown71.Position, UpDown72.Position);
        Rango_Tx_Fuente50V        := IntsToMaxMin(UpDown63.Position, UpDown64.Position);
        Rango_Tx_Fuente100V       := IntsToMaxMin(UpDown83.Position, UpDown84.Position);
        Rango_Tx_Fuente400V       := IntsToMaxMin(UpDown67.Position, UpDown68.Position);
        Rango_Tx_Fuente_Filamento := IntsToMaxMin(UpDown59.Position, UpDown60.Position);

        Sector_Tx_Potencia         := IntsToMaxMin(UpDown49.Position, UpDown50.Position);
        Sector_Tx_MPS_Volt         := IntsToMaxMin(UpDown53.Position, UpDown54.Position);
        Sector_Tx_MPS_Corr         := IntsToMaxMin(UpDown57.Position, UpDown58.Position);
        Sector_Tx_Fuente24V_N      := IntsToMaxMin(UpDown81.Position, UpDown82.Position);
        Sector_Tx_Fuente24V_P      := IntsToMaxMin(UpDown73.Position, UpDown74.Position);
        Sector_Tx_Fuente50V        := IntsToMaxMin(UpDown65.Position, UpDown66.Position);
        Sector_Tx_Fuente100V       := IntsToMaxMin(UpDown85.Position, UpDown86.Position);
        Sector_Tx_Fuente400V       := IntsToMaxMin(UpDown69.Position, UpDown70.Position);
        Sector_Tx_Fuente_Filamento := IntsToMaxMin(UpDown61.Position, UpDown62.Position);
      end;
end;

procedure TFrame_Configuration.SetGaugeParameters(Gauge : TTuneGauge; Min, Max, GoogMin, GoodMax, Value: integer);
begin
  Gauge.Min      := Min;
  Gauge.Max      := Max;
  Gauge.GoodMin  := GoogMin;
  Gauge.GoodMax  := GoodMax;
  Gauge.Position := Value;
end;

procedure TFrame_Configuration.Button9Click(Sender: TObject);
var
  Data : FilterData;
begin  //Añadir
  with TEdit_Filter.Create(Self) do
    try
      with Data do
        begin
          Name := '';
          B0   := 0;
          B1   := 0;
          B2   := 0;
          B3   := 0;
          B4   := 0;
          C1   := 0;
          C2   := 0;
          C3   := 0;
          C4   := 0;
        end;
      Filter := Data;
      if ShowModal = idOk
        then
          begin
            fFilters.Add(AllocMem(sizeof(Data)));
            FilterData(fFilters[fFilters.Count - 1]^) := Filter;
            UpdateFilters;
          end;
    finally
      Release;
    end;
end;

procedure TFrame_Configuration.FreeFilters;
var
  I : integer;
begin
  for I := 0 to fFilters.Count-1 do
    if assigned(fFilters[I])
      then FreeMem(fFilters[I]);
  fFilters.Clear;
end;

procedure TFrame_Configuration.UpdateFilters;
var
  I : integer;
begin
  ListView1.Items.Clear;
  cbDefaultFilter.Items.Clear;
  cbDefaultFilter.AddItem('No Filtrar', nil);
  for I := 0 to fFilters.Count - 1 do
    begin
      FillFilterItem(ListView1.Items.Add, FilterData(fFilters[I]^));
      cbDefaultFilter.AddItem(FilterData(fFilters[I]^).Name, nil);
    end;
  cbDefaultFilter.ItemIndex := 0;
end;

procedure TFrame_Configuration.Button10Click(Sender: TObject);
var
  I : integer;
begin  //Quitar
  I := ListView1.Selected.Index;
  if assigned(fFilters[I])
    then FreeMem(fFilters[I]);
  fFilters.Delete(I);
  UpdateFilters;
end;

procedure TFrame_Configuration.Button11Click(Sender: TObject);
begin  //Editar
  if Assigned(ListView1.Selected)
    then
      with TEdit_Filter.Create(Self) do
        try
          Filter := FilterData(fFilters[ListView1.Selected.Index]^);
          if ShowModal = idOk
            then
              begin
                FilterData(fFilters[ListView1.Selected.Index]^) := Filter;
                UpdateFilters;
              end;
        finally
          Release;
        end;
end;

procedure TFrame_Configuration.FillFilterItem( Item : TListItem; Desc : FilterData );
begin
  with Desc, Item do
    begin
      Caption := IntToStr(Index + 1);
      SubItems.Add(Name);
      SubItems.Add(FormatFloat('0.00', B0));
      SubItems.Add(FormatFloat('0.00', B1));
      SubItems.Add(FormatFloat('0.00', B2));
      SubItems.Add(FormatFloat('0.00', B3));
      SubItems.Add(FormatFloat('0.00', B4));
      SubItems.Add(FormatFloat('0.00', C1));
      SubItems.Add(FormatFloat('0.00', C2));
      SubItems.Add(FormatFloat('0.00', C3));
      SubItems.Add(FormatFloat('0.00', C4));
    end;
end;

procedure TFrame_Configuration.UpdateAI;
begin
  if ShellClient.Antenna.Antenna <> nil
    then
      with ShellClient.Antenna.Antenna do
      begin
        TuneGauge21.Position := Fuente_Exitacion_Code;
        TuneGauge22.Position := Fuente_5V_Code;
        TuneGauge23.Position := Fuente_12V_Code;
        TuneGauge24.Position := Fuente_24V_Code;
        StaticText0.Caption  := FormatFloat('0.00', Fuente_Exitacion_Unit);
        StaticText1.Caption  := FormatFloat('0.00', Fuente_5V_Unit);
        StaticText2.Caption  := FormatFloat('0.00', Fuente_12V_Unit);
        StaticText3.Caption  := FormatFloat('0.00', Fuente_24V_Unit);

        TuneGauge21.Hint := IntToStr(TuneGauge21.Position);
        TuneGauge22.Hint := IntToStr(TuneGauge22.Position);
        TuneGauge23.Hint := IntToStr(TuneGauge23.Position);
        TuneGauge24.Hint := IntToStr(TuneGauge24.Position);
        StaticText0.Hint := IntToStr(TuneGauge21.Position);
        StaticText1.Hint := IntToStr(TuneGauge22.Position);
        StaticText2.Hint := IntToStr(TuneGauge23.Position);
        StaticText3.Hint := IntToStr(TuneGauge24.Position);
      end;

  if ShellClient.MotorAz.Motor <> nil
    then
      with ShellClient.MotorAz.Motor do
      begin
        TuneGauge29.Position := Taco_Code;
        StaticText28.Caption := FormatFloat('0.00', Taco_Unit);

        TuneGauge29.Hint  := IntToStr(TuneGauge29.Position);
        StaticText28.Hint := IntToStr(TuneGauge29.Position);
      end;

  if ShellClient.MotorEl.Motor <> nil
    then
      with ShellClient.MotorEl.Motor do
      begin
        TuneGauge30.Position := Taco_Code;
        StaticText29.Caption := FormatFloat('0.00', Taco_Unit);

        TuneGauge30.Hint  := IntToStr(TuneGauge30.Position);
        StaticText29.Hint := IntToStr(TuneGauge30.Position);
      end;

  if ShellClient.TxRx1.Tx.Tx <> nil
    then
      with ShellClient.TxRx1.Tx.Tx do
      begin
        TuneGauge1.Position  := Potencia_Code;
        TuneGauge2.Position  := MPS_Volt_Code;
        TuneGauge3.Position  := MPS_Corr_Code;
        TuneGauge4.Position  := Fuente_24VN_Code;
        TuneGauge10.Position := Fuente_24VP_Code;
        TuneGauge9.Position  := Fuente_50V_Code;
        TuneGauge5.Position  := Fuente_100V_Code;
        TuneGauge6.Position  := Fuente_400V_Code;
        TuneGauge8.Position  := Fuente_Filamento_Code;

        StaticText8.Caption  := FormatFloat('0.00', Potencia_Unit);
        StaticText11.Caption := FormatFloat('0.00', MPS_Volt_Unit);
        StaticText12.Caption := FormatFloat('0.00', MPS_Corr_Unit);
        StaticText13.Caption := FormatFloat('0.00', Fuente_24VN_Unit);
        StaticText18.Caption := FormatFloat('0.00', Fuente_24VP_Unit);
        StaticText19.Caption := FormatFloat('0.00', Fuente_50V_Unit);
        StaticText20.Caption := FormatFloat('0.00', Fuente_100V_Unit);
        StaticText21.Caption := FormatFloat('0.00', Fuente_400V_Unit);
        StaticText22.Caption := FormatFloat('0.00', Fuente_Filamento_Unit);

        TuneGauge1.Hint   := IntToStr(TuneGauge1.Position);
        TuneGauge2.Hint   := IntToStr(TuneGauge2.Position);
        TuneGauge3.Hint   := IntToStr(TuneGauge3.Position);
        TuneGauge4.Hint   := IntToStr(TuneGauge4.Position);
        TuneGauge10.Hint  := IntToStr(TuneGauge10.Position);
        TuneGauge9.Hint   := IntToStr(TuneGauge9.Position);
        TuneGauge5.Hint   := IntToStr(TuneGauge5.Position);
        TuneGauge6.Hint   := IntToStr(TuneGauge6.Position);
        TuneGauge8.Hint   := IntToStr(TuneGauge8.Position);
        StaticText8.Hint  := IntToStr(TuneGauge1.Position);
        StaticText11.Hint := IntToStr(TuneGauge2.Position);
        StaticText12.Hint := IntToStr(TuneGauge3.Position);
        StaticText13.Hint := IntToStr(TuneGauge4.Position);
        StaticText18.Hint := IntToStr(TuneGauge10.Position);
        StaticText19.Hint := IntToStr(TuneGauge9.Position);
        StaticText20.Hint := IntToStr(TuneGauge5.Position);
        StaticText21.Hint := IntToStr(TuneGauge6.Position);
        StaticText22.Hint := IntToStr(TuneGauge8.Position);
      end;

  if ShellClient.TxRx2.Tx.Tx <> nil
    then
      with ShellClient.TxRx2.Tx.Tx do
      begin
        TuneGauge11.Position := Potencia_Code;
        TuneGauge12.Position := MPS_Volt_Code;
        TuneGauge13.Position := MPS_Corr_Code;
        TuneGauge19.Position := Fuente_24VN_Code;
        TuneGauge17.Position := Fuente_24VP_Code;
        TuneGauge15.Position := Fuente_50V_Code;
        TuneGauge20.Position := Fuente_100V_Code;
        TuneGauge16.Position := Fuente_400V_Code;
        TuneGauge14.Position := Fuente_Filamento_Code;

        StaticText9.Caption  := FormatFloat('0.00', Potencia_Unit);
        StaticText10.Caption := FormatFloat('0.00', MPS_Volt_Unit);
        StaticText17.Caption := FormatFloat('0.00', MPS_Corr_Unit);
        StaticText16.Caption := FormatFloat('0.00', Fuente_24VN_Unit);
        StaticText27.Caption := FormatFloat('0.00', Fuente_24VP_Unit);
        StaticText26.Caption := FormatFloat('0.00', Fuente_50V_Unit);
        StaticText25.Caption := FormatFloat('0.00', Fuente_100V_Unit);
        StaticText24.Caption := FormatFloat('0.00', Fuente_400V_Unit);
        StaticText23.Caption := FormatFloat('0.00', Fuente_Filamento_Unit);

        TuneGauge11.Hint  := IntToStr(TuneGauge11.Position);
        TuneGauge12.Hint  := IntToStr(TuneGauge12.Position);
        TuneGauge13.Hint  := IntToStr(TuneGauge13.Position);
        TuneGauge19.Hint  := IntToStr(TuneGauge19.Position);
        TuneGauge17.Hint  := IntToStr(TuneGauge17.Position);
        TuneGauge15.Hint  := IntToStr(TuneGauge15.Position);
        TuneGauge20.Hint  := IntToStr(TuneGauge20.Position);
        TuneGauge16.Hint  := IntToStr(TuneGauge16.Position);
        TuneGauge14.Hint  := IntToStr(TuneGauge14.Position);
        StaticText9.Hint  := IntToStr(TuneGauge11.Position);
        StaticText10.Hint := IntToStr(TuneGauge12.Position);
        StaticText17.Hint := IntToStr(TuneGauge13.Position);
        StaticText16.Hint := IntToStr(TuneGauge19.Position);
        StaticText27.Hint := IntToStr(TuneGauge17.Position);
        StaticText26.Hint := IntToStr(TuneGauge15.Position);
        StaticText25.Hint := IntToStr(TuneGauge20.Position);
        StaticText24.Hint := IntToStr(TuneGauge16.Position);
        StaticText23.Hint := IntToStr(TuneGauge14.Position);
      end;
end;

procedure TFrame_Configuration.InitHints;
begin
  TuneGauge21.ShowHint  := true;
  TuneGauge22.ShowHint  := true;
  TuneGauge23.ShowHint  := true;
  TuneGauge24.ShowHint  := true;
  StaticText0.ShowHint  := true;
  StaticText1.ShowHint  := true;
  StaticText2.ShowHint  := true;
  StaticText3.ShowHint  := true;

  TuneGauge29.ShowHint  := true;
  StaticText28.ShowHint := true;

  TuneGauge30.ShowHint  := true;
  StaticText29.ShowHint := true;

  TuneGauge1.ShowHint   := true;
  TuneGauge2.ShowHint   := true;
  TuneGauge3.ShowHint   := true;
  TuneGauge4.ShowHint   := true;
  TuneGauge10.ShowHint  := true;
  TuneGauge9.ShowHint   := true;
  TuneGauge5.ShowHint   := true;
  TuneGauge6.ShowHint   := true;
  TuneGauge8.ShowHint   := true;
  StaticText8.ShowHint  := true;
  StaticText11.ShowHint := true;
  StaticText12.ShowHint := true;
  StaticText13.ShowHint := true;
  StaticText18.ShowHint := true;
  StaticText19.ShowHint := true;
  StaticText20.ShowHint := true;
  StaticText21.ShowHint := true;
  StaticText22.ShowHint := true;

  TuneGauge11.ShowHint  := true;
  TuneGauge12.ShowHint  := true;
  TuneGauge13.ShowHint  := true;
  TuneGauge19.ShowHint  := true;
  TuneGauge17.ShowHint  := true;
  TuneGauge15.ShowHint  := true;
  TuneGauge20.ShowHint  := true;
  TuneGauge16.ShowHint  := true;
  TuneGauge14.ShowHint  := true;
  StaticText9.ShowHint  := true;
  StaticText10.ShowHint := true;
  StaticText17.ShowHint := true;
  StaticText16.ShowHint := true;
  StaticText27.ShowHint := true;
  StaticText26.ShowHint := true;
  StaticText25.ShowHint := true;
  StaticText24.ShowHint := true;
  StaticText23.ShowHint := true;
end;

end.

