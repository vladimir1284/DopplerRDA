 #define Hunt
//---------------------------------------------------------------------------
#include <vcl.h>
#include <syncobjs.hpp>

#include "stdio.h"

#include "AFCRead.h"
#include "FIFOinterface.h"

#pragma hdrstop

#pragma package(smart_init)

AFCRead *ReadThread;

__fastcall AFCRead::AFCRead(bool CreateSuspended): TThread(CreateSuspended)
{
  TheRawFifo   = new FIFOInterface(FifoC);
  FirstBuffer  = NULL;
  SecondBuffer = NULL;
  DumpBuffer   = NULL;
  BufferSize   = NUMBUFFERS * SAMPLES_PER_IP_CHAN * sizeof(HE_INT32);

  AFCFIFOLock = new TCriticalSection();

#ifdef Hunt
  if (HeAlloc(&FirstBuffer, BufferSize) != HE_OK) Error(HeGetLastOsError(FirstBuffer));
  if (HeLock(FirstBuffer, &DataIn[0]) != HE_OK) Error(HeGetLastOsError(FirstBuffer));

  if (HeAlloc(&SecondBuffer, BufferSize) != HE_OK) Error(HeGetLastOsError(SecondBuffer));
  if (HeLock(SecondBuffer, &DataIn[1]) != HE_OK) Error(HeGetLastOsError(SecondBuffer));

  if (HeAlloc(&DumpBuffer, BufferSize) != HE_OK) Error(HeGetLastOsError(DumpBuffer));
  if (HeLock(DumpBuffer, &Dump) != HE_OK) Error(HeGetLastOsError(DumpBuffer));
#endif

  BufferFull[0] = false;
  BufferFull[1] = false;
  this->FreeOnTerminate = true;
}

void AFCRead::ReleaseBuffers()
{
#ifdef Hunt
  if (HeUnlock(FirstBuffer) == HE_OK)
	HeFree(&FirstBuffer);

  if (HeUnlock(SecondBuffer) == HE_OK)
	HeFree(&SecondBuffer);

  if (HeUnlock(DumpBuffer) == HE_OK)
	HeFree(&DumpBuffer);
#endif

  delete TheRawFifo;
}

void AFCRead::Error(HE_DWORD ErrorCode)
{
  char *ErrorText;
#ifdef Hunt
  HeErr2Text(ErrorCode, ErrorText);
#endif
  throw new Exception(ErrorText);
}

void __fastcall AFCRead::Execute()
{
  bool PulseError;
  FlushBuffers();
  SyncRawRead();
  while(!Terminated)
	{
	  if(!BufferFull[0]){
			  TheRawFifo->ReadVector(DataIn[0], BufferSize);
			  if(DataIn[0][0] != (int)0xFFFC0000)
				SyncRawRead();
			  else
				BufferFull[0] = true;
	  }
	  else if(!BufferFull[1]){
			  TheRawFifo->ReadVector(DataIn[1], BufferSize);
			  if(DataIn[1][0] != (int)0xFFFC0000)
				  SyncRawRead();
			  else
				BufferFull[1] = true;
		   }
		   else{
			  TheRawFifo->ReadVector(Dump, BufferSize);
			  if(Dump[0] != (int)0xFFFC0000)
				  SyncRawRead();
			}
	}
	ReleaseBuffers();
}

void AFCRead::SyncRawRead()
{
  /*
     Q&D syncronization function
     Reads until finds Magic Number
     then reads one more buffers worth
     minus one value to put start in
     correct position
  */
  int dump = 0;
  int dump2[SAMPLES_PER_IP_CHAN - 1];
  while(dump != (int)0xFFFC0000)	{
	  TheRawFifo->ReadVector(&dump, sizeof(HE_INT32));
  }
  TheRawFifo->ReadVector(dump2, (SAMPLES_PER_IP_CHAN - 1) * sizeof(HE_INT32));
}
   
void AFCRead::FlushBuffers()
{
/* Function to try to ensure that buffers are
   empty before trying to sync with the FPGA */

  int  dump[1024 * 8];

  TheRawFifo->ReadVector(dump, 1024 * 8 * sizeof(int));
}

void AFCRead::GetPulse( PulseData *Data)
{
   AFCFIFOLock->Acquire();
	__try
	{
	   //Read to prevent stale pulses - Only one pulse in fifo at any one time
	   // so once one has been read next one must be new.
	   TheRawFifo->ReadVector(Data, sizeof(PulseData));
	   ScalePulse(Data);
	}
	__finally
	{
	   AFCFIFOLock->Release();
	}
}

void AFCRead::ScalePulse( PulseData *DataIn)
{
  int NData;
  NData = sizeof(DataIn->Data) / sizeof(DataIn->Data[0]);
  for(int i = 0; i < NData; i++)       /* Select data area where pulse lives */
  {
    DataIn->Data[i] /= (4*65536);
  }
}

