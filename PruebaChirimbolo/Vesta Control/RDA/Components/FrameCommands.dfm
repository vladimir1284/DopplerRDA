object Frame_Commands: TFrame_Commands
  Left = 0
  Top = 0
  Width = 549
  Height = 80
  TabOrder = 0
  object Splitter1: TSplitter
    Left = 205
    Top = 0
    Width = 3
    Height = 80
    Cursor = crHSplit
    Align = alRight
    Beveled = True
    ResizeStyle = rsUpdate
  end
  object Splitter2: TSplitter
    Left = 396
    Top = 0
    Width = 3
    Height = 80
    Cursor = crHSplit
    Align = alRight
    Beveled = True
    ResizeStyle = rsUpdate
  end
  inline Frame_Antenna: TFrame_Antenna
    Left = 208
    Height = 80
    Align = alRight
  end
  inline Frame_Synchro: TFrame_Synchro
    Left = 399
    Height = 80
    Align = alRight
    TabOrder = 1
  end
  inline Frame_Radar: TFrame_Radar
    Left = 0
    Top = 0
    Width = 205
    Align = alClient
    TabOrder = 2
    inherited TuneGauge1: TTuneGauge
      Width = 55
    end
    inherited TuneGauge2: TTuneGauge
      Width = 55
    end
    inherited Button1: TButton
      Width = 140
    end
  end
end