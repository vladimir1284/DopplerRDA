object Frame_RTMotor: TFrame_RTMotor
  Left = 0
  Top = 0
  Width = 201
  Height = 249
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 196
    Width = 201
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Posicion'
    end
    object Label2: TLabel
      Left = 24
      Top = 32
      Width = 47
      Height = 13
      Caption = 'Velocidad'
    end
    object Edit4: TEdit
      Left = 76
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
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 76
      Top = 5
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
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 196
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    object Antenna: TAntenna
      Left = 1
      Top = 1
      Width = 199
      Height = 194
      AntennaType = at_Azimut
      Desired = 0
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
      ReadOnly = False
      Align = alClient
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 95
    Top = 135
    object Angulo1: TMenuItem
      Caption = '&Angulo'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = RPM1Click
    end
    object Codigo1: TMenuItem
      Caption = '&Codigo'
      GroupIndex = 1
      RadioItem = True
      OnClick = RPM1Click
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 65
    Top = 135
    object RPM1: TMenuItem
      Caption = '&RPM'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = RPM1Click
    end
    object CPS1: TMenuItem
      Caption = '&CPS'
      GroupIndex = 1
      RadioItem = True
      OnClick = RPM1Click
    end
  end
end