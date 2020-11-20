unit Radars;

interface

uses
  Description;

function Find( Radar : TRadar ) : TRadarDesc;  stdcall;

function TrustStr    ( Trust : TRadarTrust ) : string;  stdcall;
function BrandStr    ( Brand : TRadarBrand ) : string;  stdcall;
function Manufacturer( Brand : TRadarBrand ) : string;  stdcall;


implementation

const
  RadDataDLL = 'RadData.dll';

function Find( Radar : TRadar ) : TRadarDesc;  external RadDataDLL;

function TrustStr    ( Trust : TRadarTrust ) : string;  external RadDataDLL;
function BrandStr    ( Brand : TRadarBrand ) : string;  external RadDataDLL;
function Manufacturer( Brand : TRadarBrand ) : string;  external RadDataDLL;

end.
