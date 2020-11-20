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
// File generated on 4/10/2012 10:41:53 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: G:\Work\Doppler RDA\Vesta Control\Win32Rda\Rda.tlb (1)
// LIBID: {F14A4213-28D0-4370-98C2-311B2EE413A8}
// LCID: 0
// Helpfile: 
// HelpString: Rda Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
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

  LIBID_Rda: TGUID = '{F14A4213-28D0-4370-98C2-311B2EE413A8}';

  IID_IVestaRda: TGUID = '{0E77DAC8-AD7C-468B-B8A8-87667FE2DF3C}';
  DIID_IVestaRdaEvents: TGUID = '{E91350B6-543B-4A3E-8FD8-64FA3D4D5D48}';
  IID_ILogin: TGUID = '{E058FBC8-6254-4583-9921-BD4B5615DDBF}';
  IID_IRadar: TGUID = '{B53EBA9D-6BD4-4DDF-8566-EC77A4436BFA}';
  IID_IMotorStatus: TGUID = '{BC188781-5E0A-49B0-A40E-37C90C440BEA}';
  IID_IMotorControl: TGUID = '{D6EA01F5-85E5-4236-BDFB-1A3D9F177652}';
  CLASS_VestaRda: TGUID = '{6C8CA0BB-155C-4FF7-8CA2-35A5CA82B9ED}';
  IID_IRadarControl: TGUID = '{1801280B-C8D2-4307-95EA-8E9CC3779CD7}';
  IID_IAntennaControl: TGUID = '{FF9BA41F-2004-4AF5-B054-B1EBD6DD60CD}';
  IID_IConfiguration: TGUID = '{11A27258-D8EE-4590-A8F6-998831135375}';
  IID_IConfigurationControl: TGUID = '{91864F4C-C3FB-4281-8B02-88F6D594E3F9}';
  IID_IVideoControl: TGUID = '{24408E8B-4E5B-4186-9C67-9F0263F639B3}';
  IID_ICalibration: TGUID = '{BFE2A3CF-BC33-4688-A135-38CB8DF5E6AD}';
  IID_ICalibrationControl: TGUID = '{3D401C1A-1B8F-4681-B043-CFE3B8C89DE1}';
  IID_ITxRxMeasure: TGUID = '{F19BB556-F17E-4D43-8065-050CD604C48B}';
  IID_ITxRxMeasureControl: TGUID = '{0620776F-8548-4D31-8A2E-A99D44E64992}';
  IID_IObservation: TGUID = '{36BCEE73-6DF2-4F86-8A2F-1752FB61EC08}';
  IID_ITxRxStatus: TGUID = '{720B3EDA-F50B-432A-B0DF-2B9BA5879CFD}';
  IID_IAntenna: TGUID = '{37A6997D-B58F-48A6-BD75-3FF18C1FAC60}';
  IID_ITxsRxs: TGUID = '{37CA8C15-9064-4E49-B6C4-539DA762E971}';
  IID_ISynchro: TGUID = '{7A63E609-FC3F-4153-8A14-23F5CBCE0914}';
  IID_ITemplate: TGUID = '{B7BAE3C1-21ED-453F-9F0A-C2D21C3353F2}';
  IID_ITemplateControl: TGUID = '{D7E21C97-B28A-455E-AA07-C7A5A4B33DF7}';
  IID_IObservations: TGUID = '{C7515B26-BB5B-4823-9C06-CAE3AC76B545}';
  IID_IObservationsControl: TGUID = '{69CDD5C2-7A7E-453F-8772-40E9D779E808}';
  IID_IVideo: TGUID = '{348983B0-49C9-4BA2-B9C4-5D494614360B}';
  IID_IStatistics: TGUID = '{EFC42B77-2BE7-4EBE-B75E-A748DB6FDB52}';
  IID_IStatisticsControl: TGUID = '{44A5E77C-F387-4D20-A048-4E08DAE6D57A}';
  IID_ITxControl: TGUID = '{C81004B4-F810-4EE3-88BD-14A4E327DE69}';
  IID_IRxControl: TGUID = '{485C6791-8868-4C1C-B21C-16E752D6F80D}';
  IID_ITxStatus: TGUID = '{35E03B50-B395-45E7-BFFA-6388A2BD274C}';
  IID_IRxStatus: TGUID = '{C0E2147E-F462-4CB6-BB97-DD71AB30F107}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxPulse
type
  TxPulse = TOleEnum;
const
  tx_Pulse_Long = $00000000;
  tx_Pulse_Short = $00000001;
  tx_Pulse_None = $00000003;
  tx_Pulse_Dual = $00000002;

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

// Constants for enum RadarBrands
type
  RadarBrands = TOleEnum;
const
  rbUnknown = $00000000;
  rbMRL5 = $00000001;
  rbRC32B = $00000002;
  rbMRL5M = $00000003;
  rbResearch = $00000004;

// Constants for enum TxDualPulse
type
  TxDualPulse = TOleEnum;
const
  tx_Dual_54 = $00000000;
  tx_Dual_43 = $00000001;
  tx_Dual_32 = $00000002;
  tx_Dual_None = $00000003;

// Constants for enum RadarStatus
type
  RadarStatus = TOleEnum;
const
  rsOff = $00000000;
  rsFailure = $00000001;
  rsOk = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IVestaRda = interface;
  IVestaRdaDisp = dispinterface;
  IVestaRdaEvents = dispinterface;
  ILogin = interface;
  ILoginDisp = dispinterface;
  IRadar = interface;
  IRadarDisp = dispinterface;
  IMotorStatus = interface;
  IMotorStatusDisp = dispinterface;
  IMotorControl = interface;
  IMotorControlDisp = dispinterface;
  IRadarControl = interface;
  IRadarControlDisp = dispinterface;
  IAntennaControl = interface;
  IAntennaControlDisp = dispinterface;
  IConfiguration = interface;
  IConfigurationDisp = dispinterface;
  IConfigurationControl = interface;
  IConfigurationControlDisp = dispinterface;
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
  ITxRxStatus = interface;
  ITxRxStatusDisp = dispinterface;
  IAntenna = interface;
  IAntennaDisp = dispinterface;
  ITxsRxs = interface;
  ITxsRxsDisp = dispinterface;
  ISynchro = interface;
  ISynchroDisp = dispinterface;
  ITemplate = interface;
  ITemplateDisp = dispinterface;
  ITemplateControl = interface;
  ITemplateControlDisp = dispinterface;
  IObservations = interface;
  IObservationsDisp = dispinterface;
  IObservationsControl = interface;
  IObservationsControlDisp = dispinterface;
  IVideo = interface;
  IVideoDisp = dispinterface;
  IStatistics = interface;
  IStatisticsDisp = dispinterface;
  IStatisticsControl = interface;
  IStatisticsControlDisp = dispinterface;
  ITxControl = interface;
  ITxControlDisp = dispinterface;
  IRxControl = interface;
  IRxControlDisp = dispinterface;
  ITxStatus = interface;
  ITxStatusDisp = dispinterface;
  IRxStatus = interface;
  IRxStatusDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  VestaRda = IVestaRda;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPSafeArray1 = ^PSafeArray; {*}

  MaxMin = packed record
    Min: Smallint;
    Max: Smallint;
  end;

  FormatData = packed record
    Onda: Integer;
    Celdas: Integer;
    Long: Integer;
    PotMet: Single;
  end;

  MovementData = packed record
    Angle: Integer;
    Speed: Integer;
    Pulse: TxPulse;
    Rate: TxDualPulse;
  end;

  FilterData = packed record
    B0: Double;
    B1: Double;
    B2: Double;
    B3: Double;
    B4: Double;
    C1: Double;
    C2: Double;
    C3: Double;
    C4: Double;
    Name: WideString;
  end;


// *********************************************************************//
// Interface: IVestaRda
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E77DAC8-AD7C-468B-B8A8-87667FE2DF3C}
// *********************************************************************//
  IVestaRda = interface(IDispatch)
    ['{0E77DAC8-AD7C-468B-B8A8-87667FE2DF3C}']
    function Get_Radar: IRadar; safecall;
    function Get_TxsRxs: ITxsRxs; safecall;
    function Get_Antenna: IAntenna; safecall;
    function Get_Configuration: IConfiguration; safecall;
    function Get_Observations: IObservations; safecall;
    function Get_MaxLogEntries: Integer; safecall;
    function LogMessageTitles(out LogMessages: PSafeArray; out MsgCount: Integer): HResult; safecall;
    function Get_Version: WideString; safecall;
    function Get_SystemDateTime: Double; safecall;
    function Get_SystemTimeZone: Double; safecall;
    procedure LogMessage(MsgCode: Integer; out DateTime: TDateTime; out Category: Integer; 
                         out Client: WideString; out Title: WideString; out Msg: WideString; 
                         out Zone: WideString); safecall;
    function Get_Statistics: IStatistics; safecall;
    property Radar: IRadar read Get_Radar;
    property TxsRxs: ITxsRxs read Get_TxsRxs;
    property Antenna: IAntenna read Get_Antenna;
    property Configuration: IConfiguration read Get_Configuration;
    property Observations: IObservations read Get_Observations;
    property MaxLogEntries: Integer read Get_MaxLogEntries;
    property Version: WideString read Get_Version;
    property SystemDateTime: Double read Get_SystemDateTime;
    property SystemTimeZone: Double read Get_SystemTimeZone;
    property Statistics: IStatistics read Get_Statistics;
  end;

// *********************************************************************//
// DispIntf:  IVestaRdaDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0E77DAC8-AD7C-468B-B8A8-87667FE2DF3C}
// *********************************************************************//
  IVestaRdaDisp = dispinterface
    ['{0E77DAC8-AD7C-468B-B8A8-87667FE2DF3C}']
    property Radar: IRadar readonly dispid 201;
    property TxsRxs: ITxsRxs readonly dispid 202;
    property Antenna: IAntenna readonly dispid 203;
    property Configuration: IConfiguration readonly dispid 204;
    property Observations: IObservations readonly dispid 205;
    property MaxLogEntries: Integer readonly dispid 206;
    function LogMessageTitles(out LogMessages: {??PSafeArray}OleVariant; out MsgCount: Integer): HResult; dispid 207;
    property Version: WideString readonly dispid 208;
    property SystemDateTime: Double readonly dispid 209;
    property SystemTimeZone: Double readonly dispid 210;
    procedure LogMessage(MsgCode: Integer; out DateTime: TDateTime; out Category: Integer; 
                         out Client: WideString; out Title: WideString; out Msg: WideString; 
                         out Zone: WideString); dispid 211;
    property Statistics: IStatistics readonly dispid 212;
  end;

// *********************************************************************//
// DispIntf:  IVestaRdaEvents
// Flags:     (4096) Dispatchable
// GUID:      {E91350B6-543B-4A3E-8FD8-64FA3D4D5D48}
// *********************************************************************//
  IVestaRdaEvents = dispinterface
    ['{E91350B6-543B-4A3E-8FD8-64FA3D4D5D48}']
  end;

// *********************************************************************//
// Interface: ILogin
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E058FBC8-6254-4583-9921-BD4B5615DDBF}
// *********************************************************************//
  ILogin = interface(IDispatch)
    ['{E058FBC8-6254-4583-9921-BD4B5615DDBF}']
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
// GUID:      {E058FBC8-6254-4583-9921-BD4B5615DDBF}
// *********************************************************************//
  ILoginDisp = dispinterface
    ['{E058FBC8-6254-4583-9921-BD4B5615DDBF}']
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
// Interface: IRadar
// Flags:     (320) Dual OleAutomation
// GUID:      {B53EBA9D-6BD4-4DDF-8566-EC77A4436BFA}
// *********************************************************************//
  IRadar = interface(IUnknown)
    ['{B53EBA9D-6BD4-4DDF-8566-EC77A4436BFA}']
    function Get_Red_Listo: WordBool; safecall;
    function Get_Radar_On: WordBool; safecall;
    function Get_Tx1Status: RadarStatus; safecall;
    function Get_Tx2Status: RadarStatus; safecall;
    function Get_Rx1Status: RadarStatus; safecall;
    function Get_Rx2Status: RadarStatus; safecall;
    function Get_AntennaStatus: RadarStatus; safecall;
    function Get_Status: RadarStatus; safecall;
    property Red_Listo: WordBool read Get_Red_Listo;
    property Radar_On: WordBool read Get_Radar_On;
    property Tx1Status: RadarStatus read Get_Tx1Status;
    property Tx2Status: RadarStatus read Get_Tx2Status;
    property Rx1Status: RadarStatus read Get_Rx1Status;
    property Rx2Status: RadarStatus read Get_Rx2Status;
    property AntennaStatus: RadarStatus read Get_AntennaStatus;
    property Status: RadarStatus read Get_Status;
  end;

// *********************************************************************//
// DispIntf:  IRadarDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {B53EBA9D-6BD4-4DDF-8566-EC77A4436BFA}
// *********************************************************************//
  IRadarDisp = dispinterface
    ['{B53EBA9D-6BD4-4DDF-8566-EC77A4436BFA}']
    property Red_Listo: WordBool readonly dispid 1;
    property Radar_On: WordBool readonly dispid 2;
    property Tx1Status: RadarStatus readonly dispid 103;
    property Tx2Status: RadarStatus readonly dispid 104;
    property Rx1Status: RadarStatus readonly dispid 105;
    property Rx2Status: RadarStatus readonly dispid 106;
    property AntennaStatus: RadarStatus readonly dispid 107;
    property Status: RadarStatus readonly dispid 108;
  end;

// *********************************************************************//
// Interface: IMotorStatus
// Flags:     (320) Dual OleAutomation
// GUID:      {BC188781-5E0A-49B0-A40E-37C90C440BEA}
// *********************************************************************//
  IMotorStatus = interface(IUnknown)
    ['{BC188781-5E0A-49B0-A40E-37C90C440BEA}']
    function Get_Posicion: Integer; safecall;
    function Get_Velocidad: Integer; safecall;
    function Get_SP_Posicion: Integer; safecall;
    function Get_SP_Velocidad: Integer; safecall;
    function Get_Lazo_Posicion: WordBool; safecall;
    function Get_Acc_Listo: WordBool; safecall;
    function Get_Marca_Posicion: Integer; safecall;
    function Get_Lazo_Sector: WordBool; safecall;
    function Get_Status: RadarStatus; safecall;
    function Get_Taco_Code: Integer; safecall;
    function Get_Taco_Unit: Double; safecall;
    function Get_Range_Taco: Integer; safecall;
    function Get_Sector_Taco: Integer; safecall;
    property Posicion: Integer read Get_Posicion;
    property Velocidad: Integer read Get_Velocidad;
    property SP_Posicion: Integer read Get_SP_Posicion;
    property SP_Velocidad: Integer read Get_SP_Velocidad;
    property Lazo_Posicion: WordBool read Get_Lazo_Posicion;
    property Acc_Listo: WordBool read Get_Acc_Listo;
    property Marca_Posicion: Integer read Get_Marca_Posicion;
    property Lazo_Sector: WordBool read Get_Lazo_Sector;
    property Status: RadarStatus read Get_Status;
    property Taco_Code: Integer read Get_Taco_Code;
    property Taco_Unit: Double read Get_Taco_Unit;
    property Range_Taco: Integer read Get_Range_Taco;
    property Sector_Taco: Integer read Get_Sector_Taco;
  end;

// *********************************************************************//
// DispIntf:  IMotorStatusDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {BC188781-5E0A-49B0-A40E-37C90C440BEA}
// *********************************************************************//
  IMotorStatusDisp = dispinterface
    ['{BC188781-5E0A-49B0-A40E-37C90C440BEA}']
    property Posicion: Integer readonly dispid 1;
    property Velocidad: Integer readonly dispid 2;
    property SP_Posicion: Integer readonly dispid 5;
    property SP_Velocidad: Integer readonly dispid 6;
    property Lazo_Posicion: WordBool readonly dispid 7;
    property Acc_Listo: WordBool readonly dispid 4;
    property Marca_Posicion: Integer readonly dispid 101;
    property Lazo_Sector: WordBool readonly dispid 102;
    property Status: RadarStatus readonly dispid 113;
    property Taco_Code: Integer readonly dispid 103;
    property Taco_Unit: Double readonly dispid 104;
    property Range_Taco: Integer readonly dispid 114;
    property Sector_Taco: Integer readonly dispid 115;
  end;

// *********************************************************************//
// Interface: IMotorControl
// Flags:     (320) Dual OleAutomation
// GUID:      {D6EA01F5-85E5-4236-BDFB-1A3D9F177652}
// *********************************************************************//
  IMotorControl = interface(IUnknown)
    ['{D6EA01F5-85E5-4236-BDFB-1A3D9F177652}']
    procedure Set_SP_Posicion(Param1: Integer); safecall;
    procedure Set_SP_Velocidad(Param1: Integer); safecall;
    procedure Set_Lazo_Posicion(Param1: WordBool); safecall;
    function Get_Lazo_Posicion_K: Single; safecall;
    procedure Set_Lazo_Posicion_K(Value: Single); safecall;
    function Get_Lazo_Velocidad_K: Single; safecall;
    procedure Set_Lazo_Velocidad_K(Value: Single); safecall;
    procedure Set_Marca_Posicion(Param1: Integer); safecall;
    procedure Set_Lazo_Sector(Param1: WordBool); safecall;
    procedure Set_Range_Taco(Param1: Integer); safecall;
    procedure Set_Sector_Taco(Param1: Integer); safecall;
    property SP_Posicion: Integer write Set_SP_Posicion;
    property SP_Velocidad: Integer write Set_SP_Velocidad;
    property Lazo_Posicion: WordBool write Set_Lazo_Posicion;
    property Lazo_Posicion_K: Single read Get_Lazo_Posicion_K write Set_Lazo_Posicion_K;
    property Lazo_Velocidad_K: Single read Get_Lazo_Velocidad_K write Set_Lazo_Velocidad_K;
    property Marca_Posicion: Integer write Set_Marca_Posicion;
    property Lazo_Sector: WordBool write Set_Lazo_Sector;
    property Range_Taco: Integer write Set_Range_Taco;
    property Sector_Taco: Integer write Set_Sector_Taco;
  end;

// *********************************************************************//
// DispIntf:  IMotorControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {D6EA01F5-85E5-4236-BDFB-1A3D9F177652}
// *********************************************************************//
  IMotorControlDisp = dispinterface
    ['{D6EA01F5-85E5-4236-BDFB-1A3D9F177652}']
    property SP_Posicion: Integer writeonly dispid 1;
    property SP_Velocidad: Integer writeonly dispid 2;
    property Lazo_Posicion: WordBool writeonly dispid 3;
    property Lazo_Posicion_K: Single dispid 5;
    property Lazo_Velocidad_K: Single dispid 4;
    property Marca_Posicion: Integer writeonly dispid 101;
    property Lazo_Sector: WordBool writeonly dispid 102;
    property Range_Taco: Integer writeonly dispid 107;
    property Sector_Taco: Integer writeonly dispid 108;
  end;

// *********************************************************************//
// Interface: IRadarControl
// Flags:     (320) Dual OleAutomation
// GUID:      {1801280B-C8D2-4307-95EA-8E9CC3779CD7}
// *********************************************************************//
  IRadarControl = interface(IUnknown)
    ['{1801280B-C8D2-4307-95EA-8E9CC3779CD7}']
    procedure Encender_Radar; safecall;
    procedure Apagar_Radar; safecall;
  end;

// *********************************************************************//
// DispIntf:  IRadarControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {1801280B-C8D2-4307-95EA-8E9CC3779CD7}
// *********************************************************************//
  IRadarControlDisp = dispinterface
    ['{1801280B-C8D2-4307-95EA-8E9CC3779CD7}']
    procedure Encender_Radar; dispid 1;
    procedure Apagar_Radar; dispid 2;
  end;

// *********************************************************************//
// Interface: IAntennaControl
// Flags:     (320) Dual OleAutomation
// GUID:      {FF9BA41F-2004-4AF5-B054-B1EBD6DD60CD}
// *********************************************************************//
  IAntennaControl = interface(IUnknown)
    ['{FF9BA41F-2004-4AF5-B054-B1EBD6DD60CD}']
    procedure Encender_Acc; safecall;
    procedure Apagar_Acc; safecall;
    procedure Alarma_Sonora(Tiempo: Integer); safecall;
    procedure Set_SyncMark(direction: WordBool; rays: Shortint); safecall;
    procedure Set_Rango_Fuente_5V(Param1: Integer); safecall;
    procedure Set_Sector_Fuente_5V(Param1: Integer); safecall;
    procedure Set_Sector_Fuente_12V(Param1: Integer); safecall;
    procedure Set_Rango_Fuente_12V(Param1: Integer); safecall;
    procedure Set_Rango_Fuente_24V(Param1: Integer); safecall;
    procedure Set_Sector_Fuente_24V(Param1: Integer); safecall;
    procedure Set_Rango_Fuente_Excitacion(Param1: Integer); safecall;
    procedure Set_Sector_Fuente_Excitacion(Param1: Integer); safecall;
    property Rango_Fuente_5V: Integer write Set_Rango_Fuente_5V;
    property Sector_Fuente_5V: Integer write Set_Sector_Fuente_5V;
    property Sector_Fuente_12V: Integer write Set_Sector_Fuente_12V;
    property Rango_Fuente_12V: Integer write Set_Rango_Fuente_12V;
    property Rango_Fuente_24V: Integer write Set_Rango_Fuente_24V;
    property Sector_Fuente_24V: Integer write Set_Sector_Fuente_24V;
    property Rango_Fuente_Excitacion: Integer write Set_Rango_Fuente_Excitacion;
    property Sector_Fuente_Excitacion: Integer write Set_Sector_Fuente_Excitacion;
  end;

// *********************************************************************//
// DispIntf:  IAntennaControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {FF9BA41F-2004-4AF5-B054-B1EBD6DD60CD}
// *********************************************************************//
  IAntennaControlDisp = dispinterface
    ['{FF9BA41F-2004-4AF5-B054-B1EBD6DD60CD}']
    procedure Encender_Acc; dispid 1;
    procedure Apagar_Acc; dispid 2;
    procedure Alarma_Sonora(Tiempo: Integer); dispid 3;
    procedure Set_SyncMark(direction: WordBool; rays: {??Shortint}OleVariant); dispid 108;
    property Rango_Fuente_5V: Integer writeonly dispid 101;
    property Sector_Fuente_5V: Integer writeonly dispid 102;
    property Sector_Fuente_12V: Integer writeonly dispid 103;
    property Rango_Fuente_12V: Integer writeonly dispid 104;
    property Rango_Fuente_24V: Integer writeonly dispid 105;
    property Sector_Fuente_24V: Integer writeonly dispid 106;
    property Rango_Fuente_Excitacion: Integer writeonly dispid 107;
    property Sector_Fuente_Excitacion: Integer writeonly dispid 109;
  end;

// *********************************************************************//
// Interface: IConfiguration
// Flags:     (320) Dual OleAutomation
// GUID:      {11A27258-D8EE-4590-A8F6-998831135375}
// *********************************************************************//
  IConfiguration = interface(IUnknown)
    ['{11A27258-D8EE-4590-A8F6-998831135375}']
    function Get_Radar_ID: Integer; safecall;
    function Get_Obs_Directory: WideString; safecall;
    function Get_Beam_Ch1: Single; safecall;
    function Get_Beam_Ch2: Single; safecall;
    function Get_Speed_Accuracy: Integer; safecall;
    function Get_Angle_Accuracy: Integer; safecall;
    function Get_Pack_Method: Integer; safecall;
    function Get_Timeout_TxRx: Integer; safecall;
    function Get_Speckle_Remove: WordBool; safecall;
    function Get_Save_Variance: WordBool; safecall;
    function Get_AngleCodeRate: Integer; safecall;
    function Get_AngleClockwiseRotationX: WordBool; safecall;
    function Get_AngleClockwiseRotationY: WordBool; safecall;
    function Get_AngleClockwiseRotationZ: WordBool; safecall;
    function AIGains(out Gains: PSafeArray): HResult; safecall;
    function Get_SpeckleUmbral: Integer; safecall;
    function Get_RadarName(RadarId: Integer): WideString; safecall;
    function Get_RadarOwner(RadarId: Integer): WideString; safecall;
    function Get_RadarRange(RadarId: Integer): Integer; safecall;
    function Get_RadarLatitude(RadarId: Integer): Single; safecall;
    function Get_RadarLongitude(RadarId: Integer): Single; safecall;
    function Get_RadarAltitude(RadarId: Integer): Single; safecall;
    function Get_RadarBrand(RadarId: Integer): RadarBrands; safecall;
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
    function Get_CheckPPIParam: WordBool; safecall;
    procedure Save; safecall;
    function Get_RT_SpeckleUmbral: Integer; safecall;
    procedure Set_RT_SpeckleUmbral(Value: Integer); safecall;
    function Get_WSPort: Integer; safecall;
    function Get_StreamPort: Integer; safecall;
    function Get_RT_Speckle_Remove: WordBool; safecall;
    procedure Set_RT_Speckle_Remove(Value: WordBool); safecall;
    function AIFactors(out Factors: PSafeArray): HResult; safecall;
    function Filter(Index: Integer; out Name: WideString; out B0: Double; out B1: Double; 
                    out B2: Double; out B3: Double; out B4: Double; out C1: Double; out C2: Double; 
                    out C3: Double; out C4: Double): HResult; safecall;
    function Get_FilterCount: Integer; safecall;
    function Get_DefaultFilter: Integer; safecall;
    function Get_FilterAngle: Double; safecall;
    function Get_FilterHeigh: Integer; safecall;
    function Get_FilterDistance: Integer; safecall;
    function Get_FilterSQI: WordBool; safecall;
    function Get_FilterCI: WordBool; safecall;
    function Get_FilterSIG: WordBool; safecall;
    function Get_FilterLOG: WordBool; safecall;
    function Get_FilterCCOR: WordBool; safecall;
    property Radar_ID: Integer read Get_Radar_ID;
    property Obs_Directory: WideString read Get_Obs_Directory;
    property Beam_Ch1: Single read Get_Beam_Ch1;
    property Beam_Ch2: Single read Get_Beam_Ch2;
    property Speed_Accuracy: Integer read Get_Speed_Accuracy;
    property Angle_Accuracy: Integer read Get_Angle_Accuracy;
    property Pack_Method: Integer read Get_Pack_Method;
    property Timeout_TxRx: Integer read Get_Timeout_TxRx;
    property Speckle_Remove: WordBool read Get_Speckle_Remove;
    property Save_Variance: WordBool read Get_Save_Variance;
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
    property RadarBrand[RadarId: Integer]: RadarBrands read Get_RadarBrand;
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
    property CheckPPIParam: WordBool read Get_CheckPPIParam;
    property RT_SpeckleUmbral: Integer read Get_RT_SpeckleUmbral write Set_RT_SpeckleUmbral;
    property WSPort: Integer read Get_WSPort;
    property StreamPort: Integer read Get_StreamPort;
    property RT_Speckle_Remove: WordBool read Get_RT_Speckle_Remove write Set_RT_Speckle_Remove;
    property FilterCount: Integer read Get_FilterCount;
    property DefaultFilter: Integer read Get_DefaultFilter;
    property FilterAngle: Double read Get_FilterAngle;
    property FilterHeigh: Integer read Get_FilterHeigh;
    property FilterDistance: Integer read Get_FilterDistance;
    property FilterSQI: WordBool read Get_FilterSQI;
    property FilterCI: WordBool read Get_FilterCI;
    property FilterSIG: WordBool read Get_FilterSIG;
    property FilterLOG: WordBool read Get_FilterLOG;
    property FilterCCOR: WordBool read Get_FilterCCOR;
  end;

// *********************************************************************//
// DispIntf:  IConfigurationDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {11A27258-D8EE-4590-A8F6-998831135375}
// *********************************************************************//
  IConfigurationDisp = dispinterface
    ['{11A27258-D8EE-4590-A8F6-998831135375}']
    property Radar_ID: Integer readonly dispid 1;
    property Obs_Directory: WideString readonly dispid 2;
    property Beam_Ch1: Single readonly dispid 3;
    property Beam_Ch2: Single readonly dispid 4;
    property Speed_Accuracy: Integer readonly dispid 5;
    property Angle_Accuracy: Integer readonly dispid 6;
    property Pack_Method: Integer readonly dispid 7;
    property Timeout_TxRx: Integer readonly dispid 9;
    property Speckle_Remove: WordBool readonly dispid 16;
    property Save_Variance: WordBool readonly dispid 17;
    property AngleCodeRate: Integer readonly dispid 110;
    property AngleClockwiseRotationX: WordBool readonly dispid 111;
    property AngleClockwiseRotationY: WordBool readonly dispid 112;
    property AngleClockwiseRotationZ: WordBool readonly dispid 113;
    function AIGains(out Gains: {??PSafeArray}OleVariant): HResult; dispid 106;
    property SpeckleUmbral: Integer readonly dispid 117;
    property RadarName[RadarId: Integer]: WideString readonly dispid 118;
    property RadarOwner[RadarId: Integer]: WideString readonly dispid 119;
    property RadarRange[RadarId: Integer]: Integer readonly dispid 120;
    property RadarLatitude[RadarId: Integer]: Single readonly dispid 121;
    property RadarLongitude[RadarId: Integer]: Single readonly dispid 122;
    property RadarAltitude[RadarId: Integer]: Single readonly dispid 123;
    property RadarBrand[RadarId: Integer]: RadarBrands readonly dispid 124;
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
    property CheckPPIParam: WordBool readonly dispid 141;
    procedure Save; dispid 144;
    property RT_SpeckleUmbral: Integer dispid 148;
    property WSPort: Integer readonly dispid 150;
    property StreamPort: Integer readonly dispid 153;
    property RT_Speckle_Remove: WordBool dispid 101;
    function AIFactors(out Factors: {??PSafeArray}OleVariant): HResult; dispid 102;
    function Filter(Index: Integer; out Name: WideString; out B0: Double; out B1: Double; 
                    out B2: Double; out B3: Double; out B4: Double; out C1: Double; out C2: Double; 
                    out C3: Double; out C4: Double): HResult; dispid 103;
    property FilterCount: Integer readonly dispid 104;
    property DefaultFilter: Integer readonly dispid 105;
    property FilterAngle: Double readonly dispid 107;
    property FilterHeigh: Integer readonly dispid 108;
    property FilterDistance: Integer readonly dispid 109;
    property FilterSQI: WordBool readonly dispid 115;
    property FilterCI: WordBool readonly dispid 138;
    property FilterSIG: WordBool readonly dispid 139;
    property FilterLOG: WordBool readonly dispid 140;
    property FilterCCOR: WordBool readonly dispid 142;
  end;

// *********************************************************************//
// Interface: IConfigurationControl
// Flags:     (320) Dual OleAutomation
// GUID:      {91864F4C-C3FB-4281-8B02-88F6D594E3F9}
// *********************************************************************//
  IConfigurationControl = interface(IUnknown)
    ['{91864F4C-C3FB-4281-8B02-88F6D594E3F9}']
    procedure Set_Radar_ID(Param1: Integer); safecall;
    procedure Set_Obs_Directory(const Param1: WideString); safecall;
    procedure Set_Beam_Ch1(Param1: Single); safecall;
    procedure Set_Beam_Ch2(Param1: Single); safecall;
    procedure Set_Speed_Accuracy(Param1: Integer); safecall;
    procedure Set_Angle_Accuracy(Param1: Integer); safecall;
    procedure Set_Pack_Method(Param1: Integer); safecall;
    procedure Set_Timeout_TxRx(Param1: Integer); safecall;
    procedure Set_Speckle_Remove(Param1: WordBool); safecall;
    procedure Set_Save_Variance(Param1: WordBool); safecall;
    procedure Set_AngleCodeRate(Param1: Integer); safecall;
    procedure Set_AngleClockwiseRotationX(Param1: WordBool); safecall;
    procedure Set_AngleClockwiseRotationY(Param1: WordBool); safecall;
    procedure Set_AngleClockwiseRotationZ(Param1: WordBool); safecall;
    function AIGains(var Gains: PSafeArray): HResult; safecall;
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
    procedure Set_CheckPPIParam(Param1: WordBool); safecall;
    procedure Save; safecall;
    function AIFactors(var Factors: PSafeArray): HResult; safecall;
    function SetFilter(Index: Integer; const Name: WideString; B0: Double; B1: Double; B2: Double; 
                       B3: Double; B4: Double; C1: Double; C2: Double; C3: Double; C4: Double): HResult; safecall;
    procedure Set_FilterCount(Param1: Integer); safecall;
    procedure Set_DefaultFilter(Param1: Integer); safecall;
    procedure Set_FilterAngle(Param1: Double); safecall;
    procedure Set_FilterHeigh(Param1: Integer); safecall;
    procedure Set_FilterDistance(Param1: Integer); safecall;
    procedure Set_FilterSQI(Param1: WordBool); safecall;
    procedure Set_FilterCI(Param1: WordBool); safecall;
    procedure Set_FilterSIG(Param1: WordBool); safecall;
    procedure Set_FilterLOG(Param1: WordBool); safecall;
    procedure Set_FilterCCOR(Param1: WordBool); safecall;
    property Radar_ID: Integer write Set_Radar_ID;
    property Obs_Directory: WideString write Set_Obs_Directory;
    property Beam_Ch1: Single write Set_Beam_Ch1;
    property Beam_Ch2: Single write Set_Beam_Ch2;
    property Speed_Accuracy: Integer write Set_Speed_Accuracy;
    property Angle_Accuracy: Integer write Set_Angle_Accuracy;
    property Pack_Method: Integer write Set_Pack_Method;
    property Timeout_TxRx: Integer write Set_Timeout_TxRx;
    property Speckle_Remove: WordBool write Set_Speckle_Remove;
    property Save_Variance: WordBool write Set_Save_Variance;
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
    property CheckPPIParam: WordBool write Set_CheckPPIParam;
    property FilterCount: Integer write Set_FilterCount;
    property DefaultFilter: Integer write Set_DefaultFilter;
    property FilterAngle: Double write Set_FilterAngle;
    property FilterHeigh: Integer write Set_FilterHeigh;
    property FilterDistance: Integer write Set_FilterDistance;
    property FilterSQI: WordBool write Set_FilterSQI;
    property FilterCI: WordBool write Set_FilterCI;
    property FilterSIG: WordBool write Set_FilterSIG;
    property FilterLOG: WordBool write Set_FilterLOG;
    property FilterCCOR: WordBool write Set_FilterCCOR;
  end;

// *********************************************************************//
// DispIntf:  IConfigurationControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {91864F4C-C3FB-4281-8B02-88F6D594E3F9}
// *********************************************************************//
  IConfigurationControlDisp = dispinterface
    ['{91864F4C-C3FB-4281-8B02-88F6D594E3F9}']
    property Radar_ID: Integer writeonly dispid 1;
    property Obs_Directory: WideString writeonly dispid 2;
    property Beam_Ch1: Single writeonly dispid 3;
    property Beam_Ch2: Single writeonly dispid 4;
    property Speed_Accuracy: Integer writeonly dispid 5;
    property Angle_Accuracy: Integer writeonly dispid 6;
    property Pack_Method: Integer writeonly dispid 7;
    property Timeout_TxRx: Integer writeonly dispid 9;
    property Speckle_Remove: WordBool writeonly dispid 16;
    property Save_Variance: WordBool writeonly dispid 17;
    property AngleCodeRate: Integer writeonly dispid 110;
    property AngleClockwiseRotationX: WordBool writeonly dispid 111;
    property AngleClockwiseRotationY: WordBool writeonly dispid 112;
    property AngleClockwiseRotationZ: WordBool writeonly dispid 113;
    function AIGains(var Gains: {??PSafeArray}OleVariant): HResult; dispid 105;
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
    property CheckPPIParam: WordBool writeonly dispid 130;
    procedure Save; dispid 133;
    function AIFactors(var Factors: {??PSafeArray}OleVariant): HResult; dispid 101;
    function SetFilter(Index: Integer; const Name: WideString; B0: Double; B1: Double; B2: Double; 
                       B3: Double; B4: Double; C1: Double; C2: Double; C3: Double; C4: Double): HResult; dispid 102;
    property FilterCount: Integer writeonly dispid 103;
    property DefaultFilter: Integer writeonly dispid 104;
    property FilterAngle: Double writeonly dispid 107;
    property FilterHeigh: Integer writeonly dispid 108;
    property FilterDistance: Integer writeonly dispid 109;
    property FilterSQI: WordBool writeonly dispid 114;
    property FilterCI: WordBool writeonly dispid 115;
    property FilterSIG: WordBool writeonly dispid 127;
    property FilterLOG: WordBool writeonly dispid 128;
    property FilterCCOR: WordBool writeonly dispid 129;
  end;

// *********************************************************************//
// Interface: IVideoControl
// Flags:     (320) Dual OleAutomation
// GUID:      {24408E8B-4E5B-4186-9C67-9F0263F639B3}
// *********************************************************************//
  IVideoControl = interface(IUnknown)
    ['{24408E8B-4E5B-4186-9C67-9F0263F639B3}']
    procedure StartRT; safecall;
  end;

// *********************************************************************//
// DispIntf:  IVideoControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {24408E8B-4E5B-4186-9C67-9F0263F639B3}
// *********************************************************************//
  IVideoControlDisp = dispinterface
    ['{24408E8B-4E5B-4186-9C67-9F0263F639B3}']
    procedure StartRT; dispid 102;
  end;

// *********************************************************************//
// Interface: ICalibration
// Flags:     (320) Dual OleAutomation
// GUID:      {BFE2A3CF-BC33-4688-A135-38CB8DF5E6AD}
// *********************************************************************//
  ICalibration = interface(IUnknown)
    ['{BFE2A3CF-BC33-4688-A135-38CB8DF5E6AD}']
    function Get_Potencia: Integer; safecall;
    function Get_CRadarPL: Single; safecall;
    function Get_CRadarPC: Single; safecall;
    function Get_PotMetPL: Single; safecall;
    function Get_PotMetPC: Single; safecall;
    function Get_Tx_Pulse_SP: Integer; safecall;
    function Get_Tx_Pulse_LP: Integer; safecall;
    function Get_Start_Sample_SP: Integer; safecall;
    function Get_Final_Sample_SP: Integer; safecall;
    function Get_Start_Sample_LP: Integer; safecall;
    function Get_Final_Sample_LP: Integer; safecall;
    function Get_Tx_Factor: Double; safecall;
    function Get_Stalo_Delay: Integer; safecall;
    function Get_Stalo_Step: Integer; safecall;
    function Get_Stalo_Width: Integer; safecall;
    function Get_Valid_tx_power: Double; safecall;
    function Get_DRX_Codes_LP: PSafeArray; safecall;
    function Get_Loop_Gain: Double; safecall;
    function Get_MPS_Voltage: Double; safecall;
    function Get_DRX_Codes_SP: PSafeArray; safecall;
    property Potencia: Integer read Get_Potencia;
    property CRadarPL: Single read Get_CRadarPL;
    property CRadarPC: Single read Get_CRadarPC;
    property PotMetPL: Single read Get_PotMetPL;
    property PotMetPC: Single read Get_PotMetPC;
    property Tx_Pulse_SP: Integer read Get_Tx_Pulse_SP;
    property Tx_Pulse_LP: Integer read Get_Tx_Pulse_LP;
    property Start_Sample_SP: Integer read Get_Start_Sample_SP;
    property Final_Sample_SP: Integer read Get_Final_Sample_SP;
    property Start_Sample_LP: Integer read Get_Start_Sample_LP;
    property Final_Sample_LP: Integer read Get_Final_Sample_LP;
    property Tx_Factor: Double read Get_Tx_Factor;
    property Stalo_Delay: Integer read Get_Stalo_Delay;
    property Stalo_Step: Integer read Get_Stalo_Step;
    property Stalo_Width: Integer read Get_Stalo_Width;
    property Valid_tx_power: Double read Get_Valid_tx_power;
    property DRX_Codes_LP: PSafeArray read Get_DRX_Codes_LP;
    property Loop_Gain: Double read Get_Loop_Gain;
    property MPS_Voltage: Double read Get_MPS_Voltage;
    property DRX_Codes_SP: PSafeArray read Get_DRX_Codes_SP;
  end;

// *********************************************************************//
// DispIntf:  ICalibrationDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {BFE2A3CF-BC33-4688-A135-38CB8DF5E6AD}
// *********************************************************************//
  ICalibrationDisp = dispinterface
    ['{BFE2A3CF-BC33-4688-A135-38CB8DF5E6AD}']
    property Potencia: Integer readonly dispid 3;
    property CRadarPL: Single readonly dispid 4;
    property CRadarPC: Single readonly dispid 5;
    property PotMetPL: Single readonly dispid 6;
    property PotMetPC: Single readonly dispid 7;
    property Tx_Pulse_SP: Integer readonly dispid 101;
    property Tx_Pulse_LP: Integer readonly dispid 102;
    property Start_Sample_SP: Integer readonly dispid 103;
    property Final_Sample_SP: Integer readonly dispid 104;
    property Start_Sample_LP: Integer readonly dispid 105;
    property Final_Sample_LP: Integer readonly dispid 106;
    property Tx_Factor: Double readonly dispid 107;
    property Stalo_Delay: Integer readonly dispid 108;
    property Stalo_Step: Integer readonly dispid 109;
    property Stalo_Width: Integer readonly dispid 110;
    property Valid_tx_power: Double readonly dispid 114;
    property DRX_Codes_LP: {??PSafeArray}OleVariant readonly dispid 115;
    property Loop_Gain: Double readonly dispid 111;
    property MPS_Voltage: Double readonly dispid 113;
    property DRX_Codes_SP: {??PSafeArray}OleVariant readonly dispid 117;
  end;

// *********************************************************************//
// Interface: ICalibrationControl
// Flags:     (320) Dual OleAutomation
// GUID:      {3D401C1A-1B8F-4681-B043-CFE3B8C89DE1}
// *********************************************************************//
  ICalibrationControl = interface(IUnknown)
    ['{3D401C1A-1B8F-4681-B043-CFE3B8C89DE1}']
    procedure Set_Potencia(Param1: Integer); safecall;
    procedure Set_CRadarPL(Param1: Single); safecall;
    procedure Set_CRadarPC(Param1: Single); safecall;
    procedure Set_Tx_Pulse_SP(Param1: Integer); safecall;
    procedure Set_Tx_Pulse_LP(Param1: Integer); safecall;
    procedure Set_Start_Sample_SP(Param1: Integer); safecall;
    procedure Set_Final_Sample_SP(Param1: Integer); safecall;
    procedure Set_Start_Sample_LP(Param1: Integer); safecall;
    procedure Set_Final_Sample_LP(Param1: Integer); safecall;
    procedure Set_Tx_Factor(Param1: Double); safecall;
    procedure Set_Stalo_Delay(Param1: Integer); safecall;
    procedure Set_Stalo_Step(Param1: Integer); safecall;
    procedure Set_Stalo_Width(Param1: Integer); safecall;
    procedure Set_Valid_tx_power(Param1: Double); safecall;
    procedure Set_DRX_Codes_LP(Param1: PSafeArray); safecall;
    procedure SaveDRX; safecall;
    procedure Set_Loop_Gain(Param1: Double); safecall;
    procedure Set_MPS_Voltage(Param1: Double); safecall;
    procedure Set_DRX_Codes_SP(Param1: PSafeArray); safecall;
    property Potencia: Integer write Set_Potencia;
    property CRadarPL: Single write Set_CRadarPL;
    property CRadarPC: Single write Set_CRadarPC;
    property Tx_Pulse_SP: Integer write Set_Tx_Pulse_SP;
    property Tx_Pulse_LP: Integer write Set_Tx_Pulse_LP;
    property Start_Sample_SP: Integer write Set_Start_Sample_SP;
    property Final_Sample_SP: Integer write Set_Final_Sample_SP;
    property Start_Sample_LP: Integer write Set_Start_Sample_LP;
    property Final_Sample_LP: Integer write Set_Final_Sample_LP;
    property Tx_Factor: Double write Set_Tx_Factor;
    property Stalo_Delay: Integer write Set_Stalo_Delay;
    property Stalo_Step: Integer write Set_Stalo_Step;
    property Stalo_Width: Integer write Set_Stalo_Width;
    property Valid_tx_power: Double write Set_Valid_tx_power;
    property DRX_Codes_LP: PSafeArray write Set_DRX_Codes_LP;
    property Loop_Gain: Double write Set_Loop_Gain;
    property MPS_Voltage: Double write Set_MPS_Voltage;
    property DRX_Codes_SP: PSafeArray write Set_DRX_Codes_SP;
  end;

// *********************************************************************//
// DispIntf:  ICalibrationControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {3D401C1A-1B8F-4681-B043-CFE3B8C89DE1}
// *********************************************************************//
  ICalibrationControlDisp = dispinterface
    ['{3D401C1A-1B8F-4681-B043-CFE3B8C89DE1}']
    property Potencia: Integer writeonly dispid 3;
    property CRadarPL: Single writeonly dispid 4;
    property CRadarPC: Single writeonly dispid 5;
    property Tx_Pulse_SP: Integer writeonly dispid 101;
    property Tx_Pulse_LP: Integer writeonly dispid 102;
    property Start_Sample_SP: Integer writeonly dispid 103;
    property Final_Sample_SP: Integer writeonly dispid 104;
    property Start_Sample_LP: Integer writeonly dispid 105;
    property Final_Sample_LP: Integer writeonly dispid 106;
    property Tx_Factor: Double writeonly dispid 107;
    property Stalo_Delay: Integer writeonly dispid 108;
    property Stalo_Step: Integer writeonly dispid 109;
    property Stalo_Width: Integer writeonly dispid 110;
    property Valid_tx_power: Double writeonly dispid 114;
    property DRX_Codes_LP: {??PSafeArray}OleVariant writeonly dispid 115;
    procedure SaveDRX; dispid 111;
    property Loop_Gain: Double writeonly dispid 112;
    property MPS_Voltage: Double writeonly dispid 116;
    property DRX_Codes_SP: {??PSafeArray}OleVariant writeonly dispid 118;
  end;

// *********************************************************************//
// Interface: ITxRxMeasure
// Flags:     (320) Dual OleAutomation
// GUID:      {F19BB556-F17E-4D43-8065-050CD604C48B}
// *********************************************************************//
  ITxRxMeasure = interface(IUnknown)
    ['{F19BB556-F17E-4D43-8065-050CD604C48B}']
    function Get_Rango_Tx_Potencia: Integer; safecall;
    function Get_Sector_Tx_Potencia: Integer; safecall;
    function Get_Rango_Tx_MPS_Volt: Integer; safecall;
    function Get_Sector_Tx_MPS_Volt: Integer; safecall;
    function Get_Rango_Tx_MPS_Corr: Integer; safecall;
    function Get_Sector_Tx_MPS_Corr: Integer; safecall;
    function Get_Rango_Tx_Fuente24V_N: Integer; safecall;
    function Get_Sector_Tx_Fuente24V_N: Integer; safecall;
    function Get_Rango_Tx_Fuente24V_P: Integer; safecall;
    function Get_Sector_Tx_Fuente24V_P: Integer; safecall;
    function Get_Sector_Tx_Fuente50V: Integer; safecall;
    function Get_Rango_Tx_Fuente50V: Integer; safecall;
    function Get_Sector_Tx_Fuente100V: Integer; safecall;
    function Get_Rango_Tx_Fuente400V: Integer; safecall;
    function Get_Sector_Tx_Fuente400V: Integer; safecall;
    function Get_Sector_Tx_Fuente_Filamento: Integer; safecall;
    function Get_Rango_Tx_Fuente_Filamento: Integer; safecall;
    function Get_Rango_Tx_Fuente100V: Integer; safecall;
    property Rango_Tx_Potencia: Integer read Get_Rango_Tx_Potencia;
    property Sector_Tx_Potencia: Integer read Get_Sector_Tx_Potencia;
    property Rango_Tx_MPS_Volt: Integer read Get_Rango_Tx_MPS_Volt;
    property Sector_Tx_MPS_Volt: Integer read Get_Sector_Tx_MPS_Volt;
    property Rango_Tx_MPS_Corr: Integer read Get_Rango_Tx_MPS_Corr;
    property Sector_Tx_MPS_Corr: Integer read Get_Sector_Tx_MPS_Corr;
    property Rango_Tx_Fuente24V_N: Integer read Get_Rango_Tx_Fuente24V_N;
    property Sector_Tx_Fuente24V_N: Integer read Get_Sector_Tx_Fuente24V_N;
    property Rango_Tx_Fuente24V_P: Integer read Get_Rango_Tx_Fuente24V_P;
    property Sector_Tx_Fuente24V_P: Integer read Get_Sector_Tx_Fuente24V_P;
    property Sector_Tx_Fuente50V: Integer read Get_Sector_Tx_Fuente50V;
    property Rango_Tx_Fuente50V: Integer read Get_Rango_Tx_Fuente50V;
    property Sector_Tx_Fuente100V: Integer read Get_Sector_Tx_Fuente100V;
    property Rango_Tx_Fuente400V: Integer read Get_Rango_Tx_Fuente400V;
    property Sector_Tx_Fuente400V: Integer read Get_Sector_Tx_Fuente400V;
    property Sector_Tx_Fuente_Filamento: Integer read Get_Sector_Tx_Fuente_Filamento;
    property Rango_Tx_Fuente_Filamento: Integer read Get_Rango_Tx_Fuente_Filamento;
    property Rango_Tx_Fuente100V: Integer read Get_Rango_Tx_Fuente100V;
  end;

// *********************************************************************//
// DispIntf:  ITxRxMeasureDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {F19BB556-F17E-4D43-8065-050CD604C48B}
// *********************************************************************//
  ITxRxMeasureDisp = dispinterface
    ['{F19BB556-F17E-4D43-8065-050CD604C48B}']
    property Rango_Tx_Potencia: Integer readonly dispid 14;
    property Sector_Tx_Potencia: Integer readonly dispid 18;
    property Rango_Tx_MPS_Volt: Integer readonly dispid 101;
    property Sector_Tx_MPS_Volt: Integer readonly dispid 102;
    property Rango_Tx_MPS_Corr: Integer readonly dispid 103;
    property Sector_Tx_MPS_Corr: Integer readonly dispid 104;
    property Rango_Tx_Fuente24V_N: Integer readonly dispid 105;
    property Sector_Tx_Fuente24V_N: Integer readonly dispid 106;
    property Rango_Tx_Fuente24V_P: Integer readonly dispid 109;
    property Sector_Tx_Fuente24V_P: Integer readonly dispid 110;
    property Sector_Tx_Fuente50V: Integer readonly dispid 111;
    property Rango_Tx_Fuente50V: Integer readonly dispid 112;
    property Sector_Tx_Fuente100V: Integer readonly dispid 113;
    property Rango_Tx_Fuente400V: Integer readonly dispid 115;
    property Sector_Tx_Fuente400V: Integer readonly dispid 116;
    property Sector_Tx_Fuente_Filamento: Integer readonly dispid 117;
    property Rango_Tx_Fuente_Filamento: Integer readonly dispid 118;
    property Rango_Tx_Fuente100V: Integer readonly dispid 114;
  end;

// *********************************************************************//
// Interface: ITxRxMeasureControl
// Flags:     (320) Dual OleAutomation
// GUID:      {0620776F-8548-4D31-8A2E-A99D44E64992}
// *********************************************************************//
  ITxRxMeasureControl = interface(IUnknown)
    ['{0620776F-8548-4D31-8A2E-A99D44E64992}']
    procedure Set_Rango_Tx_Potencia(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Potencia(Param1: Integer); safecall;
    procedure Set_Rango_Tx_MPS_Volt(Param1: Integer); safecall;
    procedure Set_Sector_Tx_MPS_Volt(Param1: Integer); safecall;
    procedure Set_Rango_Tx_MPS_Corr(Param1: Integer); safecall;
    procedure Set_Sector_Tx_MPS_Corr(Param1: Integer); safecall;
    procedure Set_Rango_Tx_Fuente24V_N(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Fuente24V_N(Param1: Integer); safecall;
    procedure Set_Rango_Tx_Fuente24V_P(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Fuente24V_P(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Fuente50V(Param1: Integer); safecall;
    procedure Set_Rango_Tx_Fuente50V(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Fuente100V(Param1: Integer); safecall;
    procedure Set_Rango_Tx_Fuente100V(Param1: Integer); safecall;
    procedure Set_Rango_Tx_Fuente400V(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Fuente400V(Param1: Integer); safecall;
    procedure Set_Sector_Tx_Fuente_Filamento(Param1: Integer); safecall;
    procedure Set_Rango_Tx_Fuente_Filamento(Param1: Integer); safecall;
    property Rango_Tx_Potencia: Integer write Set_Rango_Tx_Potencia;
    property Sector_Tx_Potencia: Integer write Set_Sector_Tx_Potencia;
    property Rango_Tx_MPS_Volt: Integer write Set_Rango_Tx_MPS_Volt;
    property Sector_Tx_MPS_Volt: Integer write Set_Sector_Tx_MPS_Volt;
    property Rango_Tx_MPS_Corr: Integer write Set_Rango_Tx_MPS_Corr;
    property Sector_Tx_MPS_Corr: Integer write Set_Sector_Tx_MPS_Corr;
    property Rango_Tx_Fuente24V_N: Integer write Set_Rango_Tx_Fuente24V_N;
    property Sector_Tx_Fuente24V_N: Integer write Set_Sector_Tx_Fuente24V_N;
    property Rango_Tx_Fuente24V_P: Integer write Set_Rango_Tx_Fuente24V_P;
    property Sector_Tx_Fuente24V_P: Integer write Set_Sector_Tx_Fuente24V_P;
    property Sector_Tx_Fuente50V: Integer write Set_Sector_Tx_Fuente50V;
    property Rango_Tx_Fuente50V: Integer write Set_Rango_Tx_Fuente50V;
    property Sector_Tx_Fuente100V: Integer write Set_Sector_Tx_Fuente100V;
    property Rango_Tx_Fuente100V: Integer write Set_Rango_Tx_Fuente100V;
    property Rango_Tx_Fuente400V: Integer write Set_Rango_Tx_Fuente400V;
    property Sector_Tx_Fuente400V: Integer write Set_Sector_Tx_Fuente400V;
    property Sector_Tx_Fuente_Filamento: Integer write Set_Sector_Tx_Fuente_Filamento;
    property Rango_Tx_Fuente_Filamento: Integer write Set_Rango_Tx_Fuente_Filamento;
  end;

// *********************************************************************//
// DispIntf:  ITxRxMeasureControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {0620776F-8548-4D31-8A2E-A99D44E64992}
// *********************************************************************//
  ITxRxMeasureControlDisp = dispinterface
    ['{0620776F-8548-4D31-8A2E-A99D44E64992}']
    property Rango_Tx_Potencia: Integer writeonly dispid 14;
    property Sector_Tx_Potencia: Integer writeonly dispid 18;
    property Rango_Tx_MPS_Volt: Integer writeonly dispid 101;
    property Sector_Tx_MPS_Volt: Integer writeonly dispid 102;
    property Rango_Tx_MPS_Corr: Integer writeonly dispid 103;
    property Sector_Tx_MPS_Corr: Integer writeonly dispid 104;
    property Rango_Tx_Fuente24V_N: Integer writeonly dispid 105;
    property Sector_Tx_Fuente24V_N: Integer writeonly dispid 106;
    property Rango_Tx_Fuente24V_P: Integer writeonly dispid 109;
    property Sector_Tx_Fuente24V_P: Integer writeonly dispid 110;
    property Sector_Tx_Fuente50V: Integer writeonly dispid 111;
    property Rango_Tx_Fuente50V: Integer writeonly dispid 112;
    property Sector_Tx_Fuente100V: Integer writeonly dispid 113;
    property Rango_Tx_Fuente100V: Integer writeonly dispid 114;
    property Rango_Tx_Fuente400V: Integer writeonly dispid 115;
    property Sector_Tx_Fuente400V: Integer writeonly dispid 116;
    property Sector_Tx_Fuente_Filamento: Integer writeonly dispid 118;
    property Rango_Tx_Fuente_Filamento: Integer writeonly dispid 117;
  end;

// *********************************************************************//
// Interface: IObservation
// Flags:     (320) Dual OleAutomation
// GUID:      {36BCEE73-6DF2-4F86-8A2F-1752FB61EC08}
// *********************************************************************//
  IObservation = interface(IUnknown)
    ['{36BCEE73-6DF2-4F86-8A2F-1752FB61EC08}']
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
// GUID:      {36BCEE73-6DF2-4F86-8A2F-1752FB61EC08}
// *********************************************************************//
  IObservationDisp = dispinterface
    ['{36BCEE73-6DF2-4F86-8A2F-1752FB61EC08}']
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
// Interface: ITxRxStatus
// Flags:     (320) Dual OleAutomation
// GUID:      {720B3EDA-F50B-432A-B0DF-2B9BA5879CFD}
// *********************************************************************//
  ITxRxStatus = interface(IUnknown)
    ['{720B3EDA-F50B-432A-B0DF-2B9BA5879CFD}']
    function Get_Numero: Integer; safecall;
    function Get_Tx_Pulso: TxPulse; safecall;
    function Get_Longitud_Onda: WaveLength; safecall;
    property Numero: Integer read Get_Numero;
    property Tx_Pulso: TxPulse read Get_Tx_Pulso;
    property Longitud_Onda: WaveLength read Get_Longitud_Onda;
  end;

// *********************************************************************//
// DispIntf:  ITxRxStatusDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {720B3EDA-F50B-432A-B0DF-2B9BA5879CFD}
// *********************************************************************//
  ITxRxStatusDisp = dispinterface
    ['{720B3EDA-F50B-432A-B0DF-2B9BA5879CFD}']
    property Numero: Integer readonly dispid 22;
    property Tx_Pulso: TxPulse readonly dispid 105;
    property Longitud_Onda: WaveLength readonly dispid 106;
  end;

// *********************************************************************//
// Interface: IAntenna
// Flags:     (320) Dual OleAutomation
// GUID:      {37A6997D-B58F-48A6-BD75-3FF18C1FAC60}
// *********************************************************************//
  IAntenna = interface(IUnknown)
    ['{37A6997D-B58F-48A6-BD75-3FF18C1FAC60}']
    function Get_Excitacion: WordBool; safecall;
    function Get_Limite_N: WordBool; safecall;
    function Get_Limite_P: WordBool; safecall;
    function Get_Cupula_Cerrada: WordBool; safecall;
    function Get_Motor_Az: IMotorStatus; safecall;
    function Get_Motor_El: IMotorStatus; safecall;
    function Get_SyncMark: Integer; safecall;
    function Get_SyncMarkDirection: WordBool; safecall;
    function Get_Fuente_Exitacion_Code: Integer; safecall;
    function Get_Fuente_Exitacion_Unit: Double; safecall;
    function Get_Fuente_5V_Code: Integer; safecall;
    function Get_Fuente_5V_Unit: Double; safecall;
    function Get_Fuente_12V_Code: Integer; safecall;
    function Get_Fuente_24V_Code: Integer; safecall;
    function Get_Fuente_24V_Unit: Double; safecall;
    function Get_Fuente_12V_Unit: Double; safecall;
    function Get_Rango_Fuente_5V: Integer; safecall;
    function Get_Sector_Fuente_5V: Integer; safecall;
    function Get_Sector_Fuente_12V: Integer; safecall;
    function Get_Sector_Fuente_24V: Integer; safecall;
    function Get_Rango_Fuente_12V: Integer; safecall;
    function Get_Rango_Fuente_24V: Integer; safecall;
    function Get_Rango_Fuente_Excitacion: Integer; safecall;
    function Get_Sector_Fuente_Excitacion: Integer; safecall;
    function Get_Status: RadarStatus; safecall;
    function Get_Local: WordBool; safecall;
    function Get_Ventilacion: WordBool; safecall;
    property Excitacion: WordBool read Get_Excitacion;
    property Limite_N: WordBool read Get_Limite_N;
    property Limite_P: WordBool read Get_Limite_P;
    property Cupula_Cerrada: WordBool read Get_Cupula_Cerrada;
    property Motor_Az: IMotorStatus read Get_Motor_Az;
    property Motor_El: IMotorStatus read Get_Motor_El;
    property SyncMark: Integer read Get_SyncMark;
    property SyncMarkDirection: WordBool read Get_SyncMarkDirection;
    property Fuente_Exitacion_Code: Integer read Get_Fuente_Exitacion_Code;
    property Fuente_Exitacion_Unit: Double read Get_Fuente_Exitacion_Unit;
    property Fuente_5V_Code: Integer read Get_Fuente_5V_Code;
    property Fuente_5V_Unit: Double read Get_Fuente_5V_Unit;
    property Fuente_12V_Code: Integer read Get_Fuente_12V_Code;
    property Fuente_24V_Code: Integer read Get_Fuente_24V_Code;
    property Fuente_24V_Unit: Double read Get_Fuente_24V_Unit;
    property Fuente_12V_Unit: Double read Get_Fuente_12V_Unit;
    property Rango_Fuente_5V: Integer read Get_Rango_Fuente_5V;
    property Sector_Fuente_5V: Integer read Get_Sector_Fuente_5V;
    property Sector_Fuente_12V: Integer read Get_Sector_Fuente_12V;
    property Sector_Fuente_24V: Integer read Get_Sector_Fuente_24V;
    property Rango_Fuente_12V: Integer read Get_Rango_Fuente_12V;
    property Rango_Fuente_24V: Integer read Get_Rango_Fuente_24V;
    property Rango_Fuente_Excitacion: Integer read Get_Rango_Fuente_Excitacion;
    property Sector_Fuente_Excitacion: Integer read Get_Sector_Fuente_Excitacion;
    property Status: RadarStatus read Get_Status;
    property Local: WordBool read Get_Local;
    property Ventilacion: WordBool read Get_Ventilacion;
  end;

// *********************************************************************//
// DispIntf:  IAntennaDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {37A6997D-B58F-48A6-BD75-3FF18C1FAC60}
// *********************************************************************//
  IAntennaDisp = dispinterface
    ['{37A6997D-B58F-48A6-BD75-3FF18C1FAC60}']
    property Excitacion: WordBool readonly dispid 5;
    property Limite_N: WordBool readonly dispid 6;
    property Limite_P: WordBool readonly dispid 7;
    property Cupula_Cerrada: WordBool readonly dispid 4;
    property Motor_Az: IMotorStatus readonly dispid 101;
    property Motor_El: IMotorStatus readonly dispid 102;
    property SyncMark: Integer readonly dispid 124;
    property SyncMarkDirection: WordBool readonly dispid 125;
    property Fuente_Exitacion_Code: Integer readonly dispid 105;
    property Fuente_Exitacion_Unit: Double readonly dispid 106;
    property Fuente_5V_Code: Integer readonly dispid 107;
    property Fuente_5V_Unit: Double readonly dispid 108;
    property Fuente_12V_Code: Integer readonly dispid 109;
    property Fuente_24V_Code: Integer readonly dispid 110;
    property Fuente_24V_Unit: Double readonly dispid 111;
    property Fuente_12V_Unit: Double readonly dispid 112;
    property Rango_Fuente_5V: Integer readonly dispid 113;
    property Sector_Fuente_5V: Integer readonly dispid 114;
    property Sector_Fuente_12V: Integer readonly dispid 115;
    property Sector_Fuente_24V: Integer readonly dispid 116;
    property Rango_Fuente_12V: Integer readonly dispid 117;
    property Rango_Fuente_24V: Integer readonly dispid 118;
    property Rango_Fuente_Excitacion: Integer readonly dispid 119;
    property Sector_Fuente_Excitacion: Integer readonly dispid 120;
    property Status: RadarStatus readonly dispid 103;
    property Local: WordBool readonly dispid 104;
    property Ventilacion: WordBool readonly dispid 121;
  end;

// *********************************************************************//
// Interface: ITxsRxs
// Flags:     (320) Dual OleAutomation
// GUID:      {37CA8C15-9064-4E49-B6C4-539DA762E971}
// *********************************************************************//
  ITxsRxs = interface(IUnknown)
    ['{37CA8C15-9064-4E49-B6C4-539DA762E971}']
    function Get_TxRxCount: Integer; safecall;
    function GetTxRx(Index: Integer): ITxRxStatus; safecall;
    property TxRxCount: Integer read Get_TxRxCount;
  end;

// *********************************************************************//
// DispIntf:  ITxsRxsDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {37CA8C15-9064-4E49-B6C4-539DA762E971}
// *********************************************************************//
  ITxsRxsDisp = dispinterface
    ['{37CA8C15-9064-4E49-B6C4-539DA762E971}']
    property TxRxCount: Integer readonly dispid 1;
    function GetTxRx(Index: Integer): ITxRxStatus; dispid 101;
  end;

// *********************************************************************//
// Interface: ISynchro
// Flags:     (320) Dual OleAutomation
// GUID:      {7A63E609-FC3F-4153-8A14-23F5CBCE0914}
// *********************************************************************//
  ISynchro = interface(IUnknown)
    ['{7A63E609-FC3F-4153-8A14-23F5CBCE0914}']
    procedure Set_Pulso_Largo; safecall;
    procedure Set_Pulso_Corto(PRF_Rate: TxDualPulse); safecall;
    function Get_Frecuencia: Integer; safecall;
    function Get_Pulse: TxPulse; safecall;
    function Get_PRF_Rate: TxDualPulse; safecall;
    function FrecuenciaAD: Integer; safecall;
    property Frecuencia: Integer read Get_Frecuencia;
    property Pulse: TxPulse read Get_Pulse;
    property PRF_Rate: TxDualPulse read Get_PRF_Rate;
  end;

// *********************************************************************//
// DispIntf:  ISynchroDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {7A63E609-FC3F-4153-8A14-23F5CBCE0914}
// *********************************************************************//
  ISynchroDisp = dispinterface
    ['{7A63E609-FC3F-4153-8A14-23F5CBCE0914}']
    procedure Set_Pulso_Largo; dispid 1;
    procedure Set_Pulso_Corto(PRF_Rate: TxDualPulse); dispid 2;
    property Frecuencia: Integer readonly dispid 3;
    property Pulse: TxPulse readonly dispid 101;
    property PRF_Rate: TxDualPulse readonly dispid 102;
    function FrecuenciaAD: Integer; dispid 103;
  end;

// *********************************************************************//
// Interface: ITemplate
// Flags:     (320) Dual OleAutomation
// GUID:      {B7BAE3C1-21ED-453F-9F0A-C2D21C3353F2}
// *********************************************************************//
  ITemplate = interface(IUnknown)
    ['{B7BAE3C1-21ED-453F-9F0A-C2D21C3353F2}']
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
    function Get_Sector_Inicio: Integer; safecall;
    function Get_Sector_Fin: Integer; safecall;
    function Get_FTPSettings: WideString; safecall;
    function Get_SentFTP: WordBool; safecall;
    function Get_Pulso: TxPulse; safecall;
    function Get_Filter: WordBool; safecall;
    function Get_PulseRate: TxDualPulse; safecall;
    function Get_CH3cm_ManualAFC: WordBool; safecall;
    function Get_CH3cm_StaloPower: Double; safecall;
    function Get_CH3cm_StaloFreq: Integer; safecall;
    function Get_CH3cm_NCO: Integer; safecall;
    function Get_CH10cm_ManualAFC: WordBool; safecall;
    function Get_CH10cm_StaloPower: Double; safecall;
    function Get_CH10cm_StaloFreq: Integer; safecall;
    function Get_CH10cm_NCO: Integer; safecall;
    function Movement(Index: Integer; out Angle: Integer; out Speed: Integer; out Pulse: Integer; 
                      out Rate: Integer): HResult; safecall;
    function Get_FilterCH1: Integer; safecall;
    function Get_FilterCH2: Integer; safecall;
    function Get_Filter_MaxAngle: Double; safecall;
    function Get_Filter_MaxHeigh: Integer; safecall;
    function Get_Filter_Distance: Integer; safecall;
    function Get_FilterSQI: WordBool; safecall;
    function Get_FilterCI: WordBool; safecall;
    function Get_FilterSIG: WordBool; safecall;
    function Get_FilterLOG: WordBool; safecall;
    function Get_FilterCCOR: WordBool; safecall;
    function Get_Sectores: Integer; safecall;
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
    property Sector_Inicio: Integer read Get_Sector_Inicio;
    property Sector_Fin: Integer read Get_Sector_Fin;
    property FTPSettings: WideString read Get_FTPSettings;
    property SentFTP: WordBool read Get_SentFTP;
    property Pulso: TxPulse read Get_Pulso;
    property Filter: WordBool read Get_Filter;
    property PulseRate: TxDualPulse read Get_PulseRate;
    property CH3cm_ManualAFC: WordBool read Get_CH3cm_ManualAFC;
    property CH3cm_StaloPower: Double read Get_CH3cm_StaloPower;
    property CH3cm_StaloFreq: Integer read Get_CH3cm_StaloFreq;
    property CH3cm_NCO: Integer read Get_CH3cm_NCO;
    property CH10cm_ManualAFC: WordBool read Get_CH10cm_ManualAFC;
    property CH10cm_StaloPower: Double read Get_CH10cm_StaloPower;
    property CH10cm_StaloFreq: Integer read Get_CH10cm_StaloFreq;
    property CH10cm_NCO: Integer read Get_CH10cm_NCO;
    property FilterCH1: Integer read Get_FilterCH1;
    property FilterCH2: Integer read Get_FilterCH2;
    property Filter_MaxAngle: Double read Get_Filter_MaxAngle;
    property Filter_MaxHeigh: Integer read Get_Filter_MaxHeigh;
    property Filter_Distance: Integer read Get_Filter_Distance;
    property FilterSQI: WordBool read Get_FilterSQI;
    property FilterCI: WordBool read Get_FilterCI;
    property FilterSIG: WordBool read Get_FilterSIG;
    property FilterLOG: WordBool read Get_FilterLOG;
    property FilterCCOR: WordBool read Get_FilterCCOR;
    property Sectores: Integer read Get_Sectores;
  end;

// *********************************************************************//
// DispIntf:  ITemplateDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {B7BAE3C1-21ED-453F-9F0A-C2D21C3353F2}
// *********************************************************************//
  ITemplateDisp = dispinterface
    ['{B7BAE3C1-21ED-453F-9F0A-C2D21C3353F2}']
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
    property Sector_Inicio: Integer readonly dispid 26;
    property Sector_Fin: Integer readonly dispid 27;
    property FTPSettings: WideString readonly dispid 101;
    property SentFTP: WordBool readonly dispid 102;
    property Pulso: TxPulse readonly dispid 103;
    property Filter: WordBool readonly dispid 122;
    property PulseRate: TxDualPulse readonly dispid 125;
    property CH3cm_ManualAFC: WordBool readonly dispid 104;
    property CH3cm_StaloPower: Double readonly dispid 105;
    property CH3cm_StaloFreq: Integer readonly dispid 106;
    property CH3cm_NCO: Integer readonly dispid 107;
    property CH10cm_ManualAFC: WordBool readonly dispid 108;
    property CH10cm_StaloPower: Double readonly dispid 109;
    property CH10cm_StaloFreq: Integer readonly dispid 123;
    property CH10cm_NCO: Integer readonly dispid 124;
    function Movement(Index: Integer; out Angle: Integer; out Speed: Integer; out Pulse: Integer; 
                      out Rate: Integer): HResult; dispid 126;
    property FilterCH1: Integer readonly dispid 127;
    property FilterCH2: Integer readonly dispid 128;
    property Filter_MaxAngle: Double readonly dispid 110;
    property Filter_MaxHeigh: Integer readonly dispid 111;
    property Filter_Distance: Integer readonly dispid 112;
    property FilterSQI: WordBool readonly dispid 113;
    property FilterCI: WordBool readonly dispid 114;
    property FilterSIG: WordBool readonly dispid 115;
    property FilterLOG: WordBool readonly dispid 116;
    property FilterCCOR: WordBool readonly dispid 117;
    property Sectores: Integer readonly dispid 118;
  end;

// *********************************************************************//
// Interface: ITemplateControl
// Flags:     (320) Dual OleAutomation
// GUID:      {D7E21C97-B28A-455E-AA07-C7A5A4B33DF7}
// *********************************************************************//
  ITemplateControl = interface(IUnknown)
    ['{D7E21C97-B28A-455E-AA07-C7A5A4B33DF7}']
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
    procedure Set_FTPSettings(const Param1: WideString); safecall;
    procedure Set_SentFTP(Param1: WordBool); safecall;
    procedure Set_Pulso(Param1: TxPulse); safecall;
    procedure Set_Filter(Param1: WordBool); safecall;
    procedure Set_PulseRate(Param1: TxDualPulse); safecall;
    procedure Set_CH3cm_ManualAFC(Param1: WordBool); safecall;
    procedure Set_CH3cm_StaloPower(Param1: Double); safecall;
    procedure Set_CH3cm_StaloFreq(Param1: Integer); safecall;
    procedure Set_CH3cm_NCO(Param1: Integer); safecall;
    procedure Set_CH10cm_ManualAFC(Param1: WordBool); safecall;
    procedure Set_CH10cm_StaloPower(Param1: Double); safecall;
    procedure Set_CH10cm_StaloFreq(Param1: Integer); safecall;
    procedure Set_CH10cm_NCO(Param1: Integer); safecall;
    function SetMovement(Index: Integer; Angle: Integer; Speed: Integer; Pulse: Integer; 
                         Rate: Integer): HResult; safecall;
    procedure Set_FilterCH1(Param1: Integer); safecall;
    procedure Set_FilterCH2(Param1: Integer); safecall;
    procedure Set_Filter_MaxAngle(Param1: Double); safecall;
    procedure Set_Filter_MaxHeigh(Param1: Integer); safecall;
    procedure Set_Filter_MaxDistance(Param1: Integer); safecall;
    procedure Set_FilterSQI(Param1: WordBool); safecall;
    procedure Set_FilterCI(Param1: WordBool); safecall;
    procedure Set_FilterSIG(Param1: WordBool); safecall;
    procedure Set_FilterLOG(Param1: WordBool); safecall;
    procedure Set_FilterCCOR(Param1: WordBool); safecall;
    procedure Set_Sectores(Value: Integer); safecall;
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
    property FTPSettings: WideString write Set_FTPSettings;
    property SentFTP: WordBool write Set_SentFTP;
    property Pulso: TxPulse write Set_Pulso;
    property Filter: WordBool write Set_Filter;
    property PulseRate: TxDualPulse write Set_PulseRate;
    property CH3cm_ManualAFC: WordBool write Set_CH3cm_ManualAFC;
    property CH3cm_StaloPower: Double write Set_CH3cm_StaloPower;
    property CH3cm_StaloFreq: Integer write Set_CH3cm_StaloFreq;
    property CH3cm_NCO: Integer write Set_CH3cm_NCO;
    property CH10cm_ManualAFC: WordBool write Set_CH10cm_ManualAFC;
    property CH10cm_StaloPower: Double write Set_CH10cm_StaloPower;
    property CH10cm_StaloFreq: Integer write Set_CH10cm_StaloFreq;
    property CH10cm_NCO: Integer write Set_CH10cm_NCO;
    property FilterCH1: Integer write Set_FilterCH1;
    property FilterCH2: Integer write Set_FilterCH2;
    property Filter_MaxAngle: Double write Set_Filter_MaxAngle;
    property Filter_MaxHeigh: Integer write Set_Filter_MaxHeigh;
    property Filter_MaxDistance: Integer write Set_Filter_MaxDistance;
    property FilterSQI: WordBool write Set_FilterSQI;
    property FilterCI: WordBool write Set_FilterCI;
    property FilterSIG: WordBool write Set_FilterSIG;
    property FilterLOG: WordBool write Set_FilterLOG;
    property FilterCCOR: WordBool write Set_FilterCCOR;
    property Sectores: Integer write Set_Sectores;
  end;

// *********************************************************************//
// DispIntf:  ITemplateControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {D7E21C97-B28A-455E-AA07-C7A5A4B33DF7}
// *********************************************************************//
  ITemplateControlDisp = dispinterface
    ['{D7E21C97-B28A-455E-AA07-C7A5A4B33DF7}']
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
    property FTPSettings: WideString writeonly dispid 101;
    property SentFTP: WordBool writeonly dispid 102;
    property Pulso: TxPulse writeonly dispid 103;
    property Filter: WordBool writeonly dispid 122;
    property PulseRate: TxDualPulse writeonly dispid 125;
    property CH3cm_ManualAFC: WordBool writeonly dispid 104;
    property CH3cm_StaloPower: Double writeonly dispid 105;
    property CH3cm_StaloFreq: Integer writeonly dispid 106;
    property CH3cm_NCO: Integer writeonly dispid 107;
    property CH10cm_ManualAFC: WordBool writeonly dispid 108;
    property CH10cm_StaloPower: Double writeonly dispid 109;
    property CH10cm_StaloFreq: Integer writeonly dispid 123;
    property CH10cm_NCO: Integer writeonly dispid 124;
    function SetMovement(Index: Integer; Angle: Integer; Speed: Integer; Pulse: Integer; 
                         Rate: Integer): HResult; dispid 126;
    property FilterCH1: Integer writeonly dispid 110;
    property FilterCH2: Integer writeonly dispid 111;
    property Filter_MaxAngle: Double writeonly dispid 112;
    property Filter_MaxHeigh: Integer writeonly dispid 113;
    property Filter_MaxDistance: Integer writeonly dispid 114;
    property FilterSQI: WordBool writeonly dispid 115;
    property FilterCI: WordBool writeonly dispid 116;
    property FilterSIG: WordBool writeonly dispid 117;
    property FilterLOG: WordBool writeonly dispid 118;
    property FilterCCOR: WordBool writeonly dispid 119;
    property Sectores: Integer writeonly dispid 120;
  end;

// *********************************************************************//
// Interface: IObservations
// Flags:     (320) Dual OleAutomation
// GUID:      {C7515B26-BB5B-4823-9C06-CAE3AC76B545}
// *********************************************************************//
  IObservations = interface(IUnknown)
    ['{C7515B26-BB5B-4823-9C06-CAE3AC76B545}']
    function Get_Plantillas: Integer; safecall;
    function Ejecutar(const Name: WideString): HResult; safecall;
    function Plantilla(Index: Integer): ITemplate; safecall;
    function Buscar(const Index: WideString): ITemplate; safecall;
    function ChequearRadar: HResult; safecall;
    property Plantillas: Integer read Get_Plantillas;
  end;

// *********************************************************************//
// DispIntf:  IObservationsDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {C7515B26-BB5B-4823-9C06-CAE3AC76B545}
// *********************************************************************//
  IObservationsDisp = dispinterface
    ['{C7515B26-BB5B-4823-9C06-CAE3AC76B545}']
    property Plantillas: Integer readonly dispid 1;
    function Ejecutar(const Name: WideString): HResult; dispid 2;
    function Plantilla(Index: Integer): ITemplate; dispid 101;
    function Buscar(const Index: WideString): ITemplate; dispid 102;
    function ChequearRadar: HResult; dispid 103;
  end;

// *********************************************************************//
// Interface: IObservationsControl
// Flags:     (320) Dual OleAutomation
// GUID:      {69CDD5C2-7A7E-453F-8772-40E9D779E808}
// *********************************************************************//
  IObservationsControl = interface(IUnknown)
    ['{69CDD5C2-7A7E-453F-8772-40E9D779E808}']
    function Nueva: ITemplateControl; safecall;
    function Control(const Name: WideString): ITemplateControl; safecall;
    function Clonar(const TemplateName: WideString): ITemplateControl; safecall;
  end;

// *********************************************************************//
// DispIntf:  IObservationsControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {69CDD5C2-7A7E-453F-8772-40E9D779E808}
// *********************************************************************//
  IObservationsControlDisp = dispinterface
    ['{69CDD5C2-7A7E-453F-8772-40E9D779E808}']
    function Nueva: ITemplateControl; dispid 101;
    function Control(const Name: WideString): ITemplateControl; dispid 102;
    function Clonar(const TemplateName: WideString): ITemplateControl; dispid 103;
  end;

// *********************************************************************//
// Interface: IVideo
// Flags:     (320) Dual OleAutomation
// GUID:      {348983B0-49C9-4BA2-B9C4-5D494614360B}
// *********************************************************************//
  IVideo = interface(IUnknown)
    ['{348983B0-49C9-4BA2-B9C4-5D494614360B}']
    procedure StartAcquiring(Ch1: WordBool; Ch2: WordBool); safecall;
    function Frequency(Channel: Integer): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IVideoDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {348983B0-49C9-4BA2-B9C4-5D494614360B}
// *********************************************************************//
  IVideoDisp = dispinterface
    ['{348983B0-49C9-4BA2-B9C4-5D494614360B}']
    procedure StartAcquiring(Ch1: WordBool; Ch2: WordBool); dispid 105;
    function Frequency(Channel: Integer): Integer; dispid 101;
  end;

// *********************************************************************//
// Interface: IStatistics
// Flags:     (320) Dual OleAutomation
// GUID:      {EFC42B77-2BE7-4EBE-B75E-A748DB6FDB52}
// *********************************************************************//
  IStatistics = interface(IUnknown)
    ['{EFC42B77-2BE7-4EBE-B75E-A748DB6FDB52}']
    function Get_SwitchedOnRDA: Integer; safecall;
    function Get_SwitchedOnRadar: Integer; safecall;
    function Get_SwitchedOnAcc: Integer; safecall;
    function Get_SwitchedOnMotorAz: Integer; safecall;
    function Get_SwitchedOnMotorEl: Integer; safecall;
    function Get_SwitchedOnTxCaldeo: Integer; safecall;
    function Get_SwitchedOnTxAnodo: Integer; safecall;
    function Get_SwitchedOnRx: Integer; safecall;
    function Get_MagnetronCaldeo: Integer; safecall;
    function Get_MagnetronAnodo: Integer; safecall;
    function Get_TiratronPrincipal: Integer; safecall;
    function Get_TiratronAuxiliar: Integer; safecall;
    function Get_SwitchedOnTxCaldeo2: Integer; safecall;
    function Get_SwitchedOnTxAnodo2: Integer; safecall;
    function Get_SwitchedOnRx2: Integer; safecall;
    function Get_MagnetronCaldeo2: Integer; safecall;
    function Get_MagnetronAnodo2: Integer; safecall;
    function Get_TiratronPrincipal2: Integer; safecall;
    function Get_TiratronAuxiliar2: Integer; safecall;
    function Get_TiratronPrincipalAnodo2: Integer; safecall;
    function Get_TiratronPrincipalAnodo1: Integer; safecall;
    property SwitchedOnRDA: Integer read Get_SwitchedOnRDA;
    property SwitchedOnRadar: Integer read Get_SwitchedOnRadar;
    property SwitchedOnAcc: Integer read Get_SwitchedOnAcc;
    property SwitchedOnMotorAz: Integer read Get_SwitchedOnMotorAz;
    property SwitchedOnMotorEl: Integer read Get_SwitchedOnMotorEl;
    property SwitchedOnTxCaldeo: Integer read Get_SwitchedOnTxCaldeo;
    property SwitchedOnTxAnodo: Integer read Get_SwitchedOnTxAnodo;
    property SwitchedOnRx: Integer read Get_SwitchedOnRx;
    property MagnetronCaldeo: Integer read Get_MagnetronCaldeo;
    property MagnetronAnodo: Integer read Get_MagnetronAnodo;
    property TiratronPrincipal: Integer read Get_TiratronPrincipal;
    property TiratronAuxiliar: Integer read Get_TiratronAuxiliar;
    property SwitchedOnTxCaldeo2: Integer read Get_SwitchedOnTxCaldeo2;
    property SwitchedOnTxAnodo2: Integer read Get_SwitchedOnTxAnodo2;
    property SwitchedOnRx2: Integer read Get_SwitchedOnRx2;
    property MagnetronCaldeo2: Integer read Get_MagnetronCaldeo2;
    property MagnetronAnodo2: Integer read Get_MagnetronAnodo2;
    property TiratronPrincipal2: Integer read Get_TiratronPrincipal2;
    property TiratronAuxiliar2: Integer read Get_TiratronAuxiliar2;
    property TiratronPrincipalAnodo2: Integer read Get_TiratronPrincipalAnodo2;
    property TiratronPrincipalAnodo1: Integer read Get_TiratronPrincipalAnodo1;
  end;

// *********************************************************************//
// DispIntf:  IStatisticsDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {EFC42B77-2BE7-4EBE-B75E-A748DB6FDB52}
// *********************************************************************//
  IStatisticsDisp = dispinterface
    ['{EFC42B77-2BE7-4EBE-B75E-A748DB6FDB52}']
    property SwitchedOnRDA: Integer readonly dispid 201;
    property SwitchedOnRadar: Integer readonly dispid 202;
    property SwitchedOnAcc: Integer readonly dispid 203;
    property SwitchedOnMotorAz: Integer readonly dispid 204;
    property SwitchedOnMotorEl: Integer readonly dispid 205;
    property SwitchedOnTxCaldeo: Integer readonly dispid 206;
    property SwitchedOnTxAnodo: Integer readonly dispid 207;
    property SwitchedOnRx: Integer readonly dispid 208;
    property MagnetronCaldeo: Integer readonly dispid 209;
    property MagnetronAnodo: Integer readonly dispid 210;
    property TiratronPrincipal: Integer readonly dispid 211;
    property TiratronAuxiliar: Integer readonly dispid 212;
    property SwitchedOnTxCaldeo2: Integer readonly dispid 101;
    property SwitchedOnTxAnodo2: Integer readonly dispid 102;
    property SwitchedOnRx2: Integer readonly dispid 103;
    property MagnetronCaldeo2: Integer readonly dispid 104;
    property MagnetronAnodo2: Integer readonly dispid 105;
    property TiratronPrincipal2: Integer readonly dispid 106;
    property TiratronAuxiliar2: Integer readonly dispid 107;
    property TiratronPrincipalAnodo2: Integer readonly dispid 108;
    property TiratronPrincipalAnodo1: Integer readonly dispid 109;
  end;

// *********************************************************************//
// Interface: IStatisticsControl
// Flags:     (320) Dual OleAutomation
// GUID:      {44A5E77C-F387-4D20-A048-4E08DAE6D57A}
// *********************************************************************//
  IStatisticsControl = interface(IUnknown)
    ['{44A5E77C-F387-4D20-A048-4E08DAE6D57A}']
    procedure Set_SwitchedOnRDA(Param1: Integer); safecall;
    procedure Set_SwitchedOnRadar(Param1: Integer); safecall;
    procedure Set_SwitchedOnAcc(Param1: Integer); safecall;
    procedure Set_SwitchedOnMotorAz(Param1: Integer); safecall;
    procedure Set_SwitchedOnMotorEl(Param1: Integer); safecall;
    procedure Set_SwitchedOnTxCaldeo(Param1: Integer); safecall;
    procedure Set_SwitchedOnTxAnodo(Param1: Integer); safecall;
    procedure Set_SwitchedOnRx(Param1: Integer); safecall;
    procedure Set_MagnetronCaldeo(Param1: Integer); safecall;
    procedure Set_MagnetronAnodo(Param1: Integer); safecall;
    procedure Set_TiratronPrincipal(Param1: Integer); safecall;
    procedure Set_TiratronAuxiliar(Param1: Integer); safecall;
    procedure Set_SwitchedOnTxCaldeo2(Param1: Integer); safecall;
    procedure Set_SwitchedOnTxAnodo2(Param1: Integer); safecall;
    procedure Set_SwitchedOnRx2(Param1: Integer); safecall;
    procedure Set_MagnetronCaldeo2(Param1: Integer); safecall;
    procedure Set_MagnetronAnodo2(Param1: Integer); safecall;
    procedure Set_TiratronAuxiliar2(Param1: Integer); safecall;
    procedure Set_TiratronPrincipal2(Param1: Integer); safecall;
    procedure Set_TiratronPrincipalAnodo1(Param1: Integer); safecall;
    procedure Set_TiratronPrincipalAnodo2(Param1: Integer); safecall;
    property SwitchedOnRDA: Integer write Set_SwitchedOnRDA;
    property SwitchedOnRadar: Integer write Set_SwitchedOnRadar;
    property SwitchedOnAcc: Integer write Set_SwitchedOnAcc;
    property SwitchedOnMotorAz: Integer write Set_SwitchedOnMotorAz;
    property SwitchedOnMotorEl: Integer write Set_SwitchedOnMotorEl;
    property SwitchedOnTxCaldeo: Integer write Set_SwitchedOnTxCaldeo;
    property SwitchedOnTxAnodo: Integer write Set_SwitchedOnTxAnodo;
    property SwitchedOnRx: Integer write Set_SwitchedOnRx;
    property MagnetronCaldeo: Integer write Set_MagnetronCaldeo;
    property MagnetronAnodo: Integer write Set_MagnetronAnodo;
    property TiratronPrincipal: Integer write Set_TiratronPrincipal;
    property TiratronAuxiliar: Integer write Set_TiratronAuxiliar;
    property SwitchedOnTxCaldeo2: Integer write Set_SwitchedOnTxCaldeo2;
    property SwitchedOnTxAnodo2: Integer write Set_SwitchedOnTxAnodo2;
    property SwitchedOnRx2: Integer write Set_SwitchedOnRx2;
    property MagnetronCaldeo2: Integer write Set_MagnetronCaldeo2;
    property MagnetronAnodo2: Integer write Set_MagnetronAnodo2;
    property TiratronAuxiliar2: Integer write Set_TiratronAuxiliar2;
    property TiratronPrincipal2: Integer write Set_TiratronPrincipal2;
    property TiratronPrincipalAnodo1: Integer write Set_TiratronPrincipalAnodo1;
    property TiratronPrincipalAnodo2: Integer write Set_TiratronPrincipalAnodo2;
  end;

// *********************************************************************//
// DispIntf:  IStatisticsControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {44A5E77C-F387-4D20-A048-4E08DAE6D57A}
// *********************************************************************//
  IStatisticsControlDisp = dispinterface
    ['{44A5E77C-F387-4D20-A048-4E08DAE6D57A}']
    property SwitchedOnRDA: Integer writeonly dispid 201;
    property SwitchedOnRadar: Integer writeonly dispid 202;
    property SwitchedOnAcc: Integer writeonly dispid 203;
    property SwitchedOnMotorAz: Integer writeonly dispid 204;
    property SwitchedOnMotorEl: Integer writeonly dispid 205;
    property SwitchedOnTxCaldeo: Integer writeonly dispid 206;
    property SwitchedOnTxAnodo: Integer writeonly dispid 207;
    property SwitchedOnRx: Integer writeonly dispid 208;
    property MagnetronCaldeo: Integer writeonly dispid 209;
    property MagnetronAnodo: Integer writeonly dispid 210;
    property TiratronPrincipal: Integer writeonly dispid 211;
    property TiratronAuxiliar: Integer writeonly dispid 212;
    property SwitchedOnTxCaldeo2: Integer writeonly dispid 101;
    property SwitchedOnTxAnodo2: Integer writeonly dispid 102;
    property SwitchedOnRx2: Integer writeonly dispid 103;
    property MagnetronCaldeo2: Integer writeonly dispid 104;
    property MagnetronAnodo2: Integer writeonly dispid 105;
    property TiratronAuxiliar2: Integer writeonly dispid 107;
    property TiratronPrincipal2: Integer writeonly dispid 106;
    property TiratronPrincipalAnodo1: Integer writeonly dispid 108;
    property TiratronPrincipalAnodo2: Integer writeonly dispid 109;
  end;

// *********************************************************************//
// Interface: ITxControl
// Flags:     (320) Dual OleAutomation
// GUID:      {C81004B4-F810-4EE3-88BD-14A4E327DE69}
// *********************************************************************//
  ITxControl = interface(IUnknown)
    ['{C81004B4-F810-4EE3-88BD-14A4E327DE69}']
    procedure Tx_Encender; safecall;
    procedure Tx_Apagar; safecall;
    procedure Set_HV(Param1: WordBool); safecall;
    property HV: WordBool write Set_HV;
  end;

// *********************************************************************//
// DispIntf:  ITxControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {C81004B4-F810-4EE3-88BD-14A4E327DE69}
// *********************************************************************//
  ITxControlDisp = dispinterface
    ['{C81004B4-F810-4EE3-88BD-14A4E327DE69}']
    procedure Tx_Encender; dispid 1;
    procedure Tx_Apagar; dispid 2;
    property HV: WordBool writeonly dispid 103;
  end;

// *********************************************************************//
// Interface: IRxControl
// Flags:     (320) Dual OleAutomation
// GUID:      {485C6791-8868-4C1C-B21C-16E752D6F80D}
// *********************************************************************//
  IRxControl = interface(IUnknown)
    ['{485C6791-8868-4C1C-B21C-16E752D6F80D}']
    procedure Rx_Encender; safecall;
    procedure Rx_Apagar; safecall;
    procedure Set_Stalo_Freq(Param1: Int64); safecall;
    procedure Set_Stalo_Power(Param1: Double); safecall;
    procedure Stalo_Reset; safecall;
    procedure Set_AFC_Status(Param1: WordBool); safecall;
    procedure Set_Stalo_Output(Param1: WordBool); safecall;
    procedure Stalo_Update; safecall;
    procedure Set_NCO_Frequency(Param1: Int64); safecall;
    property Stalo_Freq: Int64 write Set_Stalo_Freq;
    property Stalo_Power: Double write Set_Stalo_Power;
    property AFC_Status: WordBool write Set_AFC_Status;
    property Stalo_Output: WordBool write Set_Stalo_Output;
    property NCO_Frequency: Int64 write Set_NCO_Frequency;
  end;

// *********************************************************************//
// DispIntf:  IRxControlDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {485C6791-8868-4C1C-B21C-16E752D6F80D}
// *********************************************************************//
  IRxControlDisp = dispinterface
    ['{485C6791-8868-4C1C-B21C-16E752D6F80D}']
    procedure Rx_Encender; dispid 4;
    procedure Rx_Apagar; dispid 5;
    property Stalo_Freq: {??Int64}OleVariant writeonly dispid 102;
    property Stalo_Power: Double writeonly dispid 103;
    procedure Stalo_Reset; dispid 104;
    property AFC_Status: WordBool writeonly dispid 101;
    property Stalo_Output: WordBool writeonly dispid 105;
    procedure Stalo_Update; dispid 106;
    property NCO_Frequency: {??Int64}OleVariant writeonly dispid 107;
  end;

// *********************************************************************//
// Interface: ITxStatus
// Flags:     (320) Dual OleAutomation
// GUID:      {35E03B50-B395-45E7-BFFA-6388A2BD274C}
// *********************************************************************//
  ITxStatus = interface(IUnknown)
    ['{35E03B50-B395-45E7-BFFA-6388A2BD274C}']
    function Get_Encendido: WordBool; safecall;
    function Get_HV: WordBool; safecall;
    function Get_Listo: WordBool; safecall;
    function Get_Averia_MPS: WordBool; safecall;
    function Get_Potencia_Code: Integer; safecall;
    function Get_Potencia_Unit: Double; safecall;
    function Get_MPS_Volt_Code: Integer; safecall;
    function Get_MPS_Volt_Unit: Double; safecall;
    function Get_MPS_Corr_Code: Integer; safecall;
    function Get_MPS_Corr_Unit: Double; safecall;
    function Get_Fuente_24VN_Code: Integer; safecall;
    function Get_Fuente_24VN_Unit: Double; safecall;
    function Get_Fuente_24VP_Code: Integer; safecall;
    function Get_Fuente_24VP_Unit: Double; safecall;
    function Get_Fuente_50V_Code: Integer; safecall;
    function Get_Fuente_50V_Unit: Double; safecall;
    function Get_Fuente_100V_Code: Integer; safecall;
    function Get_Fuente_100V_Unit: Double; safecall;
    function Get_Fuente_400V_Code: Integer; safecall;
    function Get_Fuente_400V_Unit: Double; safecall;
    function Get_Fuente_Filamento_Code: Integer; safecall;
    function Get_Fuente_Filamento_Unit: Double; safecall;
    function Get_Tx_Status: RadarStatus; safecall;
    function Get_Inter_Lock: WordBool; safecall;
    function Get_Ventilacion: WordBool; safecall;
    function Get_Averia_Ventilador: WordBool; safecall;
    function Get_Averia_Fuente_Filamento: WordBool; safecall;
    function Get_Local: WordBool; safecall;
    function Get_Averia: WordBool; safecall;
    property Encendido: WordBool read Get_Encendido;
    property HV: WordBool read Get_HV;
    property Listo: WordBool read Get_Listo;
    property Averia_MPS: WordBool read Get_Averia_MPS;
    property Potencia_Code: Integer read Get_Potencia_Code;
    property Potencia_Unit: Double read Get_Potencia_Unit;
    property MPS_Volt_Code: Integer read Get_MPS_Volt_Code;
    property MPS_Volt_Unit: Double read Get_MPS_Volt_Unit;
    property MPS_Corr_Code: Integer read Get_MPS_Corr_Code;
    property MPS_Corr_Unit: Double read Get_MPS_Corr_Unit;
    property Fuente_24VN_Code: Integer read Get_Fuente_24VN_Code;
    property Fuente_24VN_Unit: Double read Get_Fuente_24VN_Unit;
    property Fuente_24VP_Code: Integer read Get_Fuente_24VP_Code;
    property Fuente_24VP_Unit: Double read Get_Fuente_24VP_Unit;
    property Fuente_50V_Code: Integer read Get_Fuente_50V_Code;
    property Fuente_50V_Unit: Double read Get_Fuente_50V_Unit;
    property Fuente_100V_Code: Integer read Get_Fuente_100V_Code;
    property Fuente_100V_Unit: Double read Get_Fuente_100V_Unit;
    property Fuente_400V_Code: Integer read Get_Fuente_400V_Code;
    property Fuente_400V_Unit: Double read Get_Fuente_400V_Unit;
    property Fuente_Filamento_Code: Integer read Get_Fuente_Filamento_Code;
    property Fuente_Filamento_Unit: Double read Get_Fuente_Filamento_Unit;
    property Tx_Status: RadarStatus read Get_Tx_Status;
    property Inter_Lock: WordBool read Get_Inter_Lock;
    property Ventilacion: WordBool read Get_Ventilacion;
    property Averia_Ventilador: WordBool read Get_Averia_Ventilador;
    property Averia_Fuente_Filamento: WordBool read Get_Averia_Fuente_Filamento;
    property Local: WordBool read Get_Local;
    property Averia: WordBool read Get_Averia;
  end;

// *********************************************************************//
// DispIntf:  ITxStatusDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {35E03B50-B395-45E7-BFFA-6388A2BD274C}
// *********************************************************************//
  ITxStatusDisp = dispinterface
    ['{35E03B50-B395-45E7-BFFA-6388A2BD274C}']
    property Encendido: WordBool readonly dispid 1;
    property HV: WordBool readonly dispid 2;
    property Listo: WordBool readonly dispid 3;
    property Averia_MPS: WordBool readonly dispid 4;
    property Potencia_Code: Integer readonly dispid 102;
    property Potencia_Unit: Double readonly dispid 103;
    property MPS_Volt_Code: Integer readonly dispid 104;
    property MPS_Volt_Unit: Double readonly dispid 105;
    property MPS_Corr_Code: Integer readonly dispid 106;
    property MPS_Corr_Unit: Double readonly dispid 107;
    property Fuente_24VN_Code: Integer readonly dispid 108;
    property Fuente_24VN_Unit: Double readonly dispid 109;
    property Fuente_24VP_Code: Integer readonly dispid 112;
    property Fuente_24VP_Unit: Double readonly dispid 113;
    property Fuente_50V_Code: Integer readonly dispid 114;
    property Fuente_50V_Unit: Double readonly dispid 115;
    property Fuente_100V_Code: Integer readonly dispid 116;
    property Fuente_100V_Unit: Double readonly dispid 117;
    property Fuente_400V_Code: Integer readonly dispid 118;
    property Fuente_400V_Unit: Double readonly dispid 119;
    property Fuente_Filamento_Code: Integer readonly dispid 120;
    property Fuente_Filamento_Unit: Double readonly dispid 121;
    property Tx_Status: RadarStatus readonly dispid 101;
    property Inter_Lock: WordBool readonly dispid 122;
    property Ventilacion: WordBool readonly dispid 123;
    property Averia_Ventilador: WordBool readonly dispid 124;
    property Averia_Fuente_Filamento: WordBool readonly dispid 125;
    property Local: WordBool readonly dispid 110;
    property Averia: WordBool readonly dispid 111;
  end;

// *********************************************************************//
// Interface: IRxStatus
// Flags:     (320) Dual OleAutomation
// GUID:      {C0E2147E-F462-4CB6-BB97-DD71AB30F107}
// *********************************************************************//
  IRxStatus = interface(IUnknown)
    ['{C0E2147E-F462-4CB6-BB97-DD71AB30F107}']
    function Get_Stalo_Temperature: Double; safecall;
    function Get_Stalo_Power: Double; safecall;
    function Get_Stalo_Frequency: Int64; safecall;
    function Get_Stalo_ExtRef: WordBool; safecall;
    function Get_Stalo_Ref_Unlocked: WordBool; safecall;
    function Get_Stalo_RF_Unlocked: WordBool; safecall;
    function Get_Stalo_RF_Output: WordBool; safecall;
    function Get_Stalo_VoltageError: WordBool; safecall;
    function Get_Stalo_Ref_Output: WordBool; safecall;
    function Get_Stalo_Blanking: WordBool; safecall;
    function Get_Stalo_LockRecovery: WordBool; safecall;
    function Get_AFC_Status: WordBool; safecall;
    function Get_Tx_Frequency: Int64; safecall;
    function Get_Tx_IF: Int64; safecall;
    function Get_Tx_PulsePower: Double; safecall;
    function Get_NCO_Frequency: Int64; safecall;
    procedure StartAcquiring; safecall;
    function Get_Rx_Status: RadarStatus; safecall;
    function Get_Fuente_5V_N: WordBool; safecall;
    function Get_Fuente_5V_P: WordBool; safecall;
    function Get_Fuente_15V_N: WordBool; safecall;
    function Get_Fuente_15V_P: WordBool; safecall;
    function Get_Stalo_Locked: WordBool; safecall;
    function Get_DRX_Ready: WordBool; safecall;
    property Stalo_Temperature: Double read Get_Stalo_Temperature;
    property Stalo_Power: Double read Get_Stalo_Power;
    property Stalo_Frequency: Int64 read Get_Stalo_Frequency;
    property Stalo_ExtRef: WordBool read Get_Stalo_ExtRef;
    property Stalo_Ref_Unlocked: WordBool read Get_Stalo_Ref_Unlocked;
    property Stalo_RF_Unlocked: WordBool read Get_Stalo_RF_Unlocked;
    property Stalo_RF_Output: WordBool read Get_Stalo_RF_Output;
    property Stalo_VoltageError: WordBool read Get_Stalo_VoltageError;
    property Stalo_Ref_Output: WordBool read Get_Stalo_Ref_Output;
    property Stalo_Blanking: WordBool read Get_Stalo_Blanking;
    property Stalo_LockRecovery: WordBool read Get_Stalo_LockRecovery;
    property AFC_Status: WordBool read Get_AFC_Status;
    property Tx_Frequency: Int64 read Get_Tx_Frequency;
    property Tx_IF: Int64 read Get_Tx_IF;
    property Tx_PulsePower: Double read Get_Tx_PulsePower;
    property NCO_Frequency: Int64 read Get_NCO_Frequency;
    property Rx_Status: RadarStatus read Get_Rx_Status;
    property Fuente_5V_N: WordBool read Get_Fuente_5V_N;
    property Fuente_5V_P: WordBool read Get_Fuente_5V_P;
    property Fuente_15V_N: WordBool read Get_Fuente_15V_N;
    property Fuente_15V_P: WordBool read Get_Fuente_15V_P;
    property Stalo_Locked: WordBool read Get_Stalo_Locked;
    property DRX_Ready: WordBool read Get_DRX_Ready;
  end;

// *********************************************************************//
// DispIntf:  IRxStatusDisp
// Flags:     (320) Dual OleAutomation
// GUID:      {C0E2147E-F462-4CB6-BB97-DD71AB30F107}
// *********************************************************************//
  IRxStatusDisp = dispinterface
    ['{C0E2147E-F462-4CB6-BB97-DD71AB30F107}']
    property Stalo_Temperature: Double readonly dispid 107;
    property Stalo_Power: Double readonly dispid 108;
    property Stalo_Frequency: {??Int64}OleVariant readonly dispid 109;
    property Stalo_ExtRef: WordBool readonly dispid 110;
    property Stalo_Ref_Unlocked: WordBool readonly dispid 111;
    property Stalo_RF_Unlocked: WordBool readonly dispid 112;
    property Stalo_RF_Output: WordBool readonly dispid 113;
    property Stalo_VoltageError: WordBool readonly dispid 114;
    property Stalo_Ref_Output: WordBool readonly dispid 115;
    property Stalo_Blanking: WordBool readonly dispid 116;
    property Stalo_LockRecovery: WordBool readonly dispid 117;
    property AFC_Status: WordBool readonly dispid 118;
    property Tx_Frequency: {??Int64}OleVariant readonly dispid 119;
    property Tx_IF: {??Int64}OleVariant readonly dispid 120;
    property Tx_PulsePower: Double readonly dispid 121;
    property NCO_Frequency: {??Int64}OleVariant readonly dispid 122;
    procedure StartAcquiring; dispid 123;
    property Rx_Status: RadarStatus readonly dispid 101;
    property Fuente_5V_N: WordBool readonly dispid 102;
    property Fuente_5V_P: WordBool readonly dispid 103;
    property Fuente_15V_N: WordBool readonly dispid 104;
    property Fuente_15V_P: WordBool readonly dispid 105;
    property Stalo_Locked: WordBool readonly dispid 106;
    property DRX_Ready: WordBool readonly dispid 124;
  end;

// *********************************************************************//
// The Class CoVestaRda provides a Create and CreateRemote method to          
// create instances of the default interface IVestaRda exposed by              
// the CoClass VestaRda. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoVestaRda = class
    class function Create: IVestaRda;
    class function CreateRemote(const MachineName: string): IVestaRda;
  end;

implementation

uses ComObj;

class function CoVestaRda.Create: IVestaRda;
begin
  Result := CreateComObject(CLASS_VestaRda) as IVestaRda;
end;

class function CoVestaRda.CreateRemote(const MachineName: string): IVestaRda;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_VestaRda) as IVestaRda;
end;

end.
