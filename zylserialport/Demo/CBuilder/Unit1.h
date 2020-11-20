//---------------------------------------------------------------------------

#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "ZylSerialPort.hpp"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo;
        TButton *btnOpen;
        TButton *btnClose;
        TListBox *cmbPort;
        TZylSerialPort *ZylSerialPort;
        TButton *Button3;
        TEdit *efText;
        TRadioGroup *rgMode;
        TListBox *lstBaudRate;
        void __fastcall btnOpenClick(TObject *Sender);
        void __fastcall btnCloseClick(TObject *Sender);
        void __fastcall ZylSerialPortReceive(TObject *Sender,
          AnsiString Buffer);
        void __fastcall Button3Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ZylSerialPortConnect(TObject *Sender,
          TCommPort Port);
        void __fastcall ZylSerialPortDisconnect(TObject *Sender,
          TCommPort Port);
private:	// User declarations
public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
