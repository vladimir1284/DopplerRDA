#ifndef RawIQReadH
#define RawIQReadH

//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <syncobjs.hpp>
#include <string.h>
//---------------------------------------------------------------------------

#include "FIFOInterface.h"
#include "DataParameters.h"

//---------------------------------------------------------------------------
class RawIQRead : public TThread
{

static const unsigned int BIGBUFFERSIZE = SPSize * NREAD * NUMBEROFBUFFERS;
//static const unsigned int BIGBUFFERSIZE = 3740 * NREAD * NUMBEROFBUFFERS;

private:
  FIFOInterface *IQReadInterface;

  int CurrentOutBuffer;
  short *InputBuffer[NUMBEROFBUFFERS];
  short *FlatArray;
  short *myDump;

  int BadPulses;
  int CurrentProcBuffer;
  int Counter;
  unsigned int SequenceNumber;
  int CurrentOutputCount;
  unsigned int LastPulse;
  bool OverflowError;
  TCriticalSection * fLock;

  RawPulseData *TheRawIQData;

  bool InputBufferFull[NUMBEROFBUFFERS];
  bool OutputBufferFull[NRAWPULSESOUT];

  bool __fastcall PartitionData();

protected:
      void __fastcall Execute();
public:
      __fastcall RawIQRead(bool CreateSuspended);
	  void GetPulseData(RawPulseData*);
	  int  GetBadPulses();
	  void ResetBadPulses();
	  bool GetOverflowError();
	  void ResetBuffers();
};

//---------------------------------------------------------------------------
#endif