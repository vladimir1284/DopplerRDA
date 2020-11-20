//---------------------------------------------------------------------------
#pragma hdrstop

#include "DRX_Data_Package.h"
#include <Math.hpp>
#include "DataParameters.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)

DRX_Data_Package::DRX_Data_Package(){
	fAz = 0;
	fEl = 0;
	fDataType = 0;
	fNData = 0;
	fCellSize = 0;

	fdata = NULL;
}

DRX_Data_Package::~DRX_Data_Package(){
	if(fdata != NULL)
		FreeMemory(fdata);
}

void DRX_Data_Package::InitMsg(String _DataType, short _CellSize, short _Az, short _El, short _BufferDataType, short _NData, void* _Data){
	fDataType = _DataType;
	fNData = _NData;
	fAz = _Az;
	fEl = _El;
	fCellSize = _CellSize;
	fBufferDataType = _BufferDataType;

	fdata = AllocMem(BufferSize);
	memcpy(fdata, _Data, BufferSize);
}

short DRX_Data_Package::getBufferDataSize(){
	int result = 0;
	switch (fBufferDataType) {
		case dtShort:
			result = 2;
			break;
		case dtUShort:
			result = 2;
			break;
		case dtInt:
			result = 4;
			break;
		case dtUIint:
			result = 4;
			break;
		case dtInt64:
			result = 8;
			break;
		case dtFloat:
			result = 4;
			break;
		case dtDouble:
			result = 8;
			break;
	}

	return result;
}

short DRX_Data_Package::getBufferSize(){
	return fNData * getBufferDataSize();
}
