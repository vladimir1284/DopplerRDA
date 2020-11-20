{ Invokable interface IMotorWS }

unit MotorWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  IMotorWS = interface(IInvokable)
  ['{78F62F11-00BC-4D52-9E52-20F05322EC96}']
  //Status
    function  Get_Posicion: Integer; safecall;
    function  Get_Velocidad: Integer; safecall;
    function  Get_Corriente: Integer; safecall; //
    function  Get_SP_Posicion: Integer; safecall;
    function  Get_SP_Velocidad: Integer; safecall;
    function  Get_Lazo_Posicion: boolean; safecall;
    function  Get_Acc_Listo: boolean; safecall;
    function  Get_Marca_Posicion: Integer; safecall;
    function  Get_Lazo_Sector: boolean; safecall;
    function  Get_Lazo_Posicion_K: Single; safecall;
    function  Get_Lazo_Velocidad_K: Single; safecall;
  //Control
    procedure Set_SP_Posicion(Value: Integer); safecall;
    procedure Set_SP_Velocidad(Value: Integer); safecall;
    procedure Set_Lazo_Posicion(Value: boolean); safecall;
    procedure Set_Lazo_Posicion_K(Value: Single); safecall;
    procedure Set_Lazo_Velocidad_K(Value: Single); safecall;
    procedure Set_Marca_Posicion(Value: Integer); safecall;
    procedure Set_Lazo_Sector(Value: boolean); safecall;

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
 