{ Invokable interface IAntennaWS }

unit AntennaWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, ElbrusTypes, Elbrus, CommunicationObj;

type
  { Invokable interfaces must derive from IInvokable }
  IAntennaWS = interface(IInvokable)
  ['{E5342DDF-910D-4454-AE9B-B270C4865639}']
    //Status
    function Get_Local: WordBool; safecall;
    function Get_Ventilacion: WordBool; safecall;
    function Get_Status: RadarStatusEnum; safecall;

    function Get_SyncMark: Integer; safecall;
    function Get_SyncMarkDirection: WordBool; safecall;

    function Get_Excitacion: WordBool; safecall;
    function Get_Limite_N: WordBool; safecall;
    function Get_Limite_P: WordBool; safecall;
    function Get_Cupula_Cerrada: WordBool; safecall;

    function Get_Fuente_Exitacion_Code: Integer; safecall;
    function Get_Fuente_Exitacion_Unit: Double; safecall;
    function Get_Fuente_5V_Code: Integer; safecall;
    function Get_Fuente_5V_Unit: Double; safecall;
    function Get_Fuente_12V_Code: Integer; safecall;
    function Get_Fuente_24V_Code: Integer; safecall;
    function Get_Fuente_24V_Unit: Double; safecall;
    function Get_Fuente_12V_Unit: Double; safecall;

    function Get_Rango_Fuente_5V: Integer; safecall;
    function Get_Rango_Fuente_12V: Integer; safecall;
    function Get_Rango_Fuente_24V: Integer; safecall;
    function Get_Rango_Fuente_Excitacion: Integer; safecall;
    function Get_Sector_Fuente_5V: Integer; safecall;
    function Get_Sector_Fuente_12V: Integer; safecall;
    function Get_Sector_Fuente_24V: Integer; safecall;
    function Get_Sector_Fuente_Excitacion: Integer; safecall;
    //Control
    procedure Encender_Acc; safecall;
    procedure Apagar_Acc; safecall;
    procedure Alarma_Sonora(Tiempo: Integer); safecall;
    procedure Set_SyncMark(direction: WordBool; rays: Shortint); safecall;

    procedure Set_Rango_Fuente_5V(Value: Integer); safecall;
    procedure Set_Sector_Fuente_5V(Value: Integer); safecall;
    procedure Set_Sector_Fuente_12V(Value: Integer); safecall;
    procedure Set_Rango_Fuente_12V(Value: Integer); safecall;
    procedure Set_Rango_Fuente_24V(Value: Integer); safecall;
    procedure Set_Sector_Fuente_24V(Value: Integer); safecall;
    procedure Set_Rango_Fuente_Excitacion(Value: Integer); safecall;
    procedure Set_Sector_Fuente_Excitacion(Value: Integer); safecall;
    //properties
    property Excitacion: WordBool read Get_Excitacion;
    property Limite_N: WordBool read Get_Limite_N;
    property Limite_P: WordBool read Get_Limite_P;
    property Cupula_Cerrada: WordBool read Get_Cupula_Cerrada;
    property SyncMark: Integer read Get_SyncMark;
    property SyncMarkDirection: WordBool read Get_SyncMarkDirection;
    property Fuente_Exitacion_Code: Integer read Get_Fuente_Exitacion_Code;
    property Fuente_Exitacion_Unit: Double read Get_Fuente_Exitacion_Unit;
    property Fuente_5V_Code: Integer read Get_Fuente_5V_Code;
    property Fuente_5V_Unit: Double read Get_Fuente_5V_Unit;
    property Fuente_12V_Code: Integer read Get_Fuente_12V_Code;
    property Fuente_24V_Code: Integer read Get_Fuente_24V_Code;
    property Fuente_24V_Unit: Double read Get_Fuente_24V_Unit;
    property Fuente_12V_Unit: Double read Get_Fuente_12V_Unit;

    property Rango_Fuente_5V: Integer          read Get_Rango_Fuente_5V          write Set_Rango_Fuente_5V;
    property Sector_Fuente_5V: Integer         read Get_Sector_Fuente_5V         write Set_Sector_Fuente_5V;
    property Rango_Fuente_12V: Integer         read Get_Rango_Fuente_12V         write Set_Rango_Fuente_12V;
    property Sector_Fuente_12V: Integer        read Get_Sector_Fuente_12V        write Set_Sector_Fuente_12V;
    property Rango_Fuente_24V: Integer         read Get_Rango_Fuente_24V         write Set_Rango_Fuente_24V;
    property Sector_Fuente_24V: Integer        read Get_Sector_Fuente_24V        write Set_Sector_Fuente_24V;
    property Rango_Fuente_Excitacion: Integer  read Get_Rango_Fuente_Excitacion  write Set_Rango_Fuente_Excitacion;
    property Sector_Fuente_Excitacion: Integer read Get_Sector_Fuente_Excitacion write Set_Sector_Fuente_Excitacion;

    property Local: WordBool read Get_Local;
    property Ventilacion: WordBool read Get_Ventilacion;

  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IAntennaWS));

end.
 