//---------------------------------------------------------------------------
#ifndef ShellDRXH
#define ShellDRXH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ComCtrls.hpp>
#include <Buttons.hpp>
#include <ExtCtrls.hpp>
#include <Dialogs.hpp>
#include "perfgrap.h"

#include "Radar.h"
#include "FFTReal.h"
#include "Chart.hpp"
#include "TeEngine.hpp"
#include "TeeProcs.hpp"
#include "Series.hpp"
#include <IdBaseComponent.hpp>
#include <IdCmdTCPServer.hpp>
#include <IdComponent.hpp>
#include <IdCustomTCPServer.hpp>
#include <IdTCPServer.hpp>
#include "DRX_Data_Package.h"

//---------------------------------------------------------------------------
class TShell_DRX : public TForm
{
__published:	// IDE-managed Components
	TPageControl *InfoContainer;
	TTabSheet *TabSheet4;
	TPanel *Panel2;
	TPanel *Panel1;
	TPanel *Panel3;
	TPageControl *afcCharts;
	TTabSheet *TabSheet3;
	TChart *txChart;
	TFastLineSeries *Series1;
	TTabSheet *TabSheet5;
	TChart *fftChart;
	TFastLineSeries *FastLineSeries1;
	TTabSheet *TabSheet6;
	TPanel *Panel4;
	TLabel *Label4;
	TLabel *Label5;
	TEdit *txAzimut;
	TEdit *txElevation;
	TPanel *Panel5;
	TPageControl *IQ_Charts;
	TTabSheet *TabSheet14;
	TChart *chartPower;
	TFastLineSeries *FastLineSeries11;
	TTabSheet *TabSheet7;
	TChart *chartT;
	TFastLineSeries *FastLineSeries4;
	TTabSheet *TabSheet11;
	TChart *chartZ;
	TFastLineSeries *FastLineSeries7;
	TTabSheet *TabSheet8;
	TChart *chartSpeed;
	TFastLineSeries *FastLineSeries2;
	TTabSheet *tabW;
	TChart *chartW;
	TFastLineSeries *FastLineSeries6;
	TTabSheet *TabSheet9;
	TChart *chartSQI;
	TFastLineSeries *FastLineSeries3;
	TTabSheet *TabSheet2;
	TChart *chartLOG;
	TFastLineSeries *FastLineSeries8;
	TTabSheet *TabSheet12;
	TChart *chartSIG;
	TFastLineSeries *FastLineSeries9;
	TTabSheet *TabSheet13;
	TChart *chartCCOR;
	TFastLineSeries *FastLineSeries10;
	TTabSheet *tFilter;
	TLabel *Label13;
	TLabel *Label14;
	TLabel *Label15;
	TLabel *Label17;
	TLabel *Label18;
	TLabel *Label19;
	TLabel *Label20;
	TLabel *Label21;
	TLabel *Label22;
	TLabel *Label23;
	TLabel *Label24;
	TLabel *Label25;
	TEdit *txB0;
	TEdit *txB1;
	TEdit *txB2;
	TEdit *txB3;
	TEdit *txB4;
	TEdit *txC1;
	TEdit *txC2;
	TEdit *txC3;
	TEdit *txC4;
	TEdit *txMaxAngle;
	TEdit *txMaxHeigh;
	TEdit *txMaxDistance;
	TCheckBox *ckSQI;
	TCheckBox *ckCCOR;
	TCheckBox *ckLOG;
	TCheckBox *ckSIG;
	TRadioGroup *rgPulse_Mode;
	TRadioGroup *rgPRF_Mode;
	TRadioGroup *rgPRF_Rate;
	TTimer *Filter_Timer;
	TTimer *IQ_Timer;
	TTimer *AFC_Timer;
	TGroupBox *GroupBox1;
	TLabel *Label1;
	TLabel *Label9;
	TLabel *Label26;
	TEdit *txTemp;
	TEdit *txPow;
	TEdit *txFrequency;
	TLabel *Label3;
	TLabel *Label10;
	TLabel *Label2;
	TGroupBox *GroupBox2;
	TLabel *Label6;
	TLabel *Label7;
	TLabel *Label8;
	TLabel *AverageValue;
	TLabel *TxFreqLabel;
	TLabel *PowLabel;
	TTimer *timerWS;
	TLabel *Label11;
	TEdit *txFreqSetpoint;
	TLabel *Label12;
	TEdit *txSpeckleDistance;
	TLabel *Label16;
	TCheckBox *ckSpeckle;
	TTimer *Signals;
	TCheckBox *ckAFC_Acquire;
	TCheckBox *ckIQ_Acquire;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall Filter_TimerTimer(TObject *Sender);
	void __fastcall InfoContainerChange(TObject *Sender);
	void __fastcall AFC_TimerTimer(TObject *Sender);
	void __fastcall IQ_TimerTimer(TObject *Sender);
	void __fastcall timerWSTimer(TObject *Sender);
	void __fastcall SignalsTimer(TObject *Sender);
	void __fastcall ckAFC_AcquireClick(TObject *Sender);
	void __fastcall ckIQ_AcquireClick(TObject *Sender);

private:
	unsigned long StartTime;
	unsigned long TxPackTime;
	unsigned long RxPackTime;
	void __fastcall ConnectionEvent(TIdContext *AThread );

	TCriticalSection* lock;
	TQueue* packages;

	bool allow_tx_rx_power();
	bool allow_tx_burst();
	bool allow_tx_spectrum();
	bool allow_rx_dbz();
	bool allow_rx_dbt();
	bool allow_rx_w();
	bool allow_rx_v();
	bool allow_rx_sqi();
	bool allow_rx_log();
	bool allow_rx_sig();
	bool allow_rx_ccor();

	void paint_tx_rx_power(DRX_Data_Package* package);
	void paint_tx_burst(DRX_Data_Package* package);
	void paint_tx_spectrum(DRX_Data_Package* package);
	void paint_rx_dbz(DRX_Data_Package* package);
	void paint_rx_dbt(DRX_Data_Package* package);
	void paint_rx_w(DRX_Data_Package* package);
	void paint_rx_v(DRX_Data_Package* package);
	void paint_rx_sqi(DRX_Data_Package* package);
	void paint_rx_log(DRX_Data_Package* package);
	void paint_rx_sig(DRX_Data_Package* package);
	void paint_rx_ccor(DRX_Data_Package* package);

	void UpdateAFC();
	void UpdateIQ();
	void UpdateStalo();
	void UpdateFilters(TDataFilter* filter);

public:
	DRX_Data_Package* GetPackage();
	void ClearPackages();
	void AddPackage(DRX_Data_Package* package);

	__property bool TX_RX_Power = { read= allow_tx_rx_power};
	__property bool TX_Burst    = { read= allow_tx_burst};
	__property bool TX_Spectrum = { read= allow_tx_spectrum};
	__property bool RX_dBZ      = { read= allow_rx_dbz};
	__property bool RX_dBT      = { read= allow_rx_dbt};
	__property bool RX_W        = { read= allow_rx_w};
	__property bool RX_V        = { read= allow_rx_v};
	__property bool RX_SQI      = { read= allow_rx_sqi};
	__property bool RX_LOG      = { read= allow_rx_log};
	__property bool RX_SIG      = { read= allow_rx_sig};
	__property bool RX_CCOR     = { read= allow_rx_ccor};

public:		// User declarations
	__fastcall TShell_DRX(TComponent* Owner);
};
//---------------------------------------------------------------------------

extern PACKAGE TShell_DRX *Shell_DRX;
extern TIdTCPServer       *theCommunicationServer;
extern ProcessingThread   *TheProcessingThread;

//---------------------------------------------------------------------------
#endif
