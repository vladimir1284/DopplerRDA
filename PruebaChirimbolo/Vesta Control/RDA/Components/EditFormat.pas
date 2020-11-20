unit EditFormat;

interface

uses
  SysUtils, Forms, 
  Rda_TLB, StdCtrls, ComCtrls, Classes, Controls;

type
  TEdit_Format = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    udCells: TUpDown;
    Edit2: TEdit;
    udSize: TUpDown;
    Edit3: TEdit;
    HeaderControl1: THeaderControl;
    Button3: TButton;
    Button4: TButton;
    procedure EditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure udCellsChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure udSizeChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
  private
    fData : FormatData;
    function  GetData : FormatData;
    procedure SetData( Value : FormatData );
  public
    property Format : FormatData read GetData write SetData;
  end;

var
  Edit_Format: TEdit_Format;

implementation

{$R *.DFM}

{ TEdit_Format }

procedure TEdit_Format.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex := 1;
end;

procedure TEdit_Format.EditChange(Sender: TObject);
begin
  try
    Edit3.Text := FloatToStrF(udCells.Position*udSize.Position/1000, ffFixed, 4, 1) + ' km';
  except
    on EConvertError do
      Edit3.Text := '-';
  end;
end;

function TEdit_Format.GetData: FormatData;
begin
  with fData do
    begin
      Onda   := WaveLength(ComboBox1.ItemIndex);
      Celdas := udCells.Position;
      Long   := udSize.Position;
    end;
  Result := fData;
end;

procedure TEdit_Format.SetData(Value: FormatData);
begin
  fData := Value;
  with fData do
    begin
      ComboBox1.ItemIndex := integer(Onda);
      udCells.Position := Celdas;
      udSize.Position := Long;
   end;
end;

procedure TEdit_Format.udCellsChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
var
  Range : integer;
begin
  Range := NewValue * udSize.Position;
  AllowChange := Range <= 500000;  // 500 km
end;

procedure TEdit_Format.udSizeChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
var
  Range : integer;
begin
  Range := udCells.Position * NewValue;
  AllowChange := Range <= 500000;  // 500 km
end;

end.
