object Frame_Motor: TFrame_Motor
  Left = 0
  Top = 0
  Width = 270
  Height = 270
  Constraints.MinHeight = 270
  Constraints.MinWidth = 270
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 217
    Width = 270
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      270
      53)
    object SpeedButton1: TSpeedButton
      Left = 197
      Top = 5
      Width = 72
      Height = 46
      Anchors = [akTop, akRight, akBottom]
      Caption = 'RH&I'
      Enabled = False
      OnClick = SpeedButton1Click
    end
    object Bulb1: TBulb
      Left = 24
      Top = 8
      Width = 16
      Height = 16
      Hint = 'Lazo de posicion cerrado'
    end
    object Bulb2: TBulb
      Left = 24
      Top = 32
      Width = 16
      Height = 16
      Hint = 'Accionamiento listo (lazo de velocidad cerrado)'
    end
    object Bulb3: TBulb
      Left = 179
      Top = 8
      Width = 16
      Height = 16
    end
    object Edit4: TEdit
      Left = 97
      Top = 30
      Width = 40
      Height = 21
      Cursor = crArrow
      Hint = 'Velocidad'
      TabStop = False
      ParentColor = True
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 97
      Top = 6
      Width = 40
      Height = 21
      Cursor = crArrow
      Hint = 'Posici'#243'n'
      TabStop = False
      ParentColor = True
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 40
      Top = 6
      Width = 40
      Height = 21
      Hint = 'Posici'#243'n deseada'
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = '0'
    end
    object UpDown1: TUpDown
      Left = 82
      Top = 6
      Width = 13
      Height = 21
      Enabled = False
      Max = 4095
      Position = 100
      TabOrder = 3
      Thousands = False
      Wrap = True
      OnClick = UpDown1Click
    end
    object CheckBox1: TCheckBox
      Left = 0
      Top = 9
      Width = 24
      Height = 14
      Hint = 'Activar/Desactivar lazo de posicion'
      Alignment = taLeftJustify
      Caption = '&P'
      Enabled = False
      TabOrder = 4
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 0
      Top = 34
      Width = 24
      Height = 13
      Hint = 'Activar/Desactivar lazo de velocidad'
      Alignment = taLeftJustify
      Caption = '&V'
      Enabled = False
      TabOrder = 5
      OnClick = CheckBox2Click
    end
    object Edit2: TEdit
      Left = 40
      Top = 30
      Width = 40
      Height = 21
      Hint = 'Posici'#243'n deseada'
      ParentShowHint = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
      Text = '0'
    end
    object UpDown2: TUpDown
      Left = 82
      Top = 30
      Width = 13
      Height = 21
      Enabled = False
      Min = -500
      Max = 500
      Increment = 34
      TabOrder = 7
      Thousands = False
      OnClick = UpDown2Click
    end
    object Button2: TButton
      Left = 139
      Top = 6
      Width = 37
      Height = 20
      Caption = 'Sector'
      TabOrder = 8
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 139
      Top = 30
      Width = 57
      Height = 20
      Caption = 'Calibracion'
      TabOrder = 9
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 270
    Height = 217
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Antenna: TAntenna
      Left = 1
      Top = 1
      Width = 268
      Height = 215
      AntennaType = at_Azimut
      Desired = 0
      Desired2 = 0
      Position = 0
      Command = 0
      Count_Rect = 1
      Count_Circ = 1
      Count_Rad = 24
      Count_Small = 72
      Color_Back = clTeal
      Color_Ray = clLime
      Color_Mark = clRed
      Color_Rect = clWhite
      Color_Circ = clWhite
      Color_Rad = clYellow
      Color_Small = clWhite
      Color_Cmd = clMaroon
      Color_Mark2 = clBlack
      ReadOnly = False
      Align = alClient
      OnNewDesired = AntennaNewDesired
      OnNewDesired2 = AntennaNewDesired2
      OnTypeChanged = AntennaTypeChanged
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 71
    Top = 23
    object Angulo1: TMenuItem
      Caption = '&Angulo'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItemClick
    end
    object Codigo1: TMenuItem
      Caption = '&Codigo'
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItemClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 41
    Top = 23
    object RPM1: TMenuItem
      Caption = '&RPM'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItemClick
    end
    object CPS1: TMenuItem
      Caption = '&CPS'
      GroupIndex = 1
      RadioItem = True
      OnClick = MenuItemClick
    end
  end
  object PopupMenu3: TPopupMenu
    Left = 15
    Top = 20
    object Calibracion1: TMenuItem
      Caption = '&Calibracion...'
      OnClick = Calibracion1Click
    end
  end
end
