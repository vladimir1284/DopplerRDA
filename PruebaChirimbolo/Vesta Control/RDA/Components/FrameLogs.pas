unit FrameLogs;

interface

uses
  SysUtils, Rda_TLB, Grids, StdCtrls, Forms, Controls, Classes, ComCtrls;

type
  PWStrings = ^TWStrings;
  TWStrings = array[0..0] of WideString;

  TLogCategory = ( lcInformation, lcWarning, lcError );

const
  LogCategoryNames : array[ TLogCategory ] of string = ( 'Informacion', 'Aviso', 'Error' );

type
  TFrame_Logs = class(TFrame)
    Button1: TButton;
    Label1: TLabel;
    ScrollBox1: TScrollBox;
    ShowLogMsg: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure ShowLogMsgDblClick(Sender: TObject);
  public
    procedure Init;
    procedure UpdateView;
  end;

implementation

{$R *.dfm}

uses
  ActiveX, Shell_Client, Dialogs, LogBoard;

{ TFrame_Logs }

procedure TFrame_Logs.UpdateView;
var
  LogMessagesDownloaded : PSafeArray;
  i, LogMessagesCount : integer;
  Buffer, Str : string;
  DateTime : TDateTime;
begin
  try
    if ShellClient.VestaRDA.LogMessageTitles( LogMessagesDownloaded, LogMessagesCount ) = S_OK
      then
        begin
          ShowLogMsg.RowCount := LogMessagesCount + 1;
          ShowLogMsg.Height := (ShowLogMsg.DefaultRowHeight+2) * ShowLogMsg.RowCount;
          for i := 0 to LogMessagesCount-1 do
            begin
              Buffer := PWStrings(LogMessagesDownloaded.pvData)^[(LogMessagesCount-1)-i];
              Str := Copy( Buffer, 0, Pos( ';', Buffer )-1 );
              ShowLogMsg.Cells[ 0, i+1 ] := Str;

              Buffer := Copy( Buffer, Pos( ';', Buffer )+1, Length(Buffer)-Pos( ';', Buffer )+1 );
              Str := Copy( Buffer, 0, Pos( ';', Buffer )-1 );
              ShowLogMsg.Cells[ 1, i+1 ] := LogCategoryNames[ TLogCategory(StrToInt( Str )) ];

              Buffer := Copy( Buffer, Pos( ';', Buffer )+1, Length(Buffer)-Pos( ';', Buffer )+1 );
              Str := Copy( Buffer, 0, Pos( ';', Buffer )-1 );
              ShowLogMsg.Cells[ 2, i+1 ] := Str;

              Buffer := Copy( Buffer, Pos( ';', Buffer )+1, Length(Buffer)-Pos( ';', Buffer )+1 );
              Str := Copy( Buffer, 0, Pos( ';', Buffer )-1 );
              if Str <> ''
                then ShowLogMsg.Cells[ 3, i+1 ] := Str
                else ShowLogMsg.Cells[ 3, i+1 ] := 'Automatico';

              Buffer := Copy( Buffer, Pos( ';', Buffer )+1, Length(Buffer)-Pos( ';', Buffer )+1 );
              Str := Copy( Buffer, 0, Pos( ';', Buffer )-1 );
              ShowLogMsg.Cells[ 4, i+1 ] := Str;

              Buffer := Copy( Buffer, Pos( ';', Buffer )+1, Length(Buffer)-Pos( ';', Buffer )+1 );
              Str := Copy( Buffer, 0, Pos( ';', Buffer )-1 );
              ShowLogMsg.Cells[ 5, i+1 ] := Str;
            end;
          ShowLogMsg.Refresh;
        end;
  finally
    if assigned( LogMessagesDownloaded )
      then SafeArrayDestroy( LogMessagesDownloaded );
  end;    
end;

procedure TFrame_Logs.Button1Click(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrame_Logs.Init;
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

procedure TFrame_Logs.ShowLogMsgDblClick(Sender: TObject);
var
  DateTime : TDateTime;
  Category : integer;
  Client,
  Title,
  Zone,
  Msg      : WideString;
  Index    : cardinal;
begin
  with TLogScreen.Create( Application ) do
  try
    ShellClient.VestaRDA.LogMessage( StrToInt( ShowLogMsg.Cells[ 0, ShowLogMsg.Selection.Top ] ), DateTime, Category, Client, Title, Msg, Zone );
    DateTimeLabel.Caption := DateTimeToStr( DateTime );
    ZoneLabel.Caption := Zone;
    TitleLabel.Caption := Title;
    UserLabel.Caption := Client;
    Msg := '"' + Msg + '"';
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

end.
