unit StatisticsWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, StatisticsWSIntf, CommunicationObj;

type

  TStatisticsWS = class(TCommObj, IStatisticsWS)
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
    procedure Set_SwitchedOnRDA(value: Integer); safecall;
    procedure Set_SwitchedOnRadar(value: Integer); safecall;
    procedure Set_SwitchedOnAcc(value: Integer); safecall;
    procedure Set_SwitchedOnMotorAz(value: Integer); safecall;
    procedure Set_SwitchedOnMotorEl(value: Integer); safecall;
    procedure Set_SwitchedOnTxCaldeo(value: Integer); safecall;
    procedure Set_SwitchedOnTxAnodo(value: Integer); safecall;
    procedure Set_SwitchedOnRx(value: Integer); safecall;
    procedure Set_MagnetronCaldeo(value: Integer); safecall;
    procedure Set_MagnetronAnodo(value: Integer); safecall;
    procedure Set_TiratronPrincipal(value: Integer); safecall;
    procedure Set_TiratronAuxiliar(value: Integer); safecall;
    procedure Set_SwitchedOnTxCaldeo2(value: Integer); safecall;
    procedure Set_SwitchedOnTxAnodo2(value: Integer); safecall;
    procedure Set_SwitchedOnRx2(value: Integer); safecall;
    procedure Set_MagnetronCaldeo2(value: Integer); safecall;
    procedure Set_MagnetronAnodo2(value: Integer); safecall;
    procedure Set_TiratronAuxiliar2(value: Integer); safecall;
    procedure Set_TiratronPrincipal2(value: Integer); safecall;
    procedure Set_TiratronPrincipalAnodo1(value: Integer); safecall;
    procedure Set_TiratronPrincipalAnodo2(value: Integer); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses Users, StatisticsConfig;

{ TStatisticsWS }

function TStatisticsWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Service;
end;

function TStatisticsWS.Get_MagnetronAnodo: Integer;
begin
  result := theStatisticsConfig.MagnetronAnodo;
end;

function TStatisticsWS.Get_MagnetronAnodo2: Integer;
begin
  result := theStatisticsConfig.MagnetronAnodo2;
end;

function TStatisticsWS.Get_MagnetronCaldeo: Integer;
begin
  result := theStatisticsConfig.MagnetronCaldeo;
end;

function TStatisticsWS.Get_MagnetronCaldeo2: Integer;
begin
  result := theStatisticsConfig.MagnetronCaldeo2;
end;

function TStatisticsWS.Get_SwitchedOnAcc: Integer;
begin
  result := theStatisticsConfig.SwitchedOnAcc;
end;

function TStatisticsWS.Get_SwitchedOnMotorAz: Integer;
begin
  result := theStatisticsConfig.SwitchedOnMotorAz;
end;

function TStatisticsWS.Get_SwitchedOnMotorEl: Integer;
begin
  result := theStatisticsConfig.SwitchedOnMotorEl;
end;

function TStatisticsWS.Get_SwitchedOnRadar: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRadar;
end;

function TStatisticsWS.Get_SwitchedOnRDA: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRDA;
end;

function TStatisticsWS.Get_SwitchedOnRx: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRx;
end;

function TStatisticsWS.Get_SwitchedOnRx2: Integer;
begin
  result := theStatisticsConfig.SwitchedOnRx2;
end;

function TStatisticsWS.Get_SwitchedOnTxAnodo: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxAnodo;
end;

function TStatisticsWS.Get_SwitchedOnTxAnodo2: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxAnodo2;
end;

function TStatisticsWS.Get_SwitchedOnTxCaldeo: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxCaldeo;
end;

function TStatisticsWS.Get_SwitchedOnTxCaldeo2: Integer;
begin
  result := theStatisticsConfig.SwitchedOnTxCaldeo2;
end;

function TStatisticsWS.Get_TiratronAuxiliar: Integer;
begin
  result := theStatisticsConfig.TiratronAuxiliar;
end;

function TStatisticsWS.Get_TiratronAuxiliar2: Integer;
begin
  result := theStatisticsConfig.TiratronAuxiliar2;
end;

function TStatisticsWS.Get_TiratronPrincipal: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipal;
end;

function TStatisticsWS.Get_TiratronPrincipal2: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipal2;
end;

function TStatisticsWS.Get_TiratronPrincipalAnodo1: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipalAnodo1;
end;

function TStatisticsWS.Get_TiratronPrincipalAnodo2: Integer;
begin
  result := theStatisticsConfig.TiratronPrincipalAnodo2;
end;

procedure TStatisticsWS.Set_MagnetronAnodo(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagAnodoIndex);
        theStatisticsConfig.MagnetronAnodo := value;
      end;
end;

procedure TStatisticsWS.Set_MagnetronAnodo2(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagAnodo2Index);
        theStatisticsConfig.MagnetronAnodo2 := Value;
      end;
end;

procedure TStatisticsWS.Set_MagnetronCaldeo(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagCaldeoIndex);
        theStatisticsConfig.MagnetronCaldeo := value;
      end;
end;

procedure TStatisticsWS.Set_MagnetronCaldeo2(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(MagCaldeo2Index);
        theStatisticsConfig.MagnetronCaldeo2 := Value;
      end;
end;

procedure TStatisticsWS.Set_SwitchedOnAcc(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnAcc := value;
end;

procedure TStatisticsWS.Set_SwitchedOnMotorAz(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnMotorAz := value;
end;

procedure TStatisticsWS.Set_SwitchedOnMotorEl(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnMotorEl := value;
end;

procedure TStatisticsWS.Set_SwitchedOnRadar(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRadar := value;
end;

procedure TStatisticsWS.Set_SwitchedOnRDA(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRDA := value;
end;

procedure TStatisticsWS.Set_SwitchedOnRx(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRx := value;
end;

procedure TStatisticsWS.Set_SwitchedOnRx2(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnRx2 := Value;
end;

procedure TStatisticsWS.Set_SwitchedOnTxAnodo(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxAnodo := value;
end;

procedure TStatisticsWS.Set_SwitchedOnTxAnodo2(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxAnodo2 := Value;
end;

procedure TStatisticsWS.Set_SwitchedOnTxCaldeo(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxCaldeo := value;
end;

procedure TStatisticsWS.Set_SwitchedOnTxCaldeo2(value: Integer);
begin
  if InControl
    then theStatisticsConfig.SwitchedOnTxCaldeo2 := Value;
end;

procedure TStatisticsWS.Set_TiratronAuxiliar(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirAuxIndex);
        theStatisticsConfig.TiratronAuxiliar := value;
      end;
end;

procedure TStatisticsWS.Set_TiratronAuxiliar2(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirAux2Index);
        theStatisticsConfig.TiratronAuxiliar2 := Value;
      end;
end;

procedure TStatisticsWS.Set_TiratronPrincipal(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrincIndex);
        theStatisticsConfig.TiratronPrincipal := value;
      end;
end;

procedure TStatisticsWS.Set_TiratronPrincipal2(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrinc2Index);
        theStatisticsConfig.TiratronPrincipal2 := Value;
      end;
end;

procedure TStatisticsWS.Set_TiratronPrincipalAnodo1(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrincAnodo1Index);
        theStatisticsConfig.TiratronPrincipalAnodo1 := Value;
      end;
end;

procedure TStatisticsWS.Set_TiratronPrincipalAnodo2(value: Integer);
begin
  if InControl
    then
      begin
        theStatisticsConfig.EndSwitched(TirPrincAnodo2Index);
        theStatisticsConfig.TiratronPrincipalAnodo2 := Value;
      end;
end;

initialization
  InvRegistry.RegisterInvokableClass(TStatisticsWS);

end.
 