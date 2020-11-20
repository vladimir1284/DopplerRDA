{ Invokable interface ITxRxWS }

unit TxRxWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  ITxRxWS = interface(IInvokable)
  ['{8F256C8D-4844-411C-8018-B8E492EF5677}']
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

      property Tx_Caldeo: boolean read Get_Tx_Caldeo;
      property Tx_Anodo: boolean read Get_Tx_Anodo;
      property Tx_Listo: boolean read Get_Tx_Listo;
      property Tx_Averia: boolean read Get_Tx_Averia;
      property Rx_Caldeo: boolean read Get_Rx_Caldeo;
      property Rx_Anodo: boolean read Get_Rx_Anodo;
      property Rx_Averia: boolean read Get_Rx_Averia;
      property TxRx_Ajuste: boolean read Get_TxRx_Ajuste;
      property Tx_Potencia: Integer read Get_Tx_Potencia;
      property Rx_Sintonia: Integer read Get_Rx_Sintonia;
      property Rx_Ganancia: Integer read Get_Rx_Ganancia;
      property Rx_Ruido: Integer read Get_Rx_Ruido;
      property Numero: Integer read Get_Numero;
      property Rx_Correccion: boolean read Get_Rx_Correccion write Set_Rx_Correccion;
      property Tx_Standby: boolean read Get_Tx_Standby write Set_Tx_Standby;
      property Tx_Potencia_Voltage: Single read Get_Tx_Potencia_Voltage;
      property Rx_Sintonia_Voltage: Single read Get_Rx_Sintonia_Voltage;
      property Rx_Ganancia_Voltage: Single read Get_Rx_Ganancia_Voltage;
      property Rx_Ruido_Voltage: Single read Get_Rx_Ruido_Voltage;
      property Tx_Pulso: TxPulseEnum read Get_Tx_Pulso;
      property Longitud_Onda: TWaveLengthEnum read Get_Longitud_Onda;

      property Trabajo: boolean write Set_Trabajo;

     // ITxRxMRL5M
      function  Get_Rx_CMG: boolean; safecall;
      procedure Set_Rx_CMG(Value: boolean); safecall;
      procedure Rx_Ganancia_N; safecall;
      procedure Rx_Ganancia_P; safecall;
      function  Get_Rx_CMS: boolean; safecall;
      procedure Set_Rx_CMS(Value: boolean); safecall;
      procedure Rx_Sintonia_N; safecall;
      procedure Rx_Sintonia_P; safecall;

      property Rx_CMG: boolean read Get_Rx_CMG write Set_Rx_CMG;
      property Rx_CMS: boolean read Get_Rx_CMS write Set_Rx_CMS;

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

      property Rango_Tx_Potencia: Integer read Get_Rango_Tx_Potencia write Set_Rango_Tx_Potencia;
      property Rango_Rx_Sintonia: Integer read Get_Rango_Rx_Sintonia write Set_Rango_Rx_Sintonia;
      property Rango_Rx_Ganancia: Integer read Get_Rango_Rx_Ganancia write Set_Rango_Rx_Ganancia;
      property Rango_Rx_Ruido: Integer read Get_Rango_Rx_Ruido write Set_Rango_Rx_Ruido;
      property Sector_Tx_Potencia: Integer read Get_Sector_Tx_Potencia write Set_Sector_Tx_Potencia;
      property Sector_Rx_Sintonia: Integer read Get_Sector_Rx_Sintonia write Set_Sector_Rx_Sintonia;
      property Sector_Rx_Ganancia: Integer read Get_Sector_Rx_Ganancia write Set_Sector_Rx_Ganancia;
      property Sector_Rx_Ruido: Integer read Get_Sector_Rx_Ruido write Set_Sector_Rx_Ruido;
  end;

implementation

end.
 