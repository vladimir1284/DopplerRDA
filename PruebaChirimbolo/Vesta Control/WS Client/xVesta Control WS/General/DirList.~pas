unit DirList;

interface

uses
  SysUtils, Forms,
  ComCtrls, StdCtrls, Buttons, ShellCtrls, Classes, Controls;

type
  TDirectoryList = class(TForm)
    Directories: TShellTreeView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    procedure DirectoriesChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DirectoryList: TDirectoryList;

implementation

{$R *.dfm}

procedure TDirectoryList.DirectoriesChange(Sender: TObject; Node: TTreeNode);
begin
  BitBtn1.Enabled := DirectoryExists( Directories.Path );
  if BitBtn1.Enabled
    then StatusBar1.Panels[0].Text := Directories.Path
    else StatusBar1.Panels[0].Text := 'Directorio inválido';
end;

end.
