{ Invokable interface IELMotorWS }

unit ELMotorWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, MotorWSIntf;

type
  IELMotorWS = interface(IMotorWS)
  ['{583A8E1C-F0A1-494C-8743-9ADCC2ABA3C3}']
  end;

implementation

uses CommunicationObj;

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IELMotorWS));

end.
 