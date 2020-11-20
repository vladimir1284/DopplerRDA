// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:8888/wsdl/ITxRxCh1WS
// Encoding : utf-8
// Version  : 1.0
// (3/30/2012 11:44:04 AM - 1.33.2.5)
// ************************************************************************ //

unit ITxRxCh1Proxy;

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
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"

  { "urn:CommunicationObj" }
  RadarStatusEnum = (rsOff, rsFailure, rsOk);

  { "urn:CommunicationObj" }
  TxPulseEnum = (tx_Pulse_Long, tx_Pulse_Short, tx_Pulse_None, tx_Pulse_Dual);

  { "urn:CommunicationObj" }
  TWaveLengthEnum = (wl_3cm, wl_10cm);


  // ************************************************************************ //
  // Namespace : urn:TxRxCh1WSIntf-ITxRxCh1WS
  // soapAction: urn:TxRxCh1WSIntf-ITxRxCh1WS#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITxRxCh1WSbinding
  // service   : ITxRxCh1WSservice
  // port      : ITxRxCh1WSPort
  // URL       : http://localhost:8888/soap/ITxRxCh1WS
  // ************************************************************************ //
  ITxRxCh1WS = interface(IInvokable)
  ['{4CEDA6BD-6D98-EE7A-4EBF-F07F6854CEA0}']
    function  Get_Tx_Status: RadarStatusEnum; stdcall;
    function  Get_Encendido: Boolean; stdcall;
    function  Get_HV: Boolean; stdcall;
    function  Get_Listo: Boolean; stdcall;
    function  Get_Inter_Lock: Boolean; stdcall;
    function  Get_Ventilacion: Boolean; stdcall;
    function  Get_Averia: Boolean; stdcall;
    function  Get_Averia_MPS: Boolean; stdcall;
    function  Get_Averia_Ventilador: Boolean; stdcall;
    function  Get_Averia_Fuente_Filamento: Boolean; stdcall;
    function  Get_Local: Boolean; stdcall;
    function  Get_Fuente_5V_N: Boolean; stdcall;
    function  Get_Fuente_5V_P: Boolean; stdcall;
    function  Get_Fuente_15V_N: Boolean; stdcall;
    function  Get_Fuente_15V_P: Boolean; stdcall;
    function  Get_Stalo_Locked: Boolean; stdcall;
    function  Get_Rx_Status: RadarStatusEnum; stdcall;
    function  Get_DRX_Ready: Boolean; stdcall;
    function  Get_Stalo_Temperature: Double; stdcall;
    function  Get_Stalo_Power: Double; stdcall;
    function  Get_Stalo_Frequency: Int64; stdcall;
    function  Get_Stalo_ExtRef: Boolean; stdcall;
    function  Get_Stalo_Ref_Unlocked: Boolean; stdcall;
    function  Get_Stalo_RF_Unlocked: Boolean; stdcall;
    function  Get_Stalo_RF_Output: Boolean; stdcall;
    function  Get_Stalo_VoltageError: Boolean; stdcall;
    function  Get_Stalo_Ref_Output: Boolean; stdcall;
    function  Get_Stalo_Blanking: Boolean; stdcall;
    function  Get_Stalo_LockRecovery: Boolean; stdcall;
    function  Get_AFC_Status: Boolean; stdcall;
    function  Get_Tx_Frequency: Int64; stdcall;
    function  Get_Tx_IF: Int64; stdcall;
    function  Get_Tx_PulsePower: Double; stdcall;
    function  Get_NCO_Frequency: Int64; stdcall;
    procedure StartAcquiring; stdcall;
    function  Get_Potencia_Code: Integer; stdcall;
    function  Get_Potencia_Unit: Double; stdcall;
    function  Get_MPS_Volt_Code: Integer; stdcall;
    function  Get_MPS_Volt_Unit: Double; stdcall;
    function  Get_MPS_Corr_Code: Integer; stdcall;
    function  Get_MPS_Corr_Unit: Double; stdcall;
    function  Get_Fuente_24VN_Code: Integer; stdcall;
    function  Get_Fuente_24VN_Unit: Double; stdcall;
    function  Get_Fuente_24VP_Code: Integer; stdcall;
    function  Get_Fuente_24VP_Unit: Double; stdcall;
    function  Get_Fuente_50V_Code: Integer; stdcall;
    function  Get_Fuente_50V_Unit: Double; stdcall;
    function  Get_Fuente_100V_Code: Integer; stdcall;
    function  Get_Fuente_100V_Unit: Double; stdcall;
    function  Get_Fuente_400V_Code: Integer; stdcall;
    function  Get_Fuente_400V_Unit: Double; stdcall;
    function  Get_Fuente_Filamento_Code: Integer; stdcall;
    function  Get_Fuente_Filamento_Unit: Double; stdcall;
    function  Get_Tx_Pulso: TxPulseEnum; stdcall;
    function  Get_Numero: Integer; stdcall;
    function  Get_Longitud_Onda: TWaveLengthEnum; stdcall;
    procedure Tx_Encender; stdcall;
    procedure Tx_Apagar; stdcall;
    procedure Set_HV(const Value: Boolean); stdcall;
    procedure Rx_Encender; stdcall;
    procedure Rx_Apagar; stdcall;
    procedure Set_Stalo_Freq(const Value: Int64); stdcall;
    procedure Set_Stalo_Power(const Value: Double); stdcall;
    procedure Stalo_Reset; stdcall;
    procedure Set_AFC_Status(const Value: Boolean); stdcall;
    procedure Set_Stalo_Output(const Value: Boolean); stdcall;
    procedure Stalo_Update; stdcall;
    procedure Set_NCO_Frequency(const Value: Int64); stdcall;
    function  Get_Rango_Tx_Potencia: Integer; stdcall;
    function  Get_Sector_Tx_Potencia: Integer; stdcall;
    function  Get_Rango_Tx_MPS_Volt: Integer; stdcall;
    function  Get_Rango_Tx_MPS_Corr: Integer; stdcall;
    function  Get_Rango_Tx_Fuente24V_N: Integer; stdcall;
    function  Get_Rango_Tx_Fuente24V_P: Integer; stdcall;
    function  Get_Rango_Tx_Fuente50V: Integer; stdcall;
    function  Get_Rango_Tx_Fuente400V: Integer; stdcall;
    function  Get_Rango_Tx_Fuente_Filamento: Integer; stdcall;
    function  Get_Rango_Tx_Fuente100V: Integer; stdcall;
    function  Get_Sector_Tx_MPS_Volt: Integer; stdcall;
    function  Get_Sector_Tx_MPS_Corr: Integer; stdcall;
    function  Get_Sector_Tx_Fuente24V_N: Integer; stdcall;
    function  Get_Sector_Tx_Fuente24V_P: Integer; stdcall;
    function  Get_Sector_Tx_Fuente50V: Integer; stdcall;
    function  Get_Sector_Tx_Fuente100V: Integer; stdcall;
    function  Get_Sector_Tx_Fuente400V: Integer; stdcall;
    function  Get_Sector_Tx_Fuente_Filamento: Integer; stdcall;
    procedure Set_Rango_Tx_Potencia(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_Potencia(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_MPS_Volt(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_MPS_Corr(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_Fuente24V_N(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_Fuente24V_P(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_Fuente50V(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_Fuente100V(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_Fuente400V(const Value: Integer); stdcall;
    procedure Set_Rango_Tx_Fuente_Filamento(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_MPS_Volt(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_MPS_Corr(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_Fuente24V_N(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_Fuente24V_P(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_Fuente50V(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_Fuente100V(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_Fuente400V(const Value: Integer); stdcall;
    procedure Set_Sector_Tx_Fuente_Filamento(const Value: Integer); stdcall;
  end;

function GetITxRxCh1WS(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITxRxCh1WS;


implementation

function GetITxRxCh1WS(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITxRxCh1WS;
const
  defWSDL = 'http://localhost:8888/wsdl/ITxRxCh1WS';
  defURL  = 'http://localhost:8888/soap/ITxRxCh1WS';
  defSvc  = 'ITxRxCh1WSservice';
  defPrt  = 'ITxRxCh1WSPort';
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
    Result := (RIO as ITxRxCh1WS);
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
  InvRegistry.RegisterInterface(TypeInfo(ITxRxCh1WS), 'urn:TxRxCh1WSIntf-ITxRxCh1WS', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITxRxCh1WS), 'urn:TxRxCh1WSIntf-ITxRxCh1WS#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RadarStatusEnum), 'urn:CommunicationObj', 'RadarStatusEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TxPulseEnum), 'urn:CommunicationObj', 'TxPulseEnum');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TWaveLengthEnum), 'urn:CommunicationObj', 'TWaveLengthEnum');

end.