unit FrameAdmin;

interface

uses
  Windows, SysUtils, Forms, 
  Rda_TLB, Menus, StdCtrls, ExtCtrls, ComCtrls, Controls, Classes;

type
  TFrame_Admin = class(TFrame)
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    Insertar1: TMenuItem;
    Eliminar1: TMenuItem;
    Panel1: TPanel;
    Button1: TButton;
    Editar1: TMenuItem;
    N1: TMenuItem;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Insertar1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
  private
    fAdmin : ILogin;
    procedure SetAdmin( Value : ILogin );
  public
    procedure UpdateView;
  published
    property Admin : ILogin read fAdmin write SetAdmin;
  end;

implementation

{$R *.DFM}

uses
  EditUser;

{ TFrame_Admin }

procedure TFrame_Admin.SetAdmin(Value: ILogin);
begin
  fAdmin := Value;
  UpdateView;
end;

procedure TFrame_Admin.UpdateView;
var
  I : integer;
  N : WideString;
  L : integer;
begin
  if assigned(Admin)
    then
      begin
        ListView1.Items.Clear;
        for I := 0 to Admin.Usuarios - 1 do
          with ListView1.Items.Add do
            begin
              Admin.Usuario(I, N, L);
              Caption := N;
              SubItems.Add(IntToStr(L));
            end;
      end;
end;

procedure TFrame_Admin.PopupMenu1Popup(Sender: TObject);
begin
  Eliminar1.Enabled := assigned(ListView1.Selected);
end;

procedure TFrame_Admin.Insertar1Click(Sender: TObject);
begin  // Insertar
  if assigned(Admin) and (Admin.Level > 0)
    then
      with TEdit_User.Create(Self) do
        try
          UpDown1.Max := pred(Admin.Level);
          UpDown1.Position := UpDown1.Max;
          ActiveControl := Edit1;
          if ShowModal = id_Ok
            then
              begin
                Admin.Nuevo_Usuario(Edit1.Text, Edit3.Text, UpDown1.Position);
                UpdateView;
              end;
        finally
          Release;
        end;
end;

procedure TFrame_Admin.Eliminar1Click(Sender: TObject);
begin  // Eliminar
  if assigned(Admin)
    then Admin.Borrar_Usuario(ListView1.Selected.Caption);
  UpdateView;
end;

procedure TFrame_Admin.Editar1Click(Sender: TObject);
begin  //Editar
  if assigned(Admin) and (Admin.Level > 0)
    then
      with TEdit_User.Create(Self) do
        try
          Edit1.Text := ListView1.Selected.Caption;
          Edit1.Enabled := false;
          if CompareText(Edit1.Text, Admin.Name) = 0
            then UpDown1.Max := Admin.Level
            else UpDown1.Max := pred(Admin.Level);
          UpDown1.Position := StrToInt(ListView1.Selected.SubItems[0]);
          ActiveControl := Edit3;
          if ShowModal = id_Ok
            then
              begin
                Admin.Modificar(Edit1.Text, Edit3.Text, UpDown1.Position);
                UpdateView;
              end;
        finally
          Release;
        end;
end;

procedure TFrame_Admin.Button1Click(Sender: TObject);
begin
  UpdateView;
end;

end.

