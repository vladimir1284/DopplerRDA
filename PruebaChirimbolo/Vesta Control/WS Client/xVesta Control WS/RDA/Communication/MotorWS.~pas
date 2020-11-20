unit MotorWS;

interface

type
  IMotorWS = interface(IInvokable)
  ['{C62D264A-42ED-49B4-8526-9384417B4C8D}']
    function  Get_Posicion: Integer; stdcall;
    function  Get_Velocidad: Integer; stdcall;
    function  Get_Corriente: Integer; stdcall;
    function  Get_SP_Posicion: Integer; stdcall;
    function  Get_SP_Velocidad: Integer; stdcall;
    function  Get_Lazo_Posicion: Boolean; stdcall;
    function  Get_Acc_Listo: Boolean; stdcall;
    function  Get_Marca_Posicion: Integer; stdcall;
    function  Get_Lazo_Sector: Boolean; stdcall;
    function  Get_Lazo_Posicion_K: Single; stdcall;
    function  Get_Lazo_Velocidad_K: Single; stdcall;
    procedure Set_SP_Posicion(const Value: Integer); stdcall;
    procedure Set_SP_Velocidad(const Value: Integer); stdcall;
    procedure Set_Lazo_Posicion(const Value: Boolean); stdcall;
    procedure Set_Lazo_Posicion_K(const Value: Single); stdcall;
    procedure Set_Lazo_Velocidad_K(const Value: Single); stdcall;
    procedure Set_Marca_Posicion(const Value: Integer); stdcall;
    procedure Set_Lazo_Sector(const Value: Boolean); stdcall;

    property Posicion: Integer read Get_Posicion;
    property Velocidad: Integer read Get_Velocidad;
    property Corriente: Integer read Get_Corriente;
    property SP_Posicion: Integer read Get_SP_Posicion write Set_SP_Posicion;
    property SP_Velocidad: Integer read Get_SP_Velocidad write Set_SP_Velocidad;
    property Lazo_Posicion: boolean read Get_Lazo_Posicion write Set_Lazo_Posicion;
    property Acc_Listo: boolean read Get_Acc_Listo;
    property Marca_Posicion: Integer read Get_Marca_Posicion write Set_Marca_Posicion;
    property Lazo_Sector: boolean read Get_Lazo_Sector write Set_Lazo_Sector;
    property Lazo_Posicion_K: Single read Get_Lazo_Posicion_K write Set_Lazo_Posicion_K;
    property Lazo_Velocidad_K: Single read Get_Lazo_Velocidad_K write Set_Lazo_Velocidad_K;    
  end;

implementation

end.
