
//---------------------------------------------------------------------------
#include "CommModule.h"
#include <WebReq.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TCommunicationModule *CommunicationModule;
//---------------------------------------------------------------------------
__fastcall TCommunicationModule::TCommunicationModule(TComponent* Owner)
	: TWebModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TCommunicationModule::WebModule2DefaultHandlerAction(TObject *Sender,
      TWebRequest *Request, TWebResponse *Response, bool &Handled)
{
  WSDLHTMLPublish1->ServiceInfo(Sender, Request, Response, Handled);
}
//---------------------------------------------------------------------------

static void initialization()
{
  if (WebRequestHandler() != NULL)
  {
    WebRequestHandler()->WebModuleClass = __classid(TCommunicationModule);
  }
}
#pragma startup initialization 31
//---------------------------------------------------------------------------


