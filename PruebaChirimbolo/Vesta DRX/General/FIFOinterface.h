//---------------------------------------------------------------------------
#ifndef FIFOinterfaceH
#define FIFOinterfaceH
//---------------------------------------------------------------------------

#include <heapi.h>
#include <syncobjs.hpp>

class FIFOInterface
{
private:
	char * BoardType;

	HE_WORD BoardId;
	HE_WORD DeviceId;

	HE_HANDLE   hDevice;
	HE_IOSTATUS ReadIoStatus;
	HE_IOSTATUS WriteIoStatus;

	TCriticalSection * InterfaceLock;

public:
	FIFOInterface(HE_WORD FIFONumber);
	~FIFOInterface();

	void SetMode(int mode);

	bool WriteWord(int wordout);
	bool ReadVector(void * Data,int size);

	bool WriteVector(void * data, int size);
	bool StartWriteVector(void * Data,int size);

	bool StartReadVector(void * Data,int size);
	bool IsReadComplete();
	bool IsWriteComplete();

	bool WaitForReadComplete();
	bool WaitForWriteComplete();
};

#endif
