unit DASFile;

interface

type
  TDASSignature = word;

const
  sg_Shift_Version =  0;
  sg_Shift_Radar   =  3;
  sg_Shift_Channel =  6;
  sg_Shift_Pulse   =  7;
  sg_Shift_Mode    =  8;
  sg_Shift_Scan    =  9;
  sg_Shift_Check   = 10;
  sg_Shift_Dummy   = 11;

  sg_Mask_Version = $0007;
  sg_Mask_Radar   = $0038;
  sg_Mask_Channel = $0040;
  sg_Mask_Pulse   = $0080;
  sg_Mask_Mode    = $0100;
  sg_Mask_Scan    = $0200;
  sg_Mask_Check   = $0400;
  sg_Mask_Dummy   = $F800;

type
  TDASFileHeader = packed record
    Signature : TDASSignature;
    Time      : longint;
    PotMet    : single;
  end;

  TDASMovementHeader = packed record
    Angle : smallint;        { Elevation Angle  }
    Size  : smallint;        { Packed data size }
    CRC   : smallint;
  end;

function Pack  ( Source, Dest : pointer; Size : integer ) : integer;
function UnPack( Source, Dest : pointer; Size : integer ) : integer;

implementation

type
  PByteArray = ^TByteArray;
  TByteArray = array[0..maxint - 1] of byte;

// Public procedures & functions

function Pack( Source, Dest : pointer; Size : integer ) : integer;
var
  Src : PByteArray absolute Source;
  Dst : PByteArray absolute Dest;
var
  Count : integer;
  I, J  : integer;
begin
  Count := 0;
  I := 0;
  J := 0;
  while (I < Size) do
    begin
      if Src[I] = 0
        then inc( Count );
      if (Src[I] <> 0) or (Count = 32767)
        then
          begin
            if Count > 0
              then
                begin
                  if Count = 1
                    then Dst[J] := 0
                    else
                      begin
                        Count := -Count;
                        Dst[J    ] := byte(Count shr 8);
                        Dst[J + 1] := byte(Count);
                        inc( J );
                      end;
                  Count := 0;
                end;
            Dst[J] := Src[I];
            inc( J );
          end;
      inc( I );
    end;
  if Count > 0
    then
      begin
        if Count = 1
          then
            begin
              Dst[J] := 0;
              inc(J);
            end
          else
            begin
              Count := -Count;
              Dst[J    ] := byte(Count shr 8 );
              Dst[J + 1] := byte(Count);
              inc( J , 2 );
            end;
      end;
  Result := J;
end;

function UnPack( Source, Dest : pointer; Size : integer ) : integer;
var
  Src : PByteArray absolute Source;
  Dst : PByteArray absolute Dest;
var
  dat  : byte;
  i, k : integer;
begin
  i := 0;
  k := 0;
  repeat
    dat := Src[i];
    inc( i );
    if dat < $80
      then
        begin
          Dst[k] := dat;
          inc( k );
        end
      else
        begin
          dec( k, smallint(Dat shl 8 or Src[I]) );
          inc( i );
        end;
  until i >= Size;
  Result := k;
end;

end.

