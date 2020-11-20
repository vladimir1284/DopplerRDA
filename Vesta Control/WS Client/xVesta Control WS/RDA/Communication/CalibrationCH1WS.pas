// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9999/wsdl/ICalibrationCH1WS
// Encoding : utf-8
// Version  : 1.0
// (4/21/2011 9:56:46 AM - 1.33.2.5)
// ************************************************************************ //

unit CalibrationCH1WS;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, CalibrationWS;

type
  // ************************************************************************ //
  // Namespace : urn:CalibrationCH1WSIntf-ICalibrationCH1WS
  // soapAction: urn:CalibrationCH1WSIntf-ICalibrationCH1WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ICalibrationCH1WSbinding
  // service   : ICalibrationCH1WSservice
  // port      : ICalibrationCH1WSPort
  // URL       : http://localhost:9999/soap/ICalibrationCH1WS
  // ************************************************************************ //
  ICalibrationCH1WS = interface(ICalibrationWS)
  ['{8143E5A0-8B93-BF8E-0D91-6EBCD28CE57C}']
  end;

function GetICalibrationCH1WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ICalibrationCH1WS;


implementation

function GetICalibrationCH1WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ICalibrationCH1WS;
const
  defWSDL = 'http://localhost:9999/wsdl/ICalibrationCH1WS';
  defURL  = 'http://localhost:9999/soap/ICalibrationCH1WS';
  defSvc  = 'ICalibrationCH1WSservice';
  defPrt  = 'ICalibrationCH1WSPort';
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
    Result := (RIO as ICalibrationCH1WS);
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
  InvRegistry.RegisterInterface(TypeInfo(ICalibrationCH1WS), 'urn:CalibrationCH1WSIntf-ICalibrationCH1WS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ICalibrationCH1WS), 'urn:CalibrationCH1WSIntf-ICalibrationCH1WS#%operationName%');
end.
