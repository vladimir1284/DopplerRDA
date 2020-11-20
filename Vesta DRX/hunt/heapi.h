/*
	heapi.h

        Copyright HUNT ENGINEERING 2005

	Defines the HUNT ENGINEERING Cross Platform Driver Interface.

    Host API 1.9.10 (june 7, 2007)
*/

#ifdef __cplusplus
	extern "C" {
#endif

#ifndef _HEAPI_ALREADY_INCLUDED_
	#define _HEAPI_ALREADY_INCLUDED_

	#ifndef __HEAPI_ALREADY_GOT_TYPE_DEFINITIONS__		
		/* Skip the types we've already defined these
		   this is for internal use only!
		*/
		#ifdef _WIN32
			/*	WIN32 using MSVC V4 (32 Bit Compiler) */
			typedef unsigned long int	HE_DWORD;
			typedef unsigned short int	HE_WORD;
			typedef unsigned char		HE_BYTE;
	    	
			typedef signed long int		HE_INT32;
			typedef signed short int	HE_INT16;
			typedef signed char 		HE_INT8;
	    	
			typedef HE_BYTE * HE_PBYTEBUFFER;
			typedef HE_WORD * HE_PWORDBUFFER;
			typedef HE_DWORD * HE_PDWORDBUFFER;
	
			typedef HE_INT8 * HE_PINT8BUFFER;
			typedef HE_INT16 * HE_PINT16BUFFER;
			typedef HE_INT32 * HE_PINT32BUFFER;
    	
			typedef HE_WORD HE_BOOLEAN;
		#else
		#ifdef _MSDOS
			/* 16 bit DOS or Windows          */
			/* Common DOS and W31 definitions */
			typedef unsigned long int	HE_DWORD;
			typedef unsigned short int	HE_WORD;
			typedef unsigned char		HE_BYTE;

			typedef signed long int		HE_INT32;
			typedef signed short int	HE_INT16;
			typedef signed char 		HE_INT8;

			typedef HE_BYTE __huge * HE_PBYTEBUFFER;
			typedef HE_WORD __huge * HE_PWORDBUFFER;
			typedef HE_DWORD __huge * HE_PDWORDBUFFER;

			typedef HE_INT8 __huge * HE_PINT8BUFFER;
			typedef HE_INT16 __huge * HE_PINT16BUFFER;
			typedef HE_INT32 __huge * HE_PINT32BUFFER;

			typedef HE_WORD HE_BOOLEAN;
		#else 
		#ifdef _VXWORKS

			/* VxWorks on a PC */
			typedef unsigned long int	HE_DWORD;
			typedef unsigned short int	HE_WORD;
			typedef unsigned char		HE_BYTE;

			typedef signed long int		HE_INT32;
			typedef signed short int	HE_INT16;
			typedef signed char 		HE_INT8;

			typedef HE_BYTE  * HE_PBYTEBUFFER;
			typedef HE_WORD  * HE_PWORDBUFFER;
			typedef HE_DWORD * HE_PDWORDBUFFER;

			typedef HE_INT8  * HE_PINT8BUFFER;
			typedef HE_INT16 * HE_PINT16BUFFER;
			typedef HE_INT32 * HE_PINT32BUFFER;

			typedef HE_WORD HE_BOOLEAN;
		#else
		#ifdef _LINUX 
			/* Linux on a PC */ 
			typedef unsigned long int	HE_DWORD; 
			typedef unsigned short int	HE_WORD; 
			typedef unsigned char		HE_BYTE; 
 
			typedef signed long int		HE_INT32; 
			typedef signed short int	HE_INT16; 
			typedef signed char 		HE_INT8; 
 
			typedef HE_BYTE  * HE_PBYTEBUFFER; 
			typedef HE_WORD  * HE_PWORDBUFFER; 
			typedef HE_DWORD * HE_PDWORDBUFFER; 
 
			typedef HE_INT8  * HE_PINT8BUFFER; 
			typedef HE_INT16 * HE_PINT16BUFFER; 
			typedef HE_INT32 * HE_PINT32BUFFER; 
 
			typedef HE_WORD HE_BOOLEAN; 
		#endif 
		#endif
		#endif
		#endif

		typedef struct _HE_HANDLE{
			HE_DWORD HandleType;  		/* Code used to identify the type of Handle */
		} *HE_HANDLE;

		typedef struct _HE_IOSTATUS {
			HE_DWORD HandleType;  		/* Code used to identify the type of Handle */
		} *HE_IOSTATUS ;               	
		
		typedef	struct _HE_MEMHANDLE {
			HE_DWORD HandleType;  		/* Code used to identify the type of Handle */
		} *HE_MEMHANDLE ;
        

	#endif

	#ifndef __ONLY_WANT_HE_ERROR_CODES__		/* Only the error codes */

/*	Generic Definitions */

		#ifdef _WIN32							/*	WIN32 using MSVC V4 (32 Bit Compiler) */

			#ifdef LOCAL_COPY
				#define DllImport			
				#define DllExport			
				#define strlwr _strlwr
				#define ltoa _ltoa
				#define printf DebugPrint
				VOID DebugPrint(PCHAR DebugMessage, ...);
			#else
				#define DllImport	__declspec( dllimport )
				#ifndef DllExport
					#define DllExport	__declspec( dllexport )
				#endif
			#endif

			#define Win16DllFix __cdecl					/* used for Win16 DLL's only */
	
			#ifndef FALSE
				#define FALSE               0
			#endif
			#ifndef TRUE
				#define TRUE                1
			#endif
		#else	                                		/* end of WIN32 Definitions */
			#ifndef NO_ERROR
				#define NO_ERROR 0						/* a win32 code that we use */
			#endif

			#ifdef _MSDOS								/* 16 bit DOS or Windows */

			/*	Common DOS and W31 definitions */
				#ifndef FALSE
					#define FALSE               0
				#endif
				#ifndef TRUE
					#define TRUE                1
				#endif
				/* Win 31 Specific stuff */
				#ifdef _WINDOWS							/* Windows 3.1 under MSVC V1.5x */
        		
					#include "malloc.h"

					#ifdef _WINDLL
						#define DllImport
						#define DllExport
					#else
						#ifdef _cplusplus
							#define DllImport extern "C"
							#define DllExport extern "C"
						#else
							#define DllImport
							#define DllExport
						#endif
					#endif

					#define Win16DllFix __far __pascal _export 	/* used for Win16 DLL's only */
	
				#else										/* MSDOS (or MSDOS box) under MSVC V1.5x */
					/* DOS Specific stuff */
					#include "malloc.h"

					#define DllImport
					#define DllExport

					#define Win16DllFix	__cdecl				/* used for Win16 DLL's only */
	
				#endif   									/* end of MSDOS definitions */
			#else
			#ifdef _VXWORKS
				#ifndef FALSE
					#define FALSE               0
				#endif
				#ifndef TRUE
					#define TRUE                1
				#endif

				#define DllImport
				#define DllExport
				#define Win16DllFix
			#else
			#ifdef _LINUX
				#ifndef FALSE 
				#define FALSE               0 
				#endif 
				#ifndef TRUE 
				#define TRUE                1 
				#endif 
 
				#define DllImport 
				#define DllExport 
				#define Win16DllFix 
			#endif
			#endif
			#endif											/* end of _MSDOS - MSDOS or Win 3.1 */

		#endif

		DllExport HE_DWORD Win16DllFix HeOpen(char *BoardType, HE_WORD BoardId, HE_WORD DeviceId, HE_HANDLE *hDevice);
		DllExport HE_DWORD Win16DllFix HeOpen1(char *BoardType, HE_WORD BoardId, char *DeviceC, HE_HANDLE *hDevice);
		DllExport HE_DWORD Win16DllFix HeOpenS(char *BoardType, HE_WORD BoardId, char *DeviceC, HE_HANDLE *hDevice, HE_DWORD *switches);
		DllExport HE_DWORD Win16DllFix HeClose(HE_HANDLE *hDevice);
		DllExport HE_DWORD Win16DllFix HeRead(HE_HANDLE hDevice, void *data, HE_DWORD Count, HE_IOSTATUS pIoStatus);
		DllExport HE_DWORD Win16DllFix HeWrite(HE_HANDLE hDevice, void *data, HE_DWORD Count, HE_IOSTATUS pIoStatus);
		DllExport void	   Win16DllFix HeDelay(HE_DWORD wait);
		DllExport HE_DWORD Win16DllFix HeReset(HE_HANDLE hDevice);
		DllExport HE_DWORD Win16DllFix HeReset1(HE_HANDLE hDevice, HE_DWORD ResetHold);
		DllExport HE_DWORD Win16DllFix HeInitIoStatus(HE_HANDLE hDevice, HE_IOSTATUS *pIoStatus);
		DllExport HE_DWORD Win16DllFix HeWaitForIo(HE_HANDLE hDevice, HE_IOSTATUS pIoStatus);
		DllExport HE_DWORD Win16DllFix HeTestIo(HE_HANDLE hDevice, HE_IOSTATUS pIoStatus);
		DllExport void     Win16DllFix HeErr2Text(HE_DWORD errcode, char *errtxt);
		DllExport HE_DWORD Win16DllFix HeMakeHandle(char *BoardType, HE_WORD BoardId, HE_WORD DeviceId, HE_DWORD *HeHandle);

		DllExport HE_DWORD Win16DllFix HeAlloc(HE_MEMHANDLE *memHandle, HE_DWORD MessageSize);
		DllExport HE_DWORD Win16DllFix HeFree(HE_MEMHANDLE *memHandle);
		DllExport HE_DWORD Win16DllFix HeLock(HE_MEMHANDLE memHandle, void *tmpptr);
		DllExport HE_DWORD Win16DllFix HeUnlock(HE_MEMHANDLE memHandle);

		DllExport HE_DWORD Win16DllFix HeJtagWrite(HE_HANDLE hDevice, HE_DWORD PortData);
		DllExport HE_DWORD Win16DllFix HeJtagRead(HE_HANDLE hDevice, HE_DWORD *PortData);
		DllExport HE_DWORD Win16DllFix HeJtagWriteBlock(HE_HANDLE hDevice, HE_DWORD *PortData, int dwords);

		DllExport HE_DWORD Win16DllFix HeGetBoardInfo(char *BoardType, HE_WORD BoardId, HE_DWORD *Information);
		DllExport HE_DWORD Win16DllFix HeGetBoardInfoEx(char *BoardDescr, HE_WORD BoardId, HE_DWORD *Information, int *n);
		DllExport HE_DWORD Win16DllFix HeDetectOperatingSystem(HE_DWORD *ver);
		DllExport HE_DWORD Win16DllFix HeDetectOperatingSystemRemote(HE_DWORD *ver, char *name, int port);
		DllExport HE_DWORD Win16DllFix HeConfig(HE_HANDLE hDevice, HE_DWORD *Config);

		DllExport HE_DWORD Win16DllFix HeGetIoGranularity(HE_HANDLE hDevice, HE_DWORD *granularity);
		DllExport HE_DWORD Win16DllFix GetDriverStatus(HE_HANDLE hDevice);
		DllExport HE_DWORD Win16DllFix GetIntsStatus(HE_HANDLE hDevice, HE_DWORD *Ret_Data);
		DllExport HE_DWORD Win16DllFix GetIntsStatusEx(HE_HANDLE hDevice, HE_DWORD *Ret_Data, int *size);
		DllExport HE_DWORD Win16DllFix HeTestInputAvailable(HE_HANDLE hDevice);
		DllExport HE_DWORD Win16DllFix HeGetLastOsError(void *hand);

		DllExport HE_DWORD Win16DllFix HeHSBInit  (HE_HANDLE hDevice, HE_BYTE hsb_id);
		DllExport HE_DWORD Win16DllFix HeHSBMaster(HE_HANDLE hDevice, HE_BYTE hsb_id, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBSlave (HE_HANDLE hDevice, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBListen(HE_HANDLE hDevice, HE_DWORD *id, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBFlush (HE_HANDLE hDevice, HE_DWORD *read);

		/* Level 2 HSB functions */
		DllExport HE_DWORD Win16DllFix HeHSBStartSendMessage   (HE_HANDLE hDevice, HE_BYTE slot, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBSendMessageData    (HE_HANDLE hDevice, void *data, HE_DWORD Count, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBEndOfSendMessage   (HE_HANDLE hDevice, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBStartReceiveMessage(HE_HANDLE hDevice, HE_DWORD *id , int msec);
		DllExport HE_DWORD Win16DllFix HeHSBReceiveMessageData (HE_HANDLE hDevice, void *data, HE_DWORD size, HE_DWORD *read, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBEndOfReceiveMessage(HE_HANDLE hDevice, int msec);
		/* Level 2 HSB, multiple board functions */
		DllExport HE_DWORD Win16DllFix HeHSBStartSendMessageEx   (HE_HANDLE hDevice, HE_WORD TgBd, HE_BYTE slot, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBSendMessageDataEx    (HE_HANDLE hDevice, void *data, HE_DWORD Count, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBEndOfSendMessageEx   (HE_HANDLE hDevice, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBStartReceiveMessageEx(HE_HANDLE hDevice, HE_DWORD *id, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBReceiveMessageDataEx (HE_HANDLE hDevice, void *data, HE_DWORD size, HE_DWORD *read, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBEndOfReceiveMessageEx(HE_HANDLE hDevice, int msec);

		/* Level 3 HSB functions */
		DllExport HE_DWORD Win16DllFix HeHSBSendMessage   (HE_HANDLE hDevice, HE_BYTE  msg_type, HE_BYTE slot, void *data, HE_DWORD size,                 int msec);
		DllExport HE_DWORD Win16DllFix HeHSBReceiveMessage(HE_HANDLE hDevice, HE_BYTE *msg_type, HE_BYTE slot, void *data, HE_DWORD size, HE_DWORD *read, int msec);
		/* Level 3 HSB, multiple board functions */
		DllExport HE_DWORD Win16DllFix HeHSBSendMessageEx   (HE_HANDLE hDevice, HE_BYTE msg_type, HE_WORD TgBd, HE_BYTE slot, void *data, HE_DWORD count, int msec);
		DllExport HE_DWORD Win16DllFix HeHSBReceiveMessageEx(HE_HANDLE hDevice, HE_BYTE *msg_type, HE_WORD TgBd, HE_BYTE slot, void *data, HE_DWORD size, HE_DWORD *read, int msec);

		/* HEPC9: set JTAG */
		DllExport HE_DWORD Win16DllFix HeJtagConfigure(HE_HANDLE hDevice, int value);

		/* Get Handle info */
		DllExport HE_DWORD HeGetDeviceInfo(HE_HANDLE hDevice, char *BoardDescr, HE_WORD *BoardId, HE_WORD *DeviceId);

		/*	The following routines may not always be present and are not for general use  */
		/*	or are obsoleted functions. USE AT YOUR OWN PERIL */
		DllExport HE_DWORD Win16DllFix HeI2CInit  (HE_HANDLE hDevice, HE_BYTE hsb_id);
		DllExport HE_DWORD Win16DllFix HeI2CMaster(HE_HANDLE hDevice, HE_BYTE hsb_id, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CSlave (HE_HANDLE hDevice, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CListen(HE_HANDLE hDevice, HE_DWORD *id, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CFlush (HE_HANDLE hDevice, HE_DWORD *read);
		DllExport HE_DWORD Win16DllFix HeI2CStartSendMessage   (HE_HANDLE hDevice, HE_BYTE slot, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CSendMessageData    (HE_HANDLE hDevice, void *data, HE_DWORD Count, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CEndOfSendMessage   (HE_HANDLE hDevice, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CStartReceiveMessage(HE_HANDLE hDevice, HE_DWORD *id , int msec);
		DllExport HE_DWORD Win16DllFix HeI2CReceiveMessageData (HE_HANDLE hDevice, void *data, HE_DWORD size, HE_DWORD *read, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CEndOfReceiveMessage(HE_HANDLE hDevice, int msec);
		DllExport HE_DWORD Win16DllFix HeI2CSendMessage   (HE_HANDLE hDevice, HE_BYTE  msg_type, HE_BYTE slot, void *data, HE_DWORD size,                 int msec);
		DllExport HE_DWORD Win16DllFix HeI2CReceiveMessage(HE_HANDLE hDevice, HE_BYTE *msg_type, HE_BYTE slot, void *data, HE_DWORD size, HE_DWORD *read, int msec);
		DllExport HE_DWORD Win16DllFix HeForceClose(char *BoardType, HE_WORD BoardId, HE_WORD DeviceId);
		DllExport HE_DWORD Win16DllFix HeFullReset(HE_HANDLE hDevice);
		DllExport HE_DWORD Win16DllFix HeDebug(HE_HANDLE hDevice, int *scratch, int nbytes);
		DllExport HE_DWORD Win16DllFix HeTrace(HE_HANDLE hDevice, unsigned int *buf, int *n);

	#endif										/* ! __ONLY_WANT_HE_ERROR_CODES__	*/

	#define HE_BYTE0(it) ((HE_BYTE)(it)&0xff)
	#define HE_BYTE1(it) ((HE_BYTE)(it>>8)&0xff)
	#define HE_BYTE2(it) ((HE_BYTE)(it>>16)&0xff)
	#define HE_BYTE3(it) ((HE_BYTE)(it>>24)&0xff)

	#define HE_WORD0(it) ((HE_WORD)(it)&0xffff)
	#define HE_WORD1(it) ((HE_WORD)(it>>16)&0xffff)

	#define ComportA			 0
	#define FifoA				 0
	#define FifoB				 1
	#define ComportB			 1
	#define Jtag				 2
	#define HSB					 3
	#define I2C					 3				/* obsolete; don't use */
	#define ResetDevice			 4
	#define InfoDevice			 5				/* Used by NT driver */
	#define ComportC			 6
	#define FifoC				 6
	#define ComportD			 7
	#define FifoD				 7
	#define ComportE			 8
	#define FifoE				 8
	#define ComportF			 9
	#define FifoF				 9
	#define WDMParent			10				/* reserved for use with WDM */

	#define HE_OK                                   0x0000        
	#define HE_SIG_FAIL                             0x0001
	#define HE_HEPC3_DETECT_FAIL                    0x0002        
	#define HE_CONFIG_READ_FAIL						0x0003
	#define HE_COMMAND_SET_FAIL                     0x0004        
	#define HE_STATUS_CHECK_FAIL                    0x0005        
	#define HE_Base1_NOT_IO                         0x0006        
	#define HE_Base2_NOT_IO                         0x0007        
	#define HE_Base3_NOT_IO                         0x0008        
	#define HE_Base4_NOT_IO                         0x0009        
	#define HE_Base5_NOT_IO                         0x000a        
	#define HE_Base6_NOT_IO                         0x000b        
	#define HE_NOTRAP_OPREG                         0x000c        
	#define HE_NOTRAP_BDATA                         0x000d        
	#define HE_NOTRAP_ACTRL                         0x000e        
	#define HE_NOTRAP_BCTRL                         0x000f        
	#define HE_No_String_IO                         0x0010        
	#define HE_No_Rep_IO                            0x0011        
	#define HE_No_Addr_32_IO                        0x0012        
	#define HE_No_Reverse_IO                        0x0013        
	#define HE_CloseNotOpen                         0x0014        
	#define HE_AlreadyOpenOther                     0x0015        
	#define HE_CloseNotOurs                         0x0016        
	#define HE_IllegalBoard                         0x0017        
	#define HE_IllegalDevice                        0x0018        
	#define HE_NOTRAP_JTAG                          0x0019        
	#define HE_UnexpectedIoTrap                     0x001a        
	#define HE_Unsupported                          0x001b        

	#define HE_ReadTimeout							0x001c
	#define HE_WriteTimeout							0x001d
	#define HE_MMReadInProgress                     0x001e        
	#define HE_MMWriteInProgress                    0x001f         
	#define HE_FailedAllocatePerVM                  0x0020
	#define HE_HEPC8_DETECT_FAIL                    0x0021        
	#define HE_MMAP_FAIL							0x0022

	#define HE_IoInProgress                         0x0023        

	#define HE_UnknownCommand                       0x0026
	
	#define HE_NOTRAP_Interrupt                     0x0028
	#define HE_AlreadyOpenUs                        0x0029        
   	
	#define HE_OnlyBNoInterrupts                    0x002b
	
	#define HE_UnlockNotLocked                      0x002f
	
	#define HE_PbUnlockNotLocked                    0x0031

	#define HE_NULLCallbackAddress                  0x0033
	
	#define HE_ReadContinuousOnlyOnMM               0x0035
	
	#define HE_FailedAllocateReadPhysical           0x0037
	
	#define HE_FailedAllocateIRQ9AtCriticalInit     0x0039
	#define HE_Fatal                                0x003a        
	
	#define HE_IOLIB_INIT_FAIL			0x003f
	#define HE_HEPC9_DETECT_FAIL                    0x0040        

	/*#define HE_UnknownDevice                        0x1000 */

	#define HE_Hep3aVxdMissing                      0x1002
	#define HE_AllocFailed							0x1003
	
	#define HE_LockFailed							0x1025
	#define HE_OpenFailed                           0x1027        
	#define HE_CloseFailed                          0x1028        

	#define HE_NoMMBuffersSpecified					0x1100
	#define HE_MMBufferSizeTooLarge					0x1101
	#define HE_MMBufAddrTooHigh						0x1102
	#define HE_MMBufferSizeTooSmall					0x1103

	#define HE_IllegalCount                         0x2001        
	#define HE_IllegalBoardType						0x2002
	#define HE_UnknownError							0x2003
	#define HE_FreeFailed							0x2004
	#define HE_UnlockFailed							0x2005
	#define HE_InvalidBuffer						0x2006
	#define HE_UnsupportedOperatingSystem			0x2007
	#define HE_ResetFailed							0x2008
	#define HE_JtagReadFailed						0x2009
	#define HE_JtagWriteFailed						0x200a
	#define HE_InitIoStatusFailed					0x200b
	#define HE_WaitForIoFailed						0x200c
	#define HE_TestIoFailed							0x200d
	#define HE_GetIoGranularityFailed				0x200e
	#define HE_GetDriverStatusFailed				0x200f
	#define HE_ReadFailed							0x2010
	#define HE_WriteFailed							0x2011
	#define HE_ConfigFailed							0x2012
	#define HE_SignalFailure						0x2013
	#define HE_WaitEventFailed						0x2014
	#define HE_CreateEventFailed					0x2015
	#define HE_ClearEventFailed						0x2016
	#define HE_IllegalHandle						0x2017
	#define HE_UnableToCreateOpenLock				0x2018
	#define HE_ThreadTerminationError				0x2019
	#define HE_ThreadTerminated						0x201a
	#define HE_UnableToCloseLock					0x201b
	#define HE_VddAttachFailed						0x201c
	#define HE_VddNotAttached						0x201d
	#define HE_ExceededMaxDevices					0x201e
	#define HE_NoInputAvailable						0x201f
	#define HE_NullHandlePointer					0x2020
	#define HE_InvalidHandlePointer					0x2021
	#define HE_HandlePointerNotNull					0x2022
	#define HE_FailedToAllocMemoryForHandle			0x2023
	#define HE_HandleInUse							0x2024
	#define HE_IoStatusChainNotEmpty				0x2025
	#define HE_HandleNotInUse						0x2026
	#define HE_ReadAlreadyInProgress                0x2027
	#define HE_WriteAlreadyInProgress               0x2028         
	#define HE_FailedDeleteRing0EventHandle			0x2029
	#define HE_VxDOpenFailed						0x202a
	#define HE_VxDCloseFailed						0x202b
	#define HE_VxDCreateFailed						0x202c
	#define HE_UnknownOpenSwitch					0x202d
	#define HE_ByteSwapNotSupported					0x202e
	#define HE_ByteSwapFailed						0x202f
	#define HE_IoCancelled							0x2030
	#define HE_JtagDisabled							0x2031
	#define HE_VTDVxdMissing						0x2032

#ifdef _VXWORKS
	#define INVALID_HANDLE_VALUE					0x2033
	#define ERROR_IO_PENDING						0x2034
#endif

	#define HE_GetIntsStatusFailed					0x2035
	#define HE_ModTypeFailed						0x2036
	#define HE_IntsStatusFailed						0x2037
	#define HE_PingIntFailed						0x2038
	#define HE_GetBoardInfoFailed					0x2039
	#define HE_InterruptsDisabled					0x2040
	#define HE_TimeOut								0x2041
	#define HE_VxDIsDisabled						0x2042
	#define HE_HSBInitFailed						0x2043
	#define HE_HSBMasterFailed						0x2044
	#define HE_HSBSlaveFailed						0x2045
	#define HE_HSBListenFailed						0x2046
	#define HE_HSBMsgNotForUs						0x2047
	#define HE_HSBReceiveMessageFailed				0x2048
	#define HE_HSBMsgMissingBytes					0x2049
	#define HE_HSBMsgWrongSlot						0x2050
	#define HE_HSBReadFailed						0x2051
	#define HE_HSBWriteFailed						0x2052

	#define HE_InvalidRemoteHandle					0x2053
	#define HE_RemoteMallocFailed					0x2054
	#define HE_HSBStartSendMessageFailed			0x2055
	#define HE_HSBSendMessageDataFailed				0x2056
	#define HE_HSBEndOfSendMessageFailed			0x2057
	#define HE_HSBStartReceiveMessageFailed			0x2058
	#define HE_HSBReceiveMessageDataFailed			0x2059
	#define HE_HSBEndOfReceiveMessageFailed			0x205a
	#define HE_DetectOperatingSystemRemoteFailed	0x205b
	#define HE_HSBNotExistID						0x205c
	#define HE_GetVersionFailed						0x206c
	#define HE_HSBFlushFailed						0x206d
	#define HE_HSBSurplusBytes						0x206e
	#define HE_IoctlFailed							0x206f
	#define HE_ReadBusy								0x2070
	#define HE_WriteBusy							0x2071
	#define HE_SemCreateFailed						0x2072
	#define HE_DeleteEventFailed					0x2073
	#define HE_ParameterNullPointer					0x2074
	#define HE_HSBBufferTooSmall					0x2075
	#define HE_HSBAbortFailed						0x2076
	#define HE_HSBAcknowledgeFailed					0x2077
	#define HE_JTAGEnvVarParseFailed				0x2080

	#define HE_HSBBusy								0x2081
	#define HE_HSBGetSemFailed						0x2082
	#define HE_HSBHsbPutSemFailed					0x2083
	#define HE_FifoReadBusy							0x2084
	#define HE_FifoReadGetSemFailed					0x2085
	#define HE_FifoReadPutSemFailed					0x2086
	#define HE_FifoWriteBusy						0x2087
	#define HE_FifoWriteGetSemFailed				0x2088
	#define HE_FifoWritePutSemFailed				0x2089

	#define HE_JtagConfigureFailed					0x2100

	#define HE_UNKNOWN_OS					300
	#define HE_WINDOWS_NT					301
	#define HE_WINDOWS_95					302
	#define HE_WIN32S						303
	#define HE_WIN31						304
	#define HE_MSDOS						305
	#define HE_LINUX						306
	#define HE_VXWORKS						307
	#define HE_REMOTE_SYSTEM				308
	#define HE_RTOS32						309
	#define HE_UNDETECTED_OS				400

    #define HE_HANDLE_TYPE					0xdeafeed0
    #define HE_MEMHANDLE_TYPE				0xdeafeed1
	#define HE_IOSTATUS_TYPE				0xdeafeed2
	
	#define HE_Switch_Last					0x00000000
	#define HE_Switch_NoLockFile			0xdcba0001
	#define HE_Switch_ByteSwap				0xdcba0002
	#define HE_Switch_NoPCIMasterMode 		0xdcba0003
	#define HE_Switch_NoInterrupts			0xdcba0004
	#define HE_Switch_IRQ10					0xdcba0005
	#define HE_Switch_IRQ11					0xdcba0006
	#define HE_Switch_IRQ12					0xdcba0007
	#define HE_Switch_IRQ15					0xdcba0008
	#define HE_Switch_TestInterrupt			0xdcba0009
	#define HE_Switch_UseAio				0xdcba000a
	#define HE_Switch_WrThrPriority			0xdcba000b
	#define HE_Switch_RdThrPriority			0xdcba000c
	#define HE_Switch_MMBufSize				0xdcba000d
	#define HE_Switch_NoFifoSemaphores		0xdcba000e
	#define HE_Switch_NoHSBSemaphores		0xdcba000f

	#define HE_Get_ModuleTypes				0x0000
	#define HE_Get_Config					0x0001
	
	#define HEJTAG_SLAVE					0x0
	#define HEJTAG_STANDALONE				0x1
	#define HEJTAG_MASTER					0x3

	#define HEVersion						170

#endif

#ifdef __cplusplus
	}
#endif
