//---------------------------------------------------------------------------
#ifndef AFCReadH
#define AFCReadH
//---------------------------------------------------------------------------
#include "FIFOinterface.h"
#include "stdio.h"
#include "DataParameters.h"

//---------------------------------------------------------------------------

typedef struct ThePulseData
{
  int MagicNumber;
  int Data[SAMPLES_PER_IP_CHAN-1];
} PulseData;


class AFCRead : public TThread
{
 private:
  FIFOInterface *TheRawFifo;

  TCriticalSection *AFCFIFOLock;
  HE_MEMHANDLE FirstBuffer, SecondBuffer, DumpBuffer;
  HE_PINT32BUFFER Dump;
  HE_DWORD BufferSize;

 private:
  void ReleaseBuffers();
  void Error(HE_DWORD ErrorCode);

  void SyncRawRead();
  void FlushBuffers();

  void ScalePulse( PulseData* Data);

 protected:
  void __fastcall Execute();

 public:
  __fastcall AFCRead(bool CreateSuspended);
  void GetPulse( PulseData* Data);

 public:
  HE_PINT32BUFFER DataIn[2];
  bool BufferFull[2];
};
//---------------------------------------------------------------------------
#endif