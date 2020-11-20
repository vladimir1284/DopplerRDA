unit Radar_Data;

interface

uses
  Description;

function Find( Radar : TRadar ) : TRadarDesc;  stdcall;

function TrustStr    ( Trust : TRadarTrust ) : string;  stdcall;
function BrandStr    ( Brand : TRadarBrand ) : string;  stdcall;
function Manufacturer( Brand : TRadarBrand ) : string;  stdcall;

// Nominal parameters, S Band, Long Pulse, reflector S, (no reflector X)
function NominalParams( Brand : TRadarBrand ) : TRadarParam; stdcall;

implementation

const
  theRadars : array[TRadar] of TRadarDesc =
  ( ( Name  : '(ninguno)';
      Owner : '(desconocido)';
      Brand : rbUnknown;
      Trust : rtLow;
      Location :
      ( Longitude : 00.0000;
        Latitude  : 00.0000;
        Altitude  : 0 );
      Range : 0 ),
    ( Name  : 'La Bajada';
      Owner : 'La Bajada, Pinar del Rio';
      Brand : rbRC32B;
      Trust : rtLow;
      Location :
      ( Longitude : 84.4784;  // 84.2842
        Latitude  : 21.9212;  // 21.5516
        Altitude  : 15 );
      Range : 500 ),
    ( Name  : 'Punta del Este';
      Owner : 'Punta del Este, Isla de la Juventud';
      Brand : rbRC32B;
      Trust : rtLow;
      Location :
      ( Longitude : 82.5583;  // 82.3361
        Latitude  : 21.5669;  // 21.3290
        Altitude  : 20 );
      Range : 500 ),
    ( Name  : 'Casablanca';
      Owner : 'Instituto de Meteorología';
      Brand : rbMRL5M;
      Trust : rtMean;
      Location :
      ( Longitude : 82.3500;  // 82.2100
        Latitude  : 23.1495;  // 23.0858
        Altitude  : 50 );
      Range : 300 ),
    ( Name  : 'Pico San Juan';
      Owner : 'Pico San Juan, Cienfuegos';
      Brand : rbMRL5M;
      Trust : rtHigh;
      Location :
      ( Longitude : 80.1475;  // 80.0851
        Latitude  : 21.9892;  // 21.5921
        Altitude  : 1150 );
      Range : 500 ),
    ( Name  : 'Camaguey';
      Owner : 'Loma La Mula, Camaguey';
      Brand : rbMRL5M;
      Trust : rtHigh;
      Location :
      ( Longitude : 77.8451;  // 77.5042
        Latitude  : 21.3836;  // 21.2301
        Altitude  : 160 );
      Range : 450 ),
    ( Name  : 'Pilon';
      Owner : 'Pilon, Granma';
      Brand : rbMRL5M;
      Trust : rtHigh;
      Location :
      ( Longitude : 77.4167;  // 77.25
        Latitude  : 19.9167;  // 19.55
        Altitude  : 508 );
      Range : 450 ),
    ( Name  : 'Gran Piedra';
      Owner : 'La Gran Piedra, Santiago de Cuba';
      Brand : rbRC32B;
      Trust : rtLow;
      Location :
      ( Longitude : 75.6333;  // 75.38
        Latitude  : 20.0333;  // 20.02
        Altitude  : 1230 );
      Range : 500 ),
    ( Name  : 'McGill';
      Owner : 'Marshall Observatory, Montreal';
      Brand : rbResearch;
      Trust : rtHigh;
      Location :
      ( Longitude : 73.9386;
        Latitude  : 45.4250;
        Altitude  : 100 );
      Range : 480 ),
    ( Name  : 'Roma';
      Owner : 'Area di Ricerca Roma - Tor Vergata';
      Brand : rbResearch;
      Trust : rtLow;
      Location :
      ( Longitude :-12.6472;  //-12.3850
        Latitude  : 41.8400;  // 41.5024
        Altitude  : 105 );
      Range : 200 ),
    ( Name  : 'CP2-SCMS';
      Owner : 'Central Florida. SCMS & CaPE location';
      Brand : rbResearch;
      Trust : rtHigh;
      Location :
      ( Longitude : 80.7739;  // 80.4626
        Latitude  : 28.7550;  // 28.4518
        Altitude  : 8 );
      Range : 115 ) );

    // Nominal parameters, S Band, Long Pulse, reflector S, (no reflector X)
    theSLP2RNominalParameters : array[rbRC32B..rbMRL5M] of TRadarParam =
      ((Tx: (Frecuency: 2850;       // RC-32B
             WaveLength: 10.53;
             PulseDuration: 4;
             PulseExtension: 1200;
             PulseRepFrecuency: 160;
             PulseRepPeriod: 6.25;
             PeakPower:  430;
             AvePower: 275.2);
        Rx: (DynamicRange: 70;
             BandWidth:  0.25;
             MinDiscSignal:  102;
             NoiseFigure: 3.5;
             DetectorType: dLogarithm);
        Ant: (Gain: 37.5;
             BeamWidth: 1.9;
             SideLobe: 23;
             ReflectorDiameter: 4;
             Losses: 6.3;
             SigmaV: 0)),
       (Tx: (Frecuency: 2960;   // MRL-5M
             WaveLength: 10.14;
             PulseDuration: 2;
             PulseExtension: 600;
             PulseRepFrecuency: 250;
             PulseRepPeriod: 4;
             PeakPower:  510;
             AvePower: 255);
        Rx: (DynamicRange: 70;
             BandWidth:  1;
             MinDiscSignal:  106;
             NoiseFigure: 3.5;
             DetectorType: dLogarithm);
        Ant: (Gain: 40;
             BeamWidth: 1.5;
             SideLobe: 25;
             ReflectorDiameter: 4.5;
             Losses: 1.9;
             SigmaV: 0))
       );

{ Public procedures & functions }

function Find( Radar : TRadar ) : TRadarDesc;
begin
  Result := theRadars[Radar];
end;

function TrustStr( Trust : TRadarTrust ) : string;
const
  TrustStrs : array[TRadarTrust] of string =
    ('Mala', 'Media', 'Buena' );
begin
  Result := TrustStrs[Trust];
end;

function BrandStr( Brand : TRadarBrand ) : string;
const
  BrandStrs : array[TRadarBrand] of string =
    ('Desconocido', 'MRL-5', 'RC-32B', 'MRL-5M', 'Investigacion');
begin
  Result := BrandStrs[Brand];
end;

function Manufacturer( Brand : TRadarBrand ) : string;
begin
  case Brand of
    rbRC32B         : Result := 'Japonesa';
    rbMRL5, rbMRL5M : Result := 'Sovietica';
    else              Result := 'Desconocida';
  end;
end;

function NominalParams( Brand : TRadarBrand ) : TRadarParam;
begin
  result := theSLP2RNominalParameters[Brand];
end;

end.

