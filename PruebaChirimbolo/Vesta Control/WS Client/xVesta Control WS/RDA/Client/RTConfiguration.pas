unit RTConfiguration;

interface

uses
  Graphics;

type
  TDataFormat = ( dfDB, dfDBZ );

  TConfig = class
  public
    constructor Create( const RegistryKey : string );
    destructor  Destroy;  override;
  private
    fRegistryKey : string;
    fRange : cardinal;
    fCellCount : cardinal;
    fServerCellCount : cardinal;
    fCellSize : word;
    fSpeckleRemove : boolean;
    fSpeckleThreshold : cardinal;
    fShowRings : boolean;
    fRingColor : TColor;
    fRingsDistance : cardinal;
    fShowMap : boolean;
    fColorMap : TColor;
    fShowRadar : boolean;
    fChannel1 : boolean;
    fChannel2 : boolean;
    fShowOutlines : boolean;
    fPPI, fDB : boolean;
    fDataFormat : TDataFormat;
    fDBScalePath : string;
    fDBZScalePath : string;
    fZoom : word;
    fRTServer : string;
  public
    property Range : cardinal            read fRange            write fRange;
    property CellCount : cardinal        read fCellCount        write fCellCount;
    property ServerCellCount : cardinal  read fServerCellCount  write fServerCellCount;
    property CellSize : word             read fCellSize         write fCellSize;
    property SpeckleRemove : boolean     read fSpeckleRemove    write fSpeckleRemove;
    property Channel1 : boolean          read fChannel1         write fChannel1;
    property Channel2 : boolean          read fChannel2         write fChannel2;
    property PPI : boolean               read fPPI              write fPPI;
    property DB  : boolean               read fDB               write fDB;
    property SpeckleThreshold : cardinal read fSpeckleThreshold write fSpeckleThreshold;
    property ShowRings : boolean         read fShowRings        write fShowRings;
    property RingColor : TColor          read fRingColor        write fRingColor ;
    property RingsDistance : cardinal    read fRingsDistance    write fRingsDistance;
    property ShowMap : boolean           read fShowMap          write fShowMap;
    property ColorMap : TColor           read fColorMap         write fColorMap;
    property ShowRadar : boolean         read fShowRadar        write fShowRadar;
    property ShowOutlines : boolean      read fShowOutlines     write fShowOutlines;
    property DataFormat : TDataFormat    read fDataFormat       write fDataFormat;
    property DBScalePath : string        read fDBScalePath      write fDBScalePath;
    property DBZScalePath : string       read fDBZScalePath     write fDBZScalePath;
    property Zoom : word                 read fZoom             write fZoom;
    property RTServer : string           read fRTServer         write fRTServer;
  private
    function  LoadConfig : boolean;
  public
    procedure SaveConfig;
  end;

implementation

uses
  Registry;

const
//Values
  RangeValue             = 'Range';
  CellCountValue         = 'CellCount';
  ServerCellCountValue   = 'ServerCellCount';
  CellSizeValue          = 'CellSize';
  SpeckleRemoveValue     = 'SpeckleRemove';
  SpeckleThresholdValue  = 'SpeckleThreshold';
  ShowRingsValue         = 'ShowRings';
  RingColorValue         = 'RingColor';
  RingsDistanceValue     = 'RingsDistance';
  ShowMapValue           = 'ShowMap';
  ColorMapValue          = 'ColorMap';
  ShowRadarValue         = 'ShowRadar';
  ShowOutlinesValue      = 'ShowOutlines';
  DataFormatValue        = 'DataFormat';
  DBScalePathValue       = 'DBScalePath';
  DBZScalePathValue      = 'DBZScalePath';
  ZoomValue              = 'Zoom';
  RTServerValue          = 'RTServer';
  Channel1Value          = 'Channel1';
  Channel2Value          = 'Channel2';
  PPIValue               = 'PPI';
  DBValue                = 'DB';

//Defaults
  DefaultPPI               = true;
  DefaultDB                = true;
  DefaultChannel1          = false;
  DefaultChannel2          = true;
  DefaultRange             = 450000; //meters
  DefaultCellCount         = 1000;
  DefaultServerCellCount   = 1000;
  DefaultCellSize          = 150;    //meters
  DefaultSpeckleRemove     = true;
  DefaultSpeckleThreshold  = 500;
  DefaultShowRings         = false;
  DefaultRingColor         = clWhite;
  DefaultRingsDistance     = 100000;  //meters
  DefaultShowMap           = true;
  DefaultColorMap          = clBlack;
  DefaultShowRadar         = true;
  DefaultShowOutlines      = false;
  DefaultDataFormat        = dfDB;
  DefaultDBScalePath       = '';
  DefaultDBZScalePath      = '';
  DefaultZoom              = 100;
  DefaultRTServer          = '127.0.0.1';

{ TConfig }

constructor TConfig.Create( const RegistryKey : string );
begin
  inherited Create;
  fRegistryKey := RegistryKey; 
  LoadConfig;
end;

destructor TConfig.Destroy;
begin
  SaveConfig;
  inherited;
end;

function TConfig.LoadConfig: boolean;
begin
  with TRegistry.Create do
  try
    if OpenKey(fRegistryKey, false)
      then
        begin
          if ValueExists( RangeValue )
            then fRange := ReadInteger( RangeValue )
            else fRange := DefaultRange;
          if ValueExists( CellCountValue )
            then fCellCount := ReadInteger( CellCountValue )
            else fCellCount := DefaultCellCount;
          if ValueExists( ServerCellCountValue )
            then fServerCellCount := ReadInteger( ServerCellCountValue )
            else fServerCellCount := DefaultServerCellCount;
          if ValueExists( CellSizeValue )
            then fCellSize := ReadInteger( CellSizeValue )
            else fCellSize := DefaultCellSize;
          if ValueExists( SpeckleRemoveValue )
            then fSpeckleRemove := ReadBool( SpeckleRemoveValue )
            else fSpeckleRemove := DefaultSpeckleRemove;
          if ValueExists( SpeckleThresholdValue )
            then fSpeckleThreshold := ReadInteger( SpeckleThresholdValue )
            else fSpeckleThreshold := DefaultSpeckleThreshold;
          if ValueExists( ShowRingsValue )
            then fShowRings := ReadBool( ShowRingsValue )
            else fShowRings := DefaultShowRings;
          if ValueExists( ShowMapValue )
            then fShowMap := ReadBool( ShowMapValue )
            else fShowMap := DefaultShowMap;
          if ValueExists( ShowRadarValue )
            then fShowRadar := ReadBool( ShowRadarValue )
            else fShowRadar := DefaultShowRadar;
          if ValueExists( ShowOutlinesValue )
            then fShowOutlines := ReadBool( ShowOutlinesValue )
            else fShowOutlines := DefaultShowOutlines;
          if ValueExists( RingsDistanceValue )
            then fRingsDistance := ReadInteger( RingsDistanceValue )
            else fRingsDistance := DefaultRingsDistance;
          if ValueExists( RingColorValue )
            then fRingColor := ReadInteger( RingColorValue )
            else fRingColor := DefaultRingColor;
          if ValueExists( ColorMapValue )
            then fColorMap := ReadInteger( ColorMapValue )
            else fColorMap := DefaultColorMap;
          if ValueExists( ZoomValue )
            then fZoom := ReadInteger( ZoomValue )
            else fZoom := DefaultZoom;
          if ValueExists( DBScalePathValue )
            then fDBScalePath := ReadString( DBScalePathValue )
            else fDBScalePath := DefaultDBScalePath;
          if ValueExists( DBZScalePathValue )
            then fDBZScalePath := ReadString( DBZScalePathValue )
            else fDBZScalePath := DefaultDBZScalePath;
          if ValueExists( RTServerValue )
            then fRTServer := ReadString( RTServerValue )
            else fRTServer := DefaultRTServer;
          if ValueExists( DataFormatValue )
            then fDataFormat := TDataFormat( ReadInteger( DataFormatValue ) )
            else fDataFormat := DefaultDataFormat;
          if ValueExists( Channel1Value )
            then fChannel1 := ReadBool( Channel1Value )
            else fChannel1 := DefaultChannel1;
          if ValueExists( Channel2Value )
            then fChannel2 := ReadBool( Channel2Value )
            else fChannel2 := DefaultChannel2;
          if ValueExists( PPIValue )
            then fPPI := ReadBool( PPIValue )
            else fPPI := DefaultPPI;
          if ValueExists( DBValue )
            then fDB := ReadBool( DBValue )
            else fDB := DefaultDB;
        end
      else
        begin
          fPPI := DefaultPPI;
          fDB := DefaultDB;
          fRange := DefaultRange;
          fCellCount := DefaultCellCount;
          fServerCellCount := DefaultServerCellCount;
          fCellSize := DefaultCellSize;
          fSpeckleRemove := DefaultSpeckleRemove;
          fSpeckleThreshold := DefaultSpeckleThreshold;
          fShowRings := DefaultShowRings;
          fShowMap := DefaultShowMap;
          fShowRadar := DefaultShowRadar;
          fShowOutlines := DefaultShowOutlines;
          fRingsDistance := DefaultRingsDistance;
          fRingColor := DefaultRingColor;
          fColorMap := DefaultColorMap;
          fZoom := DefaultZoom;
          fDBScalePath := DefaultDBScalePath;
          fDBZScalePath := DefaultDBZScalePath;
          fRTServer := DefaultRTServer;
          fDataFormat := DefaultDataFormat;
          fChannel1 := DefaultChannel1;
          fChannel2 := DefaultChannel2;
        end;
  finally
    free;
  end;
end;

procedure TConfig.SaveConfig;
begin
  with TRegistry.Create do
    try
      if OpenKey( fRegistryKey, true )
        then
          begin
            WriteInteger( RangeValue, fRange );
            WriteInteger( CellCountValue, fCellCount );
            WriteInteger( ServerCellCountValue, fServerCellCount );
            WriteInteger( CellSizeValue, fCellSize );
            WriteInteger( SpeckleThresholdValue, fSpeckleThreshold );
            WriteInteger( RingsDistanceValue, fRingsDistance );
            WriteInteger( RingColorValue, fRingColor );
            WriteInteger( ColorMapValue, fColorMap );
            WriteInteger( ZoomValue, fZoom );
            WriteInteger( DataFormatValue, Ord( fDataFormat ) );
            WriteString( DBScalePathValue, fDBScalePath );
            WriteString( DBZScalePathValue, fDBZScalePath );
            WriteString( RTServerValue, fRTServer );
            WriteBool( SpeckleRemoveValue, fSpeckleRemove );
            WriteBool( ShowRingsValue, fShowRings );
            WriteBool( ShowMapValue, fShowMap );
            WriteBool( ShowRadarValue, fShowRadar );
            WriteBool( ShowOutlinesValue, fShowOutlines );
            WriteBool( Channel1Value, fChannel1 );
            WriteBool( Channel2Value, fChannel2 );
            WriteBool( PPIValue, fPPI );
            WriteBool( DBValue, fDB );
          end;
    finally
      Free;
    end;
end;

end.
