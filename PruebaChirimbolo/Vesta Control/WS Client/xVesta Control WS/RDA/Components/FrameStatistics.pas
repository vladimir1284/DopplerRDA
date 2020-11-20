unit FrameStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, StatisticsWS, CommonObjs, InvokeRegistry;

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
    fUpdating : boolean;

    fStatistics : IStatisticsWS;
    fAuthHeader : TAuthHeader;

    fTimeUnit : integer;
    function FixValue( Value : integer ) : string;
    function GetControl: IStatisticsWS;
    function GetStatistics: IStatisticsWS;
  public
    procedure Init( Value : IStatisticsWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;

    property Statistics : IStatisticsWS read GetStatistics;
    property Control    : IStatisticsWS read GetControl;
  end;

implementation

{$R *.dfm}

{ TFrame_Statistics }

procedure TFrame_Statistics.UpdateView;
begin
  if assigned(Statistics) and (not fUpdating)
    then
      begin
        fUpdating := true;
        try
          try
            txRDA.Caption := FixValue( Statistics.SwitchedOnRDA );
            txRadar.Caption := FixValue( Statistics.SwitchedOnRadar );
            txAcc.Caption := FixValue( Statistics.SwitchedOnAcc );
            txAz.Caption := FixValue( Statistics.SwitchedOnMotorAz );
            txEl.Caption := FixValue( Statistics.SwitchedOnMotorEl );
            txTxCaldeo1.Caption := FixValue( Statistics.SwitchedOnTxCaldeo );
            txTxAnodo1.Caption := FixValue( Statistics.SwitchedOnTxAnodo );
            txRx1.Caption := FixValue( Statistics.SwitchedOnRx );
            txMagnetronCaldeo1.Caption := FixValue( Statistics.MagnetronCaldeo );
            txMagnetronAnodo1.Caption := FixValue( Statistics.MagnetronAnodo );
            txTiratronPrincipal1.Caption := FixValue( Statistics.TiratronPrincipal );
            txTiratronAuxiliar1.Caption := FixValue( Statistics.TiratronAuxiliar );

            txTxCaldeo2.Caption := FixValue( Statistics.SwitchedOnTxCaldeo2 );
            txTxAnodo2.Caption := FixValue( Statistics.SwitchedOnTxAnodo2 );
            txRx2.Caption := FixValue( Statistics.SwitchedOnRx2 );
            txMagnetronCaldeo2.Caption := FixValue( Statistics.MagnetronCaldeo2 );
            txMagnetronAnodo2.Caption := FixValue( Statistics.MagnetronAnodo2 );
            txTiratronPrincipal2.Caption := FixValue( Statistics.TiratronPrincipal2 );
            txTiratronAuxiliar2.Caption := FixValue( Statistics.TiratronAuxiliar2 );
            txTiratronPrincipal1Rad.Caption := FixValue( Statistics.TiratronPrincipalAnodo1 );
            txTiratronPrincipal2Rad.Caption := FixValue( Statistics.TiratronPrincipalAnodo2 );
          except
          end;
        finally
          fUpdating := false;
        end;
      end;
end;

procedure TFrame_Statistics.Button1Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.MagnetronCaldeo := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button2Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.MagnetronAnodo := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button3Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.TiratronPrincipal := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button4Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.TiratronAuxiliar := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button5Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.MagnetronCaldeo2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button6Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.MagnetronAnodo2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button7Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.TiratronPrincipal2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button8Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.TiratronAuxiliar2 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button9Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.TiratronPrincipalAnodo1 := 0;
  UpdateView;
end;

procedure TFrame_Statistics.Button10Click(Sender: TObject);
begin
  if assigned(Control)
    then Control.TiratronPrincipalAnodo2 := 0;
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

function TFrame_Statistics.GetControl: IStatisticsWS;
begin
  result := fStatistics;
end;

procedure TFrame_Statistics.Init(Value: IStatisticsWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fStatistics := Value;
  fAuthHeader := AuthHeader;

  fTimeUnit := 0;

  Button1.Enabled := assigned(fStatistics);
  Button2.Enabled := assigned(fStatistics);
  Button3.Enabled := assigned(fStatistics);
  Button4.Enabled := assigned(fStatistics);
  Button5.Enabled := assigned(fStatistics);
  Button6.Enabled := assigned(fStatistics);
  Button7.Enabled := assigned(fStatistics);
  Button8.Enabled := assigned(fStatistics);

  UpdateView;
end;

function TFrame_Statistics.GetStatistics: IStatisticsWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fStatistics as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fStatistics;
end;

end.
