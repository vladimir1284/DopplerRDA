unit EditFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Rda_TLB;

type
  TEdit_Filter = class(TForm)
    HeaderControl1: THeaderControl;
    txName: TEdit;
    txB0: TEdit;
    txB1: TEdit;
    txB2: TEdit;
    txC4: TEdit;
    txC3: TEdit;
    txC2: TEdit;
    txC1: TEdit;
    txB4: TEdit;
    txB3: TEdit;
    Button4: TButton;
    Button3: TButton;
  private
    fData : FilterData;
    function  GetData : FilterData;
    procedure SetData( Value : FilterData );
  public
    property Filter : FilterData read GetData write SetData;
  end;

var
  Edit_Filter: TEdit_Filter;

implementation

{$R *.dfm}

{ TEdit_Filter }

function TEdit_Filter.GetData: FilterData;
begin
  with fData do
    begin
      Name := txName.Text;
      B0   := StrToFloat(txB0.Text);
      B1   := StrToFloat(txB1.Text);
      B2   := StrToFloat(txB2.Text);
      B3   := StrToFloat(txB3.Text);
      B4   := StrToFloat(txB4.Text);
      C1   := StrToFloat(txC1.Text);
      C2   := StrToFloat(txC2.Text);
      C3   := StrToFloat(txC3.Text);
      C4   := StrToFloat(txC4.Text);
    end;
  Result := fData;
end;

procedure TEdit_Filter.SetData(Value: FilterData);
begin
  fData := Value;
  with fData do
    begin
      txName.Text := Name;
      txB0.Text := FormatFloat('0.00', B0);
      txB1.Text := FormatFloat('0.00', B1);
      txB2.Text := FormatFloat('0.00', B2);
      txB3.Text := FormatFloat('0.00', B3);
      txB4.Text := FormatFloat('0.00', B4);
      txC1.Text := FormatFloat('0.00', C1);
      txC2.Text := FormatFloat('0.00', C2);
      txC3.Text := FormatFloat('0.00', C3);
      txC4.Text := FormatFloat('0.00', C4);
   end;
end;

end.
