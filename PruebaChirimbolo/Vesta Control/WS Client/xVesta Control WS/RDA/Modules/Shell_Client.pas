unit Shell_Client;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FrameControl, FrameLogs, FrameSunPosition, ImgList,
  FrameConfiguration, FrameTxRxCalib, FrameVideo, ComCtrls, FrameAdmin,
  FrameObservation, Menus, FrameMotor, ExtCtrls, FrameRadar, FrameAntenna,
  FrameSynchro, FrameObservations, Rda_TLB, AppEvnts, FrameStatistics, LoginWS,
  AntennaWS, InvokeRegistry, AZMotorWS, ELMotorWS, RadarWS, ObservationsWS,
  TxRxCh1WS, TxRxCh2WS, VideoWS, StatisticsWS, LogWS, ConfigurationWS,
  CommonObjs, VestaWS, CalibrationCH1WS, CalibrationCH2WS;

const
  DefaultFasterTime = 150;
  DefaultFastTime   = 1000;
  DefaultMedTime    = 5000;
  DefaultSlowTime   = 10000;
  DefaultSlowerTime = 120000;
  RTFasterTime      = 150;
  RTFastTime        = 3000;
  RTMedTime         = 5000;
  RTSlowTime        = 30000;
  RTRefreshTime     = 500;
  DisconnectError   = ' Desconectado del servidor';

type
  EIncompatibleVersion =
    class( Exception )
    end;

  TShellClient = class(TForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Radar: TFrame_Radar;
    Splitter2: TSplitter;
    Antenna: TFrame_Antenna;
    Splitter3: TSplitter;
    Synchro: TFrame_Synchro;
    Splitter4: TSplitter;
    Panel3: TPanel;
    Splitter5: TSplitter;
    Splitter8: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Observations: TFrame_Observations;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TxsRxsSheet: TTabSheet;
    Splitter7: TSplitter;
    Splitter6: TSplitter;
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
    Splitter9: TSplitter;
    Panel4: TPanel;
    Splitter10: TSplitter;
    TabSheet6: TTabSheet;
    Observation: TFrame_Observation;
    Version1: TMenuItem;
    iempoReal1: TMenuItem;
    N2: TMenuItem;
    iempoRealCh21: TMenuItem;
    TxRx1: TFrame_TxRx_Calibration;
    TxRx2: TFrame_TxRx_Calibration;
    Control: TFrame_Control;
    RT_Timer: TTimer;
    ShotByShot1: TMenuItem;
    Actualizar1: TMenuItem;
    N3: TMenuItem;
    ChequearPuntosdeReferencia1: TMenuItem;
    Configuration: TFrame_Configuration;
    Frame_Logs: TFrame_Logs;
    MotorAz: TFrame_Motor;
    MotorEl: TFrame_Motor;
    TabSheet4: TTabSheet;
    StatisticsView: TFrame_Statistics;
    SunPosition: TFrame_SunPosition;
    Video: TFrame_Video;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RefreshRadar(Sender: TObject);
    procedure Terminar1Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure Refrescar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VideoButton1Click(Sender: TObject);
    procedure ObservationsButton1Click(Sender: TObject);
    procedure AdminEditar1Click(Sender: TObject);
    procedure ControlButton1Click(Sender: TObject);
    procedure SynchroButton3Click(Sender: TObject);
    procedure Version1Click(Sender: TObject);
    procedure ConectarseaRT1Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure RadarButton1Click(Sender: TObject);
    procedure AntennaButton1Click(Sender: TObject);
    procedure SynchroButton4Click(Sender: TObject);
    procedure Actualizar1Click(Sender: TObject);
    procedure ChequearPuntosdeReferencia1Click(Sender: TObject);
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

    Host : string;
    fLoginWS : ILoginWS;
    AuthHeader : TAuthHeader;

    fVestaWS : IVestaWS;

    fLoginURL,
    fAntennaURL,
    fAZMotorURL,
    fELMotorURL,
    fRadarURL,
    fTxRxCh1URL,
    fTxRxCh2URL,
    fTxsRxsURL,
    fVideoURL,
    fStatisticsURL,
    fLogURL,
    fConfigurationURL,
    fVestaURL,
    fCalibrationCH1URL,
    fCalibrationCH2URL,
    fObservationsURL : string;
    function GetVestaRDA: IVestaWS;
    function GetLoginWS: ILoginWS;
  private
    fRDAServer : string;
    fViewCh1, fViewCh2, fAcquiring : boolean;

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
    procedure SetViewCh1(const Value: boolean);
    procedure SetViewCh2(const Value: boolean);
  public
    function  Initialize : boolean;
    procedure AppException(Sender: TObject; E: Exception);
    procedure AppMinimize(Sender: TObject);
    procedure AppRestore(Sender: TObject);
    procedure ProcessAllMessages;

    procedure StartStopAcquire( CellCount : integer );
    procedure StopAcquire;
    procedure ConnectRT;
    procedure DisconnectRT;
    procedure ConnectDisconnectRT;

    property  VestaRDA : IVestaWS read GetVestaRDA;
    property  LoginWS : ILoginWS read GetLoginWS;

    property RDAServer : string read fRDAServer;

    property  GeneralConfiguration : TFrame_Configuration read Configuration;
    property  ViewCh1 : boolean read fViewCh1 write SetViewCh1;
    property  ViewCh2 : boolean read fViewCh2 write SetViewCh2;
    property  Acquiring : boolean read fAcquiring write fAcquiring;

    property LastFasterTime : cardinal read fLastFasterTime write fLastFasterTime;
    property LastFastTime : cardinal read fLastFastTime write fLastFastTime;
    property LastMedTime : cardinal  read fLastMedTime  write fLastMedTime;
    property LastSlowTime : cardinal read fLastSlowTime write fLastSlowTime;
    property LastSlowerTime : cardinal read fLastSlowerTime write fLastSlowerTime;
    property FasterTime : cardinal     read fFasterTime  write fFasterTime;
    property FastTime : cardinal     read fFastTime  write fFastTime;
    property MedTime : cardinal      read fMedTime      write fMedTime;
    property SlowTime : cardinal     read fSlowTime     write fSlowTime;
    property SlowerTime : cardinal     read fSlowerTime     write fSlowerTime;
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
  RTConfiguration, TxsRxsWS;

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
end;

procedure TShellClient.FormDestroy(Sender: TObject);
begin
  Logout;
end;

procedure TShellClient.ConnectRDA(Server: string);
begin
  fRDAServer := Server;
  Host := 'http://' + Server + ':9999/soap/';
  fVestaURL := Host + 'IVestaWS';
  try
    fVestaWS := GetIVestaWS(false, fVestaURL, nil);
    if IncompatibleVersion
      then raise EIncompatibleVersion.Create( 'Version del Cliente: [' + GetVersionString(vs_FileVersion) + ']' + #13#10 +
                                              'Version del Servidor: ' + VestaRDA.Version );
  except
    on E : Exception do
    begin
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
  Headers : ISOAPHeaders;
begin
  fLoginURL := Host + 'ILoginWS';
  fLoginWS := GetILoginWS(false, fLoginURL, nil);
  if(fLoginWS.Login(UserName, Password))
    then
      begin
        Headers := fLoginWS as ISOAPHeaders;
        Headers.Get(TAuthHeader, TSoapHeader(AuthHeader));

        LoginWS.TakeControl;
      end
    else
      AuthHeader := nil;

  Result := (AuthHeader <> nil);
end;

procedure TShellClient.Logout;
begin
  if assigned(fLoginWS)
    then LoginWS.Logout;
end;

function TShellClient.StopObs : boolean;
var
  Obs : IObservationsWS;
  I   : integer;
  Headers : ISOAPHeaders;
begin
  Result := true;
  if assigned(VestaRDA)
    then
      try
        Obs := GetIObservationsWS(false, fObservationsURL, nil);

        if assigned(Obs)
          then
            if (Obs.InProgress) and (Obs.Client = LoginWS.ControllerName)
              then
                begin
                  Headers := Obs as ISOAPHeaders;
                  Headers.Send(AuthHeader);
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
    fAntennaURL        := Host + 'IAntennaWS';
    fAZMotorURL        := Host + 'IAZMotorWS';
    fELMotorURL        := Host + 'IELMotorWS';
    fRadarURL          := Host + 'IRadarWS';
    fObservationsURL   := Host + 'IObservationsWS';
    fTxRxCh1URL        := Host + 'ITxRxCh1WS';
    fTxRxCh2URL        := Host + 'ITxRxCh2WS';
    fTxsRxsURL         := Host + 'ITxsRxsWS';
    fVideoURL          := Host + 'IVideoWS';
    fStatisticsURL     := Host + 'IStatisticsWS';
    fLogURL            := Host + 'ILogWS';
    fConfigurationURL  := Host + 'IConfigurationWS';
    fCalibrationCH1URL := Host + 'ICalibrationCH1WS';
    fCalibrationCH2URL := Host + 'ICalibrationCH2WS';

    try
      SunPosition.Init(GetIConfigurationWS(false, fConfigurationURL, nil), AuthHeader);
    except
    end;
    try
      Configuration.Init(GetIConfigurationWS(false, fConfigurationURL, nil), GetITxsRxsWS(false, fTxsRxsURL, nil), AuthHeader);
    except
    end;
    try
      StatisticsView.Init(GetIStatisticsWS(false, fStatisticsURL, nil), AuthHeader);
    except
    end;
    try
      Frame_Logs.Init(GetILogWS(false, fLogURL, nil), AuthHeader);
    except
    end;
    try
      Control.Init(GetILoginWS(false, fLoginURL, nil), AuthHeader);
    except
    end;
    try
      Antenna.Init(GetIAntennaWS(false, fAntennaURL, nil), AuthHeader);
    except
    end;
    try
      Radar.Init(GetIRadarWS(false, fRadarURL, nil), AuthHeader);
    except
    end;
    try
      Synchro.Init(GetITxsRxsWS(false, fTxsRxsURL, nil), AuthHeader);
    except
    end;
    try
      Observations.Init(GetIObservationsWS(false, fObservationsURL, nil), AuthHeader);
    except
    end;
    try
      Admin.Init(GetILoginWS(false, fLoginURL, nil), AuthHeader);
    except
    end;
    try
      Observation.Init(GetIObservationsWS(false, fObservationsURL, nil), AuthHeader);
    except
    end;
    try
      MotorAz.Init(GetIAZMotorWS(false, fAZMotorURL, nil), GetIObservationsWS(false, fObservationsURL, nil), AuthHeader);
    except
    end;
    try
      MotorEl.Init(GetIELMotorWS(false, fELMotorURL, nil), GetIObservationsWS(false, fObservationsURL, nil), AuthHeader);
    except
    end;
    try
      TxRx1.Init(GetITxRxCh1WS(false, fTxRxCh1URL, nil), GetICalibrationCH1WS(false, fCalibrationCH1URL, nil), AuthHeader);
      TxRx1.Visible := Assigned( TxRx1.Status.TxRx );
    except
    end;
    try
      TxRx2.Init(GetITxRxCh2WS(false, fTxRxCh2URL, nil), GetICalibrationCH2WS(False, fCalibrationCH2URL, nil), AuthHeader);
      TxRx2.Visible := Assigned( TxRx2.Status.TxRx );
    except
    end;
    try
      Video.Init(GetIVideoWS(false, fVideoURL, nil), GetITxsRxsWS(false, fTxsRxsURL, nil), AuthHeader);
    except
    end;
    Caption := Caption + ' - [' + AuthHeader.UserName + ']';
    Result := true;
  except
  end;
end;

function TShellClient.Initialize: boolean;
var
  AutoLog : boolean;
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
                                              'Fallo de verificacion', MB_ICONSTOP)
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
  case PageControl1.ActivePageIndex of
    0 : Observations.UpdateView;
    1 : Admin.UpdateView;
  end;
  case PageControl2.ActivePageIndex of
    4 : StatisticsView.UpdateView;
  end;
  if SunPosition.CheckBox1.Checked
    then SunPosition.UpdateView;
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
  fAcquiring := false;
  if StopObs
    then Action := caFree
    else Action := caNone;
end;

procedure TShellClient.VideoButton1Click(Sender: TObject);
begin
  Video.Button1Click(Sender);
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

procedure TShellClient.SynchroButton3Click(Sender: TObject);
begin
  Synchro.Button3Click(Sender);
  Synchro.UpdateView;
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

  result := (ClientVersion <> ServerVersion);// or (ClientRelease <> ServerRelease);
end;

procedure TShellClient.SetViewCh1(const Value: boolean);
begin
  fViewCh1 := Value;
end;

procedure TShellClient.SetViewCh2(const Value: boolean);
begin
  fViewCh2 := Value;
end;

procedure TShellClient.StartStopAcquire( CellCount : integer );
begin
end;

procedure TShellClient.ConnectRT;
begin
end;

procedure TShellClient.DisconnectRT;
begin
end;

procedure TShellClient.ConnectDisconnectRT;
begin
end;

procedure TShellClient.ConectarseaRT1Click(Sender: TObject);
begin
  ConnectDisconnectRT;
end;

procedure TShellClient.ProcessAllMessages;
begin
  Application.ProcessMessages;
end;

procedure TShellClient.UpdateRealTime;
begin
  Video.UpdateView;
end;

procedure TShellClient.PageControl2Change(Sender: TObject);
begin
  if Timer1.Enabled
    then
      case PageControl2.ActivePageIndex of
        0 : begin
              MotorEl.UpdateView;
              MotorAz.UpdateView;
            end;
        1 : begin
              TxRx1.Visible := Assigned( TxRx1.Status.TxRx );
              TxRx2.Visible := Assigned( TxRx2.Status.TxRx );
              TxRx1.UpdateView;
              TxRx2.UpdateView;
            end;
        2 : Configuration.UpdateView;
        3 : Frame_Logs.UpdateView;
        4 : StatisticsView.UpdateView;
      end;
end;

procedure TShellClient.StopAcquire;
begin
  fAcquiring := false;
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
  if not SunPosition.CheckBox1.Checked
    then SunPosition.UpdateView;
  if fAcquiring
    then
      begin
        TxRx1.UpdateView;
        TxRx2.UpdateView;
      end;
end;

procedure TShellClient.RadarButton1Click(Sender: TObject);
begin
  Radar.Button1Click(Sender);
  Radar.UpdateView;
end;

procedure TShellClient.AntennaButton1Click(Sender: TObject);
begin
  Antenna.Button1Click(Sender);
  Antenna.UpdateView;
end;

procedure TShellClient.SynchroButton4Click(Sender: TObject);
begin
  Synchro.Button4Click(Sender);
  Synchro.UpdateView;
end;

procedure TShellClient.UpdateFast;
begin
  if PageControl2.ActivePageIndex = 1
    then
      begin
        TxRx1.UpdateView;
        TxRx2.UpdateView;
      end;
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

function TShellClient.GetVestaRDA: IVestaWS;
var
  Headers : ISOAPHeaders;
begin
  //Headers := fVestaWS as ISOAPHeaders;
  //Headers.Send(AuthHeader);
  result := fVestaWS;
end;

function TShellClient.GetLoginWS: ILoginWS;
var
  Headers : ISOAPHeaders;
begin
  Headers := fLoginWS as ISOAPHeaders;
  Headers.Send(AuthHeader);
  result := fLoginWS;
end;

end.

