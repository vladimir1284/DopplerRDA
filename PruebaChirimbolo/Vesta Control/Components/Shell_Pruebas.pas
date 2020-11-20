unit Shell_Pruebas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Antenna, StdCtrls, Acquire;

type
  TForm2 = class(TForm)
    Azimut1: TAzimut;
    Timer1: TTimer;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    fAcqThread :  TAcquireThread;
  public
     PCI416F2    : integer
    { Public declarations }
    
  end;
  


var
  Form2: TForm2;

implementation

{$R *.dfm}
uses
  Deva,
  Datel,
  ElbrusTypes,
  PCI416;
const
  Rate = 250;
  Clock= 1000000;

//var
 // Ch1, Ch2 : array[0..3999] of word;

var
 BoardCount  : word;
 PCI416F2    : integer =-1;
 ActualRate  : Double;
procedure TForm2.FormCreate(Sender: TObject);
begin
  Init_Encoder;
  //Init_PCI416;
  pci416_init(BoardCount);
  Set_PT_AD_Clock_Rate(PCI416F2, Rate);
  Set_PT_Trigger_Rate(PCI416F2, Rate, ActualRate);
  fAcqThread := TAcquireThread.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Reset_PT_Trigger_Timer(PCI416F2);
  Done_Encoder;
  Done_PCI416;

end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  Azimut1.Position :=Read_Encoder_X;
end;

procedure TForm2.Button1Click(Sender: TObject);

begin
 with fAcqThread do
   AcquisitionEnabled := not AcquisitionEnabled;
end;

end.
