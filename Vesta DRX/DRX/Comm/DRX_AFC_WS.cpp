#include <stdio.h>
#include <vcl.h>
#pragma hdrstop

#if !defined(__DRX_AFC_WS_h__)
#include "DRX_AFC_WS.h"
#include "Site.h"
#include "AFCprocessor.h"
#include "PackageManager.h"
#endif

// ************************************************************************ //
//  TDRX_AFC_WSImpl implements interface IDRX_AFC_WS
// ************************************************************************ //
class TDRX_AFC_WSImpl : public TInvokableClass, public IDRX_AFC_WS
{
public:
	bool Tuned();

	void Stalo_Init();
	void Set_Stalo_Output(bool state);
	bool Get_Stalo_Output();
	bool Get_Stalo_Ready();

	INT64 Get_Stalo_Frequency();
	INT64 Get_RealStalo_Frequency();
	void  Set_Stalo_Frequency(INT64 value);

	double Get_Stalo_Power();
	void   Set_Stalo_Power(double value);

	double Get_Stalo_Temperature();
	bool   Get_Stalo_RF_Output();

	void   Set_AFCChangesInhibited(bool value);
	bool   Get_AFCChangesInhibited();
	bool   Get_Settling();

	INT64  Get_NCOFrequency();
	void   Set_NCOFrequency(INT64 value);

	double Get_Tx_Pulse_Power();
	INT64  Get_IF_Frequency();
	INT64  Get_Tx_Frequency();
	void   ResetScan();
public:
  HRESULT STDMETHODCALLTYPE QueryInterface(const GUID& IID, void **Obj)
						{ return GetInterface(IID, Obj) ? S_OK : E_NOINTERFACE; }
  ULONG STDMETHODCALLTYPE AddRef() { return TInvokableClass::_AddRef();  }
  ULONG STDMETHODCALLTYPE Release() { return TInvokableClass::_Release();  }
};

void TDRX_AFC_WSImpl::Set_AFCChangesInhibited(bool value){
	ThisSite->TheRadar->AFCChangesInhibited = value;
}

bool TDRX_AFC_WSImpl::Get_Settling(){
	return ThisSite->TheRadar->StaloChanged();
}

INT64 TDRX_AFC_WSImpl::Get_NCOFrequency(){
	return ThisSite->TheRadar->GetNCOFrequency();
}

void TDRX_AFC_WSImpl::Set_NCOFrequency(INT64 value){
	ThisSite->TheRadar->SetNCOFrequency(value);
}

void   TDRX_AFC_WSImpl::Set_Stalo_Output(bool state){
	ThisSite->TheRadar->SetStaloOutput(state);
}

bool   TDRX_AFC_WSImpl::Get_Stalo_Output(){
	return ThisSite->TheRadar->GetSTALOOutput();
}

bool   TDRX_AFC_WSImpl::Get_Stalo_Ready(){
	return ThisSite->TheRadar->Stalo->Ready;
}

INT64 TDRX_AFC_WSImpl::Get_Stalo_Frequency(){
	return ThisSite->TheRadar->GetSTALOFrequency();
}

INT64 TDRX_AFC_WSImpl::Get_RealStalo_Frequency(){
	return ThisSite->TheRadar->Stalo->Frequency;
}

void   TDRX_AFC_WSImpl::Set_Stalo_Frequency(INT64 value){
	ThisSite->TheRadar->SetStaloFrequency(value);
	if(ThisSite->TheRadar->AFCChangesInhibited){
		Sleep(500);
		int time = GetTickCount();
		while (ThisSite->TheRadar->StaloChanged() && (GetTickCount() - time < 2000)) Sleep(50);
		if(!ThisSite->TheRadar->StaloChanged()){
			Sleep(500);
			//ThisSite->TheRadar->SetNCOFrequency(TheACFProcessingThread->GetIFFrequencyEstimate());
		}
	}
}

double TDRX_AFC_WSImpl::Get_Stalo_Power(){
	return ThisSite->TheRadar->Stalo->Power;
}

void   TDRX_AFC_WSImpl::Set_Stalo_Power(double value){
	ThisSite->TheRadar->SetStaloPower(value);
}

double TDRX_AFC_WSImpl::Get_Stalo_Temperature(){
	return ThisSite->TheRadar->Stalo->Temperature;
}

double TDRX_AFC_WSImpl::Get_Tx_Pulse_Power(){
  return TheACFProcessingThread->GetTxPulsePowerEstimate();
}

INT64 TDRX_AFC_WSImpl::Get_IF_Frequency(){
  return TheACFProcessingThread->GetIFFrequencyEstimate();
}

INT64 TDRX_AFC_WSImpl::Get_Tx_Frequency(){
  return TheACFProcessingThread->GetTxFrequencyEstimate();
}

bool TDRX_AFC_WSImpl::Get_Stalo_RF_Output(){
	return ThisSite->TheRadar->GetSTALOOutput();
}

void TDRX_AFC_WSImpl::Stalo_Init(){
	ThisSite->TheRadar->NeedInitSTALO();
}

bool TDRX_AFC_WSImpl::Get_AFCChangesInhibited(){
	return ThisSite->TheRadar->AFCChangesInhibited;
}

bool TDRX_AFC_WSImpl::Tuned(){
	return TheACFProcessingThread->GetDataReady();
}

void TDRX_AFC_WSImpl::ResetScan(){
	TheACFProcessingThread->ResetScan();
}

static void __fastcall DRX_AFC_WSFactory(System::TObject* &obj)
{
  static _di_IDRX_AFC_WS iInstance;
  static TDRX_AFC_WSImpl *instance = 0;
  if (!instance)
  {
	instance = new TDRX_AFC_WSImpl();
	instance->GetInterface(iInstance);
  }
  obj = instance;
}

static void RegTypes()
{
  InvRegistry()->RegisterInterface(__delphirtti(IDRX_AFC_WS));
  InvRegistry()->RegisterInvokableClass(__classid(TDRX_AFC_WSImpl), DRX_AFC_WSFactory);
}

#pragma startup RegTypes 32

