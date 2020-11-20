object Frame_Video: TFrame_Video
  Left = 0
  Top = 0
  Width = 484
  Height = 248
  TabOrder = 0
  object Panel4: TPanel
    Left = 92
    Top = 0
    Width = 392
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Video1: TVideo
      Left = 0
      Top = 0
      Width = 380
      Height = 233
      SampleTime = 100
      Position = 0
      OtherPos = 0
      Color_Back = clTeal
      Color_Ch1 = clYellow
      Color_Ch2 = clRed
      Color_Grid = clSilver
      Color_Mark = clBlack
      Color_Other = clMaroon
      SamplePoints = 1
      SamplePixels = 1
      ValuePoints = 20
      ValuePixels = 1
      GridPixels = 25
      Mask1 = False
      Mask2 = False
      MaskPosition = False
      MaskOtherPos = False
      Level1 = 10
      Level2 = 20
      StartCell = 0
      ScrollBar = ScrollBar1
      DataSize = 4000
      Align = alClient
      OnChange = Video1Change
      OnNewData = Video1NewData
      OnNewPos = Video1NewData
    end
    object Panel1: TPanel
      Left = 0
      Top = 233
      Width = 392
      Height = 15
      Align = alBottom
      BevelOuter = bvNone
      PopupMenu = Popup1
      TabOrder = 0
      DesignSize = (
        392
        15)
      object Bulb1: TBulb
        Left = 379
        Top = -2
        Width = 16
        Height = 16
        Hint = 'Encender/Apagar'
        Anchors = [akTop, akRight]
        OnClick = Bulb1Click
      end
      object Button15: TButton
        Left = 0
        Top = 0
        Width = 15
        Height = 15
        Hint = 'Aumentar muestras por celda'
        Caption = #172
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Symbol'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = False
        OnClick = Button15Click
      end
      object Button14: TButton
        Left = 15
        Top = 0
        Width = 15
        Height = 15
        Hint = 'disminuir muestras por celda'
        Caption = #174
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Symbol'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = False
        OnClick = Button14Click
      end
      object Button12: TButton
        Left = 30
        Top = 0
        Width = 15
        Height = 15
        Hint = 'Disminuir codigos por celda'
        Caption = #173
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Symbol'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TabStop = False
        OnClick = Button12Click
      end
      object Button13: TButton
        Left = 45
        Top = 0
        Width = 15
        Height = 15
        Hint = 'Aumentar codigos por celda'
        Caption = #175
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Symbol'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        TabStop = False
        OnClick = Button13Click
      end
      object ScrollBar1: TScrollBar
        Left = 60
        Top = 0
        Width = 321
        Height = 15
        Anchors = [akLeft, akTop, akRight]
        LargeChange = 25
        Max = 4000
        PageSize = 0
        TabOrder = 4
      end
    end
    object Panel2: TPanel
      Left = 380
      Top = 0
      Width = 12
      Height = 233
      Align = alRight
      BevelOuter = bvNone
      PopupMenu = Popup1
      TabOrder = 1
      DesignSize = (
        12
        233)
      object Label1: TLabel
        Tag = -1
        Left = 0
        Top = 223
        Width = 12
        Height = 13
        Hint = 'Nivel 1'
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = ' 1'
        Color = clYellow
        ParentColor = False
        OnMouseDown = Label13MouseDown
        OnMouseMove = Label13MouseMove
        OnMouseUp = Label13MouseUp
      end
      object Label2: TLabel
        Tag = -1
        Left = 0
        Top = 213
        Width = 12
        Height = 13
        Hint = 'Nivel 2'
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = ' 2'
        Color = clRed
        ParentColor = False
        OnMouseDown = Label13MouseDown
        OnMouseMove = Label13MouseMove
        OnMouseUp = Label13MouseUp
      end
    end
  end
  object PageScroller1: TPageScroller
    Left = 0
    Top = 0
    Width = 92
    Height = 248
    Align = alLeft
    Control = Panel5
    Orientation = soVertical
    TabOrder = 1
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 92
      Height = 248
      Align = alLeft
      BevelOuter = bvNone
      PopupMenu = Popup1
      TabOrder = 0
      DesignSize = (
        92
        248)
      object Label7: TLabel
        Left = 2
        Top = 83
        Width = 15
        Height = 13
        Caption = 'S1 :'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Symbol'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 2
        Top = 99
        Width = 15
        Height = 13
        Caption = 'S2 :'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Symbol'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 2
        Top = 120
        Width = 10
        Height = 13
        Hint = 'Numero de rayos a promediar'
        Caption = '# :'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Symbol'
        Font.Style = []
        ParentFont = False
      end
      object CheckBox1: TCheckBox
        Left = 2
        Top = 4
        Width = 15
        Height = 20
        Hint = 'Activar/Desactivar Canal 1'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 1
        Top = 21
        Width = 15
        Height = 20
        Hint = 'Activar/Desactivar Canal 2'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox2Click
      end
      object Edit1: TEdit
        Left = 20
        Top = 5
        Width = 47
        Height = 16
        Hint = 'Valor 1'
        AutoSize = False
        ReadOnly = True
        TabOrder = 1
      end
      object Edit2: TEdit
        Left = 20
        Top = 22
        Width = 47
        Height = 16
        Hint = 'Valor 2'
        AutoSize = False
        ReadOnly = True
        TabOrder = 3
      end
      object Edit3: TEdit
        Left = 20
        Top = 79
        Width = 47
        Height = 16
        Hint = 'Promedio 1'
        AutoSize = False
        ReadOnly = True
        TabOrder = 8
      end
      object Edit4: TEdit
        Left = 20
        Top = 95
        Width = 47
        Height = 16
        Hint = 'Promedio 2'
        AutoSize = False
        ReadOnly = True
        TabOrder = 9
      end
      object Edit5: TEdit
        Left = 20
        Top = 40
        Width = 47
        Height = 16
        Hint = 'Posicion 1'
        AutoSize = False
        ReadOnly = True
        TabOrder = 6
      end
      object UpDown1: TUpDown
        Left = 4
        Top = 40
        Width = 15
        Height = 16
        Hint = 'Posicion 1'
        PopupMenu = Popup1
        TabOrder = 4
        OnClick = UpDown1Click
      end
      object Edit6: TEdit
        Left = 20
        Top = 56
        Width = 47
        Height = 16
        Hint = 'Posicion 2'
        AutoSize = False
        ReadOnly = True
        TabOrder = 7
      end
      object UpDown2: TUpDown
        Left = 4
        Top = 56
        Width = 15
        Height = 16
        Hint = 'Posicion 2'
        PopupMenu = Popup1
        TabOrder = 5
        OnClick = UpDown2Click
      end
      object Edit7: TEdit
        Left = 20
        Top = 116
        Width = 30
        Height = 16
        Hint = 'Numero de rayos a promediar'
        AutoSize = False
        TabOrder = 10
        Text = '1'
      end
      object UpDown3: TUpDown
        Left = 50
        Top = 116
        Width = 15
        Height = 16
        Hint = 'Numero de rayos a promediar'
        Anchors = [akTop]
        Associate = Edit7
        Min = 1
        Max = 256
        Position = 1
        TabOrder = 11
        OnClick = UpDown3Click
      end
      object Button1: TButton
        Left = 4
        Top = 137
        Width = 65
        Height = 16
        Hint = 'Salvar cuadros'
        Caption = '&Salvar...'
        TabOrder = 12
        OnClick = Button1Click
      end
      object Edit8: TEdit
        Left = 5
        Top = 156
        Width = 45
        Height = 16
        Hint = 'Numero de rayos a salvar'
        AutoSize = False
        TabOrder = 13
        Text = '1'
      end
      object UpDown4: TUpDown
        Left = 50
        Top = 156
        Width = 16
        Height = 16
        Hint = 'Numero de rayos a salvar'
        Associate = Edit8
        Min = 1
        Max = 10000
        Increment = 100
        Position = 1
        TabOrder = 14
        Thousands = False
      end
      object cbDataType: TComboBox
        Left = 1
        Top = 183
        Width = 88
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 15
        Text = 'Reflectividad'
        OnChange = cbDataTypeChange
        Items.Strings = (
          'Reflectividad'
          'Velocidad'
          'Ancho Spectral')
      end
    end
  end
  object Popup1: TPopupMenu
    OnChange = Popup1Change
    Left = 360
    Top = 135
    object Celdas1: TMenuItem
      Caption = '&Celdas'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItemClick
    end
    object Kilometros1: TMenuItem
      Caption = '&Kilometros'
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItemClick
    end
    object Tiempo1: TMenuItem
      Caption = '&Tiempo'
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItemClick
    end
    object N2: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object Codigo1: TMenuItem
      Caption = 'Codigo'
      Checked = True
      GroupIndex = 2
      RadioItem = True
      OnClick = MenuItemClick
    end
    object Voltaje1: TMenuItem
      Caption = 'Voltaje'
      GroupIndex = 2
      RadioItem = True
      OnClick = MenuItemClick
    end
    object Potencia1: TMenuItem
      Caption = 'Potencia'
      GroupIndex = 2
      RadioItem = True
      OnClick = MenuItemClick
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'Datos separados por comas|*.csv'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofShareAware, ofEnableSizing]
    Left = 374
    Top = 15
  end
end
