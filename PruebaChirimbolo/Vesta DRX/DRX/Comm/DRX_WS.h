#ifndef   DRX_WSH
#define   DRX_WSH

#include <System.hpp>
#include <InvokeRegistry.hpp>
#include <XSBuiltIns.hpp>
#include <Types.hpp>
#include "config.h"
#include "ObsManager.h"
#include "ProcessingThread.h"

__interface INTERFACE_UUID("{C558094B-F4B9-4DB6-8845-59322FF6C584}") IDRX_WS : public IInvokable
{
public:
	virtual bool Login(String UserName, String Password) = 0;
	virtual bool Logout() = 0;

	virtual int Ping(int code) = 0;

	virtual void StartDataFlow() = 0;
	virtual void StopDataFlow() = 0;
	virtual TDRX_Parameters* GetParameters() = 0;


	virtual bool GetGathering() = 0;
	virtual void AcquirePPI(int Speed, int Elevation) = 0;
	virtual void AcquireRHI(int Speed, int Azimuth, int Start, int Final) = 0;

	virtual void Set_Filter(bool Filter, TDataFilter* FilterInfo) = 0;
};
typedef DelphiInterface<IDRX_WS> _di_IDRX_WS;

#endif // DRX_WSH

extern ObservationManager* theObservationManager;
extern ProcessingThread*   TheProcessingThread;

//---------------------------------------------------------------------------


