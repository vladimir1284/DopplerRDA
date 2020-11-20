//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DataSenderContext.h"
#include "PackageManager.h"

#pragma package(smart_init)
//---------------------------------------------------------------------------

__fastcall TDataSenderContext::TDataSenderContext(Idtcpconnection::TIdTCPConnection* AConnection, Idyarn::TIdYarn* AYarn, Classes::TThreadList* AList): TIdContext(AConnection, AYarn, AList){
	thePackageManager->ClearPackages();
}

//---------------------------------------------------------------------------

bool __fastcall TDataSenderContext::Run(void){
	try {
		DRX_Data_Package* package = thePackageManager->GetPackage();

		if(package != NULL){
			  Connection->IOHandler->WriteLn(package->DataType);
			  String Response = Connection->IOHandler->ReadLn("", CommandTimeout);
			  if(Response == Success_Response){
				  Connection->IOHandler->Write((int)package->Az);
				  Connection->IOHandler->Write((int)package->El);
				  Connection->IOHandler->Write((int)package->BufferDataType);
				  Connection->IOHandler->Write((int)package->NData);

				  TIdBytes Buffer;
				  Buffer.Length = package->BufferSize;
				  memcpy(&Buffer[0], package->Data, package->BufferSize);
				  Connection->IOHandler->Write(Buffer);
			  }
			  else if(Response == Fail_Response){
				if(package->DataType == MSG_TX_Burst   ) thePackageManager->TX_Burst    = false;
				if(package->DataType == MSG_TX_Spectrum) thePackageManager->TX_Spectrum = false;
				if(package->DataType == MSG_RX_Power   ) thePackageManager->RX_Power    = false;
				if(package->DataType == MSG_RX_Speed   ) thePackageManager->RX_Speed    = false;
				if(package->DataType == MSG_RX_Spectrum) thePackageManager->RX_Spectrum = false;
				if(package->DataType == MSG_RX_SQI     ) thePackageManager->RX_Sqi      = false;
				if(package->DataType == MSG_RX_CI      ) thePackageManager->RX_Ci       = false;
			  }

			  delete package;
			  Sleep(10);
		}
		else{
			if(Connection->Connected())
				Connection->IOHandler->CheckForDisconnect();
			Connection->CheckForGracefulDisconnect();
			Connection->IOHandler->WriteLn("Ping");
			String Response = Connection->IOHandler->ReadLn("", CommandTimeout);
			if(Response == Success_Response) Sleep(1000);
			else return false;
		}

		return true;
	} catch (...) {
		return false;
	}
}