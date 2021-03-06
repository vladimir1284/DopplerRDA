unit Description;

interface

uses
  Angle, Plane, Measure;

{$A+}  // Why???

type  // Radar
  TRadar = (rdNone, rdLaBajada, rdPuntaDelEste, rdCasablanca, rdPicoSanJuan,
            rdCamaguey, rdPilon, rdGranPiedra, rdMcGill, rdRoma, rdCP2_SCMS);

  TRadarBrand = (rbUnknown, rbMRL5, rbRC32B, rbMRL5M, rbResearch);

  TRadarSet = set of TRadar;

  TRadarTrust = (rtLow, rtMean, rtHigh);

  PRadarDesc = ^TRadarDesc;
  TRadarDesc = packed record
    Name      : string[63];
    Owner     : string[63];
    Brand     : TRadarBrand;
    Trust     : TRadarTrust;
    Reserved  : word;
    Location  : T3DLocation;
    Range     : integer;      // Alcance [km]
  end;

const  // Radars
  rd_None         = ord(rdNone);
  rd_LaBajada     = ord(rdLaBajada);
  rd_PuntaDelEste = ord(rdPuntaDelEste);
  rd_CasaBlanca   = ord(rdCasaBlanca);
  rd_PicoSanJuan  = ord(rdPicoSanJuan);
  rd_Camaguey     = ord(rdCamaguey);
  rd_Pilon        = ord(rdPilon);
  rd_GranPiedra   = ord(rdGranPiedra);
  rd_McGill       = ord(rdMcGill);
  rd_Roma         = ord(rdRoma);
  rd_CP2_SCMS     = ord(rdCP2_SCMS);

  RadarIDs = 'lebjcpgmrs';

  rb_Unknown  = ord(rbUnknown);
  rb_MRL5     = ord(rbMRL5);
  rb_RC32B    = ord(rbRC32B);
  rb_MRL5M    = ord(rbMRL5M);
  rb_Research = ord(rbResearch);

const
  channel_power    = 0;
  channel_speed    = 1;
  channel_spectrum = 2;

type  // Channel
  TWaveLength  = (wl3cm, wl10cm, wl5cm);
  TPulseLength = (plLong, plShort);

  PChannelDesc = ^TChannelDesc;
  TChannelDesc = packed record
    Wave      : TWaveLength;     // Longitud de onda
    Pulse     : TPulseLength;    // Duracion del impulso
    Reserved  : word;
    Cells     : integer;         // Cantidad de celdas
    Length    : integer;         // Longitud de celda (en metros)
    Sectors   : integer;         // Cantidad de sectores en 360 grados
    Beam      : single;          // Ancho del haz     (en grados)
    PotMet    : single;          // Potencial meteorologico
    Delta     : single;          // Variacion de PotMet
    Index     : integer;
  end;

  TChannelDescArray = array of TChannelDesc;

const
  POTMET_NA = 1E8;  // PotMet not applicable

type // Movement
  PMovementDesc = ^TMovementDesc;
  TMovementDesc = packed record
    Radar         : TRadar;
    Speed         : smallint;
    Reserved      : byte;
    Time          : TDateTime;
    Channel       : integer;
    Kind          : TPlaneKind;
    Measure       : TMeasure;
    Angle         : TAngle;
    Start, Finish : TAngle;
    SectorCount   : integer;
  end;

  TMoveDescArray = array of TMovementDesc;

type //Nominal Parameters
  TTxParam = record
    Frecuency,            // MHz
    WaveLength,           // cm
    PulseDuration,        // microseg
    PulseExtension,       // m
    PulseRepFrecuency,    // Hz
    PulseRepPeriod,       // miliseg
    PeakPower,            // KW
    AvePower: single;     // W
  end;

  TDetectorType = (dLogarithm, dSquare, dLinear);

  TRxParam = record
    DynamicRange,         // dB
    BandWidth,            // MHz at -6 dB
    MinDiscSignal,        // dBm
    NoiseFigure: single;  // dB
    DetectorType: TDetectorType;
  end;

  TAntennaParam = record
    Gain,                 // dB
    BeamWidth,            // at -3 dB
    SideLobe,             // -dB
    ReflectorDiameter,    // m
    Losses,               // dB
    SigmaV: single;       // m/s
  end;

  TRadarParam = record
    Tx: TTxParam;
    Rx: TRxParam;
    Ant: TAntennaParam;
  end;

implementation

end.

