{ Invokable interface IAZMotorWS }

unit AZMotorWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, MotorWSIntf;

type
  IAZMotorWS = interface(IMotorWS)
  ['{2BC87EEA-9DCE-49E7-81ED-972353C36BEB}']
  end;

implementation

uses CommunicationObj;

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(IAZMotorWS));

end.
 