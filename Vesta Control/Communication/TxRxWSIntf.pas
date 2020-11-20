{ Invokable interface ITxRxWS }

unit TxRxWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  ITxRxWS = interface(IInvokable)
  ['{8F256C8D-4844-411C-8018-B8E492EF5677}']
      // ISynchro
      procedure Set_Pulso_Largo; safecall;
      procedure Set_Pulso_Corto(PRF_Rate: TxDualPulseEnum); safecall;
      function  Get_Frecuencia: Integer; safecall;
      function  Get_Pulse: TxPulseEnum; safecall;
      function  Get_PRF_Rate: TxDualPulseEnum; safecall;

      // ITxStatus
      function Get_Tx_Status: RadarStatusEnum; safecall;
      function Get_Encendido: WordBool; safecall;
      function Get_HV: WordBool; safecall;
      function Get_Listo: WordBool; safecall;
      function Get_Inter_Lock: WordBool; safecall;
      function Get_Ventilacion: WordBool; safecall;
      function Get_Averia: WordBool; safecall;
      function Get_Averia_MPS: WordBool; safecall;
      function Get_Averia_Ventilador: WordBool; safecall;
      function Get_Averia_Fuente_Filamento: WordBool; safecall;
      function Get_Local: WordBool; safecall;

      // IRxStatus
      function Get_Fuente_5V_N: WordBool; safecall;
      function Get_Fuente_5V_P: WordBool; safecall;
      function Get_Fuente_15V_N: WordBool; safecall;
      function Get_Fuente_15V_P: WordBool; safecall;
      function Get_Stalo_Locked: WordBool; safecall;
      function Get_Rx_Status: RadarStatusEnum; safecall;
      function Get_DRX_Ready: WordBool; safecall;

      function Get_Stalo_Temperature: Double; safecall;
      function Get_Stalo_Power: Double; safecall;
      function Get_Stalo_Frequency: Int64; safecall;
      function Get_Stalo_ExtRef: WordBool; safecall;
      function Get_Stalo_Ref_Unlocked: WordBool; safecall;
      function Get_Stalo_RF_Unlocked: WordBool; safecall;
      function Get_Stalo_RF_Output: WordBool; safecall;
      function Get_Stalo_VoltageError: WordBool; safecall;
      function Get_Stalo_Ref_Output: WordBool; safecall;
      function Get_Stalo_Blanking: WordBool; safecall;
      function Get_Stalo_LockRecovery: WordBool; safecall;
      function Get_AFC_Status: WordBool; safecall;
      function Get_Tx_Frequency: Int64; safecall;
      function Get_Tx_IF: Int64; safecall;
      function Get_Tx_PulsePower: Double; safecall;
      function Get_NCO_Frequency: Int64; safecall;
      procedure StartAcquiring; safecall;

      function Get_Potencia_Code: Integer; safecall;
      function Get_Potencia_Unit: Double; safecall;
      function Get_MPS_Volt_Code: Integer; safecall;
      function Get_MPS_Volt_Unit: Double; safecall;
      function Get_MPS_Corr_Code: Integer; safecall;
      function Get_MPS_Corr_Unit: Double; safecall;
      function Get_Fuente_24VN_Code: Integer; safecall;
      function Get_Fuente_24VN_Unit: Double; safecall;
      function Get_Fuente_24VP_Code: Integer; safecall;
      function Get_Fuente_24VP_Unit: Double; safecall;
      function Get_Fuente_50V_Code: Integer; safecall;
      function Get_Fuente_50V_Unit: Double; safecall;
      function Get_Fuente_100V_Code: Integer; safecall;
      function Get_Fuente_100V_Unit: Double; safecall;
      function Get_Fuente_400V_Code: Integer; safecall;
      function Get_Fuente_400V_Unit: Double; safecall;
      function Get_Fuente_Filamento_Code: Integer; safecall;
      function Get_Fuente_Filamento_Unit: Double; safecall;
      // ITxRxStatus
      function  Get_Tx_Pulso: TxPulseEnum; safecall;
      function  Get_Numero: Integer; safecall;
      function  Get_Longitud_Onda: TWaveLengthEnum; safecall;

      // ITxControl
      procedure Tx_Encender; safecall;
      procedure Tx_Apagar; safecall;
      procedure Set_HV(Value: WordBool); safecall;
      // IRxControl
      procedure Rx_Encender; safecall;
      procedure Rx_Apagar; safecall;

      procedure Set_Stalo_Freq(Value: Int64); safecall;
      procedure Set_Stalo_Power(Value: Double); safecall;
      procedure Stalo_Reset; safecall;
      procedure Set_AFC_Status(Value: WordBool); safecall;
      procedure Set_Stalo_Output(Value: WordBool); safecall;
      procedure Stalo_Update; safecall;
      procedure Set_NCO_Frequency(Value: Int64); safecall;


      // ITxRxMeasure
      function  Get_Rango_Tx_Potencia: Integer; safecall;
      function  Get_Sector_Tx_Potencia: Integer; safecall;

      function Get_Rango_Tx_MPS_Volt: Integer; safecall;
      function Get_Rango_Tx_MPS_Corr: Integer; safecall;
      function Get_Rango_Tx_Fuente24V_N: Integer; safecall;
      function Get_Rango_Tx_Fuente24V_P: Integer; safecall;
      function Get_Rango_Tx_Fuente50V: Integer; safecall;
      function Get_Rango_Tx_Fuente400V: Integer; safecall;
      function Get_Rango_Tx_Fuente_Filamento: Integer; safecall;
      function Get_Rango_Tx_Fuente100V: Integer; safecall;

      function Get_Sector_Tx_MPS_Volt: Integer; safecall;
      function Get_Sector_Tx_MPS_Corr: Integer; safecall;
      function Get_Sector_Tx_Fuente24V_N: Integer; safecall;
      function Get_Sector_Tx_Fuente24V_P: Integer; safecall;
      function Get_Sector_Tx_Fuente50V: Integer; safecall;
      function Get_Sector_Tx_Fuente100V: Integer; safecall;
      function Get_Sector_Tx_Fuente400V: Integer; safecall;
      function Get_Sector_Tx_Fuente_Filamento: Integer; safecall;
      // ITxRxMeasureControl
      procedure Set_Rango_Tx_Potencia(Value: Integer); safecall;
      procedure Set_Sector_Tx_Potencia(Value: Integer); safecall;

      procedure Set_Rango_Tx_MPS_Volt(Value: Integer); safecall;
      procedure Set_Rango_Tx_MPS_Corr(Value: Integer); safecall;
      procedure Set_Rango_Tx_Fuente24V_N(Value: Integer); safecall;
      procedure Set_Rango_Tx_Fuente24V_P(Value: Integer); safecall;
      procedure Set_Rango_Tx_Fuente50V(Value: Integer); safecall;
      procedure Set_Rango_Tx_Fuente100V(Value: Integer); safecall;
      procedure Set_Rango_Tx_Fuente400V(Value: Integer); safecall;
      procedure Set_Rango_Tx_Fuente_Filamento(Value: Integer); safecall;

      procedure Set_Sector_Tx_MPS_Volt(Value: Integer); safecall;
      procedure Set_Sector_Tx_MPS_Corr(Value: Integer); safecall;
      procedure Set_Sector_Tx_Fuente24V_N(Value: Integer); safecall;
      procedure Set_Sector_Tx_Fuente24V_P(Value: Integer); safecall;
      procedure Set_Sector_Tx_Fuente50V(Value: Integer); safecall;
      procedure Set_Sector_Tx_Fuente100V(Value: Integer); safecall;
      procedure Set_Sector_Tx_Fuente400V(Value: Integer); safecall;
      procedure Set_Sector_Tx_Fuente_Filamento(Value: Integer); safecall;

      property Local: WordBool read Get_Local;
      property Numero: Integer read Get_Numero;
      property Tx_Pulso: TxPulseEnum read Get_Tx_Pulso;
      property Longitud_Onda: TWaveLengthEnum read Get_Longitud_Onda;

      property Stalo_Power: Double read Get_Stalo_Power write Set_Stalo_Power;
      property Stalo_Frequency: Int64 read Get_Stalo_Frequency write Set_Stalo_Freq;
      property NCO_Frequency: Int64 read Get_NCO_Frequency write Set_NCO_Frequency;
      property Stalo_RF_Output: WordBool read Get_Stalo_RF_Output write Set_Stalo_Output;
      property AFC_Status: WordBool read Get_AFC_Status write Set_AFC_Status;

      property Stalo_Temperature: Double read Get_Stalo_Temperature;
      property Stalo_ExtRef: WordBool read Get_Stalo_ExtRef;
      property Stalo_Ref_Unlocked: WordBool read Get_Stalo_Ref_Unlocked;
      property Stalo_RF_Unlocked: WordBool read Get_Stalo_RF_Unlocked;
      property Stalo_VoltageError: WordBool read Get_Stalo_VoltageError;
      property Stalo_Ref_Output: WordBool read Get_Stalo_Ref_Output;
      property Stalo_Blanking: WordBool read Get_Stalo_Blanking;
      property Stalo_LockRecovery: WordBool read Get_Stalo_LockRecovery;
      property Tx_Frequency: Int64 read Get_Tx_Frequency;
      property Tx_IF: Int64 read Get_Tx_IF;
      property Tx_PulsePower: Double read Get_Tx_PulsePower;
      property Rx_Status: RadarStatusEnum read Get_Rx_Status;
      property Fuente_5V_N: WordBool read Get_Fuente_5V_N;
      property Fuente_5V_P: WordBool read Get_Fuente_5V_P;
      property Fuente_15V_N: WordBool read Get_Fuente_15V_N;
      property Fuente_15V_P: WordBool read Get_Fuente_15V_P;
      property Stalo_Locked: WordBool read Get_Stalo_Locked;
      property DRX_Ready: WordBool read Get_DRX_Ready;

      property Encendido: WordBool read Get_Encendido;
      property HV: WordBool read Get_HV write Set_HV;
      property Listo: WordBool read Get_Listo;
      property Averia_MPS: WordBool read Get_Averia_MPS;

      property Potencia_Code: Integer read Get_Potencia_Code;
      property Potencia_Unit: Double read Get_Potencia_Unit;
      property MPS_Volt_Code: Integer read Get_MPS_Volt_Code;
      property MPS_Volt_Unit: Double read Get_MPS_Volt_Unit;
      property MPS_Corr_Code: Integer read Get_MPS_Corr_Code;
      property MPS_Corr_Unit: Double read Get_MPS_Corr_Unit;
      property Fuente_24VN_Code: Integer read Get_Fuente_24VN_Code;
      property Fuente_24VN_Unit: Double read Get_Fuente_24VN_Unit;
      property Fuente_24VP_Code: Integer read Get_Fuente_24VP_Code;
      property Fuente_24VP_Unit: Double read Get_Fuente_24VP_Unit;
      property Fuente_50V_Code: Integer read Get_Fuente_50V_Code;
      property Fuente_50V_Unit: Double read Get_Fuente_50V_Unit;
      property Fuente_100V_Code: Integer read Get_Fuente_100V_Code;
      property Fuente_100V_Unit: Double read Get_Fuente_100V_Unit;
      property Fuente_400V_Code: Integer read Get_Fuente_400V_Code;
      property Fuente_400V_Unit: Double read Get_Fuente_400V_Unit;
      property Fuente_Filamento_Code: Integer read Get_Fuente_Filamento_Code;
      property Fuente_Filamento_Unit: Double read Get_Fuente_Filamento_Unit;
      property Tx_Status: RadarStatusEnum read Get_Tx_Status;
      property Inter_Lock: WordBool read Get_Inter_Lock;
      property Ventilacion: WordBool read Get_Ventilacion;
      property Averia_Ventilador: WordBool read Get_Averia_Ventilador;
      property Averia_Fuente_Filamento: WordBool read Get_Averia_Fuente_Filamento;

      property Rango_Tx_Potencia: Integer          read Get_Rango_Tx_Potencia          write Set_Rango_Tx_Potencia;
      property Sector_Tx_Potencia: Integer         read Get_Sector_Tx_Potencia         write Set_Sector_Tx_Potencia;
      property Rango_Tx_MPS_Volt: Integer          read Get_Rango_Tx_MPS_Volt          write Set_Rango_Tx_MPS_Volt;
      property Sector_Tx_MPS_Volt: Integer         read Get_Sector_Tx_MPS_Volt         write Set_Sector_Tx_MPS_Volt;
      property Rango_Tx_MPS_Corr: Integer          read Get_Rango_Tx_MPS_Corr          write Set_Rango_Tx_MPS_Corr;
      property Sector_Tx_MPS_Corr: Integer         read Get_Sector_Tx_MPS_Corr         write Set_Sector_Tx_MPS_Corr;
      property Rango_Tx_Fuente24V_N: Integer       read Get_Rango_Tx_Fuente24V_N       write Set_Rango_Tx_Fuente24V_N;
      property Sector_Tx_Fuente24V_N: Integer      read Get_Sector_Tx_Fuente24V_N      write Set_Sector_Tx_Fuente24V_N;
      property Rango_Tx_Fuente24V_P: Integer       read Get_Rango_Tx_Fuente24V_P       write Set_Rango_Tx_Fuente24V_P;
      property Sector_Tx_Fuente24V_P: Integer      read Get_Sector_Tx_Fuente24V_P      write Set_Sector_Tx_Fuente24V_P;
      property Sector_Tx_Fuente50V: Integer        read Get_Sector_Tx_Fuente50V        write Set_Sector_Tx_Fuente50V;
      property Rango_Tx_Fuente50V: Integer         read Get_Rango_Tx_Fuente50V         write Set_Rango_Tx_Fuente50V;
      property Sector_Tx_Fuente100V: Integer       read Get_Sector_Tx_Fuente100V       write Set_Sector_Tx_Fuente100V;
      property Rango_Tx_Fuente100V: Integer        read Get_Rango_Tx_Fuente100V        write Set_Rango_Tx_Fuente100V;
      property Rango_Tx_Fuente400V: Integer        read Get_Rango_Tx_Fuente400V        write Set_Rango_Tx_Fuente400V;
      property Sector_Tx_Fuente400V: Integer       read Get_Sector_Tx_Fuente400V       write Set_Sector_Tx_Fuente400V;
      property Sector_Tx_Fuente_Filamento: Integer read Get_Sector_Tx_Fuente_Filamento write Set_Sector_Tx_Fuente_Filamento;
      property Rango_Tx_Fuente_Filamento: Integer  read Get_Rango_Tx_Fuente_Filamento  write Set_Rango_Tx_Fuente_Filamento;
  end;

implementation

end.
