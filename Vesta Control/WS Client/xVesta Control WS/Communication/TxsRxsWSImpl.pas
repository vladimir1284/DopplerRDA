{ Invokable implementation File for TTxsRxsWS which implements ITxsRxsWS }

unit TxsRxsWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, TxsRxsWSIntf, CommunicationObj, Advantech;

type

  { TTxsRxsWS }
  TTxsRxsWS = class(TCommObj, ITxsRxsWS)
  public
    // TxsRxs
    function Get_TxRxCount: Integer; safecall;
    function Get_Pulso_Unico: boolean; safecall;
    function Get_Sincro_Unico: boolean; safecall;
    // ISynchro
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto; safecall;
    function  Get_Frecuencia: Integer; safecall;
    function  Get_Fuente: TSyncSourceEnum; safecall;
    procedure Set_Fuente(Value: TSyncSourceEnum); safecall;
    // IPulse
    function Get_N1CH1: Integer; safecall;
    function Get_N2: Integer; safecall;
    function Get_N3: Integer; safecall;
    function Get_N4: Integer; safecall;
    function Get_N5: Integer; safecall;
    function Get_N6: Integer; safecall;
    function Get_N1CH2: Integer; safecall;
    function Get_TxRxPulso: TxPulseEnum; safecall;
    // IPulseControl
    procedure Set_N1CH1(value: Integer); safecall;
    procedure Set_N2(value: Integer); safecall;
    procedure Set_N3(value: Integer); safecall;
    procedure Set_N4(value: Integer); safecall;
    procedure Set_N5(value: Integer); safecall;
    procedure Set_N6(value: Integer); safecall;
    procedure Set_N1CH2(value: Integer); safecall;
    procedure Set_Frecuencia(value: Integer); safecall;
  end;

implementation

uses Radars, Description, Config, Elbrus, ElbrusTypes;

function TTxsRxsWS.Get_Frecuencia: Integer;
begin
  Result := Snapshot.Trigger_Rate;
end;

function TTxsRxsWS.Get_Fuente: TSyncSourceEnum;
begin
  Result := TSyncSourceEnum(Snapshot.Trigger_Source);
end;

function TTxsRxsWS.Get_N1CH1: Integer;
begin
  Result := Snapshot.Counter_Times[N1CH1_Counter]
end;

function TTxsRxsWS.Get_N1CH2: Integer;
begin
  Result := Snapshot.Counter_Times[N1CH2_Counter];
end;

function TTxsRxsWS.Get_N2: Integer;
begin
  Result := Snapshot.Counter_Times[N2_Counter];
end;

function TTxsRxsWS.Get_N3: Integer;
begin
  Result := Snapshot.Counter_Times[N3_Counter];
end;

function TTxsRxsWS.Get_N4: Integer;
begin
  Result := Snapshot.Counter_Times[N4_Counter];
end;

function TTxsRxsWS.Get_N5: Integer;
begin
  Result := Snapshot.Counter_Times[N5_Counter];
end;

function TTxsRxsWS.Get_N6: Integer;
begin
  Result := Snapshot.Counter_Times[N6_Counter];
end;

function TTxsRxsWS.Get_Pulso_Unico: boolean;
begin
  Result := true;
end;

function TTxsRxsWS.Get_Sincro_Unico: boolean;
begin
  Result := true;
end;

function TTxsRxsWS.Get_TxRxCount: Integer;
begin
  case Radars.Find(TRadar(theConfiguration.RadarID)).Brand of
    rbRC32B : Result := 1;
    rbMRL5,
    rbMRL5M : Result := 2;
    else Result := 0;
  end;
end;

function TTxsRxsWS.Get_TxRxPulso: TxPulseEnum;
begin
  result := TxPulseEnum(Snapshot.Pulse);
end;

procedure TTxsRxsWS.Set_Frecuencia(value: Integer);
begin
  if InControl
    then Elbrus.Set_Frecuencia_N1(Value);
end;

procedure TTxsRxsWS.Set_Fuente(Value: TSyncSourceEnum);
begin
  if InControl
    then Elbrus.Set_Fuente_N1(Ord(Value));
end;

procedure TTxsRxsWS.Set_N1CH1(value: Integer);
begin
  if InControl
    then Elbrus.Set_Counter_Time(N1CH1_Counter, Value);
end;

procedure TTxsRxsWS.Set_N1CH2(value: Integer);
begin
  if InControl
    then Elbrus.Set_Counter_Time(N1CH2_Counter, Value);
end;

procedure TTxsRxsWS.Set_N2(value: Integer);
begin
  if InControl
    then Elbrus.Set_Counter_Time(N2_Counter, Value);
end;

procedure TTxsRxsWS.Set_N3(value: Integer);
begin
  if InControl
    then Elbrus.Set_Counter_Time(N3_Counter, Value);
end;

procedure TTxsRxsWS.Set_N4(value: Integer);
begin
  if InControl
    then Elbrus.Set_Counter_Time(N4_Counter, Value);
end;

procedure TTxsRxsWS.Set_N5(value: Integer);
begin
  if InControl
    then Elbrus.Set_Counter_Time(N5_Counter, Value);
end;

procedure TTxsRxsWS.Set_N6(value: Integer);
begin
  if InControl
    then Elbrus.Set_Counter_Time(N6_Counter, Value);
end;

procedure TTxsRxsWS.Set_Pulso_Corto;
begin
  if InControl
    then Elbrus.Pulso_Corto;
end;

procedure TTxsRxsWS.Set_Pulso_Largo;
begin
  if InControl
    then Elbrus.Pulso_Largo;
end;


initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TTxsRxsWS);

end.
 