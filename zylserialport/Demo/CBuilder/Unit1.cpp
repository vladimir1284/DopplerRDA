//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "ZylSerialPort"
#pragma link "ZylSerialPort"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------


void __fastcall TForm1::btnOpenClick(TObject *Sender)
{
  ZylSerialPort->Port = (TCommPort)(cmbPort->ItemIndex + 1);
  ZylSerialPort->BaudRate = ZylSerialPort->IntToBaudRate(
    StrToInt(lstBaudRate->Items->Strings[lstBaudRate->ItemIndex]));
  ZylSerialPort->Open();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::btnCloseClick(TObject *Sender)
{
  ZylSerialPort->Close();        
}
//---------------------------------------------------------------------------
void __fastcall TForm1::ZylSerialPortReceive(TObject *Sender,
      AnsiString Buffer)
{
  if (rgMode->ItemIndex == 0)
    Memo->Lines->Add(Buffer);
  else if (rgMode->ItemIndex == 1)
  {
    AnsiString strBuffer = "";
    for (int i = 1; i <= Buffer.Length(); i++)
      strBuffer += IntToStr(int(Buffer[i]));
    Memo->Lines->Add(strBuffer);
  }
  else
  {
    AnsiString strBuffer = "";
    for (int i = 1; i <= Buffer.Length(); i++)
      strBuffer += IntToHex(int(Buffer[i]), 1);
    Memo->Lines->Add(strBuffer);
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
  ZylSerialPort->SendString(efText->Text);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  lstBaudRate->ItemIndex = lstBaudRate->Items->IndexOf("4800");
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ZylSerialPortConnect(TObject *Sender,
      TCommPort Port)
{
  Memo->Lines->Add("Connected to:" + ZylSerialPort->CommPortToString(Port));
}
//---------------------------------------------------------------------------

void __fastcall TForm1::ZylSerialPortDisconnect(TObject *Sender,
      TCommPort Port)
{
  Memo->Lines->Add("Disconnected from:" + ZylSerialPort->CommPortToString(Port));
}
//---------------------------------------------------------------------------

