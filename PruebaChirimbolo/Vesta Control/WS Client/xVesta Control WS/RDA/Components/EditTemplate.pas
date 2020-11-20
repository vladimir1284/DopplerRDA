unit EditTemplate;

interface

uses
  Windows, SysUtils, Forms, ComCtrls, ExtCtrls, Controls, StdCtrls, Classes, Dialogs, ObservationsWS, CommonObjs;

type
  TEdit_Template = class(TForm)
    Panel1: TPanel;
    Button3: TButton;
    Button4: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Edit7: TEdit;
    Edit11: TEdit;
    UpDown3: TUpDown;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    UpDown4: TUpDown;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label9: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit3: TEdit;
    Edit12: TEdit;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button5: TButton;
    TabSheet4: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label16: TLabel;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    ListView1: TListView;
    Label17: TLabel;
    ComboBox2: TComboBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    Freq_AD: TComboBox;
    Button6: TButton;
    CheckBox2: TCheckBox;
    Label21: TLabel;
    TabSheet5: TTabSheet;
    GroupBox1: TGroupBox;
    Label22: TLabel;
    txCh10cmB0: TEdit;
    txCh10cmB1: TEdit;
    Label23: TLabel;
    txCh10cmB2: TEdit;
    Label24: TLabel;
    txCh10cmA1: TEdit;
    Label25: TLabel;
    txCh10cmA2: TEdit;
    Label26: TLabel;
    txCh10cmThreshold: TEdit;
    Label27: TLabel;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    txCh3cmB0: TEdit;
    txCh3cmB1: TEdit;
    txCh3cmB2: TEdit;
    txCh3cmA1: TEdit;
    txCh3cmA2: TEdit;
    txCh3cmThreshold: TEdit;
    GroupBox3: TGroupBox;
    chFilter: TCheckBox;
    chSaveFilter: TCheckBox;
    chApplyFilter: TCheckBox;
    Label119: TLabel;
    Label120: TLabel;
    Label34: TLabel;
    txMaxAngle: TEdit;
    txMaxHeigh: TEdit;
    txMaxLenght: TEdit;
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    fFTPSettings : string;
    fFormats : TList;
    procedure FreeFormats;
    procedure UpdateFormats;
  public
    procedure GetData( Template : TTemplateInfo );
    procedure SetData( Template : TTemplateInfo );
  end;

var
  Edit_Template: TEdit_Template;

implementation

{$R *.DFM}

uses
  Angle, Speed, UtStr,
  EditFormat, ElbrusTypes, EditFTPSettings;

const
  ADay    = 1;
  AnHour  = ADay/24;
  AMinute = AnHour/60;
  ASecond = AMinute/60;

// Private procedures & functions

function RateIndex( Rate : single ) : integer;
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

function CompareAngles( A1, A2 : pointer ) : integer;
begin
  Result := TAngle(A1) - TAngle(A2);
end;

function LocaleSeparator : string;
begin
  SetString( Result, nil, GetLocaleInfo( LOCALE_USER_DEFAULT, LOCALE_SLIST, nil, 0 ) - 1 );
  if GetLocaleInfo( LOCALE_USER_DEFAULT, LOCALE_SLIST, pchar(Result), Length(Result) + 1 ) = 0
    then Result := ',';
end;

function ParseAngles( Angles : TList ) : string;
var
  I : integer;
  C : string;
begin
  Angles.Sort(CompareAngles);
  if Angles.Count > 0
    then
      begin
        C := LocaleSeparator + chSpace;
        Result := FloatToStrF( CodeAngle(TAngle(Angles[0])), ffFixed, 4, 1 );
        for I := 1 to Angles.Count - 1 do
          Result := Result + C + FloatToStrF( CodeAngle(TAngle(Angles[I])), ffFixed, 4, 1 );
      end
    else Result := '';
end;

function ScanAngles( const S : string ) : TList;
var
  S1, S2 : string;
  C      : string;
begin
  Result := TList.Create;
  C := LocaleSeparator;
  SplitStr(C, S, S1, S2);
  while S1 <> '' do
    begin
      Result.Add(pointer(AngleCode(StrToFloat(S1))));
      SplitStr(C, S2, S1, S2);
    end;
  Result.Sort(CompareAngles);
end;

procedure FillFormatItem( Item : TListItem; Desc : FormatData );
begin
  with Desc, Item do
    begin
      Caption := IntToStr(Index + 1);
      case Onda of
        wl_3cm:  SubItems.Add('3 cm');
        wl_10cm: SubItems.Add('10 cm');
        else SubItems.Add('-');
      end;
      SubItems.Add(IntToStr(Celdas));
      SubItems.Add(IntToStr(Long) + ' m');
      SubItems.Add(IntToStr(Celdas*Long div 1000) + ' km');
    end;
end;

{ TEdit_Template }

procedure TEdit_Template.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  Button5.Enabled := assigned(ListView1.Selected);
  Button1.Enabled := (ListView1.Items.Count > 1) and Button5.Enabled;
end;

procedure TEdit_Template.Button1Click(Sender: TObject);
var
  I : integer;
begin  //Quitar
  I := ListView1.Selected.Index;
  if assigned(fFormats[I])
    then FormatData(fFormats[I]).Free;
  fFormats.Delete(I);
  UpdateFormats;
end;

procedure TEdit_Template.Button5Click(Sender: TObject);
var
  _format : FormatData;
begin  //Editar
  with TEdit_Format.Create(Self) do
    try
      Format := FormatData(fFormats[ListView1.Selected.Index]);
      if ShowModal = idOk
        then
          begin
            _format := FormatData(fFormats[ListView1.Selected.Index]);
            _format := Format;
            UpdateFormats;
          end;
    finally
      Release;
    end;
end;

procedure TEdit_Template.Button2Click(Sender: TObject);
var
  Data : FormatData;
begin  //Añadir
  with TEdit_Format.Create(Self) do
    try
      Data := FormatData.Create;
      with Data do
        begin
          Onda   := wl_10cm;
          Celdas := 100;
          Long   := 1000;
        end;
      Format := Data;
      if ShowModal = idOk
        then
          begin
            fFormats.Add(Format);
            UpdateFormats;
          end;
    finally
      Release;
    end;
end;

procedure TEdit_Template.UpdateFormats;
var
  I : integer;
begin
  ListView1.Items.Clear;
  CheckBox3.Enabled := false;
  CheckBox4.Enabled := false;
  CheckBox5.Enabled := false;
  CheckBox6.Enabled := false;
  CheckBox7.Enabled := false;
  CheckBox8.Enabled := false;
  for I := 0 to fFormats.Count - 1 do
    begin
      case FormatData(fFormats[I]).Onda of
        wl_3cm:
          begin
            CheckBox3.Enabled := true;
            CheckBox5.Enabled := true;
            CheckBox7.Enabled := true;
          end;
        wl_10cm:
          begin
            CheckBox4.Enabled := true;
            CheckBox6.Enabled := true;
            CheckBox8.Enabled := true;
          end;
      end;
      FillFormatItem(ListView1.Items.Add, FormatData(fFormats[I]));
    end;
end;

procedure TEdit_Template.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  fFormats := TList.Create;
  ComboBox2.ItemIndex := 3;
end;

procedure TEdit_Template.FormDestroy(Sender: TObject);
begin
  FreeFormats;
  fFormats.Free;
end;

procedure TEdit_Template.FreeFormats;
var
  I : integer;
begin
  for I := 0 to fFormats.Count - 1 do
    if assigned(fFormats[I])
      then FormatData(fFormats[I]).Free;
  fFormats.Clear;
end;

procedure TEdit_Template.GetData(Template: TTemplateInfo);
var
  I, A, O : integer;
  L : TList;
begin
  if assigned(Template)
    then
      with Template do
        begin
          Edit7.Text := Name;
          O := Flags;
          CheckBox1 .Checked := O and tf_Create_Dir    <> 0;
          CheckBox9 .Checked := O and tf_Include_Radar <> 0;
          CheckBox10.Checked := O and tf_Include_Year  <> 0;
          CheckBox11.Checked := O and tf_Include_Month <> 0;
          CheckBox12.Checked := O and tf_Include_Day   <> 0;
          Edit4.Text := Address;
          fFTPSettings := FTPSettings;
          CheckBox2.Checked := SentFTP;
          UpDown3.Position := round(Period.AsDateTime/AMinute);
          UpDown4.Position := round(Delay.AsDateTime/AMinute);
          case Kind of
            dk_PPI: RadioButton1.Checked := true;
            dk_RHI: RadioButton2.Checked := true;
          end;
          UpDown1.Position := round(CodeAngle(Start));
          UpDown2.Position := round(CodeAngle(Finish));
          Edit12.Text := Format('%.1f', [CodeSpeed(Speed)]);
          L := TList.Create;
          try
            L.Count := Angles;
            for I := 0 to L.Count - 1 do
              begin
                A := AngleList[I];
                L[I] := pointer(A);
              end;
            Edit3.Text := ParseAngles(L);
          finally
            L.Free;
          end;
          case Sectors of
            120 : ComboBox2.ItemIndex := 0;  // 3.0
            180 : ComboBox2.ItemIndex := 1;  // 2.0
            240 : ComboBox2.ItemIndex := 2;  // 1.5
            256 : ComboBox2.ItemIndex := 3;  // 1.4
            360 : ComboBox2.ItemIndex := 4;  // 1.0
            512 : ComboBox2.ItemIndex := 5;  // 0.7
            720 : ComboBox2.ItemIndex := 6;  // 0.5
            else ComboBox2.ItemIndex := 3;  // 1.4
          end;
          Freq_AD.ItemIndex := RateIndex( ADRate );
          FreeFormats;
          fFormats.Count := Formats;
          for I := 0 to fFormats.Count-1 do
            begin
              fFormats[I] := FormatData.Create();
              with FormatData(fFormats[I]) do
              begin
                Onda   := FormatList[I].Onda;
                Celdas := FormatList[I].Celdas;
                Long   := FormatList[I].Long;
              end;
            end;
          case Pulse of
            tx_Pulse_Long:  RadioButton3.Checked := true;
            tx_Pulse_Short: RadioButton4.Checked := true;
          end;
          CheckBox3.State := TCheckBoxState(TR1.CRT);
          CheckBox5.State := TCheckBoxState(TR1.CMG);
          CheckBox7.State := TCheckBoxState(TR1.CMS);
          CheckBox4.State := TCheckBoxState(TR2.CRT);
          CheckBox6.State := TCheckBoxState(TR2.CMG);
          CheckBox8.State := TCheckBoxState(TR2.CMS);

          txCh10cmB0.Text := FloatToStr(CH10cm_B0);
          txCh10cmB1.Text := FloatToStr(Ch10cm_B1);
          txCh10cmB2.Text := FloatToStr(Ch10cm_B2);
          txCh10cmA1.Text := FloatToStr(Ch10cm_A1);
          txCh10cmA2.Text := FloatToStr(Ch10cm_A2);
          txCh3cmB0.Text := FloatToStr(CH3cm_B0);
          txCh3cmB1.Text := FloatToStr(Ch3cm_B1);
          txCh3cmB2.Text := FloatToStr(Ch3cm_B2);
          txCh3cmA1.Text := FloatToStr(Ch3cm_A1);
          txCh3cmA2.Text := FloatToStr(Ch3cm_A2);
          txCh10cmThreshold.Text := FloatToStr(CH10cm_Threshold);
          txCh3cmThreshold.Text := FloatToStr(CH3cm_Threshold);
          chFilter.Checked := Filter;
          chSaveFilter.Checked := SaveFilter;
          chApplyFilter.Checked := ApplyFilter;
          txMaxAngle.Text := FloatToStr(MaxAngleEchoFilter);
          txMaxHeigh.Text := IntToStr(MaxHeightEchoFilter);
          txMaxLenght.Text := IntToStr(MaxDistanceEchoFilter);
          UpdateFormats;
        end;
end;

procedure TEdit_Template.SetData(Template: TTemplateInfo);
var
  I, O : integer;
begin
  if assigned(Template)
    then
      try
        with Template do
          begin
            Name := Edit7.Text;
            O := 0;
            if CheckBox1 .Checked then O := O or tf_Create_Dir;
            if CheckBox9 .Checked then O := O or tf_Include_Radar;
            if CheckBox10.Checked then O := O or tf_Include_Year;
            if CheckBox11.Checked then O := O or tf_Include_Month;
            if CheckBox12.Checked then O := O or tf_Include_Day;
            Flags := O;
            Address := Edit4.Text;
            FTPSettings := fFTPSettings;
            SentFTP := CheckBox2.Checked;
            Period.AsDateTime := UpDown3.Position * AMinute;
            Delay.AsDateTime  := UpDown4.Position * AMinute;
            if RadioButton1.Checked
              then Kind := dk_PPI
              else Kind := dk_RHI;
            Start := AngleCode(UpDown1.Position);
            Finish    := AngleCode(UpDown2.Position);
            Speed := SpeedCode(StrToFloat(Edit12.Text));
            with ScanAngles(Edit3.Text) do
              try
                Angles := Count;
                for I := 0 to Count - 1 do
                  AngleList[I] := integer(Items[I]);
              finally
                Free;
              end;
            case ComboBox2.ItemIndex of
              0: Sectors := 120;  // 3.0
              1: Sectors := 180;  // 2.0
              2: Sectors := 240;  // 1.5
              3: Sectors := 256;  // 1.4
              4: Sectors := 360;  // 1.0
              5: Sectors := 512;  // 0.7
              6: Sectors := 720;  // 0.5
            end;
            ADRate := Trunc( Combo_Freqs[ Freq_AD.ItemIndex ] );
            Formats := fFormats.Count;
            for I := 0 to fFormats.Count - 1 do
              with FormatData(fFormats[I]) do
              begin
                FormatList[I].Onda := Onda;
                FormatList[I].Celdas := Celdas;
                FormatList[I].Long := Long;
              end;
            if RadioButton3.Checked
              then Pulse := tx_Pulse_Long
              else Pulse := tx_Pulse_Short;
            TR1.CRT := TxRxOptionsEnum(CheckBox3.State);
            TR1.CMG := TxRxOptionsEnum(CheckBox5.State);
            TR1.CMS := TxRxOptionsEnum(CheckBox7.State);
            TR2.CRT := TxRxOptionsEnum(CheckBox4.State);
            TR2.CMG := TxRxOptionsEnum(CheckBox6.State);
            TR2.CMS := TxRxOptionsEnum(CheckBox8.State);
            //filter
            CH10cm_B0 := StrToFloat(txCh10cmB0.Text);
            Ch10cm_B1 := StrToFloat(txCh10cmB1.Text);
            Ch10cm_B2 := StrToFloat(txCh10cmB2.Text);
            Ch10cm_A1 := StrToFloat(txCh10cmA1.Text);
            Ch10cm_A2 := StrToFloat(txCh10cmA2.Text);
            CH3cm_B0 := StrToFloat(txCh3cmB0.Text);
            Ch3cm_B1 := StrToFloat(txCh3cmB1.Text);
            Ch3cm_B2 := StrToFloat(txCh3cmB2.Text);
            Ch3cm_A1 := StrToFloat(txCh3cmA1.Text);
            Ch3cm_A2 := StrToFloat(txCh3cmA2.Text);
            CH10cm_Threshold := StrToFloat(txCh10cmThreshold.Text);
            CH3cm_Threshold := StrToFloat(txCh3cmThreshold.Text);
            Filter := chFilter.Checked;
            SaveFilter := chSaveFilter.Checked;
            ApplyFilter := chApplyFilter.Checked;
            MaxAngleEchoFilter := StrToFloat(txMaxAngle.Text);
            MaxHeightEchoFilter := StrToInt(txMaxHeigh.Text);
            MaxDistanceEchoFilter := StrToInt(txMaxLenght.Text);
          end;
    except
      ShowMessage('Verifique los datos entrados e intente nuevamente.');
    end;          
end;

procedure TEdit_Template.RadioButton3Click(Sender: TObject);
begin
  UpdateFormats;
end;

procedure TEdit_Template.RadioButton1Click(Sender: TObject);
begin
  UpDown1.Min := 0;
  UpDown2.Min := 0;
  UpDown1.Max := 360;
  UpDown2.Max := 360;
  UpDown1.Position := 0;
  UpDown2.Position := 360;
  Edit1.Enabled := false;
  Edit2.Enabled := false;
  UpDown1.Enabled := false;
  UpDown2.Enabled := false;
  Edit12.Text := '4.0';
end;

procedure TEdit_Template.RadioButton2Click(Sender: TObject);
begin
  UpDown1.Min := -3;
  UpDown2.Min := -3;
  UpDown1.Max := 90;
  UpDown2.Max := 90;
  UpDown1.Position := -3;
  UpDown2.Position := 80;
  Edit1.Enabled := true;
  Edit2.Enabled := true;
  UpDown1.Enabled := true;
  UpDown2.Enabled := true;
  Edit12.Text := '2.0';
end;

procedure TEdit_Template.Button6Click(Sender: TObject);
begin
  with TFTPSettings.Create( Application ) do
    try
      LoadCurrentSettings( fFTPSettings );
      if ShowModal = mrOk
        then fFTPSettings := GenerateSettings;
    finally
      Free;
    end;
end;

end.
