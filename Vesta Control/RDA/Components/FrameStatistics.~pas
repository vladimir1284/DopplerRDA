unit FrameStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rda_TLB, StdCtrls, Menus;

type
  TFrame_Statistics = class(TFrame)
    txRDA: TStaticText;
    Label1: TLabel;
    txRadar: TStaticText;
    Label2: TLabel;
    txAcc: TStaticText;
    Label3: TLabel;
    txAz: TStaticText;
    Label4: TLabel;
    txEl: TStaticText;
    Label5: TLabel;
    txTxCaldeo1: TStaticText;
    Label6: TLabel;
    txTxAnodo1: TStaticText;
    Label7: TLabel;
    txRx1: TStaticText;
    Label8: TLabel;
    txMagnetronCaldeo1: TStaticText;
    Label9: TLabel;
    txMagnetronAnodo1: TStaticText;
    Label10: TLabel;
    txTiratronPrincipal1: TStaticText;
    Label11: TLabel;
    txTiratronAuxiliar1: TStaticText;
    Label12: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    txTxCaldeo2: TStaticText;
    txTxAnodo2: TStaticText;
    txRx2: TStaticText;
    txMagnetronCaldeo2: TStaticText;
    txMagnetronAnodo2: TStaticText;
    txTiratronPrincipal2: TStaticText;
    txTiratronAuxiliar2: TStaticText;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label20: TLabel;
    Label21: TLabel;
    txTiratronPrincipal1Rad: TStaticText;
    Button9: TButton;
    txTiratronPrincipal2Rad: TStaticText;
    Button10: TButton;
    PopupMenu1: TPopupMenu;
    rMinutes: TMenuItem;
    rHours: TMenuItem;
    rDays: TMenuItem;
    rWeeks: TMenuItem;
    rMonths: TMenuItem;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure rMinutesClick(Sender: TObject);
  private
    fTimeUnit : integer;
    fStatistics : IStatistics;
    fControl    : IStatisticsControl;
    procedure SetStatistics(const Value: IStatistics);
    function FixValue( Value : integer ) : string;
  public
    procedure UpdateView;
    property Statistics : IStatistics  read fStatistics write SetStatistics;
    property Control    : IStatisticsControl read fControl;
  end;

implementation

{$R *.dfm}

{ TFrame_Statistics }

procedure TFrame_Statistics.UpdateView;
begin
  if assigned(fStatistics)
    then
      with fStatistics do
        begin
          txRDA.Caption := FixValue( SwitchedOnRDA );
          txRadar.Caption := FixValue( SwitchedOnRadar );
          txAcc.Caption := FixValue( SwitchedOnAcc );
          txAz.Caption := FixValue( SwitchedOnMotorAz );
          txEl.Caption := FixValue( SwitchedOnMotorEl );
          txTxCaldeo1.Caption := FixValue( SwitchedOnTxCaldeo );
          txTxAnodo1.Caption := FixValue( SwitchedOnTxAnodo );
          txRx1.Caption := FixValue( SwitchedOnRx );
          txMagnetronCaldeo1.Caption := FixValue( MagnetronCaldeo );
          txMagnetronAnodo1.Caption := FixValue( MagnetronAnodo );
          txTiratronPrincipal1.Caption := FixValue( TiratronPrincipal );
          txTiratronAuxiliar1.Caption := FixValue( TiratronAuxiliar );

          txTxCaldeo2.Caption := FixValue( SwitchedOnTxCaldeo2 );
          txTxAnodo2.Caption := FixValue( SwitchedOnTxAnodo2 );
          txRx2.Caption := FixValue( SwitchedOnRx2 );
          txMagnetronCaldeo2.Caption := FixValue( MagnetronCaldeo2 );
          txMagnetronAnodo2.Caption := FixValue( MagnetronAnodo2 );
          txTiratronPrincipal2.Caption := FixValue( TiratronPrincipal2 );
          txTiratronAuxiliar2.Caption := FixValue( TiratronAuxiliar2 );
          txTiratronPrincipal1Rad.Caption := FixValue( TiratronPrincipalAnodo1 );
          txTiratronPrincipal2Rad.Caption := FixValue( TiratronPrincipalAnodo2 );
        end;
end;

procedure TFrame_Statistics.Button1Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.MagnetronCaldeo := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button2Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.MagnetronAnodo := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button3Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.TiratronPrincipal := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button4Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.TiratronAuxiliar := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button5Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.MagnetronCaldeo2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button6Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.MagnetronAnodo2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button7Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.TiratronPrincipal2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button8Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.TiratronAuxiliar2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.SetStatistics(const Value: IStatistics);
begin
  fTimeUnit := 0;
  fStatistics := Value;
  if assigned(fStatistics)
    then fStatistics.QueryInterface(IStatisticsControl, fControl)
    else fControl := nil;
  Button1.Enabled := assigned(fControl);
  Button2.Enabled := assigned(fControl);
  Button3.Enabled := assigned(fControl);
  Button4.Enabled := assigned(fControl);
  Button5.Enabled := assigned(fControl);
  Button6.Enabled := assigned(fControl);
  Button7.Enabled := assigned(fControl);
  Button8.Enabled := assigned(fControl);
end;

procedure TFrame_Statistics.Button9Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.TiratronPrincipalAnodo1 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button10Click(Sender: TObject);
begin
  if assigned(fControl)
    then fControl.TiratronPrincipalAnodo2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.rMinutesClick(Sender: TObject);
begin
  fTimeUnit := (Sender as TComponent).Tag;
  UpdateView;
end;

function TFrame_Statistics.FixValue(Value: integer): string;
begin
  result := IntToStr( Value );
  case fTimeUnit of
    0 : result := IntToStr( Value ) + ' Minutos';
    1 : result := IntToStr( Value div 60 ) + ' Horas';
    2 : result := IntToStr( Value div (60*24)) + ' Dias';
    3 : result := IntToStr( Value div (60*24*7)) + ' Semanas';
    4 : result := IntToStr( Value div (60*24*30)) + ' Meses';
  end;
end;

end.
