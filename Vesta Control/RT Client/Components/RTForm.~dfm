object RealTimeForm: TRealTimeForm
  Left = 138
  Top = 10
  Width = 886
  Height = 655
  AlphaBlend = True
  Caption = 'Display de Tiempo Real'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 748
    Top = 0
    Width = 2
    Height = 609
    Align = alRight
    Beveled = True
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 609
    Width = 878
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 120
      end
      item
        Alignment = taCenter
        Width = 110
      end
      item
        Width = 100
      end
      item
        Alignment = taCenter
        Width = 110
      end
      item
        Alignment = taCenter
        Width = 70
      end
      item
        Width = 100
      end
      item
        Width = 60
      end
      item
        Width = 60
      end
      item
        Width = 50
      end>
    PopupMenu = PopupMenu2
    OnDrawPanel = StatusBar1DrawPanel
  end
  object RTDisplay: TRTDisplay
    Left = 0
    Top = 0
    Width = 748
    Height = 609
    CellSize = 150
    CellCount = 3000
    ShowMap = True
    ShowOutline = False
    ShowRadar = True
    BackgroundColor = clBtnFace
    MapColor = clBlack
    BeamWidth = 1.500000000000000000
    PPI_RHI = True
    DB_DBZ = False
    Zoom = 100
    MapScale = 1000
    BoardRange = 500
    ShowRings = False
    RingsColor = clWhite
    RingDistance = 1000
    Align = alClient
    PopupMenu = PopupMenu1
    OnMouseMove = RTDisplayMouseMove
    OnDblClick = RTDisplayDblClick
  end
  object ScrollBox1: TScrollBox
    Left = 750
    Top = 0
    Width = 128
    Height = 609
    Align = alRight
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      124
      605)
    object Servidor: TGroupBox
      Left = 2
      Top = 0
      Width = 123
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Servidor'
      TabOrder = 0
      DesignSize = (
        123
        97)
      object RTCh1: TCheckBox
        Left = 26
        Top = 56
        Width = 65
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Canal 1'
        TabOrder = 0
        OnClick = RTCh1Click
      end
      object RTCh2: TCheckBox
        Left = 26
        Top = 72
        Width = 65
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Canal 2'
        TabOrder = 1
        OnClick = RTCh2Click
      end
      object RTCellCount: TLabeledEdit
        Left = 26
        Top = 32
        Width = 52
        Height = 21
        Anchors = [akTop, akRight]
        EditLabel.Width = 91
        EditLabel.Height = 13
        EditLabel.Caption = 'Cantidad de celdas'
        TabOrder = 2
      end
    end
    object Cliente: TGroupBox
      Left = 2
      Top = 100
      Width = 123
      Height = 373
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Cliente'
      TabOrder = 1
      DesignSize = (
        123
        373)
      object Label3: TLabel
        Left = 39
        Top = 10
        Width = 32
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Celdas'
      end
      object Label4: TLabel
        Left = 9
        Top = 30
        Width = 56
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Tama'#241'o (m)'
      end
      object Label5: TLabel
        Left = 18
        Top = 54
        Width = 42
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Cantidad'
      end
      object Label6: TLabel
        Left = 9
        Top = 79
        Width = 56
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Alcance (m)'
      end
      object Label8: TLabel
        Left = 16
        Top = 103
        Width = 47
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Anillas (m)'
      end
      object Label7: TLabel
        Left = 35
        Top = 121
        Width = 61
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Visualizaci'#243'n'
      end
      object Label1: TLabel
        Left = 47
        Top = 138
        Width = 27
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Zoom'
      end
      object Label2: TLabel
        Left = 28
        Top = 179
        Width = 72
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Color de Fondo'
      end
      object Label9: TLabel
        Left = 23
        Top = 216
        Width = 88
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Color de las Anillas'
      end
      object Edit2: TEdit
        Left = 67
        Top = 27
        Width = 48
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 0
        OnExit = Edit2Exit
        OnKeyPress = Edit2KeyPress
      end
      object Edit3: TEdit
        Left = 67
        Top = 50
        Width = 48
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 1
        OnExit = Edit3Exit
        OnKeyPress = Edit3KeyPress
      end
      object Edit4: TEdit
        Left = 67
        Top = 73
        Width = 48
        Height = 21
        Anchors = [akTop, akRight]
        ReadOnly = True
        TabOrder = 2
      end
      object Edit5: TEdit
        Left = 67
        Top = 97
        Width = 48
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnExit = Edit5Exit
        OnKeyPress = Edit5KeyPress
      end
      object ColorBox1: TColorBox
        Left = 16
        Top = 192
        Width = 100
        Height = 22
        Anchors = [akTop, akRight]
        ItemHeight = 16
        TabOrder = 4
        OnSelect = ColorBox1Select
      end
      object Edit1: TEdit
        Left = 35
        Top = 153
        Width = 37
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 5
        Text = '100'
        OnExit = Edit1Exit
        OnKeyPress = Edit1KeyPress
      end
      object RingColor: TColorBox
        Left = 16
        Top = 230
        Width = 100
        Height = 22
        Anchors = [akTop, akRight]
        ItemHeight = 16
        TabOrder = 6
        OnSelect = RingColorSelect
      end
      object CheckBox7: TCheckBox
        Left = 20
        Top = 324
        Width = 88
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Mostrar Anillas'
        TabOrder = 7
        OnClick = CheckBox7Click
      end
      object CheckBox3: TCheckBox
        Left = 19
        Top = 256
        Width = 89
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Mostrar Mapa'
        TabOrder = 8
        OnClick = CheckBox3Click
      end
      object CheckBox6: TCheckBox
        Left = 19
        Top = 273
        Width = 89
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Mostrar Costas'
        TabOrder = 9
        OnClick = CheckBox6Click
      end
      object CheckBox4: TCheckBox
        Left = 19
        Top = 290
        Width = 89
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Mostrar Radar'
        TabOrder = 10
        OnClick = CheckBox4Click
      end
      object CheckBox5: TCheckBox
        Left = 20
        Top = 307
        Width = 56
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'PPI'
        TabOrder = 11
        OnClick = CheckBox5Click
      end
      object UpDown1: TUpDown
        Left = 72
        Top = 153
        Width = 17
        Height = 21
        Anchors = [akTop, akRight]
        Associate = Edit1
        Max = 10000
        Increment = 5
        Position = 100
        TabOrder = 12
        Thousands = False
        OnClick = UpDown1Click
      end
      object ComboBox1: TComboBox
        Left = 18
        Top = 344
        Width = 94
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 13
        Text = 'DB'
        OnSelect = ComboBox1Select
        Items.Strings = (
          'DBZ'
          'DB')
      end
    end
    object Acions: TGroupBox
      Left = 2
      Top = 476
      Width = 123
      Height = 117
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Acciones'
      TabOrder = 2
      DesignSize = (
        123
        117)
      object Label10: TLabel
        Left = 34
        Top = 100
        Width = 46
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Opacidad'
      end
      object Button3: TButton
        Left = 5
        Top = 16
        Width = 113
        Height = 22
        Anchors = [akRight, akBottom]
        Caption = 'Iniciar RT'
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button1: TButton
        Left = 6
        Top = 41
        Width = 113
        Height = 22
        Anchors = [akRight, akBottom]
        Caption = 'Conectarse a RT'
        TabOrder = 1
        OnClick = Button1Click
      end
      object TrackBar1: TTrackBar
        Left = 3
        Top = 83
        Width = 120
        Height = 17
        Anchors = [akLeft, akRight, akBottom]
        Max = 255
        Min = 150
        PageSize = 1
        Frequency = 10
        Position = 255
        TabOrder = 2
        ThumbLength = 10
        OnChange = TrackBar1Change
      end
      object CheckBox1: TCheckBox
        Left = 10
        Top = 65
        Width = 95
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Transparente'
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 560
    Top = 456
  end
  object PopupMenu1: TPopupMenu
    Left = 528
    Top = 456
    object Centrar1: TMenuItem
      Caption = 'Centrar Imagen'
      OnClick = Centrar1Click
    end
    object CambiarEscala1: TMenuItem
      Caption = 'Cambiar Escala'
      OnClick = CambiarEscala1Click
    end
    object BorrarDatos1: TMenuItem
      Caption = 'Borrar Datos'
      OnClick = BorrarDatos1Click
    end
    object PantallaCompleta1: TMenuItem
      AutoCheck = True
      Caption = 'Pantalla Completa'
      OnClick = PantallaCompleta1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.pal'
    Filter = 'Escalas de colores|*.pal'
    Left = 497
    Top = 456
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 832
    Top = 40
  end
  object PopupMenu2: TPopupMenu
    Left = 464
    Top = 456
    object Radar1: TMenuItem
      AutoCheck = True
      Caption = 'Radar'
      Checked = True
      RadioItem = True
    end
    object Vor: TMenuItem
      AutoCheck = True
      Caption = 'Vor'
      RadioItem = True
    end
  end
end
