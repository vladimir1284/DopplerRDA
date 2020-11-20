//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("ZylSerialPortPack.res");
USEPACKAGE("vcl50.bpi");
USEUNIT("ZylSerialPort.pas");
USERES("ZylSerialPort.dcr");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
        return 1;
}
//---------------------------------------------------------------------------
