unit FrameSynchro;

interface

uses 
  SysUtils, Forms, StdCtrls, Onoff, Controls, Classes, CommonObjs, InvokeRegistry, TxsRxsWS;

type
  TFrame_Synchro = class(TFrame)
    Button3: TButton;
    Led1: TLed;
    Button4: TButton;
    Led2: TLed;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    fUpdating : boolean;
    fAuthHeader : TAuthHeader;
    fSynchro : ITxsRxsWS;

    function GetSynchro: ITxsRxsWS;
  public
    procedure Init(value: ITxsRxsWS; AuthHeader : TAuthHeader);
    procedure UpdateView;

    property Updating : boolean read fUpdating;
  published
    property Synchro : ITxsRxsWS read GetSynchro;
  end;

implementation

uses Shell_Client;

{$R *.DFM}

{ TFrame_Synchro }

procedure TFrame_Synchro.UpdateView;
const
  SrcStr : array[0..4] of string = ('Interno','Ext. Dig.','Ext. A_BS','Ext. A_BC','');
var
  Freq  : single;
  Src   : integer;
begin
  if fUpdating then exit;
  fUpdating := true;
  try
    try
      if assigned(Synchro)
        then Freq := Synchro.Frecuencia
        else Freq := 0;
      if assigned(Synchro)
        then Src  := Ord(Synchro.Fuente)
        else Src  := 0;
      if (Src < 0) or (Src > 3)
        then Src := 4;
      Edit1.Text := IntToStr(round(Freq));
      Edit2.Text := SrcStr[Src];
      Led1.State := Synchro.TxRxPulso = tx_Pulse_Long;
      Led2.State := Synchro.TxRxPulso = tx_Pulse_Short;
    except
    end;
  finally
    fUpdating := false;
  end;
end;

procedure TFrame_Synchro.Button3Click(Sender: TObject);
begin
  if assigned(Synchro)
    then Synchro.Set_Pulso_Largo;
  UpdateView;
end;

procedure TFrame_Synchro.Button4Click(Sender: TObject);
begin
  if assigned(Synchro)
    then Synchro.Set_Pulso_Corto;
  UpdateView;
end;

function TFrame_Synchro.GetSynchro: ITxsRxsWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fSynchro as ISOAPHeaders;
  Headers.Send(fAuthHeader);
  result := fSynchro;
end;

procedure TFrame_Synchro.Init(value: ITxsRxsWS; AuthHeader: TAuthHeader);
begin
  fUpdating := false;
  fAuthHeader := AuthHeader;
  fSynchro := Value;

  UpdateView;
end;

end.

