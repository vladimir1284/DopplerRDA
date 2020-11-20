//---------------------------------------------------------------------------

#ifndef DataSenderContextH
#define DataSenderContextH
//---------------------------------------------------------------------------
#include "DataParameters.h"


#include <Classes.hpp>
#include <IdCmdTCPServer.hpp>
#include <IdContext.hpp>
#include <SyncObjs.hpp>
#include <Contnrs.hpp>

//---------------------------------------------------------------------------

class TDataSenderContext : public TIdContext
{
protected:
	bool __fastcall Run(void);
public:
	__fastcall TDataSenderContext(Idtcpconnection::TIdTCPConnection* AConnection, Idyarn::TIdYarn* AYarn, Classes::TThreadList* AList);
};
//---------------------------------------------------------------------------



//---------------------------------------------------------------------------
#endif
