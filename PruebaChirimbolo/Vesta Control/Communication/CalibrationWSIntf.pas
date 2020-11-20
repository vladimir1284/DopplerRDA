{ Invokable interface ICalibrationWS }

unit CalibrationWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  ICalibrationWS = interface(IInvokable)
  ['{B585A686-C49A-4F5B-AD45-54802E973ECC}']
    // ICalibration
    function Get_Potencia: Integer;   safecall;
    function Get_CRadarPL: Single;    safecall;
    function Get_CRadarPC: Single;    safecall;
    function Get_PotMetPL: Single;    safecall;
    function Get_PotMetPC: Single;    safecall;
    function Get_MPS_Voltage: Double; safecall;

    function Get_Tx_Pulse_SP: Integer; safecall;
    function Get_Tx_Pulse_LP: Integer; safecall;
    function Get_Start_Sample_SP: Integer; safecall;
    function Get_Final_Sample_SP: Integer; safecall;
    function Get_Start_Sample_LP: Integer; safecall;
    function Get_Final_Sample_LP: Integer; safecall;
    function Get_Tx_Factor: Double; safecall;
    function Get_Stalo_Delay: Integer; safecall;
    function Get_Stalo_Step: Integer; safecall;
    function Get_Stalo_Width: Integer; safecall;
    function Get_Valid_tx_power: Double; safecall;
    function Get_Loop_Gain: Double; safecall;
    // ICalibrationControl
    procedure Set_Potencia(Value: Integer); safecall;
    procedure Set_CRadarPL(Value: Single); safecall;
    procedure Set_CRadarPC(Value: Single); safecall;
    procedure Set_MPS_Voltage(Value: Double); safecall;

    procedure Set_Tx_Pulse_SP(Value: Integer); safecall;
    procedure Set_Tx_Pulse_LP(Value: Integer); safecall;
    procedure Set_Start_Sample_SP(Value: Integer); safecall;
    procedure Set_Final_Sample_SP(Value: Integer); safecall;
    procedure Set_Start_Sample_LP(Value: Integer); safecall;
    procedure Set_Final_Sample_LP(Value: Integer); safecall;
    procedure Set_Tx_Factor(Value: Double); safecall;
    procedure Set_Stalo_Delay(Value: Integer); safecall;
    procedure Set_Stalo_Step(Value: Integer); safecall;
    procedure Set_Stalo_Width(Value: Integer); safecall;
    procedure Set_Valid_tx_power(Value: Double); safecall;
    procedure Set_Loop_Gain(Value: Double); safecall;
    procedure SaveDRX; safecall;
    // properties
    property Potencia: Integer        read Get_Potencia  write Set_Potencia;
    property CRadarPL: Single         read Get_CRadarPL  write Set_CRadarPL;
    property CRadarPC: Single         read Get_CRadarPC  write Set_CRadarPC;
    property PotMetPL: Single         read Get_PotMetPL;
    property PotMetPC: Single         read Get_PotMetPC;
    property MPS_Voltage: Double      read Get_MPS_Voltage write Set_MPS_Voltage;

    property Tx_Pulse_SP: Integer     read Get_Tx_Pulse_SP      write Set_Tx_Pulse_SP;
    property Tx_Pulse_LP: Integer     read Get_Tx_Pulse_LP      write Set_Tx_Pulse_LP;
    property Start_Sample_SP: Integer read Get_Start_Sample_SP  write Set_Start_Sample_SP;
    property Final_Sample_SP: Integer read Get_Final_Sample_SP  write Set_Final_Sample_SP;
    property Start_Sample_LP: Integer read Get_Start_Sample_LP  write Set_Start_Sample_LP;
    property Final_Sample_LP: Integer read Get_Final_Sample_LP  write Set_Final_Sample_LP;
    property Tx_Factor: Double        read Get_Tx_Factor        write Set_Tx_Factor;
    property Stalo_Delay: Integer     read Get_Stalo_Delay      write Set_Stalo_Delay;
    property Stalo_Step: Integer      read Get_Stalo_Step       write Set_Stalo_Step;
    property Stalo_Width: Integer     read Get_Stalo_Width      write Set_Stalo_Width;
    property Valid_tx_power: Double   read Get_Valid_tx_power   write Set_Valid_tx_power;
    property Loop_Gain: Double        read Get_Loop_Gain        write Set_Loop_Gain;
  end;

implementation

end.
 