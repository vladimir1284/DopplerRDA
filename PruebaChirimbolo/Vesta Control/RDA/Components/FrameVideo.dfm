object Frame_Video: TFrame_Video
  Left = 0
  Top = 0
  Width = 667
  Height = 241
  Constraints.MinHeight = 145
  Constraints.MinWidth = 385
  TabOrder = 0
  object Panel4: TPanel
    Left = 73
    Top = 0
    Width = 508
    Height = 241
    Align = alClient
    TabOrder = 0
    object Video1: TVideo
      Left = 1
      Top = 1
      Width = 494
      Height = 224
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
      DataSize = 2000
      Align = alClient
      OnChange = Video1Change
      OnNewData = Video1NewData
      OnNewPos = Video1NewData
    end
    object Panel1: TPanel
      Left = 1
      Top = 225
      Width = 506
      Height = 15
      Align = alBottom
      BevelOuter = bvNone
      PopupMenu = Popup1
      TabOrder = 0
      DesignSize = (
        506
        15)
      object Bulb1: TBulb
        Left = 493
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
        Width = 435
        Height = 15
        Anchors = [akLeft, akTop, akRight]
        LargeChange = 25
        Max = 2000
        PageSize = 0
        TabOrder = 4
      end
    end
    object Panel2: TPanel
      Left = 495
      Top = 1
      Width = 12
      Height = 224
      Align = alRight
      BevelOuter = bvNone
      PopupMenu = Popup1
      TabOrder = 1
      DesignSize = (
        12
        224)
      object Label1: TLabel
        Tag = -1
        Left = 0
        Top = 214
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
        Top = 204
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
  object Panel6: TPanel
    Left = 581
    Top = 0
    Width = 86
    Height = 241
    Align = alRight
    TabOrder = 1
    object rgSignal: TRadioGroup
      Left = 1
      Top = 1
      Width = 84
      Height = 144
      Align = alTop
      Caption = 'Se'#241'ales'
      ItemIndex = 1
      Items.Strings = (
        'dBZ(dbz)'
        'dBZ(db)'
        'dBT(dbz)'
        'dBT(db)'
        'V'
        'W'
        'Calibracion')
      TabOrder = 0
      OnClick = rgSignalClick
    end
    object Button1: TButton
      Left = 6
      Top = 155
      Width = 75
      Height = 25
      Caption = 'RT CH1'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 6
      Top = 186
      Width = 75
      Height = 25
      Caption = 'RT CH2'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 73
    Height = 241
    Align = alLeft
    PopupMenu = Popup1
    TabOrder = 2
    object Label7: TLabel
      Left = 2
      Top = 51
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
      Top = 157
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
      Left = 1
      Top = 8
      Width = 70
      Height = 17
      AutoSize = False
      Caption = 'Canal 1'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 1
      Top = 114
      Width = 70
      Height = 17
      AutoSize = False
      Caption = 'Canal 2'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
    end
    object CheckBox1: TCheckBox
      Left = 2
      Top = 28
      Width = 14
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
    object Edit1: TEdit
      Left = 20
      Top = 29
      Width = 47
      Height = 16
      Hint = 'Valor 1'
      AutoSize = False
      ReadOnly = True
      TabOrder = 1
    end
    object CheckBox2: TCheckBox
      Left = 1
      Top = 135
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
    object Edit2: TEdit
      Left = 20
      Top = 136
      Width = 47
      Height = 16
      Hint = 'Valor 2'
      AutoSize = False
      ReadOnly = True
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 20
      Top = 65
      Width = 47
      Height = 16
      Hint = 'Posicion 1'
      AutoSize = False
      ReadOnly = True
      TabOrder = 4
    end
    object Edit6: TEdit
      Left = 20
      Top = 83
      Width = 47
      Height = 16
      Hint = 'Posicion 2'
      AutoSize = False
      ReadOnly = True
      TabOrder = 5
    end
    object Edit3: TEdit
      Left = 20
      Top = 47
      Width = 47
      Height = 16
      Hint = 'Promedio 1'
      AutoSize = False
      ReadOnly = True
      TabOrder = 6
    end
    object Edit4: TEdit
      Left = 20
      Top = 153
      Width = 47
      Height = 16
      Hint = 'Promedio 2'
      AutoSize = False
      ReadOnly = True
      TabOrder = 7
    end
    object Edit7: TEdit
      Left = 20
      Top = 170
      Width = 47
      Height = 16
      Hint = 'Posicion 1'
      AutoSize = False
      ReadOnly = True
      TabOrder = 8
    end
    object Edit8: TEdit
      Left = 20
      Top = 186
      Width = 47
      Height = 16
      Hint = 'Posicion 2'
      AutoSize = False
      ReadOnly = True
      TabOrder = 9
    end
  end
  object Popup1: TPopupMenu
    Left = 328
    Top = 95
    object Celdas1: TMenuItem
      Caption = '&Celdas'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItem_click
    end
    object Kilometros1: TMenuItem
      Caption = '&Kilometros'
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItem_click
    end
    object Tiempo1: TMenuItem
      Caption = '&Tiempo'
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItem_click
    end
  end
end
