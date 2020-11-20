
// stSOAPWebModuleIntf
//---------------------------------------------------------------------------
#ifndef CommModuleH
#define CommModuleH
//---------------------------------------------------------------------------
#include <SysUtils.hpp>
#include <Classes.hpp>
#include <HTTPApp.hpp>
#include <InvokeRegistry.hpp>
#include <SOAPHTTPDisp.hpp>
#include <SOAPHTTPPasInv.hpp>
#include <SOAPPasInv.hpp>
#include <TypInfo.hpp>
#include <WebBrokerSOAP.hpp>
#include <WebServExp.hpp>
#include <WSDLBind.hpp>
#include <WSDLIntf.hpp>
#include <WSDLPub.hpp>
#include <XMLSchema.hpp>
//---------------------------------------------------------------------------
class TCommunicationModule : public TWebModule
{
__published:	// IDE-managed Components
        THTTPSoapDispatcher *HTTPSoapDispatcher1;
        THTTPSoapCppInvoker *HTTPSoapCppInvoker1;
        TWSDLHTMLPublish *WSDLHTMLPublish1;
        void __fastcall WebModule2DefaultHandlerAction(TObject *Sender,
          TWebRequest *Request, TWebResponse *Response, bool &Handled);
private:	// User declarations
public:		// User declarations
	__fastcall TCommunicationModule(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCommunicationModule *CommunicationModule;
//---------------------------------------------------------------------------
#endif


