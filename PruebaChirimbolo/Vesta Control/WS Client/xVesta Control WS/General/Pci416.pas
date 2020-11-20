unit Pci416;

interface

uses
  Windows;

type
  PWordArray = ^TWordArray;
  TWordArray = array[0..0] of word;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// TIMER.H
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

const
  SEL0   = $00;  // select counter # 0
  SEL1   = $40;  // select counter # 1
  SEL2   = $80;  // select counter # 2
  LSBMSB = $30;  // load lsb followed by msb
  MODE0  = $00;  // modes
  MODE1  = $02;

const  // 8254 Constants
  MODE2    = $04;      // software trigger
  MODE3    = $06;
  MODE4    = $08;      // hardware trigger
  MODE5    = $0A;
  BINARY   = $00;      // binary count
  BCD      = $01;      // bcd count
  READBACK = $C0;      // read back counter command
  CLOCK1   = 8000000;  // clock frequency for Sample rate counter (1)
  CLOCK2   = 500000;   // clock frequency for internal trigger rate(2)

const
  TM_SINGLE_TRIGGER = 0;
  TM_CONT_TRIGGER   = 1;
  TM_RESET_TRIGGER  = 2;
  TM_ADCLOCK        = 3;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// PCI416DF.H
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

const
  FFIFO = $2000;  // samples = WORDS
  HFIFO = $1000;  // samples

  CAPS_SIZE = 5;  // number of ULONGS for Caps buffer

// PASS THRU ADDRESS REGISTER LATCH
  ARL_CMD_STS_REG	  = 0;
  ARL_SMPLCNT_FIFORD      = 4;
  ARL_CHADDRREG_CLEARFIFO = 8;
  ARL_AD_ENABLE           = 12;
  ARL_PLLREG              = 16;

  ARL_CNTR0        = 0;
  ARL_CNTR1        = 4;
  ARL_CNTR2        = 8;
  ARL_CNT_CTRL_REG = 12;

  ARL_PORTA         = 16;
  ARL_PORTB         = 20;
  ARL_PORTC         = 24;
  ARL_PORT_CTRL_REG = 28;

  ARL_DAC_REG = 32;

// Bit masks for register write operations
  RWF_OVR = $00;  // reg = newval   ONLY
  RWF_OR  = $01;  // reg |= newval  ONE OPTION
  RWF_AND = $02;  // reg &= newval  VALID AT THE TIME
  RWF_RB  = $80;  // read back register value if register is r/w
                  // can be set with one of the above

// DMA mode flags
  DMA_SINGLE = 0;
  DMA_DOUBLE = 1;

type
  PCI416_COMMAND_REGISTER = DWORD;
{
	BITS	trigger_select   : 2;
	BITS	interrupt_select : 1;
	BITS	scan_select      : 1;
	BITS	auto_increment   : 1;
	BITS	marker_select    : 1;
	BITS	pretrigger       : 1;
	BITS	interrupt_enable : 1;
	BITS	pll              : 3;
	BITS	mux_select       : 3;
	BITS	adm_control      : 2;
	BITS	dma_on           : 1;
	BITS	spare            : 15;
}

type
  PCI416_STATUS_REGISTER = DWORD;
{
	BITS	trigger_select : 2;
	BITS	scan_select    : 1;
	BITS	auto_increment : 1;
	BITS	acquire        : 1;
	BITS	marker_select  : 1;
	BITS	pretrigger     : 1;
	BITS	analog_trigger : 1;
	BITS	model          : 4;
	BITS	arm            : 1;
	BITS	empty          : 1;
	BITS	half_full      : 1;
	BITS	full           : 1;
	BITS	spare          : 16;
}

  PCI416_SAMPLE_COUNT_REGISTER = DWORD;

  PCI416_CHANNEL_REGISTER = DWORD;
{
	BITS	channel : 4;
	BITS	scan    : 4;
	BITS	led     : 1;
	BITS	spare1  : 7;
	BITS	spare2  : 16;
}

  PCI416_CONVERT_ENABLE_REGISTER = DWORD;
{
	BITS	sparel  : 15;
	BITS	convert : 1;
	BITS    spareu  : 16;
}

  PCI416_PLL_REGISTER = DWORD;
{
	BITS	data   : 4;
	BITS	spare1 : 12;
	BITS	spare2 : 16;
}

  PCI416_DAC_REGISTER = cardinal;
{
	BITS	data   : 12;
	BITS	spare1 : 4;
        BITS	spare2 : 16;
}

type
  TYPE_FIFO_DATA = record
  case integer of
    0: (Sample : DWORD);
    1: (Low, High : word);
  end;

type
  TADM_STATS = record
    model         : word;
    bits          : word;
    channels      : word;
    fmax_single   : single;
    fmax_scan     : single;
    channel_scan  : word;
    autoincr_scan : word;
    scan_select   : word;
    scan_count    : word;
    ssh           : word;
    scycle        : word;
    minv          : single;
    maxv          : single;
    mincode       : integer;
    maxcode       : integer;
  end;

type
  PGetCaps = ^TGetCaps;
  TGetCaps = record
    sizeFIFO    : DWORD;
    bufsizeDMA  : DWORD;
    indexADM    : DWORD;
    acqmode     : DWORD;
    intrEnabled : DWORD;
  end;

type
  TBoardInfoPtr = ^TBoardInfo;
  TBoardInfo = record
    ADMindex   : cardinal;
    BusNo      : cardinal;
    SlotNo     : cardinal;
    VendorID   : cardinal;
    DeviceID   : cardinal;
    CommandR   : cardinal;
    StatusR    : cardinal;
    ClassCodeR : cardinal;
    IRLR       : cardinal;
    BADR       : array[0..5] of cardinal;
  end;

const
  Single_Trigger     = 0;
  Continuous_Trigger = 1;

const
  T_INTERNAL  = 0;
  T_EXTERNAL  = 1;
  T_ANALOG    = 2;
  T_ANALOG_FE = 3;

const
  M_DMA           = 0;
  M_HF_POLL       = 1;
  M_HF_POLL_DDISK = 2;
  M_HF_INT        = 3;

const
  D_MEM    = 0;
  D_DIRECT = 1;

const
  F_BINARY = 0;

const
  C_INTERNAL = 0;
  C_EXTERNAL = 1;

const
  R_NORMAL     = 0;
  R_BATCH      = 1;
  R_START_EXIT = 2;

const
  I_DMA = 0;
  I_HF  = 1;
  I_EOS = 2;

const
  B_NORMAL = 0;
  B_MARKER = 1;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//  416VXDIO.H
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// Device driver IOCtl functions for NT

//#define CTL_CODE( DeviceType, Function, Method, Access ) (                 \
//    ((DeviceType) << 16) | ((Access) << 14) | ((Function) << 2) | (Method) \
//)

const
  METHOD_BUFFERED   = 0;
  METHOD_IN_DIRECT  = 1;
  METHOD_OUT_DIRECT = 2;
  METHOD_NEITHER    = 3;

  FILE_ANY_ACCESS   = 0;
  FILE_READ_ACCESS  = $0001;
  FILE_WRITE_ACCESS = $0002;

  PCI416_TYPE = 40010;

// general pci functions
{******************************************************************************
 Function FIND_PCI_DEVICE_Proc
 Returns the device numbers for a given device on the PCI bus.

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer points to an array of two DWORDs
 The first array field contains the bus number.  The second field
 contains  the VendorID in the lower and deviceID in the higher WORD
 that the function searches for.

 lpDIOCtl->lpvOutBuffer points to a 32 byte large array that holds the
 device numbers found. The field after the last device number found has the
 value 0x0ff.

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************}
const
  FIND_PCI_DEVICE_PROC = 1;
  FIND_PCI_DEVICE_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0901 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function GET_PCI_DEVICE_INFO_Proc
 Returns the PCI configuration space for a given device on the PCI bus.

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (WORD*) lpDIOCtl->lpvInBuffer points to an array of two WORDs
 The first array field contains the bus number.  The second field
 contains the device ID as returned by FIND_PCI_DEVICE_Proc.

 lpDIOCtl->lpvOutBuffer points to a PCI_TYPE_CONFIG structure that
 will take the return data of the PCI configuration space.
 The size of the structure has to be at least 64 bytes, but
 no more than 260 bytes.

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value:
 Error codes as defined in winerror.h
*******************************************************************************}
const
  GET_PCI_DEVICE_INFO_PROC = 2;
  GET_PCI_DEVICE_INFO_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0902 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function WRITE_PCI_PORT_PROC
 Writes a DWORD (4 Bytes) to an output port

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer points to an array of two DWORDs
 The first array field contains the port address.  The second field
 contains the value to be written.

 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  W A R N I N G  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 This function does NOT check if the input values as well as the
 size of the input buffer (lpDIOCtl->lpvInBuffer) are valid!
 Not valid values may cause system crashes!
 If this function is used to perform operations on write only registers their
 software shadow register will become invalid. Software shadow registers keep
 track of the status of the write only registers.

 lpDIOCtl->lpvOutBuffer : should be zero

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************}
const
  WRITE_PCI_PORT_PROC = 3;
  WRITE_PCI_PORT_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0903 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function READ_PCI_PORT_PROC
 Reads a DWORD (4 Bytes) from an input port.

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer  : contains the port address.
 (DWORD*) lpDIOCtl->lpvOutBuffer : takes the value read from the port.

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  W A R N I N G  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 This function does NOT check if the input values (the port address) is valid.
 Not valid values may cause system crashes!

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************}
const
  READ_PCI_PORT_PROC = 4;
  READ_PCI_PORT_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0904 shr 2) or METHOD_BUFFERED;

// specific pci416 functions
// misc. functions

{******************************************************************************
 Function PCI416_COUNT_PROC
 Returns the number of PCI416 Boards

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS data structure.

 lpDIOCtl->lpvInBuffer          : should be 0
 (DWORD*)lpDIOCtl->lpvOutBuffer : holds the number of boards

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************}
const
  PCI416_COUNT_PROC = 5;
  PCI416_COUNT_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0905 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_GET_CM_DEVNODES_PROC
 Returns the DEVNODEs assigned by the Configuration Manager for PCI416 Boards

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (INT*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                the boards is determind by the Windows 95
                                Configuration Manager.
                                Values:
                                  -1   : The devnodes of all the PCI416 boards
                                         are returned in lpDIOCtl->lpvOutBuffer.
                                  n>=0 : The devnode of the board with index n
                                         is returned in lpDIOCtl->lpvOutBuffer.

 lpDIOCtl->lpvOutBuffer : points to a DWORD array that
                          will take the devnode values.

 If lpDIOCtl->lpvInBuffer contains -1 the size of the array pointed by
 lpDIOCtl->lpvOutBuffer must be large enough to hold all the devnodes.

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST
 ERROR_INSUFFICIENT_BUFFER
*******************************************************************************}
const
  PCI416_GET_CM_DEVNODES_PROC = 6;
  PCI416_GET_CM_DEVNODES_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0906 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_GET_CMDEVINF_PROC
 Returns the PCI configuration space information of the PCI416 Boards
 
 Parameters: 
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 lpDIOCtl->lpvOutBuffer points to a PCI_TYPE_CONFIG structure that
 will take the return data of the PCI configuration space.
 The size of the structure has to be at least 64 bytes, but
 no more than 260 bytes.

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : no PCI416 board found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_HANDLE      : CM devnode not found
 ERROR_GEN_FAILURE         : Device is not functioning.
 ERROR_INVALID_DATA        : invalid pointer to out buffer or other
                             API function return error
*******************************************************************************}
const
  PCI416_GET_CMDEVINF_PROC = 7;
  PCI416_GET_CMDEVINF_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0907 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_GET_BADR_PROC
 Returns base address array of the given PCI416 board.
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (WORD*)lpDIOCtl->lpvOutBuffer : array of 6 WORDs that take base address values

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_GET_BADR_PROC = 8;
  PCI416_GET_BADR_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0908 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_GETCAPS_Proc
 Returns the Device capabilities (FIFO size, DMA buffer size,
 type of ADM module, acquisition mode.

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : array of 4 DWORDs that take the device info
                                  DWORD sizeFIFO;
                                  DWORD bufsizeDMA;
                                  DWORD indexADM;
                                  DWORD acqmode;

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_CANTREAD            : can't read registry
*******************************************************************************}
const
  PCI416_GETCAPS_PROC = 9;
  PCI416_GETCAPS_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0909 shr 2) or METHOD_BUFFERED;

// pci416 register access functions

{******************************************************************************
 Function PCI416_SET_CMDREG_PROC
 Writes to the PCI416 command register
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of two DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the write mode.
                                  (0 = overwrite, 1= OR, 2 = AND)
                                  The third field holds the value to be written
                                  to the command register.
                                  DWORD index
                                  DWORD mode
                                  DWORD cmdval

 (DWORD*)lpDIOCtl->lpvOutBuffer : returns the current value of the shadow cmd. reg.

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
*******************************************************************************}
const
  PCI416_SET_CMDREG_PROC = 10;
  PCI416_SET_CMDREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($090A shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_READ_STATUSREG_PROC
 Reads the PCI416 Status register.
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : holds the return lower word
                                  of the 32bit status register

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_READ_STATUSREG_PROC = 11;
  PCI416_READ_STATUSREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($090B shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_SMPLCNTR_PROC
 Writes to the PCI416 sample counter register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of two DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the value to be written
                                  to the sample counter register.
                                  Note: write samples-1 to the register
                                        e.g 1024 samples -> write 1023
                                  DWORD index
                                  DWORD regval

 lpDIOCtl->lpvOutBuffer : should be 0

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_SET_SMPLCNTR_PROC = 12;
  PCI416_SET_SMPLCNTR_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($090C shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_CHANADR_PROC
 Writes to the PCI416 channel address register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of three DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the write mode.
                                  (0 = overwrite, 1= OR, 2 = AND)
                                  The third field holds the value to be written
                                  to the register.
                                  DWORD index
                                  DWORD mode
                                  DWORD regval

 (DWORD*)lpDIOCtl->lpvOutBuffer : returns the current value of the shadow reg.

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
*******************************************************************************}
const
  PCI416_SET_CHANADR_PROC = 13;
  PCI416_SET_CHANADR_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($090D shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_CLEAR_FIFO_PROC
 Resets the A/D FIFO.

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : should be zero

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************}
const
  PCI416_CLEAR_FIFO_PROC = 14;
  PCI416_CLEAR_FIFO_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($090E shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_ENABLEAD_PROC
 Writes to the PCI416 A/D convert enable register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of two DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  If the value of second field 0 the A/D conversion
                                  will be disabled otherwise enabled.
                                  DWORD index
                                  DWORD regval -> 0 disable, all other enable

 lpDIOCtl->lpvOutBuffer : should be 0

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************}
const
  PCI416_ENABLEAD_PROC = 15;
  PCI416_ENABLEAD_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($090F shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_PLLREG_PROC
 Writes to the PCI416 PLL data register to set the output frequency of the
 frequency synthesizer.
 This function will cycle through the 3 counters and
 set each counter value.
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer: Array of 3 DWORDs.
                                 The first field contains the index of the board.
                                 The order of the boards is determind by the
                                 Windows 95 Configuration Manager.
                                 The next two field hold the data to be written
                                 to the A and N counter.
                                 DWORD index
                                 DWORD valA
                                 DWORD valN

 lpDIOCtl->lpvOutBuffer : should be 0

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_SET_PLLREG_PROC = 16;
  PCI416_SET_PLLREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0910 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_READ_FIFO_PROC
 Reads a block of data from the FIFO.
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of two DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field contains the number of samples
                                  to be read. If count is larger than the FIFO size
                                  the whole FIFO will be read.
                                  DWORD index
                                  DWORD count

 (DWORD*)lpDIOCtl->lpvOutBuffer : Array of count/2 DWORDs that takes the FIFO data.

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found 
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_READ_FIFO_PROC = 17;
  PCI416_READ_FIFO_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0911 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SETTIMER_PROC
 Programs the 82C54 Timer
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of 4 DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The next three fields hold the mode, the counter
                                  selector and the counter values to be set.
                                  DWORD index
                                  DWORD mode
                                  DWORD counter02
                                  DWORD counter1
  Note!
  Mode has to be one of the values as defined in timer.h
    TM_SINGLE_TRIGGER, generate a single internal trigger
    TM_CONT_TRIGGER,   generate continuous internal trigger
    TM_RESET_TRIGGER,  reset (disable) trigger
    TM_ADCLOCK         set counter 2 for A/D clock
  counter02 holds the counter value for counter 0 or 2 in TM_ADCLOCK mode
  counter1 holds the counter value for counter 1 (not used in TM_ADCLOCK mode)
  Counter values smaller than 2 will be set to 2 and values larger than 0xFFFF
  will be set to 0xFFFF.

 (DWORD*)lpDIOCtl->lpvOutBuffer : should be 0

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
*******************************************************************************}
const
  PCI416_SETTIMER_PROC = 18;
  PCI416_SETTIMER_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0912 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_PORTCTRREG_PROC
 Sets the 82C55 port control register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of two DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the register value to
                                  be written.
                                  DWORD index
                                  DWORD regval

 lpDIOCtl->lpvOutBuffer : should be 0

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not  found 
 ERROR_INSUFFICIENT_BUFFER	: invalid size of in/out buffer 
*******************************************************************************}
const
  PCI416_SET_PORTCTRREG_PROC = 19;
  PCI416_SET_PORTCTRREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0913 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_GET_PORTCTRREG_PROC
 Reads the 82C55 port control register back

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the register value to
                                  be written.
                                  DWORD index

 (DWORD*)lpDIOCtl->lpvOutBuffer : holds the return value

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************}
const
  PCI416_GET_PORTCTRREG_PROC = 20;
  PCI416_GET_PORTCTRREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0914 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_READ_PORT_PROC
 Reads from one of the 82C55 ports

 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of two DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds port to be read.
                                  DWORD index
                                  DWORD port (0==A, 1==B, 2==C)

 (DWORD*)lpDIOCtl->lpvOutBuffer : holds the return data.

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong port
*******************************************************************************}
const
  PCI416_READ_PORT_PROC = 21;
  PCI416_READ_PORT_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0915 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_WRITE_PORT_PROC
 Writes to one of the 82C55 ports
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of 3 DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds port to be read and the
                                  third field contains the data.
                                  DWORD index
                                  DWORD port (0==A, 1==B, 2==C)
                                  DWORD data

 (DWORD*)lpDIOCtl->lpvOutBuffer : should be 0.

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong port
*******************************************************************************}
const
  PCI416_WRITE_PORT_PROC = 22;
  PCI416_WRITE_PORT_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0916 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_WRITE_DAC_PROC
 Sets the D/A converter register.

 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of two DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds port to be read.
                                  DWORD index
                                  DWORD data

 (DWORD*)lpDIOCtl->lpvOutBuffer : should be 0.

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_WRITE_DAC_PROC = 23;
  PCI416_WRITE_DAC_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0917 shr 2) or METHOD_BUFFERED;

// FIFO polling functions

{******************************************************************************
 Function PCI416_FIFO_STATUS_PROC
 Reads the PCI416 FIFO status (bits 13-15 status reg).
 
 Parameters: 
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : holds the FIFO status bits

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_FIFO_STATUS_PROC = 24;
  PCI416_FIFO_STATUS_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0918 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_CHECK_FIFOHF_PROC
 Reads the PCI416 Half Full FIFO flag (bit 14 status reg).

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : holds the flag (0= FIFO is half full or greater)
												(1= FIFO is less than half full)

 lpDIOCtl->lpcbBytesReturned : not used, should be NULL

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_CHECK_FIFOHF_PROC = 25;
  PCI416_CHECK_FIFOHF_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0919 shr 2) or METHOD_BUFFERED;

// DMA functions
{******************************************************************************
 Function PCI416_SETUP_DMA_Proc
 Setup DMA.

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of (3)4 DWORDs that contain the index of
                                  the board, the requested DMA buffer size and
                                  the number of samples per trigger. The order
                                  of the boards is determind by the Windows 95
                                  Configuration Manager.
                                  If the requested size for the DMA buffers is
                                  larger than the size of the buffer allocated
                                  during bootup the allocated buffer size will
                                  be used. The first bufsize field is used as
                                  MWTC count.
                                  If mode is DMA_SINGLE one buffer is set up for
                                  DMA operation. In DMA_DOUBLE mode two buffers
                                  are set up that can be used as ping-pong
                                  buffers. If the sum of the requested buffer
                                  size is larger than the allocated buffer size
                                  the second buffer will be truncated.
                                  DWORD index
                                  DWORD mode;
                                  DWORD bufsize[n]
                                  n=1 if mode = DMA_SINGLE
                                  n=2 if mode = DMA_DOUBLE

 (DWORD*)lpDIOCtl->lpvOutBuffer : Array of (3)4 DWORDs that contain
                                  the DMA buffer info.
                                  DWORD hndDMAbuf : handle to first DMA buffer
                                  DWORD physAdrDMAbuf : physical address of DMA
                                                        buffer
                                  DWORD bufsizeDMA[n] : size of DMA buffer(s)
                                                        used
                                                        n=1 if mode = DMA_SINGLE
                                                        n=2 if mode = DMA_DOUBLE

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes returned.
                               (== sizeof(lpDIOCtl->lpvOutBuffer))

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
 ERROR_INVALID_HANDLE      : memory handle is invalid
******************************************************************************}
const
  PCI416_SETUP_DMA_PROC = 26;
  PCI416_SETUP_DMA_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($091A shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_STOP_DMA_PROC
 Stops DMA without disabeling A/D conversion!

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : If the buffer is not zero it will hold the
                                  value of the transfer count register (MWTC)
                                  at the time the DMA transfer was stopped.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************}
const
  PCI416_STOP_DMA_PROC = 27;
  PCI416_STOP_DMA_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($091B shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_RELOAD_DMA_PROC
 Reloads the DMA transfer count and start address!

 Parameters:
 (DWORD*) lpDIOCtl->lpvInBuffer : Array of 2 DWORDS
                                  DWORD index : Index of the board. The order of
                                                the boards is determind by the
                                                Windows 95 Configuration
                                                Manager.
                                  DWORD bufno : Valid values are 0 and 1
                                                Selects which buffer to reload
                                                for DMA op.
                                                If mode is DMA_SINGLE bufno has
                                                no effect.

(DWORD*)lpDIOCtl->lpvOutBuffer : Array of 3 DWORDs that contain
                                 the DMA buffer info.
                                 DWORD hndDMAbuf : handle to DMA buffer
                                 DWORD physAdrDMAbuf : physical address of DMA
                                                       buffer
                                 DWORD bufsizeDMA : size of DMA buffer used

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_RELOAD_DMA_PROC = 28;
  PCI416_RELOAD_DMA_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($091C shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_DMA_STATUS_PROC
 Reads the PCI416 controller interrupt control/status register ->
 DMA transfer status bit (bit18)

 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Contains the index of the board. The order of
                                  the boards is determind by the Windows 95
                                  Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : holds the DMA transfer status bits
                                  (1= interrupt generated-> transfer complete
                                   0= Bus Master op. in progress)

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_DMA_STATUS_PROC = 29;
  PCI416_DMA_STATUS_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($091D shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_READ_INTCSRREG_PROC
 Reads the PCI controller interrupt control/status register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : DWORD that contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : Return value of the register.

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_READ_INTCSRREG_PROC = 30;
  PCI416_READ_INTCSRREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($091E shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_INTCSRREG_PROC
 Writes to the PCI controller interrupt control/status register
 
 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of three DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the write mode+
                                  read back option.
                                  (0 = overwrite, 1= OR, 2 = AND
                                   + 0x80 to enable read back actual register
                                   e.g. mode = 0x81 -> write register using OR op.
                                   and then read register back)
                                  The third field holds the value to be written
                                  to the register.
                                  DWORD index
                                  DWORD mode
                                  DWORD regval

 (DWORD*)lpDIOCtl->lpvOutBuffer : returns the current value of the shadow reg.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
*******************************************************************************}
const
  PCI416_SET_INTCSRREG_PROC = 31;
  PCI416_SET_INTCSRREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($091F shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_READ_MCSRREG_PROC
 Reads the PCI controller bus master control/status register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : DWORD that contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : Return value of the register.
                                  The value returned also contains the control
                                  bits (8-31) that are saved in a shadow register
                                  by the device driver.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_READ_MCSRREG_PROC = 32;
  PCI416_READ_MCSRREG_PROC_NT = (PCI416_TYPE shr 16) or (FILE_READ_ACCESS shr 14) or ($0920 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_MCSRREG_PROC
 Writes to the PCI controller bus master control/status register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of three DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the write mode+
                                  read back option.
                                  (0 = overwrite, 1= OR, 2 = AND
                                   + 0x80 to enable read back actual register
                                   e.g. mode = 0x81 -> write register using OR op.
                                   and then read register back)
                                  The third field holds the value to be written
                                  to the register.
                                  DWORD index
                                  DWORD mode
                                  DWORD regval

 (DWORD*)lpDIOCtl->lpvOutBuffer : returns the current value of the shadow reg.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
*******************************************************************************}
const
  PCI416_SET_MCSRREG_PROC = 33;
  PCI416_SET_MCSRREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0921 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_COPY_DMABUFFER_PROC
 Copy DMA buffer to another buffer.
 
 Parameters: 
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of 4 DWORDs
                                  DWORD index : Index of the board. The order of
                                                the boards is determind by the
                                                Windows 95 Configuration
                                                Manager.
                                  DWORD bufno : Valid values are 0 and 1
                                                Selects which buffer to copy.
                                                If mode is DMA_SINGLE bufno has
                                                no effect.
                                  DWORD start : start byte
                                  DWORD count : number of bytes to copy

                                  If start is larger than the size of the
                                  selected buffer no data are copied and the
                                  function returns ERROR_INVALID_HANDLE.
                                  If start+count larger the size of the
                                  selected buffer only the remaining byte
                                  will be copied.

 (DWORD*)lpDIOCtl->lpvOutBuffer : DWORD hnddestbuf : Handle to the
                                                     destination buffer.
                                                     The size of the
                                                     destination buffer
                                                     must be at least count
                                                     bytes!

 lpDIOCtl->lpcbBytesReturned : If not NULL holds the bytes copied.


 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_HANDLE      : memory handle is invalid
*******************************************************************************}
const
  PCI416_COPY_DMABUFFER_PROC = 34;
  PCI416_COPY_DMABUFFER_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0922 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_GET_DMABUF_HNDL_PROC
 Returns the handle and size of the selected DMA buffer.

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of 3 DWORDs
                                  DWORD index : Index of the board. The order of
                                                the boards is determind by the
                                                Windows 95 Configuration
                                                Manager.
                                  DWORD bufno : Valid values are 0 and 1
                                                Selects which buffer to copy.
                                                If mode is DMA_SINGLE bufno has
                                                no effect.
                                  DWORD offset: Offset of handle to be returned.
                                                If offset is larger than the size of
                                                the allocated buffer ERROR_INVALID_HANDLE
                                                will be returned and hnddestbuf is
                                                set to NULL.


 (DWORD*)lpDIOCtl->lpvOutBuffer : Array of 2 DWORDs
                                  DWORD hndbuf : Handle to the
                                                 DMA buffer positioned
                                                 at the offset byte.
                                  DWORD bufsize : Size of the DMA buffer - offset.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_HANDLE      : memory handle is invalid
*******************************************************************************}
const
  PCI416_GET_DMABUF_HNDL_PROC = 35;
  PCI416_GET_DMABUF_HNDL_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0923 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_READ_MWARREG_PROC
 Reads the PCI controller bus master write address register

 Parameters:
 LPDIOC lpDIOCtl pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : DWORD that contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer: Return value of the register.


 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_READ_MWARREG_PROC = 36;
  PCI416_READ_MWARREG_PROC_NT = (PCI416_TYPE shr 16) or (FILE_READ_ACCESS shr 14) or ($0924 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_MWARREG_PROC
 Writes to the PCI controller bus master control/status register

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of three DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the write mode+ read back
                                  option.
                                  (0 = overwrite, 1= OR, 2 = AND
                                   + 0x80 to enable read back actual register
                                   e.g. mode = 0x81 -> write register using OR op.
                                   and then read register back)
                                  The third field holds the value to be written
                                  to the register.
                                  DWORD index
                                  DWORD mode
                                  DWORD regval

 (DWORD*)lpDIOCtl->lpvOutBuffer : returns the current value of the shadow reg.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
*******************************************************************************}
const
  PCI416_SET_MWARREG_PROC = 37;
  PCI416_SET_MWARREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0925 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_READ_MWTCREG_PROC
 Reads the PCI controller bus master write transfer count register

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : DWORD that contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.

 (DWORD*)lpDIOCtl->lpvOutBuffer : Return value of the register.
                                  The value returned also contains the control
                                  bits (8-31) that are saved in a shadow register
                                  by the device driver.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************}
const
  PCI416_READ_MWTCREG_PROC = 38;
  PCI416_READ_MWTCREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0926 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_SET_MWTCREG_PROC
 Writes to the PCI controller bus master write transfer count register

 Parameters:
 LPDIOC lpDIOCtl : pointer to DIOCPARAMETERS  data structure.

 (DWORD*) lpDIOCtl->lpvInBuffer : Array of three DWORDs.
                                  The first field contains the index of the board.
                                  The order of the boards is determind by the
                                  Windows 95 Configuration Manager.
                                  The second field holds the write mode+
                                  read back option.
                                  (0 = overwrite, 1= OR, 2 = AND
                                   + 0x80 to enable read back actual register
                                   e.g. mode = 0x81 -> write register using OR op.
                                   and then read register back)
                                  The third field holds the value to be written
                                  to the register.
                                  DWORD index
                                  DWORD mode
                                  DWORD regval

 (DWORD*)lpDIOCtl->lpvOutBuffer : returns the current value of the shadow reg.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
*******************************************************************************}
const
  PCI416_SET_MWTCREG_PROC = 39;
  PCI416_SET_MWTCREG_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0927 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function pci416_dma_pause_resume
 Pauses/ Resumes DMA

@parm Index of board.  Max. index = number of PCI-441 boards - 1
@parm  flags : 0 = resume 1 = pause

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST           : PCI416 board not found
 ERROR_SERVICE_REQUEST_TIMEOUT : time out accessing dma logic
*******************************************************************************}
const
  PCI416_PAUSE_RESUME_DMA_PROC = 40;
  PCI416_PAUSE_RESUME_DMA_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0928 shr 2) or METHOD_BUFFERED;

// NT only
{******************************************************************************
 Function PCI416_START_DMA
 start DAQ asynchronously (Windows NT only)

@parm Array of two DWORDs:
		TRGMODE: 0== PreTrigger, external trigger,
                         1== Single Internal Trigger,

		BRDINDEX:Index of board. Max. index = number of PCI-416 boards - 1

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST           : PCI416 board not found
 ERROR_SERVICE_REQUEST_TIMEOUT : time out accessing dma logic
*******************************************************************************}
const
  PCI416_START_DMA_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($0929 shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_CLOSE_DMAHNDL_PROC_NT
 Close DMA handle opend with SETUP_DMA (Windows NT only)

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************}
const
  PCI416_CLOSE_DMAHNDL_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($092A shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_MAP_MEMORY_PROC_NT
 Maps portion of the DMA buffer into user space (Windows NT only)

@parm : Array of two DWORDs:
	param[0] returns handle to beginning of DMA buffer
	param[1] size of mapped buffer

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************}
const
  PCI416_MAP_MEMORY_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($092B shr 2) or METHOD_BUFFERED;

{******************************************************************************
 Function PCI416_UNMAP_MEMORY_PROC_NT
 Unmaps mapped DMA buffer space (Windows NT only)

@parm : DWORD HANDLE : handle to be unmapped

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************}
const
  PCI416_UNMAP_MEMORY_PROC_NT = (PCI416_TYPE shr 16) or ((FILE_READ_ACCESS or FILE_WRITE_ACCESS) shr 14) or ($092C shr 2) or METHOD_BUFFERED;


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// PCI416IO.H
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

const
  DMA_THREAD_TERMINATED = STILL_ACTIVE + $1000;
  DMA_THREAD_FINISHED   = STILL_ACTIVE + $2000;

type
  PCI416_DEVICEPtr = ^PCI416_DEVICE;
  PCI416_DEVICE = record
    hndDevice : THANDLE;
    hEvent    : THANDLE;
    hThread   : THANDLE;
    ovlp      : OVERLAPPED;
    bSuccess  : BOOL;
    bDone     : BOOL;
    dwStatus  : DWORD;
    dwSuccess : DWORD;
  end;

(******************************************************************************
 Function pci416_init
 Board initialization -> opens device driver initializes all PCI416 boards
 present.

 !!!!!   This function must be called first    !!!!!!!!!!!!

 Parameters:
   WORD *brdcount: Holds the number of boards found.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST
*******************************************************************************)
function pci416_init( out brdcount : word ) : DWORD;  stdcall;
function init_nt( nDevices : DWORD ) : DWORD;  stdcall;
function init_95 : DWORD;  stdcall;

(******************************************************************************
 Function pci416_close
 Closes the device driver.

  !!!!!   This function must be called before exit DLL    !!!!!!!!!!!!

 Parameters: none

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************)
function pci416_close( brdindex : DWORD ) : DWORD;  stdcall;

////////////////////////////////////////////////////////////////////////////////
// general pci functions

(******************************************************************************
 Function find_pci_device
 Returns the device numbers for a given device on the PCI bus.

 Parameters:
 Inputs:
   WORD busno: PCI bus number.
   WORD venid: Vendor ID
   WORD deviceid: Device ID
   WORD bufsize : size of output buffer

 Outputs:
   BYTE *buf: Array that holds the
              device numbers found. The field after the last device found
              has the value 0x0ff.
              The size of the array must be the number of
              devices expected +1.
              -> minimum size: 2

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST
 ERROR_INSUFFICIENT_BUFFER
*******************************************************************************)
function find_pci_device( busno    : word;
                          venid    : word;
                          deviceid : word;
                          bufsize  : word;
                          buf      : pointer ) : DWORD;  stdcall;

(******************************************************************************
 Function get_pci_device_info
 Returns the PCI configuration space for a given device on the PCI bus.

 Parameters:
 Inputs:
   WORD busno: PCI bus number.
   WORD devno: Device number

 Outputs:
   PCI_CONFIG_SPACE *conf: Pointer to a PCI_CONFIG_SPACE structure that
                           will take the return data of the PCI configuration
                           space.
                           The size of the structure has to be at least 64 bytes,
                           but no more than 260 bytes.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST
 ERROR_INSUFFICIENT_BUFFER
*******************************************************************************)
function get_pci_device_info( busno : word;
                              devno : word;
                              conf  : pointer ) : DWORD;  stdcall;

(******************************************************************************
 Function write_pci_port
 Writes a DWORD (4 Bytes) to an output port

 Parameters:
 Inputs:
   DWORD portadr: port address
   DWORD data: data to be written

 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  W A R N I N G  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 This function does NOT check if the input values are valid!
 Not valid values may cause system crashes!
 If this function is used to perform operations on write only registers on PCI416
 boards than their software shadow register will become invalid.
 Software shadow registers keep track of the status of the write only registers.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************)
function write_pci_port( portadr : DWORD;
                         data    : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function READ_PCI_PORT_proc
 Reads a DWORD (4 Bytes) from an input port

 Parameters:
 Inputs:
   DWORD portadr: port address

 Outputs:
   DWORD *data: Data read.

 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  W A R N I N G  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 This function does NOT check if the input values (the port address) is valid.
 Not valid values may cause system crashes!

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************)
function read_pci_port( portadr : DWORD;
                        data    : PDWORD ) : DWORD;  stdcall;

// specific pci416 functions
// misc. functions

(******************************************************************************
 Function pci416_count
 Returns the number of PCI416 Boards

 Parameters:
  Inputs: none

  Outputs:
   DWORD *brdcount: number of PCI416 boards found

 Return value:
 Error codes as defined in winerror.h
 NOERROR
*******************************************************************************)
function pci416_count( out brdcount : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_get_cm_devnodes
 Returns the DEVNODEs assigned by the Configuration Manager for PCI416 Boards

 Parameters:
 Inputs:
   INT brdindex: Index of board.
                 Values:
                 -1  : The devnodes of all the PCI416 boards
                       are returned in devnodeptr.
                 n>=0: The devnode of the board with index n is
                       returned in devnodeptr.
   WORD bufsize: Size of the output array.

 Outputs:
   DWORD *devnodebuf: Array that takes the devnodes returned.
                      The array must be large enough to hold the data
                      returned.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST
 ERROR_INSUFFICIENT_BUFFER
*******************************************************************************)
function pci416_get_cm_devnodes( brdindex   : integer;
                                 bufsize    : word;
                                 devnodebuf : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function DWORD pci416_get_cmdevinf
 Returns the PCI configuration space information of the PCI416 Boards

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   PCI_CONFIG_SPACE *conf: Pointer to a PCI_CONFIG_SPACE structure that
                           will take the return data of the PCI configuration
                           space.
                           The size of the structure has to be at least 64 bytes,
                           but no more than 260 bytes.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : no PCI416 board found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_HANDLE      : CM devnode not found
 ERROR_GEN_FAILURE         : Device is not functioning.
 ERROR_INVALID_DATA        : invalid pointer to out buffer or other
                             API function return error
*******************************************************************************)
function pci416_get_cmdevinf( brdindex : DWORD;
                              conf     : pointer ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_get_badr
 Returns base address array of the given PCI416 board.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD bufsize : Size of output buffer.

 Outputs:
   WORD *badrbuf: Array that take base address values. The array must hold
                  at least 6 values!

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
*******************************************************************************)
function pci416_get_badr( brdindex : DWORD;
                          bufsize  : word;
                          badrbuf  : PWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_getcaps
 Returns the Device capabilities (FIFO size, DMA buffer size,
 type of ADM module, acquisition mode.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD bufsize : Size of output buffer.

 Outputs:
   DWORD *buf: array of 4 DWORDs that take the device info
               DWORD sizeFIFO;
               DWORD bufsizeDMA;
               DWORD indexADM;
               DWORD acqmode;

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_CANTREAD            : can't read registry
*******************************************************************************)
function pci416_getcaps(     brdindex : DWORD;
                             bufsize  : word;
                         out buf      : TGetCaps ) : DWORD;  stdcall;

////////////////////////////////////////////////////////////////////////////////
// pci416 register access functions

(******************************************************************************
 Function pci416_set_cmdreg
 Writes to the PCI416 command register

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD mode : write mode (0 = overwrite, 1= OR, 2 = AND)
   DWORD regval: value to be written

 Outputs:
   DWORD *shregval: Current value of the shadow cmd. reg.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not found
 ERROR_INVALID_PARAMETER	: wrong mode
*******************************************************************************)
function pci416_set_cmdreg( brdindex : DWORD;
                            mode     : word;
                            regval   : DWORD;
                            shregval : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_read_statusreg
 Reads the PCI416 Status register.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *regval: Return value of the 32bit status register.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not found
*******************************************************************************)
function pci416_read_statusreg( brdindex : DWORD;
                                regval   : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_smplcntr
 Writes to the PCI416 sample counter register

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD samples : Number of samples.
                   Note: Functions writes samples-1 to the register
                         e.g 1024 samples -> writes 1023
                   see PCI-416 documentation

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************)
function pci416_set_smplcntr( brdindex : DWORD;
                              samples  : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_chanadr
 Writes to the PCI416 channel address register

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD mode : write mode (0 = overwrite, 1= OR, 2 = AND)
   DWORD regval: value to be written

 Outputs:
   DWORD *shregval: Current value of the shadow register.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not  found
 ERROR_INVALID_PARAMETER	: wrong mode
*******************************************************************************)
function pci416_set_chanadr( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_clear_fifo
 Resets the A/D FIFO.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not found
*******************************************************************************)
function pci416_clear_fifo( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_enablead
 Writes to the PCI416 A/D convert enable register

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   BOOL enable : TRUE= enable, FALSE=disable

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not  found
*******************************************************************************)
function pci416_enablead( brdindex : DWORD;
                          enable   : BOOL ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_pllreg
 Writes to the PCI416 PLL data register to set the output frequency of the
 frequency synthesizer.
 This function will cycle through the 3 counters and
 set each counter value.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD valA : Counter value Counter A
   DWORD valN : Counter value Counter N

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not  found
*******************************************************************************)
function pci416_set_pllreg( brdindex : DWORD;
                            valA     : DWORD;
                            valN     : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_read_fifo
 Reads a block of data from the FIFO.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD count   : Number of samples to be read.
                  If count is larger than the FIFO size
                  the whole FIFO will be read.
   DWORD *buf: Array of count/2 DWORDs that takes the FIFO data.
               The buffer size must be at least 2*count bytes!

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not found
 ERROR_INSUFFICIENT_BUFFER	: invalid size of in/out buffer
*******************************************************************************)
function pci416_read_fifo( brdindex : DWORD;
                           count    : word;
                           buf      : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_timer
 Programs the 82C54 Timer

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD mode    : Mode has to be one of the values as defined in timer.h
                  TM_SINGLE_TRIGGER, generate a single internal trigger
                  TM_CONT_TRIGGER,   generate continuous internal trigger
                  TM_RESET_TRIGGER,  reset (disable) trigger
                  TM_ADCLOCK         set counter 2 for A/D clock
   WORD counter02: Counter02 holds the counter value for counter 0
                   or counter 2 in TM_ADCLOCK mode respectively.
   WORD counter1 : Counter1 holds the counter value for counter 1
                   (not used in TM_ADCLOCK mode).

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST     : PCI416 board not  found
 ERROR_INVALID_PARAMETER : wrong mode
*******************************************************************************)
function pci416_set_timer( brdindex  : DWORD;
                           mode      : word;
                           counter02 : word;
                           counter1  : word ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_portctrreg
 Sets the 82C55 port control register

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD regval : Register value to be written.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************)
function pci416_set_portctrreg( brdindex : DWORD;
                                regval   : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_get_portctrreg
 Reads the 82C55 port control register back

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *regval : Holds the register value read.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************)
function pci416_get_portctrreg( brdindex : DWORD;
                                regval   : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_read_port
 Reads from one of the 82C55 ports

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD port    : (0==A, 1==B, 2==C)

 Outputs:
   DWORD *data : Holds the data read.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST     : PCI416 board not  found
 ERROR_INVALID_PARAMETER : wrong port
*******************************************************************************)
function pci416_read_port( brdindex : DWORD;
                           port     : word;
                           data     : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_write_port
 Writes to one of the 82C55 ports

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD port    : (0==A, 1==B, 2==C)
   DWORD data	 : Data to be written.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST     : PCI416 board not  found
 ERROR_INVALID_PARAMETER : wrong port
*******************************************************************************)
function pci416_write_port( brdindex : DWORD;
                            port     : word;
                            data     : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_write_dac
 Sets the D/A converter register.
  
 Parameters: 
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD data	 : Data to be written.

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************)
function pci416_write_dac( brdindex : DWORD;
                           data     : word ) : DWORD;  stdcall;

////////////////////////////////////////////////////////////////////////////////
// FIFO polling functions

(******************************************************************************
 Function pci416_fifo_status
 Reads the PCI416 FIFO status (bits 13-15 status reg).

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *data	 : Holds the FIFO status bits.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************)
function pci416_fifo_status( brdindex : DWORD;
                             data     : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_check_fifohf
 Reads the PCI416 Half Full FIFO flag (bit 14 status reg).
 
 Parameters: 
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *data : Holds the status of the FIFO HF flag.
                 (0= FIFO is half full or greater)
	   	 (1= FIFO is less than half full)

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************)
function pci416_check_fifohf( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  stdcall;

////////////////////////////////////////////////////////////////////////////////
// DMA functions

(******************************************************************************
 Function pci416_setup_dma
 Setup DMA.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD mode: DMA_SINGLE or DMA_DOUBLE
   DWORD *bufsize: requested size of DMA buffer(s)

 Outputs:
   DWORD *bufsize: size of allocated DMA buffer(s)
   DWORD *hndDMAbuf : handle to first DMA buffer

 Note: if mode = DMA_DOUBLE bufsize must point to an array of 2 DWORDs!

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_PARAMETER   : wrong mode
 ERROR_INVALID_HANDLE      : memory handle is invalid
*******************************************************************************)
type
  TDMASizes   = array[0..1] of DWORD;
  TDMAHandles = array[0..1] of PWordArray;

function pci416_setup_dma(     brdindex  : DWORD;
                               mode      : DWORD;
                           var bufsize   : TDMASizes;
                           out hndDMAbuf : PWordArray ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_stop_dma
 Stops the A/D conversion and DMA!

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *tcount: Remainder value of transfer count register after DMA stopped.
	          Parameter can be NULL.
	
 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************)
function pci416_stop_dma(     brdindex : DWORD;
                          out tcount   : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_reload_dma
 reloads the DMA transfer count and start address!
 
 Parameters: 
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD bufno : Valid values are 0 and 1
                 Selects which buffer to reload for DMA operation.
                 If setup mode is DMA_SINGLE bufno has no effect.

 Outputs:
   DWORD *bufsize: size of allocated DMA buffer
   DWORD *hndDMAbuf : handle to DMA buffer

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************)
function pci416_reload_dma(     brdindex  : DWORD;
                                bufno     : DWORD;
                            var bufsize   : DWORD;
                            out hndDMAbuf : PWordArray ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_dma_status
 Reads the PCI416 controller interrupt control/status register ->
 DMA transfer status bit (bit18)

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *data : Holds the DMA transfer status bits
                 (1= interrupt generated-> transfer complete
                  0= Bus Master op. in progress)

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not found
*******************************************************************************)
function pci416_dma_status(     brdindex : DWORD;
                            out data     : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_read_intcsrreg
 Reads the PCI controller interrupt control/status register
 
 Parameters: 
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *data	 : Holds register data read.

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************)
function pci416_read_intcsrreg( brdindex : DWORD;
                                data     : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_intcsrreg
 Writes to the PCI controller interrupt control/status register
 
 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD mode : write mode (0 = overwrite, 1= OR, 2 = AND
                           + 0x80 to enable read back actual register
                           e.g. mode = 0x81 -> write register using OR op.
                           and then read register back)
   DWORD regval: value to be written

 Outputs:
   DWORD *shregval: Current value of the shadow INTCSR reg.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST     : PCI416 board not  found
 ERROR_INVALID_PARAMETER : wrong mode
*******************************************************************************)
function pci416_set_intcsrreg( brdindex : DWORD;
                               mode     : word;
                               regval   : DWORD;
                               shregval : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_read_mcsrreg
 Reads the PCI controller bus master control/status register

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Outputs:
   DWORD *data : Holds register data read.
                 The value returned also contains the control
                 bits (8-31) that are saved in a shadow register
                 by the device driver.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************)
function pci416_read_mcsrreg( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_mcsrreg
 Writes to the PCI controller bus master control/status register

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   WORD mode : write mode (0 = overwrite, 1= OR, 2 = AND
                           + 0x80 to enable read back actual register
                           e.g. mode = 0x81 -> write register using OR op.
                           and then read register back)
   DWORD regval: value to be written

 Outputs:
   DWORD *shregval: Current value of the shadow reg.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST     : PCI416 board not  found
 ERROR_INVALID_PARAMETER : wrong mode
*******************************************************************************)
function pci416_set_mcsrreg( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_read_mwarreg
 Reads the PCI controller bus master write address register (MWAR)

 Parameters:
 Inputs:
   DWORD brdindex : Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD *data : Holds register data read.

 Return value:
 Error codes as defined in winerror.h -
 NOERROR,
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************)
function pci416_read_mwarreg( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_mwarreg
 Writes to the PCI controller bus master write address SHADOW register
 NOTE: Normally the device driver handles the DMA buffer Addressing. This function
       was created to allow USERS with dedicated memory on other devices to redirect
       the pci416 data during DMA to such devices. The value is written to a shadow register.
       If the shadow register is non-zero, the contents of the shadow register is loaded into
       the hardware register when the pci416_setup_dma function is called.
       This value must be a Physical not a Virtual address.
       Setting the value to zero will cause pci416_setup_dma to load the address of the
       reserved DMA buffer.By default the shadow register is loaded with zeros so this
       function does not have to be called under "normal" circumstances.

 Parameters:
 Inputs:
   DWORD brdindex : Index of board.  Max. index = number of PCI-416 boards - 1
   WORD mode : write mode (0 = overwrite, 1= OR, 2 = AND)
   DWORD regval : value to be written
   DWORD *shregval : Current value of the shadow reg.

 Return value:
 Error codes as defined in winerror.h -
 NOERROR,
 ERROR_DEV_NOT_EXIST     : PCI416 board not  found ,
 ERROR_INVALID_PARAMETER : wrong mode
*******************************************************************************)
function pci416_set_mwarreg( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_read_mwtcreg
 Reads the PCI controller bus master write transfer count register (MWTC)

 Parameters:
 Inputs:
   DWORD brdindex : Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD *data : Holds register data read.

 Return value:
 Error codes as defined in winerror.h -
 NOERROR,
 ERROR_DEV_NOT_EXIST : PCI416 board not  found
*******************************************************************************)
function pci416_read_mwtcreg( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_set_mwtcreg
 Writes to the PCI controller bus master write transfer count register (MWTC)
 NOTE: Normally the device driver handles the DMA count register.  This function
       was created to allow USERS with dedicated memory on other devices to redirect
       the pci416 data during DMA to such devices.
       The value is written to a shadow register.
 If the shadow register is non-zero, the contents of the shadow register
 is loaded into the hardware register when the pci416_setup_dma function is called.
 Setting the value to zero will cause pci416_setup_dma to load the count from the
 DMA bufsize. By default the shadow register is loaded with zeros so this
 function does not have to be called under "normal" circumstances.

 Parameters:
 Inputs:
   DWORD brdindex : Index of board.  Max. index = number of PCI-416 boards - 1
   WORD mode : write mode (0 = overwrite, 1= OR, 2 = AND)
   DWORD regval : value to be written
   DWORD *shregval : Current value of the shadow reg.

 Return value:
 Error codes as defined in winerror.h -
 NOERROR,
 ERROR_DEV_NOT_EXIST	 : PCI416 board not  found,
 ERROR_INVALID_PARAMETER : wrong mode
*******************************************************************************)
function pci416_set_mwtcreg( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_copy_dmabuffer
 reloads the DMA transfer count and start address!

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD bufno : Valid values are 0 and 1
                 Selects from which buffer to copy.
                 If setup mode is DMA_SINGLE bufno has no effect.
   DWORD start : start byte
   DWORD *count : number of bytes to copy
                  If start is larger than the size of the
                  selected buffer no data are copied and the
                  function returns ERROR_INVALID_HANDLE.
                  If start+count larger the size of the
                  selected buffer only the remaining byte
                  will be copied.
   DWORD *pDest : Destination buffer
                  The size of the destibation buffer must be at least
                  count bytes.
  Outputs:
    DWORD *count: number of bytes copied

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST  : PCI416 board not found
 ERROR_INVALID_HANDLE : memory handle is invalid
*******************************************************************************)
function pci416_copy_dmabuffer(     brdindex : DWORD;
                                    bufno    : DWORD;
                                    start    : DWORD;
                                var count    : DWORD;
                                out pDest ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_get_dmabuf_hndl
 Returns the handle and size of the selected DMA buffer.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD bufno : Valid values are 0 and 1
                 Selects from which buffer to copy.
                 If setup mode is DMA_SINGLE bufno has no effect.
   DWORD offset: Offset of handle to be returned.
                 If offset is larger than the size of
                 the allocated buffer ERROR_INVALID_HANDLE
                 will be returned and hnddestbuf is
                 set to NULL.

 Outputs:
   DWORD *pHndl   : Handle to the DMA buffer positioned at the offset byte.
   DWORD bufsize : Size of the DMA buffer - offset.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST       : PCI416 board not  found
 ERROR_INSUFFICIENT_BUFFER : invalid size of in/out buffer
 ERROR_INVALID_HANDLE      : memory handle is invalid
*******************************************************************************)
function pci416_get_dmabuf_hndl(     brdindex : DWORD;
                                     bufno    : DWORD;
                                     offset   : DWORD;
                                 out pHndl    : PWordArray;
                                 out bufsize  : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_close_dmabuf_hndl
 Closes the handle to the DMA buffer that was returnd by pci416_setup_dma.
 Windows NT only.
 
 Parameters: 
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST		: PCI416 board not  found
*******************************************************************************)
function pci416_close_dmabuf_hndl( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_map_dmabuf
 Map portions of the DMA buffer into user space.
 Windows NT only.
  
 Parameters: 
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD size : size of DMA buffer to map into user space

 Output:
   PVOID pHndl : user space handle

 Return value: 
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST  : PCI416 board not  found
 ERROR_INVALID_HANDLE : memory handle is invalid
*******************************************************************************)
function pci416_map_dmabuf(     brdindex : DWORD;
                            out pHndl    : PWordArray;
                                size     : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_unmap_dmabuf
 Unmap DMA buffer space that was mapped into user space with pci416_map_dmabuf.
 Windows NT only.

 Parameters:
 Inputs:
   DWORD brdindex: Index of board.  Max. index = number of PCI-416 boards - 1
   PVOID pHndl	: handle to unmap

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST  : PCI416 board not  found
 ERROR_INVALID_HANDLE : memory handle is invalid
*******************************************************************************)
function pci416_unmap_dmabuf( brdindex : DWORD;
                              Hndl     : pointer ) : DWORD;  stdcall;

(******************************************************************************
 Function pci416_getError
 Returns the last error and clears the global error variable.

 Parameters:
 Inputs: none

 Outputs:
   LPTSTR *str : pointer that gets the address of the error message
                 (not implemented for now)

 Return value:
 Error codes as defined in winerror.h
*******************************************************************************)
function pci416_getError( str : pointer ) : DWORD;  stdcall;

(******************************************************************************
 Function start_daq_irq
 start DAQ asynchronously (Windows NT only)

 Parameters:
 Inputs:
   DWORD brdindex : Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD TriggerMode : 0== PreTrigger, external trigger,
                       1== Single Internal Trigger,
                       2== Multi Internal Trigger
                       other default to single trigger
   REALTYPE *TriggerRate : trigger rate for multi trigger

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_DEV_NOT_EXIST           : PCI416 board not found
 ERROR_SERVICE_REQUEST_TIMEOUT : time out accessing dma logic
*******************************************************************************)
function start_daq_irq(     brdindex    : DWORD;
                            TriggerMode : DWORD;
                        var TriggerRate : double ) : DWORD;  stdcall;

(******************************************************************************
 Function daq_irq
 start DAQ asynchronously and wait for completion (Windows NT only)

 Parameters:
 Inputs:
   DWORD brdindex : Index of board.  Max. index = number of PCI-416 boards - 1
   DWORD TriggerMode : 0== PreTrigger, external trigger,
                       1== Single Internal Trigger,
                       2== Multi Internal Trigger
                       other default to single trigger
   DWORD TimeOut : Time out for wait operation

 Return value:
 Error codes as defined in winerror.h
 NOERROR,
 ERROR_DEV_NOT_EXIST           : PCI416 board not found
 ERROR_SERVICE_REQUEST_TIMEOUT : time out accessing dma logic
*******************************************************************************)
function daq_irq( brdindex    : DWORD;
                  TriggerMode : DWORD;
                  TimeOut     : DWORD ) : DWORD;  stdcall;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// PCI416_32.H
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

(******************************************************************************
 Function get_adm_inf
 Returns specific info of installed A/D module.
 Use this function instead the get_adm_stats function for DLL calls.
 The get_adm_stats function expects a pointer to an ADM_STATS
 structure which is only available in C programs. Other compilers and
 programs may generate structures with different size and boundaries
 that could cause sytem crashes!

 Parameters:
 Inputs:
   DWORD brdindex : Index of board. Max. index = number of PCI-416 boards - 1
   Char *model  : ADM model
   WORD *bits : Resolution in bits
   WORD *channels : no.of channels
   WORD *shortcycle : 1== can be short cycled
   REALTYPE *fmax_single:  max. sample freq. single channel mode
   REALTYPE *fmax_scan:  max. sample freq. multi channel mode

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_INVALID_HANDLE
 ERROR_DEV_NOT_EXIST
******************************************************************************)
function get_adm_inf(     brdindex    : DWORD;
                      out model       : word;
                      out bits        : word;
                      out channels    : word;
                      out shortcycle  : word;
                      out fmax_single : double;
                      out fmax_scan   : double ) : DWORD;  stdcall;

(******************************************************************************
 Function set_modes
 Setup board paramters: sample rate, trigger rate, clock and trigger
 source etc.

 Parameters:
 Inputs:
   DWORD brdindex : Index of board. Max. index = number of PCI-416 boards - 1
   WORD ClockSrc  : 0= C_INTERNAL, 1= C_EXTERNAL,
                    other : internal with sample rate set to
                            max. value in scan mode.
   REALTYPE SampleRate : A/D sample rate, if src set to INTERNAL
                         If ClockSrc is not set to INTERNAL or
                         EXTERNAL the sample rate is set to
                         max. value in scan mode.
   DWORD SamplesPerTrigger: Number of samples to collect
                            at each trigger pulse.
   WORD TriggerSrc : 0= T_INTERNAL,1 = T_EXTERNAL,
                     2= T_ANALOG Rising Edge, 3= T_ANALOG_FE Falling Edge,
                     other: INTERNAL
   WORD Channel : channel of acquisition in single channel mode
                  or last scan channel in scan mode if applicable
                  0 <= Channel < number of channels
   WORD PreTrigger : 1== PreTrigger
   WORD Scan : 1== Scan mode
   WORD Marker : 1== set marker bit

 Return value:
 Error codes as defined in winerror.h
 NOERROR
 ERROR_INVALID_HANDLE
 ERROR_DEV_NOT_EXIST
******************************************************************************)
function set_modes( brdindex          : DWORD;
                    ClockSrc          : word;
                    SampleRate        : double;
                    SamplesPerTrigger : DWORD;
                    TriggerSrc        : word;
                    Channel           : word;
                    PreTrigger        : word;
                    Scan              : word;
                    Marker            : word ) : DWORD;  stdcall;

(******************************************************************************
 Function start_daq
 Starts data acquisition.
 All registers have to be set prior this function call with set_mode!

 Parameters:
 Inputs:
   DWORD brdindex : Index of board. Max. index = number of PCI-416 boards - 1
   WORD TriggerMode : 0== PreTrigger, external trigger,
                      1== Single Internal Trigger,
                      2== Multi Internal Trigger
                      other default to single trigger
   REALTYPE *TriggerRate: trigger rate for multi trigger

 Output:
   REALTYPE *TriggerRate: actual trigger rate set

 Note: If PreTrigger was selected in set_modes only an external trigger
       is valid. Calls other than start_daq(brdindex, 0) will result in
       invalid data.
       On the other hand if PreTrigger was NOT set in set_modes
       a start_daq(brdindex, 0) call does not start the A/D conversion.

 Return value:
 Error codes as defined in winerror.h
 NOERROR
******************************************************************************)
function start_daq(     brdindex    : DWORD;
                        TriggerMode : word;
                    var TriggerRate : double ) : DWORD;  stdcall;

(******************************************************************************
 Function stop_daq
 Stops data acquisition.

 Parameters:
 Inputs:
   DWORD brdindex : Index of board. Max. index = number of PCI-416 boards - 1

 Return value:
 Error codes as defined in winerror.h
 NOERROR
******************************************************************************)
function stop_daq( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Function scan_status
 Acquires data by polling on the FIFO half full flag.

 Parameters:
 Inputs:
   DWORD brdindex : Index of board. Max. index = number of PCI-416 boards - 1
   WORD ClockSrc  : C_INTERNAL, C_EXTERNAL,
                    default : internal with sample rate set to
                              max. value in scan mode.
   REALTYPE SampleRate : A/D sample rate, if src set to C_INTERNAL
                         If ClockSrc is not set to C_INTERNAL or
                         C_EXTERNAL the sample rate is set to
                         max. value in scan mode.
   DWORD TotalSamples : Total number of samples to collect
   DWORD SamplesPerTrigger: Number of samples to collect
                            at each trigger pulse.
   DWORD Frames : Number of triggers.
   WORD TriggerSrc : T_INTERNAL,T_EXTERNAL,T_ANALOG,
                     default: T_INTERNAL
   REALTYPE TriggerRate : Trigger rate
   WORD Channel : channel of acquisition in single channel mode
                  or last scan channel in scan mode if applicable
                  0 <= Channel < number of channels
   BOOL PreTrigger : TRUE== PreTrigger
   BOOL Scan : TRUE== Scan mode
   BOOL Marker : TRUE== set marker bit
   PVOID buffer : User buffer to store the A/D data

 Return value:
 state of the FIFO Full flag (0 = No overflow, 1 = FIFO FULL (overflow)
 -1 error -> retreive error with pci416_getError
******************************************************************************)
function scan_status(     brdindex          : DWORD;
                          ClockSrc          : word;
                          SampleRate        : double;
                          TotalSamples      : DWORD;
                          SamplesPerTrigger : DWORD;
                          Frames            : DWORD;
                          TriggerSrc        : word;
                          TriggerRate       : double;
                          Channel           : word;
                          PreTrigger        : BOOL;
                          Scan              : BOOL;
                          Marker            : BOOL;
                      out buffer ) : integer;  stdcall

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// PCI416LIBW95.H
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

(******************************************************************************
 Function get_adm_stats
 Returns the ADM characteristics.

 Parameters:
 Input:
  DWORD brdindex:	index of board

 Output:
   ADM_STATS *admstats : Pointer to ADM_STATS structure that gets the data.

 Return value: 0 -> no Error
               -1 -> Error retreive error with pci416_getError
*******************************************************************************)
function get_adm_stats(     brdindex : DWORD;
                        out admstats : TADM_STATS ) : integer;  stdcall;

//////////////////////////////////////////////////////////////////////////////
// PASS THROUGH (A/D control)

(******************************************************************************
 reads 8255 port control register
*******************************************************************************)
function read_pt_port_control_reg( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 set 8255 port control register
*******************************************************************************)
procedure write_pt_port_control_reg( brdindex : DWORD;
                                     val      : UINT );  stdcall;

(******************************************************************************
 Reads from one of the 8255 I/O registers ->  0=a, 1=b, 2=c
*******************************************************************************)
function read_pt_port_data( brdindex : DWORD;
                            prt      : UINT ) : DWORD;  stdcall;

(******************************************************************************
 write to one of the 8255 I/O registers ->  0=a, 1=b, 2=c
*******************************************************************************)
function write_pt_port_data( brdindex : DWORD;
                             prt      : UINT;
                             val      : UINT ) : DWORD;  stdcall;

(******************************************************************************
 Enables / Disables auto PT(A/D Data) FIFO to Bridge fifo
*******************************************************************************)
procedure enable_pt_dma_logic( brdindex : DWORD;
                              md       : UINT );  stdcall;

(******************************************************************************
 Suspends / Resumes auto PT(A/D Data) FIFO to Bridge fifo
 Returns 1 in case of time out otherwise 0
 time out count is set to 100000
*******************************************************************************)
function start_stop_pt_dma_logic( brdindex : DWORD;
                                  md       : UINT ) : DWORD;  stdcall;

(******************************************************************************
 Sets the trigger mode field in the P.thru command register
 0 - internal, 1 - ext. digital, 2 - ext. analog rising edge
*******************************************************************************)
procedure set_pt_trigger_mode( brdindex : DWORD;
                               md       : UINT );  stdcall;

(******************************************************************************
 Sets the Pass thru interrupt condition
 0 - FIFO HF, 1 - End of Scan
*******************************************************************************)
procedure set_pt_interrupt_mode( brdindex : DWORD;
                                 md       : UINT );  stdcall;

(******************************************************************************
 enables pass thru to PCI interrupt on end of scan
*******************************************************************************)
procedure enable_pt_eos_interrupt( brdindex : DWORD );  stdcall;

(******************************************************************************
 enables pass thru to PCI interrupt on half full
*******************************************************************************)
procedure enable_pt_half_full_interrupt( brdindex : DWORD );  stdcall;

(******************************************************************************
 Returns 1 if a HF or EOS PT interrupt occured
*******************************************************************************)
function read_pt_interrupt_status( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Sets/Resets the Pass Thru A/D scan select bit (used for ADM model A)
*******************************************************************************)
procedure set_pt_scan_select( brdindex : DWORD;
                              md       : UINT );  stdcall;

(******************************************************************************
 Sets/resets the Pass thru  A/D channel auto-increment bit
 1 - Autoincrement, 0 - nope
*******************************************************************************)
procedure set_pt_auto_increment( brdindex : DWORD;
                                 md       : UINT );  stdcall;

(******************************************************************************
 Sets/resets the Pass thru  A/D Marker mode select bit
 1 - mark, 0 - no marker
*******************************************************************************)
procedure set_pt_marker_select( brdindex : DWORD;
                                md       : UINT );  stdcall;

(******************************************************************************
 Enables/Disables  the Pass thru  A/D Pre-trigger mode
 1 - Pre-trigger, 0 - no pre_trigger
*******************************************************************************)
procedure set_pt_pretrigger( brdindex : DWORD;
                             md       : UINT );  stdcall;

(******************************************************************************
 Disables  the Pass thru  to Host(PCI) interrupt
*******************************************************************************)
procedure disable_pt_interrupt( brdindex : DWORD );  stdcall;

(******************************************************************************
 Clears the PCI interrupt on the S5933 Bridge
*******************************************************************************)
procedure clear_pt_interrupt( brdindex : DWORD );  stdcall;

(******************************************************************************
 Enables  the Pass thru  to Host(PCI) interrupt
*******************************************************************************)
procedure enable_pt_interrupt( brdindex : DWORD );  stdcall;

(******************************************************************************
 Set A/D clock source MUX

   FREQ SYNTH DIRECT --> A/D
        0: 20 - 40 MHz   2.50 KHz res
        1: 10 - 20 MHz   1.25 KHz res
        2: 5  - 10 MHz    625 Hz  res
        3: Freq SYNTH -> 82C54 -> A/D useful for exact freq < 5 Mhz
   OTHERS
        4: External Clock
        5: 20MHz x-tal  -->a/d
        6: 10Mhz x-tal  -->a/d
        7: 10 Mhz -> 8254-> a/d
*******************************************************************************)
procedure set_pt_ad_clock_source( brdindex : DWORD;
                                  src      : UINT );  stdcall;

(******************************************************************************
 Set A/D control bits
*******************************************************************************)
procedure set_pt_adm_control( brdindex : DWORD;
                              val      : DWORD );  stdcall;

(******************************************************************************
 Sets pass thru command register to desired value
*******************************************************************************)
procedure set_pt_command_reg( brdindex : DWORD;
                              val      : DWORD );  stdcall;

// obsolete use pci416_set_cmdreg(brdindex, mode, val, &retval) instead
(******************************************************************************
 Write current variable value to pass thru command register hardware
*******************************************************************************)
//void LIB_TYPE update_pt_command_reg(DWORD brdindex);

(******************************************************************************
 Write to the Pass-Thru Address Register Latch (ARL)
 sets hardware and software value of pt address (register select) register
*******************************************************************************)
// obsolete, use write_pci_port(DWORD portadr, DWORD data) instead
// get portadr with pci416_get_badr(DWORD brdindex, WORD *badrbuf, WORD bufsize);
// void LIB_TYPE set_pt_address_reg(DWORD brdindex,DWORD addr);

(******************************************************************************
 Reads the PT. hardware status register
 returns 0xFFFFFFFF in case of error
 use pci416_getError to retreive error code
*******************************************************************************)
function read_pt_status_reg( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Returns 1 if pass thru fifo is empty
 returns 0xFFFFFFFF in case of error
 use pci416_getError to retreive error code
*******************************************************************************)
function pt_fifo_empty( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Returns 1 if pass thru fifo is half full
 returns 0xFFFFFFFF in case of error
 use pci416_getError to retreive error code
*******************************************************************************)
function pt_fifo_half_full( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Returns 1 if pass thru fifo is full
 returns 0xFFFFFFFF in case of error
 use pci416_getError to retreive error code
*******************************************************************************)
function pt_fifo_full( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Returns 1 if data PT A/D ARM FF is SET
*******************************************************************************)
function read_pt_arm_ff( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Returns 1 if ANATRG bit of PT -SR is high
*******************************************************************************)
function read_pt_analog_trigger_status( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Returns 1 if data ACQ bit in PT -CR is high
*******************************************************************************)
function read_pt_acquire_status( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Returns the AD Module given by DIP setting
*******************************************************************************)
function read_pt_adm( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Set A/D sample count register
*******************************************************************************)
procedure set_pt_sample_count( brdindex : DWORD;
                               count    : DWORD );  stdcall;

(******************************************************************************
 Set A/D Channel field of pt channel register
*******************************************************************************)
procedure set_pt_ad_channel( brdindex : DWORD;
                             chan     : UINT );  stdcall;

(******************************************************************************
 Set A/D Scan Count field of channel register
*******************************************************************************)
procedure set_pt_ad_scan_count( brdindex : DWORD;
                                count    : UINT );  stdcall;

(******************************************************************************
 Sets Test LED bit of channel register
*******************************************************************************)
procedure set_pt_led( brdindex : DWORD;
                      val      : UINT );  stdcall;

(******************************************************************************
 Reset the PT. A/D Fifo
*******************************************************************************)
procedure reset_pt_fifos( brdindex : DWORD );  stdcall;

(******************************************************************************
 Set/Reset PT. A/D convert enable bit
*******************************************************************************)
procedure set_pt_convert_enable( brdindex : DWORD;
                                 val      : UINT );  stdcall;

(******************************************************************************
 Sets output clock frequency of PLL hardware
 And sets A/D clock source to PLL output
*******************************************************************************)
function set_pt_pll( brdindex : DWORD;
                     freq     : double ) : UINT; stdcall;

// obsolete, use pci416_set_pllreg(brdindex, valA,  valN) instead
(******************************************************************************
 writes current software value of the pll data register to hardware
*******************************************************************************)
//void LIB_TYPE update_pt_pll_reg(DWORD brdindex);

// obsolete, use pci416_set_timer(DWORD brdindex, WORD mode, WORD counter02, WORD counter1);
(******************************************************************************
 Updates 8254 counter register hardware with current software values
*******************************************************************************)
//UINT LIB_TYPE set_pt_timer(DWORD brdindex, UINT n,UINT mode,UINT count);

(******************************************************************************
 Set A/D Clock Rate
 Automatically sets best possible clock source mux and counter values
*******************************************************************************)
function set_pt_ad_clock_rate( brdindex : DWORD;
                               fs       : double ) : integer;  stdcall;

(******************************************************************************
 Set A/D Trigger Rate (timers 0,1)
 Returns (1) if error
 *actual = real trigger rate produced by hardware
*******************************************************************************)
function set_pt_trigger_rate(     brdindex : DWORD;
                                  ft       : double;
                              out actual   : double ) : UINT;  stdcall;

(******************************************************************************
 set trigger mode to internal
 generate single trigger
*******************************************************************************)
procedure generate_single_internal_trigger( brdindex : DWORD );  stdcall;

(******************************************************************************)
procedure reset_pt_trigger_timer( brdindex : DWORD );  stdcall;

(******************************************************************************
 Sets DAC hardware voltage
 assumes +-10V range
*******************************************************************************)
procedure set_pt_dac_voltage( brdindex : DWORD;
                              volts    : double );  stdcall;

(******************************************************************************
 Sets DAC hardware code
*******************************************************************************)
procedure set_pt_dac_code( brdindex : DWORD;
                           code     : UINT );  stdcall;

(******************************************************************************
 Reads 1 DWORDSfrom pt a/d sample storage fifo
 returns 0xffffffff in case of error
 get error code with pci416_getError
*******************************************************************************)
function read_pt_fifo( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Read Multiple DWORDS from pt a/d sample storage fifo
*******************************************************************************)
procedure read_pt_fifo_many( brdindex : DWORD;
                             buffer   : PDWORD;
                             count    : DWORD );  stdcall;


//////////////////////////////////////////////////////////////////////////////
// BRIDGE FUNCTIONS (S593X)

(******************************************************************************
 Resets the (Inbound) DMA FIFO on the S593x controller
*******************************************************************************)
procedure reset_dma_fifo( brdindex : DWORD );  stdcall;

(******************************************************************************
 Sets the (Inbound) DMA fif0 bus master mode 1-> request on HF
*******************************************************************************)
procedure set_dma_request_half_full( brdindex : DWORD;
                                     md       : UINT );  stdcall;

(******************************************************************************
 Enable/Disable (T/F) Bus master write transfers from FIFO
*******************************************************************************)
procedure enable_dma_transfers( brdindex : DWORD;
                                enable   : UINT );  stdcall;

(******************************************************************************
 Updates the value of the S593x Bus Master Control/Status Reg
*******************************************************************************)
// obsolete
// use pci416_set_mcsrreg(brdindex, mode, data, &retdata);
// void LIB_TYPE update_mcr(DWORD brdindex);
//

(******************************************************************************
 Updates the DMA(Write) transfer count register (count is in bytes)
*******************************************************************************)
procedure set_dma_transfer_count( brdindex : DWORD;
                                  bytes    : DWORD );  stdcall;

(******************************************************************************
 Reads the DMA(Write) transfer count register (count is in bytes)
 returns 0xffffffff in case of error
*******************************************************************************)
function read_dma_transfer_count( brdindex : DWORD ) : DWORD;  stdcall;

//  obsolete use pci416_setup_dma and pci416_reload_dma
(******************************************************************************
 Updates the DMA(Write) transfer Address register
*******************************************************************************)
//void LIB_TYPE set_dma_dest_address(DWORD brdindex, DWORD dest);

(******************************************************************************
 Reads the DMA(Write) destination addr. register
*******************************************************************************)
function read_dma_dest_address( brdindex : DWORD ) : DWORD;  stdcall;

//
// not implemented DMA does not work on interrupt
(******************************************************************************
 Enables/Disables S593x interrupt to HOST  on dma completion (Write Transfer)
*******************************************************************************)
//void LIB_TYPE enable_dma_interrupt(DWORD brdindex, UINT enable);

//
//obsolete use pci416_dma_status
(******************************************************************************
 Returns the Write(dma) transfer complete status bit (1=complete)
*******************************************************************************)
//DWORD LIB_TYPE read_dma_transfer_status(DWORD brdindex);


// not implemented DMA does not work on interrupt
(******************************************************************************
 Resets the MAILBOX INTERRUPT status bit (INTERRUPT) (write1 clRs)
*******************************************************************************)
//void LIB_TYPE reset_dma_transfer_status(DWORD brdindex);


// obsolete, use pci416_read_intcsr,
//               pci416_set_intcsr,
//               pci416_read_mcsr,
//               pci416_set_mcsr,
//               read_pci_port,
//               write_pci_port
(******************************************************************************
 Returns 1 is the the DMA(Write X-fer) FIFO on the AMCC controller is FULL
*******************************************************************************)
//DWORD LIB_TYPE dma_fifo_full(DWORD brdindex);

(******************************************************************************
 Returns 1 is the the DMA(Write X-fer) FIFO on the AMCC controller is empty
*******************************************************************************)
function dma_fifo_empty( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Reads the DMA(Write X-fer) FIFO on the AMCC controller
*******************************************************************************)
function read_dma_fifo_reg( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Updates the value of the S593x Interrupt Control/Status Reg
*******************************************************************************)
procedure update_intcsr( brdindex : DWORD );  stdcall;

(******************************************************************************
 Reads the value of the S593x Interrupt Control/Status Reg
*******************************************************************************)
function read_intcsr( brdindex : DWORD ) : DWORD;  stdcall;

(******************************************************************************
 Reads the value of the S593x Master Control/Status Reg
*******************************************************************************)
function read_msr( brdindex : DWORD ) : DWORD;  stdcall;

// functions not needed for board operation in Windows
// used for internal test only -> see DOS code p416_set
(******************************************************************************
 Checks if NVRAM access pins are busy
 returns non-zero if busy
*******************************************************************************)
function nvram_busy( brdindex : DWORD ) : integer;  stdcall;

(******************************************************************************
 Set EPROM address for Data access
*******************************************************************************)
procedure set_nvram_address( brdindex : DWORD;
                             addr     : UINT );  stdcall;

(******************************************************************************
 Read byte from NVRAM
*******************************************************************************)
function read_nvram( brdindex : DWORD;
                     addr     : UINT ) : byte;  stdcall;

(******************************************************************************
 Write byte to NVRAM
*******************************************************************************)
procedure write_nvram( brdindex : DWORD;
                       addr     : UINT;
                       data     : byte );  stdcall;

implementation

const
  PCI416DLL = 'PCI41632.DLL';

function pci416_init( out brdcount : word ) : DWORD;  external PCI416DLL;
function init_nt( nDevices : DWORD ) : DWORD;  external PCI416DLL;
function init_95 : DWORD;  external PCI416DLL;

function pci416_close( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function find_pci_device( busno    : word;
                          venid    : word;
                          deviceid : word;
                          bufsize  : word;
                          buf      : pointer ) : DWORD;  external PCI416DLL;

function get_pci_device_info( busno : word;
                              devno : word;
                              conf  : pointer ) : DWORD;  external PCI416DLL;

function write_pci_port( portadr : DWORD;
                         data    : DWORD ) : DWORD;  external PCI416DLL;

function read_pci_port( portadr : DWORD;
                        data    : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_count( out brdcount : DWORD ) : DWORD;  external PCI416DLL;

function pci416_get_cm_devnodes( brdindex   : integer;
                                 bufsize    : word;
                                 devnodebuf : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_get_cmdevinf( brdindex : DWORD;
                              conf     : pointer ) : DWORD;  external PCI416DLL;

function pci416_get_badr( brdindex : DWORD;
                          bufsize  : word;
                          badrbuf  : PWORD ) : DWORD;  external PCI416DLL;

function pci416_getcaps(     brdindex : DWORD;
                             bufsize  : word;
                         out buf      : TGetCaps ) : DWORD;  external PCI416DLL;

function pci416_set_cmdreg( brdindex : DWORD;
                            mode     : word;
                            regval   : DWORD;
                            shregval : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_read_statusreg( brdindex : DWORD;
                                regval   : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_set_smplcntr( brdindex : DWORD;
                              samples  : DWORD ) : DWORD;  external PCI416DLL;

function pci416_set_chanadr( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_clear_fifo( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function pci416_enablead( brdindex : DWORD;
                          enable   : BOOL ) : DWORD;  external PCI416DLL;

function pci416_set_pllreg( brdindex : DWORD;
                            valA     : DWORD;
                            valN     : DWORD ) : DWORD;  external PCI416DLL;

function pci416_read_fifo( brdindex : DWORD;
                           count    : word;
                           buf      : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_set_timer( brdindex  : DWORD;
                           mode      : word;
                           counter02 : word;
                           counter1  : word ) : DWORD;  external PCI416DLL;

function pci416_set_portctrreg( brdindex : DWORD;
                                regval   : DWORD ) : DWORD;  external PCI416DLL;

function pci416_get_portctrreg( brdindex : DWORD;
                                regval   : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_read_port( brdindex : DWORD;
                           port     : word;
                           data     : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_write_port( brdindex : DWORD;
                            port     : word;
                            data     : DWORD ) : DWORD;  external PCI416DLL;

function pci416_write_dac( brdindex : DWORD;
                           data     : word ) : DWORD;  external PCI416DLL;

function pci416_fifo_status( brdindex : DWORD;
                             data     : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_check_fifohf( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_setup_dma(     brdindex  : DWORD;
                               mode      : DWORD;
                           var bufsize   : TDMASizes;
                           out hndDMAbuf : PWordArray ) : DWORD;  external PCI416DLL;

function pci416_stop_dma(     brdindex : DWORD;
                          out tcount   : DWORD ) : DWORD;  external PCI416DLL;

function pci416_reload_dma(     brdindex  : DWORD;
                                bufno     : DWORD;
                            var bufsize   : DWORD;
                            out hndDMAbuf : PWordArray ) : DWORD;  external PCI416DLL;

function pci416_dma_status(     brdindex : DWORD;
                            out data     : DWORD ) : DWORD;  external PCI416DLL;

function pci416_read_intcsrreg( brdindex : DWORD;
                                data     : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_set_intcsrreg( brdindex : DWORD;
                               mode     : word;
                               regval   : DWORD;
                               shregval : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_read_mcsrreg( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_set_mcsrreg( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_read_mwarreg( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_set_mwarreg( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_read_mwtcreg( brdindex : DWORD;
                              data     : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_set_mwtcreg( brdindex : DWORD;
                             mode     : word;
                             regval   : DWORD;
                             shregval : PDWORD ) : DWORD;  external PCI416DLL;

function pci416_copy_dmabuffer(     brdindex : DWORD;
                                    bufno    : DWORD;
                                    start    : DWORD;
                                var count    : DWORD;
                                out pDest ) : DWORD;  external PCI416DLL;

function pci416_get_dmabuf_hndl(     brdindex : DWORD;
                                     bufno    : DWORD;
                                     offset   : DWORD;
                                 out pHndl    : PWordArray;
                                 out bufsize  : DWORD ) : DWORD;  external PCI416DLL;

function pci416_close_dmabuf_hndl( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function pci416_map_dmabuf(     brdindex : DWORD;
                            out pHndl    : PWordArray;
                                size     : DWORD ) : DWORD;  external PCI416DLL;

function pci416_unmap_dmabuf( brdindex : DWORD;
                              Hndl     : pointer ) : DWORD;  external PCI416DLL;

function pci416_getError( str : pointer ) : DWORD;  external PCI416DLL;

function start_daq_irq(     brdindex    : DWORD;
                            TriggerMode : DWORD;
                        var TriggerRate : double ) : DWORD;  external PCI416DLL;

function daq_irq( brdindex    : DWORD;
                  TriggerMode : DWORD;
                  TimeOut     : DWORD ) : DWORD;  external PCI416DLL;

function get_adm_inf(     brdindex    : DWORD;
                      out model       : word;
                      out bits        : word;
                      out channels    : word;
                      out shortcycle  : word;
                      out fmax_single : double;
                      out fmax_scan   : double ) : DWORD;  external PCI416DLL;

function set_modes( brdindex          : DWORD;
                    ClockSrc          : word;
                    SampleRate        : double;
                    SamplesPerTrigger : DWORD;
                    TriggerSrc        : word;
                    Channel           : word;
                    PreTrigger        : word;
                    Scan              : word;
                    Marker            : word ) : DWORD;  external PCI416DLL;

function start_daq(     brdindex    : DWORD;
                        TriggerMode : word;
                    var TriggerRate : double ) : DWORD;  external PCI416DLL;

function stop_daq( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function scan_status(     brdindex          : DWORD;
                          ClockSrc          : word;
                          SampleRate        : double;
                          TotalSamples      : DWORD;
                          SamplesPerTrigger : DWORD;
                          Frames            : DWORD;
                          TriggerSrc        : word;
                          TriggerRate       : double;
                          Channel           : word;
                          PreTrigger        : BOOL;
                          Scan              : BOOL;
                          Marker            : BOOL;
                      out buffer ) : integer;  external PCI416DLL;

function get_adm_stats(     brdindex : DWORD;
                        out admstats : TADM_STATS ) : integer;  external PCI416DLL;

function read_pt_port_control_reg( brdindex : DWORD ) : DWORD;  external PCI416DLL;

procedure write_pt_port_control_reg( brdindex : DWORD;
                                     val      : UINT );  external PCI416DLL;

function read_pt_port_data( brdindex : DWORD;
                            prt      : UINT ) : DWORD;  external PCI416DLL;

function write_pt_port_data( brdindex : DWORD;
                             prt      : UINT;
                             val      : UINT ) : DWORD;  external PCI416DLL;

procedure enable_pt_dma_logic( brdindex : DWORD;
                              md       : UINT );  external PCI416DLL;

function start_stop_pt_dma_logic( brdindex : DWORD;
                                  md       : UINT ) : DWORD;  external PCI416DLL;

procedure set_pt_trigger_mode( brdindex : DWORD;
                               md       : UINT );  external PCI416DLL;

procedure set_pt_interrupt_mode( brdindex : DWORD;
                                 md       : UINT );  external PCI416DLL;

procedure enable_pt_eos_interrupt( brdindex : DWORD );  external PCI416DLL;

procedure enable_pt_half_full_interrupt( brdindex : DWORD );  external PCI416DLL;

function read_pt_interrupt_status( brdindex : DWORD ) : DWORD;  external PCI416DLL;

procedure set_pt_scan_select( brdindex : DWORD;
                              md       : UINT );  external PCI416DLL;

procedure set_pt_auto_increment( brdindex : DWORD;
                                 md       : UINT );  external PCI416DLL;

procedure set_pt_marker_select( brdindex : DWORD;
                                md       : UINT );  external PCI416DLL;

procedure set_pt_pretrigger( brdindex : DWORD;
                             md       : UINT );  external PCI416DLL;

procedure disable_pt_interrupt( brdindex : DWORD );  external PCI416DLL;

procedure clear_pt_interrupt( brdindex : DWORD );  external PCI416DLL;

procedure enable_pt_interrupt( brdindex : DWORD );  external PCI416DLL;

procedure set_pt_ad_clock_source( brdindex : DWORD;
                                  src      : UINT );  external PCI416DLL;

procedure set_pt_adm_control( brdindex : DWORD;
                              val      : DWORD );  external PCI416DLL;

procedure set_pt_command_reg( brdindex : DWORD;
                              val      : DWORD );  external PCI416DLL;

function read_pt_status_reg( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function pt_fifo_empty( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function pt_fifo_half_full( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function pt_fifo_full( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function read_pt_arm_ff( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function read_pt_analog_trigger_status( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function read_pt_acquire_status( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function read_pt_adm( brdindex : DWORD ) : DWORD;  external PCI416DLL;

procedure set_pt_sample_count( brdindex : DWORD;
                               count    : DWORD );  external PCI416DLL;

procedure set_pt_ad_channel( brdindex : DWORD;
                             chan     : UINT );  external PCI416DLL;

procedure set_pt_ad_scan_count( brdindex : DWORD;
                                count    : UINT );  external PCI416DLL;

procedure set_pt_led( brdindex : DWORD;
                      val      : UINT );  external PCI416DLL;

procedure reset_pt_fifos( brdindex : DWORD );  external PCI416DLL;

procedure set_pt_convert_enable( brdindex : DWORD;
                                 val      : UINT );  external PCI416DLL;

function set_pt_pll( brdindex : DWORD;
                     freq     : double ) : UINT; external PCI416DLL;

function set_pt_ad_clock_rate( brdindex : DWORD;
                               fs       : double ) : integer;  external PCI416DLL;

function set_pt_trigger_rate(     brdindex : DWORD;
                                  ft       : double;
                              out actual   : double ) : UINT;  external PCI416DLL;

procedure generate_single_internal_trigger( brdindex : DWORD );  external PCI416DLL;

procedure reset_pt_trigger_timer( brdindex : DWORD );  external PCI416DLL;

procedure set_pt_dac_voltage( brdindex : DWORD;
                              volts    : double );  external PCI416DLL;

procedure set_pt_dac_code( brdindex : DWORD;
                           code     : UINT );  external PCI416DLL;

function read_pt_fifo( brdindex : DWORD ) : DWORD;  external PCI416DLL;

procedure read_pt_fifo_many( brdindex : DWORD;
                             buffer   : PDWORD;
                             count    : DWORD );  external PCI416DLL;

procedure reset_dma_fifo( brdindex : DWORD );  external PCI416DLL;

procedure set_dma_request_half_full( brdindex : DWORD;
                                     md       : UINT );  external PCI416DLL;

procedure enable_dma_transfers( brdindex : DWORD;
                                enable   : UINT );  external PCI416DLL;

procedure set_dma_transfer_count( brdindex : DWORD;
                                  bytes    : DWORD );  external PCI416DLL;

function read_dma_transfer_count( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function read_dma_dest_address( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function dma_fifo_empty( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function read_dma_fifo_reg( brdindex : DWORD ) : DWORD;  external PCI416DLL;

procedure update_intcsr( brdindex : DWORD );  external PCI416DLL;

function read_intcsr( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function read_msr( brdindex : DWORD ) : DWORD;  external PCI416DLL;

function nvram_busy( brdindex : DWORD ) : integer;  external PCI416DLL;

procedure set_nvram_address( brdindex : DWORD;
                             addr     : UINT );  external PCI416DLL;

function read_nvram( brdindex : DWORD;
                     addr     : UINT ) : byte;  external PCI416DLL;

procedure write_nvram( brdindex : DWORD;
                       addr     : UINT;
                       data     : byte );  external PCI416DLL;

end.

