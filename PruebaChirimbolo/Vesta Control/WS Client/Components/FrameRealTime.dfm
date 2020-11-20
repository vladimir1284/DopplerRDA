object RealTime: TRealTime
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object Label1: TLabel
    Left = 24
    Top = 88
    Width = 277
    Height = 37
    Caption = 'Under Construction'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 16
    Width = 73
    Height = 17
    Caption = 'Encender'
    TabOrder = 0
    OnClick = CheckBox1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 96
    Top = 8
  end
end
