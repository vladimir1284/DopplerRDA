object ShellRTClient: TShellRTClient
  Left = 284
  Top = 186
  Width = 696
  Height = 480
  Caption = 'Cliente de Tiempo Real'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000FBFFFBFB0000000000000000
    00000BFB666F6666FBF00000000000000000F666666F6666666B000000000000
    00FB6666666F66666666FB00000000000B666666666F66666666669000000000
    F6666666666F66666666696B00000000B6666666666F66666666966F0000000F
    66666666666F666666696666B00000B666666666666F6666669666666F0000F6
    66666666666F6666696666666B0000B666666666666F6666966666666F000F66
    66666666666F66696666666666B00B6666666666666F66966666666666F00F66
    66666666666F69666666666666B00B6666666666666F96666666666666F00FFF
    FFFFFFFFFFFAFFFFFFFFFFFFFFF00B6666666666666FA6666666666666F00F66
    66666666666FA6666666666666B00B6666666666666F6A666666666666F000F6
    66666666666F6A66666666666B0000B666666666666F66A6666666666F0000F6
    66666666666F66A6666666666B00000B66666666666F666A66666666F0000000
    F6666666666F666A6666666B00000000B6666666666F6666A666666F00000000
    0F666666666F6666A66666B00000000000BF6666666F66666A66BF0000000000
    0000B666666F66666A6F00000000000000000FBF666F6660BFA0000000000000
    00000000BFBFBFBF00000000000000000000000000000000000000000000FFFF
    FFFFFFF00FFFFF8001FFFF0000FFFC00003FF800001FF000000FF000000FE000
    0007C0000003C0000003C0000003800000018000000180000001800000018000
    0001800000018000000180000001C0000003C0000003C0000003E0000007F000
    000FF000000FF800001FFC00003FFF0000FFFF8011FFFFF00FFFFFFFFFFF}
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  WindowMenu = Ventanas1
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 161
    Top = 0
    Height = 426
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 426
    Align = alLeft
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 1
      Top = 61
      Width = 159
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter3: TSplitter
      Left = 1
      Top = 121
      Width = 159
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    inline Admin: TFrame_Admin
      Left = 1
      Top = 124
      Width = 159
      Height = 301
      Align = alClient
      TabOrder = 0
      inherited ListView1: TListView
        Width = 159
        Height = 276
      end
      inherited Panel1: TPanel
        Top = 276
        Width = 159
        inherited Button1: TButton
          Width = 159
        end
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 64
      Width = 159
      Height = 57
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 115
        Height = 13
        Caption = 'Frecuencia de Muestreo'
      end
      object FreqAD: TComboBox
        Left = 9
        Top = 28
        Width = 112
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 5
        TabOrder = 0
        Text = '1,00   MHz'
        OnSelect = FreqADSelect
        Items.Strings = (
          '10,00 MHz'
          '5,00   MHz'
          '3,33   MHz'
          '2,00   MHz'
          '1,25   MHz'
          '1,00   MHz'
          '625    KHz'
          '500    KHz'
          '250    KHz')
      end
    end
    inline Control: TFrame_Control
      Left = 1
      Top = 1
      Width = 159
      Height = 60
      Align = alTop
      TabOrder = 2
      inherited Bulb1: TBulb
        Left = 139
      end
      inherited Button1: TButton
        Width = 129
        OnClick = ControlButton1Click
      end
      inherited Edit1: TEdit
        Width = 152
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 4
    Top = 8
    object Cliente1: TMenuItem
      Caption = '&Cliente'
      object Creditos1: TMenuItem
        Caption = '&Creditos...'
        ImageIndex = 13
        OnClick = Creditos1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Terminar1: TMenuItem
        Caption = '&Terminar'
        ShortCut = 32856
        OnClick = Terminar1Click
      end
    end
    object Ventanas1: TMenuItem
      Caption = 'Ventanas'
      object Refrescar: TMenuItem
        AutoCheck = True
        Caption = '&Refrescar'
        Checked = True
        ShortCut = 16466
        OnClick = RefrescarClick
      end
      object OcultarPaneldecontrol1: TMenuItem
        AutoCheck = True
        Caption = '&Ocultar Panel de control'
        ShortCut = 16463
        OnClick = OcultarPaneldecontrol1Click
      end
      object Antena: TMenuItem
        AutoCheck = True
        Caption = 'Mostrar &Antena'
        ShortCut = 16449
        OnClick = AntenaClick
      end
      object TxRx: TMenuItem
        AutoCheck = True
        Caption = 'Mostrar &TxRx'
        ShortCut = 16468
        OnClick = TxRxClick
      end
      object MostrarConfig: TMenuItem
        AutoCheck = True
        Caption = 'Mostrar Confi&guraci'#243'n'
        ShortCut = 16451
        OnClick = MostrarConfigClick
      end
      object InformacionGPS: TMenuItem
        Action = GPS
        AutoCheck = True
      end
      object RTDisplayVentanaPrincipal1: TMenuItem
        Action = DisplayControlSwitch
        Caption = 'RTDisplay/Ventana Principal'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ileVertically1: TMenuItem
        Action = WindowTileVertical1
        Caption = 'Mozaico &Vertically'
        ShortCut = 16470
      end
      object ileHorizontally1: TMenuItem
        Action = WindowTileHorizontal1
        Caption = 'Mozaico &Horizontal'
        ShortCut = 16456
      end
      object Cascada1: TMenuItem
        Action = WindowCascade1
        ShortCut = 16467
      end
      object Minimizar1: TMenuItem
        Action = WindowMinimizeAll1
        ShortCut = 16461
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Arrange1: TMenuItem
        Action = WindowArrange1
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer1Timer
    Left = 124
    Top = 383
  end
  object ActionList1: TActionList
    Left = 344
    Top = 40
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'C&lose'
      Enabled = False
      Hint = 'Close'
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = '&Cascade'
      Enabled = False
      Hint = 'Cascade'
      ImageIndex = 17
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile &Horizontally'
      Enabled = False
      Hint = 'Tile Horizontal'
      ImageIndex = 15
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = '&Tile Vertically'
      Enabled = False
      Hint = 'Tile Vertical'
      ImageIndex = 16
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = '&Minimize All'
      Enabled = False
      Hint = 'Minimize All'
    end
    object WindowArrange1: TWindowArrange
      Category = 'Window'
      Caption = '&Arrange'
      Enabled = False
    end
    object DisplayControlSwitch: TAction
      Caption = 'DisplayControlSwitch'
      ShortCut = 16507
      OnExecute = DisplayControlSwitchExecute
    end
    object GPS: TAction
      AutoCheck = True
      Caption = 'GPS'
      Checked = True
      ShortCut = 16455
      OnExecute = GPSExecute
    end
  end
  object RT_Timer: TTimer
    Enabled = False
    OnTimer = RT_TimerTimer
    Left = 88
    Top = 384
  end
end
