unit FrameAdmin;

interface

uses
  Windows, SysUtils, Forms, Menus, StdCtrls, ExtCtrls, ComCtrls, Controls, LoginWS, Classes, CommonObjs, InvokeRegistry;

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
    fUpdating : boolean;
    fAdminWS : ILoginWS;
    fAuthHeader : TAuthHeader;

    function GetAdminWS : ILoginWS;
  public
    procedure Init( Value : ILoginWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property AdminWS : ILoginWS read GetAdminWS;
  end;

implementation

{$R *.DFM}

uses
  EditUser;

{ TFrame_Admin }

procedure TFrame_Admin.UpdateView;
var
  user : TUserInfo;
  I : integer;
  N : WideString;
  L : integer;
begin
  if fUpdating
    then exit;
  if assigned(AdminWS)
    then
      begin
        fUpdating := true;
        try
          try
            ListView1.Items.Clear;
            for I := 0 to AdminWS.Usuarios - 1 do
              with ListView1.Items.Add do
                begin
                  user := AdminWS.Usuario(I);
                  Caption := user.Name;
                  SubItems.Add(IntToStr(user.Level));
                end;
          except
          end;
        finally
          fUpdating := false;
        end;
      end;
end;

procedure TFrame_Admin.PopupMenu1Popup(Sender: TObject);
begin
  Eliminar1.Enabled := assigned(ListView1.Selected);
end;

procedure TFrame_Admin.Insertar1Click(Sender: TObject);
begin  // Insertar
  if assigned(AdminWS) and (fAuthHeader.Level > 0)
    then
      with TEdit_User.Create(Self) do
        try
          UpDown1.Max := pred(fAuthHeader.Level);
          UpDown1.Position := UpDown1.Max;
          ActiveControl := Edit1;
          if ShowModal = id_Ok
            then
              begin
                AdminWS.Nuevo_Usuario(Edit1.Text, Edit3.Text, UpDown1.Position);
                UpdateView;
              end;
        finally
          Release;
        end;
end;

procedure TFrame_Admin.Eliminar1Click(Sender: TObject);
begin  // Eliminar
  if assigned(AdminWS)
    then AdminWS.Borrar_Usuario(ListView1.Selected.Caption);
  UpdateView;
end;

procedure TFrame_Admin.Editar1Click(Sender: TObject);
begin  //Editar
  if assigned(AdminWS) and (fAuthHeader.Level > 0)
    then
      with TEdit_User.Create(Self) do
        try
          Edit1.Text := ListView1.Selected.Caption;
          Edit1.Enabled := false;
          if CompareText(Edit1.Text, fAuthHeader.UserName) = 0
            then UpDown1.Max := fAuthHeader.Level
            else UpDown1.Max := pred(fAuthHeader.Level);
          UpDown1.Position := StrToInt(ListView1.Selected.SubItems[0]);
          ActiveControl := Edit3;
          if ShowModal = id_Ok
            then
              begin
                AdminWS.Modificar(Edit1.Text, Edit3.Text, UpDown1.Position);
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

procedure TFrame_Admin.Init(Value: ILoginWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fAdminWS := Value;

  UpdateView;
end;

function TFrame_Admin.GetAdminWS: ILoginWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fAdminWS as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fAdminWS;
end;

end.

