unit RDAObj;

interface

uses
  ComObj;

type
  TRDAObject = class(TComObject, IUnknown)
  public
    constructor Create( UserName : string; Level : integer );
    destructor  Destroy;  override;
  private
    fUserName : string;
    fLevel    : integer;
  public
    property UserName : string  read fUserName;
    property Level    : integer read fLevel;
  protected  //IUnknown QueryInterface
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  protected
    function RestrictedInterface( IID : TGUID ) : boolean;  virtual;
    function InControl                          : boolean;  virtual;
  end;

implementation

uses
  Windows, ActiveX,
  SysUtils,
  Statistics,
  Users,
  Rda_TLB;

{ TRDAObject }

constructor TRDAObject.Create(UserName: string; Level: integer);
begin
  inherited Create;
  fUserName := UserName;
  fLevel    := Level;
  RegisterReference;
end;

destructor TRDAObject.Destroy;
begin
  RemoveReference;
  inherited;
end;

function TRDAObject.InControl: boolean;
begin
  Result := CompareText(UserName, Users.GetController) = 0;
end;

function TRDAObject.RestrictedInterface( IID : TGUID ) : boolean;
begin
  if IsEqualGUID(IID, IAntenna) or
     IsEqualGUID(IID, IAntennaControl) or
     IsEqualGUID(IID, IMotorStatus) or
     IsEqualGUID(IID, IMotorControl) or
     IsEqualGUID(IID, ITxsRxs) or
     IsEqualGUID(IID, ITxRxStatus) or
     IsEqualGUID(IID, ITxStatus) or
     IsEqualGUID(IID, IRxStatus) or
     IsEqualGUID(IID, IRxControl) or
     IsEqualGUID(IID, ITxControl) or
     IsEqualGUID(IID, IRadar) or
     IsEqualGUID(IID, IRadarControl) or
     IsEqualGUID(IID, ISynchro) or
     IsEqualGUID(IID, ITemplate) or
     IsEqualGUID(IID, IConfiguration) or
     IsEqualGUID(IID, IStatistics) or
     IsEqualGUID(IID, IObservations) or
     IsEqualGUID(IID, IObservation) or
     IsEqualGUID(IID, ICalibration) or
     IsEqualGUID(IID, ITxRxMeasure) or
     IsEqualGUID(IID, IVideo) or
     IsEqualGUID(IID, IVideoControl)
    then Result := Level < ul_Operator
    else
  if IsEqualGUID(IID, IObservationsControl) or
     IsEqualGUID(IID, ITemplateControl)
    then Result := Level < ul_Designer
    else
  if IsEqualGUID(IID, ICalibrationControl) or
     IsEqualGUID(IID, ITxRxMeasureControl) or
     IsEqualGUID(IID, IStatisticsControl)
    then Result := Level < ul_Service
    else
  if IsEqualGUID(IID, IConfigurationControl) or
     IsEqualGUID(IID, IStatisticsControl)
    then Result := Level < ul_Supervisor
    else Result := false;
end;

function TRDAObject.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if RestrictedInterface(IID)
    then
      begin
        IUnknown(Obj) := nil;
        Result := E_ACCESSDENIED;
      end
    else Result := inherited QueryInterface(IID, Obj);
end;

end.

