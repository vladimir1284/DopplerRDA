unit FrameCommands;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrameSynchro, FrameAntenna, ExtCtrls, FrameRadar,
  Rda_TLB;

type
  TFrame_Commands = class(TFrame)
    Splitter1: TSplitter;
    Frame_Antenna: TFrame_Antenna;
    Splitter2: TSplitter;
    Frame_Synchro: TFrame_Synchro;
    Frame_Radar: TFrame_Radar;
  private
    function  GetRadar : IRadar;
    function  GetAntenna : IAntenna;
    function  GetSynchro : ISynchro;
    procedure SetRadar  ( Value : IRadar );
    procedure SetAntenna( Value : IAntenna );
    procedure SetSynchro( Value : ISynchro );
  published
    property Radar   : IRadar   read GetRadar   write SetRadar;
    property Antenna : IAntenna read GetAntenna write SetAntenna;
    property Synchro : ISynchro read GetSynchro write SetSynchro;
  end;

implementation

{$R *.DFM}

{ TFrame_Commands }

function TFrame_Commands.GetAntenna: IAntenna;
begin
  Result := Frame_Antenna.Antenna;
end;

function TFrame_Commands.GetRadar: IRadar;
begin
  Result := Frame_Radar.Radar;
end;

function TFrame_Commands.GetSynchro: ISynchro;
begin
  Result := Frame_Synchro.Synchro;
end;

procedure TFrame_Commands.SetAntenna(Value: IAntenna);
begin
  Frame_Antenna.Antenna := Value;
end;

procedure TFrame_Commands.SetRadar(Value: IRadar);
begin
  Frame_Radar.Radar := Value;
end;

procedure TFrame_Commands.SetSynchro(Value: ISynchro);
begin
  Frame_Synchro.Synchro := Value;
end;

end.

