unit Shell_Rda;

interface

uses
  Messages, SysUtils, Forms, 
  ExtCtrls, ImgList, Menus, StdCtrls, Controls, Classes;

const
  WM_ProcessMessages = WM_User + 1;

type
  TShellRDA = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    MainMenu1: TMainMenu;
    RDA1: TMenuItem;
    Creditos1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    ImageList2: TImageList;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
  end;

var
  ShellRDA: TShellRDA;

implementation

{$R *.DFM}

uses
  Statistics,
  AboutDialog;

procedure TShellRDA.FormCreate(Sender: TObject);
begin
  Button1Click(Button1);
end;

procedure TShellRDA.Button1Click(Sender: TObject);
begin  // Actualizar
  Edit1.Text := IntToStr(CountInstances);
  Edit2.Text := IntToStr(CountReferences);
end;

procedure TShellRDA.Button2Click(Sender: TObject);
begin  // Limpiar
  if CountReferences > 0
    then
      while CountReferences > 0 do
        RemoveReference
    else
      while CountReferences < 0 do
        RegisterReference;
  if CountInstances > 1
    then
      while CountInstances > 1 do
        RemoveInstance
    else
      while CountInstances < 1 do
        RegisterInstance;
  Button1Click(Sender);
end;

procedure TShellRDA.Creditos1Click(Sender: TObject);
begin
  with TFAboutDialog.Create(Self) do
    try
      ShowModal;
    finally
      Release;
    end;
end;

end.

