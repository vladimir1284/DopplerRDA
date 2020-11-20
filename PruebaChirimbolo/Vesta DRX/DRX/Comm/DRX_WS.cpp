#include <stdio.h>
#include <vcl.h>
#pragma hdrstop

#if !defined(__DRX_WS_h__)
#include "DRX_WS.h"
#include "CommonObjs.h"
#include "PackageManager.h"
#include "Site.h"
#include "IntegratedData.h"
#include "ObsManager.h"
#endif

// ************************************************************************ //
//  TDRX_WSImpl implements interface IDRX_WS
// ************************************************************************ //
class TDRX_WSImpl : public TInvokableClass, public IDRX_WS
{
public:
	bool Login(String UserName, String Password);
	bool Logout();
	int Ping(int code);

	void StartDataFlow();
	void StopDataFlow();

	TDRX_Parameters* GetParameters();
	bool GetGathering();

	void AcquirePPI(int Speed, int Elevation);
	void AcquireRHI(int Speed, int Azimuth, int Start, int Final);

	void Set_Filter(bool Filter, TDataFilter* FilterInfo);

public:
  HRESULT STDMETHODCALLTYPE QueryInterface(const GUID& IID, void **Obj)
                        { return GetInterface(IID, Obj) ? S_OK : E_NOINTERFACE; }
  ULONG STDMETHODCALLTYPE AddRef() { return TInvokableClass::_AddRef();  }
  ULONG STDMETHODCALLTYPE Release() { return TInvokableClass::_Release();  }
};

bool TDRX_WSImpl::Login(String UserName, String Password){
	bool result = false;
	if((UserName == "control") && (Password == "txrx")){
		result = true;
		TDRX_AuthHeader* AuthHeader = new TDRX_AuthHeader();
		AuthHeader->UserName = UserName;
		AuthHeader->Token = "token";

		ISOAPHeaders* Headers = (ISOAPHeaders*)this;
		Headers->Send(AuthHeader);
	}

	return result;
}

bool TDRX_WSImpl::Logout(){
	return true;
}

int TDRX_WSImpl::Ping(int code){
	return code + 2011;
}

void TDRX_WSImpl::StartDataFlow(){
	thePackageManager->StartDataFlow();
}

void TDRX_WSImpl::StopDataFlow(){
	thePackageManager->StopDataFlow();
}

TDRX_Parameters* TDRX_WSImpl::GetParameters(){
	return ThisSite->GetParameters();
}

bool TDRX_WSImpl::GetGathering(){
  return ThisSite->TheRadar->Gathering;
}

void TDRX_WSImpl::AcquirePPI(int Speed, int Elevation){
	theObservationManager->AcquirePPI(Speed, Elevation);
}

void TDRX_WSImpl::AcquireRHI(int Speed, int Azimuth, int Start, int Final){
	theObservationManager->AcquireRHI(Speed, Azimuth, Start, Final);
}

void TDRX_WSImpl::Set_Filter(bool Filter, TDataFilter* FilterInfo){
	TheProcessingThread->SetFilter(FilterInfo, Filter);
}

static void __fastcall DRX_WSFactory(System::TObject* &obj)
{
  static _di_IDRX_WS iInstance;
  static TDRX_WSImpl *instance = 0;
  if (!instance)
  {
	instance = new TDRX_WSImpl();
	instance->GetInterface(iInstance);
  }
  obj = instance;
}

static void RegTypes()
{
  InvRegistry()->RegisterInterface(__delphirtti(IDRX_WS));
  InvRegistry()->RegisterInvokableClass(__classid(TDRX_WSImpl), DRX_WSFactory);
}
#pragma startup RegTypes 32
