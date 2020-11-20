//---------------------------------------------------------------------------

#ifndef CommunicationManagerH
#define CommunicationManagerH

#include <IdContext.hpp>
//---------------------------------------------------------------------------

class CommunicationManager
{
	private:
		void ProcessGetCommand(TIdContext *AContext, String command);
		void ProcessPutCommand(TIdContext *AContext, String command);
		void SendConfig(TIdContext *AContext);
		void SendSnapshot(TIdContext *AContext);
		void ReceiveConfig(TIdContext *AContext);
		void ReceiveFilter(TIdContext *AContext);
		void SendParameters(TIdContext *AContext);

		String ReadString(TIdContext *AContext);
	public:
		CommunicationManager();
		~CommunicationManager(void);

		void __fastcall CommunicationClientConnect(TIdContext *AContext);
		void __fastcall CommunicationClientExecute(TIdContext *AContext);
};

extern CommunicationManager* theCommunicationManager;

#endif
