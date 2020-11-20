//---------------------------------------------------------------------------
#ifndef ShellChirimboloH
#define ShellChirimboloH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <Dialogs.hpp>
#include "perfgrap.h"

#include "Radar.h"
#include "FFTReal.h"
#include "Chart.hpp"
#include "TeEngine.hpp"
#include "TeeProcs.hpp"
#include "Series.hpp"
#include "IdHTTPWebBrokerBridge.hpp"
#include <IdBaseComponent.hpp>
#include <IdCmdTCPServer.hpp>
#include <IdComponent.hpp>
#include <IdCustomTCPServer.hpp>
#include <IdTCPServer.hpp>

//---------------------------------------------------------------------------
class TShell_DRX : public TForm
{
__published:	// IDE-managed Components
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);

private:
	TIdHTTPWebBrokerBridge* FWebBrokerBridge;

	unsigned long StartTime;
	unsigned long TxPackTime;
	unsigned long RxPackTime;
	void __fastcall ConnectionEvent(TIdContext *AThread );

public:		// User declarations
	__fastcall TShell_DRX(TComponent* Owner);
};
//---------------------------------------------------------------------------

extern PACKAGE TShell_DRX *Shell_DRX;

//---------------------------------------------------------------------------
#endif