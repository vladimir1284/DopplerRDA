object Frame_RDA: TFrame_RDA
  Left = 0
  Top = 0
  Width = 320
  Height = 100
  AutoScroll = False
  TabOrder = 0
  object Label1: TLabel
    Left = 5
    Top = 9
    Width = 35
    Height = 13
    Hint = 'Controlador'
    Caption = 'Cliente:'
  end
  object Label2: TLabel
    Left = 5
    Top = 65
    Width = 117
    Height = 13
    Caption = 'Encendiendo blablabla...'
  end
  object Label3: TLabel
    Left = 5
    Top = 35
    Width = 207
    Height = 22
    Caption = 'Preparando observación'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object BarGauge1: TBarGauge
    Left = 5
    Top = 80
    Width = 311
    Height = 15
    Value = 0
    Min = 0
    Max = 100
    Margin = 2
    Step = 10
    Gap = 1
    Bevel = bvLowered
    BarColor = clHighlight
    Style = bsLeftRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Anchors = [akLeft, akTop, akRight]
  end
  object Label4: TLabel
    Left = 135
    Top = 9
    Width = 63
    Height = 13
    Hint = 'Controlador'
    Caption = 'Observacion:'
  end
  object Bulb1: TBulb
    Left = 305
    Top = 7
    Width = 16
    Height = 16
    Anchors = [akTop, akRight]
  end
  object Edit1: TEdit
    Left = 45
    Top = 5
    Width = 80
    Height = 21
    Hint = 'Controlador'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 205
    Top = 5
    Width = 96
    Height = 21
    Hint = 'Controlador'
    TabStop = False
    Enabled = False
    ReadOnly = True
    TabOrder = 1
  end
  object Timer1: TTimer
    Left = 245
    Top = 35
  end
end
