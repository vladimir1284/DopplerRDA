//---------------------------------------------------------------------------

#ifndef CommonObjsH
#define CommonObjsH


#include <System.hpp>
#include <InvokeRegistry.hpp>
#include <XSBuiltIns.hpp>
#include <Types.hpp>

#pragma option -b.

class TDRX_AuthHeader : public TSOAPHeader {
private:
  AnsiString fUserName;
  AnsiString fToken;
__published:
  __property AnsiString UserName = { read=fUserName, write=fUserName };
  __property AnsiString Token = { read=fToken, write=fToken };
};

//---------------------------------------------------------------------------
#endif
