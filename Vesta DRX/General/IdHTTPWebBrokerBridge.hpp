// CodeGear C++Builder
// Copyright (c) 1995, 2008 by CodeGear
// All rights reserved

// (DO NOT EDIT: machine generated header) 'Idhttpwebbrokerbridge.pas' rev: 20.00

#ifndef IdhttpwebbrokerbridgeHPP
#define IdhttpwebbrokerbridgeHPP

#pragma delphiheader begin
#pragma option push
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member functions
#pragma pack(push,8)
#include <System.hpp>	// Pascal unit
#include <Sysinit.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Httpapp.hpp>	// Pascal unit
#include <Idcontext.hpp>	// Pascal unit
#include <Idcustomhttpserver.hpp>	// Pascal unit
#include <Idexception.hpp>	// Pascal unit
#include <Idtcpserver.hpp>	// Pascal unit
#include <Idiohandlersocket.hpp>	// Pascal unit
#include <Webbroker.hpp>	// Pascal unit
#include <Sysutils.hpp>	// Pascal unit
#include <Idcustomtcpserver.hpp>	// Pascal unit
#include <Idcomponent.hpp>	// Pascal unit
#include <Idbasecomponent.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Idhttpwebbrokerbridge
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS EWBBException;
class PASCALIMPLEMENTATION EWBBException : public Idexception::EIdException
{
	typedef Idexception::EIdException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBException(const System::UnicodeString AMsg)/* overload */ : Idexception::EIdException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBException(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : Idexception::EIdException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBException(int Ident)/* overload */ : Idexception::EIdException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBException(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : Idexception::EIdException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBException(const System::UnicodeString Msg, int AHelpContext) : Idexception::EIdException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBException(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : Idexception::EIdException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBException(int Ident, int AHelpContext)/* overload */ : Idexception::EIdException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBException(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : Idexception::EIdException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBException(void) { }
	
};


class DELPHICLASS EWBBInvalidIdxGetDateVariable;
class PASCALIMPLEMENTATION EWBBInvalidIdxGetDateVariable : public EWBBException
{
	typedef EWBBException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBInvalidIdxGetDateVariable(const System::UnicodeString AMsg)/* overload */ : EWBBException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBInvalidIdxGetDateVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : EWBBException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBInvalidIdxGetDateVariable(int Ident)/* overload */ : EWBBException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBInvalidIdxGetDateVariable(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : EWBBException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBInvalidIdxGetDateVariable(const System::UnicodeString Msg, int AHelpContext) : EWBBException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBInvalidIdxGetDateVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : EWBBException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBInvalidIdxGetDateVariable(int Ident, int AHelpContext)/* overload */ : EWBBException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBInvalidIdxGetDateVariable(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : EWBBException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBInvalidIdxGetDateVariable(void) { }
	
};


class DELPHICLASS EWBBInvalidIdxSetDateVariable;
class PASCALIMPLEMENTATION EWBBInvalidIdxSetDateVariable : public EWBBException
{
	typedef EWBBException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBInvalidIdxSetDateVariable(const System::UnicodeString AMsg)/* overload */ : EWBBException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBInvalidIdxSetDateVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : EWBBException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBInvalidIdxSetDateVariable(int Ident)/* overload */ : EWBBException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBInvalidIdxSetDateVariable(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : EWBBException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBInvalidIdxSetDateVariable(const System::UnicodeString Msg, int AHelpContext) : EWBBException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBInvalidIdxSetDateVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : EWBBException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBInvalidIdxSetDateVariable(int Ident, int AHelpContext)/* overload */ : EWBBException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBInvalidIdxSetDateVariable(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : EWBBException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBInvalidIdxSetDateVariable(void) { }
	
};


class DELPHICLASS EWBBInvalidIdxGetIntVariable;
class PASCALIMPLEMENTATION EWBBInvalidIdxGetIntVariable : public EWBBException
{
	typedef EWBBException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBInvalidIdxGetIntVariable(const System::UnicodeString AMsg)/* overload */ : EWBBException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBInvalidIdxGetIntVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : EWBBException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBInvalidIdxGetIntVariable(int Ident)/* overload */ : EWBBException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBInvalidIdxGetIntVariable(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : EWBBException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBInvalidIdxGetIntVariable(const System::UnicodeString Msg, int AHelpContext) : EWBBException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBInvalidIdxGetIntVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : EWBBException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBInvalidIdxGetIntVariable(int Ident, int AHelpContext)/* overload */ : EWBBException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBInvalidIdxGetIntVariable(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : EWBBException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBInvalidIdxGetIntVariable(void) { }
	
};


class DELPHICLASS EWBBInvalidIdxSetIntVariable;
class PASCALIMPLEMENTATION EWBBInvalidIdxSetIntVariable : public EWBBException
{
	typedef EWBBException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBInvalidIdxSetIntVariable(const System::UnicodeString AMsg)/* overload */ : EWBBException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBInvalidIdxSetIntVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : EWBBException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBInvalidIdxSetIntVariable(int Ident)/* overload */ : EWBBException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBInvalidIdxSetIntVariable(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : EWBBException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBInvalidIdxSetIntVariable(const System::UnicodeString Msg, int AHelpContext) : EWBBException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBInvalidIdxSetIntVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : EWBBException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBInvalidIdxSetIntVariable(int Ident, int AHelpContext)/* overload */ : EWBBException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBInvalidIdxSetIntVariable(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : EWBBException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBInvalidIdxSetIntVariable(void) { }
	
};


class DELPHICLASS EWBBInvalidIdxGetStrVariable;
class PASCALIMPLEMENTATION EWBBInvalidIdxGetStrVariable : public EWBBException
{
	typedef EWBBException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBInvalidIdxGetStrVariable(const System::UnicodeString AMsg)/* overload */ : EWBBException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBInvalidIdxGetStrVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : EWBBException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBInvalidIdxGetStrVariable(int Ident)/* overload */ : EWBBException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBInvalidIdxGetStrVariable(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : EWBBException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBInvalidIdxGetStrVariable(const System::UnicodeString Msg, int AHelpContext) : EWBBException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBInvalidIdxGetStrVariable(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : EWBBException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBInvalidIdxGetStrVariable(int Ident, int AHelpContext)/* overload */ : EWBBException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBInvalidIdxGetStrVariable(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : EWBBException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBInvalidIdxGetStrVariable(void) { }
	
};


class DELPHICLASS EWBBInvalidIdxSetStringVar;
class PASCALIMPLEMENTATION EWBBInvalidIdxSetStringVar : public EWBBException
{
	typedef EWBBException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBInvalidIdxSetStringVar(const System::UnicodeString AMsg)/* overload */ : EWBBException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBInvalidIdxSetStringVar(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : EWBBException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBInvalidIdxSetStringVar(int Ident)/* overload */ : EWBBException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBInvalidIdxSetStringVar(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : EWBBException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBInvalidIdxSetStringVar(const System::UnicodeString Msg, int AHelpContext) : EWBBException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBInvalidIdxSetStringVar(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : EWBBException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBInvalidIdxSetStringVar(int Ident, int AHelpContext)/* overload */ : EWBBException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBInvalidIdxSetStringVar(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : EWBBException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBInvalidIdxSetStringVar(void) { }
	
};


class DELPHICLASS EWBBInvalidStringVar;
class PASCALIMPLEMENTATION EWBBInvalidStringVar : public EWBBException
{
	typedef EWBBException inherited;
	
public:
	/* EIdException.Create */ inline __fastcall virtual EWBBInvalidStringVar(const System::UnicodeString AMsg)/* overload */ : EWBBException(AMsg) { }
	
public:
	/* Exception.CreateFmt */ inline __fastcall EWBBInvalidStringVar(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size) : EWBBException(Msg, Args, Args_Size) { }
	/* Exception.CreateRes */ inline __fastcall EWBBInvalidStringVar(int Ident)/* overload */ : EWBBException(Ident) { }
	/* Exception.CreateResFmt */ inline __fastcall EWBBInvalidStringVar(int Ident, System::TVarRec const *Args, const int Args_Size)/* overload */ : EWBBException(Ident, Args, Args_Size) { }
	/* Exception.CreateHelp */ inline __fastcall EWBBInvalidStringVar(const System::UnicodeString Msg, int AHelpContext) : EWBBException(Msg, AHelpContext) { }
	/* Exception.CreateFmtHelp */ inline __fastcall EWBBInvalidStringVar(const System::UnicodeString Msg, System::TVarRec const *Args, const int Args_Size, int AHelpContext) : EWBBException(Msg, Args, Args_Size, AHelpContext) { }
	/* Exception.CreateResHelp */ inline __fastcall EWBBInvalidStringVar(int Ident, int AHelpContext)/* overload */ : EWBBException(Ident, AHelpContext) { }
	/* Exception.CreateResFmtHelp */ inline __fastcall EWBBInvalidStringVar(System::PResStringRec ResStringRec, System::TVarRec const *Args, const int Args_Size, int AHelpContext)/* overload */ : EWBBException(ResStringRec, Args, Args_Size, AHelpContext) { }
	/* Exception.Destroy */ inline __fastcall virtual ~EWBBInvalidStringVar(void) { }
	
};


class DELPHICLASS TIdHTTPAppRequest;
class PASCALIMPLEMENTATION TIdHTTPAppRequest : public Httpapp::TWebRequest
{
	typedef Httpapp::TWebRequest inherited;
	
protected:
	Idcustomhttpserver::TIdHTTPRequestInfo* FRequestInfo;
	Idcustomhttpserver::TIdHTTPResponseInfo* FResponseInfo;
	Idcontext::TIdContext* FThread;
	int FClientCursor;
	virtual System::TDateTime __fastcall GetDateVariable(int Index);
	virtual int __fastcall GetIntegerVariable(int Index);
	virtual System::AnsiString __fastcall GetStringVariable(int Index);
	
public:
	__fastcall TIdHTTPAppRequest(Idcontext::TIdContext* AThread, Idcustomhttpserver::TIdHTTPRequestInfo* ARequestInfo, Idcustomhttpserver::TIdHTTPResponseInfo* AResponseInfo);
	virtual System::AnsiString __fastcall GetFieldByName(const System::AnsiString Name);
	virtual int __fastcall ReadClient(void *Buffer, int Count);
	virtual System::AnsiString __fastcall ReadString(int Count);
	virtual System::UnicodeString __fastcall TranslateURI(const System::UnicodeString URI);
	virtual int __fastcall WriteClient(void *ABuffer, int ACount);
	virtual bool __fastcall WriteHeaders(int StatusCode, const System::AnsiString ReasonString, const System::AnsiString Headers);
	virtual bool __fastcall WriteString(const System::AnsiString AString);
public:
	/* TWebRequest.Destroy */ inline __fastcall virtual ~TIdHTTPAppRequest(void) { }
	
};


class DELPHICLASS TIdHTTPAppResponse;
class PASCALIMPLEMENTATION TIdHTTPAppResponse : public Httpapp::TWebResponse
{
	typedef Httpapp::TWebResponse inherited;
	
protected:
	System::UnicodeString FContent;
	Idcustomhttpserver::TIdHTTPRequestInfo* FRequestInfo;
	Idcustomhttpserver::TIdHTTPResponseInfo* FResponseInfo;
	bool FSent;
	Idcontext::TIdContext* FThread;
	virtual System::AnsiString __fastcall GetContent();
	virtual System::TDateTime __fastcall GetDateVariable(int Index);
	virtual int __fastcall GetStatusCode(void);
	virtual int __fastcall GetIntegerVariable(int Index);
	virtual System::UnicodeString __fastcall GetLogMessage();
	virtual System::AnsiString __fastcall GetStringVariable(int Index);
	virtual void __fastcall SetContent(const System::AnsiString AValue);
	virtual void __fastcall SetContentStream(Classes::TStream* AValue);
	virtual void __fastcall SetStatusCode(int AValue);
	virtual void __fastcall SetStringVariable(int Index, const System::AnsiString Value);
	virtual void __fastcall SetDateVariable(int Index, const System::TDateTime Value);
	virtual void __fastcall SetIntegerVariable(int Index, int Value);
	virtual void __fastcall SetLogMessage(const System::UnicodeString Value);
	void __fastcall MoveCookiesAndCustomHeaders(void);
	
public:
	__fastcall TIdHTTPAppResponse(Httpapp::TWebRequest* AHTTPRequest, Idcontext::TIdContext* AThread, Idcustomhttpserver::TIdHTTPRequestInfo* ARequestInfo, Idcustomhttpserver::TIdHTTPResponseInfo* AResponseInfo);
	virtual void __fastcall SendRedirect(const System::AnsiString URI);
	virtual void __fastcall SendResponse(void);
	virtual void __fastcall SendStream(Classes::TStream* AStream);
	virtual bool __fastcall Sent(void);
public:
	/* TWebResponse.Destroy */ inline __fastcall virtual ~TIdHTTPAppResponse(void) { }
	
};


class DELPHICLASS TIdHTTPWebBrokerBridge;
class PASCALIMPLEMENTATION TIdHTTPWebBrokerBridge : public Idcustomhttpserver::TIdCustomHTTPServer
{
	typedef Idcustomhttpserver::TIdCustomHTTPServer inherited;
	
protected:
	Classes::TComponentClass FWebModuleClass;
	virtual void __fastcall DoCommandGet(Idcontext::TIdContext* AThread, Idcustomhttpserver::TIdHTTPRequestInfo* ARequestInfo, Idcustomhttpserver::TIdHTTPResponseInfo* AResponseInfo);
	virtual void __fastcall InitComponent(void);
	
public:
	void __fastcall RegisterWebModuleClass(Classes::TComponentClass AClass);
public:
	/* TIdCustomHTTPServer.Destroy */ inline __fastcall virtual ~TIdHTTPWebBrokerBridge(void) { }
	
public:
	/* TIdBaseComponent.Create */ inline __fastcall TIdHTTPWebBrokerBridge(Classes::TComponent* AOwner)/* overload */ : Idcustomhttpserver::TIdCustomHTTPServer(AOwner) { }
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Idhttpwebbrokerbridge */
using namespace Idhttpwebbrokerbridge;
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// IdhttpwebbrokerbridgeHPP
