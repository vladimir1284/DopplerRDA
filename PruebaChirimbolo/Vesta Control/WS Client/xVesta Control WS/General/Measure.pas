unit Measure;

interface

type
  TCode = byte;

const
  MinCode =   0;
  MaxCode = 250;
  NoData  = 255;

type
  float = double;

type  // un :- unit
  TMeasure = (unNone, unDB, unDBZ, unMMH, unMS, unMM, unM, unKM, unKGM,
              unZDR, unPDP, unRho, unKDP, unGCP, unTID);

type
  TMeasureSet = set of TMeasure;

type  
  TCodeSet = set of TCode;

type
  PCodeTable = ^TCodeTable;
  TCodeTable = array[TCode] of float;
  PCodeConv = ^TCodeConv;
  TCodeConv = array[TCode] of TCode;

type
  TCodeArray = array of TCode;  

function MeasureName( Measure : TMeasure ) : string;
function MeasureVar ( Measure : TMeasure ) : string;

function MeasureCode( Value : float; Measure : TMeasure ) : TCode;
function CodeMeasure( Code  : TCode; Measure : TMeasure ) : float;
function LinealCode ( Value : float; Measure : TMeasure ) : TCode;
function CodeLineal ( Code  : TCode; Measure : TMeasure ) : float;

function MeasureTable( Measure : TMeasure ) : PCodeTable;
function ValidMeasure( Measure : TMeasure ) : boolean;

function ValueFromDB( DB    : float ) : float;
function ValueToDB  ( Value : float ) : float;

implementation

uses
  SysUtils, Math;

const
  theMMHTable : TCodeTable = ({$i code2mmh.inc});
  theMMTable  : TCodeTable = ({$i code2mm.inc });

// Private procedures & functions

function BinarySearch( Value : float; const Table : TCodeTable ) : integer;
var
  L, H  : integer;
  Index : integer;
begin
  L := Low (Table);
  H := High(Table);
  while (H - L) > 1 do
    begin
      Index := Low(Table) + (L + H) div 2;
      if Value > Table[Index]
        then L := Index
        else H := Index;
    end;
  Result := L;
end;

// Public procedures & functions

function MeasureName( Measure : TMeasure ) : string;
const
  Name : array[TMeasure] of string =
    ('','dB','dBZ','mm/h','m/s','mm','m','km','kg/m²','dB','°','','°/km','%','');
begin
  Result := Name[Measure];
end;

function MeasureVar( Measure : TMeasure ) : string;
const
  Variable : array[TMeasure] of string =
    ('', 'P', 'Z', 'R', 'Vr',
     'Ra',
     'H', 'H',
     'VIL',
     'Zdr','Pdp','Rhv','Kdp','GCP','TID');
begin
  Result := Variable[Measure];
end;

function MeasureCode( Value : float; Measure : TMeasure ) : TCode;
begin
  case Measure of
    unDBZ:
      if Value > -80
        then Result := round(Value) + 80
        else Result := 0;
    unMMH:
      Result := BinarySearch(Value, theMMHTable);
    unMS:
      Result := 128 + round(2 * Value);
    unMM:
      Result := BinarySearch(Value, theMMTable);
    unM:
      if Value > 0
        then
          if Value <= 20000
            then Result := round(Value / 100)
            else Result := 200 + round((Value - 20000) / 500)
        else Result := 0;
    unKM:
      if Value > 0
        then
          if Value <= 20
            then Result := round(Value * 10)
            else Result := 200 + round((Value - 20) * 2)
          else Result := 0;
    unKGM:
      if Value < 25
        then Result := round(Value * 2)
        else Result := round(50 + (Value - 25));
    unZDR, unKDP:
      Result := round(10 * Value + 128);
    unPDP:
      Result := round(Value + 128);
    unRho:
      Result := round(100 * Value);
    else
      Result := round(Value);
  end;
end;

function CodeMeasure( Code : TCode; Measure : TMeasure ) : float;
begin
  case Measure of
    unDBZ:
      Result := Code - 80;
    unMMH:
      Result := theMMHTable[Code];
    unMS:
      Result := (Code - 128) / 2;
    unMM:
      Result := theMMTable[Code];
    unM:
      if Code <= 200
        then Result := Code * 100
        else Result := 20000 + (Code - 200) * 500;
    unKM:
      if Code <= 200
        then Result := Code * 0.1
        else Result := 20 + (Code - 200)/2;
    unKGM:
      if Code < 50
        then Result := Code/2
        else Result := 25 + (Code - 50);
    unZDR, unKDP:
      Result := (Code - 128)/10;
    unPDP:
      Result := Code - 128;
    unRho:
      Result := Code/100;
    else
      Result := Code;
  end;
end;

function MeasureTable( Measure : TMeasure ) : PCodeTable;
begin
  case Measure of
    unMMH : {$WARN UNSAFE_CODE OFF} Result := @theMMHTable; {$WARN UNSAFE_CODE ON}
    unMM  : {$WARN UNSAFE_CODE OFF} Result := @theMMTable;  {$WARN UNSAFE_CODE ON}
    else Result := nil;
  end;
end;

function ValidMeasure( Measure : TMeasure ) : boolean;
begin
  Result := (Measure >= low (TMeasure)) and
            (Measure <= high(TMeasure));
end;

function LinealCode( Value : float; Measure : TMeasure ) : TCode;
begin
  if (Measure = unDBZ) or (Measure = unDB) or (Measure = unZDR)
    then Result := MeasureCode(ValueToDB(Value), Measure)
    else Result := MeasureCode(Value, Measure);
end;

function CodeLineal( Code  : TCode; Measure : TMeasure ) : float;
begin
  if (Measure = unDBZ) or (Measure = unDB) or (Measure = unZDR)
    then Result := ValueFromDB(CodeMeasure(Code, Measure))
    else Result := CodeMeasure(Code, Measure);
end;

function ValueToDB( Value : float ) : float;
begin
  Result := 10 * Log10(Value);
end;

function ValueFromDB( DB : float ) : float;
begin
  Result := Power(10, DB/10);
end;

end.

