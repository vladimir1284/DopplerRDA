// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:49000/wsdl/ITest
// Version  : 1.0
// (4/28/2011 11:57:07 PM - 1.33.2.5)
// ************************************************************************ //

unit Test;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:TDoubleDynArray - "http://www.borland.com/namespaces/Types"

  TSampleStruct        = class;                 { "urn:CommConfiguration" }

  { "urn:CommConfiguration" }
  SampleEnum = (etNone, etAFew, etSome, etALot);



  // ************************************************************************ //
  // Namespace : urn:CommConfiguration
  // ************************************************************************ //
  TSampleStruct = class(TRemotable)
  private
    FLastName: WideString;
    FFirstName: WideString;
    FSalary: Double;
  published
    property LastName: WideString read FLastName write FLastName;
    property FirstName: WideString read FFirstName write FFirstName;
    property Salary: Double read FSalary write FSalary;
  end;


  // ************************************************************************ //
  // Namespace : urn:Test-ITest
  // soapAction: urn:Test-ITest#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITestbinding
  // service   : ITestservice
  // port      : ITestPort
  // URL       : http://localhost:49000/soap/ITest
  // ************************************************************************ //
  ITest = interface(IInvokable)
  ['{26F3F2AB-E760-9AA7-5A90-364B402E45E9}']
    function  echoEnum(const eValue: SampleEnum): SampleEnum; stdcall;
    function  echoDoubleArray(const daValue: TDoubleDynArray): TDoubleDynArray; stdcall;
    function  echoStruct(const pEmployee: TSampleStruct): TSampleStruct; stdcall;
    function  echoDouble(const dValue: Double): Double; stdcall;
  end;

function GetITest(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITest;


implementation

function GetITest(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITest;
const
  defWSDL = 'http://localhost:49000/wsdl/ITest';
  defURL  = 'http://localhost:49000/soap/ITest';
  defSvc  = 'ITestservice';
  defPrt  = 'ITestPort';
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
    Result := (RIO as ITest);
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
  InvRegistry.RegisterInterface(TypeInfo(ITest), 'urn:Test-ITest', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITest), 'urn:Test-ITest#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(SampleEnum), 'urn:CommConfiguration', 'SampleEnum');
  RemClassRegistry.RegisterXSClass(TSampleStruct, 'urn:CommConfiguration', 'TSampleStruct');

end.