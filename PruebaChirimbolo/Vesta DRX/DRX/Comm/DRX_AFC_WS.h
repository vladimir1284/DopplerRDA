#ifndef   DRX_AFC_WSH
#define   DRX_AFC_WSH

#include <System.hpp>
#include "DataParameters.h"

__interface INTERFACE_UUID("{9509E05F-25C4-42D9-9B09-86E8D455F395}") IDRX_AFC_WS : public IInvokable
{
public:
	//stalo
	virtual void Stalo_Init() = 0;

	virtual void Set_Stalo_Output(bool state) = 0;
	virtual bool Get_Stalo_Output() = 0;
	virtual bool Get_Stalo_Ready() = 0;
	virtual bool Tuned() = 0;

	virtual INT64  Get_Stalo_Frequency() = 0;
	virtual INT64  Get_RealStalo_Frequency() = 0;
	virtual void   Set_Stalo_Frequency(INT64 value) = 0;

	virtual double Get_Stalo_Power() = 0;
	virtual void   Set_Stalo_Power(double value) = 0;

	virtual double Get_Stalo_Temperature() = 0;
	virtual bool   Get_Stalo_RF_Output() = 0;

	//afc
	virtual void ResetScan() = 0;
	virtual void Set_AFCChangesInhibited(bool value) = 0;
	virtual bool Get_AFCChangesInhibited() = 0;
	virtual bool Get_Settling() = 0;

	virtual INT64 Get_NCOFrequency() = 0;
	virtual void  Set_NCOFrequency(INT64 value) = 0;

	virtual double Get_Tx_Pulse_Power() = 0;
	virtual INT64  Get_IF_Frequency() = 0;
	virtual INT64  Get_Tx_Frequency() = 0;
};
typedef DelphiInterface<IDRX_AFC_WS> _di_IDRX_AFC_WS;


#endif // DRX_AFC_WSH
//---------------------------------------------------------------------------

