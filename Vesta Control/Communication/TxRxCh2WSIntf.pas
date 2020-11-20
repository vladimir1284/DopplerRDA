unit TxRxCh2WSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, TxRxWSIntf;

type
  ITxRxCh2WS = interface(ITxRxWS)
  ['{3D052BFE-86DF-4B86-A45F-93934D97302A}']
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(ITxRxCh2WS));

end.
 