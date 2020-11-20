unit Observations;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, RDAObj, Rda_TLB;

type
  TObservations =
    class( TRDAObject, IObservations, IObservationsControl, IObservation )
      protected  // IObservations
        function  Get_Plantillas: Integer; safecall;
        function  Ejecutar(const Name: WideString): HResult; safecall;
        function  Plantilla(Index: Integer): ITemplate; safecall;
        function  Buscar(const Name: WideString): ITemplate; safecall;
        function  ChequearRadar: HResult; safecall;
      protected  // IObservationsControl
        function  Nueva: ITemplateControl; safecall;
        function  Clonar(const TemplateName: WideString): ITemplateControl; safecall;
        function  Control(const Name: WideString): ITemplateControl; safecall;
      protected  // IObservation
        function  Get_InProgress: WordBool; safecall;
        function  Get_Name: WideString; safecall;
        function  Get_Client: WideString; safecall;
        function  Get_StartTime: TDateTime; safecall;
        function  Get_LastTime: TDateTime; safecall;
        function  Get_Progress: Integer; safecall;
        function  Get_Message: WideString; safecall;
        function  Get_SubMsg: WideString; safecall;
        function  Get_Result: Integer; safecall;
        procedure Cancel; safecall;
    end;

const
  Class_Observations: TGUID = '{ACDCC644-8E0D-450E-833B-722B72F14883}';

implementation

uses
  ComServ,
  SysUtils,
  Operator,
  Template,
  Layout,
  Elbrus;

{ TObservations }

function TObservations.Ejecutar(const Name: WideString): HResult;
begin
  if InControl
    then theOperator.Execute(Name, UserName, Now);
end;

function TObservations.Get_Plantillas: Integer;
begin
  with EnumTemplates do
    try
      Result := Count;
    finally
      Free;
    end;
end;

function TObservations.Plantilla(Index: integer) : ITemplate;
begin
  with EnumTemplates do
    try
      if Index < Count
        then Result := Buscar(Strings[Index])
        else Result := nil;
    finally
      Free;
    end;
end;

function TObservations.Nueva : ITemplateControl;
var
  Name  : string;
  Index : integer;
begin
  if InControl
    then
      begin
        Index := 0;
        repeat
          inc(Index);
          Name := 'NuevaPlantilla' + IntToStr(Index);
        until not TemplateExists(Name);
        Result := TTemplate.Create(UserName, Level, Name)
      end
    else Result := nil;
end;

function TObservations.Buscar(const Name: WideString) : ITemplate;
begin
  if TemplateExists(Name)
    then Result := TTemplate.Create(UserName, Level, Name)
    else Result := nil;
end;

function TObservations.Control(const Name: WideString): ITemplateControl;
begin
  if TemplateExists(Name)
    then Result := TTemplate.Create(UserName, Level, Name)
    else Result := nil;
end;

function TObservations.Get_Client: WideString;
begin
  Result := Snapshot.ObsClient;
end;

function TObservations.Get_InProgress: WordBool;
begin
  Result := Snapshot.ObsInProgress;
end;

function TObservations.Get_LastTime: TDateTime;
begin
  Result := Snapshot.ObsLastTime;
end;

function TObservations.Get_Message: WideString;
begin
  Result := Snapshot.ObsMessage;
end;

function TObservations.Get_Name: WideString;
begin
  Result := Snapshot.ObsName;
end;

function TObservations.Get_Progress: Integer;
begin
  Result := Snapshot.ObsProgress;
end;

function TObservations.Get_Result: Integer;
begin
  Result := Snapshot.ObsResult;
end;

function TObservations.Get_StartTime: TDateTime;
begin
  Result := Snapshot.ObsStartTime;
end;

function TObservations.Get_SubMsg: WideString;
begin
  Result := Snapshot.ObsSubMsg;
end;

procedure TObservations.Cancel;
begin
  if InControl
    then theOperator.Cancel;
end;

function TObservations.ChequearRadar: HResult; safecall;
begin
end;

function TObservations.Clonar(const TemplateName: WideString): ITemplateControl;
var
  Name  : string;
  Index : integer;
  fTemplate : ITemplate;
begin
  if InControl
    then
      begin
        fTemplate := TLayout.Create(TemplateName);
        try
          Index := 0;
          repeat
            inc(Index);
            Name := fTemplate.Nombre + IntToStr(Index);
          until not TemplateExists(Name);
          Result := TTemplate.Clone(UserName, Level, Name, fTemplate);
        finally
          fTemplate := nil;
        end;
      end
    else Result := nil;
end;

initialization
  TComObjectFactory.Create(ComServer, TObservations, Class_Observations,
    'Observations', '', ciMultiInstance, tmApartment);
end.
