unit TxRxCh1WSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, TxRxCh1WSIntf, TxRxWSIntf, CommunicationObj;

type
  TTxRxCh1WS = class(TCommObj, ITxRxCh1WS)
  public
  // ITxRxStatus
    function  Get_Tx_Caldeo: boolean; safecall;
    function  Get_Tx_Anodo: boolean; safecall;
    function  Get_Tx_Listo: boolean; safecall;
    function  Get_Tx_Averia: boolean; safecall;
    function  Get_Rx_Caldeo: boolean; safecall;
    function  Get_Rx_Anodo: boolean; safecall;
    function  Get_Rx_Averia: boolean; safecall;
    function  Get_Tx_Pulso: TxPulseEnum; safecall;
    function  Get_TxRx_Ajuste: boolean; safecall;
    function  Get_Tx_Potencia: Integer; safecall;
    function  Get_Rx_Sintonia: Integer; safecall;
    function  Get_Rx_Ganancia: Integer; safecall;
    function  Get_Rx_Ruido: Integer; safecall;
    function  Get_Numero: Integer; safecall;
    function  Get_Longitud_Onda: TWaveLengthEnum; safecall;
    function  Get_Rx_Correccion: boolean; safecall;
    function  Get_Tx_Standby: boolean; safecall;
    function  Get_Tx_Potencia_Voltage: Single; safecall;
    function  Get_Rx_Sintonia_Voltage: Single; safecall;
    function  Get_Rx_Ganancia_Voltage: Single; safecall;
    function  Get_Rx_Ruido_Voltage: Single; safecall;
    // ITxRxControl
    procedure Tx_Encender; safecall;
    procedure Tx_Apagar; safecall;
    procedure Set_Tx_Standby(value: boolean); safecall;
    procedure Rx_Encender; safecall;
    procedure Rx_Apagar; safecall;
    procedure Set_Rx_Correccion(value: boolean); safecall;
    procedure Set_Trabajo(value: boolean); safecall;
    // ITxRxMRL5M
    function  Get_Rx_CMG: boolean; safecall;
    procedure Set_Rx_CMG(Value: boolean); safecall;
    procedure Rx_Ganancia_N; safecall;
    procedure Rx_Ganancia_P; safecall;
    function  Get_Rx_CMS: boolean; safecall;
    procedure Set_Rx_CMS(Value: boolean); safecall;
    procedure Rx_Sintonia_N; safecall;
    procedure Rx_Sintonia_P; safecall;
    //ITxRxMeasure
    function Get_Rango_Tx_Potencia: Integer; safecall;
    function Get_Rango_Rx_Sintonia: Integer; safecall;
    function Get_Rango_Rx_Ganancia: Integer; safecall;
    function Get_Rango_Rx_Ruido: Integer; safecall;
    function Get_Sector_Tx_Potencia: Integer; safecall;
    function Get_Sector_Rx_Sintonia: Integer; safecall;
    function Get_Sector_Rx_Ganancia: Integer; safecall;
    function Get_Sector_Rx_Ruido: Integer; safecall;

    //ITxRxMeasureControl
    procedure Set_Rango_Tx_Potencia(value: Integer); safecall;
    procedure Set_Rango_Rx_Sintonia(value: Integer); safecall;
    procedure Set_Rango_Rx_Ganancia(value: Integer); safecall;
    procedure Set_Rango_Rx_Ruido(value: Integer); safecall;
    procedure Set_Sector_Tx_Potencia(value: Integer); safecall;
    procedure Set_Sector_Rx_Sintonia(value: Integer); safecall;
    procedure Set_Sector_Rx_Ganancia(value: Integer); safecall;
    procedure Set_Sector_Rx_Ruido(value: Integer); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses Elbrus, ElbrusTypes, Users;

{ TTxRxCh1WS }

function TTxRxCh1WS.Get_Longitud_Onda: TWaveLengthEnum;
begin
  Result := wl_3cm;
end;

function TTxRxCh1WS.Get_Numero: Integer;
begin
  Result := 1;
end;

function TTxRxCh1WS.Get_Rx_Anodo: boolean;
begin
  Result := (Snapshot.Digital_Input and di_Rx1_Anodo) <> 0;
end;

function TTxRxCh1WS.Get_Rx_Averia: boolean;
begin
  Result := (Snapshot.Digital_Input and di_Rx1_Averia) <> 0;
end;

function TTxRxCh1WS.Get_Rx_Caldeo: boolean;
begin
  Result := (Snapshot.Digital_Input and di_Rx1_Caldeo) <> 0;
end;

function TTxRxCh1WS.Get_Rx_Correccion: boolean;
begin
  Result := (Snapshot.Digital_Output and do_Rx1_Correccion) <> 0;
end;

function TTxRxCh1WS.Get_Rx_Ganancia: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Rx1_Ganancia];
end;

function TTxRxCh1WS.Get_Rx_Ganancia_Voltage: Single;
begin
  Result := BinaryToVoltage(ai_Rx1_Ganancia);
end;

function TTxRxCh1WS.Get_Rx_Ruido: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Rx1_Ruido];
end;

function TTxRxCh1WS.Get_Rx_Ruido_Voltage: Single;
begin
  Result := BinaryToVoltage(ai_Rx1_Ruido);
end;

function TTxRxCh1WS.Get_Rx_Sintonia: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Rx1_Sintonia];
end;

function TTxRxCh1WS.Get_Rx_Sintonia_Voltage: Single;
begin
  result := BinaryToVoltage( ai_Rx1_Sintonia );
end;

function TTxRxCh1WS.Get_Tx_Anodo: boolean;
begin
  Result := (Snapshot.Digital_Input and di_Tx1_Anodo) <> 0;
end;

function TTxRxCh1WS.Get_Tx_Averia: boolean;
begin
  Result := (Snapshot.Digital_Input and di_Tx1_Averia) <> 0;
end;

function TTxRxCh1WS.Get_Tx_Caldeo: boolean;
begin
  Result := (Snapshot.Digital_Input and di_Tx1_Caldeo) <> 0;
end;

function TTxRxCh1WS.Get_Tx_Listo: boolean;
begin
  Result := (Snapshot.Digital_Input and di_Tx1_Listo) <> 0;
end;

function TTxRxCh1WS.Get_Tx_Potencia: Integer;
begin
  Result := Snapshot.Analog_Input[ai_Tx1_Potencia];
end;

function TTxRxCh1WS.Get_Tx_Potencia_Voltage: Single;
begin
  result := BinaryToKW( Snapshot.Analog_Input[ai_Tx1_Potencia] );
end;

function TTxRxCh1WS.Get_Tx_Pulso: TxPulseEnum;
begin
  result := TxPulseEnum(Snapshot.Pulse);
end;

function TTxRxCh1WS.Get_Tx_Standby: boolean;
begin
  Result := (Snapshot.Digital_Output and do_Tx1_Standby) <> 0;
end;

function TTxRxCh1WS.Get_TxRx_Ajuste: boolean;
begin
  Result := (Snapshot.Digital_Input and di_TxRx1_Ajuste) <> 0;
end;

procedure TTxRxCh1WS.Rx_Apagar;
begin
  if InControl
    then Elbrus.Rx1_Apagar
end;

procedure TTxRxCh1WS.Rx_Encender;
begin
  if InControl
    then Elbrus.Rx1_Encender
end;

procedure TTxRxCh1WS.Set_Rx_Correccion(value: boolean);
begin
  if InControl
    then Elbrus.Rx1_Correccion(value);
end;

procedure TTxRxCh1WS.Set_Trabajo(value: boolean);
begin
  if InControl
    then
      begin
        { TODO : Para Pilon quitar el comentario }
//        Elbrus.Tx1_Standby(true);
        Elbrus.TxRx1_Trabajo(value);
      end;
end;

procedure TTxRxCh1WS.Set_Tx_Standby(value: boolean);
begin
  if InControl
    then Elbrus.Tx1_Standby(value);
end;

procedure TTxRxCh1WS.Tx_Apagar;
begin
  if InControl
    then Elbrus.Tx1_Apagar;
end;

procedure TTxRxCh1WS.Tx_Encender;
begin
  if InControl
    then Elbrus.Tx1_Encender;
end;

function TTxRxCh1WS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Operator;
end;

function TTxRxCh1WS.Get_Rx_CMG: boolean;
begin
  Result := (Snapshot.Digital_Output and do_Rx1_CMG) <> 0;
end;

function TTxRxCh1WS.Get_Rx_CMS: boolean;
begin
  Result := (Snapshot.Digital_Output and do_Rx1_CMS) <> 0;
end;

procedure TTxRxCh1WS.Rx_Ganancia_N;
begin
  if InControl
    then Elbrus.Rx1_Ganancia_N;
end;

procedure TTxRxCh1WS.Rx_Ganancia_P;
begin
  if InControl
    then Elbrus.Rx1_Ganancia_P;
end;

procedure TTxRxCh1WS.Rx_Sintonia_N;
begin
  if InControl
    then Elbrus.Rx1_Sintonia_N;
end;

procedure TTxRxCh1WS.Rx_Sintonia_P;
begin
  if InControl
    then Elbrus.Rx1_Sintonia_P;
end;

procedure TTxRxCh1WS.Set_Rx_CMG(Value: boolean);
begin
  if InControl
    then Elbrus.Rx1_CMG(Value);
end;

procedure TTxRxCh1WS.Set_Rx_CMS(Value: boolean);
begin
  if InControl
    then Elbrus.Rx1_CMS(Value);
end;

function TTxRxCh1WS.Get_Rango_Rx_Ganancia: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Rx1_Ganancia]);
end;

function TTxRxCh1WS.Get_Rango_Rx_Ruido: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Rx1_Ruido]);
end;

function TTxRxCh1WS.Get_Rango_Rx_Sintonia: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Rx1_Sintonia]);
end;

function TTxRxCh1WS.Get_Rango_Tx_Potencia: Integer;
begin
  Result := integer(Snapshot.AI_Range[ai_Tx1_Potencia]);
end;

function TTxRxCh1WS.Get_Sector_Rx_Ganancia: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Rx1_Ganancia]);
end;

function TTxRxCh1WS.Get_Sector_Rx_Ruido: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Rx1_Ruido]);
end;

function TTxRxCh1WS.Get_Sector_Rx_Sintonia: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Rx1_Sintonia]);
end;

function TTxRxCh1WS.Get_Sector_Tx_Potencia: Integer;
begin
  Result := integer(Snapshot.AI_Sector[ai_Tx1_Potencia]);
end;

procedure TTxRxCh1WS.Set_Rango_Rx_Ganancia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Rx1_Ganancia, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Rango_Rx_Ruido(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Rx1_Ruido, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Rango_Rx_Sintonia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Rx1_Sintonia, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Rango_Tx_Potencia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Range(ai_Tx1_Potencia, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Sector_Rx_Ganancia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Rx1_Ganancia, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Sector_Rx_Ruido(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Rx1_Ruido, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Sector_Rx_Sintonia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Rx1_Sintonia, TAIRange(value));
end;

procedure TTxRxCh1WS.Set_Sector_Tx_Potencia(value: Integer);
begin
  if InControl
    then Elbrus.Set_AI_Sector(ai_Tx1_Potencia, TAIRange(value));
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TTxRxCh1WS);

end.
 