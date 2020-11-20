// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'ZylSerialPort.pas' rev: 5.00

#ifndef ZylSerialPortHPP
#define ZylSerialPortHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Registry.hpp>	// Pascal unit
#include <Math.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Zylserialport
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TCommPort { spNone, spCOM1, spCOM2, spCOM3, spCOM4, spCOM5, spCOM6, spCOM7, spCOM8, spCOM9, spCOM10, 
	spCOM11, spCOM12, spCOM13, spCOM14, spCOM15, spCOM16, spCOM17, spCOM18, spCOM19, spCOM20, spCOM21, 
	spCOM22, spCOM23, spCOM24, spCOM25, spCOM26, spCOM27, spCOM28, spCOM29, spCOM30, spCOM31, spCOM32, 
	spCOM33, spCOM34, spCOM35, spCOM36, spCOM37, spCOM38, spCOM39, spCOM40, spCOM41, spCOM42, spCOM43, 
	spCOM44, spCOM45, spCOM46, spCOM47, spCOM48, spCOM49, spCOM50, spCOM51, spCOM52, spCOM53, spCOM54, 
	spCOM55, spCOM56, spCOM57, spCOM58, spCOM59, spCOM60, spCOM61, spCOM62, spCOM63, spCOM64, spCOM65, 
	spCOM66, spCOM67, spCOM68, spCOM69, spCOM70, spCOM71, spCOM72, spCOM73, spCOM74, spCOM75, spCOM76, 
	spCOM77, spCOM78, spCOM79, spCOM80, spCOM81, spCOM82, spCOM83, spCOM84, spCOM85, spCOM86, spCOM87, 
	spCOM88, spCOM89, spCOM90, spCOM91, spCOM92, spCOM93, spCOM94, spCOM95, spCOM96, spCOM97, spCOM98, 
	spCOM99, spCOM100, spCOM101, spCOM102, spCOM103, spCOM104, spCOM105, spCOM106, spCOM107, spCOM108, 
	spCOM109, spCOM110, spCOM111, spCOM112, spCOM113, spCOM114, spCOM115, spCOM116, spCOM117, spCOM118, 
	spCOM119, spCOM120, spCOM121, spCOM122, spCOM123, spCOM124, spCOM125, spCOM126, spCOM127, spCOM128, 
	spCOM129, spCOM130, spCOM131, spCOM132, spCOM133, spCOM134, spCOM135, spCOM136, spCOM137, spCOM138, 
	spCOM139, spCOM140, spCOM141, spCOM142, spCOM143, spCOM144, spCOM145, spCOM146, spCOM147, spCOM148, 
	spCOM149, spCOM150, spCOM151, spCOM152, spCOM153, spCOM154, spCOM155, spCOM156, spCOM157, spCOM158, 
	spCOM159, spCOM160, spCOM161, spCOM162, spCOM163, spCOM164, spCOM165, spCOM166, spCOM167, spCOM168, 
	spCOM169, spCOM170, spCOM171, spCOM172, spCOM173, spCOM174, spCOM175, spCOM176, spCOM177, spCOM178, 
	spCOM179, spCOM180, spCOM181, spCOM182, spCOM183, spCOM184, spCOM185, spCOM186, spCOM187, spCOM188, 
	spCOM189, spCOM190, spCOM191, spCOM192, spCOM193, spCOM194, spCOM195, spCOM196, spCOM197, spCOM198, 
	spCOM199, spCOM200, spCOM201, spCOM202, spCOM203, spCOM204, spCOM205, spCOM206, spCOM207, spCOM208, 
	spCOM209, spCOM210, spCOM211, spCOM212, spCOM213, spCOM214, spCOM215, spCOM216, spCOM217, spCOM218, 
	spCOM219, spCOM220, spCOM221, spCOM222, spCOM223, spCOM224, spCOM225, spCOM226, spCOM227, spCOM228, 
	spCOM229, spCOM230, spCOM231, spCOM232, spCOM233, spCOM234, spCOM235, spCOM236, spCOM237, spCOM238, 
	spCOM239, spCOM240, spCOM241, spCOM242, spCOM243, spCOM244, spCOM245, spCOM246, spCOM247, spCOM248, 
	spCOM249, spCOM250, spCOM251, spCOM252, spCOM253, spCOM254, spCustom };
#pragma option pop

typedef Set<TCommPort, spNone, spCustom>  TCommPortSet;

#pragma option push -b-
enum TBaudRate { br000075, br000110, br000134, br000150, br000300, br000600, br001200, br001800, br002400, 
	br004800, br007200, br009600, br014400, br019200, br038400, br057600, br115200, br128000, br230400, 
	br256000, br460800, br921600, brCustom };
#pragma option pop

#pragma option push -b-
enum TStopBits { sb1Bit, sb1_5Bits, sb2Bits };
#pragma option pop

#pragma option push -b-
enum TDataWidth { dw5Bits, dw6Bits, dw7Bits, dw8Bits };
#pragma option pop

#pragma option push -b-
enum TParityBits { pbNone, pbOdd, pbEven, pbMark, pbSpace };
#pragma option pop

#pragma option push -b-
enum THwFlowControl { hfNONE, hfRTS, hfRTSCTS };
#pragma option pop

#pragma option push -b-
enum TSwFlowControl { sfNONE, sfXONXOFF };
#pragma option pop

#pragma option push -b-
enum TLineStatus { lsCTS, lsDSR, lsRING, lsCD };
#pragma option pop

typedef Set<TLineStatus, lsCTS, lsCD>  TLineStatusSet;

typedef void __fastcall (__closure *TConnectEvent)(System::TObject* Sender, TCommPort Port);

typedef void __fastcall (__closure *TSendReceiveEvent)(System::TObject* Sender, AnsiString Buffer);

typedef void __fastcall (__closure *TLineStatusEvent)(System::TObject* Sender, TLineStatusSet LineStatus
	);

class DELPHICLASS TZylSerialPort;
class PASCALIMPLEMENTATION TZylSerialPort : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	AnsiString FPort;
	AnsiString FCustomPortName;
	int FBaudRate;
	int FCustomBaudRate;
	Byte FDataWidth;
	Byte FParity;
	Byte FStopBits;
	bool FEnableDTROnOpen;
	bool FEnableRTSOnOpen;
	THwFlowControl FHwFlowControl;
	TSwFlowControl FSwFlowControl;
	AnsiString FReadBuffer;
	TLineStatusSet FLineStatus;
	int FReadIntervalTimeout;
	int FReadTotalTimeoutMultiplier;
	int FReadTotalTimeoutConstant;
	int FWriteTotalTimeoutMultiplier;
	int FWriteTotalTimeoutConstant;
	Classes::TThreadPriority FPriority;
	unsigned FDelay;
	unsigned FInputBuffer;
	unsigned FOutputBuffer;
	double FVersion;
	Classes::TThread* ComThread;
	TCommPort ConnectedTo;
	bool FRegistered;
	bool FIsSending;
	bool FIsReceiving;
	bool FNeedSynchronization;
	TSendReceiveEvent FOnReceive;
	TSendReceiveEvent FOnSend;
	TLineStatusEvent FOnLineStatusChange;
	TConnectEvent FOnConnect;
	TConnectEvent FOnDisconnect;
	TCommPort __fastcall GetCommPort(void);
	void __fastcall SetCommPort(const TCommPort Value);
	TBaudRate __fastcall GetBaudRate(void);
	void __fastcall SetBaudRate(const TBaudRate Value);
	TDataWidth __fastcall GetDataWidth(void);
	void __fastcall SetDataWidth(const TDataWidth Value);
	TStopBits __fastcall GetStopBits(void);
	void __fastcall SetStopBits(const TStopBits Value);
	TParityBits __fastcall GetParity(void);
	void __fastcall SetParity(const TParityBits Value);
	void __fastcall SetCustomBaudRate(const int Value);
	void __fastcall SetCustomPortName(const AnsiString Value);
	void __fastcall SetEnableDTROnOpen(const bool Value);
	void __fastcall SetEnableRTSOnOpen(const bool Value);
	void __fastcall SetHwFlowControl(const THwFlowControl Value);
	void __fastcall SetSwFlowControl(const TSwFlowControl Value);
	void __fastcall SetPriority(const Classes::TThreadPriority Value);
	void __fastcall SetInputBuffer(const unsigned Value);
	void __fastcall SetOutputBuffer(const unsigned Value);
	bool __fastcall SetDCBState(const unsigned ComDevice);
	bool __fastcall SetTimeOuts(const unsigned ComDevice);
	bool __fastcall SetBuffers(const unsigned ComDevice);
	TLineStatusSet __fastcall GetLineStatus(const unsigned ComDevice);
	bool __fastcall RunningInTheIDE(void);
	AnsiString __fastcall DataToAnsiStr(void * Buffer, Word Length);
	
public:
	__property bool IsSending = {read=FIsSending, default=0};
	__property bool IsReceiving = {read=FIsReceiving, default=0};
	__property bool NeedSynchronization = {read=FNeedSynchronization, write=FNeedSynchronization, default=0
		};
	__property double Version = {read=FVersion};
	__fastcall virtual TZylSerialPort(Classes::TComponent* AOwner);
	__fastcall virtual ~TZylSerialPort(void);
	void __fastcall Open(void);
	void __fastcall Close(void);
	TCommPort __fastcall IsConnected(void);
	TCommPort __fastcall StringToCommPort(AnsiString Port);
	AnsiString __fastcall CommPortToString(const TCommPort Port);
	int __fastcall BaudRateToInt(const TBaudRate pBaudRate);
	TBaudRate __fastcall IntToBaudRate(const int Value);
	unsigned __fastcall SendString(const AnsiString str);
	void __fastcall SendStringOnNewThread(const AnsiString str);
	unsigned __fastcall SendData(void * Data, unsigned dataSize);
	unsigned __fastcall SendWord(const Word number);
	unsigned __fastcall SendByte(const Byte number);
	unsigned __fastcall SendChar(const char character);
	unsigned __fastcall SendChars(const AnsiString str);
	void __fastcall SendCharsOnNewThread(const AnsiString str);
	TCommPortSet __fastcall GetExistingCommPorts();
	void __fastcall GetExistingCommPortNames(Classes::TStrings* Strings);
	bool __fastcall SetBreak(const bool OnOff);
	bool __fastcall SetDTR(const bool OnOff);
	bool __fastcall SetRTS(const bool OnOff);
	bool __fastcall SetXonXoff(const bool OnOff);
	bool __fastcall ClearInputBuffer(void);
	bool __fastcall ClearOutputBuffer(void);
	bool __fastcall GetCTS(void);
	bool __fastcall GetDSR(void);
	bool __fastcall GetRING(void);
	bool __fastcall GetCD(void);
	
__published:
	__property TCommPort Port = {read=GetCommPort, write=SetCommPort, default=0};
	__property TBaudRate BaudRate = {read=GetBaudRate, write=SetBaudRate, default=9};
	__property TDataWidth DataWidth = {read=GetDataWidth, write=SetDataWidth, default=3};
	__property TStopBits StopBits = {read=GetStopBits, write=SetStopBits, default=0};
	__property TParityBits Parity = {read=GetParity, write=SetParity, default=0};
	__property bool EnableDTROnOpen = {read=FEnableDTROnOpen, write=SetEnableDTROnOpen, default=1};
	__property bool EnableRTSOnOpen = {read=FEnableRTSOnOpen, write=SetEnableRTSOnOpen, default=1};
	__property THwFlowControl HwFlowControl = {read=FHwFlowControl, write=SetHwFlowControl, default=0};
		
	__property TSwFlowControl SwFlowControl = {read=FSwFlowControl, write=SetSwFlowControl, default=0};
		
	__property int ReadIntervalTimeout = {read=FReadIntervalTimeout, write=FReadIntervalTimeout, default=-1
		};
	__property int ReadTotalTimeoutMultiplier = {read=FReadTotalTimeoutMultiplier, write=FReadTotalTimeoutMultiplier
		, default=0};
	__property int ReadTotalTimeoutConstant = {read=FReadTotalTimeoutConstant, write=FReadTotalTimeoutConstant
		, default=0};
	__property int WriteTotalTimeoutMultiplier = {read=FWriteTotalTimeoutMultiplier, write=FWriteTotalTimeoutMultiplier
		, default=100};
	__property int WriteTotalTimeoutConstant = {read=FWriteTotalTimeoutConstant, write=FWriteTotalTimeoutConstant
		, default=1000};
	__property unsigned InputBuffer = {read=FInputBuffer, write=SetInputBuffer, default=4096};
	__property unsigned OutputBuffer = {read=FOutputBuffer, write=SetOutputBuffer, default=4096};
	__property Classes::TThreadPriority Priority = {read=FPriority, write=SetPriority, default=3};
	__property unsigned Delay = {read=FDelay, write=FDelay, default=100};
	__property AnsiString CustomPortName = {read=FCustomPortName, write=SetCustomPortName};
	__property int CustomBaudRate = {read=FCustomBaudRate, write=SetCustomBaudRate, default=0};
	__property TSendReceiveEvent OnReceive = {read=FOnReceive, write=FOnReceive};
	__property TSendReceiveEvent OnSend = {read=FOnSend, write=FOnSend};
	__property TLineStatusEvent OnLineStatusChange = {read=FOnLineStatusChange, write=FOnLineStatusChange
		};
	__property TConnectEvent OnConnect = {read=FOnConnect, write=FOnConnect};
	__property TConnectEvent OnDisconnect = {read=FOnDisconnect, write=FOnDisconnect};
};


class DELPHICLASS TComThread;
class PASCALIMPLEMENTATION TComThread : public Classes::TThread 
{
	typedef Classes::TThread inherited;
	
private:
	TZylSerialPort* Owner;
	
protected:
	void __fastcall DoExecuteReceive(void);
	void __fastcall DoExecuteLineStatus(void);
	void __fastcall DoExecuteConnect(void);
	void __fastcall DoExecuteDisconnect(void);
	virtual void __fastcall Execute(void);
	
public:
	unsigned ComDevice;
	__fastcall TComThread(TZylSerialPort* AOwner);
	unsigned __fastcall GetPortHandle(void);
	__fastcall virtual ~TComThread(void);
};


class DELPHICLASS TSenderThread;
class PASCALIMPLEMENTATION TSenderThread : public Classes::TThread 
{
	typedef Classes::TThread inherited;
	
private:
	TZylSerialPort* Owner;
	AnsiString Buffer;
	int SendType;
	
protected:
	virtual void __fastcall Execute(void);
	
public:
	__fastcall TSenderThread(TZylSerialPort* AOwner, AnsiString ABuffer, int AType);
public:
	#pragma option push -w-inl
	/* TThread.Destroy */ inline __fastcall virtual ~TSenderThread(void) { }
	#pragma option pop
	
};


class DELPHICLASS EZylSerialPortException;
class PASCALIMPLEMENTATION EZylSerialPortException : public Sysutils::Exception 
{
	typedef Sysutils::Exception inherited;
	
public:
	#pragma option push -w-inl
	/* Exception.Create */ inline __fastcall EZylSerialPortException(const AnsiString Msg) : Sysutils::Exception(
		Msg) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmt */ inline __fastcall EZylSerialPortException(const AnsiString Msg, const System::TVarRec 
		* Args, const int Args_Size) : Sysutils::Exception(Msg, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateRes */ inline __fastcall EZylSerialPortException(int Ident)/* overload */ : Sysutils::Exception(
		Ident) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmt */ inline __fastcall EZylSerialPortException(int Ident, const System::TVarRec 
		* Args, const int Args_Size)/* overload */ : Sysutils::Exception(Ident, Args, Args_Size) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateHelp */ inline __fastcall EZylSerialPortException(const AnsiString Msg, int AHelpContext
		) : Sysutils::Exception(Msg, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateFmtHelp */ inline __fastcall EZylSerialPortException(const AnsiString Msg, const 
		System::TVarRec * Args, const int Args_Size, int AHelpContext) : Sysutils::Exception(Msg, Args, Args_Size
		, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResHelp */ inline __fastcall EZylSerialPortException(int Ident, int AHelpContext
		)/* overload */ : Sysutils::Exception(Ident, AHelpContext) { }
	#pragma option pop
	#pragma option push -w-inl
	/* Exception.CreateResFmtHelp */ inline __fastcall EZylSerialPortException(System::PResStringRec ResStringRec
		, const System::TVarRec * Args, const int Args_Size, int AHelpContext)/* overload */ : Sysutils::Exception(
		ResStringRec, Args, Args_Size, AHelpContext) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Destroy */ inline __fastcall virtual ~EZylSerialPortException(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
static const Shortint dcb_Binary = 0x1;
static const Shortint dcb_ParityCheck = 0x2;
static const Shortint dcb_OutxCtsFlow = 0x4;
static const Shortint dcb_OutxDsrFlow = 0x8;
static const Shortint dcb_DtrControlMask = 0x30;
static const Shortint dcb_DtrControlDisable = 0x0;
static const Shortint dcb_DtrControlEnable = 0x10;
static const Shortint dcb_DtrControlHandshake = 0x20;
static const Shortint dcb_DsrSensivity = 0x40;
static const Byte dcb_TXContinueOnXoff = 0x80;
static const Word dcb_OutX = 0x100;
static const Word dcb_InX = 0x200;
static const Word dcb_ErrorChar = 0x400;
static const Word dcb_NullStrip = 0x800;
static const Word dcb_RtsControlMask = 0x3000;
static const Shortint dcb_RtsControlDisable = 0x0;
static const Word dcb_RtsControlEnable = 0x1000;
static const Word dcb_RtsControlHandshake = 0x2000;
static const Word dcb_RtsControlToggle = 0x3000;
static const Word dcb_AbortOnError = 0x4000;
static const unsigned dcb_Reserveds = 0xffff8000;
#define MsgStrInvalidCombination "Invalid data-width and stop-bits combination."
#define MsgStrCannotConnect "Cannot connect to %s . %s"
#define MsgStrDemo "ZylSerialPort - Demo version by Zyl Soft."
#define MsgStrDemo2 "ZylSerialPort - Demo version runs only with Delphi or C++B"\
	"uilder IDE."
#define MsgStrIsNotOpen "%s is not open. Serial port is not connected."
#define MsgInvalidLogFile "Invalid log file name or access denied."
#define StrRegPorts "HARDWARE\\DEVICEMAP\\SERIALCOMM"
extern PACKAGE unsigned __stdcall (*_timeBeginPeriod)(unsigned period);
extern PACKAGE unsigned __stdcall (*_timeEndPeriod)(unsigned period);
extern PACKAGE void __fastcall Register(void);
extern PACKAGE void * __fastcall LinkAPI(const AnsiString module, const AnsiString functionname);

}	/* namespace Zylserialport */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Zylserialport;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// ZylSerialPort
