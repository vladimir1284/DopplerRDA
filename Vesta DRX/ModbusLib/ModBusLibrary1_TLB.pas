unit ModBusLibrary1_TLB;

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
// File generated on 1/1/2002 6:44:10 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Radar_CSB\Source\ModbusLib\ModBusLibrary1.tlb (1)
// LIBID: {F34F72CD-D52F-4DBF-B9E1-370EBBE3C4DB}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TModLib) : Server mscoree.dll contains no icons
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, mscorlib_TLB, OleServer, StdVCL, Variants;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ModBusLibrary1MajorVersion = 1;
  ModBusLibrary1MinorVersion = 0;

  LIBID_ModBusLibrary1: TGUID = '{F34F72CD-D52F-4DBF-B9E1-370EBBE3C4DB}';

  IID_IModLib: TGUID = '{97D1968E-DC7F-45BD-BD0E-1AC822D95264}';
  CLASS_ModLib: TGUID = '{E8D53EED-3B2F-45A8-BB29-CC111BB426D1}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IModLib = interface;
  IModLibDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ModLib = IModLib;


// *********************************************************************//
// Interface: IModLib
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {97D1968E-DC7F-45BD-BD0E-1AC822D95264}
// *********************************************************************//
  IModLib = interface(IDispatch)
    ['{97D1968E-DC7F-45BD-BD0E-1AC822D95264}']
    function Sumar(a: Integer; b: Integer): Double; safecall;
    function ConfMod(iCom: Integer; bRegister: WordBool): Integer; safecall;
    function OpenComPort(ReadInterval: Integer; ReadTotalConstant: Integer; 
                         ReadTotalMultiplier: Integer; WriteTotalConstant: Integer; 
                         WriteTotalMultiplier: Integer): WordBool; safecall;
    function CloseComPort: WordBool; safecall;
    function ReadCoil(module: Integer; bit: Integer; NBit: Integer): WordBool; safecall;
    function WriteBit(module: Integer; bit: Integer; state: WordBool): WordBool; safecall;
    function ReadBit(module: Integer; bit: Integer; NBit: Integer; out WordValue: Integer): WordBool; safecall;
    function WriteCode(module: Integer; channel: Integer; code: Integer): WordBool; safecall;
    function ReadCode(module: Integer; channel: Integer; NChannel: Integer; out Codes: PSafeArray): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IModLibDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {97D1968E-DC7F-45BD-BD0E-1AC822D95264}
// *********************************************************************//
  IModLibDisp = dispinterface
    ['{97D1968E-DC7F-45BD-BD0E-1AC822D95264}']
    function Sumar(a: Integer; b: Integer): Double; dispid 1610743808;
    function ConfMod(iCom: Integer; bRegister: WordBool): Integer; dispid 1610743809;
    function OpenComPort(ReadInterval: Integer; ReadTotalConstant: Integer; 
                         ReadTotalMultiplier: Integer; WriteTotalConstant: Integer; 
                         WriteTotalMultiplier: Integer): WordBool; dispid 1610743810;
    function CloseComPort: WordBool; dispid 1610743811;
    function ReadCoil(module: Integer; bit: Integer; NBit: Integer): WordBool; dispid 1610743812;
    function WriteBit(module: Integer; bit: Integer; state: WordBool): WordBool; dispid 1610743813;
    function ReadBit(module: Integer; bit: Integer; NBit: Integer; out WordValue: Integer): WordBool; dispid 1610743814;
    function WriteCode(module: Integer; channel: Integer; code: Integer): WordBool; dispid 1610743815;
    function ReadCode(module: Integer; channel: Integer; NChannel: Integer; 
                      out Codes: {??PSafeArray}OleVariant): WordBool; dispid 1610743816;
  end;

// *********************************************************************//
// The Class CoModLib provides a Create and CreateRemote method to          
// create instances of the default interface IModLib exposed by              
// the CoClass ModLib. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoModLib = class
    class function Create: IModLib;
    class function CreateRemote(const MachineName: string): IModLib;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TModLib
// Help String      : 
// Default Interface: IModLib
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TModLibProperties= class;
{$ENDIF}
  TModLib = class(TOleServer)
  private
    FIntf:        IModLib;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TModLibProperties;
    function      GetServerProperties: TModLibProperties;
{$ENDIF}
    function      GetDefaultInterface: IModLib;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IModLib);
    procedure Disconnect; override;
    function Sumar(a: Integer; b: Integer): Double;
    function ConfMod(iCom: Integer; bRegister: WordBool): Integer;
    function OpenComPort(ReadInterval: Integer; ReadTotalConstant: Integer; 
                         ReadTotalMultiplier: Integer; WriteTotalConstant: Integer; 
                         WriteTotalMultiplier: Integer): WordBool;
    function CloseComPort: WordBool;
    function ReadCoil(module: Integer; bit: Integer; NBit: Integer): WordBool;
    function WriteBit(module: Integer; bit: Integer; state: WordBool): WordBool;
    function ReadBit(module: Integer; bit: Integer; NBit: Integer; out WordValue: Integer): WordBool;
    function WriteCode(module: Integer; channel: Integer; code: Integer): WordBool;
    function ReadCode(module: Integer; channel: Integer; NChannel: Integer; out Codes: PSafeArray): WordBool;
    property DefaultInterface: IModLib read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TModLibProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TModLib
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TModLibProperties = class(TPersistent)
  private
    FServer:    TModLib;
    function    GetDefaultInterface: IModLib;
    constructor Create(AServer: TModLib);
  protected
  public
    property DefaultInterface: IModLib read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoModLib.Create: IModLib;
begin
  Result := CreateComObject(CLASS_ModLib) as IModLib;
end;

class function CoModLib.CreateRemote(const MachineName: string): IModLib;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ModLib) as IModLib;
end;

procedure TModLib.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{E8D53EED-3B2F-45A8-BB29-CC111BB426D1}';
    IntfIID:   '{97D1968E-DC7F-45BD-BD0E-1AC822D95264}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TModLib.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IModLib;
  end;
end;

procedure TModLib.ConnectTo(svrIntf: IModLib);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TModLib.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TModLib.GetDefaultInterface: IModLib;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TModLib.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TModLibProperties.Create(Self);
{$ENDIF}
end;

destructor TModLib.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TModLib.GetServerProperties: TModLibProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TModLib.Sumar(a: Integer; b: Integer): Double;
begin
  Result := DefaultInterface.Sumar(a, b);
end;

function TModLib.ConfMod(iCom: Integer; bRegister: WordBool): Integer;
begin
  Result := DefaultInterface.ConfMod(iCom, bRegister);
end;

function TModLib.OpenComPort(ReadInterval: Integer; ReadTotalConstant: Integer; 
                             ReadTotalMultiplier: Integer; WriteTotalConstant: Integer; 
                             WriteTotalMultiplier: Integer): WordBool;
begin
  Result := DefaultInterface.OpenComPort(ReadInterval, ReadTotalConstant, ReadTotalMultiplier, 
                                         WriteTotalConstant, WriteTotalMultiplier);
end;

function TModLib.CloseComPort: WordBool;
begin
  Result := DefaultInterface.CloseComPort;
end;

function TModLib.ReadCoil(module: Integer; bit: Integer; NBit: Integer): WordBool;
begin
  Result := DefaultInterface.ReadCoil(module, bit, NBit);
end;

function TModLib.WriteBit(module: Integer; bit: Integer; state: WordBool): WordBool;
begin
  Result := DefaultInterface.WriteBit(module, bit, state);
end;

function TModLib.ReadBit(module: Integer; bit: Integer; NBit: Integer; out WordValue: Integer): WordBool;
begin
  Result := DefaultInterface.ReadBit(module, bit, NBit, WordValue);
end;

function TModLib.WriteCode(module: Integer; channel: Integer; code: Integer): WordBool;
begin
  Result := DefaultInterface.WriteCode(module, channel, code);
end;

function TModLib.ReadCode(module: Integer; channel: Integer; NChannel: Integer; 
                          out Codes: PSafeArray): WordBool;
begin
  Result := DefaultInterface.ReadCode(module, channel, NChannel, Codes);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TModLibProperties.Create(AServer: TModLib);
begin
  inherited Create;
  FServer := AServer;
end;

function TModLibProperties.GetDefaultInterface: IModLib;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TModLib]);
end;

end.
