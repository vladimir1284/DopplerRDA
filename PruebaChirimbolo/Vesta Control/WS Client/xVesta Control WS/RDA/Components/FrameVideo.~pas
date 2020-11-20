unit FrameVideo;

interface

uses
  SysUtils, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Onoff, ExtCtrls, Menus, ElbrusTypes,
  ActnList, Classes, Video, CommonObjs, InvokeRegistry, TxsRxsWS, VideoWS, Types, VideoDataReceiver;

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
    N2: TMenuItem;
    Codigo1: TMenuItem;
    Voltaje1: TMenuItem;
    SaveDialog1: TSaveDialog;
    PageScroller1: TPageScroller;
    Panel5: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    UpDown1: TUpDown;
    Edit6: TEdit;
    UpDown2: TUpDown;
    Edit7: TEdit;
    UpDown3: TUpDown;
    Button1: TButton;
    Edit8: TEdit;
    UpDown4: TUpDown;
    Potencia1: TMenuItem;
    cbDataType: TComboBox;
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
    procedure MenuItemClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FreqADSelect(Sender: TObject);
    procedure cbDataTypeChange(Sender: TObject);
    procedure Popup1Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
  private
    function  ValueToStr( Value : integer ) : string;
    function  CellToStr ( Cell  : integer ) : string;
    function  GetVideo: IVideoWS;
    function  GetPulse: ITxsRxsWS;
    function  GetVideoControl: IVideoWS;

    procedure VideoDataReceiver_Terminate(Sender: TObject);
  private
    fVideoDataReceiver : TVideoDataReceiver;
    fUpdating : boolean;
    fAuthHeader : TAuthHeader;

    fVideo   : IVideoWS;
    fPulse   : ITxsRxsWS;
    fOsc_On  : boolean;
    function  RateIndex( Rate : cardinal ) : integer;
    procedure SaveVideoData( FileName : string;
                             Data     : TCardinalDynArray;
                             Frames   : integer;
                             C, S, F  : integer );
  public
    procedure Init(_Video : IVideoWS; _TxsRxs : ITxsRxsWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property Video   : IVideoWS   read GetVideo;
    property Control : IVideoWS   read GetVideoControl;
    property Pulse   : ITxsRxsWS  read GetPulse;
  end;

implementation

{$R *.DFM}

uses
  ActiveX, Shell_Client;

const
  Light_Speed = 300000;  // km/s

procedure TFrame_Video.UpdateView;
var
  AntennaPos : integer;
begin
  if (Bulb1.State) and assigned(Video) and assigned(Pulse) and (not fUpdating)
    then
      begin
        fUpdating := true;
        try
          try
            Video1.DataSize := trunc(Pulse.N3 * (Video.Frecuencia_AD/1000000));
            UpDown1.Max := pred(Video1.DataSize);
            UpDown2.Max := pred(Video1.DataSize);
          except
            Bulb1.State := false;
          end;
        finally
          fUpdating := false;
        end;
      end;
end;

function TFrame_Video.CellToStr(Cell: integer): string;
begin
  if Celdas1.Checked
    then Result := IntToStr(Cell)
    else
  if Kilometros1.Checked
    then Result := Format('%.1f km', [Cell * Light_Speed/(2*Video.Frecuencia_AD)])
    else
  if Tiempo1.Checked
    then Result := Format('%.0f µs', [Cell * Video.Frecuencia_AD/1000000]);
end;

function TFrame_Video.ValueToStr(Value: integer): string;
begin
  if Codigo1.Checked or Potencia1.Checked
    then Result := IntToStr(Value)
    else
  if Voltaje1.Checked
    then Result := Format('%f V', [10*Value/4096]);
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
      UpDown1.Position := Position;
      UpDown2.Position := OtherPos;
      Edit3.Text := ValueToStr(Average1);
      Edit4.Text := ValueToStr(Average2);
      Edit5.Text := CellToStr(Position);
      Edit6.Text := CellToStr(OtherPos);
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
  OsciloscopePort : cardinal;
begin
  with Sender as TBulb do
  begin
    State := not State;
    if State
      then
        try
          OsciloscopePort := Video.Get_Osciloscope_Port;
          fVideoDataReceiver := TVideoDataReceiver.Create(ShellClient.RDAServer, OsciloscopePort, 2, cbDataType.ItemIndex, UpDown3.Position, Video1.DataSize, Potencia1.Checked);
          fVideoDataReceiver.OnTerminate := VideoDataReceiver_Terminate;
        except
          fVideoDataReceiver := nil;
        end
      else fVideoDataReceiver.Terminate;
  end;
end;

procedure TFrame_Video.CheckBox1Click(Sender: TObject);
begin
  Video1.Mask1 := not CheckBox1.Checked;
  Label1.Visible := CheckBox1.Checked;
end;

procedure TFrame_Video.CheckBox2Click(Sender: TObject);
begin
  Video1.Mask2 := not CheckBox2.Checked;
  Label2.Visible := CheckBox2.Checked;
end;

procedure TFrame_Video.MenuItemClick(Sender: TObject);
begin
  (Sender as TMenuItem).Checked := true;
end;

procedure TFrame_Video.Button1Click(Sender: TObject);
var
  SavedState : boolean;
  AntennaPos : integer;
  buffer : TChannelsData;
begin  // Salvar
  SavedState := false;
  if assigned(fVideo)
    then
      SavedState := Bulb1.State;
      Bulb1.State := false;
      buffer := Video.Adquirir_Cuadros(UpDown4.Position, 1, Video1.DataSize, Potencia1.Checked);
      try
        with Video1, SaveDialog1 do
          try
            Title := 'Canal 1';
            if Execute
              then
                if Position <> OtherPos
                  then SaveVideoData(FileName, buffer.Ch1Data, UpDown4.Position, DataSize, Position, OtherPos)
                  else SaveVideoData(FileName, buffer.Ch1Data, UpDown4.Position, DataSize, 0, DataSize - 1);
            Title := 'Canal 2';
            if Execute
              then
                if Position <> OtherPos
                  then SaveVideoData(FileName, buffer.Ch2Data, UpDown4.Position, DataSize, Position, OtherPos)
                  else SaveVideoData(FileName, buffer.Ch2Data, UpDown4.Position, DataSize, 0, DataSize - 1);
          finally
            buffer.Ch1Data := nil;
            buffer.Ch2Data := nil;
            buffer.Free;
          end;
      except
      end;
      Bulb1.State := SavedState;
end;

procedure TFrame_Video.SaveVideoData(FileName: string; Data: TCardinalDynArray;
  Frames : integer; C, S, F : integer);
var
  I, J     : integer;
  DataFile : TextFile;
begin
  AssignFile(DataFile, FileName);
  Rewrite(DataFile);
  try
    if S > F
      then
        begin
          I := F;
          F := S;
          S := I;
        end;
    if (Frames > 0) and (S < F)
      then
        for J := S to F do
          begin
            write(DataFile, Data[J]:8);
            for I := 1 to Frames - 1 do
              write(DataFile, ',', Data[I*C + J]:7);
            writeln(DataFile);
          end;
  finally
    Close(DataFile);
  end;
end;

procedure TFrame_Video.FreqADSelect(Sender: TObject);
var
  Freq_AD : cardinal;
begin
  Freq_AD := Combo_Freqs[ (Sender as TComboBox).ItemIndex ];
  Control.Set_Frecuencia_AD( Freq_AD );
end;

function TFrame_Video.RateIndex(Rate: cardinal): integer;
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

procedure TFrame_Video.Init(_Video: IVideoWS; _TxsRxs: ITxsRxsWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;

  fAuthHeader := AuthHeader;
  fVideo := _Video;
  fPulse := _TxsRxs;

  UpdateView;
end;

function TFrame_Video.GetVideo: IVideoWS;
begin
  result := fVideo;
end;

function TFrame_Video.GetPulse: ITxsRxsWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fPulse as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fPulse;
end;

function TFrame_Video.GetVideoControl: IVideoWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fVideo as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fVideo;
end;

procedure TFrame_Video.cbDataTypeChange(Sender: TObject);
begin
  if Assigned(fVideoDataReceiver)
    then fVideoDataReceiver.DataType := cbDataType.ItemIndex;
end;

procedure TFrame_Video.Popup1Change(Sender: TObject; Source: TMenuItem;
  Rebuild: Boolean);
begin
  if Assigned(fVideoDataReceiver)
    then fVideoDataReceiver.Codes := Codigo1.Checked;
end;

procedure TFrame_Video.UpDown3Click(Sender: TObject; Button: TUDBtnType);
begin
  if Assigned(fVideoDataReceiver)
    then fVideoDataReceiver.Rays := UpDown3.Position;
end;

procedure TFrame_Video.VideoDataReceiver_Terminate(Sender: TObject);
var
  Trash : pointer;
begin
  Bulb1.State := false;

  GetMem( Trash, SizeOf( Word ) * Video1.DataSize );
  try
    FillChar( Trash^, SizeOf( Word ) * Video1.DataSize, 0 );
    Video1.SetData1( Trash^ );
    Video1.SetData2( Trash^ );
  finally
    FreeMem( Trash );
  end;
end;

end.

