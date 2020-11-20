unit CalibrationWS;

interface

uses
  InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CommonObjs;

type
  ICalibrationWS = interface(IInvokable)
  ['{B839E2BA-F2DC-4478-914D-5B5450EE2955}']
    function  Get_Codigos: TCalibrationTable; stdcall;
    function  Get_Potencia: Integer; stdcall;
    function  Get_CRadarPL: Single; stdcall;
    function  Get_CRadarPC: Single; stdcall;
    function  Get_PotMetPL: Single; stdcall;
    function  Get_PotMetPC: Single; stdcall;
    procedure Set_Codigos(const Value: TCalibrationTable); stdcall;
    procedure Set_Potencia(const Value: Integer); stdcall;
    procedure Set_CRadarPL(const Value: Single); stdcall;
    procedure Set_CRadarPC(const Value: Single); stdcall;

    property Codigos: TCalibrationTable read Get_Codigos   write Set_Codigos;
    property Potencia: Integer          read Get_Potencia  write Set_Potencia;
    property CRadarPL: Single           read Get_CRadarPL  write Set_CRadarPL;
    property CRadarPC: Single           read Get_CRadarPC  write Set_CRadarPC;
    property PotMetPL: Single           read Get_PotMetPL;
    property PotMetPC: Single           read Get_PotMetPC;
  end;

implementation

end.
