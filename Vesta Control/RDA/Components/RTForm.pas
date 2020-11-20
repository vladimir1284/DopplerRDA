unit RTForm;

interface

uses
  Messages, Windows, SysUtils, Classes, Graphics, Controls, Forms,
  RTConfiguration, Menus, StdCtrls, ComCtrls, ExtCtrls, RTDisplay, Dialogs,
  AppEvnts, ActiveX;

type
  TRealTimeForm = class(TForm)
    Cliente: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    btnStart: TButton;
    ColorDialog1: TColorDialog;
    Label2: TLabel;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label7: TLabel;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Centrar1: TMenuItem;
    CambiarEscala1: TMenuItem;
    BorrarDatos1: TMenuItem;
    OpenDialog1: TOpenDialog;
    CheckBox4: TCheckBox;
    UpDown1: TUpDown;
    CheckBox5: TCheckBox;
    PantallaCompleta1: TMenuItem;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Edit5: TEdit;
    Label8: TLabel;
    RTDisplay: TRTDisplay;
    Label9: TLabel;
    ColorBox1: TColorBox;
    RingColor: TColorBox;
    ScrollBox1: TScrollBox;
    Acions: TGroupBox;
    Splitter1: TSplitter;
    cbDataType: TComboBox;
    ApplicationEvents1: TApplicationEvents;
    TrackBar1: TTrackBar;
    Label10: TLabel;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox3Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Centrar1Click(Sender: TObject);
    procedure BorrarDatos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CambiarEscala1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure RTDisplayMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure RTDisplayDblClick(Sender: TObject);
    procedure RTDisplayExit(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure CheckBox5Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure PantallaCompleta1Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure btnStartClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbDataTypeSelect(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ColorBox1Select(Sender: TObject);
    procedure RingColorSelect(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
  private
    fData : TConfig;
    fAz, fEl : double;
    fAcquiring : boolean;

    procedure SetAz(const Value: double);
    procedure SetEl(const Value: double);
    procedure StartAcquire;
  public
    procedure LoadData;
    procedure SaveData;
    procedure RefreshData;
    procedure UpdateView;
    procedure RepaintData;
    procedure StopAcquire;

    function  Acquiring_dBT_DBZ : boolean;
    function  Acquiring_dBT_DB  : boolean;
    function  Acquiring_dBZ_DBZ : boolean;
    function  Acquiring_dBZ_DB  : boolean;
    function  Acquiring_Speed   : boolean;
    function  Acquiring_Width   : boolean;
  public
    property Acquiring : boolean read fAcquiring;
    property RTConfig  : TConfig read fData write fData;
    property Azimuth   : double  read fAz   write SetAz;
    property Elevation : double  read fEl   write SetEl;
  end;

var
  RealTimeForm: TRealTimeForm;

implementation

uses
  Plane, CalcFunctions, Rda_TLB, Shell_Client, Measure, Math;

const
  signal_dbz_dbz = 0;
  signal_dbt_dbz = 1;
  signal_v       = 2;
  signal_w       = 3;
  signal_dbz_db  = 4;
  signal_dbt_db  = 5;

{$R *.dfm}

procedure TRealTimeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  StopAcquire;
  SaveData;
  Action := caHide;
end;

procedure TRealTimeForm.CheckBox3Click(Sender: TObject);
begin
  RTDisplay.ShowMap := (Sender as TCheckBox).Checked;
  CheckBox1Click( nil );
end;

procedure TRealTimeForm.Edit2Exit(Sender: TObject);
begin
  try
    Edit4.Text := IntToStr( StrToInt( Edit2.Text ) * StrToInt( Edit3.Text ) );
    if RTDisplay.CellSize <> StrToInt( Edit2.Text )
      then RTDisplay.CellSize := StrToInt( Edit2.Text );
  except
    Edit2.Text := IntToStr( fData.CellSize );
    RTDisplay.CellSize := fData.CellSize;
    Edit4.Text := IntToStr( StrToInt( Edit2.Text ) * StrToInt( Edit3.Text ) );
  end;
end;

procedure TRealTimeForm.Button4Click(Sender: TObject);
begin
  RTDisplay.Center;
end;

procedure TRealTimeForm.Centrar1Click(Sender: TObject);
begin
  RTDisplay.Center;
end;

procedure TRealTimeForm.BorrarDatos1Click(Sender: TObject);
begin
  RTDisplay.ClearBeams;
end;

procedure TRealTimeForm.FormCreate(Sender: TObject);
begin
  OpenDialog1.InitialDir := ExtractFilePath( Application.ExeName ) + 'Palettes';
  Azimuth   := 0;
  Elevation := 0;
end;

procedure TRealTimeForm.Button5Click(Sender: TObject);
begin
  if OpenDialog1.Execute
    then RTDisplay.ScalePath := OpenDialog1.FileName;
end;

procedure TRealTimeForm.CambiarEscala1Click(Sender: TObject);
begin
  if OpenDialog1.Execute
    then
      begin
        RTDisplay.ScalePath := OpenDialog1.FileName;
        case RTDisplay.DataType of
          dtDBT,
          dtDBZ      : fData.DBZScalePath := OpenDialog1.FileName;
          dtPowerZ,
          dtPowerT   : fData.DBScalePath  := OpenDialog1.FileName;
          dtSpeed    : fData.VScalePath   := OpenDialog1.FileName;
          dtSpectrum : fData.WScalePath   := OpenDialog1.FileName;
        end;
      end;
end;

procedure TRealTimeForm.RefreshData;
var
  Path : string;
begin
  Path := ExtractFilePath( ExtractFilePath(Application.ExeName) ) + 'Maps\' +
                           ShellClient.Configuration.Configuration.RadarName[ ShellClient.Configuration.Configuration.Radar_ID ] + '.bmp';
  //while Pos( ' ', Path ) > 0 do
  //  Delete( Path, Pos( ' ', Path ), 1 );
  RTDisplay.MapPath := Path;
  Path := ExtractFilePath( ExtractFilePath(Application.ExeName) ) + 'OutLines\' +
                           ShellClient.Configuration.Configuration.RadarName[ ShellClient.Configuration.Configuration.Radar_ID ] + '.bmp';
  //while Pos( ' ', Path ) > 0 do
  //  Delete( Path, Pos( ' ', Path ), 1 );
  RTDisplay.OutlinePath := Path;
  StatusBar1.Panels[8].Text := 'Haz ' + FloatToStr( RTDisplay.BeamWidth ) + 'º';
end;

procedure TRealTimeForm.FormShow(Sender: TObject);
begin
  RefreshData;
end;

procedure TRealTimeForm.CheckBox4Click(Sender: TObject);
begin
  RTDisplay.ShowRadar := (Sender as TCheckBox).Checked;
end;

procedure TRealTimeForm.RTDisplayMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  BoardLoc, PixelBoard : TPoint;
  BoardX, BoardY, Distance, PDist, PX, PY, Az, El : extended;
  LatLon, Radar : T2DLocation;
  Altitude : Single;
  Index : integer;
  CellHeight : cardinal;
begin
  try
    Altitude := ShellClient.Configuration.Configuration.RadarAltitude[ ShellClient.Configuration.Configuration.Radar_ID ];
    if RTDisplay.PPI_RHI
      then
        begin
          if ((X >= RTDisplay.PaintRect.Left) and (X <= RTDisplay.PaintRect.Right)) and
             ((Y >= RTDisplay.PaintRect.Top) and (Y <= RTDisplay.PaintRect.Bottom))
            then
              begin
                PixelBoard := Point( RTDisplay.SnippetX + (X * RTDisplay.SnippetWidth div RTDisplay.PaintRect.Right),
                                     RTDisplay.SnippetY + (Y * RTDisplay.SnippetHeight div RTDisplay.PaintRect.Bottom) );
                BoardLoc := Point( PixelBoard.X - RTDisplay.BoardRange, RTDisplay.BoardRange - PixelBoard.Y );
                BoardX := BoardLoc.X * RTDisplay.BoardScale / 1000;
                BoardY := BoardLoc.Y * RTDisplay.BoardScale / 1000;
                StatusBar1.Panels[0].Style := psText;
                StatusBar1.Panels[0].Text := FloatToStr( BoardX ) + ' Km, ' + FloatToStr( BoardY ) + ' Km';

                Distance := Sqrt( Sqr(BoardLoc.X * RTDisplay.BoardScale / 1000) + Sqr(BoardLoc.Y * RTDisplay.BoardScale / 1000) );
                if BoardY = 0
                  then
                    if BoardX = 0
                      then Az := 0
                      else
                        if BoardX > 0
                          then Az := 90
                          else Az := 270
                  else Az := 180/Pi * arctan(BoardX/BoardY);
                if BoardY < 0
                  then Az := Az + 180;
                if Az < 0
                  then Az := Az + 360;

                StatusBar1.Panels[1].Text :=  FormatFloat( '0.00', Distance ) + ' Km ' +
                                              FormatFloat( '0.00', Az ) + 'º';

                try
                  if (fEl = 90) or (fEl = 270)
                    then CellHeight := High( cardinal )
                    else CellHeight := Round(Distance*1000 * Tan( DegToRad( fEl ) )) + Round(Altitude);
                except
                  CellHeight := Round( Altitude );
                end;
                StatusBar1.Panels[2].Text := 'h:' + FormatFloat( '0.00', CellHeight/1000 ) + ' Km';

                with ShellClient.Configuration.Configuration do
                begin
                  Radar.Latitude := RadarLatitude[ Radar_ID ];
                  Radar.Longitude := RadarLongitude[ Radar_ID ];
                end;
                LatLon := Reckon( Radar.Latitude, Radar.Longitude, Distance, Az );
                StatusBar1.Panels[3].Style := psText;
                StatusBar1.Panels[3].Text := Format('%dº %.2d'' N, %dº %.2d'' W',
                                                    [trunc(LatLon.Latitude), trunc(60 * frac(LatLon.Latitude)),
                                                    trunc(LatLon.Longitude),  trunc(60 * frac(LatLon.Longitude))]);

                if RTDisplay.BoardImage.Canvas.Pixels[ PixelBoard.X, PixelBoard.Y ] <> RTDisplay.NoDataColor
                  then
                    begin
                      Index := RTDisplay.ColorScale.ColorValue[ RTDisplay.BoardImage.Canvas.Pixels[ PixelBoard.X, PixelBoard.Y ] ];
                      StatusBar1.Panels[4].Text := FormatFloat( '0.0', CodeMeasure( RTDisplay.ColorScale.Value[ Index ], RTDisplay.Measure) ) + ' ' + MeasureName(RTDisplay.Measure);
                      StatusBar1.Panels[5].Text := RTDisplay.ColorScale.Caption[ Index ];
                    end
                  else
                    begin
                      StatusBar1.Panels[4].Text := '< Sensibilidad';
                      StatusBar1.Panels[5].Text := '';
                    end;
              end
            else
              begin
                StatusBar1.Panels[0].Text := '';
                StatusBar1.Panels[1].Text := '';
                StatusBar1.Panels[2].Text := '';
                StatusBar1.Panels[3].Text := '';
                StatusBar1.Panels[4].Text := '';
                StatusBar1.Panels[5].Text := '';
              end;
        end
      else
        begin
          if ((X >= RTDisplay.PaintRect.Left) and (X <= RTDisplay.PaintRect.Right)) and
             ((Y >= RTDisplay.PaintRect.Top) and (Y <= RTDisplay.PaintRect.Bottom))
            then
              begin
                PixelBoard := Point( RTDisplay.SnippetX + (X * RTDisplay.SnippetWidth div RTDisplay.PaintRect.Right),
                                     RTDisplay.SnippetY + (Y * RTDisplay.SnippetHeight div RTDisplay.PaintRect.Bottom) );
                BoardLoc := Point( PixelBoard.X - RTDisplay.BoardRange, RTDisplay.BoardRange - PixelBoard.Y );
                BoardX := BoardLoc.X * RTDisplay.BoardScale / 1000;
                BoardY := BoardLoc.Y * RTDisplay.BoardScale / 1000;

                Distance := Sqrt( Sqr(BoardLoc.X * RTDisplay.BoardScale / 1000) + Sqr(BoardLoc.Y * RTDisplay.BoardScale / 1000) );
                if BoardY = 0
                  then
                    if BoardX = 0
                      then El := 0
                      else
                        if BoardX > 0
                          then El := 90
                          else El := 270
                  else El := 180/Pi * arctan(BoardX/BoardY);
                if BoardY < 0
                  then El := El + 180;
                El := 90 - El;
                if El < 0
                  then El := El + 360;

                PDist := Distance * Cos( DegToRad( El ) );
                PX := PDist * Sin( DegToRad( fAz ) );
                PY := PDist * Cos( DegToRad( fAz ) );
                StatusBar1.Panels[0].Style := psOwnerDraw;
                StatusBar1.Panels[0].Text := FormatFloat( '0.00', PX ) + ' Km, ' + FormatFloat( '0.00', PY ) + ' Km';
                StatusBar1.Panels[1].Text := FormatFloat( '0.00', Distance ) + ' Km ' + FormatFloat( '0.00', El ) + 'º';

                CellHeight := Round(Distance * 1000 * Sin( DegToRad( El ) )) + Round(Altitude);
                StatusBar1.Panels[2].Text := 'h:' + FormatFloat( '0.00', CellHeight ) + ' Km';

                with ShellClient.Configuration.Configuration do
                begin
                  Radar.Latitude := RadarLatitude[ Radar_ID ];
                  Radar.Longitude := RadarLongitude[ Radar_ID ];
                end;
                LatLon := Reckon( Radar.Latitude, Radar.Longitude, PDist, fAz );
                StatusBar1.Panels[3].Style := psOwnerDraw;
                StatusBar1.Panels[3].Text := Format('%dº %.2d'' N, %dº %.2d'' W',
                                                    [trunc(LatLon.Latitude), trunc(60 * frac(LatLon.Latitude)),
                                                    trunc(LatLon.Longitude),  trunc(60 * frac(LatLon.Longitude))]);

                Index := RTDisplay.ColorScale.ColorValue[ RTDisplay.BoardImage.Canvas.Pixels[ PixelBoard.X, PixelBoard.Y ] ];
                StatusBar1.Panels[4].Text := FormatFloat( '0.0', RTDisplay.ColorScale.Value[ Index ] ) + ' dBZ';
                StatusBar1.Panels[5].Text := RTDisplay.ColorScale.Caption[ Index ];
              end
            else
              begin
                StatusBar1.Panels[0].Text := '';
                StatusBar1.Panels[1].Text := '';
                StatusBar1.Panels[2].Text := '';
                StatusBar1.Panels[3].Text := '';
                StatusBar1.Panels[4].Text := '';
                StatusBar1.Panels[5].Text := '';
              end;
        end;
  except
    StatusBar1.Panels[0].Text := '';
    StatusBar1.Panels[1].Text := '';
    StatusBar1.Panels[2].Text := '';
    StatusBar1.Panels[3].Text := '';
    StatusBar1.Panels[4].Text := '';
    StatusBar1.Panels[5].Text := '';
  end
end;

procedure TRealTimeForm.RTDisplayDblClick(Sender: TObject);
begin
  RTDisplay.Center;
end;

procedure TRealTimeForm.RTDisplayExit(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[3].Text := '';
  StatusBar1.Panels[4].Text := '';
end;

procedure TRealTimeForm.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  try
    RTDisplay.Zoom := StrToInt( Edit1.Text );
  except
    Edit1.Text := '100';
  end;
end;

procedure TRealTimeForm.CheckBox5Click(Sender: TObject);
begin
  RTDisplay.PPI_RHI := CheckBox5.Checked;
  RTDisplay.ShowMap := CheckBox5.Checked and CheckBox3.Checked;
  RTDisplay.ShowOutline := CheckBox5.Checked and CheckBox6.Checked;
  CheckBox1Click( nil );
end;

procedure TRealTimeForm.UpdateView;
begin
  //Captions
  if fAcquiring
    then btnStart.Caption := 'Detener RT'
    else btnStart.Caption := 'Iniciar RT';
end;

procedure TRealTimeForm.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
    then Edit1Exit( Sender );
end;

procedure TRealTimeForm.Edit1Exit(Sender: TObject);
begin
  try
    UpDown1.Position := StrToInt( Edit1.Text );
    UpDown1Click( nil, btNext );
  except
    UpDown1.Position := fData.Zoom;
  end;
end;

procedure TRealTimeForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
   then Edit2Exit( Sender );
end;

procedure TRealTimeForm.Edit3Exit(Sender: TObject);
begin
  try
    Edit4.Text := IntToStr( StrToInt( Edit2.Text ) * StrToInt( Edit3.Text ) );
    if RTDisplay.CellCount <> StrToInt( Edit3.Text )
      then RTDisplay.CellCount := StrToInt( Edit3.Text );
  except
    Edit3.Text := IntToStr( fData.CellCount );
    RTDisplay.CellCount := fData.CellCount;
    Edit4.Text := IntToStr( StrToInt( Edit2.Text ) * StrToInt( Edit3.Text ) );
  end;
end;

procedure TRealTimeForm.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
   then Edit3Exit( Sender );
end;

procedure TRealTimeForm.PantallaCompleta1Click(Sender: TObject);
begin
  ScrollBox1.Visible := not PantallaCompleta1.Checked;
  Splitter1.Visible := not PantallaCompleta1.Checked;
end;

procedure TRealTimeForm.CheckBox6Click(Sender: TObject);
begin
  RTDisplay.ShowOutline := (Sender as TCheckBox).Checked;
end;

procedure TRealTimeForm.CheckBox7Click(Sender: TObject);
begin
  RTDisplay.ShowRings := CheckBox7.Checked;
end;

procedure TRealTimeForm.Edit5Exit(Sender: TObject);
begin
  try
    if RTDisplay.RingDistance <> StrToInt( Edit5.Text )
      then RTDisplay.RingDistance := StrToInt( Edit5.Text );
  except
    Edit2.Text := IntToStr( fData.RingsDistance );
    RTDisplay.RingDistance := fData.RingsDistance;
  end;
end;

procedure TRealTimeForm.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
   then Edit5Exit( Sender );
end;

procedure TRealTimeForm.RepaintData;
begin
  RTDisplay.RefreshGlance;
end;

procedure TRealTimeForm.btnStartClick(Sender: TObject);
begin
  if fAcquiring
    then StopAcquire
    else StartAcquire;

  UpdateView;
end;

procedure TRealTimeForm.LoadData;
begin
  //Client
  Edit2.Text := IntToStr( fData.CellSize );
  Edit3.Text := IntToStr( fData.CellCount );
  fData.Range := fData.CellCount * fData.CellSize;
  Edit4.Text := IntToStr( fData.Range );
  Edit5.Text := IntToStr( fData.RingsDistance );
  UpDown1.Position := fData.Zoom;
  ColorBox1.Selected := fData.ColorMap;
  RingColor.Selected := fData.RingColor;
  CheckBox3.Checked := fData.ShowMap;
  CheckBox6.Checked := fData.ShowOutlines;
  CheckBox4.Checked := fData.ShowRadar;
  CheckBox7.Checked := fData.ShowRings;
  CheckBox5.Checked := fData.PPI;
  case fData.DataFormat of
    dtDBZ      : cbDataType.ItemIndex := 0;
    dtDBT      : cbDataType.ItemIndex := 1;
    dtSpeed    : cbDataType.ItemIndex := 2;
    dtSpectrum : cbDataType.ItemIndex := 3;
    dtPowerZ   : cbDataType.ItemIndex := 4;
    dtPowerT   : cbDataType.ItemIndex := 5;
  end;

  with RTDisplay do
  begin
    Zoom         := fData.Zoom;
    CellSize     := fData.CellSize;
    CellCount    := fData.CellCount;
    MapColor     := fData.ColorMap;
    RingDistance := fData.RingsDistance;
    RingsColor   := fData.RingColor;
    ShowMap      := fData.ShowMap;
    ShowOutline  := fData.ShowOutlines;
    ShowRadar    := fData.ShowRadar;
    ShowRings    := fData.ShowRings;
    PPI_RHI      := fData.PPI;
    DataType     := fData.DataFormat;
    case Measure of
      unDBZ: ScalePath := fData.DBZScalePath;
      unDB : ScalePath := fData.DBScalePath;
      unMS : ScalePath := fData.VScalePath;
    end;
  end;
end;

procedure TRealTimeForm.FormDestroy(Sender: TObject);
begin
  if Assigned( fData )
    then fData.Free;
end;

procedure TRealTimeForm.SaveData;
begin
  with fData do
  begin
    CellSize      := StrToInt( Edit2.Text );
    CellCount     := StrToInt( Edit3.Text );
    Range         := CellCount * CellSize;
    RingsDistance := StrToInt( Edit5.Text );
    Zoom          := UpDown1.Position;
    ColorMap      := ColorBox1.Selected;
    RingColor     := self.RingColor.Selected;
    ShowRings     := CheckBox7.Checked;
    ShowMap       := CheckBox3.Checked;
    ShowRadar     := CheckBox4.Checked;
    ShowOutlines  := CheckBox6.Checked;
    PPI           := CheckBox5.Checked;
    Measure       := RTDisplay.Measure;
    DBZScalePath  := DBZScalePath;
    VScalePath    := VScalePath;
    DataFormat    := RTDisplay.DataType;
  end;
end;

procedure TRealTimeForm.cbDataTypeSelect(Sender: TObject);
begin
  case cbDataType.ItemIndex of
    0: begin
         RTDisplay.DataType  := dtDBZ;
         RTDisplay.ScalePath := fData.DBZScalePath;
       end;
    1: begin
         RTDisplay.DataType  := dtDBT;
         RTDisplay.ScalePath := fData.DBZScalePath;
       end;
    2: begin
         RTDisplay.DataType  := dtSpeed;
         RTDisplay.ScalePath := fData.VScalePath;
       end;
    3: begin
         RTDisplay.DataType  := dtSpectrum;
         RTDisplay.ScalePath := fData.WScalePath;
       end;
    4: begin
         RTDisplay.DataType  := dtPowerZ;
         RTDisplay.ScalePath := fData.DBScalePath;
       end;
    5: begin
         RTDisplay.DataType  := dtPowerT;
         RTDisplay.ScalePath := fData.DBScalePath;
       end;
  else
    begin
      RTDisplay.DataType  := dtDBZ;
      RTDisplay.ScalePath := fData.DBZScalePath;
    end;
  end;

  if fAcquiring
    then StartAcquire;
end;

procedure TRealTimeForm.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
begin
  if (Msg.message = WM_KEYDOWN) and ((Msg.hwnd = RTDisplay.Handle) or (Msg.hwnd = Handle))
    then
      with RTDisplay do
        case Msg.wParam of
          VK_END: begin
                    HScroll.Position := HScroll.Position - HScroll.SmallChange;
                    VScroll.Position := VScroll.Position + VScroll.SmallChange;
                  end;
          VK_HOME: begin
                     HScroll.Position := HScroll.Position - HScroll.SmallChange;
                     VScroll.Position := VScroll.Position - VScroll.SmallChange;
                   end;
          VK_PRIOR: begin
                      HScroll.Position := HScroll.Position + HScroll.SmallChange;
                      VScroll.Position := VScroll.Position - VScroll.SmallChange;
                    end;
          VK_NEXT: begin
                    HScroll.Position := HScroll.Position + HScroll.SmallChange;
                    VScroll.Position := VScroll.Position + VScroll.SmallChange;
                   end;
          VK_CLEAR : Center;
          VK_LEFT: HScroll.Position := HScroll.Position - HScroll.SmallChange;
          VK_RIGHT: HScroll.Position := HScroll.Position + HScroll.SmallChange;
          VK_UP: VScroll.Position := VScroll.Position - VScroll.SmallChange;
          VK_DOWN: VScroll.Position := VScroll.Position + VScroll.SmallChange;
        end;
end;

procedure TRealTimeForm.FormActivate(Sender: TObject);
begin
  LoadData;
  UpdateView;
end;

procedure TRealTimeForm.TrackBar1Change(Sender: TObject);
begin
  AlphaBlendValue := TrackBar1.Position;
end;

procedure TRealTimeForm.CheckBox1Click(Sender: TObject);
begin
  if CheckBox3.Checked
    then TransparentColorValue := $604020
    else TransparentColorValue := RTDisplay.MapColor;
  if not CheckBox5.Checked
    then TransparentColorValue := RTDisplay.MapColor;
  TransparentColor := CheckBox1.Checked;
end;

procedure TRealTimeForm.ColorBox1Select(Sender: TObject);
begin
  RTDisplay.MapColor := ColorBox1.Selected;
  CheckBox1Click( nil );
end;

procedure TRealTimeForm.RingColorSelect(Sender: TObject);
begin
  RTDisplay.RingsColor := RingColor.Selected;
end;

procedure TRealTimeForm.SetAz(const Value: double);
begin
  fAz := Value;
  StatusBar1.Panels[6].Text := 'Az: ' + FormatFloat( '0.0', fAz );
end;

procedure TRealTimeForm.SetEl(const Value: double);
begin
  fEl := Value;
  StatusBar1.Panels[7].Text := 'El: ' + FormatFloat( '0.0', fEl );
end;

procedure TRealTimeForm.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
begin
  StatusBar1.Font.Color := clRed;
  StatusBar1.Canvas.TextRect( Rect, Rect.Left+((Rect.Right-Rect.Left-StatusBar1.Canvas.TextWidth( Panel.Text )) div 2), Rect.Top, Panel.Text );
end;

procedure TRealTimeForm.StopAcquire;
begin
  fAcquiring := false;
end;

procedure TRealTimeForm.StartAcquire;
begin
  RTDisplay.ClearBeams;
  ShellClient.Video.Control.StartRT;
  fAcquiring := true;
end;

function TRealTimeForm.Acquiring_dBT_DB: boolean;
begin
  result := Acquiring and (cbDataType.ItemIndex = signal_dbt_db);
end;

function TRealTimeForm.Acquiring_dBT_DBZ: boolean;
begin

end;

function TRealTimeForm.Acquiring_dBZ_DB: boolean;
begin
  result := Acquiring and (cbDataType.ItemIndex = signal_dbz_db);
end;

function TRealTimeForm.Acquiring_dBZ_DBZ: boolean;
begin
  result := Acquiring and (cbDataType.ItemIndex = signal_dbz_dbz);
end;

function TRealTimeForm.Acquiring_Speed: boolean;
begin
  result := Acquiring and (cbDataType.ItemIndex = signal_v);
end;

function TRealTimeForm.Acquiring_Width: boolean;
begin
  result := Acquiring and (cbDataType.ItemIndex = signal_w);
end;

end.
