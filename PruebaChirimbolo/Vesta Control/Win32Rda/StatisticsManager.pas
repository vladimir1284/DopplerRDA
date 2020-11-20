unit StatisticsManager;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, RDA_TLB, RDAObj;

type
  TStatisticsManager = class(TRDAObject, IStatistics, IStatisticsControl)
  public
    //IStatistics
    function Get_SwitchedOnRDA: Integer; safecall;
    function Get_SwitchedOnRadar: Integer; safecall;
    function Get_SwitchedOnAcc: Integer; safecall;
    function Get_SwitchedOnMotorAz: Integer; safecall;
    function Get_SwitchedOnMotorEl: Integer; safecall;
    function Get_SwitchedOnTxCaldeo: Integer; safecall;
    function Get_SwitchedOnTxAnodo: Integer; safecall;
    function Get_SwitchedOnRx: Integer; safecall;
    function Get_MagnetronCaldeo: Integer; safecall;
    function Get_MagnetronAnodo: Integer; safecall;
    function Get_TiratronPrincipal: Integer; safecall;
    function Get_TiratronAuxiliar: Integer; safecall;
    function Get_SwitchedOnTxCaldeo2: Integer; safecall;
    function Get_SwitchedOnTxAnodo2: Integer; safecall;
    function Get_SwitchedOnRx2: Integer; safecall;
    function Get_MagnetronCaldeo2: Integer; safecall;
    function Get_MagnetronAnodo2: Integer; safecall;
    function Get_TiratronPrincipal2: Integer; safecall;
    function Get_TiratronAuxiliar2: Integer; safecall;
    function Get_TiratronPrincipalAnodo2: Integer; safecall;
    function Get_TiratronPrincipalAnodo1: Integer; safecall;

    //IStatisticsControl
    procedure Set_SwitchedOnRDA(Param1: Integer); safecall;
    procedure Set_SwitchedOnRadar(Param1: Integer); safecall;
    procedure Set_SwitchedOnAcc(Param1: Integer); safecall;
    procedure Set_SwitchedOnMotorAz(Param1: Integer); safecall;
    procedure Set_SwitchedOnMotorEl(Param1: Integer); safecall;
    procedure Set_SwitchedOnTxCaldeo(Param1: Integer); safecall;
    procedure Set_SwitchedOnTxAnodo(Param1: Integer); safecall;
    procedure Set_SwitchedOnRx(Param1: Integer); safecall;
    procedure Set_MagnetronCaldeo(Param1: Integer); safecall;
    procedure Set_MagnetronAnodo(Param1: Integer); safecall;
    procedure Set_TiratronPrincipal(Param1: Integer); safecall;
    procedure Set_TiratronAuxiliar(Param1: Integer); safecall;
    procedure Set_SwitchedOnTxCaldeo2(Value: Integer); safecall;
    procedure Set_SwitchedOnTxAnodo2(Value: Integer); safecall;
    procedure Set_SwitchedOnRx2(Value: Integer); safecall;
    procedure Set_MagnetronCaldeo2(Value: Integer); safecall;
    procedure Set_MagnetronAnodo2(Value: Integer); safecall;
    procedure Set_TiratronAuxiliar2(Value: Integer); safecall;
    procedure Set_TiratronPrincipal2(Value: Integer); safecall;
    procedure Set_TiratronPrincipalAnodo1(Value: Integer); safecall;
    procedure Set_TiratronPrincipalAnodo2(Value: Integer); safecall;
  end;

const
  Class_StatisticsManager: TGUID = '{807980E4-68CF-456A-AB27-C84862D72F40}';

implementation

uses
  ComServ, ElbrusTypes, Elbrus, SysUtils, StatisticsConfig;

{ TStatisticsManager }

function TStatisticsManager.Get_MagnetronAnodo: Integer;
begin
  result := theStatisticsConfig.MagnetronAnodo;
end;

function TStatisticsManager.Get_MagnetronAnodo2: Integer;
begin
  result := theStatisticsConfig.MagnetronAnodo2;
end;

function TStatisticsManager.Get_MagnetronCaldeo: Integer;
begin
  result := theStatisticsConfig.MagnetronCaldeo;
end;

function TStatisticsManager.Get_MagnetronCaldeo2: Integer;
begin
  result := theStatisticsConfig.MagnetronCaldeo2;
end;

function TStatisticsManager.Get_SwitchedOnAcc: Integer;
begin
  result := theStatisticsConfig.SwitchedOnAcc;
end;

function TStatisticsManager.Get_SwitchedOnMotorAz: Integer;
begin
  result := theStatisticsConfig.SwitchedOnMotorAz;
end;

function TStatisticsManager.Get_SwitchedOnMotorEl: Integer;
begin
  result := theStatisticsConfig.SwitchedOnMotorEl;
end;

function TStatisticsManager.Get_SwitchedOnRadar: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRadar;
end;

function TStatisticsManager.Get_SwitchedOnRDA: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRDA;
end;

function TStatisticsManager.Get_SwitchedOnRx: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRx;
end;

function TStatisticsManager.Get_SwitchedOnRx2: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRx2;
end;

function TStatisticsManager.Get_SwitchedOnTxAnodo: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxAnodo;
end;

function TStatisticsManager.Get_SwitchedOnTxAnodo2: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxAnodo2;
end;

function TStatisticsManager.Get_SwitchedOnTxCaldeo: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxCaldeo;
end;

function TStatisticsManager.Get_SwitchedOnTxCaldeo2: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxCaldeo2;
end;

function TStatisticsManager.Get_TiratronAuxiliar: Integer;
begin
  result := theStatisticsConfig.TiratronAuxiliar;
end;

function TStatisticsManager.Get_TiratronAuxiliar2: Integer;
begin
  result := theStatisticsConfig.TiratronAuxiliar2;
end;

function TStatisticsManager.Get_TiratronPrincipal: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipal;
end;

function TStatisticsManager.Get_TiratronPrincipal2: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipal2;
end;

function TStatisticsManager.Get_TiratronPrincipalAnodo1: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipalAnodo1;
end;

function TStatisticsManager.Get_TiratronPrincipalAnodo2: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipalAnodo2;
end;

procedure TStatisticsManager.Set_MagnetronAnodo(Param1: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagAnodoIndex);
        theStatisticsConfig.MagnetronAnodo := Param1;
      end;
end;

procedure TStatisticsManager.Set_MagnetronAnodo2(Value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagAnodo2Index);
        theStatisticsConfig.MagnetronAnodo2 := Value;
      end;
end;

procedure TStatisticsManager.Set_MagnetronCaldeo(Param1: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagCaldeoIndex);
        theStatisticsConfig.MagnetronCaldeo := Param1;
      end;
end;

procedure TStatisticsManager.Set_MagnetronCaldeo2(Value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagCaldeo2Index);
        theStatisticsConfig.MagnetronCaldeo2 := Value;
      end;
end;

procedure TStatisticsManager.Set_SwitchedOnAcc(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnAcc := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnMotorAz(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnMotorAz := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnMotorEl(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnMotorEl := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnRadar(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRadar := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnRDA(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRDA := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnRx(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRx := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnRx2(Value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRx2 := Value;
end;

procedure TStatisticsManager.Set_SwitchedOnTxAnodo(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxAnodo := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnTxAnodo2(Value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxAnodo2 := Value;
end;

procedure TStatisticsManager.Set_SwitchedOnTxCaldeo(Param1: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxCaldeo := Param1;
end;

procedure TStatisticsManager.Set_SwitchedOnTxCaldeo2(Value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxCaldeo2 := Value;
end;

procedure TStatisticsManager.Set_TiratronAuxiliar(Param1: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirAuxIndex);
        theStatisticsConfig.TiratronAuxiliar := Param1;
      end;
end;

procedure TStatisticsManager.Set_TiratronAuxiliar2(Value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirAux2Index);
        theStatisticsConfig.TiratronAuxiliar2 := Value;
      end;
end;

procedure TStatisticsManager.Set_TiratronPrincipal(Param1: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrincIndex);
        theStatisticsConfig.TiratronPrincipal := Param1;
      end;
end;

procedure TStatisticsManager.Set_TiratronPrincipal2(Value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrinc2Index);
        theStatisticsConfig.TiratronPrincipal2 := Value;
      end;
end;

procedure TStatisticsManager.Set_TiratronPrincipalAnodo1(Value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrincAnodo1Index);
        theStatisticsConfig.TiratronPrincipalAnodo1 := Value;
      end;
end;

procedure TStatisticsManager.Set_TiratronPrincipalAnodo2(Value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrincAnodo2Index);
        theStatisticsConfig.TiratronPrincipalAnodo2 := Value;
      end;
end;

initialization
  TComObjectFactory.Create(ComServer, TStatisticsManager, Class_StatisticsManager,
    'StatisticsManager', '', ciMultiInstance, tmApartment);
end.
