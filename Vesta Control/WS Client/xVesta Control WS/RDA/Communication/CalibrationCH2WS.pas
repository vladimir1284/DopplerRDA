// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/ICalibrationCH2WS
// Encoding : utf-8
// Version  : 1.0
// (4/21/2011 10:00:52 AM - 1.33.2.5)
// ************************************************************************ //

unit CalibrationCH2WS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CalibrationWS;

type
  // ************************************************************************ //
  // Namespace : urn:CalibrationCH2WSIntf-ICalibrationCH2WS
  // soapAction: urn:CalibrationCH2WSIntf-ICalibrationCH2WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ICalibrationCH2WSbinding
  // service   : ICalibrationCH2WSservice
  // port      : ICalibrationCH2WSPort
  // URL       : http://localhost:9999/soap/ICalibrationCH2WS
  // ************************************************************************ //
  ICalibrationCH2WS = interface(ICalibrationWS)
  ['{D056AE8C-312D-0C8B-7AC1-07391235DDFE}']
  end;

function GetICalibrationCH2WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ICalibrationCH2WS;


implementation

function GetICalibrationCH2WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ICalibrationCH2WS;
const
  defWSDL = 'http://localhost:9999/wsdl/ICalibrationCH2WS';
  defURL  = 'http://localhost:9999/soap/ICalibrationCH2WS';
  defSvc  = 'ICalibrationCH2WSservice';
  defPrt  = 'ICalibrationCH2WSPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ICalibrationCH2WS);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ICalibrationCH2WS), 'urn:CalibrationCH2WSIntf-ICalibrationCH2WS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ICalibrationCH2WS), 'urn:CalibrationCH2WSIntf-ICalibrationCH2WS#%operationName%');

end. 