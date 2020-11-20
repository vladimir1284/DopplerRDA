unit EditTemplate;

interface

uses
  Windows, SysUtils, Forms,
  Rda_TLB, ComCtrls, ExtCtrls, Controls, StdCtrls, Classes, Dialogs;

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
    Label16: TLabel;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    ListView1: TListView;
    Label17: TLabel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    Button6: TButton;
    CheckBox2: TCheckBox;
    Label21: TLabel;
    TabSheet5: TTabSheet;
    chFilter: TCheckBox;
    rgPulseRate: TRadioGroup;
    gb3cm: TGroupBox;
    ckManualAFC3cm: TCheckBox;
    Panel5: TPanel;
    txStaloFreq3cm: TEdit;
    txStaloPower3cm: TEdit;
    txNCO3cm: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    gb10cm: TGroupBox;
    ckManualAFC10cm: TCheckBox;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label18: TLabel;
    txStaloFreq10cm: TEdit;
    txStaloPower10cm: TEdit;
    txNCO10cm: TEdit;
    pFilters: TPanel;
    Label119: TLabel;
    Label120: TLabel;
    Label34: TLabel;
    txMaxAngle: TEdit;
    txMaxHeigh: TEdit;
    txMaxLenght: TEdit;
    cbFilter1: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    cbFilter2: TComboBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ckSQI: TCheckBox;
    ckCI: TCheckBox;
    ckSIG: TCheckBox;
    ckLOG: TCheckBox;
    ckCCOR: TCheckBox;
    rgPulse: TRadioGroup;
    Label22: TLabel;
    cbSectors: TComboBox;
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
    procedure ckManualAFC3cmClick(Sender: TObject);
    procedure ckManualAFC10cmClick(Sender: TObject);
    procedure chFilterClick(Sender: TObject);
    procedure rgPulseClick(Sender: TObject);
  private
    fFTPSettings : string;
    fFormats : TList;
    procedure FreeFormats;
    procedure UpdateFormats;
  public
    procedure GetData( Template : ITemplate; Configuration : IConfiguration );
    procedure SetData( Template : ITemplateControl );
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
    then FreeMem(fFormats[I]);
  fFormats.Delete(I);
  UpdateFormats;
end;

procedure TEdit_Template.Button5Click(Sender: TObject);
begin  //Editar
  with TEdit_Format.Create(Self) do
    try
      Format := FormatData(fFormats[ListView1.Selected.Index]^);
      if ShowModal = idOk
        then
          begin
            FormatData(fFormats[ListView1.Selected.Index]^) := Format;
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
      with Data do
        begin
          Onda   := wl_10cm;
          Celdas := 1000;
          Long   := 300;
        end;
      Format := Data;
      if ShowModal = idOk
        then
          begin
            fFormats.Add(AllocMem(sizeof(Data)));
            FormatData(fFormats[fFormats.Count - 1]^) := Format;
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
  gb3cm.Enabled := false;
  gb10cm.Enabled := false;
  for I := 0 to fFormats.Count - 1 do
    begin
      case FormatData(fFormats[I]^).Onda of
        wl_3cm:  gb3cm.Enabled := true;
        wl_10cm: gb10cm.Enabled := true;
      end;

      FillFormatItem(ListView1.Items.Add, FormatData(fFormats[I]^));
    end;
end;

procedure TEdit_Template.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  fFormats := TList.Create;
  cbSectors.ItemIndex := 0;
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
      then FreeMem(fFormats[I]);
  fFormats.Clear;
end;

procedure TEdit_Template.GetData(Template: ITemplate; Configuration : IConfiguration);
var
  I, A, O, Speed, Pulse, Rate : integer;
  B0, B1, B2, B3, B4, C1, C2, C3, C4 : double;
  FilterName : WideString;
  L : TList;
begin
  if assigned(Template)
    then
      with Template do
        begin
          Edit7.Text := Nombre;
          O := Opciones;
          CheckBox1 .Checked := O and tf_Create_Dir    <> 0;
          CheckBox9 .Checked := O and tf_Include_Radar <> 0;
          CheckBox10.Checked := O and tf_Include_Year  <> 0;
          CheckBox11.Checked := O and tf_Include_Month <> 0;
          CheckBox12.Checked := O and tf_Include_Day   <> 0;
          Edit4.Text := Direcciones;
          fFTPSettings := FTPSettings;
          CheckBox2.Checked := SentFTP;
          UpDown3.Position := round(Periodo/AMinute);
          UpDown4.Position := round(Demora/AMinute);
          case Tipo of
            tk_PPI: RadioButton1.Checked := true;
            tk_RHI: RadioButton2.Checked := true;
          end;
          UpDown1.Position := round(CodeAngle(Inicio));
          UpDown2.Position := round(CodeAngle(Fin));
          Edit12.Text := Format('%.1f', [CodeSpeed(Velocidad)]);
          L := TList.Create;
          try
            L.Count := Angulos;
            for I := 0 to L.Count - 1 do
              begin
                Movement(I, A, Speed, Pulse, Rate);
                L[I] := pointer(A);
              end;
            Edit3.Text := ParseAngles(L);
          finally
            L.Free;
          end;
          FreeFormats;
          fFormats.Count := Formatos;
          for I := 0 to fFormats.Count-1 do
            begin
              fFormats[I] := AllocMem(sizeof(FormatData));
              with FormatData(fFormats[I]^) do
                Formato(I, Onda, Celdas, Long);
            end;
          case Pulso of
            tx_Pulse_Long:  rgPulse.ItemIndex := 0;
            tx_Pulse_Short: rgPulse.ItemIndex := 1;
          end;
          rgPulseRate.ItemIndex := PulseRate;
          rgPulseRate.Enabled := rgPulse.ItemIndex = 1;

          case Sectores of
            360 : cbSectors.ItemIndex := 0;  // 1.0
            720 : cbSectors.ItemIndex := 1;  // 0.5
            else cbSectors.ItemIndex := 0;  // 1.0
          end;

          chFilter.Checked := Filter;
          cbFilter1.AddItem('No filtrar', nil);
          cbFilter2.AddItem('No filtrar', nil);
          for I := 0 to Configuration.FilterCount - 1 do
            begin
              Configuration.Filter(i, FilterName, B0, B1, B2, B3, B4, C1, C2, C3, C4);
              cbFilter1.AddItem(FilterName, nil);
              cbFilter2.AddItem(FilterName, nil);
            end;
          if FilterCH1 < cbFilter1.Items.Count
            then cbFilter1.ItemIndex := FilterCH1
            else cbFilter1.ItemIndex := 0;
          if FilterCH2 < cbFilter2.Items.Count
            then cbFilter2.ItemIndex := FilterCH2
            else cbFilter2.ItemIndex := 0;
          txMaxAngle.Text  := FormatFloat( '0.0', Filter_MaxAngle);
          txMaxHeigh.Text  := IntToStr(Filter_MaxHeigh);
          txMaxLenght.Text := IntToStr(Filter_Distance);
          ckSQI.Checked    := FilterSQI;
          ckCI.Checked     := FilterCI;
          ckSIG.Checked    := FilterSIG;
          ckLOG.Checked    := FilterLOG;
          ckCCOR.Checked   := FilterCCOR;
          pFilters.Enabled := chFilter.Checked;

          ckManualAFC3cm.Checked := CH3cm_ManualAFC;
          txStaloPower3cm.Text := FormatFloat( '0.00', CH3cm_StaloPower);
          txStaloFreq3cm.Text := IntToStr(CH3cm_StaloFreq);
          txNCO3cm.Text := IntToStr(CH3cm_NCO);
          ckManualAFC10cm.Checked := CH10cm_ManualAFC;
          txStaloPower10cm.Text := FormatFloat( '0.00', CH10cm_StaloPower);
          txStaloFreq10cm.Text := IntToStr(CH10cm_StaloFreq);
          txNCO10cm.Text := IntToStr(CH10cm_NCO);

          UpdateFormats;
        end;
end;

procedure TEdit_Template.SetData(Template: ITemplateControl);
var
  I, O : integer;
  Angle, Speed, Pulse, Rate : integer;
begin
  if assigned(Template)
    then
      try
        with Template do
          begin
            Set_Nombre(Edit7.Text);
            O := 0;
            if CheckBox1 .Checked then O := O or tf_Create_Dir;
            if CheckBox9 .Checked then O := O or tf_Include_Radar;
            if CheckBox10.Checked then O := O or tf_Include_Year;
            if CheckBox11.Checked then O := O or tf_Include_Month;
            if CheckBox12.Checked then O := O or tf_Include_Day;
            Opciones := O;
            Set_Direcciones( Edit4.Text );
            Set_FTPSettings( fFTPSettings );
            SentFTP := CheckBox2.Checked;
            Periodo := UpDown3.Position * AMinute;
            Demora  := UpDown4.Position * AMinute;
            if RadioButton1.Checked
              then Tipo := tk_PPI
              else Tipo := tk_RHI;
            Inicio := AngleCode(UpDown1.Position);
            Fin    := AngleCode(UpDown2.Position);
            Velocidad := SpeedCode(StrToFloat(Edit12.Text));
            with ScanAngles(Edit3.Text) do
              try
                Angulos := Count;
                Speed := SpeedCode(StrToFloat(Edit12.Text));
                if rgPulse.ItemIndex = 0
                  then Pulse := tx_Pulse_Long
                  else Pulse := tx_Pulse_Short;
                case rgPulseRate.ItemIndex of
                  0: Rate := tx_Dual_54;
                  1: Rate := tx_Dual_43;
                  2: Rate := tx_Dual_32;
                  3: Rate := tx_Dual_None;
                end;
                for I := 0 to Count - 1 do
                begin
                  Angle := integer(Items[I]);
                  SetMovement(I, Angle, Speed, Pulse, Rate);
                end;
              finally
                Free;
              end;
            Formatos := fFormats.Count;
            for I := 0 to fFormats.Count - 1 do
              with FormatData(fFormats[I]^) do
                SetFormato(I, Onda, Celdas, Long);
            if rgPulse.ItemIndex = 0
              then Pulso := tx_Pulse_Long
              else Pulso := tx_Pulse_Short;
            case rgPulseRate.ItemIndex of
              0: PulseRate := tx_Dual_54;
              1: PulseRate := tx_Dual_43;
              2: PulseRate := tx_Dual_32;
            end;

            case cbSectors.ItemIndex of
              0: Sectores := 360;  // 1.0
              1: Sectores := 720;  // 0.5
            end;

            //filter
            Filter             := chFilter.Checked;
            FilterCH1          := cbFilter1.ItemIndex;
            FilterCH2          := cbFilter2.ItemIndex;
            Filter_MaxAngle    := StrToFloat(txMaxAngle.Text);
            Filter_MaxHeigh    := StrToInt(txMaxHeigh.Text);
            FilterSQI          := ckSQI.Checked;
            FilterCI           := ckCI.Checked;
            FilterSIG          := ckSIG.Checked;
            FilterLOG          := ckLOG.Checked;
            FilterCCOR         := ckCCOR.Checked;
            Filter_MaxDistance := StrToInt(txMaxLenght.Text);

            CH3cm_ManualAFC := ckManualAFC3cm.Checked;
            CH3cm_StaloPower := StrToFloat(txStaloPower3cm.Text);
            CH3cm_StaloFreq := StrToInt(txStaloFreq3cm.Text);
            CH3cm_NCO := StrToInt(txNCO3cm.Text);
            CH10cm_ManualAFC := ckManualAFC10cm.Checked;
            CH10cm_StaloPower := StrToFloat(txStaloPower10cm.Text);
            CH10cm_StaloFreq := StrToInt(txStaloFreq10cm.Text);
            CH10cm_NCO := StrToInt(txNCO10cm.Text);
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

procedure TEdit_Template.ckManualAFC3cmClick(Sender: TObject);
begin
  Panel5.Enabled := ckManualAFC3cm.Checked;
end;

procedure TEdit_Template.ckManualAFC10cmClick(Sender: TObject);
begin
  Panel6.Enabled := ckManualAFC10cm.Checked;
end;

procedure TEdit_Template.chFilterClick(Sender: TObject);
begin
  pFilters.Enabled := chFilter.Checked;
end;

procedure TEdit_Template.rgPulseClick(Sender: TObject);
begin
  rgPulseRate.Enabled := rgPulse.ItemIndex = 1;
end;

end.
