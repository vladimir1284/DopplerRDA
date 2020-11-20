unit Constants;

interface

uses
  Math;

type
  dword = cardinal;
  PDWords = ^TDWords;
  TDWords = array[0..0] of dword;

type
  PBytes = ^TBytes;
  TBytes = array[0..0] of byte;

type
  PWords = ^TWords;
  TWords = array[0..0] of word;

  PDoubles = ^TDoubles;
  TDoubles = array[0..0] of single;

  PSingles = ^TSingles;
  TSingles = array[0..0] of single;

  PSmallInts = ^TSmallInts;
  TSmallInts = array[0..0] of smallint;

  TDataPackage =
    class
      private
        fmsg      : string;
        fCellSize : smallint;
        fAz       : smallint;
        fEl       : smallint;
        fndata    : smallint;
        fChannel  : smallint;
        fDataType : smallint;
        fdata     : pointer;
        function getDataSize: smallint;
      public
        constructor Init(_msg : string; _channel, _CellSize, _Az, _El, _DataType, _ndata : smallint; _buffer : pointer); overload;
        destructor  Destroy; override;

        property msg      : string   read fmsg      write fmsg;
        property CellSize : smallint read fCellSize write fCellSize;
        property Az       : smallint read fAz       write fAz;
        property El       : smallint read fEl       write fEl;
        property NData    : smallint read fndata    write fndata;
        property Channel  : smallint read fChannel  write fChannel;
        property Data     : pointer  read fdata     write fdata;
        property DataType : smallint read fDataType write fDataType;
        property DataSize : smallint read getDataSize;
    end;

  function GetSizeOf(DataType : smallint) : smallint;

const
  dtShort  = 0;
  dtUShort = 1;
  dtInt    = 2;
  dtUIint  = 3;
  dtInt64  = 4;
  dtFloat  = 5;
  dtDouble = 6;

  //LogZones
  AutoCheckingZone = 'Autochequeo';
  ObservationZone  = 'Observaciones';
  TaskZone         = 'Tareas';
  DRXZone          = 'DRXs';
  TxZone           = 'Trasmisores';
  ElbrusZone       = 'Elbrus';
  LoggingZone      = 'Usuarios';

  //General
  OnlyOneRdaServerName = 'OnlyOne_RDA_Server';
  OnlyOneRdaClientName = 'OnlyOne_RDA_Client';
  OnlyOneRTClientName  = 'OnlyOne_RT_Client';

  //General Config
  ConfigFile = 'Config.ini';

  MemoryKey         = 'Memory';
  DigitalInputsKey  = 'DigitalInputs';
  DigitalOutputsKey = 'DigitalOutputs';
  AnalogInputsKey   = 'AnalogInputs';
  AnalogOutputsKey  = 'AnalogOutputs';
  AntennaKey        = 'Antenna';
  SettingsKey       = 'Settings';

  //memory key
  MinWorkingSetSizeValue = 'MinimumWorkingSetSize';
  MaxWorkingSetSizeValue = 'MaximumWorkingSetSize';
  //AntennaKey
  ChannelXValue      = 'channel_x';
  ChannelXDefault    = 0;
  ChannelYValue      = 'channel_y';
  ChannelYDefault    = 1;
  ChannelZValue      = 'channel_z';
  ChannelZDefault    = 2;
  AirTimeValue       = 'air_working_time';
  AirTimeDefault     = 30;

  //SettingsKey
  WSPortValue        = 'ws_port';
  WSPortDefault      = 8888;
  RTPortValue        = 'rt_port';
  RTPortDefault      = 8899;
  RT_ClientsValue    = 'rt_clients';
  RT_ClientsDefault  = 1;
  DRX1HostValue      = 'drx1_host';
  DRX1HostDefault    = '127.0.0.1';
  DRX2HostValue      = 'drx2_host';
  DRX2HostDefault    = '127.0.0.1';
  DRX1_WS_PortValue  = 'drx1_ws_port';
  DRX1_WS_PortDefault= 7788;
  DRX2_WS_PortValue  = 'drx2_ws_port';
  DRX2_WS_PortDefault= 7788;
  DRX1EnabledValue   = 'drx1_enabled';
  DRX1EnabledDefault = true;
  DRX2EnabledValue   = 'drx2_enabled';
  DRX2EnabledDefault = false;
  StreamPortValue    = 'stream_port';
  StreamPortDefault  = 9999;
  MotorElEnabledValue= 'motor_el_enabled';
  MotorElEnabledDefault = true;

  //FTP Settings
  FTPHostIndex       = 0;
  FTPPortIndex       = 1;
  FTPUserIndex       = 2;
  FTPPasswordIndex   = 3;
  FTPFolderIndex     = 4;
  ProxyHostIndex     = 5;
  ProxyPortIndex     = 6;
  ProxyUserIndex     = 7;
  ProxyPasswordIndex = 8;
  UseProxyIndex      = 9;
  MakeDirsIndex      = 10;

  //RT Protocol
  MaxTimeServerConnect = 10000;
  MaxTimeToConnect = 10000;
  CommandTimeOut = 10000;
  ClientCommandTimeOut = 5000;
  CommandRTTimeOut = 100;
  Ch1BeamCommand = 'Ch1Beam';
  Ch2BeamCommand = 'Ch2Beam';

  //RTDataProtocol
  AntennaAzCmd   = 'A';
  AntennaElCmd   = 'E';
  VelAzCmd       = 'VA';
  VelElCmd       = 'VE';
  PulseCmd       = 'P';
  FreqADCmd      = 'F';
  TriggerRateCmd = 'T';

  //Obs
const  // State
  ts_Preparing      = 'Preparando observación';
  ts_Warming        = 'Calentando los trasmisores';
  ts_PreparingCheck = 'Preparando chequeo';
  ts_Executing      = 'Ejecutando observación';
  ts_ExecutingCheck = 'Ejecutando chequeo';
  ts_Copying        = 'Copiando observación';
  ts_CopyingFTP     = 'Enviando observación a sitio FTP';
  ts_Error          = 'Error en observación';
  ts_ErrorCheck     = 'Error en el autochequeo';
  ts_Cancel         = 'Observación cancelada';
  ts_CancelCheck    = 'Autochequeo cancelado';
  ts_Done           = 'Observación terminada';
  ts_CheckDone      = 'Chequeo terminado';

const  // Message
  ms_TurnRadarOn    = 'Encendiendo radar';
  ms_TurnTxRxOn     = 'Encendiendo transceptores';
  ms_TurnMPSOn      = 'Encendiendo MPS';
  ms_WaitTime       = 'Esperando la hora exacta';
  ms_ProgTxRx       = 'Programando transceptores';
  ms_MotorOn        = 'Encendiendo motores';
  ms_Transfer       = 'Realizando corte #';
  ms_TransferCheck  = 'Chequeando el punto #';
  ms_TurnRadarOff   = 'Apagando radar';
  ms_TurnTxRxOff    = 'Apagando transceptores';
  ms_MotorOff       = 'Apagando motores';
  ms_TxRxStandby    = 'Pasando transmisores a standby';
  ms_AzSpeedAntenna = 'Fijando velocidad de la antena en azimut';
  ms_ElSpeedAntenna = 'Fijando velocidad de la antena en azimut';
  ms_ElPosAntenna   = 'Posicionando antena en elevación';
  ms_AzPosAntenna   = 'Posicionando antena en azimut';

const  // Error
  es_CheckRadarOn  = 'No enciende el radar';
  es_CheckTxRxOn   = 'No encienden los transceptores';
  es_CheckTime     = 'No llega la hora esperada';
  es_CheckTxRx     = 'Transceptores fuera de parametros';
  es_CheckMotor    = 'No enciende el accionamiento';
  es_CheckAntenna  = 'No se logra posicionar la antena';
  es_AzSpeedAntenna = 'La antena no logra alcanzar la velocidad en azimut';
  es_ElSpeedZero    = 'La antena no logra alcanzar la posicion en elevación';
  es_ElSpeedAntenna = 'La antena no logra alcanzar la velocidad en elevación';
  es_ElPosAntenna   = 'La antena no se logra posicionar en elevación';
  es_AzPosAntenna   = 'La antena no se logra posicionar en azimut';
  es_Transfer      = 'Error en transferencia';
  es_CheckRadarOff = 'No apaga el radar';
  es_CheckTxRxOff  = 'No apagan los transceptores';
  es_CheckMotorOff = 'No apaga el accionamiento';
  es_CheckStandby  = 'Trasmisor no cae en standby';

const
  InitializationError      = 'No se pudo inicializar la observación';
  CheckInitializationError = 'No se pudo inicializar el autochequeo';
  TurnOnError              = 'Error en la secuencia de encendido';
  TurnOffError             = 'Error en la secuencia de apagado';
  FileCreationError        = 'No se pudo crear el fichero de la observación';
  AllocationMemoryError    = 'No se pudo reservar memoria';
  CopiyingFileError        = 'No se pudo copiar el fichero de la observación';
  TxRx1PulseEqualObsPulse  = 'El pulso del trasmisor 3cm no es el mismo de la observación';
  TxRx2PulseEqualObsPulse  = 'El pulso del trasmisor 10cm no es el mismo de la observación';
  AcquireError             = 'Error en la adquisición';
  FTP_Timeout              = 10000;

const  // Observation Results
  obs_Ok                = 0;
  obs_InProgress        = 1;
  obs_Failed            = 2;
  obs_Canceled          = 3;
  obs_Nothing           = 4;
  Radar_TurnOff         = 5;
  Radar_TurnOffCanceled = 6;
  CheckFail             = 7;

const
  LightSpeed = 300000000;  // m/s

//MPS
  MPS_Delay = 10000; //ms
  MPS_MAx   = 200;   //volts
  MPS_Error = 5;     //volts
  MPS_Wait  = 5000;

//Antenna  
  AntennaBits       = 14;
  AntennaMaxValue   = 16384;
  AntennaZeroValue  = AntennaMaxValue div 2;
  AntennaConvFactor = 360 / AntennaMaxValue;

  //Data Exchange protocol
  deMaxTimeServerConnect = 10000;
  deMaxTimeToConnect     = 10000;
  deCommandTimeOut       = 5000;
  deClientCommandTimeOut = 5000;

  TX_RX_Power_Command  = 'TX_RX_Power';
  TX_Burst_Command     = 'TX_Burst';
  TX_Spectrum_Command  = 'TX_Spectrum';
  RX_dBZ_Command       = 'RX_dBZ';
  RX_dBT_Command       = 'RX_dBT';
  RX_V_Command         = 'RX_V';
  RX_W_Command         = 'RX_W';

  Success_Response = 'ok';
  Fail_Response  = 'fail';

//Observations
  NData = 2000;

  PPI_Timeout = 2 * 60 * 1000; //5 min
  RHI_Timeout = 1 * 60 * 1000; //5 min
  Transfer_Timeout = 1 * 60 * 1000; //5 min

  //obs receiver protocol
  Obs_Finalize_Command  = 'obs_finalize';
  Obs_Cancel_Command    = 'obs_cancel';
  Obs_Error_Command     = 'obs_error';
  Obs_Move_Command      = 'obs_movement';

  PulseChangingDelay    = 12000;

  GaseousAttenuation    = 0.016;  

//actions
  a_Cancel = 'Tarea cancelada';

implementation

uses
  SysUtils;

function GetSizeOf(DataType : smallint) : smallint;
begin
  result := 0;
  case DataType of
    dtShort : result := 2;
    dtUShort: result := 2;
    dtInt   : result := 4;
    dtUIint : result := 4;
    dtInt64 : result := 8;
    dtFloat : result := 4;
    dtDouble: result := 8;
  end;
end;

{ TDataPackage }

destructor TDataPackage.Destroy;
begin
  ReallocMem(fdata, 0);
  inherited;
end;

function TDataPackage.getDataSize: smallint;
begin
  result := GetSizeOf(fDataType);
end;

constructor TDataPackage.Init(_msg: string; _channel, _CellSize, _Az, _El, _DataType, _ndata: smallint; _buffer: pointer);
var
  buffer_size : cardinal;
begin
  fmsg := _msg;
  fChannel := _channel;
  fAz := _Az;
  fEl := _El;
  fndata := _ndata;
  fDataType := _DataType;
  fCellSize := _CellSize;

  buffer_size := ndata * DataSize;
  fdata := AllocMem(buffer_size);
  Move(_buffer^, fdata^, buffer_size);
end;

end.
