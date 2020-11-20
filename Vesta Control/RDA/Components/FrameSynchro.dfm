object Frame_Synchro: TFrame_Synchro
  Left = 0
  Top = 0
  Width = 173
  Height = 133
  AutoScroll = False
  TabOrder = 0
  object gbPRF_Rate: TGroupBox
    Left = 0
    Top = 29
    Width = 173
    Height = 102
    Align = alTop
    Caption = 'Pulso Corto. Razon PRF'
    TabOrder = 0
    DesignSize = (
      173
      102)
    object led5: TLed
      Left = 153
      Top = 18
      Width = 16
      Height = 16
      Hint = 'Pulso largo'
      Anchors = [akTop, akRight]
      Color = ldYellow
    end
    object SpeedButton5: TSpeedButton
      Left = 5
      Top = 18
      Width = 145
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      Caption = '5/4'
      Flat = True
      OnClick = SpeedButton5Click
    end
    object SpeedButton6: TSpeedButton
      Left = 5
      Top = 37
      Width = 145
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      Caption = '4/3'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object led4: TLed
      Left = 153
      Top = 37
      Width = 16
      Height = 16
      Hint = 'Pulso largo'
      Anchors = [akTop, akRight]
      Color = ldYellow
    end
    object SpeedButton7: TSpeedButton
      Left = 5
      Top = 57
      Width = 145
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      Caption = '3/2'
      Flat = True
      OnClick = SpeedButton7Click
    end
    object led3: TLed
      Left = 153
      Top = 57
      Width = 16
      Height = 16
      Hint = 'Pulso largo'
      Anchors = [akTop, akRight]
      Color = ldYellow
    end
    object SpeedButton3: TSpeedButton
      Left = 5
      Top = 76
      Width = 145
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Simple'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object ledSimple: TLed
      Left = 153
      Top = 76
      Width = 16
      Height = 16
      Hint = 'Pulso largo'
      Anchors = [akTop, akRight]
      Color = ldYellow
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 173
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      173
      29)
    object ledPL: TLed
      Left = 153
      Top = 5
      Width = 16
      Height = 16
      Hint = 'Pulso largo'
      Anchors = [akTop, akRight]
      Color = ldGreen
    end
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 5
      Width = 145
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Pulso Largo'
      Flat = True
      OnClick = SpeedButton1Click
    end
  end
end
