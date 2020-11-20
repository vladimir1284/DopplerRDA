unit ElbrusTypes;

interface

const  
  Combo_Freqs : array[0..8] of cardinal = (10000000, 5000000, 3333333, 2000000, 1250000, 1000000, 625000, 500000, 250000);

type
  DigitalInput  = cardinal;
  DigitalOutput = cardinal;

  TStringList = array of string;
  

type
  DIRange      = 0..31;
  DORange      = 0..31;
  AIRange      = 0..15;
  AORange      = 0..1;
  FOutRange    = 0..5;
  CounterRange = 0..6;
  VideoRange   = 0..3;
  AnalogSample = 0..4095;
  AnalogCode   = 0..4095;
  GainCode     = word;      // Gain_...
  CounterCode  = word;      // 16 bits
  VideoCode    = 0..3;

type
  FOutCodes    = array[FOutRange] of word;
  CounterCodes = array[CounterRange] of word;

type
  AnalogInput  = array[AIRange] of AnalogSample;
  AnalogGains  = array[AIRange] of GainCode;
  AnalogOutput = array[AORange] of AnalogCode;
  CounterTimes = array[CounterRange] of CounterCode;
  VideoGains   = array[VideoRange] of VideoCode;
  PVideoGains  = ^VideoGains;
  TReferencePoints = array of Double;

const
  Gain_1   = 0;
  Gain_2   = 1;
  Gain_4   = 2;
  Gain_8   = 3;
  Gain_16  = 4;
  Gain_0_5 = 4;

type
  TAIRange = packed record
    Min : smallint;
    Max : smallint;
  end;

type
  AnalogRange  = array[AIRange] of TAIRange;

const
  N0_Counter    = 5;
  N2_Counter    = 0;
  N3_Counter    = 1;
  N4_Counter    = 2;
  N5_Counter    = 3;
  N6_Counter    = 4;
  N1CH1_Counter = 5;
  N1CH2_Counter = 6;

{ Sistema viejo
  N0_Counter = 0;
  N2_Counter = 1;
  N3_Counter = 2;
  N4_Counter = 3;
  N5_Counter = 4;
  N6_Counter = 5;
}


type
  TVideoSample = word;
  PVideoSamples = ^TVideoSamples;
  TVideoSamples = array[0..0] of TVideoSample;

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

const
//  Max_ShotCount   = 256;
  Max_ShotCount   = 1000;
  Sample_Excluded = $FFFF;
  Data_Excluded   = $FF;

const
  Plantilla_PPI = 'PPI';
  Plantilla_RHI = 'RHI';

// Digital Input Bits
//PCI1710
  dib_Cupula_Abierta    =  0;
  dib_Antena_Listo      =  1;  // Acc_Auto_Az + Acc_Auto_El
  dib_Acc_Listo_Az      =  2;  // Chopper Azimut
  dib_Acc_Listo_El      =  3;  // Chopper Elevacion
  dib_Averia_Excitacion =  4;
  dib_Antena_Limite_N   =  5;  // Limite de  -4
  dib_Antena_Limite_P   =  6;  // Limite de +98
  dib_Tx2_Caldeo        =  7;
  dib_Tx2_Anodo         =  8;
  dib_Tx2_Averia        =  9;
  dib_Tx2_Listo         = 10;
  dib_Rx2_Caldeo        = 11;
  dib_Rx2_Anodo         = 12;
  dib_Rx2_Averia        = 13;
  dib_TxRx2_Pulso_Largo = 14;
  dib_TxRx2_Ajuste      = 15;
//PCI1730
  dib_Tx1_Caldeo        = 16;
  dib_Tx1_Anodo         = 17;
  dib_Tx1_Averia        = 18;
  dib_Tx1_Listo         = 19;
  dib_Rx1_Caldeo        = 20;
  dib_Rx1_Anodo         = 21;
  dib_Rx1_Averia        = 22;
  dib_TxRx1_Pulso_Largo = 23;
  dib_TxRx1_Ajuste      = 24;
//PCI1780
  dib_Red_Listo         = 25;  // Testigo de +27V no estabilizado
  dib_Radar_On_P        = 26;  // Testigo de +27V estabilizado
  dib_Radar_On_N        = 27;  // Testigo de -27V estabilizado
  dib_Reserva_1         = 28;
  dib_Reserva_2         = 29;
  dib_Reserva_3         = 30;
  dib_Reserva_4         = 31;

// Digital Output Bits
//PCI1710
  dob_Radar_Encender    =  0;
  dob_Radar_Apagar      =  1;
  dob_Reserva_1         =  2;
  dob_Tx2_Encender      =  3;
  dob_Tx2_Apagar        =  4;
  dob_Tx2_Standby       =  5;
  dob_Rx2_Encender      =  6;
  dob_Rx2_Apagar        =  7;
  dob_Rx2_CMG           =  8;
  dob_Rx2_Ganancia_N    =  9;
  dob_Rx2_Ganancia_P    = 10;
  dob_Rx2_CMS           = 11;
  dob_Rx2_Sintonia_N    = 12;
  dob_Rx2_Sintonia_P    = 13;
  dob_Rx2_Correccion    = 14;
  dob_TxRx2_Trabajo     = 15;
//PCI1730
  dob_Tx1_Encender      = 16;
  dob_Tx1_Apagar        = 17;
  dob_Tx1_Standby       = 18;
  dob_Rx1_Encender      = 19;
  dob_Rx1_Apagar        = 20;
  dob_Rx1_CMG           = 21;
  dob_Rx1_Ganancia_N    = 22;
  dob_Rx1_Ganancia_P    = 23;
  dob_Rx1_CMS           = 24;
  dob_Rx1_Sintonia_N    = 25;
  dob_Rx1_Sintonia_P    = 26;
  dob_Rx1_Correccion    = 27;
  dob_TxRx1_Trabajo     = 28;
//PCI1780
  dob_Acc_Encender      = 29;
  dob_Alarma_Sonora     = 30;
  dob_Pulso_Largo       = 31;

//Analog Inputs
  ai_Tx2_Potencia      = 0;
  ai_Rx2_Ganancia      = 1;
  ai_Rx2_Ruido         = 2;
  ai_Rx2_Sintonia      = 3;
  ai_Muestra_Fuente_N  = 4;
  ai_Muestra_Fuente_P  = 5;
  ai_Reserva_1         = 6;
  ai_Reserva_2         = 7;
  ai_Velocidad_El      = 8;
  ai_Corriente_El      = 9;
  ai_Velocidad_Az      = 10;
  ai_Corriente_Az      = 11;
  ai_Rx1_Ruido         = 12;
  ai_Tx1_Potencia      = 13;
  ai_Rx1_Ganancia      = 14;
  ai_Rx1_Sintonia      = 15;

// Digital Input masks
  di_Tx1_Caldeo        = cardinal(1) shl dib_Tx1_Caldeo;
  di_Tx1_Anodo         = cardinal(1) shl dib_Tx1_Anodo;
  di_Tx1_Averia        = cardinal(1) shl dib_Tx1_Averia;
  di_Tx1_Listo         = cardinal(1) shl dib_Tx1_Listo;
  di_Rx1_Caldeo        = cardinal(1) shl dib_Rx1_Caldeo;
  di_Rx1_Anodo         = cardinal(1) shl dib_Rx1_Anodo;
  di_Rx1_Averia        = cardinal(1) shl dib_Rx1_Averia;
  di_TxRx1_Pulso_Largo = cardinal(1) shl dib_TxRx1_Pulso_Largo;
  di_TxRx1_Ajuste      = cardinal(1) shl dib_TxRx1_Ajuste;
  di_Cupula_Abierta    = cardinal(1) shl dib_Cupula_Abierta;
  di_Antena_Listo      = cardinal(1) shl dib_Antena_Listo;
  di_Acc_Listo_Az      = cardinal(1) shl dib_Acc_Listo_Az;
  di_Acc_Listo_El      = cardinal(1) shl dib_Acc_Listo_El;
  di_Averia_Excitacion = cardinal(1) shl dib_Averia_Excitacion;
  di_Antena_Limite_N   = cardinal(1) shl dib_Antena_Limite_N;
  di_Antena_Limite_P   = cardinal(1) shl dib_Antena_Limite_P;
  di_Tx2_Caldeo        = cardinal(1) shl dib_Tx2_Caldeo;
  di_Tx2_Anodo         = cardinal(1) shl dib_Tx2_Anodo;
  di_Tx2_Averia        = cardinal(1) shl dib_Tx2_Averia;
  di_Tx2_Listo         = cardinal(1) shl dib_Tx2_Listo;
  di_Rx2_Caldeo        = cardinal(1) shl dib_Rx2_Caldeo;
  di_Rx2_Anodo         = cardinal(1) shl dib_Rx2_Anodo;
  di_Rx2_Averia        = cardinal(1) shl dib_Rx2_Averia;
  di_TxRx2_Pulso_Largo = cardinal(1) shl dib_TxRx2_Pulso_Largo;
  di_TxRx2_Ajuste      = cardinal(1) shl dib_TxRx2_Ajuste;
  di_Red_Listo         = cardinal(1) shl dib_Red_Listo;
  di_Radar_On_P        = cardinal(1) shl dib_Radar_On_P;
  di_Radar_On_N        = cardinal(1) shl dib_Radar_On_N;
  di_Reserva_1         = cardinal(1) shl dib_Reserva_1;
  di_Reserva_2         = cardinal(1) shl dib_Reserva_2;
  di_Reserva_3         = cardinal(1) shl dib_Reserva_3;
  di_Reserva_4         = cardinal(1) shl dib_Reserva_4;

// Digital Output masks
  do_Tx1_Encender      = cardinal(1) shl dob_Tx1_Encender;
  do_Tx1_Apagar        = cardinal(1) shl dob_Tx1_Apagar;
  do_Tx1_Standby       = cardinal(1) shl dob_Tx1_Standby;
  do_Rx1_Encender      = cardinal(1) shl dob_Rx1_Encender;
  do_Rx1_Apagar        = cardinal(1) shl dob_Rx1_Apagar;
  do_Rx1_CMG           = cardinal(1) shl dob_Rx1_CMG;
  do_Rx1_Ganancia_N    = cardinal(1) shl dob_Rx1_Ganancia_N;
  do_Rx1_Ganancia_P    = cardinal(1) shl dob_Rx1_Ganancia_P;
  do_Rx1_CMS           = cardinal(1) shl dob_Rx1_CMS;
  do_Rx1_Sintonia_N    = cardinal(1) shl dob_Rx1_Sintonia_N;
  do_Rx1_Sintonia_P    = cardinal(1) shl dob_Rx1_Sintonia_P;
  do_Rx1_Correccion    = cardinal(1) shl dob_Rx1_Correccion;
  do_TxRx1_Trabajo     = cardinal(1) shl dob_TxRx1_Trabajo;
  do_Radar_Encender    = cardinal(1) shl dob_Radar_Encender;
  do_Radar_Apagar      = cardinal(1) shl dob_Radar_Apagar;
  do_Reserva_1         = cardinal(1) shl dob_Reserva_1;
  do_Tx2_Encender      = cardinal(1) shl dob_Tx2_Encender;
  do_Tx2_Apagar        = cardinal(1) shl dob_Tx2_Apagar;
  do_Tx2_Standby       = cardinal(1) shl dob_Tx2_Standby;
  do_Rx2_Encender      = cardinal(1) shl dob_Rx2_Encender;
  do_Rx2_Apagar        = cardinal(1) shl dob_Rx2_Apagar;
  do_Rx2_CMG           = cardinal(1) shl dob_Rx2_CMG;
  do_Rx2_Ganancia_N    = cardinal(1) shl dob_Rx2_Ganancia_N;
  do_Rx2_Ganancia_P    = cardinal(1) shl dob_Rx2_Ganancia_P;
  do_Rx2_CMS           = cardinal(1) shl dob_Rx2_CMS;
  do_Rx2_Sintonia_N    = cardinal(1) shl dob_Rx2_Sintonia_N;
  do_Rx2_Sintonia_P    = cardinal(1) shl dob_Rx2_Sintonia_P;
  do_Rx2_Correccion    = cardinal(1) shl dob_Rx2_Correccion;
  do_TxRx2_Trabajo     = cardinal(1) shl dob_TxRx2_Trabajo;
  do_Acc_Encender      = cardinal(1) shl dob_Acc_Encender;
  do_Alarma_Sonora     = cardinal(1) shl dob_Alarma_Sonora;
  do_Pulso_Largo       = cardinal(1) shl dob_Pulso_Largo;

//Names
var
  DI_Names : TStringList;
  DO_Names : TStringList;
  AI_Names : TStringList;
  AO_Names : TStringList;

implementation

initialization

  SetLength(DI_Names, 32);
  DI_Names[0]  := 'Cupula_Abierta';
  DI_Names[1]  := 'Antena_Listo';
  DI_Names[2]  := 'Acc_Listo_Az';
  DI_Names[3]  := 'Acc_Listo_El';
  DI_Names[4]  := 'Averia_Excitacion';
  DI_Names[5]  := 'Antena_Limite_N';
  DI_Names[6]  := 'Antena_Limite_P';
  DI_Names[7]  := 'Tx2_Caldeo';
  DI_Names[8]  := 'Tx2_Anodo';
  DI_Names[9]  := 'Tx2_Averia';
  DI_Names[10] := 'Tx2_Listo';
  DI_Names[11] := 'Rx2_Caldeo';
  DI_Names[12] := 'Rx2_Anodo';
  DI_Names[13] := 'Rx2_Averia';
  DI_Names[14] := 'TxRx2_Pulso_Largo';
  DI_Names[15] := 'TxRx2_Ajuste';
  DI_Names[16] := 'Tx1_Caldeo';
  DI_Names[17] := 'Tx1_Anodo';
  DI_Names[18] := 'Tx1_Averia';
  DI_Names[19] := 'Tx1_Listo';
  DI_Names[20] := 'Rx1_Caldeo';
  DI_Names[21] := 'Rx1_Anodo';
  DI_Names[22] := 'Rx1_Averia';
  DI_Names[23] := 'TxRx1_Pulso_Largo';
  DI_Names[24] := 'TxRx1_Ajuste';
  DI_Names[25] := 'Red_Listo';
  DI_Names[26] := 'Radar_On_P';
  DI_Names[27] := 'Radar_On_N';
  DI_Names[28] := 'Reserva_1';
  DI_Names[29] := 'Reserva_2';
  DI_Names[30] := 'Reserva_3';
  DI_Names[31] := 'Reserva_4';

  SetLength(DO_Names, 32);
  DO_Names[0]  := 'Radar_Encender';
  DO_Names[1]  := 'Radar_Apagar';
  DO_Names[2]  := 'Reserva_1';
  DO_Names[3]  := 'Tx2_Encender';
  DO_Names[4]  := 'Tx2_Apagar';
  DO_Names[5]  := 'Tx2_Standby';
  DO_Names[6]  := 'Rx2_Encender';
  DO_Names[7]  := 'Rx2_Apagar';
  DO_Names[8]  := 'Rx2_CMG';
  DO_Names[9]  := 'Rx2_Ganancia_N';
  DO_Names[10] := 'Rx2_Ganancia_P';
  DO_Names[11] := 'Rx2_CMS';
  DO_Names[12] := 'Rx2_Sintonia_N';
  DO_Names[13] := 'Rx2_Sintonia_P';
  DO_Names[14] := 'Rx2_Correccion';
  DO_Names[15] := 'TxRx2_Trabajo';
  DO_Names[16] := 'Tx1_Encender';
  DO_Names[17] := 'Tx1_Apagar';
  DO_Names[18] := 'Tx1_Standby';
  DO_Names[19] := 'Rx1_Encender';
  DO_Names[20] := 'Rx1_Apagar';
  DO_Names[21] := 'Rx1_CMG';
  DO_Names[22] := 'Rx1_Ganancia_N';
  DO_Names[23] := 'Rx1_Ganancia_P';
  DO_Names[24] := 'Rx1_CMS';
  DO_Names[25] := 'Rx1_Sintonia_N';
  DO_Names[26] := 'Rx1_Sintonia_P';
  DO_Names[27] := 'Rx1_Correccion';
  DO_Names[28] := 'TxRx1_Trabajo';
  DO_Names[29] := 'Acc_Encender';
  DO_Names[30] := 'Alarma_Sonora';
  DO_Names[31] := 'Pulso_Largo';

  SetLength(AI_Names, 16);
  AI_Names[0]  := 'Tx2_Potencia';
  AI_Names[1]  := 'Rx2_Ganancia';
  AI_Names[2]  := 'Rx2_Ruido';
  AI_Names[3]  := 'Rx2_Sintonia';
  AI_Names[4]  := 'Muestra_Fuente_N';
  AI_Names[5]  := 'Muestra_Fuente_P';
  AI_Names[6]  := 'Reserva_1';
  AI_Names[7]  := 'Reserva_2';
  AI_Names[8]  := 'Velocidad_El';
  AI_Names[9]  := 'Corriente_El';
  AI_Names[10] := 'Velocidad_Az';
  AI_Names[11] := 'Corriente_Az';
  AI_Names[12] := 'Rx1_Ruido';
  AI_Names[13] := 'Tx1_Potencia';
  AI_Names[14] := 'Rx1_Ganancia';
  AI_Names[15] := 'Rx1_Sintonia';

  SetLength(AO_Names, 2);
  AO_Names[0] := 'Azimut';
  AO_Names[1] := 'Elevation';

finalization
  DI_Names := nil;

end.










