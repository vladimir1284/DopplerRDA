unit FrameRTCalibration;

interface

uses
  SysUtils, Forms, 
  ElbrusTypes, Rda_TLB, Menus, ComCtrls, StdCtrls, ExtCtrls, Dialogs,
  Controls, Classes, Grids;

type
  TFrame_RTCalibration = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit9: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    TabSheet3: TTabSheet;
    StringGrid1: TStringGrid;
    Label3: TLabel;
    Edit3: TEdit;
    UpDown3: TUpDown;
    HeaderControl1: THeaderControl;
    Label15: TLabel;
    TabSheet4: TTabSheet;
    Panel4: TPanel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Edit11: TEdit;
    UpDown11: TUpDown;
    Edit12: TEdit;
    UpDown12: TUpDown;
    Edit13: TEdit;
    UpDown13: TUpDown;
    Edit14: TEdit;
    UpDown14: TUpDown;
    Edit15: TEdit;
    UpDown15: TUpDown;
    Edit16: TEdit;
    UpDown16: TUpDown;
    Edit18: TEdit;
    UpDown18: TUpDown;
    Edit19: TEdit;
    UpDown19: TUpDown;
    Edit20: TEdit;
    UpDown20: TUpDown;
    Edit21: TEdit;
    UpDown21: TUpDown;
    Edit22: TEdit;
    UpDown22: TUpDown;
    Edit23: TEdit;
    UpDown23: TUpDown;
    Edit24: TEdit;
    UpDown24: TUpDown;
    Edit25: TEdit;
    UpDown25: TUpDown;
    Edit26: TEdit;
    UpDown26: TUpDown;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit17: TEdit;
    UpDown17: TUpDown;
    PopupMenu1: TPopupMenu;
    Importar1: TMenuItem;
    Exportar1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure HeaderControl1SectionResize(HeaderControl: THeaderControl;
      Section: THeaderSection);
    procedure UpDown3ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure HeaderControl1Resize(Sender: TObject);
    procedure Importar1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
  private
    fCalibration    : ICalibration;
    fControl        : ICalibrationControl;
    procedure SetCalibration( Value : ICalibration );
    procedure ImportTxRx;
    procedure ExportTxRx;
  private
    fCodes : PWords;
  public
    property Calibration    : ICalibration        read fCalibration write SetCalibration;
    property Control        : ICalibrationControl read fControl;
    property Codes          : PWords read fCodes write fCodes;

    procedure DisplayCodes;
    procedure UpdateCodes;
    procedure ReallocCodesMemory( NewSize : word );
  end;

implementation

{$R *.DFM}

uses
  ActiveX;

{ TFrame_Calibration }

procedure TFrame_RTCalibration.SetCalibration(Value: ICalibration);
begin
  fCalibration := Value;
  if assigned(fCalibration)
    then fCalibration.QueryInterface(ICalibrationControl, fControl)
    else fControl := nil;
  if assigned(fCalibration)
    then Label15.Caption := 'Canal ' + IntToStr((fCalibration as ITxRxStatus).Numero);
  Edit1.Enabled := assigned(fCalibration);
  Edit2.Enabled := assigned(fCalibration);
  Edit3.Enabled := assigned(fCalibration);
  UpDown1.Enabled := assigned(fCalibration);
  UpDown2.Enabled := assigned(fCalibration);
  UpDown3.Enabled := assigned(fCalibration);
  Edit7.Enabled := assigned(fCalibration);
  Edit8.Enabled := assigned(fCalibration);
  Edit9.Enabled := assigned(fCalibration);
  Edit10.Enabled := assigned(fCalibration);
  StringGrid1.Enabled := assigned(fCalibration);
  Edit11.Enabled := assigned(fCalibration);
  Edit12.Enabled := assigned(fCalibration);
  Edit13.Enabled := assigned(fCalibration);
  Edit14.Enabled := assigned(fCalibration);
  Edit15.Enabled := assigned(fCalibration);
  Edit16.Enabled := assigned(fCalibration);
  Edit17.Enabled := assigned(fCalibration);
  Edit18.Enabled := assigned(fCalibration);
  Edit19.Enabled := assigned(fCalibration);
  Edit20.Enabled := assigned(fCalibration);
  Edit21.Enabled := assigned(fCalibration);
  Edit22.Enabled := assigned(fCalibration);
  Edit23.Enabled := assigned(fCalibration);
  Edit24.Enabled := assigned(fCalibration);
  Edit25.Enabled := assigned(fCalibration);
  Edit26.Enabled := assigned(fCalibration);
  UpDown11.Enabled := assigned(fCalibration);
  UpDown12.Enabled := assigned(fCalibration);
  UpDown13.Enabled := assigned(fCalibration);
  UpDown14.Enabled := assigned(fCalibration);
  UpDown15.Enabled := assigned(fCalibration);
  UpDown16.Enabled := assigned(fCalibration);
  UpDown17.Enabled := assigned(fCalibration);
  UpDown18.Enabled := assigned(fCalibration);
  UpDown19.Enabled := assigned(fCalibration);
  UpDown20.Enabled := assigned(fCalibration);
  UpDown21.Enabled := assigned(fCalibration);
  UpDown22.Enabled := assigned(fCalibration);
  UpDown23.Enabled := assigned(fCalibration);
  UpDown24.Enabled := assigned(fCalibration);
  UpDown25.Enabled := assigned(fCalibration);
  UpDown26.Enabled := assigned(fCalibration);
  Button1.Enabled := assigned(fCalibration);
  Button2.Enabled := assigned(fCalibration);
  if assigned(fCalibration)
    then Button2Click(Button2);
end;

procedure TFrame_RTCalibration.Button2Click(Sender: TObject);
var
  SA_Codes : PSafeArray;
begin  // Restaurar
  if assigned(fCalibration)
    then
      with fCalibration do
        begin
          UpDown1.Position := Potencia;
          Edit7 .Text := Format('%.4f', [CRadarPL]);
          Edit8 .Text := Format('%.4f', [CRadarPC]);
          Edit9 .Text := Format('%.4f', [PotMetPL]);
          Edit10.Text := Format('%.4f', [PotMetPC]);
          SA_Codes := Codigos;
          if assigned(SA_Codes)
            then
              begin
                UpDown3.Position := SA_Codes.rgsabound[0].cElements;
                UpDown2.Position := SA_Codes.rgsabound[0].lLbound;
                ReallocMem(fCodes, UpDown3.Position * sizeof(word));
                SafeArrayLock(SA_Codes);
                Move(SA_Codes.pvData^, fCodes^, UpDown3.Position * sizeof(word));
                SafeArrayUnlock(SA_Codes);
              end
            else UpDown3.Position := 0;
          DisplayCodes;
        end;
end;

function IntsToMaxMin( V1, V2 : integer ) : integer;
begin
  with MaxMin(Result) do
    begin
      Min := V1;
      Max := V2;
    end;
end;

procedure TFrame_RTCalibration.Button1Click(Sender: TObject);
var
  SAB      : TSafeArrayBound;
  SA_Codes : PSafeArray;
begin  // Configurar
  if assigned(fControl)
    then
      with fControl do
        begin
          Potencia := UpDown1.Position;
          try
            CRadarPL := StrToFloat(Edit7.Text);
          except on EConvertError do
          end;
          try
            CRadarPC := StrToFloat(Edit8.Text);
          except on EConvertError do
          end;
          UpdateCodes;
          if UpDown3.Position > 0
            then
              begin
                SAB.cElements := UpDown3.Position;
                SAB.lLbound := UpDown2.Position;
                SA_Codes := SafeArrayCreate(VT_UI2, 1, SAB);
                Move(fCodes^, SA_Codes.pvData^, SAB.cElements * sa_Codes.cbElements);
              end
            else SA_Codes := nil;
          Codigos := SA_Codes;
        end;
  Button2Click(Button2);
end;

procedure TFrame_RTCalibration.DisplayCodes;
var
  I : integer;
begin
  with StringGrid1 do
    begin
      RowCount := UpDown3.Position;
      for I := 0 to UpDown3.Position - 1 do
        begin
          Cells[0, I] := IntToStr(UpDown2.Position + I);
          Cells[1, I] := IntToStr(fCodes[I]);
        end;
      Enabled := UpDown3.Position > 0;
    end;
end;

procedure TFrame_RTCalibration.UpdateCodes;
var
  I : integer;
begin
  with StringGrid1 do
    for I := 0 to UpDown3.Position - 1 do
      try
        fCodes[I] := StrToInt(Cells[1, I]);
      except
        on EConvertError do
          if I = 0
           then fCodes[I] := 0
           else fCodes[I] := fCodes[pred(I)];
      end;
end;

procedure TFrame_RTCalibration.Edit2Change(Sender: TObject);
begin
  if assigned(fCalibration)
    then DisplayCodes;
end;

procedure TFrame_RTCalibration.HeaderControl1SectionResize(
  HeaderControl: THeaderControl; Section: THeaderSection);
begin
  StringGrid1.ColWidths[Section.Index] := Section.Width;
end;

procedure TFrame_RTCalibration.UpDown3ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  ReallocMem(fCodes, NewValue * sizeof(word));
  if NewValue > UpDown3.Position
    then FillChar(fCodes^[UpDown3.Position], (NewValue - UpDown3.Position) * sizeof(word), 0);
end;

procedure TFrame_RTCalibration.HeaderControl1Resize(Sender: TObject);
var
  I : integer;
begin
  with HeaderControl1 do
    for I := 0 to Sections.Count - 1 do
      StringGrid1.ColWidths[I] := Sections[I].Width;
end;

procedure TFrame_RTCalibration.ReallocCodesMemory(NewSize: word);
begin
  ReallocMem(fCodes, NewSize * sizeof(word));
end;

procedure TFrame_RTCalibration.ExportTxRx;
var
  NewCodes : TStrings;
  i        : integer;
begin
  if SaveDialog1.Execute
    then
      begin
        NewCodes := TStringList.Create;
        try
          with Calibration do
          begin
            UpdateCodes;
            if UpDown3.Position > 0
              then
                for i := 0 to UpDown3.Position-1 do
                  NewCodes.Add( IntToStr( UpDown2.Position + i ) + '=' + IntToStr( Codes[i] ) );
          end;
          NewCodes.SaveToFile( SaveDialog1.FileName );
        finally
          NewCodes.Free;
        end;
      end;
end;

procedure TFrame_RTCalibration.ImportTxRx;
var
  NewCodes : TStrings;
  i        : integer;
begin
  if OpenDialog1.Execute
    then
      begin
        NewCodes := TStringList.Create;
        NewCodes.LoadFromFile( OpenDialog1.FileName );
        try
          with Calibration do
          try
            UpDown2.Position := StrToInt( NewCodes.Names[0] );
            UpDown3.Position := NewCodes.Count;
            ReallocCodesMemory( UpDown3.Position );
            for i := 0 to UpDown3.Position-1 do
              Codes[i] := StrToInt( NewCodes.Values[ IntToStr( UpDown2.Position+i ) ] );
            DisplayCodes;
          except
            UpDown3.Position := 0;
            ReallocCodesMemory( UpDown3.Position );
            DisplayCodes;
          end;
        finally
          NewCodes.Free;
        end;
      end;
end;

procedure TFrame_RTCalibration.Importar1Click(Sender: TObject);
begin
  ImportTxRx;
end;

procedure TFrame_RTCalibration.Exportar1Click(Sender: TObject);
begin
  ExportTxRx;
end;

end.

