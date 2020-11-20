unit Unit1;

{$IFDEF VER220}
  {$define DELPHI2009UP}
{$endif}

{$IFDEF VER210}
  {$define DELPHI2009UP}
{$endif}

{$IFDEF VER200}
  {$define DELPHI2009UP}
{$endif}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZylSerialPort, ExtCtrls;

type
  TForm1 = class(TForm)
    ZylSerialPort: TZylSerialPort;
    Memo: TMemo;
    btnOpen: TButton;
    Edit1: TEdit;
    btnSendStr: TButton;
    btnClose: TButton;
    lstPort: TListBox;
    btnSendData: TButton;
    rgMode: TRadioGroup;
    lstBaudRate: TListBox;
    procedure btnOpenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ZylSerialPortLineStatusChange(Sender: TObject;
      LineStatus: TLineStatusSet);
    procedure btnSendStrClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSendDataClick(Sender: TObject);
    procedure ZylSerialPortDisconnect(Sender: TObject; Port: TCommPort);
    procedure ZylSerialPortConnect(Sender: TObject; Port: TCommPort);
    {$IFDEF DELPHI2009UP}
    procedure ZylSerialPortReceive(Sender: TObject; Buffer: AnsiString);
    procedure ZylSerialPortSend(Sender: TObject; Buffer: AnsiString);
    {$ELSE}
    procedure ZylSerialPortReceive(Sender: TObject; Buffer: String);
    procedure ZylSerialPortSend(Sender: TObject; Buffer: String);
    {$ENDIF}
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  ZylSerialPort.Port := TCommPort(lstPort.ItemIndex + 1);
  //ZylSerialPort.CustomPortName := 'virtual';
  ZylSerialPort.BaudRate := ZylSerialPort.IntToBaudRate(StrToInt(lstBaudRate.Items[lstBaudRate.ItemIndex]));
  ZylSerialPort.Open;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ZylSerialPort.Close();
end;

procedure TForm1.ZylSerialPortLineStatusChange(Sender: TObject;
  LineStatus: TLineStatusSet);
var
  strLine: AnsiString;
begin
  strLine := '';
  if lsCTS in LineStatus then
    strLine := strLine + 'CTS ';
  if lsDSR in LineStatus then
    strLine := strLine + 'DSR ';
  if lsRING in LineStatus then
    strLine := strLine + 'RING ';
  if lsCD in LineStatus then
    strLine := strLine + 'CD ';
  Memo.Lines.Add('Line Change: ' + strLine);    
end;

procedure TForm1.btnSendStrClick(Sender: TObject);
begin
  ZylSerialPort.SendStringOnNewThread(edit1.Text + #13#10); 
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  ZylSerialPort.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
  lstPorts: TStringList;
begin
  lstPorts := TStringList.Create;
  ZylSerialPort.GetExistingCommPortNames(lstPorts);
  Memo.Lines.Add('Installed COMM Ports:');
  for i := 0 to lstPorts.Count - 1 do
  begin
    Memo.Lines.Add(lstPorts[i]);
  end;
  lstPorts.Free();
  lstBaudRate.ItemIndex := lstBaudRate.Items.IndexOf('4800');
end;

procedure TForm1.btnSendDataClick(Sender: TObject);
{$ifndef CLR}
var
  tmp: ^Char;
  com_w:array [0..20] of char;
{$endif}
begin
  {$ifndef CLR}
  GetMem(tmp, 20);
  FillChar(tmp^, 20, #0);
  ZylSerialPort.SendData(tmp, 20);
  FillChar(com_w, 20, #0);
  ZylSerialPort.SendData(@com_w, 20);
  FreeMem(tmp);
  {$endif}
end;

procedure TForm1.ZylSerialPortDisconnect(Sender: TObject; Port: TCommPort);
begin
  Memo.Lines.Add('Disconnected from ' + ZylSerialPort.CommPortToString(Port));
end;

procedure TForm1.ZylSerialPortConnect(Sender: TObject; Port: TCommPort);
begin
  Memo.Lines.Add('Connected to ' + ZylSerialPort.CommPortToString(Port));
end;

{$IFDEF DELPHI2009UP}
procedure TForm1.ZylSerialPortReceive(Sender: TObject; Buffer: AnsiString);
{$ELSE}
procedure TForm1.ZylSerialPortReceive(Sender: TObject; Buffer: String);
{$ENDIF}
var
  strBuffer: AnsiString;
  i: Integer;
begin
  if rgMode.ItemIndex = 0 then
    Memo.Lines.Add(Buffer)
  else if rgMode.ItemIndex = 1 then
  begin
    strBuffer := '';
    for i := 1 to Length(Buffer) do
      strBuffer := strBuffer + IntToStr(Ord(Buffer[i]));
    Memo.Lines.Add(strBuffer)
  end
  else
  begin
    strBuffer := '';
    for i := 1 to Length(Buffer) do
      strBuffer := strBuffer + IntToHex(Ord(Buffer[i]), 1);
    Memo.Lines.Add(strBuffer)
  end;
end;

{$IFDEF DELPHI2009UP}
procedure TForm1.ZylSerialPortSend(Sender: TObject; Buffer: AnsiString);
{$ELSE}
procedure TForm1.ZylSerialPortSend(Sender: TObject; Buffer: String);
{$ENDIF}
begin
  Memo.Lines.Add('Sent: ' + Buffer);
end;

end.
