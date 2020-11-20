unit EditFormat;

interface

uses
  SysUtils, Forms, StdCtrls, ComCtrls, Classes, Controls, ObservationsWS, CommonObjs;

type
  TEdit_Format = class(TForm)
    ComboBox1: TComboBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Edit3: TEdit;
    HeaderControl1: THeaderControl;
    Button3: TButton;
    Button4: TButton;
    procedure EditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure UpDown2ChangingEx(Sender: TObject; var AllowChange: Boolean;
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
    Edit3.Text := FloatToStrF( UpDown1.Position*UpDown2.Position/1000,
                               ffFixed, 4, 1 ) + ' km';
  except
    on EConvertError do
      Edit3.Text := '-';
  end;
end;

function TEdit_Format.GetData: FormatData;
begin
  with fData do
    begin
      Onda   := TWaveLengthEnum(ComboBox1.ItemIndex);
      Celdas := UpDown1.Position;
      Long   := UpDown2.Position;
    end;
  Result := fData;
end;

procedure TEdit_Format.SetData(Value: FormatData);
begin
  fData := Value;
  with fData do
    begin
      ComboBox1.ItemIndex := Ord(Onda);
      UpDown1.Position := Celdas;
      UpDown2.Position := Long;
   end;
end;

procedure TEdit_Format.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
var
  Range : integer;
begin
  Range := NewValue * UpDown2.Position;
  AllowChange := Range <= 500000;  // 500 km
end;

procedure TEdit_Format.UpDown2ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
var
  Range : integer;
begin
  Range := UpDown1.Position * NewValue;
  AllowChange := Range <= 500000;  // 500 km
end;

end.
