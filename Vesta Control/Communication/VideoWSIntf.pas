{ Invokable interface IVideoWS }

unit VideoWSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, CommunicationObj;

type
  IVideoWS = interface(IInvokable)
  ['{2EED7948-3AF4-4EC5-9D4B-F6A74E0C1281}']
    // IVideo
    procedure StartAcquiring(ch1: WordBool; ch2: WordBool); safecall;
    // IVideoControl
    procedure StartRT; safecall;
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(IVideoWS));

end.
 