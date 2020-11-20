unit FormatSettings;

interface

implementation

  uses
    SysUtils;

  procedure SetDefaultFormatSettings;
  begin
    ThousandSeparator := ',';
    DecimalSeparator  := '.';
    DateSeparator     := '/';
    ShortDateFormat   := 'd/m/y';
    LongDateFormat    := 'dddd d mmmm yyyy';
    TimeSeparator     := ':';
    TimeAMString      := 'am';
    TimePMString      := 'pm';
    ShortTimeFormat   := 'h:nn ampm';
    LongTimeFormat    := 'h:nn:ss ampm';
    ShortMonthNames[ 1] := 'ene';
    ShortMonthNames[ 2] := 'feb';
    ShortMonthNames[ 3] := 'mar';
    ShortMonthNames[ 4] := 'abr';
    ShortMonthNames[ 5] := 'may';
    ShortMonthNames[ 6] := 'jun';
    ShortMonthNames[ 7] := 'jul';
    ShortMonthNames[ 8] := 'ago';
    ShortMonthNames[ 9] := 'sep';
    ShortMonthNames[10] := 'oct';
    ShortMonthNames[11] := 'nov';
    ShortMonthNames[12] := 'dic';
    LongMonthNames [ 1] := 'enero';
    LongMonthNames [ 2] := 'febrero';
    LongMonthNames [ 3] := 'marzo';
    LongMonthNames [ 4] := 'abril';
    LongMonthNames [ 5] := 'mayo';
    LongMonthNames [ 6] := 'junio';
    LongMonthNames [ 7] := 'julio';
    LongMonthNames [ 8] := 'agosto';
    LongMonthNames [ 9] := 'septiembre';
    LongMonthNames [10] := 'octubre';
    LongMonthNames [11] := 'noviembre';
    LongMonthNames [12] := 'diciembre';
    ShortDayNames[1] := 'dom';
    ShortDayNames[2] := 'lun';
    ShortDayNames[3] := 'mar';
    ShortDayNames[4] := 'mie';
    ShortDayNames[5] := 'jue';
    ShortDayNames[6] := 'vie';
    ShortDayNames[7] := 'sab';
    LongDayNames [1] := 'domingo';
    LongDayNames [2] := 'lunes';
    LongDayNames [3] := 'martes';
    LongDayNames [4] := 'miercoles';
    LongDayNames [5] := 'jueves';
    LongDayNames [6] := 'viernes';
    LongDayNames [7] := 'sabado';
  end;

begin
  SetDefaultFormatSettings;
end.


