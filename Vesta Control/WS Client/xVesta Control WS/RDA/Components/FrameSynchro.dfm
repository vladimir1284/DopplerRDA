object Frame_Synchro: TFrame_Synchro
  Left = 0
  Top = 0
  Width = 150
  Height = 81
  AutoScroll = False
  TabOrder = 0
  DesignSize = (
    150
    81)
  object Led1: TLed
    Left = 130
    Top = 7
    Width = 16
    Height = 16
    Hint = 'Pulso largo'
    Anchors = [akTop, akRight]
    Color = ldGreen
  end
  object Led2: TLed
    Left = 130
    Top = 32
    Width = 16
    Height = 16
    Hint = 'Pulso corto'
    Anchors = [akTop, akRight]
    Color = ldYellow
  end
  object Label1: TLabel
    Left = 5
    Top = 59
    Width = 14
    Height = 13
    Caption = 'N1'
  end
  object Label2: TLabel
    Left = 130
    Top = 59
    Width = 13
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Hz'
  end
  object Button3: TButton
    Left = 5
    Top = 5
    Width = 118
    Height = 20
    Hint = 'Programar pulso largo'
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Pulso &Largo'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 5
    Top = 30
    Width = 118
    Height = 20
    Hint = 'Programar pulso corto'
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Pulso &Corto'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 80
    Top = 55
    Width = 42
    Height = 21
    Hint = 'Frecuencia del disparo N1'
    TabStop = False
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 25
    Top = 55
    Width = 49
    Height = 21
    Hint = 'Frecuencia del disparo N1'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 3
  end
end
