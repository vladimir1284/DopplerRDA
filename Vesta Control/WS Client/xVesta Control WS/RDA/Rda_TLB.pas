unit Rda_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 2/14/2006 10:26:25 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Work\Radar\Vesta\RDA\Rda.tlb (1)
// LIBID: {A9793140-F90C-11D3-9B3D-005004063186}
// LCID: 0
// Helpfile: 
// HelpString: Rda Library
// DepndLst: 
//   (1) v2.0 stdole, (D:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  RdaMajorVersion = 1;
  RdaMinorVersion = 0;

  LIBID_Rda: TGUID = '{A9793140-F90C-11D3-9B3D-005004063186}';

  IID_IAntenna: TGUID = '{A9793148-F90C-11D3-9B3D-005004063186}';
  IID_ITxsRxs: TGUID = '{58981070-F91A-11D3-9B3D-005004063186}';
  IID_IRadar: TGUID = '{58981076-F91A-11D3-9B3D-005004063186}';
  IID_ITxRxStatus: TGUID = '{5898107D-F91A-11D3-9B3D-005004063186}';
  IID_ITxRxControl: TGUID = '{5898107F-F91A-11D3-9B3D-005004063186}';
  IID_ITxRxMRL5M: TGUID = '{58981081-F91A-11D3-9B3D-005004063186}';
  IID_ITxRxRC32B: TGUID = '{58981083-F91A-11D3-9B3D-005004063186}';
  IID_IMotorStatus: TGUID = '{5A7D9A84-F92A-11D3-B78E-444553540001}';
  IID_IMotorControl: TGUID = '{5A7D9A86-F92A-11D3-B78E-444553540001}';
  IID_ILogin: TGUID = '{E293F160-F92C-11D3-B78E-444553540001}';
  IID_IVestaRDA: TGUID = '{5B1AECB6-F9DD-11D3-9B3D-005004063186}';
  IID_ISynchro: TGUID = '{94AB05C1-0196-11D4-9B56-005004063186}';
  IID_IRadarControl: TGUID = '{3D2D7D31-01AD-11D4-9B57-005004063186}';
  IID_IAntennaControl: TGUID = '{3D2D7D33-01AD-11D4-9B57-005004063186}';
  IID_IPulse: TGUID = '{DBC6BE36-0BF2-11D4-9BA3-005004063186}';
  IID_IPulseControl: TGUID = '{DBC6BE38-0BF2-11D4-9BA3-005004063186}';
  IID_ITemplate: TGUID = '{3F196D77-0C9A-11D4-9BA4-005004063186}';
  IID_ITemplateControl: TGUID = '{3F196D79-0C9A-11D4-9BA4-005004063186}';
  IID_IObservations: TGUID = '{51B9A2D3-1250-11D4-9BC9-005004063186}';
  IID_IConfiguration: TGUID = '{9F5D7F61-1315-11D4-9BCD-005004063186}';
  IID_IConfigurationControl: TGUID = '{9F5D7F64-1315-11D4-9BCD-005004063186}';
  IID_IObservationsControl: TGUID = '{F12B3162-1575-11D4-9BCE-005004063186}';
  IID_IVideo: TGUID = '{C26020E3-1F1B-11D4-9C04-005004063186}';
  IID_IVideoControl: TGUID = '{C26020E5-1F1B-11D4-9C04-005004063186}';
  IID_ICalibration: TGUID = '{942EC368-211C-11D4-9C0D-005004063186}';
  IID_ICalibrationControl: TGUID = '{942EC36A-211C-11D4-9C0D-005004063186}';
  IID_ITxRxMeasure: TGUID = '{75CC7C80-29DD-11D4-9C1E-005004063186}';
  IID_ITxRxMeasureControl: TGUID = '{75CC7C82-29DD-11D4-9C1E-005004063186}';
  IID_IObservation: TGUID = '{0A9C3931-2B3B-11D4-9C28-005004063186}';
  CLASS_VestaRDA: TGUID = '{7FD23AC2-2D32-11D4-9C37-005004063186}';
  IID_IAntena: TGUID = '{7F46A0B8-1661-4432-BE92-A43CC5717F53}';
  CLASS_Antena: TGUID = '{EF501E37-2DC1-4180-B409-2D0832E28525}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxPulse
type
  TxPulse = TOleEnum;
const
  tx_Pulse_Long = $00000000;
  tx_Pulse_Short = $00000001;
  tx_Pulse_None = $00000002;

// Constants for enum WaveLength
type
  WaveLength = TOleEnum;
const
  wl_3cm = $00000000;
  wl_10cm = $00000001;

// Constants for enum DesignKind
type
  DesignKind = TOleEnum;
const
  dk_PPI = $00000000;
  dk_RHI = $00000001;

// Constants for enum TxRxOptions
type
  TxRxOptions = TOleEnum;
const
  xo_No = $00000000;
  xo_Yes = $00000001;
  xo_Nevermind = $00000002;

// Constants for enum TemplateKind
type
  TemplateKind = TOleEnum;
const
  tk_PPI = $00000000;
  tk_RHI = $00000001;

// Constants for enum TemplateFlag
type
  TemplateFlag = TOleEnum;
const
  tf_Create_Dir = $00000001;
  tf_Include_Radar = $00000002;
  tf_Include_Year = $00000004;
  tf_Include_Month = $00000008;
  tf_Include_Day = $00000010;

// Constants for enum TSyncSource
type
  TSyncSource = TOleEnum;
const
  ss_Internal = $00000000;
  ss_External_Digital = $00000001;
  ss_Analog_Raising_Edge = $00000002;
  ss_Analog_Falling_Edge = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAntenna = interface;
  IAntennaDisp = dispinterface;
  ITxsRxs = interface;
  ITxsRxsDisp = dispinterface;
  IRadar = interface;
  IRadarDisp = dispinterface;
  ITxRxStatus = interface;
  ITxRxStatusDisp = dispinterface;
  ITxRxControl = interface;
  ITxRxControlDisp = dispinterface;
  ITxRxMRL5M = interface;
  ITxRxMRL5MDisp = dispinterface;
  ITxRxRC32B = interface;
  ITxRxRC32BDisp = dispinterface;
  IMotorStatus = interface;
  IMotorStatusDisp = dispinterface;
  IMotorControl = interface;
  IMotorControlDisp = dispinterface;
  ILogin = interface;
  ILoginDisp = dispinterface;
  IVestaRDA = interface;
  IVestaRDADisp = dispinterface;
  ISynchro = interface;
  ISynchroDisp = dispinterface;
  IRadarControl = interface;
  IRadarControlDisp = dispinterface;
  IAntennaControl = interface;
  IAntennaControlDisp = dispinterface;
  IPulse = interface;
  IPulseDisp = dispinterface;
  IPulseControl = interface;
  IPulseControlDisp = dispinterface;
  ITemplate = interface;
  ITemplateDisp = dispinterface;
  ITemplateControl = interface;
  ITemplateControlDisp = dispinterface;
  IObservations = interface;
  IObservationsDisp = dispinterface;
  IConfiguration = interface;
  IConfigurationDisp = dispinterface;
  IConfigurationControl = interface;
  IConfigurationControlDisp = dispinterface;
  IObservationsControl = interface;
  IObservationsControlDisp = dispinterface;
  IVideo = interface;
  IVideoDisp = dispinterface;
  IVideoControl = interface;
  IVideoControlDisp = dispinterface;
  ICalibration = interface;
  ICalibrationDisp = dispinterface;
  ICalibrationControl = interface;
  ICalibrationControlDisp = dispinterface;
  ITxRxMeasure = interface;
  ITxRxMeasureDisp = dispinterface;
  ITxRxMeasureControl = interface;
  ITxRxMeasureControlDisp = dispinterface;
  IObservation = interface;
  IObservationDisp = dispinterface;
  IAntena = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  VestaRDA = IVestaRDA;
  Antena = IAntena;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}

  MaxMin = packed record
    Min: Smallint;
    Max: Smallint;
  end;

  TxRxData = packed record
    CRT: TxRxOptions;
    CMG: TxRxOptions;
    CMS: TxRxOptions;
  end;

  FormatData = packed record
    Onda: Integer;
    Celdas: Integer;
    Long: Integer;
    PotMet: Single;
  end;


// *********************************************************************//
// Interface: IAntenna
// Flags:     (320) Dual OleAutomation
// GUID:      {A9793148-F90C-11D3-9B3D-005004063186}
// *********************************************************************//
  IAntenna = interface(IUnknown)
    ['{A9793148-F90C-11D3-9B3D-005004063186}']
    function Get_Estado: LongWord; safecall;
    function Get_Antena_Listo: WordBool; safecall;
    function Get_Averia_Excitacion: WordBool; safecall;
    function Get_Limite_N: WordBool; safecall;
    function Get_Limite_P: WordBool; safecall;
    function Get_Motor_Az: IMotorStatus; safecall;
    function Get_Motor_El: IMotorStatus; safecall;
    function Get_Acc_Listo: WordBool; safecall;
    function Get_Cupula_Abierta: WordBool; safecall;
    function Get_Acc_On: WordBool; safecall;
    property Estado: LongWord read Get_Estado;
    property Antena_Listo: WordBool read Get_Antena_Listo;
    property Averia_Excitacion: WordBool read Get_Averia_Excitacion;
    property Limite_N: WordBool read Get_Limite_N;
    property Limite_P: WordBool read Get_Limite_P;
    property Motor_Az: IMotorStatus read Get_Motor_Az;
    property Motor_El: IMotorStatus read Get_Motor_El;
    property Acc_Listo: WordBool read Get_Acc_Listo;
    property Cupula_Abierta: WordBool read Get_Cupula_Abierta;
    property Acc_On: WordBool read Get_Acc_On;
  end;

// *********************************************************************//
// DispIntf:  IAntennaDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {A9793148-F90C-11D3-9B3D-005004063186}
// *********************************************************************//
  IAntennaDisp = dispinterface
    ['{A9793148-F90C-11D3-9B3D-005004063186}']
    property Estado: LongWord readonly dispid 1;
    property Antena_Listo: WordBool readonly dispid 2;
    property Averia_Excitacion: WordBool readonly dispid 5;
    property Limite_N: WordBool readonly dispid 6;
    property Limite_P: WordBool readonly dispid 7;
    property Motor_Az: IMotorStatus readonly dispid 10;
    property Motor_El: IMotorStatus readonly dispid 11;
    property Acc_Listo: WordBool readonly dispid 3;
    property Cupula_Abierta: WordBool readonly dispid 4;
    property Acc_On: WordBool readonly dispid 8;
  end;

// *********************************************************************//
// Interface: ITxsRxs
// Flags:     (320) Dual OleAutomation
// GUID:      {58981070-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxsRxs = interface(IUnknown)
    ['{58981070-F91A-11D3-9B3D-005004063186}']
    function Get_TxRxCount: Integer; safecall;
    function GetTxRx(Index: Integer): ITxRxStatus; safecall;
    function Get_Pulso_Unico: WordBool; safecall;
    function Get_Sincro_Unico: WordBool; safecall;
    property TxRxCount: Integer read Get_TxRxCount;
    property Pulso_Unico: WordBool read Get_Pulso_Unico;
    property Sincro_Unico: WordBool read Get_Sincro_Unico;
  end;

// *********************************************************************//
// DispIntf:  ITxsRxsDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {58981070-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxsRxsDisp = dispinterface
    ['{58981070-F91A-11D3-9B3D-005004063186}']
    property TxRxCount: Integer readonly dispid 1;
    function GetTxRx(Index: Integer): ITxRxStatus; dispid 2;
    property Pulso_Unico: WordBool readonly dispid 3;
    property Sincro_Unico: WordBool readonly dispid 4;
  end;

// *********************************************************************//
// Interface: IRadar
// Flags:     (320) Dual OleAutomation
// GUID:      {58981076-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  IRadar = interface(IUnknown)
    ['{58981076-F91A-11D3-9B3D-005004063186}']
    function Get_Red_Listo: WordBool; safecall;
    function Get_Radar_On_P: WordBool; safecall;
    function Get_Radar_On_N: WordBool; safecall;
    function Get_Muestra_P: Integer; safecall;
    function Get_Muestra_N: Integer; safecall;
    function Get_Radar_Encender: WordBool; safecall;
    function Get_Radar_Apagar: WordBool; safecall;
    function Get_Rango_Muestra_P: Integer; safecall;
    function Get_Rango_Muestra_N: Integer; safecall;
    function Get_Sector_Muestra_P: Integer; safecall;
    function Get_Sector_Muestra_N: Integer; safecall;
    property Red_Listo: WordBool read Get_Red_Listo;
    property Radar_On_P: WordBool read Get_Radar_On_P;
    property Radar_On_N: WordBool read Get_Radar_On_N;
    property Muestra_P: Integer read Get_Muestra_P;
    property Muestra_N: Integer read Get_Muestra_N;
    property Radar_Encender: WordBool read Get_Radar_Encender;
    property Radar_Apagar: WordBool read Get_Radar_Apagar;
    property Rango_Muestra_P: Integer read Get_Rango_Muestra_P;
    property Rango_Muestra_N: Integer read Get_Rango_Muestra_N;
    property Sector_Muestra_P: Integer read Get_Sector_Muestra_P;
    property Sector_Muestra_N: Integer read Get_Sector_Muestra_N;
  end;

// *********************************************************************//
// DispIntf:  IRadarDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {58981076-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  IRadarDisp = dispinterface
    ['{58981076-F91A-11D3-9B3D-005004063186}']
    property Red_Listo: WordBool readonly dispid 1;
    property Radar_On_P: WordBool readonly dispid 2;
    property Radar_On_N: WordBool readonly dispid 3;
    property Muestra_P: Integer readonly dispid 4;
    property Muestra_N: Integer readonly dispid 5;
    property Radar_Encender: WordBool readonly dispid 6;
    property Radar_Apagar: WordBool readonly dispid 7;
    property Rango_Muestra_P: Integer readonly dispid 8;
    property Rango_Muestra_N: Integer readonly dispid 9;
    property Sector_Muestra_P: Integer readonly dispid 10;
    property Sector_Muestra_N: Integer readonly dispid 11;
  end;

// *********************************************************************//
// Interface: ITxRxStatus
// Flags:     (320) Dual OleAutomation
// GUID:      {5898107D-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxStatus = interface(IUnknown)
    ['{5898107D-F91A-11D3-9B3D-005004063186}']
    function Get_Tx_Caldeo: WordBool; safecall;
    function Get_Tx_Anodo: WordBool; safecall;
    function Get_Tx_Listo: WordBool; safecall;
    function Get_Tx_Averia: WordBool; safecall;
    function Get_Rx_Caldeo: WordBool; safecall;
    function Get_Rx_Anodo: WordBool; safecall;
    function Get_Rx_Averia: WordBool; safecall;
    function Get_Tx_Pulso: TxPulse; safecall;
    function Get_TxRx_Ajuste: WordBool; safecall;
    function Get_Tx_Potencia: Integer; safecall;
    function Get_Rx_Sintonia: Integer; safecall;
    function Get_Rx_Ganancia: Integer; safecall;
    function Get_Rx_Ruido: Integer; safecall;
    function Get_Numero: Integer; safecall;
    function Get_Longitud_Onda: WaveLength; safecall;
    function Get_Rx_Correccion: WordBool; safecall;
    function Get_Tx_Standby: WordBool; safecall;
    function Get_Tx_Potencia_Voltage: Single; safecall;
    function Get_Rx_Sintonia_Voltage: Single; safecall;
    function Get_Rx_Ganancia_Voltage: Single; safecall;
    function Get_Rx_Ruido_Voltage: Single; safecall;
    property Tx_Caldeo: WordBool read Get_Tx_Caldeo;
    property Tx_Anodo: WordBool read Get_Tx_Anodo;
    property Tx_Listo: WordBool read Get_Tx_Listo;
    property Tx_Averia: WordBool read Get_Tx_Averia;
    property Rx_Caldeo: WordBool read Get_Rx_Caldeo;
    property Rx_Anodo: WordBool read Get_Rx_Anodo;
    property Rx_Averia: WordBool read Get_Rx_Averia;
    property Tx_Pulso: TxPulse read Get_Tx_Pulso;
    property TxRx_Ajuste: WordBool read Get_TxRx_Ajuste;
    property Tx_Potencia: Integer read Get_Tx_Potencia;
    property Rx_Sintonia: Integer read Get_Rx_Sintonia;
    property Rx_Ganancia: Integer read Get_Rx_Ganancia;
    property Rx_Ruido: Integer read Get_Rx_Ruido;
    property Numero: Integer read Get_Numero;
    property Longitud_Onda: WaveLength read Get_Longitud_Onda;
    property Rx_Correccion: WordBool read Get_Rx_Correccion;
    property Tx_Standby: WordBool read Get_Tx_Standby;
    property Tx_Potencia_Voltage: Single read Get_Tx_Potencia_Voltage;
    property Rx_Sintonia_Voltage: Single read Get_Rx_Sintonia_Voltage;
    property Rx_Ganancia_Voltage: Single read Get_Rx_Ganancia_Voltage;
    property Rx_Ruido_Voltage: Single read Get_Rx_Ruido_Voltage;
  end;

// *********************************************************************//
// DispIntf:  ITxRxStatusDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {5898107D-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxStatusDisp = dispinterface
    ['{5898107D-F91A-11D3-9B3D-005004063186}']
    property Tx_Caldeo: WordBool readonly dispid 1;
    property Tx_Anodo: WordBool readonly dispid 2;
    property Tx_Listo: WordBool readonly dispid 3;
    property Tx_Averia: WordBool readonly dispid 4;
    property Rx_Caldeo: WordBool readonly dispid 5;
    property Rx_Anodo: WordBool readonly dispid 6;
    property Rx_Averia: WordBool readonly dispid 7;
    property Tx_Pulso: TxPulse readonly dispid 8;
    property TxRx_Ajuste: WordBool readonly dispid 9;
    property Tx_Potencia: Integer readonly dispid 10;
    property Rx_Sintonia: Integer readonly dispid 11;
    property Rx_Ganancia: Integer readonly dispid 12;
    property Rx_Ruido: Integer readonly dispid 13;
    property Numero: Integer readonly dispid 22;
    property Longitud_Onda: WaveLength readonly dispid 23;
    property Rx_Correccion: WordBool readonly dispid 24;
    property Tx_Standby: WordBool readonly dispid 25;
    property Tx_Potencia_Voltage: Single readonly dispid 101;
    property Rx_Sintonia_Voltage: Single readonly dispid 102;
    property Rx_Ganancia_Voltage: Single readonly dispid 103;
    property Rx_Ruido_Voltage: Single readonly dispid 104;
  end;

// *********************************************************************//
// Interface: ITxRxControl
// Flags:     (320) Dual OleAutomation
// GUID:      {5898107F-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxControl = interface(IUnknown)
    ['{5898107F-F91A-11D3-9B3D-005004063186}']
    procedure Tx_Encender; safecall;
    procedure Tx_Apagar; safecall;
    procedure Set_Tx_Standby(Param1: WordBool); safecall;
    procedure Rx_Encender; safecall;
    procedure Rx_Apagar; safecall;
    procedure Set_Rx_Correccion(Param1: WordBool); safecall;
    procedure Set_Trabajo(Param1: WordBool); safecall;
    property Tx_Standby: WordBool write Set_Tx_Standby;
    property Rx_Correccion: WordBool write Set_Rx_Correccion;
    property Trabajo: WordBool write Set_Trabajo;
  end;

// *********************************************************************//
// DispIntf:  ITxRxControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {5898107F-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxControlDisp = dispinterface
    ['{5898107F-F91A-11D3-9B3D-005004063186}']
    procedure Tx_Encender; dispid 1;
    procedure Tx_Apagar; dispid 2;
    property Tx_Standby: WordBool writeonly dispid 3;
    procedure Rx_Encender; dispid 4;
    procedure Rx_Apagar; dispid 5;
    property Rx_Correccion: WordBool writeonly dispid 6;
    property Trabajo: WordBool writeonly dispid 7;
  end;

// *********************************************************************//
// Interface: ITxRxMRL5M
// Flags:     (320) Dual OleAutomation
// GUID:      {58981081-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxMRL5M = interface(IUnknown)
    ['{58981081-F91A-11D3-9B3D-005004063186}']
    function Get_Rx_CMG: WordBool; safecall;
    procedure Set_Rx_CMG(Value: WordBool); safecall;
    procedure Rx_Ganancia_N; safecall;
    procedure Rx_Ganancia_P; safecall;
    function Get_Rx_CMS: WordBool; safecall;
    procedure Set_Rx_CMS(Value: WordBool); safecall;
    procedure Rx_Sintonia_N; safecall;
    procedure Rx_Sintonia_P; safecall;
    property Rx_CMG: WordBool read Get_Rx_CMG write Set_Rx_CMG;
    property Rx_CMS: WordBool read Get_Rx_CMS write Set_Rx_CMS;
  end;

// *********************************************************************//
// DispIntf:  ITxRxMRL5MDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {58981081-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxMRL5MDisp = dispinterface
    ['{58981081-F91A-11D3-9B3D-005004063186}']
    property Rx_CMG: WordBool dispid 1;
    procedure Rx_Ganancia_N; dispid 2;
    procedure Rx_Ganancia_P; dispid 3;
    property Rx_CMS: WordBool dispid 4;
    procedure Rx_Sintonia_N; dispid 5;
    procedure Rx_Sintonia_P; dispid 6;
  end;

// *********************************************************************//
// Interface: ITxRxRC32B
// Flags:     (320) Dual OleAutomation
// GUID:      {58981083-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxRC32B = interface(IUnknown)
    ['{58981083-F91A-11D3-9B3D-005004063186}']
  end;

// *********************************************************************//
// DispIntf:  ITxRxRC32BDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {58981083-F91A-11D3-9B3D-005004063186}
// *********************************************************************//
  ITxRxRC32BDisp = dispinterface
    ['{58981083-F91A-11D3-9B3D-005004063186}']
  end;

// *********************************************************************//
// Interface: IMotorStatus
// Flags:     (320) Dual OleAutomation
// GUID:      {5A7D9A84-F92A-11D3-B78E-444553540001}
// *********************************************************************//
  IMotorStatus = interface(IUnknown)
    ['{5A7D9A84-F92A-11D3-B78E-444553540001}']
    function Get_Posicion: Integer; safecall;
    function Get_Velocidad: Integer; safecall;
    function Get_Corriente: Integer; safecall;
    function Get_SP_Posicion: Integer; safecall;
    function Get_SP_Velocidad: Integer; safecall;
    function Get_Lazo_Posicion: WordBool; safecall;
    function Get_Acc_Listo: WordBool; safecall;
    property Posicion: Integer read Get_Posicion;
    property Velocidad: Integer read Get_Velocidad;
    property Corriente: Integer read Get_Corriente;
    property SP_Posicion: Integer read Get_SP_Posicion;
    property SP_Velocidad: Integer read Get_SP_Velocidad;
    property Lazo_Posicion: WordBool read Get_Lazo_Posicion;
    property Acc_Listo: WordBool read Get_Acc_Listo;
  end;

// *********************************************************************//
// DispIntf:  IMotorStatusDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {5A7D9A84-F92A-11D3-B78E-444553540001}
// *********************************************************************//
  IMotorStatusDisp = dispinterface
    ['{5A7D9A84-F92A-11D3-B78E-444553540001}']
    property Posicion: Integer readonly dispid 1;
    property Velocidad: Integer readonly dispid 2;
    property Corriente: Integer readonly dispid 3;
    property SP_Posicion: Integer readonly dispid 5;
    property SP_Velocidad: Integer readonly dispid 6;
    property Lazo_Posicion: WordBool readonly dispid 7;
    property Acc_Listo: WordBool readonly dispid 4;
  end;

// *********************************************************************//
// Interface: IMotorControl
// Flags:     (320) Dual OleAutomation
// GUID:      {5A7D9A86-F92A-11D3-B78E-444553540001}
// *********************************************************************//
  IMotorControl = interface(IUnknown)
    ['{5A7D9A86-F92A-11D3-B78E-444553540001}']
    procedure Set_SP_Posicion(Param1: Integer); safecall;
    procedure Set_SP_Velocidad(Param1: Integer); safecall;
    procedure Set_Lazo_Posicion(Param1: WordBool); safecall;
    function Get_Lazo_Posicion_K: Single; safecall;
    procedure Set_Lazo_Posicion_K(Value: Single); safecall;
    function Get_Lazo_Velocidad_K: Single; safecall;
    procedure Set_Lazo_Velocidad_K(Value: Single); safecall;
    property SP_Posicion: Integer write Set_SP_Posicion;
    property SP_Velocidad: Integer write Set_SP_Velocidad;
    property Lazo_Posicion: WordBool write Set_Lazo_Posicion;
    property Lazo_Posicion_K: Single read Get_Lazo_Posicion_K write Set_Lazo_Posicion_K;
    property Lazo_Velocidad_K: Single read Get_Lazo_Velocidad_K write Set_Lazo_Velocidad_K;
  end;

// *********************************************************************//
// DispIntf:  IMotorControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {5A7D9A86-F92A-11D3-B78E-444553540001}
// *********************************************************************//
  IMotorControlDisp = dispinterface
    ['{5A7D9A86-F92A-11D3-B78E-444553540001}']
    property SP_Posicion: Integer writeonly dispid 1;
    property SP_Velocidad: Integer writeonly dispid 2;
    property Lazo_Posicion: WordBool writeonly dispid 3;
    property Lazo_Posicion_K: Single dispid 5;
    property Lazo_Velocidad_K: Single dispid 4;
  end;

// *********************************************************************//
// Interface: ILogin
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E293F160-F92C-11D3-B78E-444553540001}
// *********************************************************************//
  ILogin = interface(IDispatch)
    ['{E293F160-F92C-11D3-B78E-444553540001}']
    function Login(const UserName: WideString; const Password: WideString): HResult; safecall;
    function Get_Name: WideString; safecall;
    function Get_ControllerName: WideString; safecall;
    function Get_Level: Integer; safecall;
    function TakeControl: HResult; safecall;
    function ReleaseControl: HResult; safecall;
    function Logout: HResult; safecall;
    function Get_Usuarios: Integer; safecall;
    function Usuario(Index: Integer; out Name: WideString; out Level: Integer): HResult; safecall;
    function Nuevo_Usuario(const Name: WideString; const Password: WideString; Level: Integer): HResult; safecall;
    function Borrar_Usuario(const Name: WideString): HResult; safecall;
    function Get_InControl: WordBool; safecall;
    function Modificar(const Name: WideString; const Password: WideString; Level: Integer): HResult; safecall;
    function Get_ControllerLevel: Integer; safecall;
    property Name: WideString read Get_Name;
    property ControllerName: WideString read Get_ControllerName;
    property Level: Integer read Get_Level;
    property Usuarios: Integer read Get_Usuarios;
    property InControl: WordBool read Get_InControl;
    property ControllerLevel: Integer read Get_ControllerLevel;
  end;

// *********************************************************************//
// DispIntf:  ILoginDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E293F160-F92C-11D3-B78E-444553540001}
// *********************************************************************//
  ILoginDisp = dispinterface
    ['{E293F160-F92C-11D3-B78E-444553540001}']
    function Login(const UserName: WideString; const Password: WideString): HResult; dispid 1;
    property Name: WideString readonly dispid 2;
    property ControllerName: WideString readonly dispid 4;
    property Level: Integer readonly dispid 3;
    function TakeControl: HResult; dispid 5;
    function ReleaseControl: HResult; dispid 6;
    function Logout: HResult; dispid 7;
    property Usuarios: Integer readonly dispid 8;
    function Usuario(Index: Integer; out Name: WideString; out Level: Integer): HResult; dispid 9;
    function Nuevo_Usuario(const Name: WideString; const Password: WideString; Level: Integer): HResult; dispid 10;
    function Borrar_Usuario(const Name: WideString): HResult; dispid 11;
    property InControl: WordBool readonly dispid 12;
    function Modificar(const Name: WideString; const Password: WideString; Level: Integer): HResult; dispid 13;
    property ControllerLevel: Integer readonly dispid 201;
  end;

// *********************************************************************//
// Interface: IVestaRDA
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B1AECB6-F9DD-11D3-9B3D-005004063186}
// *********************************************************************//
  IVestaRDA = interface(IDispatch)
    ['{5B1AECB6-F9DD-11D3-9B3D-005004063186}']
    function Get_Radar: IRadar; safecall;
    function Get_TxsRxs: ITxsRxs; safecall;
    function Get_Antenna: IAntenna; safecall;
    function Get_Configuration: IConfiguration; safecall;
    function Get_Observations: IObservations; safecall;
    function Get_MaxLogEntries: Integer; safecall;
    function DownloadLogMessages(out LogMessages: PSafeArray; out MsgCount: Integer): HResult; safecall;
    function Get_Version: WideString; safecall;
    function Get_SystemDateTime: Double; safecall;
    function Get_SystemTimeZone: Integer; safecall;
    property Radar: IRadar read Get_Radar;
    property TxsRxs: ITxsRxs read Get_TxsRxs;
    property Antenna: IAntenna read Get_Antenna;
    property Configuration: IConfiguration read Get_Configuration;
    property Observations: IObservations read Get_Observations;
    property MaxLogEntries: Integer read Get_MaxLogEntries;
    property Version: WideString read Get_Version;
    property SystemDateTime: Double read Get_SystemDateTime;
    property SystemTimeZone: Integer read Get_SystemTimeZone;
  end;

// *********************************************************************//
// DispIntf:  IVestaRDADisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B1AECB6-F9DD-11D3-9B3D-005004063186}
// *********************************************************************//
  IVestaRDADisp = dispinterface
    ['{5B1AECB6-F9DD-11D3-9B3D-005004063186}']
    property Radar: IRadar readonly dispid 1;
    property TxsRxs: ITxsRxs readonly dispid 2;
    property Antenna: IAntenna readonly dispid 3;
    property Configuration: IConfiguration readonly dispid 5;
    property Observations: IObservations readonly dispid 6;
    property MaxLogEntries: Integer readonly dispid 201;
    function DownloadLogMessages(out LogMessages: {??PSafeArray}OleVariant; out MsgCount: Integer): HResult; dispid 202;
    property Version: WideString readonly dispid 203;
    property SystemDateTime: Double readonly dispid 204;
    property SystemTimeZone: Integer readonly dispid 205;
  end;

// *********************************************************************//
// Interface: ISynchro
// Flags:     (320) Dual OleAutomation
// GUID:      {94AB05C1-0196-11D4-9B56-005004063186}
// *********************************************************************//
  ISynchro = interface(IUnknown)
    ['{94AB05C1-0196-11D4-9B56-005004063186}']
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto; safecall;
    function Get_Frecuencia: Integer; safecall;
    function Get_Fuente: TSyncSource; safecall;
    procedure Set_Fuente(Value: TSyncSource); safecall;
    property Frecuencia: Integer read Get_Frecuencia;
    property Fuente: TSyncSource read Get_Fuente write Set_Fuente;
  end;

// *********************************************************************//
// DispIntf:  ISynchroDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {94AB05C1-0196-11D4-9B56-005004063186}
// *********************************************************************//
  ISynchroDisp = dispinterface
    ['{94AB05C1-0196-11D4-9B56-005004063186}']
    procedure Set_Pulso_Largo; dispid 1;
    procedure Set_Pulso_Corto; dispid 2;
    property Frecuencia: Integer readonly dispid 3;
    property Fuente: TSyncSource dispid 4;
  end;

// *********************************************************************//
// Interface: IRadarControl
// Flags:     (320) Dual OleAutomation
// GUID:      {3D2D7D31-01AD-11D4-9B57-005004063186}
// *********************************************************************//
  IRadarControl = interface(IUnknown)
    ['{3D2D7D31-01AD-11D4-9B57-005004063186}']
    procedure Encender_Radar; safecall;
    procedure Apagar_Radar; safecall;
    procedure Set_Rango_Muestra_P(Param1: Integer); safecall;
    procedure Set_Rango_Muestra_N(Param1: Integer); safecall;
    procedure Set_Sector_Muestra_P(Param1: Integer); safecall;
    procedure Set_Sector_Muestra_N(Param1: Integer); safecall;
    property Rango_Muestra_P: Integer write Set_Rango_Muestra_P;
    property Rango_Muestra_N: Integer write Set_Rango_Muestra_N;
    property Sector_Muestra_P: Integer write Set_Sector_Muestra_P;
    property Sector_Muestra_N: Integer write Set_Sector_Muestra_N;
  end;

// *********************************************************************//
// DispIntf:  IRadarControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {3D2D7D31-01AD-11D4-9B57-005004063186}
// *********************************************************************//
  IRadarControlDisp = dispinterface
    ['{3D2D7D31-01AD-11D4-9B57-005004063186}']
    procedure Encender_Radar; dispid 1;
    procedure Apagar_Radar; dispid 2;
    property Rango_Muestra_P: Integer writeonly dispid 4;
    property Rango_Muestra_N: Integer writeonly dispid 5;
    property Sector_Muestra_P: Integer writeonly dispid 6;
    property Sector_Muestra_N: Integer writeonly dispid 7;
  end;

// *********************************************************************//
// Interface: IAntennaControl
// Flags:     (320) Dual OleAutomation
// GUID:      {3D2D7D33-01AD-11D4-9B57-005004063186}
// *********************************************************************//
  IAntennaControl = interface(IUnknown)
    ['{3D2D7D33-01AD-11D4-9B57-005004063186}']
    procedure Encender_Acc; safecall;
    procedure Apagar_Acc; safecall;
    procedure Alarma_Sonora(Tiempo: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IAntennaControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {3D2D7D33-01AD-11D4-9B57-005004063186}
// *********************************************************************//
  IAntennaControlDisp = dispinterface
    ['{3D2D7D33-01AD-11D4-9B57-005004063186}']
    procedure Encender_Acc; dispid 1;
    procedure Apagar_Acc; dispid 2;
    procedure Alarma_Sonora(Tiempo: Integer); dispid 3;
  end;

// *********************************************************************//
// Interface: IPulse
// Flags:     (320) Dual OleAutomation
// GUID:      {DBC6BE36-0BF2-11D4-9BA3-005004063186}
// *********************************************************************//
  IPulse = interface(IUnknown)
    ['{DBC6BE36-0BF2-11D4-9BA3-005004063186}']
    function Get_N1CH1: Integer; safecall;
    function Get_N2: Integer; safecall;
    function Get_N3: Integer; safecall;
    function Get_N4: Integer; safecall;
    function Get_N5: Integer; safecall;
    function Get_N6: Integer; safecall;
    function Get_N1CH2: Integer; safecall;
    function Get_Frecuencia: Integer; safecall;
    function Get_TxRxPulso: TxPulse; safecall;
    property N1CH1: Integer read Get_N1CH1;
    property N2: Integer read Get_N2;
    property N3: Integer read Get_N3;
    property N4: Integer read Get_N4;
    property N5: Integer read Get_N5;
    property N6: Integer read Get_N6;
    property N1CH2: Integer read Get_N1CH2;
    property Frecuencia: Integer read Get_Frecuencia;
    property TxRxPulso: TxPulse read Get_TxRxPulso;
  end;

// *********************************************************************//
// DispIntf:  IPulseDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {DBC6BE36-0BF2-11D4-9BA3-005004063186}
// *********************************************************************//
  IPulseDisp = dispinterface
    ['{DBC6BE36-0BF2-11D4-9BA3-005004063186}']
    property N1CH1: Integer readonly dispid 1;
    property N2: Integer readonly dispid 2;
    property N3: Integer readonly dispid 3;
    property N4: Integer readonly dispid 4;
    property N5: Integer readonly dispid 5;
    property N6: Integer readonly dispid 6;
    property N1CH2: Integer readonly dispid 7;
    property Frecuencia: Integer readonly dispid 8;
    property TxRxPulso: TxPulse readonly dispid 101;
  end;

// *********************************************************************//
// Interface: IPulseControl
// Flags:     (320) Dual OleAutomation
// GUID:      {DBC6BE38-0BF2-11D4-9BA3-005004063186}
// *********************************************************************//
  IPulseControl = interface(IUnknown)
    ['{DBC6BE38-0BF2-11D4-9BA3-005004063186}']
    procedure Set_N1CH1(Param1: Integer); safecall;
    procedure Set_N2(Param1: Integer); safecall;
    procedure Set_N3(Param1: Integer); safecall;
    procedure Set_N4(Param1: Integer); safecall;
    procedure Set_N5(Param1: Integer); safecall;
    procedure Set_N6(Param1: Integer); safecall;
    procedure Set_N1CH2(Param1: Integer); safecall;
    procedure Set_Frecuencia(Param1: Integer); safecall;
    property N1CH1: Integer write Set_N1CH1;
    property N2: Integer write Set_N2;
    property N3: Integer write Set_N3;
    property N4: Integer write Set_N4;
    property N5: Integer write Set_N5;
    property N6: Integer write Set_N6;
    property N1CH2: Integer write Set_N1CH2;
    property Frecuencia: Integer write Set_Frecuencia;
  end;

// *********************************************************************//
// DispIntf:  IPulseControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {DBC6BE38-0BF2-11D4-9BA3-005004063186}
// *********************************************************************//
  IPulseControlDisp = dispinterface
    ['{DBC6BE38-0BF2-11D4-9BA3-005004063186}']
    property N1CH1: Integer writeonly dispid 1;
    property N2: Integer writeonly dispid 2;
    property N3: Integer writeonly dispid 3;
    property N4: Integer writeonly dispid 4;
    property N5: Integer writeonly dispid 5;
    property N6: Integer writeonly dispid 6;
    property N1CH2: Integer writeonly dispid 7;
    property Frecuencia: Integer writeonly dispid 8;
  end;

// *********************************************************************//
// Interface: ITemplate
// Flags:     (320) Dual OleAutomation
// GUID:      {3F196D77-0C9A-11D4-9BA4-005004063186}
// *********************************************************************//
  ITemplate = interface(IUnknown)
    ['{3F196D77-0C9A-11D4-9BA4-005004063186}']
    function Get_Nombre: WideString; safecall;
    function Get_Opciones: Integer; safecall;
    function Get_Direcciones: WideString; safecall;
    function Get_Periodo: TDateTime; safecall;
    function Get_Demora: TDateTime; safecall;
    function Get_Tipo: Integer; safecall;
    function Get_Inicio: Integer; safecall;
    function Get_Fin: Integer; safecall;
    function Get_Velocidad: Integer; safecall;
    function Get_Angulos: Integer; safecall;
    function Get_Formatos: Integer; safecall;
    function Angulo(Index: Integer; out Angle: Integer): HResult; safecall;
    function Formato(Index: Integer; out Wave: Integer; out Cells: Integer; out Length: Integer): HResult; safecall;
    function Get_Automatica: WordBool; safecall;
    procedure Set_Automatica(Value: WordBool); safecall;
    function Get_Anterior: TDateTime; safecall;
    function Get_Proxima: TDateTime; safecall;
    function Get_Frecuencia_Muestra: Integer; safecall;
    function Get_Sectores: Integer; safecall;
    function Get_Pulso: TxPulse; safecall;
    function Get_CRT1: TxRxOptions; safecall;
    function Get_CMG1: TxRxOptions; safecall;
    function Get_CMS1: TxRxOptions; safecall;
    function Get_CRT2: TxRxOptions; safecall;
    function Get_CMG2: TxRxOptions; safecall;
    function Get_CMS2: TxRxOptions; safecall;
    function Get_Sector_Inicio: Integer; safecall;
    function Get_Sector_Fin: Integer; safecall;
    function Get_FTPSettings: WideString; safecall;
    function Get_SentFTP: WordBool; safecall;
    property Nombre: WideString read Get_Nombre;
    property Opciones: Integer read Get_Opciones;
    property Direcciones: WideString read Get_Direcciones;
    property Periodo: TDateTime read Get_Periodo;
    property Demora: TDateTime read Get_Demora;
    property Tipo: Integer read Get_Tipo;
    property Inicio: Integer read Get_Inicio;
    property Fin: Integer read Get_Fin;
    property Velocidad: Integer read Get_Velocidad;
    property Angulos: Integer read Get_Angulos;
    property Formatos: Integer read Get_Formatos;
    property Automatica: WordBool read Get_Automatica write Set_Automatica;
    property Anterior: TDateTime read Get_Anterior;
    property Proxima: TDateTime read Get_Proxima;
    property Frecuencia_Muestra: Integer read Get_Frecuencia_Muestra;
    property Sectores: Integer read Get_Sectores;
    property Pulso: TxPulse read Get_Pulso;
    property CRT1: TxRxOptions read Get_CRT1;
    property CMG1: TxRxOptions read Get_CMG1;
    property CMS1: TxRxOptions read Get_CMS1;
    property CRT2: TxRxOptions read Get_CRT2;
    property CMG2: TxRxOptions read Get_CMG2;
    property CMS2: TxRxOptions read Get_CMS2;
    property Sector_Inicio: Integer read Get_Sector_Inicio;
    property Sector_Fin: Integer read Get_Sector_Fin;
    property FTPSettings: WideString read Get_FTPSettings;
    property SentFTP: WordBool read Get_SentFTP;
  end;

// *********************************************************************//
// DispIntf:  ITemplateDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {3F196D77-0C9A-11D4-9BA4-005004063186}
// *********************************************************************//
  ITemplateDisp = dispinterface
    ['{3F196D77-0C9A-11D4-9BA4-005004063186}']
    property Nombre: WideString readonly dispid 1;
    property Opciones: Integer readonly dispid 2;
    property Direcciones: WideString readonly dispid 3;
    property Periodo: TDateTime readonly dispid 4;
    property Demora: TDateTime readonly dispid 5;
    property Tipo: Integer readonly dispid 6;
    property Inicio: Integer readonly dispid 7;
    property Fin: Integer readonly dispid 8;
    property Velocidad: Integer readonly dispid 9;
    property Angulos: Integer readonly dispid 10;
    property Formatos: Integer readonly dispid 11;
    function Angulo(Index: Integer; out Angle: Integer): HResult; dispid 12;
    function Formato(Index: Integer; out Wave: Integer; out Cells: Integer; out Length: Integer): HResult; dispid 13;
    property Automatica: WordBool dispid 14;
    property Anterior: TDateTime readonly dispid 15;
    property Proxima: TDateTime readonly dispid 16;
    property Frecuencia_Muestra: Integer readonly dispid 17;
    property Sectores: Integer readonly dispid 18;
    property Pulso: TxPulse readonly dispid 19;
    property CRT1: TxRxOptions readonly dispid 20;
    property CMG1: TxRxOptions readonly dispid 21;
    property CMS1: TxRxOptions readonly dispid 22;
    property CRT2: TxRxOptions readonly dispid 23;
    property CMG2: TxRxOptions readonly dispid 24;
    property CMS2: TxRxOptions readonly dispid 25;
    property Sector_Inicio: Integer readonly dispid 26;
    property Sector_Fin: Integer readonly dispid 27;
    property FTPSettings: WideString readonly dispid 101;
    property SentFTP: WordBool readonly dispid 102;
  end;

// *********************************************************************//
// Interface: ITemplateControl
// Flags:     (320) Dual OleAutomation
// GUID:      {3F196D79-0C9A-11D4-9BA4-005004063186}
// *********************************************************************//
  ITemplateControl = interface(IUnknown)
    ['{3F196D79-0C9A-11D4-9BA4-005004063186}']
    procedure Set_Nombre(const Param1: WideString); safecall;
    procedure Set_Opciones(Param1: Integer); safecall;
    procedure Set_Direcciones(const Param1: WideString); safecall;
    procedure Set_Periodo(Param1: TDateTime); safecall;
    procedure Set_Demora(Param1: TDateTime); safecall;
    procedure Set_Tipo(Param1: Integer); safecall;
    procedure Set_Inicio(Param1: Integer); safecall;
    procedure Set_Fin(Param1: Integer); safecall;
    procedure Set_Velocidad(Param1: Integer); safecall;
    procedure Set_Angulos(Param1: Integer); safecall;
    procedure Set_Formatos(Param1: Integer); safecall;
    function SetAngulo(Index: Integer; Angle: Integer): HResult; safecall;
    function SetFormato(Index: Integer; Wave: Integer; Cells: Integer; Length: Integer): HResult; safecall;
    procedure Set_Anterior(Param1: TDateTime); safecall;
    procedure Set_Proxima(Param1: TDateTime); safecall;
    procedure Eliminar; safecall;
    procedure Set_Frecuencia_Muestra(Param1: Integer); safecall;
    procedure Set_Sectores(Param1: Integer); safecall;
    procedure Set_Pulso(Param1: TxPulse); safecall;
    procedure Set_CRT1(Param1: TxRxOptions); safecall;
    procedure Set_CMG1(Param1: TxRxOptions); safecall;
    procedure Set_CMS1(Param1: TxRxOptions); safecall;
    procedure Set_CRT2(Param1: TxRxOptions); safecall;
    procedure Set_CMG2(Param1: TxRxOptions); safecall;
    procedure Set_CMS2(Param1: TxRxOptions); safecall;
    procedure Set_FTPSettings(const Param1: WideString); safecall;
    procedure Set_SentFTP(Param1: WordBool); safecall;
    property Nombre: WideString write Set_Nombre;
    property Opciones: Integer write Set_Opciones;
    property Direcciones: WideString write Set_Direcciones;
    property Periodo: TDateTime write Set_Periodo;
    property Demora: TDateTime write Set_Demora;
    property Tipo: Integer write Set_Tipo;
    property Inicio: Integer write Set_Inicio;
    property Fin: Integer write Set_Fin;
    property Velocidad: Integer write Set_Velocidad;
    property Angulos: Integer write Set_Angulos;
    property Formatos: Integer write Set_Formatos;
    property Anterior: TDateTime write Set_Anterior;
    property Proxima: TDateTime write Set_Proxima;
    property Frecuencia_Muestra: Integer write Set_Frecuencia_Muestra;
    property Sectores: Integer write Set_Sectores;
    property Pulso: TxPulse write Set_Pulso;
    property CRT1: TxRxOptions write Set_CRT1;
    property CMG1: TxRxOptions write Set_CMG1;
    property CMS1: TxRxOptions write Set_CMS1;
    property CRT2: TxRxOptions write Set_CRT2;
    property CMG2: TxRxOptions write Set_CMG2;
    property CMS2: TxRxOptions write Set_CMS2;
    property FTPSettings: WideString write Set_FTPSettings;
    property SentFTP: WordBool write Set_SentFTP;
  end;

// *********************************************************************//
// DispIntf:  ITemplateControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {3F196D79-0C9A-11D4-9BA4-005004063186}
// *********************************************************************//
  ITemplateControlDisp = dispinterface
    ['{3F196D79-0C9A-11D4-9BA4-005004063186}']
    property Nombre: WideString writeonly dispid 1;
    property Opciones: Integer writeonly dispid 2;
    property Direcciones: WideString writeonly dispid 3;
    property Periodo: TDateTime writeonly dispid 4;
    property Demora: TDateTime writeonly dispid 5;
    property Tipo: Integer writeonly dispid 6;
    property Inicio: Integer writeonly dispid 7;
    property Fin: Integer writeonly dispid 8;
    property Velocidad: Integer writeonly dispid 9;
    property Angulos: Integer writeonly dispid 10;
    property Formatos: Integer writeonly dispid 11;
    function SetAngulo(Index: Integer; Angle: Integer): HResult; dispid 12;
    function SetFormato(Index: Integer; Wave: Integer; Cells: Integer; Length: Integer): HResult; dispid 13;
    property Anterior: TDateTime writeonly dispid 15;
    property Proxima: TDateTime writeonly dispid 16;
    procedure Eliminar; dispid 14;
    property Frecuencia_Muestra: Integer writeonly dispid 17;
    property Sectores: Integer writeonly dispid 18;
    property Pulso: TxPulse writeonly dispid 19;
    property CRT1: TxRxOptions writeonly dispid 20;
    property CMG1: TxRxOptions writeonly dispid 21;
    property CMS1: TxRxOptions writeonly dispid 22;
    property CRT2: TxRxOptions writeonly dispid 23;
    property CMG2: TxRxOptions writeonly dispid 24;
    property CMS2: TxRxOptions writeonly dispid 25;
    property FTPSettings: WideString writeonly dispid 101;
    property SentFTP: WordBool writeonly dispid 102;
  end;

// *********************************************************************//
// Interface: IObservations
// Flags:     (320) Dual OleAutomation
// GUID:      {51B9A2D3-1250-11D4-9BC9-005004063186}
// *********************************************************************//
  IObservations = interface(IUnknown)
    ['{51B9A2D3-1250-11D4-9BC9-005004063186}']
    function Get_Plantillas: Integer; safecall;
    function Ejecutar(const Name: WideString): HResult; safecall;
    function Plantilla(Index: Integer): ITemplate; safecall;
    function Buscar(const Name: WideString): ITemplate; safecall;
    property Plantillas: Integer read Get_Plantillas;
  end;

// *********************************************************************//
// DispIntf:  IObservationsDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {51B9A2D3-1250-11D4-9BC9-005004063186}
// *********************************************************************//
  IObservationsDisp = dispinterface
    ['{51B9A2D3-1250-11D4-9BC9-005004063186}']
    property Plantillas: Integer readonly dispid 1;
    function Ejecutar(const Name: WideString): HResult; dispid 2;
    function Plantilla(Index: Integer): ITemplate; dispid 3;
    function Buscar(const Name: WideString): ITemplate; dispid 4;
  end;

// *********************************************************************//
// Interface: IConfiguration
// Flags:     (320) Dual OleAutomation
// GUID:      {9F5D7F61-1315-11D4-9BCD-005004063186}
// *********************************************************************//
  IConfiguration = interface(IUnknown)
    ['{9F5D7F61-1315-11D4-9BCD-005004063186}']
    function Get_Radar_ID: Integer; safecall;
    function Get_Obs_Directory: WideString; safecall;
    function Get_Beam_Ch1: Single; safecall;
    function Get_Beam_Ch2: Single; safecall;
    function Get_Speed_Accuracy: Integer; safecall;
    function Get_Angle_Accuracy: Integer; safecall;
    function Get_Pack_Method: Integer; safecall;
    function Get_Timeout_TxRx: Integer; safecall;
    function Get_Clutter_Clear: WordBool; safecall;
    function Get_Clutter_Cells: Integer; safecall;
    function Get_Clutter_Threshold1: Integer; safecall;
    function Get_Clutter_Threshold2: Integer; safecall;
    function Get_Speckle_Remove: WordBool; safecall;
    function Get_Save_Variance: WordBool; safecall;
    function Get_N1Source: Integer; safecall;
    function Get_PLRate: Integer; safecall;
    function Get_PCRate: Integer; safecall;
    function Get_SampleRate: Integer; safecall;
    function Get_Ch1Port: Integer; safecall;
    function Get_Ch2Port: Integer; safecall;
    function Get_AngleCodeRate: Integer; safecall;
    function Get_AngleClockwiseRotationX: WordBool; safecall;
    function Get_AngleClockwiseRotationY: WordBool; safecall;
    function Get_AngleClockwiseRotationZ: WordBool; safecall;
    function PCTimes(out Times: PSafeArray): HResult; safecall;
    function PLTimes(out Times: PSafeArray): HResult; safecall;
    function AIGains(out Gains: PSafeArray): HResult; safecall;
    function VideoGains(out Gains: PSafeArray): HResult; safecall;
    function Get_SpeckleUmbral: Integer; safecall;
    function Get_RadarName(RadarId: Integer): WideString; safecall;
    function Get_RadarOwner(RadarId: Integer): WideString; safecall;
    function Get_RadarRange(RadarId: Integer): Integer; safecall;
    function Get_RadarLatitude(RadarId: Integer): Single; safecall;
    function Get_RadarLongitude(RadarId: Integer): Single; safecall;
    function Get_RadarAltitude(RadarId: Integer): Single; safecall;
    function Get_RadarBrand(RadarId: Integer): WideString; safecall;
    function Get_SendMsgOnError: WordBool; safecall;
    function Get_TargetAddress: WideString; safecall;
    function Get_SMTPServer: WideString; safecall;
    function Get_SMTPUser: WideString; safecall;
    function Get_SMTPPassword: WideString; safecall;
    function Get_SMTPPort: Integer; safecall;
    function Get_SMTPFromAddress: WideString; safecall;
    function Get_ContinuosRegime: WordBool; safecall;
    procedure Set_ContinuosRegime(Value: WordBool); safecall;
    function Get_Timeout_Radar: Integer; safecall;
    procedure Set_Timeout_Radar(Value: Integer); safecall;
    function Get_Automatic_Obs: WordBool; safecall;
    procedure Set_Automatic_Obs(Value: WordBool); safecall;
    function Get_Auto_Power_Off: WordBool; safecall;
    procedure Set_Auto_Power_Off(Value: WordBool); safecall;
    function Get_WarmTime_Radar: Integer; safecall;
    procedure Set_WarmTime_Radar(Value: Integer); safecall;
    function Get_RestTime_Radar: Integer; safecall;
    procedure Set_RestTime_Radar(Value: Integer); safecall;
    function Get_RadarTemperature: Double; safecall;
    function Get_RadarPressure: Double; safecall;
    function Get_CheckRefPoints: WordBool; safecall;
    function Get_RefPointCountCh1: Integer; safecall;
    function Get_CheckPPIParam: WordBool; safecall;
    function Get_RefPointsCh1: WideString; safecall;
    function Get_RefPointsCh2: WideString; safecall;
    function Get_RefPointCountCh2: Integer; safecall;
    procedure Save; safecall;
    function Get_RTPort: Integer; safecall;
    function Get_RTMaxClients: Integer; safecall;
    function Get_RT_Speckle_Remove: WordBool; safecall;
    procedure Set_RT_Speckle_Remove(Value: WordBool); safecall;
    function Get_RT_SpeckleUmbral: Integer; safecall;
    procedure Set_RT_SpeckleUmbral(Value: Integer); safecall;
    function Get_SpeckleUmbralAz: Integer; safecall;
    function Get_SpeckleRemoveAz: WordBool; safecall;
    function Get_ClockSource: WordBool; safecall;
    function Get_PermanentEchoFilter: WordBool; safecall;
    function Get_Threshold3cmFilter: Single; safecall;
    function Get_Threshold10cmFilter: Single; safecall;
    property Radar_ID: Integer read Get_Radar_ID;
    property Obs_Directory: WideString read Get_Obs_Directory;
    property Beam_Ch1: Single read Get_Beam_Ch1;
    property Beam_Ch2: Single read Get_Beam_Ch2;
    property Speed_Accuracy: Integer read Get_Speed_Accuracy;
    property Angle_Accuracy: Integer read Get_Angle_Accuracy;
    property Pack_Method: Integer read Get_Pack_Method;
    property Timeout_TxRx: Integer read Get_Timeout_TxRx;
    property Clutter_Clear: WordBool read Get_Clutter_Clear;
    property Clutter_Cells: Integer read Get_Clutter_Cells;
    property Clutter_Threshold1: Integer read Get_Clutter_Threshold1;
    property Clutter_Threshold2: Integer read Get_Clutter_Threshold2;
    property Speckle_Remove: WordBool read Get_Speckle_Remove;
    property Save_Variance: WordBool read Get_Save_Variance;
    property N1Source: Integer read Get_N1Source;
    property PLRate: Integer read Get_PLRate;
    property PCRate: Integer read Get_PCRate;
    property SampleRate: Integer read Get_SampleRate;
    property Ch1Port: Integer read Get_Ch1Port;
    property Ch2Port: Integer read Get_Ch2Port;
    property AngleCodeRate: Integer read Get_AngleCodeRate;
    property AngleClockwiseRotationX: WordBool read Get_AngleClockwiseRotationX;
    property AngleClockwiseRotationY: WordBool read Get_AngleClockwiseRotationY;
    property AngleClockwiseRotationZ: WordBool read Get_AngleClockwiseRotationZ;
    property SpeckleUmbral: Integer read Get_SpeckleUmbral;
    property RadarName[RadarId: Integer]: WideString read Get_RadarName;
    property RadarOwner[RadarId: Integer]: WideString read Get_RadarOwner;
    property RadarRange[RadarId: Integer]: Integer read Get_RadarRange;
    property RadarLatitude[RadarId: Integer]: Single read Get_RadarLatitude;
    property RadarLongitude[RadarId: Integer]: Single read Get_RadarLongitude;
    property RadarAltitude[RadarId: Integer]: Single read Get_RadarAltitude;
    property RadarBrand[RadarId: Integer]: WideString read Get_RadarBrand;
    property SendMsgOnError: WordBool read Get_SendMsgOnError;
    property TargetAddress: WideString read Get_TargetAddress;
    property SMTPServer: WideString read Get_SMTPServer;
    property SMTPUser: WideString read Get_SMTPUser;
    property SMTPPassword: WideString read Get_SMTPPassword;
    property SMTPPort: Integer read Get_SMTPPort;
    property SMTPFromAddress: WideString read Get_SMTPFromAddress;
    property ContinuosRegime: WordBool read Get_ContinuosRegime write Set_ContinuosRegime;
    property Timeout_Radar: Integer read Get_Timeout_Radar write Set_Timeout_Radar;
    property Automatic_Obs: WordBool read Get_Automatic_Obs write Set_Automatic_Obs;
    property Auto_Power_Off: WordBool read Get_Auto_Power_Off write Set_Auto_Power_Off;
    property WarmTime_Radar: Integer read Get_WarmTime_Radar write Set_WarmTime_Radar;
    property RestTime_Radar: Integer read Get_RestTime_Radar write Set_RestTime_Radar;
    property RadarTemperature: Double read Get_RadarTemperature;
    property RadarPressure: Double read Get_RadarPressure;
    property CheckRefPoints: WordBool read Get_CheckRefPoints;
    property RefPointCountCh1: Integer read Get_RefPointCountCh1;
    property CheckPPIParam: WordBool read Get_CheckPPIParam;
    property RefPointsCh1: WideString read Get_RefPointsCh1;
    property RefPointsCh2: WideString read Get_RefPointsCh2;
    property RefPointCountCh2: Integer read Get_RefPointCountCh2;
    property RTPort: Integer read Get_RTPort;
    property RTMaxClients: Integer read Get_RTMaxClients;
    property RT_Speckle_Remove: WordBool read Get_RT_Speckle_Remove write Set_RT_Speckle_Remove;
    property RT_SpeckleUmbral: Integer read Get_RT_SpeckleUmbral write Set_RT_SpeckleUmbral;
    property SpeckleUmbralAz: Integer read Get_SpeckleUmbralAz;
    property SpeckleRemoveAz: WordBool read Get_SpeckleRemoveAz;
    property ClockSource: WordBool read Get_ClockSource;
    property PermanentEchoFilter: WordBool read Get_PermanentEchoFilter;
    property Threshold3cmFilter: Single read Get_Threshold3cmFilter;
    property Threshold10cmFilter: Single read Get_Threshold10cmFilter;
  end;

// *********************************************************************//
// DispIntf:  IConfigurationDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {9F5D7F61-1315-11D4-9BCD-005004063186}
// *********************************************************************//
  IConfigurationDisp = dispinterface
    ['{9F5D7F61-1315-11D4-9BCD-005004063186}']
    property Radar_ID: Integer readonly dispid 1;
    property Obs_Directory: WideString readonly dispid 2;
    property Beam_Ch1: Single readonly dispid 3;
    property Beam_Ch2: Single readonly dispid 4;
    property Speed_Accuracy: Integer readonly dispid 5;
    property Angle_Accuracy: Integer readonly dispid 6;
    property Pack_Method: Integer readonly dispid 7;
    property Timeout_TxRx: Integer readonly dispid 9;
    property Clutter_Clear: WordBool readonly dispid 11;
    property Clutter_Cells: Integer readonly dispid 12;
    property Clutter_Threshold1: Integer readonly dispid 13;
    property Clutter_Threshold2: Integer readonly dispid 14;
    property Speckle_Remove: WordBool readonly dispid 16;
    property Save_Variance: WordBool readonly dispid 17;
    property N1Source: Integer readonly dispid 101;
    property PLRate: Integer readonly dispid 102;
    property PCRate: Integer readonly dispid 104;
    property SampleRate: Integer readonly dispid 107;
    property Ch1Port: Integer readonly dispid 108;
    property Ch2Port: Integer readonly dispid 109;
    property AngleCodeRate: Integer readonly dispid 110;
    property AngleClockwiseRotationX: WordBool readonly dispid 111;
    property AngleClockwiseRotationY: WordBool readonly dispid 112;
    property AngleClockwiseRotationZ: WordBool readonly dispid 113;
    function PCTimes(out Times: {??PSafeArray}OleVariant): HResult; dispid 105;
    function PLTimes(out Times: {??PSafeArray}OleVariant): HResult; dispid 103;
    function AIGains(out Gains: {??PSafeArray}OleVariant): HResult; dispid 106;
    function VideoGains(out Gains: {??PSafeArray}OleVariant): HResult; dispid 115;
    property SpeckleUmbral: Integer readonly dispid 117;
    property RadarName[RadarId: Integer]: WideString readonly dispid 118;
    property RadarOwner[RadarId: Integer]: WideString readonly dispid 119;
    property RadarRange[RadarId: Integer]: Integer readonly dispid 120;
    property RadarLatitude[RadarId: Integer]: Single readonly dispid 121;
    property RadarLongitude[RadarId: Integer]: Single readonly dispid 122;
    property RadarAltitude[RadarId: Integer]: Single readonly dispid 123;
    property RadarBrand[RadarId: Integer]: WideString readonly dispid 124;
    property SendMsgOnError: WordBool readonly dispid 125;
    property TargetAddress: WideString readonly dispid 126;
    property SMTPServer: WideString readonly dispid 127;
    property SMTPUser: WideString readonly dispid 128;
    property SMTPPassword: WideString readonly dispid 129;
    property SMTPPort: Integer readonly dispid 130;
    property SMTPFromAddress: WideString readonly dispid 131;
    property ContinuosRegime: WordBool dispid 114;
    property Timeout_Radar: Integer dispid 116;
    property Automatic_Obs: WordBool dispid 132;
    property Auto_Power_Off: WordBool dispid 133;
    property WarmTime_Radar: Integer dispid 134;
    property RestTime_Radar: Integer dispid 135;
    property RadarTemperature: Double readonly dispid 136;
    property RadarPressure: Double readonly dispid 137;
    property CheckRefPoints: WordBool readonly dispid 138;
    property RefPointCountCh1: Integer readonly dispid 139;
    property CheckPPIParam: WordBool readonly dispid 141;
    property RefPointsCh1: WideString readonly dispid 140;
    property RefPointsCh2: WideString readonly dispid 142;
    property RefPointCountCh2: Integer readonly dispid 143;
    procedure Save; dispid 144;
    property RTPort: Integer readonly dispid 145;
    property RTMaxClients: Integer readonly dispid 146;
    property RT_Speckle_Remove: WordBool dispid 147;
    property RT_SpeckleUmbral: Integer dispid 148;
    property SpeckleUmbralAz: Integer readonly dispid 151;
    property SpeckleRemoveAz: WordBool readonly dispid 152;
    property ClockSource: WordBool readonly dispid 149;
    property PermanentEchoFilter: WordBool readonly dispid 150;
    property Threshold3cmFilter: Single readonly dispid 153;
    property Threshold10cmFilter: Single readonly dispid 154;
  end;

// *********************************************************************//
// Interface: IConfigurationControl
// Flags:     (320) Dual OleAutomation
// GUID:      {9F5D7F64-1315-11D4-9BCD-005004063186}
// *********************************************************************//
  IConfigurationControl = interface(IUnknown)
    ['{9F5D7F64-1315-11D4-9BCD-005004063186}']
    procedure Set_Radar_ID(Param1: Integer); safecall;
    procedure Set_Obs_Directory(const Param1: WideString); safecall;
    procedure Set_Beam_Ch1(Param1: Single); safecall;
    procedure Set_Beam_Ch2(Param1: Single); safecall;
    procedure Set_Speed_Accuracy(Param1: Integer); safecall;
    procedure Set_Angle_Accuracy(Param1: Integer); safecall;
    procedure Set_Pack_Method(Param1: Integer); safecall;
    procedure Set_Timeout_TxRx(Param1: Integer); safecall;
    procedure Set_Clutter_Clear(Param1: WordBool); safecall;
    procedure Set_Clutter_Cells(Param1: Integer); safecall;
    procedure Set_Clutter_Threshold1(Param1: Integer); safecall;
    procedure Set_Clutter_Threshold2(Param1: Integer); safecall;
    procedure Set_Speckle_Remove(Param1: WordBool); safecall;
    procedure Set_Save_Variance(Param1: WordBool); safecall;
    procedure Set_N1Source(Param1: Integer); safecall;
    procedure Set_PLRate(Param1: Integer); safecall;
    procedure Set_PCRate(Param1: Integer); safecall;
    procedure Set_SampleRate(Param1: Integer); safecall;
    procedure Set_Ch1Port(Param1: Integer); safecall;
    procedure Set_Ch2Port(Param1: Integer); safecall;
    procedure Set_AngleCodeRate(Param1: Integer); safecall;
    procedure Set_AngleClockwiseRotationX(Param1: WordBool); safecall;
    procedure Set_AngleClockwiseRotationY(Param1: WordBool); safecall;
    procedure Set_AngleClockwiseRotationZ(Param1: WordBool); safecall;
    function PCTimes(var Times: PSafeArray): HResult; safecall;
    function PLTimes(var Times: PSafeArray): HResult; safecall;
    function AIGains(var Gains: PSafeArray): HResult; safecall;
    function VideoGains(var Gains: PSafeArray): HResult; safecall;
    procedure Set_SpeckleUmbral(Param1: Integer); safecall;
    procedure Set_SMTPPort(Param1: Integer); safecall;
    procedure Set_SMTPUser(const Param1: WideString); safecall;
    procedure Set_SMTPPassword(const Param1: WideString); safecall;
    procedure Set_SendMsgOnError(Param1: WordBool); safecall;
    procedure Set_TargetAddress(const Param1: WideString); safecall;
    procedure Set_SMTPServer(const Param1: WideString); safecall;
    function TestSMTPConfig: WordBool; safecall;
    function SendTestEMail: WordBool; safecall;
    procedure Set_SMTPFromAddress(const Param1: WideString); safecall;
    procedure Set_RadarTemperature(Param1: Double); safecall;
    procedure Set_RadarPressure(Param1: Double); safecall;
    procedure Set_CheckRefPoints(Param1: WordBool); safecall;
    procedure Set_RefPointCountCh1(Param1: Integer); safecall;
    procedure Set_CheckPPIParam(Param1: WordBool); safecall;
    procedure Set_RefPointsCh1(const Param1: WideString); safecall;
    procedure Set_RefPointCountCh2(Param1: Integer); safecall;
    procedure Set_RefPointsCh2(const Param1: WideString); safecall;
    procedure Save; safecall;
    procedure Set_RTPort(Param1: Integer); safecall;
    procedure Set_RTMaxClients(Param1: Integer); safecall;
    procedure Set_SpeckleRemoveAz(Param1: WordBool); safecall;
    procedure Set_SpeckleUmbralAz(Param1: Integer); safecall;
    procedure Set_ClockSource(Param1: WordBool); safecall;
    procedure Set_PermanentEchoFilter(Param1: WordBool); safecall;
    procedure Set_Threshold3cmFilter(Param1: Single); safecall;
    procedure Set_Threshold10cmFilter(Param1: Single); safecall;
    property Radar_ID: Integer write Set_Radar_ID;
    property Obs_Directory: WideString write Set_Obs_Directory;
    property Beam_Ch1: Single write Set_Beam_Ch1;
    property Beam_Ch2: Single write Set_Beam_Ch2;
    property Speed_Accuracy: Integer write Set_Speed_Accuracy;
    property Angle_Accuracy: Integer write Set_Angle_Accuracy;
    property Pack_Method: Integer write Set_Pack_Method;
    property Timeout_TxRx: Integer write Set_Timeout_TxRx;
    property Clutter_Clear: WordBool write Set_Clutter_Clear;
    property Clutter_Cells: Integer write Set_Clutter_Cells;
    property Clutter_Threshold1: Integer write Set_Clutter_Threshold1;
    property Clutter_Threshold2: Integer write Set_Clutter_Threshold2;
    property Speckle_Remove: WordBool write Set_Speckle_Remove;
    property Save_Variance: WordBool write Set_Save_Variance;
    property N1Source: Integer write Set_N1Source;
    property PLRate: Integer write Set_PLRate;
    property PCRate: Integer write Set_PCRate;
    property SampleRate: Integer write Set_SampleRate;
    property Ch1Port: Integer write Set_Ch1Port;
    property Ch2Port: Integer write Set_Ch2Port;
    property AngleCodeRate: Integer write Set_AngleCodeRate;
    property AngleClockwiseRotationX: WordBool write Set_AngleClockwiseRotationX;
    property AngleClockwiseRotationY: WordBool write Set_AngleClockwiseRotationY;
    property AngleClockwiseRotationZ: WordBool write Set_AngleClockwiseRotationZ;
    property SpeckleUmbral: Integer write Set_SpeckleUmbral;
    property SMTPPort: Integer write Set_SMTPPort;
    property SMTPUser: WideString write Set_SMTPUser;
    property SMTPPassword: WideString write Set_SMTPPassword;
    property SendMsgOnError: WordBool write Set_SendMsgOnError;
    property TargetAddress: WideString write Set_TargetAddress;
    property SMTPServer: WideString write Set_SMTPServer;
    property SMTPFromAddress: WideString write Set_SMTPFromAddress;
    property RadarTemperature: Double write Set_RadarTemperature;
    property RadarPressure: Double write Set_RadarPressure;
    property CheckRefPoints: WordBool write Set_CheckRefPoints;
    property RefPointCountCh1: Integer write Set_RefPointCountCh1;
    property CheckPPIParam: WordBool write Set_CheckPPIParam;
    property RefPointsCh1: WideString write Set_RefPointsCh1;
    property RefPointCountCh2: Integer write Set_RefPointCountCh2;
    property RefPointsCh2: WideString write Set_RefPointsCh2;
    property RTPort: Integer write Set_RTPort;
    property RTMaxClients: Integer write Set_RTMaxClients;
    property SpeckleRemoveAz: WordBool write Set_SpeckleRemoveAz;
    property SpeckleUmbralAz: Integer write Set_SpeckleUmbralAz;
    property ClockSource: WordBool write Set_ClockSource;
    property PermanentEchoFilter: WordBool write Set_PermanentEchoFilter;
    property Threshold3cmFilter: Single write Set_Threshold3cmFilter;
    property Threshold10cmFilter: Single write Set_Threshold10cmFilter;
  end;

// *********************************************************************//
// DispIntf:  IConfigurationControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {9F5D7F64-1315-11D4-9BCD-005004063186}
// *********************************************************************//
  IConfigurationControlDisp = dispinterface
    ['{9F5D7F64-1315-11D4-9BCD-005004063186}']
    property Radar_ID: Integer writeonly dispid 1;
    property Obs_Directory: WideString writeonly dispid 2;
    property Beam_Ch1: Single writeonly dispid 3;
    property Beam_Ch2: Single writeonly dispid 4;
    property Speed_Accuracy: Integer writeonly dispid 5;
    property Angle_Accuracy: Integer writeonly dispid 6;
    property Pack_Method: Integer writeonly dispid 7;
    property Timeout_TxRx: Integer writeonly dispid 9;
    property Clutter_Clear: WordBool writeonly dispid 11;
    property Clutter_Cells: Integer writeonly dispid 12;
    property Clutter_Threshold1: Integer writeonly dispid 13;
    property Clutter_Threshold2: Integer writeonly dispid 14;
    property Speckle_Remove: WordBool writeonly dispid 16;
    property Save_Variance: WordBool writeonly dispid 17;
    property N1Source: Integer writeonly dispid 101;
    property PLRate: Integer writeonly dispid 102;
    property PCRate: Integer writeonly dispid 104;
    property SampleRate: Integer writeonly dispid 107;
    property Ch1Port: Integer writeonly dispid 108;
    property Ch2Port: Integer writeonly dispid 109;
    property AngleCodeRate: Integer writeonly dispid 110;
    property AngleClockwiseRotationX: WordBool writeonly dispid 111;
    property AngleClockwiseRotationY: WordBool writeonly dispid 112;
    property AngleClockwiseRotationZ: WordBool writeonly dispid 113;
    function PCTimes(var Times: {??PSafeArray}OleVariant): HResult; dispid 114;
    function PLTimes(var Times: {??PSafeArray}OleVariant): HResult; dispid 103;
    function AIGains(var Gains: {??PSafeArray}OleVariant): HResult; dispid 105;
    function VideoGains(var Gains: {??PSafeArray}OleVariant): HResult; dispid 115;
    property SpeckleUmbral: Integer writeonly dispid 117;
    property SMTPPort: Integer writeonly dispid 118;
    property SMTPUser: WideString writeonly dispid 119;
    property SMTPPassword: WideString writeonly dispid 120;
    property SendMsgOnError: WordBool writeonly dispid 121;
    property TargetAddress: WideString writeonly dispid 122;
    property SMTPServer: WideString writeonly dispid 123;
    function TestSMTPConfig: WordBool; dispid 124;
    function SendTestEMail: WordBool; dispid 125;
    property SMTPFromAddress: WideString writeonly dispid 126;
    property RadarTemperature: Double writeonly dispid 106;
    property RadarPressure: Double writeonly dispid 116;
    property CheckRefPoints: WordBool writeonly dispid 127;
    property RefPointCountCh1: Integer writeonly dispid 128;
    property CheckPPIParam: WordBool writeonly dispid 130;
    property RefPointsCh1: WideString writeonly dispid 129;
    property RefPointCountCh2: Integer writeonly dispid 131;
    property RefPointsCh2: WideString writeonly dispid 132;
    procedure Save; dispid 133;
    property RTPort: Integer writeonly dispid 134;
    property RTMaxClients: Integer writeonly dispid 135;
    property SpeckleRemoveAz: WordBool writeonly dispid 136;
    property SpeckleUmbralAz: Integer writeonly dispid 137;
    property ClockSource: WordBool writeonly dispid 138;
    property PermanentEchoFilter: WordBool writeonly dispid 139;
    property Threshold3cmFilter: Single writeonly dispid 140;
    property Threshold10cmFilter: Single writeonly dispid 141;
  end;

// *********************************************************************//
// Interface: IObservationsControl
// Flags:     (320) Dual OleAutomation
// GUID:      {F12B3162-1575-11D4-9BCE-005004063186}
// *********************************************************************//
  IObservationsControl = interface(IUnknown)
    ['{F12B3162-1575-11D4-9BCE-005004063186}']
    function Nueva: ITemplateControl; safecall;
    function Control(const Name: WideString): ITemplateControl; safecall;
  end;

// *********************************************************************//
// DispIntf:  IObservationsControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {F12B3162-1575-11D4-9BCE-005004063186}
// *********************************************************************//
  IObservationsControlDisp = dispinterface
    ['{F12B3162-1575-11D4-9BCE-005004063186}']
    function Nueva: ITemplateControl; dispid 1;
    function Control(const Name: WideString): ITemplateControl; dispid 2;
  end;

// *********************************************************************//
// Interface: IVideo
// Flags:     (320) Dual OleAutomation
// GUID:      {C26020E3-1F1B-11D4-9C04-005004063186}
// *********************************************************************//
  IVideo = interface(IUnknown)
    ['{C26020E3-1F1B-11D4-9C04-005004063186}']
    function Get_Frecuencia_AD: Integer; safecall;
    function Adquirir_Cuadros(Frames: Integer; Shots: Integer; Cells: Integer; out Ch1: PSafeArray; 
                              out Ch2: PSafeArray; out AntennaPos: SYSINT): HResult; safecall;
    function Get_RTEnabled: WordBool; safecall;
    function Get_RTCellCount: Integer; safecall;
    procedure Acquire_ShotsInSector(StartAngle: Single; FinishAngle: Single; Timeout: Integer; 
                                    King: DesignKind; CellCount: Integer; Channel1: WordBool; 
                                    Channel2: WordBool; const FilePath: WideString); safecall;
    property Frecuencia_AD: Integer read Get_Frecuencia_AD;
    property RTEnabled: WordBool read Get_RTEnabled;
    property RTCellCount: Integer read Get_RTCellCount;
  end;

// *********************************************************************//
// DispIntf:  IVideoDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {C26020E3-1F1B-11D4-9C04-005004063186}
// *********************************************************************//
  IVideoDisp = dispinterface
    ['{C26020E3-1F1B-11D4-9C04-005004063186}']
    property Frecuencia_AD: Integer readonly dispid 1;
    function Adquirir_Cuadros(Frames: Integer; Shots: Integer; Cells: Integer; 
                              out Ch1: {??PSafeArray}OleVariant; out Ch2: {??PSafeArray}OleVariant; 
                              out AntennaPos: SYSINT): HResult; dispid 5;
    property RTEnabled: WordBool readonly dispid 101;
    property RTCellCount: Integer readonly dispid 102;
    procedure Acquire_ShotsInSector(StartAngle: Single; FinishAngle: Single; Timeout: Integer; 
                                    King: DesignKind; CellCount: Integer; Channel1: WordBool; 
                                    Channel2: WordBool; const FilePath: WideString); dispid 103;
  end;

// *********************************************************************//
// Interface: IVideoControl
// Flags:     (320) Dual OleAutomation
// GUID:      {C26020E5-1F1B-11D4-9C04-005004063186}
// *********************************************************************//
  IVideoControl = interface(IUnknown)
    ['{C26020E5-1F1B-11D4-9C04-005004063186}']
    procedure Set_Frecuencia_AD(Param1: Integer); safecall;
    procedure StopRT; safecall;
    procedure StartRT(Ch1: WordBool; Ch2: WordBool; CellCount: Integer); safecall;
    property Frecuencia_AD: Integer write Set_Frecuencia_AD;
  end;

// *********************************************************************//
// DispIntf:  IVideoControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {C26020E5-1F1B-11D4-9C04-005004063186}
// *********************************************************************//
  IVideoControlDisp = dispinterface
    ['{C26020E5-1F1B-11D4-9C04-005004063186}']
    property Frecuencia_AD: Integer writeonly dispid 1;
    procedure StopRT; dispid 101;
    procedure StartRT(Ch1: WordBool; Ch2: WordBool; CellCount: Integer); dispid 102;
  end;

// *********************************************************************//
// Interface: ICalibration
// Flags:     (320) Dual OleAutomation
// GUID:      {942EC368-211C-11D4-9C0D-005004063186}
// *********************************************************************//
  ICalibration = interface(IUnknown)
    ['{942EC368-211C-11D4-9C0D-005004063186}']
    function Get_Codigos: PSafeArray; safecall;
    function Get_Potencia: Integer; safecall;
    function Get_CRadarPL: Single; safecall;
    function Get_CRadarPC: Single; safecall;
    function Get_PotMetPL: Single; safecall;
    function Get_PotMetPC: Single; safecall;
    property Codigos: PSafeArray read Get_Codigos;
    property Potencia: Integer read Get_Potencia;
    property CRadarPL: Single read Get_CRadarPL;
    property CRadarPC: Single read Get_CRadarPC;
    property PotMetPL: Single read Get_PotMetPL;
    property PotMetPC: Single read Get_PotMetPC;
  end;

// *********************************************************************//
// DispIntf:  ICalibrationDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {942EC368-211C-11D4-9C0D-005004063186}
// *********************************************************************//
  ICalibrationDisp = dispinterface
    ['{942EC368-211C-11D4-9C0D-005004063186}']
    property Codigos: {??PSafeArray}OleVariant readonly dispid 1;
    property Potencia: Integer readonly dispid 3;
    property CRadarPL: Single readonly dispid 4;
    property CRadarPC: Single readonly dispid 5;
    property PotMetPL: Single readonly dispid 6;
    property PotMetPC: Single readonly dispid 7;
  end;

// *********************************************************************//
// Interface: ICalibrationControl
// Flags:     (320) Dual OleAutomation
// GUID:      {942EC36A-211C-11D4-9C0D-005004063186}
// *********************************************************************//
  ICalibrationControl = interface(IUnknown)
    ['{942EC36A-211C-11D4-9C0D-005004063186}']
    procedure Set_Codigos(Param1: PSafeArray); safecall;
    procedure Set_Potencia(Param1: Integer); safecall;
    procedure Set_CRadarPL(Param1: Single); safecall;
    procedure Set_CRadarPC(Param1: Single); safecall;
    property Codigos: PSafeArray write Set_Codigos;
    property Potencia: Integer write Set_Potencia;
    property CRadarPL: Single write Set_CRadarPL;
    property CRadarPC: Single write Set_CRadarPC;
  end;

// *********************************************************************//
// DispIntf:  ICalibrationControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {942EC36A-211C-11D4-9C0D-005004063186}
// *********************************************************************//
  ICalibrationControlDisp = dispinterface
    ['{942EC36A-211C-11D4-9C0D-005004063186}']
    property Codigos: {??PSafeArray}OleVariant writeonly dispid 1;
    property Potencia: Integer writeonly dispid 3;
    property CRadarPL: Single writeonly dispid 4;
    property CRadarPC: Single writeonly dispid 5;
  end;

// *********************************************************************//
// Interface: ITxRxMeasure
// Flags:     (320) Dual OleAutomation
// GUID:      {75CC7C80-29DD-11D4-9C1E-005004063186}
// *********************************************************************//
  ITxRxMeasure = interface(IUnknown)
    ['{75CC7C80-29DD-11D4-9C1E-005004063186}']
    function Get_Rango_Tx_Potencia: Integer; safecall;
    function Get_Rango_Rx_Sintonia: Integer; safecall;
    function Get_Rango_Rx_Ganancia: Integer; safecall;
    function Get_Rango_Rx_Ruido: Integer; safecall;
    function Get_Sector_Tx_Potencia: Integer; safecall;
    function Get_Sector_Rx_Sintonia: Integer; safecall;
    function Get_Sector_Rx_Ganancia: Integer; safecall;
    function Get_Sector_Rx_Ruido: Integer; safecall;
    property Rango_Tx_Potencia: Integer read Get_Rango_Tx_Potencia;
    property Rango_Rx_Sintonia: Integer read Get_Rango_Rx_Sintonia;
    property Rango_Rx_Ganancia: Integer read Get_Rango_Rx_Ganancia;
    property Rango_Rx_Ruido: Integer read Get_Rango_Rx_Ruido;
    property Sector_Tx_Potencia: Integer read Get_Sector_Tx_Potencia;
    property Sector_Rx_Sintonia: Integer read Get_Sector_Rx_Sintonia;
    property Sector_Rx_Ganancia: Integer read Get_Sector_Rx_Ganancia;
    property Sector_Rx_Ruido: Integer read Get_Sector_Rx_Ruido;
  end;

// *********************************************************************//
// DispIntf:  ITxRxMeasureDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {75CC7C80-29DD-11D4-9C1E-005004063186}
// *********************************************************************//
  ITxRxMeasureDisp = dispinterface
    ['{75CC7C80-29DD-11D4-9C1E-005004063186}']
    property Rango_Tx_Potencia: Integer readonly dispid 14;
    property Rango_Rx_Sintonia: Integer readonly dispid 15;
    property Rango_Rx_Ganancia: Integer readonly dispid 16;
    property Rango_Rx_Ruido: Integer readonly dispid 17;
    property Sector_Tx_Potencia: Integer readonly dispid 18;
    property Sector_Rx_Sintonia: Integer readonly dispid 19;
    property Sector_Rx_Ganancia: Integer readonly dispid 20;
    property Sector_Rx_Ruido: Integer readonly dispid 21;
  end;

// *********************************************************************//
// Interface: ITxRxMeasureControl
// Flags:     (320) Dual OleAutomation
// GUID:      {75CC7C82-29DD-11D4-9C1E-005004063186}
// *********************************************************************//
  ITxRxMeasureControl = interface(IUnknown)
    ['{75CC7C82-29DD-11D4-9C1E-005004063186}']
    procedure Set_Rango_Tx_Potencia(Param1: Integer); safecall;
    procedure Set_Rango_Rx_Sintonia(Param1: Integer); safecall;
    procedure Set_Rango_Rx_Ganancia(Param1: Integer); safecall;
    procedure Set_Rango_Rx_Ruido(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Potencia(Param1: Integer); safecall;
    procedure Set_Sector_Rx_Sintonia(Param1: Integer); safecall;
    procedure Set_Sector_Rx_Ganancia(Param1: Integer); safecall;
    procedure Set_Sector_Rx_Ruido(Param1: Integer); safecall;
    property Rango_Tx_Potencia: Integer write Set_Rango_Tx_Potencia;
    property Rango_Rx_Sintonia: Integer write Set_Rango_Rx_Sintonia;
    property Rango_Rx_Ganancia: Integer write Set_Rango_Rx_Ganancia;
    property Rango_Rx_Ruido: Integer write Set_Rango_Rx_Ruido;
    property Sector_Tx_Potencia: Integer write Set_Sector_Tx_Potencia;
    property Sector_Rx_Sintonia: Integer write Set_Sector_Rx_Sintonia;
    property Sector_Rx_Ganancia: Integer write Set_Sector_Rx_Ganancia;
    property Sector_Rx_Ruido: Integer write Set_Sector_Rx_Ruido;
  end;

// *********************************************************************//
// DispIntf:  ITxRxMeasureControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {75CC7C82-29DD-11D4-9C1E-005004063186}
// *********************************************************************//
  ITxRxMeasureControlDisp = dispinterface
    ['{75CC7C82-29DD-11D4-9C1E-005004063186}']
    property Rango_Tx_Potencia: Integer writeonly dispid 14;
    property Rango_Rx_Sintonia: Integer writeonly dispid 15;
    property Rango_Rx_Ganancia: Integer writeonly dispid 16;
    property Rango_Rx_Ruido: Integer writeonly dispid 17;
    property Sector_Tx_Potencia: Integer writeonly dispid 18;
    property Sector_Rx_Sintonia: Integer writeonly dispid 19;
    property Sector_Rx_Ganancia: Integer writeonly dispid 20;
    property Sector_Rx_Ruido: Integer writeonly dispid 21;
  end;

// *********************************************************************//
// Interface: IObservation
// Flags:     (320) Dual OleAutomation
// GUID:      {0A9C3931-2B3B-11D4-9C28-005004063186}
// *********************************************************************//
  IObservation = interface(IUnknown)
    ['{0A9C3931-2B3B-11D4-9C28-005004063186}']
    function Get_InProgress: WordBool; safecall;
    function Get_Name: WideString; safecall;
    function Get_Client: WideString; safecall;
    function Get_StartTime: TDateTime; safecall;
    function Get_LastTime: TDateTime; safecall;
    function Get_Progress: Integer; safecall;
    function Get_Message: WideString; safecall;
    function Get_SubMsg: WideString; safecall;
    function Get_Result: Integer; safecall;
    procedure Cancel; safecall;
    property InProgress: WordBool read Get_InProgress;
    property Name: WideString read Get_Name;
    property Client: WideString read Get_Client;
    property StartTime: TDateTime read Get_StartTime;
    property LastTime: TDateTime read Get_LastTime;
    property Progress: Integer read Get_Progress;
    property Message: WideString read Get_Message;
    property SubMsg: WideString read Get_SubMsg;
    property Result: Integer read Get_Result;
  end;

// *********************************************************************//
// DispIntf:  IObservationDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {0A9C3931-2B3B-11D4-9C28-005004063186}
// *********************************************************************//
  IObservationDisp = dispinterface
    ['{0A9C3931-2B3B-11D4-9C28-005004063186}']
    property InProgress: WordBool readonly dispid 1;
    property Name: WideString readonly dispid 2;
    property Client: WideString readonly dispid 3;
    property StartTime: TDateTime readonly dispid 4;
    property LastTime: TDateTime readonly dispid 5;
    property Progress: Integer readonly dispid 6;
    property Message: WideString readonly dispid 7;
    property SubMsg: WideString readonly dispid 8;
    property Result: Integer readonly dispid 9;
    procedure Cancel; dispid 10;
  end;

// *********************************************************************//
// Interface: IAntena
// Flags:     (256) OleAutomation
// GUID:      {7F46A0B8-1661-4432-BE92-A43CC5717F53}
// *********************************************************************//
  IAntena = interface(IUnknown)
    ['{7F46A0B8-1661-4432-BE92-A43CC5717F53}']
  end;

// *********************************************************************//
// The Class CoVestaRDA provides a Create and CreateRemote method to          
// create instances of the default interface IVestaRDA exposed by              
// the CoClass VestaRDA. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVestaRDA = class
    class function Create: IVestaRDA;
    class function CreateRemote(const MachineName: string): IVestaRDA;
  end;

// *********************************************************************//
// The Class CoAntena provides a Create and CreateRemote method to          
// create instances of the default interface IAntena exposed by              
// the CoClass Antena. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAntena = class
    class function Create: IAntena;
    class function CreateRemote(const MachineName: string): IAntena;
  end;

implementation

uses ComObj;

class function CoVestaRDA.Create: IVestaRDA;
begin
  Result := CreateComObject(CLASS_VestaRDA) as IVestaRDA;
end;

class function CoVestaRDA.CreateRemote(const MachineName: string): IVestaRDA;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VestaRDA) as IVestaRDA;
end;

class function CoAntena.Create: IAntena;
begin
  Result := CreateComObject(CLASS_Antena) as IAntena;
end;

class function CoAntena.CreateRemote(const MachineName: string): IAntena;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Antena) as IAntena;
end;

end.
