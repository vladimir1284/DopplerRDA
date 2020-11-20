object Frame_Observation: TFrame_Observation
  Left = 0
  Top = 0
  Width = 491
  Height = 104
  AutoScroll = False
  TabOrder = 0
  DesignSize = (
    491
    104)
  object Label3: TLabel
    Left = 5
    Top = 9
    Width = 35
    Height = 13
    Hint = 'Controlador'
    Caption = 'Cliente:'
  end
  object Label1: TLabel
    Left = 5
    Top = 29
    Width = 35
    Height = 19
    Caption = 'fgdh'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 135
    Top = 9
    Width = 39
    Height = 13
    Hint = 'Controlador'
    Caption = 'Plantilla:'
  end
  object Bulb1: TBulb
    Left = 476
    Top = 7
    Width = 16
    Height = 16
    Hint = 'En ejecucion'
    Anchors = [akTop, akRight]
  end
  object Edit1: TEdit
    Left = 45
    Top = 5
    Width = 80
    Height = 21
    Hint = 'Cliente en ejecucion'
    TabStop = False
    ReadOnly = True
    TabOrder = 0
  end
  object ProgressBar1: TProgressBar
    Left = 5
    Top = 85
    Width = 412
    Height = 16
    Hint = 'Progreso'
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 180
    Top = 5
    Width = 292
    Height = 21
    Hint = 'Plantilla en ejecucion'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 2
  end
  object Button1: TButton
    Left = 426
    Top = 84
    Width = 60
    Height = 18
    Anchors = [akRight, akBottom]
    Caption = '&Cancelar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ScrollBox1: TScrollBox
    Left = 4
    Top = 48
    Width = 481
    Height = 33
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 4
    object Label2: TMemo
      Left = 0
      Top = 0
      Width = 481
      Height = 33
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
end
