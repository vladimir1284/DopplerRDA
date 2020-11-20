unit VestaFile;

interface

uses
  Description,
  VersionInfo,
  Plane, Angle, Speed;

const
  VestaFileExt   = '.obs';
  VestaSignature = 'Vesta Observation'^Z;
  Vesta1Sig      = 'Vesta Radar Observation v1.0'^Z;
  Vesta2Sig      = 'Vesta Radar Observation v1.5'^Z;
  MonthIDs       = 'efmayjlgsond';

type
  TSignatureStr = array[0..19] of char;
  TDesignStr    = array[0..35] of char;

type
  TVestaFileStamp = packed record
    case integer of
      0 : ( Signature  : TSignatureStr;   // Vesta Signature
            Version    : TVersionNumber;  // Version number
            Design     : TDesignStr );    // Design name
      1 : ( SigVesta   : string[63] );    // Old vesta header
  end;

type  // Main header
  PVestaFileHeader = ^TVestaFileHeader;
  TVestaFileHeader = packed record
    Stamp      : TVestaFileStamp;
    Radar      : TRadar;                // Radar ID
    DayLight   : boolean;               // DayLight flag
    Variance   : boolean;               // Variance flag
    Reserved   : array[0..0] of byte;
    DateTime   : TDateTime;             // Observation DateTime
    Movements  : integer;               // Move count
    Channels   : integer;               // Channel count
  //MoveDir    : array[0..Movements - 1] of integer;
  //ChDesc     : array[0..Channels  - 1] of TChannelDesc;
  //VarPDir    : array[0..Movements - 1] of integer;
  end;

type  
  TVestaPackMethod = (pmNone, pmDAS, pmZLib);

type  // PPI, RHI (movement) header  
  PVestaMoveHeader = ^TVestaMoveHeader;
  TVestaMoveHeader = packed record
    Desc       : TMovementDesc;        // Move description
    PackMethod : TVestaPackMethod;     // Pack method
    Reserved   : array[0..2] of byte;
    PackSize   : integer;              // Packed size
    UnpackSize : integer;              // Unpacked size
  //Data       : array[0..PackSize - 1] of byte;
  end;

type  // Variance header (may not be present)
  PVestaVarPHeader = ^TVestaVarPHeader;
  TVestaVarPHeader = packed record
    Desc       : TMovementDesc;        // Move description
    PackMethod : TVestaPackMethod;     // Pack method
    Reserved   : array[0..2] of byte;
    PackSize   : integer;              // Packed size
    UnpackSize : integer;              // Unpacked size
  //Data       : array[0..PackSize - 1] of byte;
  end;

//Hecho por Robert
type // Filter Header (may not be present)
  PVestaFilterHeader = ^TVestaFilterHeader;
  TVestaFilterHeader = packed record
    Desc       : TMovementDesc;        // Move description
    PackMethod : TVestaPackMethod;     // Pack method
    Reserved   : array[0..2] of byte;
    PackSize   : integer;              // Packed size
    UnpackSize : integer;              // Unpacked size
  end;


////******////////

function Pack  ( Source : pointer; out Dest : pointer;
                 Count : integer;
                 Method : TVestaPackMethod ) : integer;

function UnPack( Source : pointer; out Dest : pointer;
                 Count, Estimate : integer;
                 Method : TVestaPackMethod ) : integer;

implementation

uses
  Windows,
  SysUtils,
  DASFile,
  ZLibEx;

// Public procedures & functions

function Pack( Source : pointer; out Dest : pointer; Count : integer; Method : TVestaPackMethod ) : integer;
begin
  case Method of
    pmNone:
      begin
        Dest   := Source;
        Result := Count;
      end;
    pmDAS:
      begin
        GetMem(Dest, Count);
        Result := DASFile.Pack(Source, Dest, Count);
        ReallocMem(Dest, Result);
      end;
    pmZLib:
      ZLibEx.ZCompress(Source, Count, Dest, Result);
    else
      Result := -1;
  end;
end;

function UnPack( Source : pointer; out Dest : pointer; Count, Estimate : integer; Method : TVestaPackMethod ) : integer;
begin
  case Method of
    pmNone:
      begin
        Dest   := Source;
        Result := Count;
      end;
    pmDAS:
      begin
        GetMem(Dest, Estimate);
        FillChar(Dest^, Estimate, 0);
        Result := DASFile.UnPack(Source, Dest, Count);
      end;
    pmZLib:
      ZLibEx.ZDecompress(Source, Count, Dest, Result, Estimate);
    else
      Result := -1;
  end;
end;

end.
