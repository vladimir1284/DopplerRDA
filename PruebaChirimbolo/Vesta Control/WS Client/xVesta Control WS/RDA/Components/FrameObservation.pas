unit FrameObservation;

interface

uses
  Forms, StdCtrls, ComCtrls, Onoff, Controls, Classes, ObservationsWS, InvokeRegistry, CommonObjs;

type
  TFrame_Observation = class(TFrame)
    Label3: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    Bulb1: TBulb;
    ProgressBar1: TProgressBar;
    Edit2: TEdit;
    Button1: TButton;
    ScrollBox1: TScrollBox;
    Label2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    fAuthHeader : TAuthHeader;
    fUpdating : boolean;
    fObservation : IObservationsWS;
    function GetObservation: IObservationsWS;
  public
    procedure Init( Value : IObservationsWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property Observation : IObservationsWS read GetObservation;
  end;

implementation

uses Windows;

{$R *.DFM}

{ TFrame_Observation }

procedure TFrame_Observation.UpdateView;
var
  Index : cardinal;
  Msg   : string;
begin
  if fUpdating then exit;
  if assigned(Observation)
    then
      begin
        fUpdating := true;
        try
          try
            with Observation do
              begin
                Bulb1.State := InProgress;
                Button1.Enabled := Bulb1.State;
                Edit1.Text := Client;
                Edit2.Text := Name;
                Label1.Caption := Message;
                Msg := SubMsg;
                while (Length( Msg )>0) and (Msg[ Length( Msg ) ] = ';') do
                  Delete( Msg, Length( Msg ), 1 );
                Msg := '"' + Msg + '"';
                while Pos( ';', Msg ) > 0 do
                begin
                  Index := Pos( ';', Msg );
                  Msg := Copy( Msg, 1, Index-1 ) + '"#"' + Copy( Msg, Index+1, Length( Msg )-Index );
                end;
                Label2.Lines.Delimiter := '#';
                Label2.Lines.QuoteChar := '"';
                if Msg <> Label2.Lines.DelimitedText
                  then
                    begin
                      Label2.Lines.Clear;
                      Label2.Lines.DelimitedText := Msg;
                    end;
                ProgressBar1.Position := Progress;
                Update;
              end;
          except
          end;
        finally
          fUpdating := false;
        end;
      end;
end;

procedure TFrame_Observation.Button1Click(Sender: TObject);
begin
  if assigned(Observation)
    then Observation.Cancel;
end;

procedure TFrame_Observation.Init(Value: IObservationsWS; AuthHeader : TAuthHeader);
begin
  fUpdating := false;
  fObservation := Value;
  fAuthHeader := AuthHeader;
  UpdateView;
end;

function TFrame_Observation.GetObservation: IObservationsWS;
var
  Headers : ISOAPHeaders;
begin
  Sleep(10);
  Headers := fObservation as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fObservation;
end;

end.

