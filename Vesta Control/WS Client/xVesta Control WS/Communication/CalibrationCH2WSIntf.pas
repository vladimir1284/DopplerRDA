{ Invokable interface ICalibrationCH2WS }

unit CalibrationCH2WSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CalibrationWSIntf;

type
  ICalibrationCH2WS = interface(ICalibrationWS)
  ['{21124D5F-46A1-47A5-BB64-BD2F4CE64641}']
  end;

implementation

uses CommunicationObj;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ICalibrationCH2WS));

end.
 