//---------------------------------------------------------------------------
#ifndef RadarH
#define RadarH

#include <syncobjs.hpp>
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
#include <vcl.h>

#include "QuickSyn.h"
#include "FIFOinterface.h"
#include "config.h"
#include "ProcessingThread.h"

typedef void __fastcall (__closure *TGatheringErrorEvent)(String error);

//---------------------------------------------------------------------------
class Radar : public TThread
{
	public:
		QuickSyn* Stalo;

		//DIO
		void ClearDigitalOutputs();

		//Synchro
		void setRequestedPulseMode(int value);
		void setRequestedPRF_Rate(int value);
		void setRequestedSectorMode(int value);
		void setRequestedOutputMode(bool value);

		int  getPRF_Rate();
		int  getSectorMode();
		bool getOutputMode();

		void DisableSynch();
		void EnableSynch();
		void UpdateSynch();
		bool SyncChanging();
		void InitSTALO();
		void InitSynch();
		void NeedInitSTALO();

	public:
		__fastcall Radar(bool CreateSuspended);

		int  GetCurrentPulseMode();
		int  GetCurrentPRF_Rate();

		bool SetStaloFrequency(INT64 freq);
		bool SetStaloPower(double power);
		bool SetStaloOutput(bool output);
		void SetNCOFrequency(INT64 freq);

		bool  GetSTALOOutput();
		INT64 GetSTALOFrequency();
		INT64 GetNCOFrequency();

		bool StaloChanged();
		bool SyncChanged();
	protected:
		void __fastcall Execute();

	private:
		TGatheringErrorEvent FOnGatheringError;

		FIFOInterface *NCOInterface;
		FIFOInterface *DIOInterface;

		int    RequestedPulseMode;
		int    RequestedPRF_Rate;
		int    RequestedSectorMode;
		bool   RequestedOutputMode;
		bool   RequestedSectorMarkDirection;

		int    CurrentPulseMode;
		int    CurrentPRF_Rate;
		int    CurrentSectorMode;
		bool   CurrentOutputMode;

		int    CurrentIntAzim;
		int    CurrentIntElev;
		INT64  TxFrequency;
		bool   fAFCChangesInhibited;
		INT64  RequestedNCOFrequency;
		INT64  RequestedSTALOFrequency;
		double RequestedSTALOPower;
		bool   RequestedSTALOOutput;
		INT64  CurrentSTALOFrequency;
		bool   CurrentSTALOOutput;
		bool   FreqUpdateNeeded;
		bool   PowerUpdateNeeded;
		bool   OutputUpdateNeeded;
		bool   UpdatePulseModeNeeded;
		bool   DelayPulse;
		int    UpdatePulseMode;
		bool   ModeUpdateNeeded;
		bool   SettlingPower;
		bool   SettlingOutput;
		bool   SettlingFrequency;
		bool   fGathering;
		String fLastError;
		bool   fInitializeSTALO;
		bool   fSyncUpdate;
		DWORD  fStaloUpdateTime;

		//Antenna
		void SetCurrentIntAzim(int Value);
		void SetCurrentIntElev(int Value);

		int  GetCurrentIntAzim();
		int  GetCurrentIntElev();
		bool GetAFCChangesInhibited();
		void SetAFCChangesInhibited(bool value);
		bool GetGathering();
		void SetGathering(bool value);
		void SetLastError(String error);
		String GetLastError();
		void   SetSyncWord();

private:
		bool OutputNCOFrequencyDemand(INT64 MeasuredIF);

		void __fastcall ConnectSTALO();

		__fastcall SetupInterface();
public:
		__property int  CurrentAzimut    = { read= GetCurrentIntAzim, write = SetCurrentIntAzim};
		__property int  CurrentElevation = { read= GetCurrentIntElev, write = SetCurrentIntElev};
		__property bool AFCChangesInhibited = { read= GetAFCChangesInhibited, write = SetAFCChangesInhibited};
		__property bool Gathering = { read= GetGathering, write = SetGathering};
		__property String LastError = { read= GetLastError, write = SetLastError};

		__property int  PulseMode   = { read= CurrentPulseMode};
		__property int  PRF_Rate    = { read= CurrentPRF_Rate};
		__property bool InitializatingSTALO = { read= fInitializeSTALO};

	__property TGatheringErrorEvent OnGatheringError = {read=FOnGatheringError, write=FOnGatheringError};
};

extern ProcessingThread* TheProcessingThread;

//---------------------------------------------------------------------------
#endif