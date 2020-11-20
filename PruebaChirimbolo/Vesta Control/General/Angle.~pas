unit Angle;

interface

  {$I Angles.inc}  // Angle constants

type
  TAngle = smallint;

  PAngleArray = ^TAngleArray;
  TAngleArray = array[0..0] of TAngle;

  TVector = array[0..1] of single;

const
  DegreeToRadian = Pi/180;
  RadianToDegree = 180/Pi;

  vZero = 0.00001;   // Zero Value in -vZero..vZero

const
  Codes         = 16384;
  CodesPerAngle = Codes/360;
  AnglesPerCode = 360/Codes;
  MaxVelocity   = 100; {m/s}

function CodeAngle( aCode   : TAngle ) : single;
function AngleCode( anAngle : single  ) : TAngle;

function Angle2Byte( anAngle : single ) : byte;
function Byte2Angle( aByte : byte ) : single;

function Velocity2Byte( aVel : single ) : byte;
function Byte2Velocity( aByte : byte ) : integer;

function Distance( A1, A2 : TAngle ) : TAngle;

function Sine(anAngle: TAngle): single;
function Cosine(anAngle: TAngle): single;

function VADVector(v1, v2, az1, az2, el: single): TVector;

function AngleReduc(anAngle: single): single;

function Phi(Vx, Vy: single): single; //Vector's angle
function Rho(Vx, Vy: single): single; //Vector's module
function Vx(Rho, Phi: single): single;  //Vector's x component
function Vy(Rho, Phi: single): single;  //Vector's y component

implementation

// Public procedures & functions

uses
  Math;

function Distance( A1, A2 : TAngle ) : TAngle;
begin
  Result := A1 - A2;
  if Result >= 8192
    then dec(Result, 16384);
  if Result < -8191
    then inc(Result, 16384);
end;

function CodeAngle( aCode : TAngle ) : single;
begin
  Result := aCode * AnglesPerCode;
end;

function AngleCode( anAngle : single ) : TAngle;
begin
  Result := round(anAngle * CodesPerAngle)
end;

function Sine;
begin
  Result := sin(CodeAngle(anAngle)*pi/180);
end;

function Cosine;
begin
  Result := cos(CodeAngle(anAngle)*pi/180);
end;

function Angle2Byte;
begin
  result := round(AngleReduc(anAngle)*256/2/pi);
end;

function Byte2Angle;
begin
  result := aByte*2*pi/256;
end;

function Velocity2Byte;
begin
  result := Round(aVel*256/MaxVelocity);
end;

function Byte2Velocity;
begin
  result := Round(aByte*MaxVelocity/256*1.944); {kn}
end;

function VADVector;
var
  saz1, saz2, caz1, caz2, cele,
  d, d1, d2, U, V, vel1, vel2,
  R, A: single;
begin
  saz1 := Sin(az1*pi/180);
  saz2 := Sin(az2*pi/180);
  caz1 := Cos(az1*pi/180);
  caz2 := Cos(az2*pi/180);
  cele := Cos(el*pi/180);
  vel1 := v1;
  vel2 := v2;
  d  := saz1*cele*caz2*cele - saz2*cele*caz1*cele;
  d1 := vel1*caz2*cele - vel2*caz1*cele;
  d2 := vel2*saz1*cele - vel1*saz2*cele;
  if not IsZero(d, vZero)then
    begin
      U := d1/d;
      V := d2/d;
      R := Rho(U, V);
{      if R > 5 then
        begin
          Result[0] := 0;
          Result[1] := 0;
        end
      else}
        begin
          Result[0] := U;
          Result[1] := V;
        end;
    end
  else
    begin
      Result[0] := 0;
      Result[1] := 0;
    end;
end;

function Phi;
begin
  if IsZero(Vx, vZero) then
    begin
      if IsZero(Vy, vZero) then
        Result := 0
      else if Vy > 0 then
        Result := pi/2
      else
        Result := 3*pi/2
    end
  else if IsZero(Vy, vZero) then
    begin
      if Vx > 0 then
        Result := 0
      else
        Result := pi
    end
  else if (Vx > 0) and (Vy > 0) then
    Result := AngleReduc(arctan(Vy/Vx))        // 1
  else if (Vx < 0) and (Vy > 0) then
    Result := AngleReduc(pi + arctan(Vy/Vx))   // 2
  else if (Vx < 0) and (Vy < 0) then
    Result := AngleReduc(pi + arctan(Vy/Vx))   // 3
  else if (Vx > 0) and (Vy < 0) then
    Result := AngleReduc(arctan(Vy/Vx))        // 4
  ;
end;

function Rho;
begin
  Result := sqrt(sqr(Vx) + sqr(Vy));
end;

function Vx;
begin
  Vx := Rho*cos(Phi);
end;

function Vy;
begin
  Vy := Rho*sin(Phi);
end;

function AngleReduc;
begin
  if anAngle > 2*pi then
    Result := AngleReduc(anAngle - 2*pi)
  else if anAngle < 0 then
    Result := AngleReduc(anAngle + 2*pi)
  else Result := anAngle
end;

end.





