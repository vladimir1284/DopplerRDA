#ifndef IntegratedDataH
#define IntegratedDataH
#include "DataParameters.h"
#include <math.h>
#include "time.h"
class IntegratedData
{

public:

   typedef struct SectorData{
		short *Azimuth;
		short *Elevation;
		float *dBZData;
		float *dBTData;
		float *VData;
		float *WData;
   }SectorData;

   SectorData TheRawStuff;

   short  BinLength;
   short  DataMode;
   short  NRays;
   short  NBins;
   time_t StartDateTime;
   time_t StopDateTime;
   short  RequestedElev;
   short  RequestedSpeed;

   IntegratedData(short Sectors, short Cells, short ReqElev, short ReqSpeed, short Mode);
   ~IntegratedData();
};

#endif           //RawDataH