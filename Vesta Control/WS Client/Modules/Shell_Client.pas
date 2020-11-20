unit Shell_Client;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, RTForm,
  FrameControl, FrameLogs, FrameSunPosition, ImgList,
  FrameConfiguration, FrameTxRxCalib, FrameVideo, ComCtrls, FrameAdmin,
  FrameObservation, Menus, FrameMotor, ExtCtrls, FrameRadar, FrameAntenna,
  FrameSynchro, FrameObservations, Rda_TLB, AppEvnts, FrameStatistics, DataReceiverThread,
  StdCtrls, Tune;

const
  DefaultFasterTime = 100;
  DefaultFastTime   = 1000;
  DefaultMedTime    = 2000;
  DefaultSlowTime   = 10000;
  DefaultSlowerTime = 120000;
  DisconnectError   = ' Desconectado del servidor';

type
  EIncompatibleVersion =
    class( Exception )
    end;

  TShellClient = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter5: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Observations: TFrame_Observations;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TxsRxsSheet: TTabSheet;
    TabSheet5: TTabSheet;
    Timer1: TTimer;
    MainMenu1: TMainMenu;
    Cliente1: TMenuItem;
    Creditos1: TMenuItem;
    N1: TMenuItem;
    Terminar1: TMenuItem;
    ImageList2: TImageList;
    ImageList1: TImageList;
    Admin: TFrame_Admin;
    RDA1: TMenuItem;
    Refrescar1: TMenuItem;
    Panel4: TPanel;
    TabSheet6: TTabSheet;
    Version1: TMenuItem;
    iempoReal1: TMenuItem;
    N2: TMenuItem;
    iempoRealCh21: TMenuItem;
    Actualizar1: TMenuItem;
    Frame_Logs: TFrame_Logs;
    TabSheet4: TTabSheet;
    StatisticsView: TFrame_Statistics;
    Configuration: TFrame_Configuration;
    Panel6: TPanel;
    Observation: TFrame_Observation;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Control: TFrame_Control;
    Radar: TFrame_Radar;
    Synchro: TFrame_Synchro;
    Panel5: TPanel;
    pnlMotors: TPanel;
    pnlMotorEl: TPanel;
    MotorEl: TFrame_Motor;
    pnlMotorAz: TPanel;
    MotorAz: TFrame_Motor;
    Antenna: TFrame_Antenna;
    SunPosition: TFrame_SunPosition;
    pnlTxRx1: TPanel;
    pnlTxRx2: TPanel;
    TxRx2: TFrame_TxRx_Calibration;
    TxRx1: TFrame_TxRx_Calibration;
    Panel10: TPanel;
    Panel11: TPanel;
    Label15: TLabel;
    Video: TFrame_Video;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RefreshRadar(Sender: TObject);
    procedure Terminar1Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure Refrescar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObservationsButton1Click(Sender: TObject);
    procedure AdminEditar1Click(Sender: TObject);
    procedure ControlButton1Click(Sender: TObject);
    procedure Version1Click(Sender: TObject);
    procedure iempoReal1Click(Sender: TObject);
    procedure iempoRealCh21Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Actualizar1Click(Sender: TObject);
    procedure ChequearPuntosdeReferencia1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private //Refresh Data
    fLastFasterTime,
    fLastFastTime,
    fLastMedTime,
    fLastSlowTime,
    fLastSlowerTime,
    fFasterTime,
    fFastTime,
    fMedTime,
    fSlowTime,
    fSlowerTime : cardinal;
    fSaveTimerEnabled : boolean;

    fRDA_Host : string;

    fDataReceiver : TDataReceiverThread;
  private
    fVestaRDA : IVestaRDA;

    procedure ConnectRDA( Server : string );
    function  Login     ( UserName, Password : string ) : boolean;
    procedure Logout;
    function  StopObs : boolean;
    function  ConnectInterfaces : boolean;
    procedure UpdateRealTime;
    procedure UpdateFaster;
    procedure UpdateFast;
    procedure UpdateMed;
    procedure UpdateSlow;
    procedure UpdateSlower;
    function  IncompatibleVersion : boolean;
  public
    RT_Ch1,
    RT_Ch2 :  TRealTimeForm;
    function  Initialize : boolean;
    procedure AppException(Sender: TObject; E: Exception);
    procedure AppMinimize(Sender: TObject);
    procedure AppRestore(Sender: TObject);
    procedure ProcessAllMessages;

    property  GeneralConfiguration : TFrame_Configuration read Configuration;
    property  VestaRDA : IVestaRDA read fVestaRDA;
  end;

var
  ShellClient: TShellClient;

implementation

{$R *.DFM}

uses
  ComObj,
  AboutDialog,
  LoginDialog,
  WaitDialog,
  Registry,
  RdaMessages,
  VersionInfo,
  Constants,
  RTConfiguration, UpdaterThread;

const
  ClientRootKey     = {HKEY_CURRENT_USER} '\SOFTWARE\LDT\Vesta\RDAClient';
  RTConfigKey       = ClientRootKey + '\RTConfig';
  RTChannel_3cmKey  = RTConfigKey + '\RTChannel_3cm';
  RTChannel_10cmKey = RTConfigKey + '\RTChannel_10cm';

procedure TShellClient.FormCreate(Sender: TObject);
begin
  Application.OnException := AppException;
  Application.OnMinimize  := AppMinimize;
  Application.OnRestore   := AppRestore;
  
  fRDA_Host := '';

  //Data Refresh Times
  fLastFasterTime := GetTickCount;
  fLastFastTime   := GetTickCount;
  fLastMedTime    := GetTickCount;
  fLastSlowTime   := GetTickCount;
  fLastSlowerTime := GetTickCount;
  fFasterTime     := DefaultFasterTime;
  fFastTime       := DefaultFastTime;
  fMedTime        := DefaultMedTime;
  fSlowTime       := DefaultSlowTime;
  fSlowerTime     := DefaultSlowTime;

  //Real Time
  RT_Ch1 := TRealTimeForm.Create( Application );
  RT_Ch1.Caption := 'Display de Tiempo Real Canal #1';
  RT_Ch1.RTConfig := TConfig.Create( RTChannel_3cmKey );
  RT_Ch2 := TRealTimeForm.Create( Application );
  RT_Ch2.Caption := 'Display de Tiempo Real Canal #2';
  RT_Ch2.RTConfig := TConfig.Create( RTChannel_10cmKey );
  //Initialize Realtime Forms
  RT_Ch1.LoadData;
  RT_Ch2.LoadData;
end;

procedure TShellClient.FormDestroy(Sender: TObject);
begin
  Logout;
  fDataReceiver.Terminate;
  theUpdaterThread.Terminate;  
end;

procedure TShellClient.ConnectRDA(Server: string);
begin
  try
    fVestaRDA := CoVestaRDA.CreateRemote( Server );
    if IncompatibleVersion
      then raise EIncompatibleVersion.Create( 'Version del Cliente: [' + GetVersionString(vs_FileVersion) + ']' + #13#10 +
                                              'Version del Servidor: ' + fVestaRDA.Version );
  except
    on E : Exception do
    begin
      fVestaRDA := nil;
      with TRegistry.Create do
        try
          if OpenKey(LoginKey, true)
            then WriteBool(AutoLogValue, false);
        finally
          Free;
        end;
      raise;  
    end;
  end;
end;

function TShellClient.Login(UserName, Password: string) : boolean;
var
  Log : ILogin;
begin
  fVestaRDA.QueryInterface(ILogin, Log);
  Result := assigned(Log) and (Log.Login(UserName, Password) = S_OK);
end;

procedure TShellClient.Logout;
var
  Log : ILogin;
begin
  if assigned(fVestaRDA)
    then
      try
        fVestaRDA.QueryInterface(ILogin, Log);
        if assigned(Log)
          then Log.Logout;
      finally
        fVestaRDA := nil;
      end;
end;

function TShellClient.StopObs : boolean;
var
  Obs : IObservation;
  I   : integer;
begin
  Result := true;
  if assigned(fVestaRDA)
    then
      try
        Obs := fVestaRDA.Observations as IObservation;
        if assigned(Obs)
          then
            if (Obs.InProgress) and (Obs.Client = (VestaRDA as ILogin).ControllerName)
              then
                begin
                  Obs.Cancel;
                  for I := 0 to 9 do
                    if Obs.Inprogress
                      then Sleep(1000)
                      else break;
                  Result := not Obs.Inprogress;
                end;
      except
      end;
end;

function TShellClient.ConnectInterfaces : boolean;
begin
  Result := false;
  try
    try
      Configuration.Configuration := fVestaRDA.Configuration;
      StatisticsView.Statistics   := fVestaRDA.Statistics;
      SunPosition.Configuration   := fVestaRDA.Configuration;
      SunPosition.UpdateView;
      RT_Ch1.RTDisplay.BeamWidth  := Configuration.Configuration.Beam_Ch1;
      RT_Ch2.RTDisplay.BeamWidth  := Configuration.Configuration.Beam_Ch2;
    except
    end;
    try
      Control.Login := fVestaRDA as ILogin;
    except
    end;
    try
      Antenna.Antenna := fVestaRDA.Antenna;
    except
    end;
    try
      Radar.Radar := fVestaRDA.Radar;
    except
    end;
    try
      Synchro.Synchro := fVestaRDA.TxsRxs as ISynchro;
    except
    end;
    try
      Observations.Observations  := fVestaRDA.Observations;
      Observations.Configuration := fVestaRDA.Configuration;
    except
    end;
    try
      Admin.Admin := Control.Login;
    except
    end;
    try
      Observation.Observation := fVestaRDA.Observations as IObservation;
    except
    end;
    try
      MotorAz.Motor := fVestaRDA.Antenna.Motor_Az;
      MotorAz.Observations := fVestaRDA.Observations;
    except
    end;
    try
      MotorEl.Motor := fVestaRDA.Antenna.Motor_El;
      MotorEl.Observations := fVestaRDA.Observations;
    except
    end;
    pnlMotorEl.Width := pnlMotors.Width div 2;
    try
      TxRx1.TxRx := fVestaRDA.TxsRxs.GetTxRx(0);
      pnlTxRx1.Visible := TxRx1.TxRx <> nil;
    except
    end;
    try
      TxRx2.TxRx := fVestaRDA.TxsRxs.GetTxRx(1);
      pnlTxRx2.Visible := TxRx2.TxRx <> nil;
    except
    end;
    try
      Video.Video := fVestaRDA.TxsRxs as IVideo;
    except
    end;
    if pnlTxRx1.Visible
      then pnlTxRx1.Width := TxsRxsSheet.Width div 2;

    Caption := Caption + ' - [' + Control.Login.Name + ']';
    Result := true;
  except
  end;
end;

function TShellClient.Initialize: boolean;
var
  AutoLog : boolean;
  stream_port : integer;
begin
  Result := false;
  with TFLogin.Create(Self) do
    try
      AutoLog := false;
      with TRegistry.Create do
      try
        if OpenKey(LoginKey, false)
          then if ValueExists(AutoLogValue)
                 then AutoLog := ReadBool(AutoLogValue)
      finally
        free;
      end;

      if AutoLog or (ShowModal = ID_OK)
        then
          with TFWait.Create(Self) do
            try
              Caption := Caption + ' - [' + Edit2.Text + ']';
              Update;
              try
                ConnectRDA( Edit1.Text );
                if Login(Edit2.Text, Edit3.Text)
                  then Result := ConnectInterfaces
                  else Application.MessageBox('El nombre de usuario y contraseña no fueron identificados',
                                              'Fallo de verificacion', MB_ICONSTOP);

                if result
                  then
                    begin
                      fRDA_Host := Edit1.Text;
                      //rda data streams
                      stream_port := fVestaRDA.Configuration.StreamPort;
                      theUpdaterThread := TUpdaterThread.Create(false);
                      fDataReceiver := TDataReceiverThread.Create(fRDA_Host, stream_port);
                    end;
              except
                on E : EIncompatibleVersion do
                  MessageDlg('Este cliente es incompatible con el servidor ' +#13#10+
                             'al cual se desea conectar ' + #13#10 + E.Message, mtError	, [mbOk], 0);
                on Exception do
                  Application.MessageBox('No se pudo conectar con el servidor RDA.'#13#10#13#10 +
                                         'Por favor, verifique la direccion del servidor y'#13#10 +
                                         'compruebe que no haya otro cliente conectado.',
                                         'Fallo de conexion', MB_ICONSTOP);
              end;
            finally
              Release;
            end;
    finally
      Release;
    end;
end;

procedure TShellClient.UpdateFaster;
begin
  if PageControl2.ActivePageIndex = 0
    then
      begin
        MotorAz.UpdateView;
        MotorEl.UpdateView;
      end;
end;

procedure TShellClient.UpdateMed;
begin
  Control.UpdateView;
  Antenna.UpdateView;
  Radar.UpdateView;
  Synchro.UpdateView;
end;

procedure TShellClient.UpdateSlow;
begin
  Video.UpdateView;

  case PageControl1.ActivePageIndex of
    0 : Observations.UpdateView;
    1 : Admin.UpdateView;
  end;

  case PageControl2.ActivePageIndex of
    4 : StatisticsView.UpdateView;
  end;
end;

procedure TShellClient.RefreshRadar(Sender: TObject);
var
  TimerEnabled : boolean;
begin
  TimerEnabled := Timer1.Enabled;
  Timer1.Enabled := false;
  try
    UpdateRealTime;
    if GetTickCount - fLastFasterTime > fFasterTime
      then
        begin
          UpdateFaster;
          fLastFasterTime := GetTickCount;
        end;
    if GetTickCount - fLastFastTime > fFastTime
      then
        begin
          UpdateFast;
          fLastFastTime := GetTickCount;
        end;
    if GetTickCount - fLastMedTime > fMedTime
      then
        begin
          UpdateMed;
          fLastMedTime := GetTickCount;
        end;
    if GetTickCount - fLastSlowTime > fSlowTime
      then
        begin
          UpdateSlow;
          fLastSlowTime := GetTickCount;
        end;
    if GetTickCount - fLastSlowerTime > fSlowerTime
      then
        begin
          UpdateSlower;
          fLastSlowerTime := GetTickCount;
        end;
    Timer1.Enabled := TimerEnabled;
  except
    Refrescar1.Checked := false;
    Timer1.Enabled := false;
    Caption := Caption + DisconnectError;
  end;
end;

procedure TShellClient.Terminar1Click(Sender: TObject);
begin
  Close;
end;

procedure TShellClient.Creditos1Click(Sender: TObject);
begin
  with TFAboutDialog.Create(Self) do
    try
      ShowModal;
    finally          
      Release;
    end;
end;

procedure TShellClient.Refrescar1Click(Sender: TObject);

var
  FormCaption : string;
begin
  with Sender as TMenuItem do
    Checked := not Checked;
  if Refrescar1.Checked
    then
      begin
        if Pos(DisconnectError, Caption) > 0
          then
            begin
              FormCaption := Caption;
              Delete( FormCaption, Pos(DisconnectError, Caption), Length(DisconnectError) );
              Caption := FormCaption;
            end;
      end
    else Caption := Caption + DisconnectError;  
  Timer1.Enabled := Refrescar1.Checked;
end;

procedure TShellClient.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if StopObs
    then Action := caFree
    else Action := caNone;
end;

procedure TShellClient.ObservationsButton1Click(Sender: TObject);
begin
  Observations.Button1Click( nil );
end;

procedure TShellClient.AdminEditar1Click(Sender: TObject);
begin
  Admin.Editar1Click(Sender);
end;

procedure TShellClient.ControlButton1Click(Sender: TObject);
begin
  Control.Button1Click(Sender);
  Control.UpdateView;
end;

procedure TShellClient.AppException(Sender: TObject; E: Exception);
begin
  if e is EOleSysError
    then
      begin
{
        ShowMessage( EOLEMessage );
        Refrescar1.Checked := false;
        Timer1.Enabled := false;
}        
      end;
end;

procedure TShellClient.Version1Click(Sender: TObject);
begin
  ShowMessage( 'La versión del servidor RDA es: ' + VestaRDA.Version );
end;

function TShellClient.IncompatibleVersion: boolean;
var
  ServerInf, ClientInf : string;
  ServerVersion, ClientVersion,
  ServerRelease, ClientRelease : integer;

begin
  ClientInf := GetVersionString(vs_FileVersion);
  ServerInf := VestaRDA.Version;
  Delete( ServerInf, 1, 1 );
  Delete( ServerInf, Length( ServerInf ), 1 );
  ClientVersion := StrToInt( Copy( ClientInf, 1, Pos( '.', ClientInf )-1 ) );
  ServerVersion := StrToInt( Copy( ServerInf, 1, Pos( '.', ServerInf )-1 ) );
  Delete( ClientInf, 1, Pos( '.', ClientInf ) );
  Delete( ServerInf, 1, Pos( '.', ServerInf ) );
  Delete( ClientInf, 1, Pos( '.', ClientInf ) );
  Delete( ServerInf, 1, Pos( '.', ServerInf ) );
  ClientRelease := StrToInt( Copy( ClientInf, 1, Pos( '.', ClientInf )-1 ) );
  ServerRelease := StrToInt( Copy( ServerInf, 1, Pos( '.', ServerInf )-1 ) );

  result := (ClientVersion <> ServerVersion) or (ClientRelease <> ServerRelease);
end;

procedure TShellClient.iempoReal1Click(Sender: TObject);
begin
  RT_Ch1.Show;
end;

procedure TShellClient.iempoRealCh21Click(Sender: TObject);
begin
  RT_Ch2.Show;
end;

procedure TShellClient.ProcessAllMessages;
begin
  Application.ProcessMessages;
end;

procedure TShellClient.UpdateRealTime;
begin
end;

procedure TShellClient.PageControl2Change(Sender: TObject);
begin
  if Timer1.Enabled
    then
      case PageControl2.ActivePageIndex of
        2 : Configuration.UpdateView;
        3 : Frame_Logs.UpdateView;
        4 : StatisticsView.UpdateView;
      end;
end;

procedure TShellClient.PageControl1Change(Sender: TObject);
begin
  if Timer1.Enabled
    then
      case PageControl1.ActivePageIndex of
        0 : Observations.UpdateView;
        1 : Admin.UpdateView;
      end;
end;

procedure TShellClient.UpdateSlower;
begin
  SunPosition.UpdateView;
end;

procedure TShellClient.UpdateFast;
begin
  if PageControl2.ActivePageIndex = 1
    then
      begin
        TxRx1.UpdateView;
        TxRx2.UpdateView;
      end;

  if (PageControl2.ActivePageIndex = 2) and (Configuration.PageControl1.ActivePageIndex = 4)
    then Configuration.UpdateAI;

  Observation.UpdateView;
end;

procedure TShellClient.AppMinimize(Sender: TObject);
begin
  fSaveTimerEnabled := Timer1.Enabled;
  Timer1.Enabled := false;
  Refrescar1.Checked := false;
end;

procedure TShellClient.AppRestore(Sender: TObject);
begin
  Timer1.Enabled := fSaveTimerEnabled;
  Refrescar1.Checked := fSaveTimerEnabled;
end;

procedure TShellClient.Actualizar1Click(Sender: TObject);
begin
  RefreshRadar( nil );
end;

procedure TShellClient.ChequearPuntosdeReferencia1Click(Sender: TObject);
begin
  Observations.Observations.ChequearRadar;
end;

procedure TShellClient.FormResize(Sender: TObject);
begin
  pnlMotorEl.Width := pnlMotors.Width div 2;
  pnlTxRx1.Width   := TxsRxsSheet.Width div 2;
end;

end.

