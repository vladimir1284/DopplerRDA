unit FrameObservations;

interface

uses
  Windows, SysUtils, Forms, 
  Menus, ImgList, StdCtrls, ExtCtrls, ComCtrls, Controls, Classes,
  Dialogs, ObservationsWS, InvokeRegistry, CommonObjs;

type
  TFrame_Observations = class(TFrame)
    ListView1: TListView;
    Panel1: TPanel;
    Button1: TButton;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Insertar1: TMenuItem;
    Eliminar1: TMenuItem;
    Clonar1: TMenuItem;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Insertar1Click(Sender: TObject);
    procedure Eliminar1Click(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Clonar1Click(Sender: TObject);
  private
    fUpdating : boolean;
    fObservations : IObservationsWS;
    fAuthHeader : TAuthHeader;
    function GetObservations: IObservationsWS;
  public
    procedure Init( Value : IObservationsWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property Observations : IObservationsWS read GetObservations;
    property Control      : IObservationsWS read GetObservations;
  end;

implementation

{$R *.DFM}

uses
  EditTemplate, XSBuiltIns;

{ TFrame_Observations }
procedure UpdateItem( Item : TListItem; Template : TTemplateInfo);
var
  T : TDateTime;
begin
  with Item, Template do
    begin
      Checked := Automatic;
      Caption := Name;
      ImageIndex := Ord(Kind);
      while SubItems.Count < 2 do
        SubItems.Add('');
      T := NextTime.AsDateTime;
      if T <> 0
        then SubItems[0] := TimeToStr(T)
        else SubItems[0] := '-';
    end;
end;

function FindItem( Items : TListItems; Name : string ) : TListItem;
var
  I : integer;
begin
  I := 0;
  while (I < Items.Count) and
        (CompareText(Items[I].Caption, Name) <> 0) do
    inc(I);
  if (I < Items.Count)
    then Result := Items[I]
    else Result := Items.Add;
end;

procedure TFrame_Observations.UpdateView;
var
  I : integer;
  T : TTemplateInfo;
begin
  if fUpdating then exit;
  if assigned(Observations)
    then
      begin
        fUpdating := true;
        try
          try
            for I := 0 to Observations.Plantillas - 1 do
              begin
                T := Observations.Plantilla(I);
                UpdateItem(FindItem(ListView1.Items, T.Name), T);
              end;
            for I := ListView1.Items.Count - 1 downto 0 do
              begin
                T := Observations.Buscar(ListView1.Items[I].Caption);
                if T = nil
                  then ListView1.Items.Delete(I);
              end;
          except
          end;
        finally
          fUpdating := false;
        end;
      end;

  Button1.Enabled := assigned(Observations) and assigned(ListView1.Selected)
end;

procedure TFrame_Observations.PopupMenu1Popup(Sender: TObject);
begin
  Insertar1.Enabled := assigned(Control);
  Editar1.Enabled := Insertar1.Enabled and assigned(ListView1.Selected);
  Eliminar1.Enabled := Editar1.Enabled;
end;

procedure TFrame_Observations.Eliminar1Click(Sender: TObject);
begin  // Eliminar
  if assigned(Control)
    then Control.Borrar(ListView1.Selected.Caption);
  UpdateView;
end;

procedure TFrame_Observations.Editar1Click(Sender: TObject);
var
  Template : TTemplateInfo;
  TemplateName : WideString;
begin  // Editar
  TemplateName := ListView1.Selected.Caption;
  Template := Observations.Buscar(TemplateName);
  if assigned(Template)
    then
      with TEdit_Template.Create(Self) do
        try
          GetData(Template);
          if ShowModal = idOk
            then
              begin
                SetData(Template);
                Observations.Borrar(TemplateName);
                Observations.Save(Template);
                UpdateView;
              end;
        finally
          Release;
        end;
end;

procedure TFrame_Observations.Insertar1Click(Sender: TObject);
begin  // Insertar
  if assigned(Control)
    then Control.Nueva;
  UpdateView;
end;

procedure TFrame_Observations.ListView1Click(Sender: TObject);
var
  I : integer;
begin
  for I := 0 to ListView1.Items.Count - 1 do
    with ListView1.Items[I] do
      Observations.Automatica(Caption, Checked);
  UpdateView;
end;

procedure TFrame_Observations.Button1Click(Sender: TObject);
begin
  if assigned(Observations) and assigned(ListView1.Selected)
    then Observations.Ejecutar( ListView1.Selected.Caption );
end;

procedure TFrame_Observations.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  Button1.Enabled := assigned(Observations) and assigned(ListView1.Selected)
end;

procedure TFrame_Observations.Clonar1Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.Clonar(ListView1.Selected.Caption);
  UpdateView;
end;

function TFrame_Observations.GetObservations: IObservationsWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fObservations as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fObservations;
end;

procedure TFrame_Observations.Init(Value: IObservationsWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fObservations := Value;

  UpdateView;
end;

end.

