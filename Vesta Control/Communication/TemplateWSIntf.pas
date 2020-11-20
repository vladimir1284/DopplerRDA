unit TemplateWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  ITemplateWS = interface(IInvokable)
  ['{3465DAA4-51B0-4AD2-A8A8-8D6ED8FBF436}']
    function  LoadTemplate( TemplateName : string ) : TTemplateInfo; safecall;
    function  GetTemplateList : TStringDynArray; safecall;
    function  TemplateExists( TemplateName : string ) : boolean; safecall;
    //Control
    procedure ModifyTemplate( Template : TTemplateInfo ); safecall;
    procedure Eliminar( TemplateName : string ); safecall;
    procedure Automatica(TemplateName : string; Value: boolean); safecall;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(ITemplateWS));

end.
