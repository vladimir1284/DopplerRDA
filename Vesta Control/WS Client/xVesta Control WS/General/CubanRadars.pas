unit CubanRadars;

interface

uses
  Description,
  Graphics;

function Find( Radar : TRadar ) : TRadarDesc;  stdcall;

function TrustStr    ( Trust : TRadarTrust ) : string;  stdcall;
function BrandStr    ( Brand : TRadarBrand ) : string;  stdcall;
function Manufacturer( Brand : TRadarBrand ) : string;  stdcall;

implementation

const
  theRadars : array[rdNone..rdGranPiedra] of TRadarDesc =
  ( ( Name  : 'Ninguno';
      Owner : 'Nadie';
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
      ( Longitude : 80.1475;  // 80.0851   - 238
        Latitude  : 21.9892;  // 21.5921   +  67
        Altitude  : 1140 );
      Range : 500 ),
    ( Name  : 'Camagüey';
      Owner : 'Loma La Mula, Camagüey';
      Brand : rbMRL5M;
      Trust : rtHigh;
      Location :
      ( Longitude : 77.8451;  // 77.5042
        Latitude  : 21.3836;  // 21.2301
        Altitude  : 160 );
      Range : 450 ),
    ( Name  : 'Pilón';
      Owner : 'Pilón, Granma';
      Brand : rbMRL5M;
      Trust : rtLow;
      Location :
      ( Longitude : 77.5000;  // 77.3000
        Latitude  : 19.9167;  // 19.5500
        Altitude  : 500 );
      Range : 300 ),
    ( Name  : 'La Gran Piedra';
      Owner : 'La Gran Piedra, Sierra Maestra';
      Brand : rbRC32B;
      Trust : rtLow;
      Location :
      ( Longitude : 75.6389;  // 75.3820
        Latitude  : 20.0136;  // 20.0049
        Altitude  : 1214 );
      Range : 500 ) );

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
    ( 'Desconocido', 'MRL-5', 'RC-32B', 'MRL-5M' );
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

end.

