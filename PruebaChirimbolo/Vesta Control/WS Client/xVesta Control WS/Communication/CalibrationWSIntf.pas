{ Invokable interface ICalibrationWS }

unit CalibrationWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  ICalibrationWS = interface(IInvokable)
  ['{B585A686-C49A-4F5B-AD45-54802E973ECC}']
    function  Get_Codigos: TCalibrationTable; safecall;
    function  Get_Potencia: Integer;   safecall;
    function  Get_CRadarPL: Single;    safecall;
    function  Get_CRadarPC: Single;    safecall;
    function  Get_PotMetPL: Single;    safecall;
    function  Get_PotMetPC: Single;    safecall;
  // ICalibrationControl
    procedure Set_Codigos(Value: TCalibrationTable); safecall;
    procedure Set_Potencia(Value: Integer); safecall;
    procedure Set_CRadarPL(Value: Single); safecall;
    procedure Set_CRadarPC(Value: Single); safecall;

    property Codigos: TCalibrationTable read Get_Codigos   write Set_Codigos;
    property Potencia: Integer          read Get_Potencia  write Set_Potencia;
    property CRadarPL: Single           read Get_CRadarPL  write Set_CRadarPL;
    property CRadarPC: Single           read Get_CRadarPC  write Set_CRadarPC;
    property PotMetPL: Single           read Get_PotMetPL;
    property PotMetPC: Single           read Get_PotMetPC;
  end;

implementation

end.
 