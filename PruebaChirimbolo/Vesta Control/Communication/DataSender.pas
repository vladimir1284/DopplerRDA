unit DataSender;

interface

uses
  IdTCPServer, Windows, Classes, SysUtils, ElbrusTypes, SyncObjs, Contnrs;

const
  MaxPackageCount = 1000;

type
  TDataPackage =
    class
      private
        fmsg    : cardinal;
        fndata  : cardinal;
        fdata   : PDWords;
      public
        constructor Create(_msg : cardinal; _ndata : integer; _buffer : PDWords);

        property msg    : cardinal read fmsg    write fmsg;
        property NData  : cardinal read fndata  write fndata;
        property Data   : PDWords  read fdata   write fdata;
    end;

  TDataSenderThread =
    class(TIdPeerThread)
      private
        packages : TQueue;
        index : integer;
        lock : TCriticalSection;
      protected
        procedure Run; override;
      public
        constructor Create(ACreateSuspended: Boolean = True); override;

        procedure SendDataPackage(msg : cardinal; ndata : integer; buffer : pointer);

        procedure Send_TX_Burst(ndata : integer; buffer : pointer );
        procedure Send_TX_Spectrum(ndata : integer; buffer : pointer );
        procedure Send_RX_Power(ndata : integer; buffer : pointer );
        procedure Send_RX_Speed(ndata : integer; buffer : pointer );
        procedure Send_RX_SpectrumWidth(ndata : integer; buffer : pointer );
        procedure Send_RX_SQI(ndata : integer; buffer : pointer );
        procedure Send_RX_CI(ndata : integer; buffer : pointer );
    end;

var
    theDataSender : TIdTCPServer;

implementation

uses Constants;

{ TDataExcanhe }

constructor TDataSenderThread.Create(ACreateSuspended: Boolean);
begin
  inherited Create( true );
  Priority := tpHigher;

  lock := TCriticalSection.Create;
  packages := TQueue.Create;

  if not ACreateSuspended
    then Resume;
end;

procedure TDataSenderThread.Run;
var
  Command : string;
  package : TDataPackage;
begin
  try
    while (not Terminated) do
    begin
      package := TDataPackage(packages.Pop);
      if Assigned(package)
        then
          begin
            Connection.WriteCardinal( package.msg );
            Connection.WriteCardinal( package.NData );
            Connection.WriteBuffer(package.Data^, package.NData * sizeof(dword));
          end
        else Sleep(1000);

      try
        Connection.CheckForDisconnect;
      except
        Terminate;
      end;
    end;
  finally
    packages.Free;
    lock.Free;
  end;
end;

procedure TDataSenderThread.SendDataPackage(msg: cardinal; ndata: integer; buffer: pointer);
var
  package : TDataPackage;
begin
  package := TDataPackage.Create(msg, ndata, buffer);
  packages.Push(package);
end;

procedure TDataSenderThread.Send_RX_CI(ndata: integer; buffer: pointer);
begin
  SendDataPackage(MSG_RX_CI, ndata, buffer);
end;

procedure TDataSenderThread.Send_RX_Power(ndata: integer; buffer: pointer);
begin
  SendDataPackage(MSG_RX_Power, ndata, buffer);
end;

procedure TDataSenderThread.Send_RX_SpectrumWidth(ndata: integer; buffer: pointer);
begin
  SendDataPackage(MSG_RX_Spectrum, ndata, buffer);
end;

procedure TDataSenderThread.Send_RX_Speed(ndata: integer; buffer: pointer);
begin
  SendDataPackage(MSG_RX_Speed, ndata, buffer);
end;

procedure TDataSenderThread.Send_RX_SQI(ndata: integer; buffer: pointer);
begin
  SendDataPackage(MSG_RX_SQI, ndata, buffer);
end;

procedure TDataSenderThread.Send_TX_Burst(ndata: integer; buffer: pointer);
begin
  SendDataPackage(MSG_TX_Burst, ndata, buffer);
end;

procedure TDataSenderThread.Send_TX_Spectrum(ndata: integer; buffer: pointer);
begin
  SendDataPackage(MSG_TX_Spectrum, ndata, buffer);
end;

{ TDataPackage }

constructor TDataPackage.Create(_msg: cardinal; _ndata: integer; _buffer: PDWords);
var
  package_size : integer;
begin
  fmsg := _msg;
  fndata := _ndata;
  package_size := ndata * sizeof(dword);
  fdata := AllocMem(package_size);
  Move(_buffer, fdata, package_size);
end;

end.
