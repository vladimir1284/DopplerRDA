// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 16580 $
// File generated on 5/4/2018 1:57:18 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Documents and Settings\ldt\Escritorio\TestModBusC++ 1\ModBusLibrary1.tlb (1)
// LIBID: {F34F72CD-D52F-4DBF-B9E1-370EBBE3C4DB}
// LCID: 0
// Helpfile: 
// HelpString: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v2.4 mscorlib, (C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb)
// Errors:
//   Error creating palette bitmap of (TModLib) : Server mscoree.dll contains no icons
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <olectrls.hpp>
#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#include "ModBusLibrary1_OCX.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Modbuslibrary1_tlb
{

IModLibPtr& TModLib::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TModLib::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TModLib::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TModLib::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TModLib::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TModLib::ConnectTo(IModLibPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TModLib::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ModLib;
  sd.IntfIID = __uuidof(IModLib);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

double __fastcall TModLib::Sumar(long a/*[in]*/, long b/*[in]*/)
{
  double pRetVal;
  OLECHECK(GetDefaultInterface()->Sumar(a, b, (double*)&pRetVal));
  return pRetVal;
}

long __fastcall TModLib::ConfMod(long iCom/*[in]*/, long iAddr/*[in]*/, long iStart/*[in]*/, 
                                 long iLength/*[in]*/, VARIANT_BOOL bRegister/*[in]*/)
{
  long pRetVal;
  OLECHECK(GetDefaultInterface()->ConfMod(iCom, iAddr, iStart, iLength, bRegister, (long*)&pRetVal));
  return pRetVal;
}

VARIANT_BOOL __fastcall TModLib::WriteBit(long module/*[in]*/, long bit/*[in]*/, 
                                          VARIANT_BOOL state/*[in]*/)
{
  VARIANT_BOOL pRetVal;
  OLECHECK(GetDefaultInterface()->WriteBit(module, bit, state, (VARIANT_BOOL*)&pRetVal));
  return pRetVal;
}

VARIANT_BOOL __fastcall TModLib::WriteCode(long module/*[in]*/, long channel/*[in]*/, 
                                           long code/*[in]*/)
{
  VARIANT_BOOL pRetVal;
  OLECHECK(GetDefaultInterface()->WriteCode(module, channel, code, (VARIANT_BOOL*)&pRetVal));
  return pRetVal;
}

long __fastcall TModLib::OpenComPort(void)
{
  long pRetVal;
  OLECHECK(GetDefaultInterface()->OpenComPort((long*)&pRetVal));
  return pRetVal;
}

LPSAFEARRAY __fastcall TModLib::DataGet(void)
{
  LPSAFEARRAY pRetVal;
  OLECHECK(GetDefaultInterface()->DataGet((LPSAFEARRAY*)&pRetVal));
  return pRetVal;
}


};     // namespace Modbuslibrary1_tlb


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Modbuslibrary1_ocx
{

void __fastcall PACKAGE Register()
{
  // [1]
  TComponentClass cls_svr[] = {
                              __classid(Modbuslibrary1_tlb::TModLib)
                           };
  RegisterComponents("ActiveX", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Modbuslibrary1_ocx
