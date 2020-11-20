unit Calculus;
{ Following functions are based on the paper by G. Walker , P. S. Ray,
D. Zrnic, R. J. Doviak (1980),  "Time, angle and range averaging of radar echoes
from distributed targets",  published in J. Applied Meteor.19:315-323.}

interface

function NI_Calc(N: Integer; Mode: Integer; Data: array of Real): Extended;
function RadarConstant_Calc(InputData: array of Real; Output: Integer): Real;
function RoRangeB_Calc(d, h, B6: Real): Extended;
function RoRange_Calc(d, h: Real): Real;
function Integral_Calc(d, dcero, b: Real): Extended;
function RoTime_Calc(T, SigmaT: Real): Extended;
function LogCorrel_Calc(Mode: Integer; Data: array of Real): Extended;
function Indep_Calc(Mode: Integer; Data: array of Real): Extended;


implementation

uses Math;

//.....Calculating min. interval (time or range) to get independent samples.....
function Indep_Calc;
var
  Correl : Real;
  I      : Integer;
  OutputData : array[1..3] of Real;
  Threshould : Real;
  Precision  : Real;
begin
  Threshould := 0.02;
  Precision  := 0.1;
  I          := 1;
  Correl     := 1;
  OutputData[2]  := Data[1];
  OutputData[3]  := Data[2];
  while Correl >= Threshould do
    begin
      OutputData[1]  := Data[0] * I * Precision;
      Correl         := LogCorrel_Calc(Mode, OutputData);
      inc(I);
    end;
  I := I - 2;
  OutputData[1] := Data[0] * I * Precision;
  Data[0] := OutputData[1];
  Precision := 0.0001;
  I := 1;
  Correl := 1;
  while Correl >= Threshould do
    begin
      OutputData[1]  := Data[0] + Data[0] * I * Precision;
      Correl         := LogCorrel_Calc(Mode, OutputData);
      inc(I);
    end;
  Result := OutputData[1];
end;
//............Calculating the equivalent number of independent samples..........
function NI_Calc;
var
  K          : Integer;
  Sum, Step  : Extended;
  OutputData : array[1..3] of Real;
begin
  Sum  := 0;
  OutputData[2]  := Data[1];
  OutputData[3]  := Data[2];
  for K := 1 to N-1 do
    begin
      OutputData[1] := Data[0] * K;
      Step := (N-K) * LogCorrel_Calc(Mode, OutputData);
      Sum  := Sum + Step;
    end;
  Result := Power((1/N) + (2 * (1/sqr(N)) * Sum), -1);
end;
//..........Calculating normalized correlation in angle-time space..............
function RoTime_Calc;
begin
Result := exp(-1 * sqr(T / SigmaT)/2);
end;
//..Calculating normalized correlation at radar filter output (B infinite)......
function RoRange_Calc;
begin
  if d <= (h / 2) then
    Result := 1 - (d * 2 / h)
  else
    Result := 0;
end;
//....Calculating normalized correlation at radar filter output (actual B)......
function RoRangeB_Calc;
var
  a	   : Real;     // Numeric constant.
  Rod	   : Extended; // Correlation at distance d.
  Rocero   : Extended; // Correlation at distance 0.
  dcero    : Real;     // Half Pulse extension ( h/2).
  Tau      : Real;     // Pulse duration.
  b        : Real;     // Numeric constant.
const
  C = 300;             // Speed of light in 1000 * km/s.
begin
  tau    := h / C;
  a      := PI / (2 * sqrt(ln(2)));
  b      := sqr(a * B6 * Tau);
  dcero  := h / 2;
  Rod    := Integral_Calc(d, dcero, b);
  Rocero := Integral_Calc(0, dcero, b);
  Result := Rod/Rocero;
end;
//...............Calculating Correlation at Log receiver output.................
function LogCorrel_Calc;
var
  m          : Integer;
  Sum, Step  : Extended;
  Ro         : Extended;
const
  INFINITE = 1000;
begin
  Sum    := 0;
  case Mode of
    0: Ro := RoTime_Calc(Data[0],Data[1]);
    1: Ro := RoRange_Calc(Data[0],Data[1]);
    2: Ro := RoRangeB_Calc(Data[0], Data[1], Data[2])
  else Ro := 0;
  end;
  for m := 1 to INFINITE do
    begin
      Step := (1 / sqr(m)) * Power(Ro, 2 * m);
      Sum  := Sum + Step;
    end;
  Result := (6  / sqr(Pi)) * Sum ;
end;
//...................Calculating Radar Constant.................................
function RadarConstant_Calc;
var
  Lambda_dB : Real;  // Wavelength (read in cm, conv. to m, then conv. to dB).
  h_dB      : Real;  // Pulse Extension (read in meters, then conv. to dB).
  Pt_dB     : Real;  // Peak Power (read in kW, then conv. to dB).
  Theta_dB  : Real;  // BeamWidth (read in deg, conv. to rad, conv. to dB).
  MWLosses  : Real;  // Losses in Microwave circuit (read in dB).
  Gain_dB   : Real;  // Antenna Gain (read in dB).
  Constant  : Real;  // Numeric + Dielectric Constant.
  Tau       : Real;  // Pulse Duration.
  a         : Real;  // Another numeric constant.
  B6        : Real;  // Receiver Band Width (at - 6 dB) in MHz.
// Output:
  RecLosses, RadarConstant: Real;
const
  C = 300;   //Speed of light in vacuun, in 1000 * Km/s.
begin
//Assigning:
  Constant    := 10*Log10(Power(Pi,3)/(Power(2,10) * Ln(2))) + 10*Log10(0.93);
  a           :=  Pi / ( 2 * Sqrt(Ln(2)));
//Reading Input Data:
  Lambda_dB   := 20 * Log10(0.01 * InputData[0]);
  h_dB        := 10 * Log10(InputData[1]);
  Theta_dB    := 20 * Log10(InputData[2] * Pi / 180);
  Pt_dB       := 10 * Log10(InputData[3]*1000);
  Gain_dB     :=  2 * InputData[4];
  MWLosses    :=  InputData[5];
  B6          :=  InputData[6];
  Tau         :=  InputData[1] / C;
//Calculating:
  RecLosses     := 10 * Log10(CotH(a * B6 * Tau) - (1 / (a * B6 * Tau)));

  RadarConstant :=  Constant + Pt_dB + h_dB + Theta_dB - Lambda_dB + Gain_dB
                   - MWLosses + RecLosses;
  if Output = 0 then
    Result := RecLosses
  else
    Result := RadarConstant
end;
//....................Simpson's numeric integration.............................
function Integral_Calc;
var
  li	   : Real;     // Lower limit for integration.
  ls	   : Real;     // Upper limit for integration.
  n,m	   : Integer;
  step	   : Real;     // Numeric integration step.
  Spar	   : Extended; // Sum of all even terms.
  Simpar   : Extended; // Sum of all odd terms.
begin
  m     := 1000;       // Half the number of iterations.
  ls    :=  1;
  li    := -1;
  step  := (ls-li) / (2*m);
  Simpar:=0;
  for n:=0  to (m-1) do
    Simpar := Simpar+((1-abs(li+(2*n+1)*step))*
	       Exp((-0.5)*(b)*(sqr((li+(2*n+1)*step)-(d/dcero)))));
  Spar:=0;
  for n:=1 to (m) do
    Spar := Spar + ((1-abs(li+(2*n)*step))*
	        Exp((-0.5)*(b)*(sqr((li+(2*n)*step)-(d/dcero)))));
  Result := (step/3) * ((2*Spar) + (4*Simpar));
end;


end.
