unit TemplateWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, TemplateWSIntf, CommunicationObj, Classes;

type

  TTemplateWS = class(TCommObj, ITemplateWS)
  public
    function  LoadTemplate( TemplateName : string ) : TTemplateInfo; safecall;
    function  GetTemplateList : TStringDynArray; safecall;
    function  TemplateExists( TemplateName : string ) : boolean; safecall;
    //Control
    procedure ModifyTemplate( Template : TTemplateInfo ); safecall;
    procedure Eliminar( TemplateName : string ); safecall;
    procedure Automatica(TemplateName : string; Value: boolean); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses LayoutManager;

{ TTemplate }

procedure TTemplateWS.Automatica(TemplateName: string; Value: boolean);
var
  LayoutManager : TLayoutManager;
  TemplateInfo : TTemplateInfo;
begin
  if InControl
    then
      begin
        LayoutManager := TLayoutManager.Create;
        try
          TemplateInfo := LayoutManager.LoadTemplate(TemplateName);
          TemplateInfo.Automatic := Value;
          LayoutManager.SaveTemplate(TemplateInfo);
        finally
          LayoutManager.Free;
        end;
      end;
end;

function TTemplateWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Designer;
end;

procedure TTemplateWS.Eliminar(TemplateName: string);
var
  LayoutManager : TLayoutManager;
begin
  LayoutManager := TLayoutManager.Create;
  try
    LayoutManager.KillTemplate(TemplateName);
  finally
    LayoutManager.Free;
  end;
end;


function TTemplateWS.GetTemplateList: TStringDynArray;
var
  i : integer;
  Templates : TStrings;
begin
  Templates := EnumTemplates;
  try
    SetLength( result, Templates.Count );
    for i := 0 to Templates.Count-1 do
      result[i] := Templates[i];
  finally
    Templates.Free;
  end;
end;

function TTemplateWS.LoadTemplate(TemplateName: string): TTemplateInfo;
var
  LayoutManager : TLayoutManager;
begin
  LayoutManager := TLayoutManager.Create;
  try
    result := LayoutManager.LoadTemplate(TemplateName);
  finally
    LayoutManager.Free;
  end;
end;

procedure TTemplateWS.ModifyTemplate(Template: TTemplateInfo);
var
  LayoutManager : TLayoutManager;
begin
  LayoutManager := TLayoutManager.Create;
  try
    LayoutManager.KillTemplate(Template.Name);
    LayoutManager.SaveTemplate(Template);
  finally
    LayoutManager.Free;
  end;
end;

function TTemplateWS.TemplateExists(TemplateName: string): boolean;
begin
  result := TemplateExists(TemplateName);
end;

initialization
  InvRegistry.RegisterInvokableClass(TTemplateWS);

end.

