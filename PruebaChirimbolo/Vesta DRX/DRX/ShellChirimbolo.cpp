//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Site.h"
#include "ShellChirimbolo.h"
#include "DataParameters.h"
#include "IntegratedData.h"
#include "ProcessingThread.h"
#include "FFTReal.h"
#include "CommModule.h"
#include "PackageManager.h"

//---------------------------------------------------------------------------

#pragma package(smart_init)
#pragma link "perfgrap"
#pragma link "Chart"
#pragma link "TeEngine"
#pragma link "TeeProcs"
#pragma link "Series"
#pragma resource "*.dfm"
TShell_DRX *Shell_DRX;

//---------------------------------------------------------------------------
__fastcall TShell_DRX::TShell_DRX(TComponent* Owner): TForm(Owner)
{
	Randomize();
}

//---------------------------------------------------------------------------

void __fastcall TShell_DRX::FormCreate(TObject *Sender)
{
	// Create the WebBrokerBridge
	FWebBrokerBridge = new TIdHTTPWebBrokerBridge(this);

	FWebBrokerBridge->RegisterWebModuleClass(__classid(TCommunicationModule));
	FWebBrokerBridge->DefaultPort = ThisSite->settings->WS_Port;

	// In order to prevent the opening and closing
	// of a socket for each command set the following options:
	// - KeepAlive: Leave connection open for next command.
	// - AutoStartSession: In case no connection is open start a new session
	// with a new connection.
	FWebBrokerBridge->KeepAlive = true;
	FWebBrokerBridge->AutoStartSession = true;

	// Register a handler to the OnConnect event
	FWebBrokerBridge->OnConnect = ConnectionEvent;
	FWebBrokerBridge->Active = true;
}

void __fastcall TShell_DRX::ConnectionEvent(TIdContext *AThread ){
  AThread->Connection->Socket->UseNagle = false;
}

//---------------------------------------------------------------------------
void __fastcall TShell_DRX::FormDestroy(TObject *Sender)
{
  ThisSite->TheRadar->ClearDigitalOutputs();
  ThisSite->TheRadar->Stalo->Disconnect();
}

//---------------------------------------------------------------------------
