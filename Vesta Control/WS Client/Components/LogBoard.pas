unit LogBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TLogScreen = class(TForm)
    Board: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    DateTimeLabel: TLabel;
    UserLabel: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    ZoneLabel: TLabel;
    Mensage: TLabel;
    TitleLabel: TLabel;
    SaveDialog1: TSaveDialog;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogScreen: TLogScreen;

implementation

{$R *.dfm}

procedure TLogScreen.Button1Click(Sender: TObject);
var
  Report : TStrings;
begin
  if SaveDialog1.Execute
    then
      begin
        Report := TStringList.Create;
        try
          Report.Add( 'Fecha: ' + DateTimeLabel.Caption );
          Report.Add( 'Usuario: ' + UserLabel.Caption );
          Report.Add( 'Area: ' + ZoneLabel.Caption );
          Report.Add( 'Mensaje: ' + TitleLabel.Caption );
          Report.Add( 'Descripcion: ' );
          Report.AddStrings( Board.Lines );
          Report.SaveToFile( SaveDialog1.FileName );
        finally
          Report.Free;
        end;
      end;
end;

end.
