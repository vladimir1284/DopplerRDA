unit FrameCalibration;

interface

uses
  SysUtils, Forms,
  Rda_TLB, Menus, ComCtrls, Grids, StdCtrls, ExtCtrls, Dialogs,
  Controls, Classes, ValEdit, Constants, Tune;

type
  TFrame_Calibration = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit9: TEdit;
    UpDown1: TUpDown;
    PopupMenu1: TPopupMenu;
    Importar1: TMenuItem;
    Exportar1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Completar1: TMenuItem;
    Graficar1: TMenuItem;
    Borrar1: TMenuItem;
    TabSheet2: TTabSheet;
    TabSheet5: TTabSheet;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    _drx_sensibility_lp: TUpDown;
    _drx_dinamic_range_lp: TUpDown;
    Edit5: TEdit;
    Label6: TLabel;
    _start_sample_lp: TEdit;
    Label11: TLabel;
    _final_sample_lp: TEdit;
    Label12: TLabel;
    _start_sample_sp: TEdit;
    Label13: TLabel;
    _final_sample_sp: TEdit;
    Label14: TLabel;
    _tx_factor: TEdit;
    Label24: TLabel;
    _stalo_delay: TEdit;
    Label25: TLabel;
    _stalo_step: TEdit;
    Label28: TLabel;
    _stalo_width: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    _tx_pulse_lp: TEdit;
    _tx_pulse_sp: TEdit;
    Label32: TLabel;
    _valid_tx_power: TEdit;
    drx_codes_editor_lp: TValueListEditor;
    Label37: TLabel;
    _loop_gain: TEdit;
    Label2: TLabel;
    txMPS: TEdit;
    Edit2: TEdit;
    _drx_sensibility_sp: TUpDown;
    Edit6: TEdit;
    _drx_dinamic_range_sp: TUpDown;
    TabSheet3: TTabSheet;
    drx_codes_editor_sp: TValueListEditor;
    PopupMenu2: TPopupMenu;
    Borrar2: TMenuItem;
    Completar2: TMenuItem;
    Graficar2: TMenuItem;
    Importar2: TMenuItem;
    Exportar2: TMenuItem;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure _drx_dinamic_range_lpChangingEx(Sender: TObject; var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure Importar1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure Completar1Click(Sender: TObject);
    procedure Graficar1Click(Sender: TObject);
    procedure Borrar1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure _drx_dinamic_range_spChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure MenuItem3Click(Sender: TObject);
    procedure Borrar2Click(Sender: TObject);
    procedure Completar2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Graficar2Click(Sender: TObject);
    procedure Importar2Click(Sender: TObject);
    procedure Exportar2Click(Sender: TObject);
  private
    fRx             : IRxStatus;
    fCalibration    : ICalibration;
    fControl        : ICalibrationControl;
    fMeasure        : ITxRxMeasure;
    fMeasureControl : ITxRxMeasureControl;
    procedure SetCalibration( Value : ITxRxStatus );

    procedure ImportDrxTable_LP;
    procedure ExportDrxTable_LP;
    procedure CompleteDrxTable_LP;
    procedure PlotDrxTable_LP;

    procedure ImportDrxTable_SP;
    procedure ExportDrxTable_SP;
    procedure CompleteDrxTable_SP;
    procedure PlotDrxTable_SP;
  private
    fDRX_Codes_LP : PSingles;
    fDRX_Codes_SP : PSingles;
  public
    property TxRx           : ITxRxStatus          write SetCalibration;
    property Calibration    : ICalibration        read fCalibration;
    property Control        : ICalibrationControl read fControl;
    property Measure        : ITxRxMeasure        read fMeasure;
    property MeasureControl : ITxRxMeasureControl read fMeasureControl;

    procedure DisplayDrxCodes_LP;
    procedure UpdateDrxCodes_LP;
    procedure DisplayDrxCodes_SP;
    procedure UpdateDrxCodes_SP;

    procedure UpdateView;
  end;

implementation

{$R *.DFM}

uses
  ActiveX, PlotForm;

{ TFrame_Calibration }

procedure TFrame_Calibration.SetCalibration(Value: ITxRxStatus);
begin
  if assigned(Value)
    then
      begin
        Value.QueryInterface(ICalibration, fCalibration);
        Value.QueryInterface(IRxStatus, fRx);
        Value.QueryInterface(ICalibrationControl, fControl);
        Value.QueryInterface(ITxRxMeasure, fMeasure);
        Value.QueryInterface(ITxRxMeasureControl, fMeasureControl);
      end
    else
      begin
        fRx             := nil;
        fControl        := nil;
        fMeasure        := nil;
        fMeasureControl := nil;
        fCalibration    := nil;
      end;
  Edit1.Enabled := assigned(fCalibration);
  UpDown1.Enabled := assigned(fCalibration);
  Edit7.Enabled := assigned(fCalibration);
  Edit8.Enabled := assigned(fCalibration);
  Edit9.Enabled := assigned(fCalibration);
  Edit10.Enabled := assigned(fCalibration);
  Button1.Enabled := assigned(fCalibration);
  Button2.Enabled := assigned(fCalibration);
  if assigned(fCalibration)
    then Button2Click(Button2);
end;

procedure TFrame_Calibration.Button2Click(Sender: TObject);
var
  Codes_DRX : PSafeArray;
begin  // Restaurar
  if assigned(fCalibration)
    then
      with fCalibration do
        begin
          UpDown1.Position := Potencia;
          txMPS.Text := Format('%.2f', [MPS_Voltage]);

          Edit7 .Text := Format('%.4f', [CRadarPL]);
          Edit8 .Text := Format('%.4f', [CRadarPC]);
          Edit9 .Text := Format('%.4f', [PotMetPL]);
          Edit10.Text := Format('%.4f', [PotMetPC]);

          _tx_pulse_sp.Text := IntToStr(Tx_Pulse_SP);
          _tx_pulse_lp.Text := IntToStr(Tx_Pulse_LP);
          _tx_factor.Text   := FormatFloat('0.00', Tx_Factor);
          _start_sample_sp.Text := IntToStr(Start_Sample_SP);
          _start_sample_lp.Text := IntToStr(Start_Sample_LP);
          _final_sample_sp.Text := IntToStr(Final_Sample_SP);
          _final_sample_lp.Text := IntToStr(Final_Sample_LP);
          _stalo_delay.Text := IntToStr(Stalo_Delay);
          _stalo_step.Text := IntToStr(Stalo_Step);
          _stalo_width.Text := IntToStr(Stalo_Width);
          _valid_tx_power.Text := FormatFloat('0.00', Valid_tx_power);
          _loop_gain.Text := FormatFloat('0.00', Loop_Gain);

          Codes_DRX := DRX_Codes_LP;
          _drx_sensibility_lp.Position := 0;
          _drx_dinamic_range_lp.Position := 0;
          if Assigned(Codes_DRX)
            then
              begin
                _drx_sensibility_lp.Position := Codes_DRX.rgsabound[0].lLbound;
                _drx_dinamic_range_lp.Position := Codes_DRX.rgsabound[0].cElements;
                ReallocMem(fDRX_Codes_LP, _drx_dinamic_range_lp.Position * sizeof(single));
                SafeArrayLock(Codes_DRX);
                Move(Codes_DRX.pvData^, fDRX_Codes_LP^, _drx_dinamic_range_lp.Position * sizeof(single));
                SafeArrayUnlock(Codes_DRX);
              end;
          DisplayDrxCodes_LP;

          Codes_DRX := DRX_Codes_SP;
          _drx_sensibility_sp.Position := 0;
          _drx_dinamic_range_sp.Position := 0;
          if Assigned(Codes_DRX)
            then
              begin
                _drx_sensibility_sp.Position := Codes_DRX.rgsabound[0].lLbound;
                _drx_dinamic_range_sp.Position := Codes_DRX.rgsabound[0].cElements;
                ReallocMem(fDRX_Codes_SP, _drx_dinamic_range_sp.Position * sizeof(single));
                SafeArrayLock(Codes_DRX);
                Move(Codes_DRX.pvData^, fDRX_Codes_SP^, _drx_dinamic_range_sp.Position * sizeof(single));
                SafeArrayUnlock(Codes_DRX);
              end;
          DisplayDrxCodes_SP;
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
  Codes_SAB : TSafeArrayBound;
  Codes_drx : PSafeArray;
begin  // Configurar
  if assigned(fControl)
    then
      with fControl do
        begin
          Potencia := UpDown1.Position;
          try
            CRadarPL := StrToFloat(Edit7.Text);
            CRadarPC := StrToFloat(Edit8.Text);
            MPS_Voltage := StrToFloat(txMPS.Text);

            Tx_Pulse_SP := StrToInt(_tx_pulse_sp.Text);
            Tx_Pulse_LP := StrToInt(_tx_pulse_lp.Text);
            Tx_Factor := StrToFloat(_tx_factor.Text);
            Start_Sample_SP := StrToInt(_start_sample_sp.Text);
            Start_Sample_LP := StrToInt(_start_sample_lp.Text);
            Final_Sample_SP := StrToInt(_final_sample_sp.Text);
            Final_Sample_LP := StrToInt(_final_sample_lp.Text);
            Stalo_Delay := StrToInt(_stalo_delay.Text);
            Stalo_Step := StrToInt(_stalo_step.Text);
            Stalo_Width := StrToInt(_stalo_width.Text);
            Valid_tx_power := StrToFloat(_valid_tx_power.Text);
            Loop_Gain := StrToFloat(_loop_gain.Text);
          except on EConvertError do
          end;

          UpdateDrxCodes_LP;
          if _drx_dinamic_range_lp.Position > 0
            then
              begin
                Codes_SAB.cElements := _drx_dinamic_range_lp.Position;
                Codes_SAB.lLbound := _drx_sensibility_lp.Position;
                Codes_drx := SafeArrayCreate(VT_R4, 1, Codes_SAB);
                Move(fDRX_Codes_LP^, Codes_drx.pvData^, Codes_SAB.cElements * Codes_drx.cbElements);
              end
            else Codes_drx := nil;
          DRX_Codes_LP := Codes_drx;

          UpdateDrxCodes_SP;
          if _drx_dinamic_range_sp.Position > 0
            then
              begin
                Codes_SAB.cElements := _drx_dinamic_range_sp.Position;
                Codes_SAB.lLbound := _drx_sensibility_sp.Position;
                Codes_drx := SafeArrayCreate(VT_R4, 1, Codes_SAB);
                Move(fDRX_Codes_SP^, Codes_drx.pvData^, Codes_SAB.cElements * Codes_drx.cbElements);
              end
            else Codes_drx := nil;
          DRX_Codes_SP := Codes_drx;

          SaveDRX;
        end;
  Button2Click(Button2);
end;

procedure TFrame_Calibration.DisplayDrxCodes_LP;
var
  I : integer;
begin
  drx_codes_editor_lp.Strings.Clear();
  for i := 0 to _drx_dinamic_range_lp.Position-1 do
    drx_codes_editor_lp.InsertRow(FormatFloat('0.00', _drx_sensibility_lp.Position + i), FormatFloat('0.00', fDRX_Codes_LP[i]), true);
  drx_codes_editor_lp.Enabled := _drx_dinamic_range_lp.Position > 0;
end;

procedure TFrame_Calibration.UpdateDrxCodes_LP;
var
  i : integer;
begin
  for I := 0 to _drx_dinamic_range_lp.Position-1 do
    try
      fDRX_Codes_LP[i] := StrToFloat(drx_codes_editor_lp.Cells[1, i+1]);
    except
      fDRX_Codes_LP[I] := 0
    end;
end;

procedure TFrame_Calibration.Edit5Change(Sender: TObject);
begin
  DisplayDrxCodes_LP;
end;

procedure TFrame_Calibration._drx_dinamic_range_lpChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  if NewValue >= 0
    then ReallocMem(fDRX_Codes_LP, NewValue * sizeof(single));
  if NewValue > _drx_dinamic_range_lp.Position
    then FillChar(fDRX_Codes_LP^[_drx_dinamic_range_lp.Position], (NewValue - _drx_dinamic_range_lp.Position) * sizeof(single), 0);
end;

procedure TFrame_Calibration.CompleteDrxTable_SP;
var
  j, StartIndex, FinalIndex : word;
  StartValue, FinalValue, IncValue : double;
begin
  with drx_codes_editor_sp do
  begin
    StartIndex := 1;
    StartValue := StrToFloat(Cells[1, StartIndex]);
    FinalIndex := StartIndex + 1;
    repeat
      while (FinalIndex < RowCount) and (StrToFloat(Cells[1, FinalIndex]) = 0) do Inc(FinalIndex);
      if FinalIndex < RowCount
        then FinalValue := StrToFloat(Cells[1, FinalIndex])
        else
          begin
            FinalIndex := RowCount-1;
            FinalValue := 100;
            Cells[1, FinalIndex] := '100';
          end;

      IncValue := (FinalValue-StartValue) / (FinalIndex-StartIndex);
      for j := StartIndex+1 to FinalIndex-1 do
        Cells[1, j] := FormatFloat('0.00', ((j-StartIndex)*IncValue) + StartValue);

      StartIndex := FinalIndex;
      StartValue := FinalValue;
      Inc(FinalIndex);
    until FinalIndex >= RowCount;
  end;
end;

procedure TFrame_Calibration.ExportDrxTable_SP;
var
  NewCodes : TStrings;
  i        : integer;
begin
  if SaveDialog1.Execute
    then
      begin
        NewCodes := TStringList.Create;
        try
          UpdateDrxCodes_SP;
          if _drx_dinamic_range_sp.Position > 0
            then
              for i := 0 to _drx_dinamic_range_sp.Position-1 do
                NewCodes.Add( IntToStr( _drx_sensibility_sp.Position + i ) + '=' + FormatFloat('0.00', fDRX_Codes_SP[i]));

          NewCodes.SaveToFile( SaveDialog1.FileName );
        finally
          NewCodes.Free;
        end;
      end;
end;

procedure TFrame_Calibration.ImportDrxTable_SP;
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
          try
            _drx_sensibility_sp.Position := StrToInt( NewCodes.Names[0] );
            _drx_dinamic_range_sp.Position := NewCodes.Count;
            ReallocMem(fDRX_Codes_SP, _drx_dinamic_range_sp.Position * sizeof(single));
            for i := 0 to _drx_dinamic_range_sp.Position-1 do
              fDRX_Codes_SP[i] := StrToFloat(NewCodes.Values[IntToStr(_drx_sensibility_sp.Position+i )]);
            DisplayDrxCodes_SP;
          except
            _drx_dinamic_range_sp.Position := 0;
            ReallocMem(fDRX_Codes_SP, 0);
            DisplayDrxCodes_SP;
          end;
        finally
          NewCodes.Free;
        end;
      end;
end;

procedure TFrame_Calibration.PlotDrxTable_SP;
var
  i : integer;
begin
  with TRxPlotForm.Create( Application ) do
  try
    Board.Series[0].Clear;
    for I := 0 to _drx_dinamic_range_sp.Position-1 do
      Board.Series[0].AddXY(_drx_sensibility_sp.Position+i, fDRX_Codes_SP[i]);

    Show;
  finally
  end;
end;

procedure TFrame_Calibration.Importar1Click(Sender: TObject);
begin
  ImportDrxTable_LP;
end;

procedure TFrame_Calibration.Exportar1Click(Sender: TObject);
begin
  ExportDrxTable_LP;
end;

procedure TFrame_Calibration.Completar1Click(Sender: TObject);
begin
  CompleteDrxTable_LP;
end;

procedure TFrame_Calibration.Graficar1Click(Sender: TObject);
begin
  PlotDrxTable_LP;
end;

procedure TFrame_Calibration.Borrar1Click(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to drx_codes_editor_lp.RowCount-1 do
    drx_codes_editor_lp.Cells[1, i]  := '0';
end;

procedure TFrame_Calibration.DisplayDrxCodes_SP;
var
  I : integer;
begin
  drx_codes_editor_sp.Strings.Clear();
  for i := 0 to _drx_dinamic_range_sp.Position-1 do
    drx_codes_editor_sp.InsertRow(FormatFloat('0.00', _drx_sensibility_sp.Position + i), FormatFloat('0.00', fDRX_Codes_SP[i]), true);
  drx_codes_editor_sp.Enabled := _drx_dinamic_range_sp.Position > 0;
end;

procedure TFrame_Calibration.UpdateDrxCodes_SP;
var
  i : integer;
begin
  for I := 0 to _drx_dinamic_range_sp.Position-1 do
    try
      fDRX_Codes_SP[i] := StrToFloat(drx_codes_editor_sp.Cells[1, i+1]);
    except
      fDRX_Codes_SP[I] := 0
    end;
end;

procedure TFrame_Calibration.CompleteDrxTable_LP;
var
  j, StartIndex, FinalIndex : word;
  StartValue, FinalValue, IncValue : double;
begin
  with drx_codes_editor_lp do
  begin
    StartIndex := 1;
    StartValue := StrToFloat(Cells[1, StartIndex]);
    FinalIndex := StartIndex + 1;
    repeat
      while (FinalIndex < RowCount) and (StrToFloat(Cells[1, FinalIndex]) = 0) do Inc(FinalIndex);
      if FinalIndex < RowCount
        then FinalValue := StrToFloat(Cells[1, FinalIndex])
        else
          begin
            FinalIndex := RowCount-1;
            FinalValue := 100;
            Cells[1, FinalIndex] := '100';
          end;

      IncValue := (FinalValue-StartValue) / (FinalIndex-StartIndex);
      for j := StartIndex+1 to FinalIndex-1 do
        Cells[1, j] := FormatFloat('0.00', ((j-StartIndex)*IncValue) + StartValue);

      StartIndex := FinalIndex;
      StartValue := FinalValue;
      Inc(FinalIndex);
    until FinalIndex >= RowCount;
  end;
end;

procedure TFrame_Calibration.ExportDrxTable_LP;
var
  NewCodes : TStrings;
  i        : integer;
begin
  if SaveDialog1.Execute
    then
      begin
        NewCodes := TStringList.Create;
        try
          UpdateDrxCodes_LP;
          if _drx_dinamic_range_lp.Position > 0
            then
              for i := 0 to _drx_dinamic_range_lp.Position-1 do
                NewCodes.Add( IntToStr( _drx_sensibility_lp.Position + i ) + '=' + FormatFloat('0.00', fDRX_Codes_LP[i]));

          NewCodes.SaveToFile( SaveDialog1.FileName );
        finally
          NewCodes.Free;
        end;
      end;
end;

procedure TFrame_Calibration.ImportDrxTable_LP;
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
          try
            _drx_sensibility_lp.Position := StrToInt( NewCodes.Names[0] );
            _drx_dinamic_range_lp.Position := NewCodes.Count;
            ReallocMem(fDRX_Codes_LP, _drx_dinamic_range_lp.Position * sizeof(single));
            for i := 0 to _drx_dinamic_range_lp.Position-1 do
              fDRX_Codes_LP[i] := StrToFloat(NewCodes.Values[IntToStr(_drx_sensibility_lp.Position+i )]);
            DisplayDrxCodes_LP;
          except
            _drx_dinamic_range_lp.Position := 0;
            ReallocMem(fDRX_Codes_LP, 0);
            DisplayDrxCodes_LP;
          end;
        finally
          NewCodes.Free;
        end;
      end;
end;

procedure TFrame_Calibration.PlotDrxTable_LP;
var
  i : integer;
begin
  with TRxPlotForm.Create( Application ) do
  try
    Board.Series[0].Clear;
    for I := 0 to _drx_dinamic_range_lp.Position-1 do
      Board.Series[0].AddXY(_drx_sensibility_lp.Position+i, fDRX_Codes_LP[i]);

    Show;
  finally
  end;
end;

procedure TFrame_Calibration.Edit2Change(Sender: TObject);
begin
  DisplayDrxCodes_SP;
end;

procedure TFrame_Calibration._drx_dinamic_range_spChangingEx(
  Sender: TObject; var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
  if NewValue >= 0
    then ReallocMem(fDRX_Codes_SP, NewValue * sizeof(single));
  if NewValue > _drx_dinamic_range_sp.Position
    then FillChar(fDRX_Codes_SP^[_drx_dinamic_range_sp.Position], (NewValue - _drx_dinamic_range_sp.Position) * sizeof(single), 0);
end;

procedure TFrame_Calibration.MenuItem3Click(Sender: TObject);
begin
  CompleteDrxTable_SP;
end;

procedure TFrame_Calibration.Borrar2Click(Sender: TObject);
var
  i : integer;
begin
  for i := 1 to drx_codes_editor_sp.RowCount-1 do
    drx_codes_editor_sp.Cells[1, i]  := '0';
end;

procedure TFrame_Calibration.Completar2Click(Sender: TObject);
begin
  CompleteDrxTable_SP;
end;

procedure TFrame_Calibration.MenuItem4Click(Sender: TObject);
begin
  PlotDrxTable_SP;
end;

procedure TFrame_Calibration.Graficar2Click(Sender: TObject);
begin
  PlotDrxTable_SP;
end;

procedure TFrame_Calibration.Importar2Click(Sender: TObject);
begin
  ImportDrxTable_SP;
end;

procedure TFrame_Calibration.Exportar2Click(Sender: TObject);
begin
  ExportDrxTable_SP;
end;

procedure TFrame_Calibration.UpdateView;
begin
  if Assigned(fRx)
    then self.Enabled := fRx.Rx_Status <> rsFailure;
end;

end.

