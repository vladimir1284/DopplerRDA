unit AntennaWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, AntennaWSIntf, CommunicationObj;

type
  TAntennaWS = class(TCommObj, IAntennaWS)
  public
  //Status
    function  Get_Estado: LongWord; safecall;
    function  Get_Antena_Listo: WordBool; safecall;
    function  Get_Averia_Excitacion: WordBool; safecall;
    function  Get_Limite_N: WordBool; safecall;
    function  Get_Limite_P: WordBool; safecall;
    function  Get_Acc_Listo: WordBool; safecall;
    function  Get_Cupula_Abierta: WordBool; safecall;
    function  Get_Acc_On: WordBool; safecall;
  //Control
    procedure Encender_Acc; safecall;
    procedure Apagar_Acc; safecall;
    procedure Alarma_Sonora(Tiempo: Integer); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses
  ElbrusTypes, Elbrus, Users;

{ TAntennaWS }

procedure TAntennaWS.Alarma_Sonora(Tiempo: Integer);
begin
  if InControl
    then Elbrus.Alarma_Sonora(Tiempo);
end;

procedure TAntennaWS.Apagar_Acc;
begin
  if InControl
    then Elbrus.Apagar_Accionamiento;
end;

function TAntennaWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Operator;
end;

procedure TAntennaWS.Encender_Acc;
begin
  if InControl
    then Elbrus.Encender_Accionamiento;
end;

function TAntennaWS.Get_Acc_Listo: WordBool;
const
  Acc_Listo_Mask = di_Acc_Listo_Az or di_Acc_Listo_El;
begin
  Result := (SnapShot.Digital_Input and Acc_Listo_Mask) = Acc_Listo_Mask;
end;

function TAntennaWS.Get_Acc_On: WordBool;
begin
  Result := Snapshot.Digital_Output and do_Acc_Encender <> 0;
end;

function TAntennaWS.Get_Antena_Listo: WordBool;
begin
  Result := (Get_Estado and di_Antena_Listo) <> 0;
end;

function TAntennaWS.Get_Averia_Excitacion: WordBool;
begin
  Result := (Get_Estado and di_Averia_Excitacion) <> 0;
end;

function TAntennaWS.Get_Cupula_Abierta: WordBool;
begin
  Result := (Snapshot.Digital_Input and di_Cupula_Abierta) <> 0;
end;

function TAntennaWS.Get_Estado: LongWord;
const
  Antenna_Mask = di_Cupula_Abierta    or
                 di_Antena_Listo      or
                 di_Acc_Listo_Az      or
                 di_Acc_Listo_El      or
                 di_Averia_Excitacion or
                 di_Antena_Limite_N   or
                 di_Antena_Limite_P;
begin
  Result := Snapshot.Digital_Input and Antenna_Mask;
end;

function TAntennaWS.Get_Limite_N: WordBool;
begin
  Result := (Get_Estado and di_Antena_Limite_N) <> 0;
end;

function TAntennaWS.Get_Limite_P: WordBool;
begin
  Result := (Get_Estado and di_Antena_Limite_P) <> 0;
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TAntennaWS);

end.
 