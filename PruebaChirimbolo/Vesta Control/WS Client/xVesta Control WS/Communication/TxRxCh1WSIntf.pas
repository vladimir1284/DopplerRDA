unit TxRxCh1WSIntf;

interface

uses InvokeRegistry, Types, XSBuiltIns, TxRxWSIntf;

type
  ITxRxCh1WS = interface(ITxRxWS)
  ['{A544CB36-4700-43B0-9D0F-B1653DA4EA0D}']
  end;

implementation

initialization
  InvRegistry.RegisterInterface(TypeInfo(ITxRxCh1WS));
end.
 