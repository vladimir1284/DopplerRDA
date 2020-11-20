unit FrameSunPosition;

interface

uses
  SysUtils, Forms,
  Rda_TLB, StdCtrls, ExtCtrls, Controls, Graphics, Classes;

type
  TSunPositionCalcMethod = (cm_SUNAE, cm_DIN, cm_SolPos, cm_Met);

  TFrame_SunPosition = class(TFrame)
    Image1: TImage;
    LRadarLongitude: TLabel;
    LRadarLatitude: TLabel;
    LRadarAltitude: TLabel;
    Image2: TImage;
    LSunAzimuth: TLabel;
    LSunElevation: TLabel;
    CheckBox1: TCheckBox;
    LSunRise: TLabel;
    LSunSet: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    SunCalcMethod: TComboBox;
    Label3: TLabel;
    title: TLabel;
    LDate: TLabel;
    Label4: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure SunCalcMethodSelect(Sender: TObject);
  private
    fConfiguration : IConfiguration;
    fSunLatitude,
    fSunLongitude,
    RadarLatitude,
    RadarAltitud,
    RadarLongitude,
    fSunAzimut,
    fSunElevation : double;
    fTimeZone : double;
    fSunRise,
    fSunSet,
    SystemTime : TDateTime;
    TimeZone : double;
    CalcMethod : TSunPositionCalcMethod;

    procedure SetConfiguration( Value : IConfiguration );
    //Utils
    function  DayOfYear( aDateTime : TDateTime ) : word;
    //No sirven
    procedure CalcSunPositionByRinehart( const aDateTime : TDateTime );
    procedure CalcSunPositionByPaltridgeAndPlatt( const aDateTime : TDateTime );
    //Sirven
    procedure CalcSunPositionBySUNAE( const aDateTime : TDateTime );
    procedure CalcSunPositionByDIN( const aDateTime : TDateTime );
    procedure CalcSunPositionBySolPos( const aDateTime : TDateTime );
    procedure CalcSunPositionByMet( const aDateTime : TDateTime );
    procedure CalcSunPosition( const aDateTime : TDateTime );
    //Sunrise & Sunset
    procedure SunRise( const aDateTime : TDateTime );
    procedure SunSet( const aDateTime : TDateTime );
  public
    property  Configuration : IConfiguration read fConfiguration write SetConfiguration;
    property  SunLatitude : double  read fSunLatitude;
    property  SunLongitude : double read fSunLongitude;
    property  SunAzimut : double    read fSunAzimut;
    property  SunElevation : double read fSunElevation;
    procedure UpdateView;
    procedure RefreshRadarPosition;
  end;

implementation

uses
  Shell_Client, Angle, DateUtils, Math, CalcSunPosition;

{$R *.dfm}

{ TFrame_SunPosition }

procedure TFrame_SunPosition.SetConfiguration(Value: IConfiguration);
begin
  fTimeZone := TimeZone;
  fConfiguration := Value;
  CalcMethod := cm_Met;
  SunCalcMethod.ItemIndex := 3;
  CheckBox1.Enabled := assigned(fConfiguration);
  RefreshRadarPosition;
end;

procedure TFrame_SunPosition.UpdateView;
begin
  try
    if Assigned( fConfiguration )
      then
        begin
          TimeZone := ShellClient.VestaRDA.SystemTimeZone;
          SystemTime := ShellClient.VestaRDA.SystemDateTime;
          LDate.Caption := DateTimeToStr( SystemTime );
          //Display Radar's position
          LRadarLatitude.Caption  := 'Latitud: ' + FormatFloat( '0.0000', RadarLatitude );
          LRadarLongitude.Caption := 'Longitud: ' + FormatFloat( '0.0000',  RadarLongitude );
          LRadarAltitude.Caption  := 'Altitud: ' + FloatToStr( RadarAltitud ) + ' metros';
          LSunRise.Caption := TimeToStr( fSunRise );
          LSunSet.Caption  := TimeToStr( fSunSet );
          //Sun's position
          CalcSunPosition( SystemTime );
          //Display Sun's position
          LSunAzimuth.Caption  := 'Az: ' + FormatFloat( '0.0', fSunAzimut );
          LSunElevation.Caption := 'El: ' + FormatFloat( '0.0',  fSunElevation );
          //In Case of Sun
          if CheckBox1.Checked
            then
              with ShellClient do
              begin
                MotorEl.Enabled := false;
                MotorEl.Antenna.Desired := AngleCode( fSunElevation );
                MotorEl.CheckBox1.Checked := true;
                MotorAz.Enabled := false;
                Motoraz.Antenna.Desired := AngleCode( fSunAzimut );
                MotorAz.CheckBox1.Checked := true;
              end;
        end;
  except
  end;
end;

procedure TFrame_SunPosition.CheckBox1Click(Sender: TObject);
begin
  if (Sender as TCheckBox).Checked
    then UpdateView
    else
      with ShellClient do
      begin
        MotorEl.CheckBox1.Checked := false;
        MotorEl.Enabled := true;
        MotorAz.CheckBox1.Checked := false;
        MotorAz.Enabled := true;
      end;
end;

procedure TFrame_SunPosition.CalcSunPositionByRinehart( const aDateTime : TDateTime );

  function SunDeclin(const DayOfYear: integer): Extended;
  begin
    result := - 23.5 * cos( (DayofYear + 10.3) * 2 * Pi / 365);
  end;

  function SunEqOfTime( const DayOfYear: Integer): Extended;
  var
    tz : Extended;// Day of the year expressed in radians.
  begin
    tz  := 2 * Pi * DayofYear / 365.25;
    result := 0.123 * cos(tz + (87 * Pi/180)) - sin((tz + (10 * Pi/180))/0.5)/6
  end;

  function LocalHourAngle(DayOfYear: Integer; aTime : Extended): Extended;
  var
    StdLong    : Extended; // Standard longitude, eg: 75, 90, etc.
    TimeCorrec : Extended; // Time correction, in hours, for our longitude.
    Eqh        : Extended; // Equation of Time.
  begin
    Eqh := SunEqOfTime( DayOfYear );
    StdLong := (round(RadarLongitude/15))*15;   //-75;
    TimeCorrec := (StdLong - RadarLongitude)/15;
    Result := (aTime + TimeCorrec + Eqh + 12) * (360/24);
    if Result > 360 then Result := Result - 360 else
    if Result < 0 then Result := Result + 360;
  end;

  function SunAzimuth(DayOfYear: Integer; aTime : Extended): Extended;
  var
    LHA    : Extended; // Local Hour Angle.
    Declin : Extended; // Sun declination.
    LatR   : Extended; // Latitude in radians.
  begin
    Declin := DegToRad( SunDeclin( DayOfYear ) );
    LHA    := DegToRad( LocalHourAngle( DayOfYear , aTime ) );
    LatR   := DegToRad( RadarLatitude );
    Result := 180 - abs(RadToDeg(ArcTan( Sin(LHA)/( Cos(LHA)*Sin(LatR)-Tan(Declin)*Cos(LatR) ))));
  end;

  function SunElev(DayOfYear: Integer; aTime : Extended): Extended;
  var
    LHA    : Extended; // Local Hour Angle.
    Declin : Extended; // Sun declination.
  begin
    Declin := SunDeclin( DayOfYear );
    LHA    := LocalHourAngle( DayOfYear, aTime );
    Result := RadToDeg(ArcSin(Sin(DegToRad(RadarLatitude))*Sin(DegToRad(Declin)) +
              Cos(DegToRad(RadarLatitude))*Cos(DegToRad(Declin))*Cos(DegToRad(LHA))));
  end;

var
  Hours           : Extended;
  DayOfYear       : Integer;    // Ordinal day of the year.
begin
  Hours := HourOf(aDateTime) + (MinuteOf(aDateTime))/60 - TimeZone;
  if YearOf( aDateTime ) mod 4 = 0
    then DayOfYear := DaysBetween( StartOfTheYear( aDateTime ), aDateTime ) - 1
    else DayOfYear := DaysBetween( StartOfTheYear( aDateTime ), aDateTime );
  fSunElevation := SunElev( DayOfYear, Hours );
  fSunAzimut    := SunAzimuth( DayOfYear, Hours );
end;

procedure TFrame_SunPosition.CalcSunPositionByPaltridgeAndPlatt( const aDateTime : TDateTime );

  function SunDeclin(const DayOfYear: integer): Extended;
  var
    tz : Extended;// Day of the year expressed in radians.
  begin
    tz  := 2 * Pi * DayofYear / 365;
    Result :=( 0.006918 - 0.399912 * cos(tz) + 0.070257 * sin(tz)    +
                    (- 0.006758 * cos(2*tz)) + 0.000907 * sin(2*tz)  +
                    (- 0.002697 * cos(3*tz)) + 0.001480 * sin(3*tz) )* 180/Pi;
  end;

  function SunEqOfTime( const DayOfYear: Integer): Extended;
  var
    tz : Extended;// Day of the year expressed in radians.
  begin
    tz  := 2 * Pi * DayofYear / 365;
    Result :=( 0.000075 + (0.001868 * cos(tz)) - (0.032077 * sin(tz))    +
              (- 0.014615 * cos(2*tz)) - (0.040849 * sin(2*tz)) ) * 24/(2*Pi);
  end;

  function LocalHourAngle(DayOfYear: Integer; aTime : Extended): Extended;
  var
    TimeCorrec : Extended; // Time correction, in hours, for our longitude.
    Eqh        : Extended; // Equation of Time.
  begin
    Eqh := SunEqOfTime( DayOfYear );
    TimeCorrec := (RadarLongitude)/15;
    Result := (aTime + TimeCorrec + Eqh  - 7) * (360/24);
    if Result > 360 then Result := Result - 360 else
    if Result < 0 then Result := Result + 360
  end;

  function SunElev(DayOfYear: Integer; aTime : Extended): Extended;
  var
    LHA    : Extended; // Local Hour Angle.
    Declin : Extended; // Sun declination.
  begin
    Declin := SunDeclin( DayOfYear );
    LHA    := LocalHourAngle( DayOfYear, aTime );
    Result := RadToDeg(ArcSin(Sin(DegToRad(RadarLatitude))*Sin(DegToRad(Declin)) +
              Cos(DegToRad(RadarLatitude))*Cos(DegToRad(Declin))*Cos(DegToRad(LHA))));
  end;

  function SunAzimuth(DayOfYear: Integer; aTime : Extended): Extended;
  var
    Declin : Extended; // Sun declination.
    LatR   : Extended; // Latitude in radians.
    Elev   : Extended; // Sun elevation.
  begin
    Declin := DegToRad( SunDeclin( DayOfYear ) );
    LatR   := DegToRad( RadarLatitude );
    Elev   := DegToRad( SunElev( DayofYear, aTime ) );
    Result := RadToDeg(ArcCos((Sin(Declin)-Sin(LatR)*Sin(Elev))/(Cos(LatR)*Cos(Elev))));
  end;

var
  Hours           : Extended;
  DayOfYear       : Integer;    // Ordinal day of the year.
begin
  Hours := HourOf(aDateTime)+ (MinuteOf(aDateTime))/60 - TimeZone;
  if YearOf( aDateTime ) mod 4 = 0
    then DayOfYear := DaysBetween( StartOfTheYear( aDateTime ), aDateTime ) - 1
    else DayOfYear := DaysBetween( StartOfTheYear( aDateTime ), aDateTime );
  fSunElevation := SunElev( DayOfYear, Hours );
  fSunAzimut    := SunAzimuth( DayOfYear, Hours );
end;

function TFrame_SunPosition.DayOfYear(aDateTime: TDateTime): word;
var
  FirstDay : TDateTime;
begin
  FirstDay := EncodeDateTime( YearOf( aDateTime ), 1, 1, 0, 0, 0, 0 );
  result := DaysBetween( FirstDay, aDateTime );
end;

procedure TFrame_SunPosition.CalcSunPositionByDIN(const aDateTime: TDateTime);
var
  J, J2,
  Zgl, MOZ, WOZ, w,
  decl,
  sunaz, sunhi,
  asinGs, acosAs : double;
begin
  J2 := 365;
  if (YearOf(aDateTime) mod 4 = 0)
    then J2 := J2 + 1;
  J := DayOfYear( aDateTime );
  MOZ := HourOf(aDateTime) + 1.0/60*MinuteOf(aDateTime) + 1.0/3600*SecondOf(aDateTime) - timezone + 1;
  MOZ := MOZ - 4 * (15 - RadarLongitude) / 60;
  J := J * 360 / J2 + MOZ / 24;
  decl := 0.3948 - 23.2559 * cos(DegToRad(J + 9.1)) - 0.3915 * cos(DegToRad(2 * J + 5.4)) - 0.1764 * cos(DegToRad(3 * J + 26.0));
  Zgl := 0.0066 + 7.3525 * cos(DegToRad(J + 85.9)) + 9.9359 * cos(DegToRad(2 * J + 108.9)) + 0.3387 * cos(DegToRad(3 * J + 105.2));
  WOZ := MOZ + Zgl / 60;
  w := (12 - WOZ) * 15;
  asinGs := cos(DegToRad(w)) * cos(DegToRad(RadarLatitude)) * cos(DegToRad(decl)) + sin(DegToRad(RadarLatitude)) * sin(DegToRad(decl));
  if (asinGs > 1)
    then asinGs := 1;
  if (asinGs < -1)
    then asinGs := -1;
  sunhi := RadToDeg(ArcSin(asinGs));
  acosAs := (sin(DegToRad(sunhi)) * sin(DegToRad(RadarLatitude)) - sin(DegToRad(decl))) / (cos(DegToRad(sunhi)) * cos(DegToRad(RadarLatitude)));
  if (acosAs > 1)
    then acosAs := 1;
  if (acosAs < -1)
    then acosAs := -1;
  sunaz := RadToDeg(ArcCos(acosAs));
  if ((WOZ > 12) or (WOZ < 0))
    then sunaz := 180 + sunaz
    else sunaz := 180 - sunaz;
  fSunAzimut := Round(sunaz*1000)/1000;
  fSunElevation := Round(sunhi*1000)/1000;
end;

procedure TFrame_SunPosition.CalcSunPositionBySolPos(const aDateTime: TDateTime);
var
  S_year, S_month, S_day, S_hour, S_minute, S_second : integer;
  S_Temp, S_Press, S_Daynum, S_Dayang,
  sd, cd , d2 , c2, s2,
  S_erv, S_utime, delta, leap,
  S_julday, S_ectime, S_mnlong,
  S_mnanom ,S_eclong , S_ecobli,
  S_declin ,top, bottom , S_rascen,
  S_gmst, S_lmst, S_hrang,
  ch, cl, sl, cz , cdcl,
  S_zenetr, S_ssha , cssha,
  S_sbcf, p, t1, t2,
  S_tst, S_tstfix, S_eqntim,
  S_sunrise, S_sunset,
  cecl, ca, ce, se, elev , refcor,
  tanelev, prestemp : double;
begin
  S_year := YearOf( aDateTime );
  S_month := MonthOf( aDateTime );
  S_day := DayOf( aDateTime );
  S_hour := HourOf( aDateTime );
  S_minute := MinuteOf( aDateTime );
  S_second := SecondOf( aDateTime );

  if (ftimezone < -12)
    then ftimezone := ftimezone + 12;
  if (ftimezone > 12)
    then ftimezone := ftimezone - 12;
  S_Temp := 25;
  S_Press := 1013;

  S_Daynum := DayOfYear( aDateTime );
  if (S_year < 0)
    then S_year := 2001
    else if (S_year < 100)
           then S_year := S_year + 1900;
  S_Dayang := 360 * (S_Daynum - 1) / 365;
  sd := sin(DegToRad(S_Dayang));
  cd := cos(DegToRad(S_Dayang));
  d2 := 2 * S_Dayang;
  c2 := cos(DegToRad(d2));
  s2 := sin(DegToRad(d2));
  S_erv := 1.00011 + 0.034221 * cd + 0.00128 * sd + 0.000719 * c2 + 0.000077 * s2;
  S_utime := S_hour * 3600 + S_minute * 60 + S_second;
  S_utime := S_utime / 3600 - timezone;
  delta := S_year - 1949;
  leap := trunc(delta / 4);
  S_julday := 32916.5 + delta * 365 + leap + S_Daynum + S_utime / 24;
  if ((S_year mod 100 = 0) and (S_year mod 400 <> 0))
    then S_julday := S_julday - 1;
  S_ectime := S_julday - 51545;
  S_mnlong := 280.46 + 0.9856474 * S_ectime;
  S_mnlong := S_mnlong - 360 * trunc(S_mnlong / 360);
  if (S_mnlong < 0)
    then S_mnlong := S_mnlong + 360;
  S_mnanom := 357.528 + 0.9856003 * S_ectime;
  S_mnanom := S_mnanom - 360 * trunc(S_mnanom / 360);
  if (S_mnanom < 0)
    then S_mnanom := S_mnanom + 360;
  S_eclong := S_mnlong + 1.915 * sin(DegToRad(S_mnanom)) + 0.02 * sin(2 * DegToRad(S_mnanom));
  S_eclong := S_eclong - 360 * trunc(S_eclong / 360);
  if (S_eclong < 0)
    then S_eclong := S_eclong + 360;
  S_ecobli := 23.439 + 0.0000004 * S_ectime;
  S_declin := RadToDeg(ArcSin(sin(DegToRad(S_ecobli)) * sin(DegToRad(S_eclong))));
  top := cos(DegToRad(S_ecobli)) * sin(DegToRad(S_eclong));
  bottom := cos(DegToRad(S_eclong));
  S_rascen := RadToDeg(ArcTan2(top, bottom));
  if (S_rascen < 0)
    then S_rascen := S_rascen + 360;
  S_gmst := 6.697375 + 0.0657098242 * S_ectime + S_utime;
  S_gmst := S_gmst - 24 * trunc(S_gmst / 24);
  if (S_gmst < 0)
    then S_gmst := S_gmst + 24;
  S_lmst := S_gmst * 15 + RadarLongitude;
  S_lmst := S_lmst - 360 * trunc(S_lmst / 360);
  if (S_lmst < 0)
    then S_lmst := S_lmst + 360;
  S_hrang := S_lmst - S_rascen;
  if (S_hrang < -180)
    then S_hrang := S_hrang + 360
    else if (S_hrang > 180)
           then S_hrang := S_hrang - 360;
  cd := cos(DegToRad(S_declin));
  ch := cos(DegToRad(S_hrang));
  cl := cos(DegToRad(RadarLatitude));
  sd := sin(DegToRad(S_declin));
  sl := sin(DegToRad(RadarLatitude));
  cz := sd * sl + cd * cl * ch;
  if (cz > 1)
    then cz := 1
    else if (cz < -1)
           then cz := -1;
  S_zenetr := RadToDeg(ArcCos(cz));
  if (S_zenetr > 99)
    then S_zenetr := 99;
  S_ssha := 90;
  cdcl := cd * cl;
  if (abs(cdcl) >= 0.001)
    then cssha := sl * sd / cdcl;
  if (cssha < -1)
    then S_ssha := 180
    else if (cssha > 1)
           then S_ssha := 0
           else S_ssha := RadToDeg(ArcCos(cssha));
  p := 0.1526 * cd * cd * cd;
  t1 := DegToRad(sl * sd * S_ssha);
  t2 := cl * cd * sin(DegToRad(S_ssha));
  S_sbcf := 0.04 + 1 / (1 - p * (t1 + t2));
  S_tst := (180 + S_hrang) * 4;
  S_tstfix := S_tst - S_hour * 60 - S_minute - S_second / 60;
  S_eqntim := S_tstfix + 60 * timezone - 4 * RadarLongitude;
  if (S_ssha < 0)
    then
      begin
        S_sunrise := 2999;
        S_sunset := -2999;
      end
    else
      begin
        if(S_ssha >= 179)
          then
            begin
              S_sunrise := -2999;
              S_sunset := 2999;
            end
          else
            begin
              S_sunrise := 720 - 4 * S_ssha - S_tstfix;
              S_sunset := 720 + 4 * S_ssha - S_tstfix;
            end;
      end;
  ce := sin(DegToRad(S_zenetr));
  se := cos(DegToRad(S_zenetr));
  fSunAzimut := 180;
  cecl := ce * cl;
  if (abs(cecl) >= 0.001)
    then ca := (se * sl - sd) / cecl;
  if (ca > 1)
    then ca := 1
    else if (ca < -1)
           then ca := -1;
  fSunAzimut := 180 - RadToDeg(ArcCos(ca));
  if (S_hrang > 0)
    then fSunAzimut := 360 - fSunAzimut;
  elev := 90 - S_zenetr;
  if (elev > 85)
    then refcor := 0
    else
      begin
        tanelev := tan(DegToRad(elev));
        if (elev >= 5)
          then refcor := 58.1 / tanelev - 0.07 / (tanelev * tanelev * tanelev) + 0.000086 / (tanelev * tanelev * tanelev * tanelev * tanelev)
          else
            if (elev >= -0.575)
              then refcor := 1735 + elev * (-518.2 + elev * (103.4 + elev * (-12.79 + elev * 0.711)))
              else refcor := -20.774 / tanelev;
      end;
  prestemp := (S_Press * 283) / (1013 * (273 + S_Temp));
  refcor := refcor * prestemp / 3600;
  fSunElevation := elev + refcor;
end;

procedure TFrame_SunPosition.CalcSunPositionBySUNAE(const aDateTime: TDateTime);
var
  PI2 : double;
  delyr : integer;
  leap : integer;
  T, TM,
  theta, g, el, eps,
  ra, decl, phi,
  ST, S, H, E, A, ETS, R,
  asETS, asA : double;
begin
  PI2 := PI * 2;
  delyr := YearOf(aDateTime) - 1980;
  leap := delyr mod 4;
  T := HourOf(aDateTime) + (MinuteOf(aDateTime) + SecondOf(aDateTime)/60)/60 - timezone;
  TM := delyr * 365 + leap + DayOfYear( aDateTime ) - 1 + T / 24;
  if (delyr = leap*4) or ((delyr < 0) and (delyr <> leap*4))
    then TM := TM - 1;
  theta := DegToRad(360 * TM / 365.25);
  g := -0.031271 - 0.000000453963 * TM + theta;
  el := 4.900968 + 0.000000367474 * TM + (0.033434 - 0.0000000023 * TM) * sin(g) + 0.000349 * sin(2 * g) + theta;
  eps := 0.40914 - 0.0000000062149 * TM;
  ra := ArcTan2(sin(el) * cos(eps), cos(el));
  if (ra < 0)
    then ra := ra + PI2;
  decl := ArcSin( sin(el) * sin(eps));
  ST := 1.759335 + PI2 * (TM / 365.25 - delyr) + 0.0000003694 * TM;
  if (ST > PI2)
    then ST := ST - PI2;
  S := ST + DegToRad(T * 15 + RadarLongitude);
  if (S > PI2)
    then S := S - PI2;
  H := ra - S;
  phi := DegToRad(RadarLatitude);
  asETS := sin(phi) * sin(decl) + cos(phi) * cos(decl) * cos(H);
  if (asETS > 1)
    then ETS := 1;
  if (asETS < -1)
    then ETS := -1;
  ETS := RadToDeg(ArcSin(asETS));
  R := 3.51561 * (0.1594 + 0.0196 * ETS + 0.00002 * ETS * ETS) / (1 + 0.505 * ETS + 0.0845 * ETS * ETS);
  E := ETS + R;
  asA := cos(decl) * sin(H) / cos(DegToRad(ETS));
  if (asA > 1)
    then A := 1;
  if (asA < -1)
    then A := -1;
  A := RadToDeg(ArcSin(asA));
  if (sin(DegToRad(E)) <= (sin(decl) / sin(phi)))
    then
      begin
        if (A < 0)
          then A := A + 360;
        A := 180 - A;
      end;
  fSunAzimut := 180 - A;
  fSunElevation := E;
end;

procedure TFrame_SunPosition.SunRise(const aDateTime: TDateTime);
var
  hour, min, sec : integer;
  DeltaT, TD1, TD3, TD2 : integer;
begin
  DeltaT := 900; // 15 Min
  TD3 := 86400;
  TD1 := 0;
  hour := trunc(TD1/3600);
  min := trunc((TD1 mod 3600)/60);
  sec := TD1 mod 60;
  CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  while (fSunElevation>0) and (TD1 > TD3) do
  begin
    TD1 := TD1 + DeltaT;
    hour := trunc(TD1/3600);
    min := trunc((TD1 mod 3600)/60);
    sec := TD1 mod 60;
    CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  end;

  TD2 := TD1;
  hour := trunc(TD2/3600);
  min := trunc((TD2 mod 3600)/60);
  sec := TD2 mod 60;
  CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  while (((fSunElevation < 0) or (TD2<TD1)) and (TD2<TD3)) do
  begin
    TD2 := TD2 + DeltaT;
    hour := trunc(TD2/3600);
    min := trunc((TD2 mod 3600)/60);
    sec := TD2 mod 60;
    CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  end;

  if ((TD1 <= TD3) and (TD2 <= TD3))
    then
      begin
        DeltaT := TD2 - TD1;
        TD1 := TD1 + DeltaT div 2;
        while (DeltaT > 1) do
        begin
          DeltaT := DeltaT div 2;
          hour := trunc(TD1/3600);
          min := trunc((TD1 mod 3600)/60);
          sec := TD1 mod 60;
          CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
          if fSunElevation > 0
            then TD1 := TD1 - DeltaT
            else TD1 := TD1 + DeltaT;
        end;
        hour := trunc(TD1/3600);
        min := trunc((TD1 mod 3600) / 60 );
        sec := TD1 mod 60;
        fSunRise := EncodeTime( hour, min, sec, 0 );
      end
    else fSunRise := EncodeTime( 0, 0, 0, 0 );
end;

procedure TFrame_SunPosition.SunSet(const aDateTime: TDateTime);
var
  DeltaT, TD1, TD3, TD2 : integer;
  hour, min, sec : integer;
begin
  DeltaT := 900; // 15 Min
  TD3 := 0;
  TD2 := 82800;
  hour := trunc(TD2/3600);
  min := trunc((TD2 mod 3600)/60);
  sec := TD2 mod 60;
  CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  while ((fSunElevation>0) and (TD2 > TD3)) do
  begin
    TD2 := TD2 - DeltaT;
    hour := trunc(TD2/3600);
    min := trunc((TD2 mod 3600)/60);
    sec := TD2 mod 60;
  CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  end;

  TD1 := TD2;
  hour := trunc(TD1/3600);
  min := trunc((TD1 mod 3600) / 60 );
  sec := TD1 mod 60;
  CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  while (((fSunElevation < 0) or (TD1>TD2)) and (TD1>TD3)) do
  begin
    TD1 := TD1 - DeltaT;
    hour := trunc(TD1/3600);
    min := trunc((TD1 mod 3600) / 60 );
    sec := TD1 mod 60;
    CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
  end;

  if ((TD1 >= TD3) and (TD2 >= TD3))
    then
      begin
        DeltaT := TD2 - TD1;
        TD1 := TD1 + DeltaT div 2;
        while (DeltaT > 1) do
        begin
          DeltaT := DeltaT div 2;
          hour := trunc(TD1/3600);
          min := trunc((TD1 mod 3600) / 60 );
          sec := TD1 mod 60;
          CalcSunPosition( EncodeDateTime( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ), hour, min, sec, 0 ) );
          if (fSunElevation> 0)
            then TD1 := TD1 + DeltaT
            else TD1 := TD1 - DeltaT;
        end;
    hour := trunc(TD1/3600);
    min := trunc((TD1 mod 3600) / 60 );
    sec := TD1 mod 60;
    fSunSet := EncodeTime( hour, min, sec, 0 );
  end
  else fSunSet := EncodeTime( 0, 0, 0, 0 );
end;

procedure TFrame_SunPosition.CalcSunPosition(const aDateTime: TDateTime);
begin
  case CalcMethod of
   cm_SUNAE  : CalcSunPositionBySUNAE( aDateTime );
   cm_DIN    : CalcSunPositionByDIN( aDateTime );
   cm_SolPos : CalcSunPositionBySolPos( aDateTime );
   cm_Met    : CalcSunPositionByMet( aDateTime );
  end;
end;

procedure TFrame_SunPosition.RefreshRadarPosition;
begin
  RadarLatitude := fConfiguration.RadarLatitude[ fConfiguration.Radar_ID ];
  RadarLongitude := -1*fConfiguration.RadarLongitude[ fConfiguration.Radar_ID ];
  RadarAltitud := fConfiguration.RadarAltitude[ fConfiguration.Radar_ID ];
  SystemTime := ShellClient.VestaRDA.SystemDateTime;
  TimeZone := ShellClient.VestaRDA.SystemTimeZone;
  SunRise( SystemTime );
  SunSet( SystemTime );
end;

procedure TFrame_SunPosition.CalcSunPositionByMet(const aDateTime: TDateTime);
var
  Delta_T: single;
  Azm_Rotation: single;
begin
 try
    Delta_T := 0;
    Azm_Rotation := 0;
    if (spa_calculate( YearOf( aDateTime ), MonthOf( aDateTime ), DayOf( aDateTime ),
                       HourOf( aDateTime ), MinuteOf( aDateTime ), SecondOf(aDateTime),
                       Delta_T, // Diferencia entre el tiempo terreste (hora del reloj) y el tiempo solar (en segundos).
                       TimeZone, // Zona horaria (negativa hacia el oeste)
                       RadarLongitude,   // Longitud de la estación (en grados, negativo hacia el oeste)
                       RadarLatitude,   // Latitud de la estación (en grados)
                       RadarAltitud,   // Altura de la estación (en metros)
                       fConfiguration.RadarPressure,  // Presión media anual de la estación (hPa, me la dió Ihomaris)
                       fConfiguration.RadarTemperature,  // Temperatura media anual de la estación (grados celcius, me la dió Ihomaris)
                       0, // Pendiente de la superficie, medida desde el plano horizontal (grados)
                       Azm_Rotation,   // Rotación acimutal de la superficie (medida desde el sur hasta la proyeción
                                       // de la normal de la superficie en el plano horizontal (grados, negativo hacia el oeste)
                       0.5667 // Refración atmosférica en la salida y puesta del sol (en grados) El valor típico es de 0.5667
                     ) = 0)
      then
        begin
          fSunAzimut := spa.azimuth;
          fSunElevation := 90 - spa.zenith;
        end;
  except
  end;
end;

procedure TFrame_SunPosition.SunCalcMethodSelect(Sender: TObject);
begin
  CalcMethod := TSunPositionCalcMethod( SunCalcMethod.ItemIndex );
  UpdateView;
end;

end.
