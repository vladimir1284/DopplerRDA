unit VideoDataReceiver;

interface

uses
  Classes, RTDisplay, IdBaseComponent, SysUtils,
  IdComponent, IdTCPConnection, IdTCPClient, SyncObjs;

type
  TNewDataArriveEvent = procedure(sender : TObject; Ch1, Ch2 : pointer; Count : integer) of object;

  TVideoDataReceiver = class(TThread)
  private
    DataReceiver : TIdTCPClient;
    lock : THandle;
    fDataType : integer;
    fRays  : integer;
    fCells : integer;
    fCodes : boolean;
    fChannel : integer;
    BufferSize : integer;
    SentCells : integer;

    ch1, ch2 : pointer;

    fNewDataArriveEvent : TNewDataArriveEvent;

    procedure PaintData();
    procedure setCells(const Value: integer);
    procedure setChannel(const Value: integer);
    procedure setCodes(const Value: boolean);
    procedure setDataType(const Value: integer);
    procedure setRays(const Value: integer);
  protected
    procedure Execute; override;
  public
    constructor Create(Host : string; Port : integer; Channel, DataType, Rays, Cells : integer; Codes : boolean);
    destructor  Destroy; override;

    property DataType : integer read fDataType write setDataType;
    property Rays     : integer read fRays     write setRays;
    property Cells    : integer read fCells    write setCells;
    property Codes    : boolean read fCodes    write setCodes;
    property Channel  : integer read fChannel  write setChannel;

    property OnNewDataArriveEvent : TNewDataArriveEvent read fNewDataArriveEvent write fNewDataArriveEvent;
  end;

implementation

uses
  Windows, Shell_Client, Constants;

{ TVideoDataReceiver }

constructor TVideoDataReceiver.Create(Host : string; Port : integer; Channel, DataType, Rays, Cells : integer; Codes : boolean);
begin
  inherited Create( True );
  FreeOnTerminate := true;
  Priority := tpHigher;

  lock := CreateMutex(nil, false, 'VideoDataReceiver');

  DataReceiver := TIdTCPClient.Create( nil );
  DataReceiver.Port := Port;
  DataReceiver.Host := Host;

  DataReceiver.Connect(oscMaxTimeServerConnect);

  self.DataType := DataType;
  self.Rays     := Rays;
  self.Cells    := Cells;
  self.Codes    := Codes;
  self.Channel  := Channel;
  
  Resume;
end;

destructor TVideoDataReceiver.Destroy;
begin
  if DataReceiver.Connected
    then DataReceiver.Disconnect;
  DataReceiver.Free;
  inherited;
end;

procedure TVideoDataReceiver.Execute;
begin
  while (not Terminated) do
  begin
    if WaitForSingleObject(lock, 1000) = WAIT_OBJECT_0
      then
        try
          try
            DataReceiver.WriteLn('ch' + IntToStr(fChannel));
            SentCells := DataReceiver.ReadCardinal;
            BufferSize := SentCells * sizeof(word);
            case fChannel of
            0 : begin
                  GetMem(ch1, BufferSize);
                  FillChar(ch1^, BufferSize, 0);
                  DataReceiver.ReadBuffer(ch1^, BufferSize);
                end;
            1 : begin
                  GetMem(ch2, BufferSize);
                  FillChar(ch2^, BufferSize, 0);
                  DataReceiver.ReadBuffer(ch2^, BufferSize);
                end;
            2 : begin
                  GetMem(ch1, BufferSize);
                  FillChar(ch1^, BufferSize, 0);
                  DataReceiver.ReadBuffer(ch1^, BufferSize);

                  GetMem(ch2, BufferSize);
                  FillChar(ch2^, BufferSize, 0);
                  DataReceiver.ReadBuffer(ch2^, BufferSize);
                end;
            end;

            if SentCells = fCells
              then
                begin
                  Synchronize(PaintData);
                  if Assigned(fNewDataArriveEvent)
                    then fNewDataArriveEvent(self, ch1, ch2, BufferSize);
                end;
            Sleep(100);
          finally
            ReleaseMutex(lock);
          end;
        except
          Terminate;
        end;
  end;
end;

procedure TVideoDataReceiver.PaintData;
begin
  if(ch1 <> nil)
    then
      begin
        ShellClient.Video.Video1.SetData1(ch1^);
        FreeMem(ch1);
        ch1 := nil;
      end;
  if(ch2 <> nil)
    then
      begin
        ShellClient.Video.Video1.SetData2(ch2^);
        FreeMem(ch2);
        ch2 := nil;
      end;
end;

procedure TVideoDataReceiver.setCells(const Value: integer);
var
  result : string;
begin
  if WaitForSingleObject(lock, 1000) = WAIT_OBJECT_0
    then
      try
        DataReceiver.WriteLn(oscSetCellsCommand);
        DataReceiver.WriteInteger(Value);
        result := DataReceiver.ReadLn('', oscClientCommandTimeOut);
        if result = oscSuccess
          then fCells := Value;
      finally
        ReleaseMutex(lock);
      end;
end;

procedure TVideoDataReceiver.setChannel(const Value: integer);
var
  result : string;
begin
  if WaitForSingleObject(lock, 1000) = WAIT_OBJECT_0
    then
      try
        DataReceiver.WriteLn(oscSetChannelsCommand);
        DataReceiver.WriteInteger(Value);
        result := DataReceiver.ReadLn('', oscClientCommandTimeOut);
        if result = oscSuccess
          then fChannel := Value;
      finally
        ReleaseMutex(lock);
      end;
end;

procedure TVideoDataReceiver.setCodes(const Value: boolean);
var
  result : string;
begin
  if WaitForSingleObject(lock, 1000) = WAIT_OBJECT_0
    then
      try
        DataReceiver.WriteLn(oscSetCodesCommand);
        DataReceiver.WriteInteger(Ord(Value));
        result := DataReceiver.ReadLn('', oscClientCommandTimeOut);
        if result = oscSuccess
          then fCodes := Value;
      finally
        ReleaseMutex(lock);
      end;
end;

procedure TVideoDataReceiver.setDataType(const Value: integer);
var
  result : string;
begin
  if WaitForSingleObject(lock, 1000) = WAIT_OBJECT_0
    then
      try
        DataReceiver.WriteLn(oscSetDataTypeCommand);
        DataReceiver.WriteInteger(Value);
        result := DataReceiver.ReadLn('', oscClientCommandTimeOut);
        if result = oscSuccess
          then fDataType := Value;
      finally
        ReleaseMutex(lock);
      end;
end;

procedure TVideoDataReceiver.setRays(const Value: integer);
var
  result : string;
begin
  if WaitForSingleObject(lock, 1000) = WAIT_OBJECT_0
    then
      try
        DataReceiver.WriteLn(oscSetRaysCommand);
        DataReceiver.WriteInteger(Value);
        result := DataReceiver.ReadLn('', oscClientCommandTimeOut);
        if result = oscSuccess
          then fRays := Value;
      finally
        ReleaseMutex(lock);
      end;
end;

end.
 