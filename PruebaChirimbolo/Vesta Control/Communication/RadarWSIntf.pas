unit RadarWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type

  IRadarWS = interface(IInvokable)
  ['{67A4EA08-C272-44E0-A63A-6918E7E61ED5}']
    function Get_Red_Listo: WordBool; safecall;
    function Get_Radar_On: WordBool; safecall;
    function Get_Tx1Status: RadarStatusEnum; safecall;
    function Get_Tx2Status: RadarStatusEnum; safecall;
    function Get_Rx1Status: RadarStatusEnum; safecall;
    function Get_Rx2Status: RadarStatusEnum; safecall;
    function Get_AntennaStatus: RadarStatusEnum; safecall;
    function Get_Status: RadarStatusEnum; safecall;

    procedure Encender_Radar; safecall;
    procedure Apagar_Radar; safecall;

    property Red_Listo: WordBool read Get_Red_Listo;
    property Radar_On: WordBool read Get_Radar_On;
    property Tx1Status    : RadarStatusEnum read Get_Tx1Status;
    property Tx2Status    : RadarStatusEnum read Get_Tx2Status;
    property Rx1Status    : RadarStatusEnum read Get_Rx1Status;
    property Rx2Status    : RadarStatusEnum read Get_Rx2Status;
    property AntennaStatus: RadarStatusEnum read Get_AntennaStatus;
    property Status       : RadarStatusEnum read Get_Status;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(IRadarWS));

end.
 