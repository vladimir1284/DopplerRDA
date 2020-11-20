unit Speed;

interface

  type
    TSpeed = integer;
    float  = single;

  const
    spd_0 =   0;
    spd_1 =  68;
    spd_2 = 137;
    spd_3 = 205;
    spd_4 = 273;
    spd_5 = 341;
    spd_6 = 410;
    spd_7 = 478;
    spd_8 = 546;
    spd_9 = 614;

  const
    CPSsPerRPM = 4096 / 60;
    RPMsPerCPS = 60 / 4096;

  function CodeSpeed( CPS : TSpeed ) : float;
  function SpeedCode( RPM : float  ) : TSpeed;

implementation


// Public procedures & functions

  function CodeSpeed( CPS : TSpeed ) : float;
  begin
    Result := CPS * RPMsPerCPS;
  end;

  function SpeedCode( RPM : float  ) : TSpeed;
  begin
    Result := Round(RPM * CPSsPerRPM);
  end;


end.

