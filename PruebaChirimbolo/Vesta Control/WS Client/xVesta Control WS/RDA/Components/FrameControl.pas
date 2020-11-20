unit FrameControl;

interface

uses
  Forms, StdCtrls, Onoff, Controls, Classes, InvokeRegistry, CommonObjs, LoginWS;

type
  TFrame_Control = class(TFrame)
    Button1: TButton;
    Edit1: TEdit;
    Bulb1: TBulb;
    procedure Button1Click(Sender: TObject);
  private
    fUpdating : boolean;
    fLogin : ILoginWS;
    fAuthHeader : TAuthHeader;

    function GetLogin : ILoginWS;
  public
    procedure Init( Value : ILoginWS; AuthHeader : TAuthHeader);
    procedure UpdateView;
    function  InControl : boolean;

    property Updating : boolean read fUpdating;
  published
    property Login : ILoginWS read GetLogin;
  end;

implementation

{$R *.DFM}

{ TFrame_Control }

procedure TFrame_Control.UpdateView;
begin
  if fUpdating then exit;
  if assigned(Login)
    then
      begin
        fUpdating := true;
        try
          try
            Button1.Enabled := fAuthHeader.Level >= Login.ControllerLevel;
            Edit1.Text := Login.ControllerName;
            Bulb1.State := InControl;
          except
          end;
        finally
          fUpdating := false;
        end;
      end;
end;

procedure TFrame_Control.Button1Click(Sender: TObject);
begin
  if assigned(Login)
    then
      if Bulb1.State
        then Login.ReleaseControl
        else Login.TakeControl;
end;

procedure TFrame_Control.Init(Value: ILoginWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fLogin := Value;

  UpdateView;
end;

function TFrame_Control.InControl: boolean;
begin
  result := Login.Get_InControl;
end;

function TFrame_Control.GetLogin: ILoginWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fLogin as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fLogin;
end;

end.

