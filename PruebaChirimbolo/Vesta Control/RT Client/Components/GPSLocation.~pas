unit GPSLocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GPS_Parser, RTDisplay, ComCtrls;

const  
  MaxLaterTime = 120;
  PlaneRadius = 3;

type
  TGPS_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DateInput: TStaticText;
    TimeInput: TStaticText;
    VelocityInput: TStaticText;
    CurseInput: TStaticText;
    LatitudeInput: TStaticText;
    LongitudeInput: TStaticText;
    GroupBox1: TGroupBox;
    LocatePlane: TCheckBox;
    Timer1: TTimer;
    DataSource: TLabeledEdit;
    Button1: TButton;
    RefreshInfo: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ColorBox1: TColorBox;
    Label7: TLabel;
    LabeledEdit1: TLabeledEdit;
    UpDown1: TUpDown;
    LabeledEdit2: TLabeledEdit;
    UpDown2: TUpDown;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RefreshInfoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LocatePlaneClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ColorBox1Select(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    fGPS         : TGPS_Parser;
    FileSource   : TFileName;
    fPlaneColor  : TColor;
    fRefreshTime : integer;
    fPlaneSize   : integer;
    procedure GetPlaneColor(const Value: TColor);
    procedure GetPlaneSize(const Value: integer);
    procedure GetRefreshTime(const Value: integer);
    procedure SetPlaneColor(const Value: TColor);
    procedure SetPlaneSize(const Value: integer);
    procedure SetRefreshTime(const Value: integer);
  private
    procedure WithoutConnection;
    procedure UpdateView;
    procedure LoadConfig;
    procedure SaveConfig;
    function  SelectSource : string;
    procedure RepaintPlaneLocation;
  public
    procedure LocatePlaneIntoGrid( Grid : TRTDisplay );
    procedure PaintPlaneOnGrid( Sender : TObject );
  public
    property GPS         : TGPS_Parser read fGPS;
    property RefreshTime : integer     read fRefreshTime write SetRefreshTime;
    property PlaneColor  : TColor      read fPlaneColor  write SetPlaneColor;
    property PlaneSize   : integer     read fPlaneSize   write SetPlaneSize;
  end;

var
  GPS_Form: TGPS_Form;

implementation

uses
  RTForm, Shell_RTClient, Registry, DirList, DateUtils, CalcFunctions, Math;

{$R *.dfm}

const
//Values
  RefreshValue  = 'RefreshData';
  LocateValue   = 'LocatePlane';
  DataPathValue = 'DataPath';
  TimeValue     = 'RefreshTime';
  ColorValue    = 'ColorPlane';
  SizeValue     = 'SizePlane';

//Defaults
  DefaultRefresh  = false;
  DefaultLocate   = false;
  DefaultDataPath = '';
  DefaultTime     = 15;
  DefaultColor    = clYellow;
  DefaultSize     = 2;

  GPS_FileHeader = 'RES';

procedure TGPS_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned( ShellRTClient.RT_Ch1 )
    then ShellRTClient.RT_Ch1.RTDisplay.OnPaint := nil;
  if Assigned( ShellRTClient.RT_Ch2 )
    then ShellRTClient.RT_Ch2.RTDisplay.OnPaint := nil;
  Action := caFree;
  ShellRTClient.GPS.Checked := false;
  GPS_Form := nil;
end;

procedure TGPS_Form.LoadConfig;
begin
  with TRegistry.Create do
  try
    if OpenKey(RTConfigKey, false)
      then
        begin
          if ValueExists( DataPathValue )
            then DataSource.Text := ReadString( DataPathValue )
            else DataSource.Text := DefaultDataPath;
          if ValueExists( RefreshValue )
            then RefreshInfo.Checked := ReadBool( RefreshValue )
            else RefreshInfo.Checked := DefaultRefresh;
          if ValueExists( LocateValue )
            then LocatePlane.Checked := ReadBool( LocateValue )
            else LocatePlane.Checked := DefaultLocate;
          if ValueExists( TimeValue )
            then RefreshTime := ReadInteger( TimeValue )
            else RefreshTime := DefaultTime;
          if ValueExists( SizeValue )
            then PlaneSize := ReadInteger( SizeValue )
            else PlaneSize := DefaultSize;
          if ValueExists( ColorValue )
            then PlaneColor := ReadInteger( ColorValue )
            else PlaneColor := DefaultColor;
        end
      else
        begin
          DataSource.Text     := DefaultDataPath;
          RefreshInfo.Checked := DefaultRefresh;
          LocatePlane.Checked := DefaultLocate;
          PlaneColor          := DefaultColor;
          PlaneSize           := DefaultSize;
          RefreshTime         := DefaultTime;
        end;
    ColorBox1.Selected := fPlaneColor;
    UpDown1.Position   := fRefreshTime;
    UpDown2.Position   := fPlaneSize;
  finally
    free;
  end;
end;

procedure TGPS_Form.SaveConfig;
begin
  with TRegistry.Create do
    try
      if OpenKey( RTConfigKey, true )
        then
          begin
            WriteBool   ( RefreshValue, RefreshInfo.Checked );
            WriteBool   ( LocateValue, LocatePlane.Checked );
            WriteString ( DataPathValue, DataSource.Text );
            WriteInteger( TimeValue, fRefreshTime  );
            WriteInteger( SizeValue, fPlaneSize  );
            WriteInteger( ColorValue, fPlaneColor  );
          end;
    finally
      Free;
    end;
end;

procedure TGPS_Form.UpdateView;
begin
  FileSource := SelectSource;
  if FileSource = ''
    then WithoutConnection
    else
      try
        fGPS.Fill( DataSource.Text + '\' + FileSource, false );
        Caption := 'Fuente: ' + FileSource;
        DateInput.Caption      := DateToStr ( GPS.Date );
        TimeInput.Caption      := TimeToStr ( GPS.Time );
        CurseInput.Caption     := FloatToStr( GPS.Curse );
        VelocityInput.Caption  := FloatToStr( GPS.Velocity );
        LatitudeInput.Caption  := Format('%dº %.2d'' N', [trunc(GPS.Latitude), trunc(60 * frac(GPS.Latitude))] );
        LongitudeInput.Caption := Format('%dº %.2d'' W', [trunc(GPS.Longitude), trunc(60 * frac(GPS.Longitude))] );
      except
        WithoutConnection;
      end;
  RepaintPlaneLocation;      
end;

procedure TGPS_Form.FormCreate(Sender: TObject);
begin
  fGPS := TGPS_Parser.Create;
  LoadConfig;
  Top  := ShellRTClient.Height - Height - 45;
  Left := 0;
  if not RefreshInfo.Checked
    then WithoutConnection;
end;

procedure TGPS_Form.FormDestroy(Sender: TObject);
begin
  SaveConfig;
end;

procedure TGPS_Form.RefreshInfoClick(Sender: TObject);
begin
  if RefreshInfo.Checked
    then UpdateView;
  Timer1.Enabled := RefreshInfo.Checked;
end;

procedure TGPS_Form.Button1Click(Sender: TObject);
begin
  with TDirectoryList.Create( nil ) do
  try
    if ShowModal = mrOk
      then DataSource.Text := Directories.Path;
    UpdateView;  
  finally
    Free;
  end;
end;

function TGPS_Form.SelectSource: string;
var
  SearchRec    : TSearchRec;
  FileAttrs    : Integer;
  Buffer       : string;
  Maj, Curr    : integer;
begin
  result := '';
  if not DirectoryExists( DataSource.Text )
    then exit;
  if SetCurrentDir( DataSource.Text )
    then
      begin
        FileAttrs := faAnyFile;
        if FindFirst( GPS_FileHeader + '*.txt', FileAttrs, SearchRec ) = 0
          then
            begin
              result := SearchRec.Name;
              Buffer := UpperCase( result );
              Maj := StrToInt( Copy( Buffer, Pos( GPS_FileHeader, Buffer )+Length(GPS_FileHeader),
                                     Pos( '.', Buffer )-(Pos( GPS_FileHeader, Buffer )+Length(GPS_FileHeader)) ) );
              while FindNext( SearchRec ) = 0 do
              begin
                Buffer := UpperCase( SearchRec.Name );
                Curr := StrToInt( Copy( Buffer, Pos( GPS_FileHeader, Buffer )+Length(GPS_FileHeader),
                                        Pos( '.', Buffer )-(Pos( GPS_FileHeader, Buffer )+Length(GPS_FileHeader)) ) );
                if Curr > Maj
                  then
                    begin
                      Maj := Curr;
                      result := SearchRec.Name;
                    end;
              end;
              FindClose( SearchRec );
            end;
      end;
end;
procedure TGPS_Form.Timer1Timer(Sender: TObject);
begin
  UpdateView;
  if RefreshInfo.Checked
    then
      begin
        if Assigned( ShellRTClient.RT_Ch1 )
          then ShellRTClient.RT_Ch1.RTDisplay.Repaint;
        if Assigned( ShellRTClient.RT_Ch2 )
          then ShellRTClient.RT_Ch2.RTDisplay.Repaint;
      end;
end;

procedure TGPS_Form.LocatePlaneIntoGrid( Grid : TRTDisplay );
var
  RadarLat, RadarLon, PlaneLat, PlaneLon : double;
  Dist, Az, X, Y : double;
  BoardLoc, PixelBoard, PlaneLoc : TPoint;
  PenColorSaved, BrushColorSaved : TColor;
  PlaneArea : TRect;
begin
  RadarLat := DegToRad( ShellRTClient.GeneralConfiguration.RadarLatitude[ ShellRTClient.GeneralConfiguration.Radar_ID ] );
  RadarLon := DegToRad( ShellRTClient.GeneralConfiguration.RadarLongitude[ ShellRTClient.GeneralConfiguration.Radar_ID ] );
  PlaneLat := GPS.Latitude;
  PlaneLon := DegToRad( GPS.Longitude );
  PlaneLat := DegToRad( PlaneLat );
  Dist := ArcCos( Sin( RadarLat ) * Sin( PlaneLat ) + Cos( RadarLat ) * Cos( PlaneLat ) * Cos( PlaneLon - RadarLon ) ) * Re;
  Az   := ArcCos( (Sin(PlaneLat) - Cos(Dist/Re) * Sin(RadarLat)) / (Sin(Dist/Re) * Cos(RadarLat)) );
  if Sin( RadarLon - PlaneLon ) < 0
    then Az := 2 * Pi - Az;
  X := Dist * Sin( Az );
  Y := Dist * Cos( Az );
  BoardLoc := Point( Trunc(X * 1000) div Grid.BoardScale, Trunc(Y * 1000) div Grid.BoardScale );
  PixelBoard := Point( BoardLoc.X + Grid.BoardRange, Grid.BoardRange - BoardLoc.Y );
  PlaneLoc := Point( (PixelBoard.X - Grid.SnippetX) * Grid.PaintRect.Right div Grid.SnippetWidth,
                     (PixelBoard.Y - Grid.SnippetY) * Grid.PaintRect.Bottom div Grid.SnippetHeight );
  if ((PlaneLoc.X >= Grid.PaintRect.Left) and (PlaneLoc.X <= Grid.PaintRect.Right)) and
     ((PlaneLoc.Y >= Grid.PaintRect.Top) and (PlaneLoc.Y <= Grid.PaintRect.Bottom))
    then
      begin
        PenColorSaved   := Grid.Canvas.Pen.Color;
        BrushColorSaved := Grid.Canvas.Brush.Color;
        try
          PlaneArea := Rect( PlaneLoc.X - fPlaneSize, PlaneLoc.Y - fPlaneSize,
                             PlaneLoc.X + fPlaneSize, PlaneLoc.Y + fPlaneSize );
          Grid.Canvas.Pen.Color   := fPlaneColor;
          Grid.Canvas.Brush.Color := fPlaneColor;
          Grid.Canvas.Ellipse( PlaneArea );
        finally
          Grid.Canvas.Pen.Color := PenColorSaved;
          Grid.Canvas.Brush.Color := BrushColorSaved;
        end;
      end;
end;

procedure TGPS_Form.PaintPlaneOnGrid(Sender: TObject);
begin
  if SecondsBetween( Time, GPS.Time ) > MaxLaterTime
    then exit;
  if not (Sender as TRTDisplay).PPI_RHI
    then exit;
  LocatePlaneIntoGrid( Sender as TRTDisplay );
end;

procedure TGPS_Form.LocatePlaneClick(Sender: TObject);
begin
  if LocatePlane.Checked
    then
      begin
        if Assigned( ShellRTClient.RT_Ch1 )
          then ShellRTClient.RT_Ch1.RTDisplay.OnPaint := PaintPlaneOnGrid;
        if Assigned( ShellRTClient.RT_Ch2 )
          then ShellRTClient.RT_Ch2.RTDisplay.OnPaint := PaintPlaneOnGrid;
      end
    else
      begin
        if Assigned( ShellRTClient.RT_Ch1 )
          then ShellRTClient.RT_Ch1.RTDisplay.OnPaint := nil;
        if Assigned( ShellRTClient.RT_Ch2 )
          then ShellRTClient.RT_Ch2.RTDisplay.OnPaint := nil;
      end;
  UpdateView;      
end;

procedure TGPS_Form.WithoutConnection;
begin
  Caption := 'Sin Conexion';
  DateInput.Caption      := 'No hay datos';
  TimeInput.Caption      := 'No hay datos';
  CurseInput.Caption     := 'No hay datos';
  VelocityInput.Caption  := 'No hay datos';
  LatitudeInput.Caption  := 'No hay datos';
  LongitudeInput.Caption := 'No hay datos';
end;

procedure TGPS_Form.Button2Click(Sender: TObject);
begin
  LocatePlaneIntoGrid( ShellRTClient.RT_Ch2.RTDisplay );
end;

procedure TGPS_Form.ColorBox1Select(Sender: TObject);
begin
  PlaneColor := ColorBox1.Selected;
end;

procedure TGPS_Form.RepaintPlaneLocation;
begin
  if Assigned( ShellRTClient.RT_Ch1 )
    then ShellRTClient.RT_Ch1.RTDisplay.Repaint;
  if Assigned( ShellRTClient.RT_Ch2 )
    then ShellRTClient.RT_Ch2.RTDisplay.Repaint;
end;

procedure TGPS_Form.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  RefreshTime := UpDown1.Position;
end;

procedure TGPS_Form.GetPlaneSize(const Value: integer);
begin
  fPlaneSize := Value;
end;

procedure TGPS_Form.GetRefreshTime(const Value: integer);
begin
  fRefreshTime := Value;
end;

procedure TGPS_Form.GetPlaneColor(const Value: TColor);
begin

end;

procedure TGPS_Form.SetPlaneColor(const Value: TColor);
begin
  fPlaneColor := Value;
  RepaintPlaneLocation;
end;

procedure TGPS_Form.SetPlaneSize(const Value: integer);
begin
  fPlaneSize := Value;
  RepaintPlaneLocation;
end;

procedure TGPS_Form.SetRefreshTime(const Value: integer);
begin
  fRefreshTime    := Value;
  Timer1.Interval := Value * 1000;
end;

procedure TGPS_Form.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  PlaneSize := UpDown2.Position;
end;

end.
