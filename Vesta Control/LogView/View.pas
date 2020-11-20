unit View;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, LogTools, Menus;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    ShowLogMsg: TStringGrid;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    Fichero1: TMenuItem;
    Crditos1: TMenuItem;
    Cargar1: TMenuItem;
    Refrescar1: TMenuItem;
    Ayuda1: TMenuItem;
    procedure Button2Click(Sender: TObject);
    procedure ShowLogMsgDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ShowLogMsgKeyPress(Sender: TObject; var Key: Char);
    procedure Crditos1Click(Sender: TObject);
    procedure Cargar1Click(Sender: TObject);
    procedure Refrescar1Click(Sender: TObject);
  private
    LogMessageList : TLogMessageList;
    fCurrentLogFileName : string;
  private
    procedure Init;
    function  LogFilePath : string;
    function  LogFileName : string;
  public
    procedure UpdateView;
  end;

var
  Form3: TForm3;

implementation

uses
  LogBoard, AboutDialog;

{$R *.dfm}

const
  FileName = 'Logs.log';
  LogCategoryNames : array[ TLogCategory ] of string = ( 'Informacion', 'Aviso', 'Error' );

{ TForm3 }

procedure TForm3.Init;
begin
  with ShowLogMsg do
  begin
    ColCount := 6;

    ColWidths[0] := 50;
    ColWidths[1] := 70;
    ColWidths[2] := 120;
    ColWidths[3] := 70;
    ColWidths[4] := 70;
    ColWidths[5] := 1500;
    Width := ColWidths[0] +
             ColWidths[1] +
             ColWidths[2] +
             ColWidths[3] +
             ColWidths[4] +
             ColWidths[5];
    Rows[0][0] := 'Código';
    Rows[0][1] := 'Tipo';
    Rows[0][2] := 'Fecha';
    Rows[0][3] := 'Usuario';
    Rows[0][4] := 'Area';
    Rows[0][5] := 'Mensaje';
  end;
end;

procedure TForm3.UpdateView;
var
  i, Index : integer;
begin
  Index := 1;
  ShowLogMsg.RowCount := LogMessageList.Count + 1;
  ShowLogMsg.Height := (ShowLogMsg.DefaultRowHeight+2) * ShowLogMsg.RowCount;
  for i := LogMessageList.Count-1 downto 0 do
  begin
    ShowLogMsg.Cells[ 0, Index ] := IntToStr( LogMessageList[i].Code );
    ShowLogMsg.Cells[ 1, Index ] := LogCategoryNames[ TLogCategory( LogMessageList[i].Category ) ];
    ShowLogMsg.Cells[ 2, Index ] := DateTimeToStr( LogMessageList[i].DateTime );
    ShowLogMsg.Cells[ 3, Index ] := LogMessageList[i].CurrentUser;
    ShowLogMsg.Cells[ 4, Index ] := LogMessageList[i].Zone;
    ShowLogMsg.Cells[ 5, Index ] := LogMessageList[i].Title;
    Inc( Index );
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  Source : TReader;
  Stream : TStream;
begin
  if OpenDialog1.Execute
    then
      begin
        fCurrentLogFileName := OpenDialog1.FileName;
        Caption := 'Eventos del Sistema: ' + ExtractFileName( OpenDialog1.FileName );
        Stream := TFileStream.Create( OpenDialog1.FileName, fmOpenRead );
        Source := TReader.Create( Stream, MaxLogLines*MaxLogSize );
        try
          LogMessageList.Clear;
          LogMessageList.Load( Source );
          UpdateView;
        finally
          Source.Free;
          Stream.Free;
        end;
      end;
end;

procedure TForm3.ShowLogMsgDblClick(Sender: TObject);
var
  LogMessage : TLogMessage;
  Index      : cardinal;
  Msg        : string;
begin
  with TLogScreen.Create( Application ) do
  try
    LogMessage := LogMessageList.Find( StrToInt( ShowLogMsg.Cells[ 0, ShowLogMsg.Selection.Top ] ) );
    DateTimeLabel.Caption := DateTimeToStr( LogMessage.DateTime );
    ZoneLabel.Caption := LogMessage.Zone;
    TitleLabel.Caption := LogMessage.Title;
    UserLabel.Caption := LogMessage.CurrentUser;
    Msg := '"' + LogMessage.LogMessage + '"';
    while Pos( ';', Msg ) > 0 do
    begin
      Index := Pos( ';', Msg );
      Msg := Copy( Msg, 1, Index-1 ) + '"#"' + Copy( Msg, Index+1, Length( Msg )-Index );
    end;
    Board.Lines.Delimiter := '#';
    Board.Lines.QuoteChar := '"';
    Board.Lines.DelimitedText := Msg;
    ShowModal;
  finally
    Free;
  end;
end;

function TForm3.LogFileName: string;
begin
  result := LogFilePath + FileName;
end;

function TForm3.LogFilePath: string;
begin
  result := ExtractFilePath( ParamStr(0) ) + 'Logs\';
end;

procedure TForm3.FormCreate(Sender: TObject);
var
  Source : TReader;
  Stream : TStream;
begin
  fCurrentLogFileName := '';
  Init;
  OpenDialog1.InitialDir := LogFilePath;
  LogMessageList := TLogMessageList.Create;
  if FileExists( LogFileName )
    then
      begin
        fCurrentLogFileName := LogFileName;
        Caption := 'Eventos del Sistema: ' + ExtractFileName( LogFileName );
        Stream := TFileStream.Create( LogFileName, fmOpenRead );
        Source := TReader.Create( Stream, MaxLogLines*MaxLogSize );
        try
          LogMessageList.Load( Source );
          UpdateView;
        finally
          Source.Free;
          Stream.Free;
        end;
      end;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  LogMessageList.Free;
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  Source : TReader;
  Stream : TStream;
begin
  if FileExists( fCurrentLogFileName )
    then
      begin
        Stream := TFileStream.Create( LogFileName, fmOpenRead );
        Source := TReader.Create( Stream, MaxLogLines*MaxLogSize );
        try
          LogMessageList.Clear;
          LogMessageList.Load( Source );
          UpdateView;
        finally
          Source.Free;
          Stream.Free;
        end;
      end;
end;

procedure TForm3.ShowLogMsgKeyPress(Sender: TObject; var Key: Char);
var
  LogMessage : TLogMessage;
  Index      : cardinal;
  Msg        : string;
begin
  if Key = #13
    then
      with TLogScreen.Create( Application ) do
      try
        LogMessage := LogMessageList.Find( StrToInt( ShowLogMsg.Cells[ 0, ShowLogMsg.Selection.Top ] ) );
        DateTimeLabel.Caption := DateTimeToStr( LogMessage.DateTime );
        ZoneLabel.Caption := LogMessage.Zone;
        TitleLabel.Caption := LogMessage.Title;
        UserLabel.Caption := LogMessage.CurrentUser;
        Msg := '"' + LogMessage.LogMessage + '"';
        while Pos( ';', Msg ) > 0 do
        begin
          Index := Pos( ';', Msg );
          Msg := Copy( Msg, 1, Index-1 ) + '"#"' + Copy( Msg, Index+1, Length( Msg )-Index );
        end;
        Board.Lines.Delimiter := '#';
        Board.Lines.QuoteChar := '"';
        Board.Lines.DelimitedText := Msg;
        ShowModal;
      finally
        Free;
      end;
end;

procedure TForm3.Crditos1Click(Sender: TObject);
begin
  with TFAboutDialog.Create(Self) do
    try
      ShowModal;
    finally          
      Release;
    end;
end;

procedure TForm3.Cargar1Click(Sender: TObject);
begin
  Button2Click( nil );
end;

procedure TForm3.Refrescar1Click(Sender: TObject);
begin
  Button1Click( nil );
end;

end.
