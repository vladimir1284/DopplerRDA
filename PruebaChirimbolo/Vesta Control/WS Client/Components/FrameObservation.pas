unit FrameObservation;

interface

uses 
  Forms, Rda_TLB, StdCtrls, ComCtrls, Onoff, Controls, Classes;

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
    fObservation : IObservation;
    procedure SetObservation( Value : IObservation );
  public
    procedure UpdateView;
  published
    property Observation : IObservation read fObservation write SetObservation;
  end;

implementation

{$R *.DFM}

{ TFrame_Observation }

procedure TFrame_Observation.SetObservation(Value: IObservation);
begin
  fObservation := Value;
  UpdateView;
end;

procedure TFrame_Observation.UpdateView;
var
  Index : cardinal;
  Msg   : string;
begin
  if assigned(fObservation)
    then
      with fObservation do
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
end;

procedure TFrame_Observation.Button1Click(Sender: TObject);
begin
  if assigned(fObservation)
    then fObservation.Cancel;
end;

end.

