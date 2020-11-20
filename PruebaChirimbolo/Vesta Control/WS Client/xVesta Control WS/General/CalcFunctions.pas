unit CalcFunctions;

interface

uses
  StdCtrls, SysUtils, Plane;

type
  TSingleDynArray = array of Single;
  TSingleDynMatrix = array of TSingleDynArray;

const
  C_cm = 3e10;           // Speed of light in cm/s.
  h_unary  = 300;        // Unary Pulse Extension in m.
  sec2milisec  = 1000;   // conversion constant from seconds to miliseconds.
  UnitConverter = 240;   // Converting from m^3 to mm^6/m^3.
  Re = 6376;             // Radius of Earth in km.

function Edit2Float(E: TEdit): real;

function Frecuency2WaveLength(f: real): real;
function WaveLength2Frecuency(lambda: real): real;

function PulseDuration2Extension(tau: real): real;
function PulseExtension2Duration(h: real): real;

function PulseRepFrecuency2Period(prf: real): real;
function PulseRepPeriod2Frecuency(prt: real): real;

function PeakPower2Ave(prt, tau, peakpower: real): real;
function AvePower2Peak(prt, tau, avepower: real): real;

function MetPotential(WaveLength, PulseExtension, BeamWidth, PeakPower,
                      Gain, Losses, BandWidth, MinDiscSignal: real): real;
function Reflectivity(MetPotential, Distance, Power: real): real;
function Rain(A, B, Z: real): real;
function Height(D, E: real): real;
function TanRes(D, W: real): real;
function Azimut(Lt1, Ln1, Lt2, Ln2, Range: real): real;
function Range(Lt1, Ln1, Lt2, Ln2: real): real;
function Speed(S, T: real): real;

function Reckon(lat, lon, rg, az: single): T2DLocation;

//==================Matrix functions=====================

function  MMult(M1, M2: TSingleDynMatrix): TSingleDynMatrix;
function  MTranspose(M: TSingleDynMatrix): TSingleDynMatrix;
procedure MAlphaMult(var M: TSingleDynMatrix; Alpha: single);
function  MDeleteRowCol(M: TSingleDynMatrix; r, c: integer): TSingleDynMatrix;
function  MAlgComplement(M: TSingleDynMatrix; r, c: integer): single;
function  MDeterminant(M: TSingleDynMatrix): single;
function  MInverse(M: TSingleDynMatrix): TSingleDynMatrix;

implementation

uses
  Math, Calculus, Angle;

function Edit2Float;
begin
  if (E.Text = '') or (E.Text = '-') then Result := 0
  else Result := StrToFloat(E.Text);
end;

function Frecuency2WaveLength;
begin
  if f <> 0 then
    result := C_cm / (f * 1e6)
  else
    result := 0;
end;

function WaveLength2Frecuency;
begin
  if lambda <> 0 then
    result := C_cm / (lambda * 1e6)
  else
    result := 0;
end;

function PulseDuration2Extension;
begin
  result := h_unary * tau
end;

function PulseExtension2Duration;
begin
  result := h / h_unary ;
end;

function PulseRepFrecuency2Period;
begin
  if prf <> 0 then
    result := sec2milisec / prf
  else
    result := 0;
end;

function PulseRepPeriod2Frecuency;
begin
  if prt <> 0 then
    result := sec2milisec / prt
  else
    result := 0;
end;

function PeakPower2Ave;
begin
  if prt <> 0 then
    result := peakpower * (tau / prt)
  else
    result := 0;
end;

function AvePower2Peak;
begin
  if tau <> 0 then
    result := avepower * (prt / tau)
  else
    result := 0;
end;

function MetPotential;
var
  RadarConstant,
  Pro_dBW: real;
begin
  if (Wavelength <> 0) and (PulseExtension <> 0) and (BeamWidth <> 0) and
     (PeakPower  <> 0) and (Gain           <> 0) and (Losses    <> 0) and
     (BandWidth  <> 0) and (MinDiscSignal  <> 0) then
    begin
      Pro_dBW       := 30 + MinDiscSignal; // in dBW.
      RadarConstant := RadarConstant_Calc([WaveLength, PulseExtension, BeamWidth, PeakPower, Gain, Losses, BandWidth], 1);
      result :=  UnitConverter - (RadarConstant + Pro_dBW);
    end
  else
    result := 0;
end;

function Reflectivity;
begin
  if Distance <> 0 then
    result := MetPotential + 20*log10(Distance) + Power
  else
    result := 0;
end;

function Rain;
begin
  if (A <> 0) and (B <> 0) and (Z <> 0) then
    result := Power(Power(Z/10, 10)/A , 1/B)
  else
    result := 0;
end;

function Height;
begin
  if (Frac(E) = 0) and ((Trunc(E) Mod 90) = 0) then
    result := 0
  else
    result := D*tan(E*pi/180)
end;

function TanRes;
begin
  result := W*pi/180*D
end;

function Azimut;
var
  A: real;
begin
  if Range = 0 then
    A:= 0
  else
    begin
      A := (Sin(Lt2) - Cos(Range/Re) * Sin(Lt1)) / (Sin(Range/Re) * Cos(Lt1));
      if (A < 1) and (A > -1) then A := ArcCos(A) * 180 /Pi
      else if Round(A) = -1 then A := 180
      else if Round(A) =  1 then A := 0
    end;
  if Sin(Ln1-Ln2) < 0 then A := 360 - A;
  result := A;
end;

function Range;
begin
  Result := ArcCos (Sin(Lt1) * Sin(Lt2) +  Cos(Lt1) * Cos(Lt2) * Cos(Ln1 - Ln2)) * Re;
end;

function Speed;
begin
  if T <> 0 then
    result := S/T
  else
    result := 0;
end;

function Reckon;
var
  trg, taz, tlat, tlon, t1, t2, t3: single;
begin
  trg  := rg/Re;
  taz  := az*pi/180;
  tlat := lat*pi/180;
  tlon := lon*pi/180;
  t1 := sin(tlat)*cos(trg);
  t2 := cos(tlat)*sin(trg)*cos(taz);
  Result.Latitude := arcsin(t1 + t2) * 180/pi;
  t1 := sin(trg)*sin(taz);
  t2 := cos(tlat)*cos(trg);
  t3 := sin(tlat)*sin(trg)*cos(taz);
  Result.Longitude := (tlon + Phi(t1, t2 - t3))*180/pi - 90;
end;

function MMult(M1, M2: TSingleDynMatrix): TSingleDynMatrix;
var
  Mr, Mc, r, c, i: integer;
begin
  Mr := High(M1) + 1;
  Mc := High(M2[0]) + 1;
  SetLength(Result, Mr, Mc);
  for r := 0 to Mr - 1 do
    for c := 0 to Mc - 1 do
     begin
       Result[r, c] := 0;
       for i := 0 to High(M1[0]) do
         Result[r, c] := Result[r, c] + M1[r, i]*M2[i, c];
     end;
end;

function MTranspose(M: TSingleDynMatrix): TSingleDynMatrix;
var
  r, c: integer;
begin
  SetLength(Result, High(M[0]) + 1, High(M) + 1);
  for r := 0 to High(M) do
    for c := 0 to High(M[0]) do
      Result[c, r] := M[r, c];
end;

procedure MAlphaMult(var M: TSingleDynMatrix; Alpha: single);
var
  i, j: integer;
begin
  for i := 0 to High(M) do
    for j := 0 to High(M[0]) do
      M[i, j] := M[i, j]*Alpha;
end;

function MDeleteRowCol(M: TSingleDynMatrix; r, c: integer): TSingleDynMatrix;
var
  i, j, rr, cc: integer;
begin
  SetLength(Result, High(M), High(M[0]));
  rr := 0;
  for i := 0 to High(Result) do
    begin
      cc := 0;
      if rr = r then Inc(rr);
      for j := 0 to High(Result[0]) do
        begin
          if cc = c then Inc(cc);
          Result[i, j] := M[rr, cc];
          Inc(cc);
        end;
      Inc(rr);
    end;
end;

function MAlgComplement(M: TSingleDynMatrix; r, c: integer): single;
var
  s: integer;
begin
  if odd(r + c) then s := -1 else s := 1;
  Result := s*MDeterminant(MDeleteRowCol(M, r, c));
end;

function MDeterminant(M: TSingleDynMatrix): single;
var
  r: integer;
begin
  Result := 0;
  if (High(M) = 0) and (High(M) = 0) then
    Result := M[0, 0]
  else if (High(M) = 1) and (High(M[0]) = 1) then
    Result := M[0, 0]*M[1, 1] - M[0, 1]*M[1, 0]
  else
    for r := 0 to High(M) do
      Result := Result + M[r, 0]*MAlgComplement(M, r, 0);
end;

function MInverse(M: TSingleDynMatrix): TSingleDynMatrix;
var
  d: single;
  r, c: integer;
begin
  d := MDeterminant(M);
  SetLength(Result, High(M) + 1, High(M[0]) + 1);
  for r := 0 to High(M) do
    for c := 0 to High(M[0]) do
      Result[r, c] := MAlgComplement(M, r, c)/d;
  Result := MTranspose(Result);
end;

end.
