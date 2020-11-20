unit EncLib;

interface

const  // Commands
  VECTOR           =  0;
  NUM_AXES         =  1;
  NUM_TIMERS       =  2;
  NUM_INPUTS       =  3;
  CARD_TYPE        =  8;
  VERSION_NUM      =  9;
  CNT_16           = 10;
  MODE             = 11;
  AXIS_SIZE        = 12;
  ENCODER_TYPE     = 13;
  MARK_16          = 20;
  MARK_INPUT       = 21;
  MARK_INT         = 22;
  MARK_FUNC        = 23;
  MARK_INT_VECT    = 24;
  MARK_INT_OCCUR   = 25;
  ZERO_INPUT       = 30;
  ZERO_INT         = 31;
  ZERO_FUNC        = 32;
  ZERO_INT_VECT    = 33;
  ZERO_INT_OCCUR   = 34;
  AXIS_32          = 40;
  MARK_32          = 41;
  VEL_INST         = 42;
  VEL_FILT         = 43;
  ACCEL_INST       = 44;
  ACCEL_FILT       = 45;
  PROBE_32         = 46;
  ABSOLUTE_32      = 47;
  INPUT            = 50;
  TIMER            = 60;
  TIMER_INT        = 61;
  TIMER_INT_VECT   = 62;
  TIMER_INT_OCCUR  = 63;
  PROBE_16         = 90;
  PROBE_INPUT      = 91;
  PROBE_INT        = 92;
  PROBE_FUNC       = 93;
  PROBE_VECT       = 94;
  PROBE_INT_OCCUR  = 95;
  PROBE_SENSE      = 96;
  PROBE_LED        = 97;
  PROBE_SOUND      = 98;
  PROBE_FOOTSWITCH = 99;

const  // Modes
  UPDWN    = 0;
  QUADx1A  = 1;
  QUADx1B  = 2;
  QUADx2A  = 3;
  QUADx2B  = 4;
  QUADx4AB = 5;
  PULSE    = 6;
  FREQ     = 7;

const  // Defints
  SPARE_INT   = 0;
  COUNTER_INT = 1;
  ZERO_Z_INT  = 2;
  MARK_Z_INT  = 3;
  ZERO_Y_INT  = 4;
  MARK_Y_INT  = 5;
  ZERO_X_INT  = 6;
  MARK_X_INT  = 7;

const  // Leds
  PROBE_LED_OFF  = 0;
  PROBE_LED_ON   = 1;
  PROBE_LED_AUTO = 2;

const  // Sound
  PROBE_SOUND_OFF = 0;
  PROBE_SOUND_ON  = 1;

const  // FootSwitch
  FOOTSWITCH_OFF  = 0;
  FOOTSWITCH_AUTO = 1;

const FILTER_SAMPLES = 10;

// for SSi Encoder type for MODE command
const LENGTH_ADJUST    = $01000000;
const OFFSET_ADJUST    = $00000100;
const CHECK_ADJUST     = $00001000;
const CODE_ADJUST      = $00004000;
const OPER_ADJUST      = $00010000;
const OUT_ADJUST       = $00008000;

const MODE_LENGTH_MASK = $3f000000;
const MODE_OFFSET_MASK = $00000f00;
const MODE_FREQ_MASK   = $00000007;
const MODE_CODE_MASK   = $00004000;
const MODE_CHK_MASK    = $00003000;
const MODE_OPER_MASK   = $00030000;
const MODE_OUT_MASK    = $00008000;

const MODE_ONE_SHOT    = $00000000;
const MODE_TIMED       = $00010000;
const MODE_CONTINUE    = $00020000;

const MODE_GRAY        = $00004000;
const MODE_BINARY      = $00000000;

const MODE_PARITY_ODD  = $00003000;
const MODE_PARITY_EVEN = $00002000;
const MODE_POWER_FAIL  = $00001000;
const MODE_FREQ_2M5Hz  = $00000000;
const MODE_FREQ_1M25Hz = $00000001;
const MODE_FREQ_625kHz = $00000002;
const MODE_FREQ_312kHz = $00000003;
const MODE_FREQ_156kHz = $00000004;
const MODE_FREQ_78kHz  = $00000005;


function enclib_version : pchar;  stdcall;

function read_encoder( Command : smallint;
                       Channel : smallint ) : longint;  stdcall;
function read_encoder_ext : longint;                    stdcall;

procedure write_encoder( Command : smallint;
                         Channel : smallint;
                         Value   : longint );    stdcall;
procedure write_encoder_ext( Value : longint );  stdcall;

function  open_encoder : smallint;  stdcall;
procedure close_encoder;            stdcall;


implementation

const
  EncLinDLL = 'enclib32.dll';


function enclib_version : pchar;  external EncLinDLL;

function read_encoder( Command : smallint;
                       Channel : smallint ) : longint;  external EncLinDLL;
function read_encoder_Ext : longint;                    external EncLinDLL;

procedure write_encoder( Command : smallint;
                         Channel : smallint;
                         Value   : longint );    external EncLinDLL;
procedure write_encoder_ext( Value : longint );  external EncLinDLL;

function  open_encoder : smallint;  external EncLinDLL;
procedure close_encoder;            external EncLinDLL;


end.
