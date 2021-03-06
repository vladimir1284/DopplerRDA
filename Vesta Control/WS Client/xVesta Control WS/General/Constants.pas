unit Constants;

interface

const
  RTSession      = 'RealTime';
  RTServerPlayer = 'RTServer';
  RTClientPlayer = 'RTClient';

  //LogZones
  AutoCheckingZone = 'Autochequeo';
  ObservationZone  = 'Observacion';
  TxZone           = 'Trasmisores';
  ElbrusZone       = 'Elbrus';
  LoggingZone      = 'Usuarios';

  //General
  OnlyOneRdaServerName = 'OnlyOne_RDA_Server';
  OnlyOneRdaClientName = 'OnlyOne_RDA_Client';
  OnlyOneRTClientName  = 'OnlyOne_RT_Client';

  //General Config
  ConfigFile = 'Config.ini';
  DigitalInputsKey = 'DigitalInputs';
  DigitalOutputsKey = 'DigitalOutputs';
  AnalogInputsKey = 'AnalogInputs';
  AnalogOutputsKey = 'AnalogOutputs';
  MemoryKey = 'Memory';
  MinWorkingSetSizeValue = 'MinimumWorkingSetSize';
  MaxWorkingSetSizeValue = 'MaximumWorkingSetSize';
  RTKey = 'RealTime';
  RDAPortValue = 'RDAPort';
  RDAPortDefault = 8888;
  RDAHostValue = 'RDAHost';
  RDAHostDefault = '127.0.0.1';

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

  //Osciloscope protocol
  oscMaxTimeServerConnect = 10000;
  oscMaxTimeToConnect = 10000;
  oscCommandTimeOut = 10000;
  oscClientCommandTimeOut = 5000;
  oscSuccess = 'ok';
  oscSetCellsCommand    = 'set_cells';
  oscSetChannelsCommand = 'set_channels';
  oscSetCodesCommand    = 'set_codes';
  oscSetDataTypeCommand = 'set_data_type';
  oscSetRaysCommand     = 'set_ays';


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
  ms_TurnRadarOn   = 'Encendiendo radar';
  ms_TurnTxRxOn    = 'Encendiendo transceptores';
  ms_WaitTime      = 'Esperando la hora exacta';
  ms_ProgTxRx      = 'Programando transceptores';
  ms_MotorOn       = 'Encendiendo motores';
  ms_MoveAntenna   = 'Posicionando antena';
  ms_Transfer      = 'Realizando corte #';
  ms_TransferCheck = 'Chequeando el punto #';
  ms_TurnRadarOff  = 'Apagando radar';
  ms_TurnTxRxOff   = 'Apagando transceptores';
  ms_MotorOff      = 'Apagando motores';
  ms_TxRxStandby   = 'Pasando transmisores a standby';

const  // Error
  es_CheckRadarOn  = 'No enciende el radar';
  es_CheckTxRxOn   = 'No encienden los transceptores';
  es_CheckTime     = 'No llega la hora esperada';
  es_CheckTxRx     = 'Transceptores fuera de parametros';
  es_CheckMotor    = 'No enciende el accionamiento';
  es_CheckAntenna  = 'No se logra posicionar la antena';
  es_AzSpeedAntenna = 'La antena no logra alcanzar la velocidad en azimut';
  es_ElSpeedZero    = 'La antena no logra alcanzar la posicion en elevacion';
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

implementation

end.
