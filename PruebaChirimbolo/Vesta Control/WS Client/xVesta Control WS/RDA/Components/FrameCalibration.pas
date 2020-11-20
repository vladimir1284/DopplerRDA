unit FrameCalibration;

interface

uses
  SysUtils, Forms, 
  ElbrusTypes, Menus, ComCtrls, Grids, StdCtrls, ExtCtrls, Dialogs, Types,
  Controls, Classes, CommonObjs, InvokeRegistry, CalibrationWS, TxRxChWS;

type
  TFrame_Calibration = class(TFrame)
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
    Completar1: TMenuItem;
    Graficar1: TMenuItem;
    Borrar1: TMenuItem;
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
    procedure Completar1Click(Sender: TObject);
    procedure Graficar1Click(Sender: TObject);
    procedure Borrar1Click(Sender: TObject);
  private
    fAuthHeader : TAuthHeader;
    fUpdating : boolean;

    fCalibration    : ICalibrationWS;
    fMeasure        : ITxRxChWS;
    procedure ImportTxRx;
    procedure ExportTxRx;
    procedure CompleteTxRxTable;
    procedure PlotTxRxTable;
    function GetCalibration: ICalibrationWS;
    function GetControl: ICalibrationWS;
    function GetMeasure: ITxRxChWS;
    function GetMeasureControl: ITxRxChWS;
  private
    fCodes : PWords;
  public
    procedure Init(Calibration: ICalibrationWS; TxRxCh: ITxRxChWS; AuthHeader : TAuthHeader);

    property Updating : boolean read fUpdating;
  public
    property Calibration    : ICalibrationWS read GetCalibration;
    property Control        : ICalibrationWS read GetControl;
    property Measure        : ITxRxChWS      read GetMeasure;
    property MeasureControl : ITxRxChWS      read GetMeasureControl;

    property Codes : PWords read fCodes write fCodes;

    procedure DisplayCodes;
    procedure UpdateCodes;
    procedure ReallocCodesMemory( NewSize : word );
  end;

implementation

{$R *.DFM}

uses
  ActiveX, PlotForm;

{ TFrame_Calibration }
procedure TFrame_Calibration.Button2Click(Sender: TObject);
var
  Table : TCalibrationTable;
  Range, Sensibility, i : integer;
begin  // Restaurar
  if fUpdating then exit;
  fUpdating := true;
  try
    try
      if assigned(Measure)
        then
          begin
            with MaxMin(Measure.Rango_Tx_Potencia) do
              begin
                UpDown11.Position := Min;
                UpDown15.Position := Max;
              end;
            with MaxMin(Measure.Rango_Rx_Ruido) do
              begin
                UpDown12.Position := Min;
                UpDown16.Position := Max;
              end;
            with MaxMin(Measure.Rango_Rx_Ganancia) do
              begin
                UpDown13.Position := Min;
                UpDown17.Position := Max;
              end;
            with MaxMin(Measure.Rango_Rx_Sintonia) do
              begin
                UpDown14.Position := Min;
                UpDown18.Position := Max;
              end;
            with MaxMin(Measure.Sector_Tx_Potencia) do
              begin
                UpDown19.Position := Min;
                UpDown23.Position := Max;
              end;
            with MaxMin(Measure.Sector_Rx_Ruido) do
              begin
                UpDown20.Position := Min;
                UpDown24.Position := Max;
              end;
            with MaxMin(Measure.Sector_Rx_Ganancia) do
              begin
                UpDown21.Position := Min;
                UpDown25.Position := Max;
              end;
            with MaxMin(Measure.Sector_Rx_Sintonia) do
              begin
                UpDown22.Position := Min;
                UpDown26.Position := Max;
              end;
          end;
    except
    end;

    try
      if assigned(Calibration)
        then
          begin
            UpDown1.Position := Calibration.Potencia;
            Edit7 .Text := Format('%.4f', [Calibration.CRadarPL]);
            Edit8 .Text := Format('%.4f', [Calibration.CRadarPC]);
            Edit9 .Text := Format('%.4f', [Calibration.PotMetPL]);
            Edit10.Text := Format('%.4f', [Calibration.PotMetPC]);
            Table := Calibration.Codigos;
            if Assigned(Table)
              then
                begin
                  Range := Table.Range;
                  Sensibility := Table.Sensibility;
                  UpDown3.Position := Range;
                  UpDown2.Position := Sensibility;
                  ReallocMem(fCodes, UpDown3.Position * sizeof(word));
                  for i := 0 to Range-1 do
                    fCodes^[i] := Table.Data[i];
                end
              else UpDown3.Position := 0;
            DisplayCodes;
          end;
    except
    end;
  finally
    fUpdating := false;
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

procedure TFrame_Calibration.Button1Click(Sender: TObject);
var
  Table : TCalibrationTable;
  i : integer;
begin  // Configurar
  if fUpdating then exit;
  fUpdating := true;
  try
    try
      if assigned(MeasureControl)
        then
          begin
            MeasureControl.Rango_Tx_Potencia  := IntsToMaxMin(UpDown11.Position, UpDown15.Position);
            MeasureControl.Rango_Rx_Ruido     := IntsToMaxMin(UpDown12.Position, UpDown16.Position);
            MeasureControl.Rango_Rx_Ganancia  := IntsToMaxMin(UpDown13.Position, UpDown17.Position);
            MeasureControl.Rango_Rx_Sintonia  := IntsToMaxMin(UpDown14.Position, UpDown18.Position);
            MeasureControl.Sector_Tx_Potencia := IntsToMaxMin(UpDown19.Position, UpDown23.Position);
            MeasureControl.Sector_Rx_Ruido    := IntsToMaxMin(UpDown20.Position, UpDown24.Position);
            MeasureControl.Sector_Rx_Ganancia := IntsToMaxMin(UpDown21.Position, UpDown25.Position);
            MeasureControl.Sector_Rx_Sintonia := IntsToMaxMin(UpDown22.Position, UpDown26.Position);
          end;
    except
    end;

    try
      if assigned(Control)
        then
          begin
            Control.Potencia := UpDown1.Position;
            try
              Control.CRadarPL := StrToFloat(Edit7.Text);
            except on EConvertError do
            end;
            try
              Control.CRadarPC := StrToFloat(Edit8.Text);
            except on EConvertError do
            end;
            UpdateCodes;
            if UpDown3.Position > 0
              then
                begin
                  Table := TCalibrationTable.Init(UpDown3.Position, UpDown2.Position);
                  for i := 0 to UpDown3.Position-1 do
                    Table.Data[i] := fCodes^[i];
                end
              else Table := TCalibrationTable.Init(0, 0);
            Control.Codigos := Table;
          end;
    except
    end;
  finally
    fUpdating := false;
  end;

  Button2Click(Button2);
end;

procedure TFrame_Calibration.DisplayCodes;
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

procedure TFrame_Calibration.UpdateCodes;
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

procedure TFrame_Calibration.Edit2Change(Sender: TObject);
begin
  if assigned(Calibration)
    then DisplayCodes;
end;

procedure TFrame_Calibration.HeaderControl1SectionResize(
  HeaderControl: THeaderControl; Section: THeaderSection);
begin
  StringGrid1.ColWidths[Section.Index] := Section.Width;
end;

procedure TFrame_Calibration.UpDown3ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  ReallocMem(fCodes, NewValue * sizeof(word));
  if NewValue > UpDown3.Position
    then FillChar(fCodes^[UpDown3.Position], (NewValue - UpDown3.Position) * sizeof(word), 0);
end;

procedure TFrame_Calibration.HeaderControl1Resize(Sender: TObject);
var
  I : integer;
begin
  with HeaderControl1 do
    for I := 0 to Sections.Count - 1 do
      StringGrid1.ColWidths[I] := Sections[I].Width;
end;

procedure TFrame_Calibration.ReallocCodesMemory(NewSize: word);
begin
  ReallocMem(fCodes, NewSize * sizeof(word));
end;

procedure TFrame_Calibration.ExportTxRx;
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

procedure TFrame_Calibration.ImportTxRx;
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

procedure TFrame_Calibration.Importar1Click(Sender: TObject);
begin
  ImportTxRx;
end;

procedure TFrame_Calibration.Exportar1Click(Sender: TObject);
begin
  ExportTxRx;
end;

procedure TFrame_Calibration.Completar1Click(Sender: TObject);
begin
  CompleteTxRxTable
end;

procedure TFrame_Calibration.CompleteTxRxTable;
var
  i, j, StartIndex, FinalIndex, StartValue, FinalValue, IncValue : word;
begin
  with StringGrid1 do
  begin
    StartIndex := 0;
    StartValue := StrToInt(Cells[1, 0]);
    i := 1;
    repeat
      while (i < RowCount) and (StrToInt(Cells[1, I]) = 0) do
        Inc( i );
      if i < RowCount
        then
          begin
            FinalIndex := i;
            FinalValue := StrToInt(Cells[1, i]);
          end
        else
          begin
            FinalIndex := RowCount-1;
            FinalValue := 2047;
            Cells[1, FinalIndex] := '2047';
          end;
      IncValue := (FinalValue-StartValue) div (FinalIndex-StartIndex);
      for j := StartIndex+1 to FinalIndex-1 do
        Cells[1, j] := IntToStr( ((j-StartIndex)*IncValue) + StartValue );
      StartIndex := FinalIndex;
      StartValue := FinalValue;
      i := i + 1;
    until i > RowCount-1;
  end;
end;

procedure TFrame_Calibration.PlotTxRxTable;
var
  i : integer;
begin
  with TRxPlotForm.Create( Application ) do
  try
    Board.Series[0].Clear;
    for i := 0 to StringGrid1.RowCount-1 do
      Board.Series[0].AddXY( StrToInt(StringGrid1.Cells[0, I]), StrToInt(StringGrid1.Cells[1, I]) );
    Show;
  finally
  end;
end;

procedure TFrame_Calibration.Graficar1Click(Sender: TObject);
begin
  PlotTxRxTable;
end;

procedure TFrame_Calibration.Borrar1Click(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to StringGrid1.Cols[1].Count-1 do
   StringGrid1.Cells[ 1, i ] := '0';
end;

function TFrame_Calibration.GetCalibration: ICalibrationWS;
begin
  result := fCalibration;
end;

function TFrame_Calibration.GetControl: ICalibrationWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fCalibration as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fCalibration;
end;

function TFrame_Calibration.GetMeasure: ITxRxChWS;
begin
  result := fMeasure;
end;

function TFrame_Calibration.GetMeasureControl: ITxRxChWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fMeasure as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fMeasure;
end;

procedure TFrame_Calibration.Init(Calibration: ICalibrationWS; TxRxCh: ITxRxChWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fCalibration := Calibration;
  fMeasure := TxRxCh;

  if assigned(fCalibration)
    then Label15.Caption := 'Canal ' + IntToStr(fMeasure.Numero);
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

end.

