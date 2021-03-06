unit RealTimeForm;

interface

uses
  Messages, Windows, SysUtils, Classes, Graphics, Controls, Forms,
  RTConfiguration, Menus, StdCtrls, ComCtrls, ExtCtrls, RTDisplay, Dialogs,
  AppEvnts;

type
  TRT_Form = class(TForm)
    Servidor: TGroupBox;
    Cliente: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    RTCh1: TCheckBox;
    RTCh2: TCheckBox;
    RTCellCount: TLabeledEdit;
    Button3: TButton;
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
    Button1: TButton;
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
    ComboBox1: TComboBox;
    ApplicationEvents1: TApplicationEvents;
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
    procedure Button1Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure ColorBox1Change(Sender: TObject);
    procedure RingColorChange(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RTCh1Click(Sender: TObject);
    procedure RTCh2Click(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
  private
    fData : TConfig;
  public
    procedure   LoadData;
    procedure   SaveData;
    procedure   RefreshData;
    procedure   UpdateView;
    procedure   RepaintData;
  public
    property RTConfig : TConfig read fData write fData;
  end;

var
  RT_Form : TRT_Form;

implementation

uses
  Plane, CalcFunctions, Rda_TLB, Shell_RTClient, Measure;

{$R *.dfm}

procedure TRT_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TRT_Form.CheckBox3Click(Sender: TObject);
begin
  RTDisplay.ShowMap := (Sender as TCheckBox).Checked;
end;

procedure TRT_Form.Edit2Exit(Sender: TObject);
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

procedure TRT_Form.Button4Click(Sender: TObject);
begin
  RTDisplay.Center;
end;

procedure TRT_Form.Centrar1Click(Sender: TObject);
begin
  RTDisplay.Center;
end;

procedure TRT_Form.BorrarDatos1Click(Sender: TObject);
begin
  RTDisplay.ClearBeams;
end;

procedure TRT_Form.FormCreate(Sender: TObject);
begin
  Width := 700;
  Height := 500;
  OpenDialog1.InitialDir := ExtractFilePath( ParamStr( 0 ) ) + 'Palettes';
end;

procedure TRT_Form.Button5Click(Sender: TObject);
begin
  if OpenDialog1.Execute
    then RTDisplay.ScalePath := OpenDialog1.FileName;
end;

procedure TRT_Form.CambiarEscala1Click(Sender: TObject);
begin
  if OpenDialog1.Execute
    then
      begin
        RTDisplay.ScalePath := OpenDialog1.FileName;
        if RTDisplay.DB_DBZ
          then fData.DBScalePath  := OpenDialog1.FileName
          else fData.DBZScalePath := OpenDialog1.FileName;
      end;
end;

procedure TRT_Form.RefreshData;
var
  Path : string;
begin
  Path := ExtractFilePath( ParamStr( 0 ) ) + 'Maps\' +
                           ShellRTClient.GeneralConfiguration.RadarName[ ShellRTClient.GeneralConfiguration.Radar_ID ] + '.bmp';
  while Pos( ' ', Path ) > 0 do
    Delete( Path, Pos( ' ', Path ), 1 );
  RTDisplay.MapPath := Path;
  Path := ExtractFilePath( ParamStr( 0 ) ) + 'OutLines\' +
                           ShellRTClient.GeneralConfiguration.RadarName[ ShellRTClient.GeneralConfiguration.Radar_ID ] + '.bmp';
  while Pos( ' ', Path ) > 0 do
    Delete( Path, Pos( ' ', Path ), 1 );
  RTDisplay.OutlinePath := Path;
  StatusBar1.Panels[7].Text := 'Haz ' + FloatToStr( RTDisplay.BeamWidth ) + '�';
end;

procedure TRT_Form.FormShow(Sender: TObject);
begin
  RefreshData;
end;

procedure TRT_Form.CheckBox4Click(Sender: TObject);
begin
  RTDisplay.ShowRadar := (Sender as TCheckBox).Checked;
end;

procedure TRT_Form.RTDisplayMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  BoardLoc, PixelBoard : TPoint;
  BoardX, BoardY, Distance, Az : extended;
  LatLon, Radar : T2DLocation;
  Index : integer;
begin
  try
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
                                              FormatFloat( '0.00', Az ) + '�';
                with ShellRTClient.GeneralConfiguration do
                begin
                  Radar.Latitude := RadarLatitude[ Radar_ID ];
                  Radar.Longitude := RadarLongitude[ Radar_ID ];
                end;
                LatLon := Reckon( Radar.Latitude, Radar.Longitude, Distance, Az );
                StatusBar1.Panels[2].Text := Format('%d� %.2d'' N, %d� %.2d'' W',
                                                    [trunc(LatLon.Latitude), trunc(60 * frac(LatLon.Latitude)),
                                                    trunc(LatLon.Longitude),  trunc(60 * frac(LatLon.Longitude))]);

                Index := RTDisplay.ColorScale.ColorValue[ RTDisplay.BoardImage.Canvas.Pixels[ PixelBoard.X, PixelBoard.Y ] ];
                if RTDisplay.BoardImage.Canvas.Pixels[ PixelBoard.X, PixelBoard.Y ] <> RTDisplay.NoDataColor
                  then
                    begin
                      Index := RTDisplay.ColorScale.ColorValue[ RTDisplay.BoardImage.Canvas.Pixels[ PixelBoard.X, PixelBoard.Y ] ];
                      if RTDisplay.DB_DBZ
                        then StatusBar1.Panels[3].Text := FormatFloat( '0.0', CodeMeasure( RTDisplay.ColorScale.Value[ Index ], unDB ) ) + ' dB'
                        else StatusBar1.Panels[3].Text := FormatFloat( '0.0', CodeMeasure( RTDisplay.ColorScale.Value[ Index ], unDBZ ) ) + ' dBZ';
                      StatusBar1.Panels[4].Text := RTDisplay.ColorScale.Caption[ Index ];
                    end
                  else
                    begin
                      StatusBar1.Panels[3].Text := '< Sensibilidad';
                      StatusBar1.Panels[4].Text := '';
                    end;
              end
            else
              begin
                StatusBar1.Panels[0].Text := '';
                StatusBar1.Panels[1].Text := '';
                StatusBar1.Panels[2].Text := '';
                StatusBar1.Panels[3].Text := '';
                StatusBar1.Panels[4].Text := '';
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
                StatusBar1.Panels[0].Text := '';

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
                Az := 90 - Az;
                if Az < 0
                  then Az := Az + 360;

                StatusBar1.Panels[1].Text :=  FormatFloat( '0.00', Distance ) + ' Km ' +
                                              FormatFloat( '0.00', Az ) + '�';
                StatusBar1.Panels[2].Text := '';

                Index := RTDisplay.ColorScale.ColorValue[ RTDisplay.BoardImage.Canvas.Pixels[ PixelBoard.X, PixelBoard.Y ] ];
                StatusBar1.Panels[3].Text := FormatFloat( '0.0', RTDisplay.ColorScale.Value[ Index ] ) + ' dBZ';
                StatusBar1.Panels[4].Text := RTDisplay.ColorScale.Caption[ Index ];
              end
            else
              begin
                StatusBar1.Panels[0].Text := '';
                StatusBar1.Panels[1].Text := '';
                StatusBar1.Panels[2].Text := '';
                StatusBar1.Panels[3].Text := '';
                StatusBar1.Panels[4].Text := '';
              end;
        end;
  except
    StatusBar1.Panels[0].Text := '';
    StatusBar1.Panels[1].Text := '';
    StatusBar1.Panels[2].Text := '';
    StatusBar1.Panels[3].Text := '';
    StatusBar1.Panels[4].Text := '';
  end
end;

procedure TRT_Form.RTDisplayDblClick(Sender: TObject);
begin
  RTDisplay.Center;
end;

procedure TRT_Form.RTDisplayExit(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[2].Text := '';
  StatusBar1.Panels[3].Text := '';
  StatusBar1.Panels[4].Text := '';
end;

procedure TRT_Form.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  try
    RTDisplay.Zoom := StrToInt( Edit1.Text );
  except
    Edit1.Text := '100';
  end;
end;

procedure TRT_Form.CheckBox5Click(Sender: TObject);
begin
  RTDisplay.PPI_RHI := CheckBox5.Checked;
  RTDisplay.ShowMap := CheckBox5.Checked and CheckBox3.Checked;
  RTDisplay.ShowOutline := CheckBox5.Checked and CheckBox6.Checked;
end;

procedure TRT_Form.UpdateView;
var
  InControl, RTEnabled : boolean;
begin
  InControl := ShellRTClient.Control.Login.InControl;
  RTEnabled := ShellRTClient.Video.RTEnabled;

  if RTEnabled and ( not ShellRTClient.Acquiring )
    then RTCellCount.Text := IntToStr( ShellRTClient.Video.RTCellCount );

  Servidor.Enabled := InControl;
  Button3.Enabled := InControl;
  Button1.Enabled := RTEnabled;

  //Captions
  if RTEnabled
    then Button3.Caption := 'Detener RT'
    else Button3.Caption := 'Iniciar RT';
  if ShellRTClient.Acquiring
    then Button1.Caption := 'Desconectarse de RT'
    else Button1.Caption := 'Conectarse a RT';
end;

procedure TRT_Form.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
    then Edit1Exit( Sender );
end;

procedure TRT_Form.Edit1Exit(Sender: TObject);
begin
  try
    UpDown1.Position := StrToInt( Edit1.Text );
    UpDown1Click( nil, btNext );
  except
    UpDown1.Position := fData.Zoom;
  end;
end;

procedure TRT_Form.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
   then Edit2Exit( Sender );
end;

procedure TRT_Form.Edit3Exit(Sender: TObject);
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

procedure TRT_Form.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
   then Edit3Exit( Sender );
end;

procedure TRT_Form.PantallaCompleta1Click(Sender: TObject);
begin
  ScrollBox1.Visible := not PantallaCompleta1.Checked;
  Splitter1.Visible := not PantallaCompleta1.Checked;
end;

procedure TRT_Form.Button1Click(Sender: TObject);
begin
  ShellRTClient.ConnectDisconnectRT;
end;

procedure TRT_Form.CheckBox6Click(Sender: TObject);
begin
  RTDisplay.ShowOutline := (Sender as TCheckBox).Checked;
end;

procedure TRT_Form.CheckBox7Click(Sender: TObject);
begin
  RTDisplay.ShowRings := CheckBox7.Checked;
end;

procedure TRT_Form.Edit5Exit(Sender: TObject);
begin
  try
    if RTDisplay.RingDistance <> StrToInt( Edit5.Text )
      then RTDisplay.RingDistance := StrToInt( Edit5.Text );
  except
    Edit2.Text := IntToStr( fData.RingsDistance );
    RTDisplay.RingDistance := fData.RingsDistance;
  end;
end;

procedure TRT_Form.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
   then Edit5Exit( Sender );
end;

procedure TRT_Form.ColorBox1Change(Sender: TObject);
begin
  RTDisplay.MapColor := ColorBox1.Selected;
end;

procedure TRT_Form.RingColorChange(Sender: TObject);
begin
  RTDisplay.RingsColor := RingColor.Selected;
end;

procedure TRT_Form.RepaintData;
begin
  RTDisplay.RefreshGlance;
end;

procedure TRT_Form.Button3Click(Sender: TObject);
begin
  try
    ShellRTClient.StartStopAcquire( StrToInt( RTCellCount.Text ) );
    UpdateView;
  except
  end;
end;

procedure TRT_Form.LoadData;
begin
  //Server
  RTCellCount.Text := IntToStr( fData.ServerCellCount );
  ShellRTClient.ViewCh1 := fData.Channel1;
  ShellRTClient.ViewCh2 := fData.Channel2;
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
  ComboBox1.ItemIndex := Ord( fData.DB );

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
    DB_DBZ       := fData.DB;
    if DB_DBZ
      then ScalePath := fData.DBScalePath
      else ScalePath := fData.DBZScalePath;
  end;
end;

procedure TRT_Form.FormDestroy(Sender: TObject);
begin
  if Assigned( fData )
    then
      begin
        SaveData;
        fData.Free;
      end;
end;

procedure TRT_Form.SaveData;
begin
  with fData do
  begin
    ServerCellCount := StrToInt( RTCellCount.Text );
    CellSize        := StrToInt( Edit2.Text );
    CellCount       := StrToInt( Edit3.Text );
    Range           := CellCount * CellSize;
    RingsDistance   := StrToInt( Edit5.Text );
    Zoom            := UpDown1.Position;
    ColorMap        := ColorBox1.Selected;
    RingColor       := self.RingColor.Selected;
    ShowRings       := CheckBox7.Checked;
    ShowMap         := CheckBox3.Checked;
    ShowRadar       := CheckBox4.Checked;
    ShowOutlines    := CheckBox6.Checked;
    PPI             := CheckBox5.Checked;
    Channel1        := ShellRTClient.ViewCh1;
    Channel2        := ShellRTClient.ViewCh2;
    DB              := RTDisplay.DB_DBZ;
    DBScalePath     := DBScalePath;
    DBZScalePath    := DBZScalePath;
  end;
end;

procedure TRT_Form.RTCh1Click(Sender: TObject);
begin
  ShellRTClient.ViewCh1 := RTCh1.Checked;
end;

procedure TRT_Form.RTCh2Click(Sender: TObject);
begin
  ShellRTClient.ViewCh2 := RTCh2.Checked;
end;

procedure TRT_Form.ComboBox1Select(Sender: TObject);
begin
  RTDisplay.DB_DBZ := ComboBox1.ItemIndex = 1;
  if RTDisplay.DB_DBZ
    then RTDisplay.ScalePath := fData.DBScalePath
    else RTDisplay.ScalePath := fData.DBZScalePath;
end;

procedure TRT_Form.ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
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

end.
