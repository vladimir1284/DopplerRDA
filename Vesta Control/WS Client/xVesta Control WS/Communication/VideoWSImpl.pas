{ Invokable implementation File for TVideoWS which implements IVideoWS }

unit VideoWSImpl;

interface

uses InvokeRegistry, Types, XSBuiltIns, VideoWSIntf, CommunicationObj;

type
  { TVideoWS }
  TVideoWS = class(TCommObj, IVideoWS)
  public
  // IVideo
    function Get_Frecuencia_AD: Integer; safecall;
    function Get_Osciloscope_Port: cardinal; safecall;
    function Adquirir_Cuadros(Frames: Integer; Shots: Integer; Cells: Integer; Source: boolean): TChannelsData; safecall;
  // IVideoControl
    procedure Set_Frecuencia_AD(Value: Integer); safecall;

    function CheckCredentials : boolean; override;
  end;

implementation

uses Users, Elbrus, ElbrusTypes, SysUtils, Windows, Advantech, Config;

{ TVideoWS }

function TVideoWS.Adquirir_Cuadros(Frames, Shots, Cells: Integer; Source: boolean): TChannelsData;
var
  DataLength : cardinal;
  i, j : integer;
  B1, B2 : PDWords;
begin
  DataLength := Frames * Cells;
  result := TChannelsData.Init(DataLength);

  for i := 0 to Frames-1 do
    for j := 0 to Cells-1 do
      if((j < 500) or (j > 1500))
        then
          begin
            result.Ch1Data[i*Cells+j] := 0;
            result.Ch2Data[i*Cells+j] := 0;
          end
        else
          begin
            result.Ch1Data[i*Cells+j] := 500;
            result.Ch2Data[i*Cells+j] := 500;
          end;

      {

  B1 := AllocMem(Frames * Cells * sizeof(dword));
  B2 := AllocMem(Frames * Cells * sizeof(dword));

  try
    if Acquire_Frames(Frames, Shots, Cells, B1, B2, Source)
      then
        begin
          result := TChannelsData.Create;
          for I := 0 to DataLength - 1 do
          begin
            result.Ch1Data[I] := B1[I];
            result.Ch2Data[I] := B2[I];
          end;
        end
      else Result := nil;
  finally
    ReallocMem(B1, 0);
    ReallocMem(B2, 0);
  end;
  }
end;

function TVideoWS.CheckCredentials: boolean;
begin
  result := CheckAuthHeader >= ul_Operator;
end;

function TVideoWS.Get_Frecuencia_AD: Integer;
begin
  Result := Snapshot.Sample_Rate;
end;

function TVideoWS.Get_Osciloscope_Port: cardinal;
begin
  result := theConfiguration.OsciloscopePort;
end;

procedure TVideoWS.Set_Frecuencia_AD(Value: Integer);
begin
  if InControl
    then Elbrus.Set_Frecuencia_AD(Value);
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass(TVideoWS);

end.