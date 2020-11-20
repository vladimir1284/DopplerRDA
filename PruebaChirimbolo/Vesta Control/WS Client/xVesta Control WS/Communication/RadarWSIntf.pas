unit RadarWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  IRadarWS = interface(IInvokable)
  ['{67A4EA08-C272-44E0-A63A-6918E7E61ED5}']
    function Get_Red_Listo: WordBool; safecall;
    function Get_Radar_On_P: WordBool; safecall;
    function Get_Radar_On_N: WordBool; safecall;
    function Get_Muestra_P: Integer; safecall;
    function Get_Muestra_N: Integer; safecall;
    function Get_Radar_Encender: WordBool; safecall;
    function Get_Radar_Apagar: WordBool; safecall;
    function Get_Rango_Muestra_P: Integer; safecall;
    function Get_Rango_Muestra_N: Integer; safecall;
    function Get_Sector_Muestra_P: Integer; safecall;
    function Get_Sector_Muestra_N: Integer; safecall;

    procedure Encender_Radar; safecall;
    procedure Apagar_Radar; safecall;
    procedure Set_Rango_Muestra_P(Param1: Integer); safecall;
    procedure Set_Rango_Muestra_N(Param1: Integer); safecall;
    procedure Set_Sector_Muestra_P(Param1: Integer); safecall;
    procedure Set_Sector_Muestra_N(Param1: Integer); safecall;

    property Red_Listo: WordBool read Get_Red_Listo;
    property Radar_On_P: WordBool read Get_Radar_On_P;
    property Radar_On_N: WordBool read Get_Radar_On_N;
    property Muestra_P: Integer read Get_Muestra_P;
    property Muestra_N: Integer read Get_Muestra_N;
    property Radar_Encender: WordBool read Get_Radar_Encender;
    property Radar_Apagar: WordBool read Get_Radar_Apagar;
    property Rango_Muestra_P: Integer read Get_Rango_Muestra_P write Set_Rango_Muestra_P;
    property Rango_Muestra_N: Integer read Get_Rango_Muestra_N write Set_Rango_Muestra_N;
    property Sector_Muestra_P: Integer read Get_Sector_Muestra_P write Set_Sector_Muestra_P;
    property Sector_Muestra_N: Integer read Get_Sector_Muestra_N write Set_Sector_Muestra_N;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(IRadarWS));

end.
 