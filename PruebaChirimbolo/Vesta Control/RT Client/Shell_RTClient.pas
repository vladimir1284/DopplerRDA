unit Shell_RTClient;

interface

uses
  Windows, SysUtils, Forms,
  RTPaintBeams, Dialogs, Rda_TLB,
  RTForm, StdCtrls, StdActns, ActnList, ExtCtrls,
  FrameAdmin, Menus, Classes, Controls, FrameControl, OleServer, AppEvnts;

const
  DefaultFasterTime = 50;
  DefaultFastTime   = 500;
  DefaultMedTime    = 5000;
  DefaultSlowTime   = 10000;
  DefaultSlowerTime = 120000;
  RTFasterTime      = 150;
  RTFastTime        = 5000;
  RTMedTime         = 10000;
  RTSlowTime        = 30000;
  RTRefreshTime     = 500;
  DisconnectError   = ' Desconectado del servidor';

  ClientRootKey = {HKEY_CURRENT_USER} '\SOFTWARE\LDT\Vesta\RTClient';
  LoginKey = ClientRootKey + '\Login';

  HostNameValue = 'HostName';
  UserNameValue = 'UserName';
  PasswordValue = 'Password';
  AutoLogValue  = 'AutoLog';

  RTConfigKey       = ClientRootKey + '\RTConfig';
  RTChannel_3cmKey  = RTConfigKey + '\RTChannel_3cm';
  RTChannel_10cmKey = RTConfigKey + '\RTChannel_10cm';

type
  TShellRTClient = class(TForm)
    MainMenu1: TMainMenu;
    Cliente1: TMenuItem;
    Creditos1: TMenuItem;
    N1: TMenuItem;
    Terminar1: TMenuItem;
    Refrescar: TMenuItem;
    Ventanas1: TMenuItem;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Admin: TFrame_Admin;
    Splitter2: TSplitter;
    N2: TMenuItem;
    Timer1: TTimer;
    OcultarPaneldecontrol1: TMenuItem;
    Antena: TMenuItem;
    ActionList1: TActionList;
    WindowClose1: TWindowClose;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowArrange1: TWindowArrange;
    N3: TMenuItem;
    Minimizar1: TMenuItem;
    Cascada1: TMenuItem;
    ileVertically1: TMenuItem;
    ileHorizontally1: TMenuItem;
    TxRx: TMenuItem;
    Panel2: TPanel;
    Splitter3: TSplitter;
    Label1: TLabel;
    FreqAD: TComboBox;
    Arrange1: TMenuItem;
    MostrarConfig: TMenuItem;
    Control: TFrame_Control;
    RT_Timer: TTimer;
    InformacionGPS: TMenuItem;
    DisplayControlSwitch: TAction;
    RTDisplayVentanaPrincipal1: TMenuItem;
    GPS: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure OcultarPaneldecontrol1Click(Sender: TObject);
    procedure RefrescarClick(Sender: TObject);
    procedure Terminar1Click(Sender: TObject);
    procedure Creditos1Click(Sender: TObject);
    procedure AntenaClick(Sender: TObject);
    procedure TxRxClick(Sender: TObject);
    procedure FreqADSelect(Sender: TObject);
    procedure MostrarConfigClick(Sender: TObject);
    procedure RT_TimerTimer(Sender: TObject);
    procedure ControlButton1Click(Sender: TObject);
    procedure DisplayControlSwitchExecute(Sender: TObject);
    procedure GPSExecute(Sender: TObject);
  private
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
    fSaveRefresh : boolean;
    fVestaRDA : IVestaRDA;
    fViewCh1, fViewCh2, fAcquiring : boolean;
    fPaintBeamsThread : TRTPaintBeams;
    fVideo   : IVideo;
    fVideoControl : IVideoControl;
    TxRxCalibration1,
    TxRxCalibration2  : ICalibration;
    TxRxStatus1,
    TxRxStatus2  : ITxRxStatus;
    fGeneralConfiguration : IConfiguration;
  private
    procedure SetViewCh1(const Value: boolean);
    procedure SetViewCh2(const Value: boolean);
    procedure SetConfiguration(const Value: IConfiguration);
    procedure SetVideo(const Value: IVideo);
    function  RateIndex( Rate : cardinal ) : integer;
  private
    procedure AppException(Sender: TObject; E: Exception);
    procedure AppMinimize(Sender: TObject);
    procedure AppRestore(Sender: TObject);
    procedure ConnectRDA( Server : string );
    function  Login     ( UserName, Password : string ) : boolean;
    procedure Logout;
    function  ConnectInterfaces : boolean;
    procedure ConnectMotors;
    procedure ConnectConfiguration;
    procedure UpdateFast;
    procedure UpdateMed;
    procedure UpdateSlow;
  public
    RT_Ch1,
    RT_Ch2 :  TRealTimeForm;

    procedure ConnectTxRx;
    procedure InitRT;
    function  Initialize : boolean;
    procedure ProcessAllMessages;

    procedure StartStopAcquire( CellCount : integer );
    procedure StopAcquire;
    procedure ConnectRT;
    procedure DisconnectRT;
    procedure ConnectDisconnectRT;

    property  VestaRDA : IVestaRDA read fVestaRDA;
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
    property GeneralConfiguration : IConfiguration read fGeneralConfiguration write SetConfiguration;

    property Video        : IVideo        read fVideo write SetVideo;
    property VideoControl : IVideoControl read fVideoControl;
  end;

var
  ShellRTClient : TShellRTClient;

implementation

{$R *.dfm}

uses
  Registry, FormConfiguration, ComObj, RdaMessages,
  LoginRTDialog, WaitDialog, Constants, AboutDialog,
  RTConfiguration, TxRxForm, FormMotor, GPSLocation;

const  
  Combo_Freqs : array[0..8] of cardinal = (10000000, 5000000, 3333333, 2000000, 1250000, 1000000, 625000, 500000, 250000);

{ TShellRTClient }

function TShellRTClient.ConnectInterfaces: boolean;
begin
  Result := false;
  try
    try
      GeneralConfiguration := fVestaRDA.Configuration;
    except
    end;
    try
      Control.Login := fVestaRDA as ILogin;
    except
    end;
    try
      TxRxStatus1      := fVestaRDA.TxsRxs.GetTxRx(0);
      TxRxStatus2      := fVestaRDA.TxsRxs.GetTxRx(1);
      TxRxCalibration1 := TxRxStatus1 as ICalibration;
      TxRxCalibration2 := TxRxStatus2 as ICalibration;
    except
    end;
    try
      Video := fVestaRDA.TxsRxs as IVideo;
    except
    end;
    try
      Admin.Admin := Control.Login;
    except
    end;
    Caption := Caption + ' - [' + Control.Login.Name + ']';
    Result := true;
  except
    Result := false;
  end;
end;

procedure TShellRTClient.ConnectRDA(Server: string);
begin
  try
    fVestaRDA := CoVestaRDA.CreateRemote( Server );
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

function TShellRTClient.Login(UserName, Password: string): boolean;
var
  Log : ILogin;
begin
  fVestaRDA.QueryInterface(ILogin, Log);
  Result := assigned(Log) and (Log.Login(UserName, Password) = S_OK);
end;

procedure TShellRTClient.Logout;
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

procedure TShellRTClient.UpdateFast;
begin
  if Assigned( Motors )
    then
      begin
        Motors.AzMotor.UpdateView;
        Motors.ElMotor.UpdateView;
      end;
end;

procedure TShellRTClient.UpdateMed;
begin
  if Assigned( RT_Ch1 )
    then RT_Ch1.UpdateView;
  if Assigned( RT_Ch2 )
    then RT_Ch2.UpdateView;
  Control.UpdateView;
  if not FreqAD.DroppedDown
    then FreqAD.ItemIndex := RateIndex( Video.Frecuencia_AD );
end;

procedure TShellRTClient.UpdateSlow;
begin
  if Assigned( RT_Ch1 )
    then
      try
        if (TxRxStatus1.Tx_Pulso = tx_Pulse_Short)
          then RT_Ch1.RTDisplay.PotMet := TxRxCalibration1.PotMetPC
          else RT_Ch1.RTDisplay.PotMet := TxRxCalibration1.PotMetPL;
      except
        RT_Ch1.RTDisplay.DB_DBZ := true;
        RT_Ch1.ColorBox1.ItemIndex := 1;
      end;
  if Assigned( RT_Ch2 )
    then
      try
        if TxRxStatus2.Tx_Pulso = tx_Pulse_Short
          then RT_Ch2.RTDisplay.PotMet := TxRxCalibration2.PotMetPC
          else RT_Ch2.RTDisplay.PotMet := TxRxCalibration2.PotMetPL;
      except
        RT_Ch2.RTDisplay.DB_DBZ := true;
        RT_Ch2.ColorBox1.ItemIndex := 1;
      end;
end;

procedure TShellRTClient.FormCreate(Sender: TObject);
begin
  Application.OnException := AppException;
  Application.OnMinimize  := AppMinimize;
  Application.OnRestore   := AppRestore;

  //Data Refresh Times
  LastFastTime := GetTickCount;
  LastMedTime  := GetTickCount;
  LastSlowTime := GetTickCount;
  FastTime     := DefaultFastTime;
  MedTime      := DefaultMedTime;
  SlowTime     := DefaultSlowTime;

  RT_Timer.Interval := RTRefreshTime;
end;

procedure TShellRTClient.AppException(Sender: TObject; E: Exception);
begin
  if e is EOleSysError
    then
      begin
{
        ShowMessage( EOLEMessage );
        Refrescar.Checked := false;
        Timer1.Enabled := false;
}        
      end;
end;

procedure TShellRTClient.ConnectDisconnectRT;
begin
  if fAcquiring
    then DisconnectRT
    else ConnectRT;
end;

procedure TShellRTClient.ConnectRT;
begin
  if Video.RTEnabled
    then fPaintBeamsThread := TRTPaintBeams.Create( false );
end;

procedure TShellRTClient.DisconnectRT;
begin
  if Acquiring
    then fPaintBeamsThread.Terminate;
end;

function TShellRTClient.Initialize: boolean;
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
                on Exception do
                  Application.MessageBox('No se pudo conectar con el servidor RDA.'#13#10#13#10 +
                                         'Por favor, verifique la direccion del servidor y'#13#10 +
                                         'compruebe que no haya otro cliente conectado.',
                                         'Fallo de conexion', MB_ICONSTOP);
              end;
            finally
              Close;
            end;
    finally
      Close;
    end;
end;

procedure TShellRTClient.ProcessAllMessages;
begin
  Application.ProcessMessages;
end;

procedure TShellRTClient.SetViewCh1(const Value: boolean);
begin
  fViewCh1 := Value;
  if Assigned( RT_Ch1 )
    then RT_Ch1.RTCh1.Checked := Value;
  if Assigned( RT_Ch2 )
    then RT_Ch2.RTCh1.Checked := Value;
end;

procedure TShellRTClient.SetViewCh2(const Value: boolean);
begin
  fViewCh2 := Value;
  if Assigned( RT_Ch1 )
    then RT_Ch1.RTCh2.Checked := Value;
  if Assigned( RT_Ch2 )
    then RT_Ch2.RTCh2.Checked := Value;
end;

procedure TShellRTClient.StartStopAcquire(CellCount: integer);
var
  StartTime : cardinal;
begin
  if not Control.Login.InControl
    then exit;
  if Video.RTEnabled
    then StopAcquire
    else if (ViewCh1 or ViewCh2)
           then
             begin
               VideoControl.StartRT( ViewCh1, ViewCh2, CellCount );
               StartTime := GetTickCount;
               while (not Video.RTEnabled) and (GetTickCount - StartTime < MaxTimeToConnect) do Sleep( 100 );
               ConnectRT;
             end;
end;

procedure TShellRTClient.StopAcquire;
begin
  fAcquiring := false;
  if Control.Login.InControl
    then VideoControl.StopRT;
end;

procedure TShellRTClient.SetConfiguration(const Value: IConfiguration);
begin
  fGeneralConfiguration := Value;
  if Assigned( Configuration )
    then Configuration.FConfiguration.Configuration := Value;
end;

procedure TShellRTClient.SetVideo(const Value: IVideo);
begin
  fVideo := Value;
  if assigned(fVideo)
    then fVideo.QueryInterface(IVideoControl, fVideoControl)
    else fVideoControl := nil;
end;

procedure TShellRTClient.FormDestroy(Sender: TObject);
begin
  Logout;
end;

procedure TShellRTClient.Timer1Timer(Sender: TObject);
var
  TimerEnabled : boolean;
begin
  TimerEnabled := Timer1.Enabled;
  Timer1.Enabled := false;
  try
    if GetTickCount - LastFastTime > FastTime
      then
        begin
          UpdateFast;
          LastFastTime := GetTickCount;
        end;
    if GetTickCount - LastMedTime > MedTime
      then
        begin
          UpdateMed;
          LastMedTime := GetTickCount;
        end;
    if GetTickCount - LastSlowTime > SlowTime
      then
        begin
          UpdateSlow;
          LastSlowTime := GetTickCount;
        end;
    Timer1.Enabled := TimerEnabled;
  except
    Refrescar.Checked := false;
    Timer1.Enabled := false;
    raise;
  end;
end;

procedure TShellRTClient.InitRT;
begin
  //Real Time
  RT_Ch1 := nil;
{
  RT_Ch1 := TRealTimeForm.Create( Application );
  RT_Ch1.Caption := 'Display de Tiempo Real Canal #1';
  RT_Ch1.RTConfig := TConfig.Create( RTChannel_3cmKey );
  RT_Ch1.RTDisplay.BeamWidth := GeneralConfiguration.Beam_Ch1;
}
  RT_Ch2 := TRealTimeForm.Create( self );
  RT_Ch2.Caption := 'Display de Tiempo Real Canal #2';
  RT_Ch2.RTConfig := TConfig.Create( RTChannel_10cmKey );
  RT_Ch2.RTDisplay.BeamWidth := GeneralConfiguration.Beam_Ch2;
  //Initialize Realtime Forms
  if Assigned( RT_Ch1 )
    then RT_Ch1.LoadData;
  if Assigned( RT_Ch2 )
    then RT_Ch2.LoadData;
  UpdateSlow;
{
  if Assigned( RT_Ch1 )
    then RT_Ch1.Show;
  if Assigned( RT_Ch2 )
    then RT_Ch2.Show;
}    
end;

procedure TShellRTClient.OcultarPaneldecontrol1Click(Sender: TObject);
begin
  Panel1.Visible := not OcultarPaneldecontrol1.Checked; 
end;

procedure TShellRTClient.RefrescarClick(Sender: TObject);
begin
  Timer1.Enabled := Refrescar.Checked;
end;

procedure TShellRTClient.Terminar1Click(Sender: TObject);
begin
  Close;
end;

procedure TShellRTClient.Creditos1Click(Sender: TObject);
begin
  with TFAboutDialog.Create(Self) do
    try
      ShowModal;
    finally          
      Release;
    end;
end;

procedure TShellRTClient.AntenaClick(Sender: TObject);
begin
  if Antena.Checked
    then
      begin
        Application.CreateForm( TMotors, Motors );
        ConnectMotors;
      end
    else
      begin
        Motors.Close;
        Motors := nil;
      end;
end;

procedure TShellRTClient.ConnectMotors;
begin
  try
    Motors.AZMotor.Motor := fVestaRDA.Antenna.Motor_Az;
    Motors.ElMotor.Motor := fVestaRDA.Antenna.Motor_El;
  except
  end;
end;

procedure TShellRTClient.TxRxClick(Sender: TObject);
begin
  if TxRx.Checked
    then
      begin
        Application.CreateForm( TTxRxs_Form, TxRxs_Form );
        ConnectTxRx;
      end
    else
      begin
        TxRxs_Form.Close;
        TxRxs_Form := nil;
      end;
end;

procedure TShellRTClient.ConnectTxRx;
begin
  try
    TxRxs_Form.TxRx1.Calibration := TxRxCalibration1;
    TxRxs_Form.TxRx2.Calibration := TxRxCalibration2;
  except
  end;
end;

procedure TShellRTClient.FreqADSelect(Sender: TObject);
var
  Freq_AD : cardinal;
begin
  Freq_AD := Combo_Freqs[ (Sender as TComboBox).ItemIndex ];
  VideoControl.Frecuencia_AD := Freq_AD;
end;

function TShellRTClient.RateIndex(Rate: cardinal): integer;
var
  I, B : integer;
  D : single;
begin
  B := Low(Combo_Freqs);
  D := abs(Combo_Freqs[B] - Rate);
  for I := Low(Combo_Freqs) + 1 to High(Combo_Freqs) do
    if abs(Combo_Freqs[I] - Rate) < D
      then
        begin
          B := I;
          D := abs(Combo_Freqs[B] - Rate)
        end;
  Result := B;
end;

procedure TShellRTClient.MostrarConfigClick(Sender: TObject);
begin
  if MostrarConfig.Checked
    then
      begin
        Application.CreateForm( TConfiguration, Configuration );
        ConnectConfiguration;
      end
    else
      begin
        Configuration.Close;
        Configuration := nil;
      end;
end;

procedure TShellRTClient.ConnectConfiguration;
begin
  Configuration.FConfiguration.Configuration := GeneralConfiguration;
end;

procedure TShellRTClient.RT_TimerTimer(Sender: TObject);
begin
  if Assigned(RT_Ch1) and Acquiring and fViewCh1
    then RT_Ch1.RepaintData;
  if Assigned(RT_Ch2) and Acquiring and fViewCh2
    then RT_Ch2.RepaintData;
end;

procedure TShellRTClient.ControlButton1Click(Sender: TObject);
begin
  Control.Button1Click(Sender);
  Control.UpdateView;
end;

procedure TShellRTClient.AppMinimize(Sender: TObject);
begin
  fSaveRefresh := Timer1.Enabled;
  Refrescar.Checked := false;
  Timer1.Enabled := false;
end;

procedure TShellRTClient.AppRestore(Sender: TObject);
begin
  Timer1.Enabled := fSaveRefresh;
  Refrescar.Checked := fSaveRefresh;
end;

procedure TShellRTClient.DisplayControlSwitchExecute(Sender: TObject);
begin
  if RT_Ch2.Active
    then Show
    else RT_Ch2.Show;
end;

procedure TShellRTClient.GPSExecute(Sender: TObject);
begin
  if GPS.Checked
    then
      begin
        Application.CreateForm( TGPS_Form, GPS_Form );
        Show;
      end
    else
      begin
        GPS_Form.Close;
        GPS_Form := nil;
      end;
end;

end.
