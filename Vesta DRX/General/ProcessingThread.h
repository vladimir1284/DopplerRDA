//---------------------------------------------------------------------------

#ifndef ProcessingThreadH
#define ProcessingThreadH

#include "DataParameters.h"
#include "IntegratedData.h"
#include "RawIQRead.h"
#include "config.h"
//---------------------------------------------------------------------------

const int DATABUFFERS = 8;
const int NDATA       = RAW_DATA_LENGTH_SP;

typedef void __fastcall (__closure *TNewIQDataEvent)(System::TObject* Sender, RawPulseData RawPulseDataIn, RawPulseData PulseDataIn);
typedef void __fastcall (__closure *TNewSectorDataEvent)(System::TObject* Sender, short Az, short El, short rays, short mode, short ndata, float *Power, float *dBT, float *dBZ, float *V, float *W, float *SQI, float *LOG, float *SIG, float *CCOR);

//---------------------------------------------------------------------------
class ProcessingThread : public TThread
{
private:
	TNewSectorDataEvent FOnNewSectorData;
	TNewIQDataEvent FOnNewIQData;

public:
   typedef struct HalfSectorData{
    	short PRF_Change;
		short RayCount;
		short DataMode;
		short NData;
		int Azimuth;
		int Elevation;
		double raw_mag[NDATA];
		double T0[NDATA];
		double R0[NDATA];
		double R1[NDATA * 2];
		double R2[NDATA * 2];
	  } HalfSectorData;

	__property TNewSectorDataEvent  OnNewSectorData  = {read=FOnNewSectorData,  write=FOnNewSectorData};
	__property TNewIQDataEvent      OnNewIQData      = {read=FOnNewIQData,      write=FOnNewIQData};

private:
		HalfSectorData HalfSector[2];
		int    count;
		int    CurrentSector;
		bool   EnoughRays;
		int    FilterStart;

		float dBZ  [NDATA];
		float dBT  [NDATA];
		float V    [NDATA];
		float W    [NDATA];
		float SQI  [NDATA];
		float LOG  [NDATA];
		float SIG  [NDATA];
		float CCOR [NDATA];

		float  raw_power[NDATA];
		double raw_i    [NDATA];
		double raw_q    [NDATA];

		int    HighFreqIndex;
		int    LowFreqIndex;

		RawPulseData* PulseDataIn;
		RawPulseData* RawPulseDataIn;
		RawIQRead*    TheRawIQ;
		TDataFilter*  FilterData;
		bool          Filtering;

		void   InitHalfSector(int Sector);

		double GetVConvFactor(int mode, int FreqIndex);
		double GetVConvFactor(int mode);
		double GetMaxSpeed(int mode);
		double Get_N_Factor(int mode);

		void __fastcall PhaseCorrect(RawPulseData *);
		void __fastcall IntegrateData(int StorageSector);
		void __fastcall RemoveSpeckles(int cell_size, int cell_count, float* data);

		double ConvertValueDB(double value, int mode);

protected:
		void __fastcall Execute();
public:
		__fastcall ProcessingThread(bool CreateSuspended);

		void   SetFilter(TDataFilter* FilterInfo, bool Status);
		void   ResetFilter();

		__property TDataFilter* CurrentFilter  = {read=FilterData};
		__property bool FilterActive           = {read=Filtering};

};

extern ProcessingThread* TheProcessingThread;
//---------------------------------------------------------------------------
#endif
