unit PlotForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart;

type
  TRxPlotForm = class(TForm)
    Board: TChart;
    Series1: TLineSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    { Public declarations }
  end;

var
  RxPlotForm: TRxPlotForm;

implementation

{$R *.dfm}

procedure TRxPlotForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
