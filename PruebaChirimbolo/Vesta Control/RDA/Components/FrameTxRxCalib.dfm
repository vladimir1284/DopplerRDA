object Frame_TxRx_Calibration: TFrame_TxRx_Calibration
  Left = 0
  Top = 0
  Width = 487
  Height = 362
  Constraints.MinHeight = 362
  Constraints.MinWidth = 487
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 30
    Width = 487
    Height = 332
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Tx'
      inline Tx: TFrame_Tx
        Left = 0
        Top = 0
        Width = 479
        Height = 304
        Align = alClient
        Constraints.MinHeight = 260
        Constraints.MinWidth = 380
        TabOrder = 0
        inherited Panel2: TPanel
          Width = 479
          inherited GroupBox5: TGroupBox
            Width = 374
          end
          inherited GroupBox1: TGroupBox
            Left = 375
          end
        end
        inherited Panel3: TPanel
          Width = 479
          Height = 207
          inherited Panel1: TPanel
            Width = 338
            Height = 205
            inherited Label28: TLabel
              Left = 316
            end
            inherited Label27: TLabel
              Left = 316
            end
            inherited Label26: TLabel
              Left = 316
            end
            inherited Label25: TLabel
              Left = 316
            end
            inherited Label24: TLabel
              Left = 316
            end
            inherited Label23: TLabel
              Left = 316
            end
            inherited Label22: TLabel
              Left = 316
            end
            inherited Label17: TLabel
              Left = 316
            end
            inherited Label15: TLabel
              Left = 316
            end
            inherited TuneGauge9: TTuneGauge
              Width = 184
            end
            inherited TuneGauge8: TTuneGauge
              Width = 184
            end
            inherited TuneGauge7: TTuneGauge
              Width = 184
            end
            inherited TuneGauge6: TTuneGauge
              Width = 184
            end
            inherited TuneGauge4: TTuneGauge
              Width = 184
            end
            inherited TuneGauge3: TTuneGauge
              Width = 184
            end
            inherited TuneGauge2: TTuneGauge
              Width = 184
            end
            inherited TuneGauge10: TTuneGauge
              Width = 184
            end
            inherited TuneGauge1: TTuneGauge
              Width = 184
            end
            inherited StaticText1: TStaticText
              Left = 275
            end
            inherited StaticText9: TStaticText
              Left = 275
            end
            inherited StaticText8: TStaticText
              Left = 275
            end
            inherited StaticText7: TStaticText
              Left = 275
            end
            inherited StaticText6: TStaticText
              Left = 275
            end
            inherited StaticText5: TStaticText
              Left = 275
            end
            inherited StaticText3: TStaticText
              Left = 275
            end
            inherited StaticText2: TStaticText
              Left = 275
            end
            inherited StaticText13: TStaticText
              Left = 275
            end
          end
          inherited GroupBox2: TGroupBox
            Left = 339
            Height = 205
            inherited Synchro: TFrame_Synchro
              Height = 188
            end
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'DRX'
      ImageIndex = 2
      inline DRX: TFrame_DRX
        Left = 0
        Top = 0
        Width = 479
        Height = 304
        Align = alClient
        Constraints.MinHeight = 265
        Constraints.MinWidth = 419
        TabOrder = 0
        inherited Panel1: TPanel
          Width = 479
        end
        inherited PageControl1: TPageControl
          Width = 479
          inherited TabSheet1: TTabSheet
            inherited powerChart: TChart
              Width = 471
            end
          end
          inherited TabSheet2: TTabSheet
            inherited spectrumChart: TChart
              Width = 471
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Calibracion'
      ImageIndex = 1
      inline Calibration: TFrame_Calibration
        Left = 0
        Top = 0
        Width = 479
        Height = 304
        Align = alClient
        Constraints.MinHeight = 243
        Constraints.MinWidth = 410
        TabOrder = 0
        inherited Panel1: TPanel
          Top = 268
          Width = 479
          inherited Panel2: TPanel
            Left = 338
          end
        end
        inherited PageControl1: TPageControl
          Width = 479
          Height = 268
          inherited TabSheet5: TTabSheet
            inherited Panel6: TPanel
              Width = 471
              Height = 240
              inherited drx_codes_editor_lp: TValueListEditor
                Width = 471
                Height = 240
                ColWidths = (
                  150
                  315)
              end
            end
          end
          inherited TabSheet3: TTabSheet
            inherited drx_codes_editor_sp: TValueListEditor
              Width = 471
              Height = 240
              ColWidths = (
                150
                315)
            end
          end
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 0
    Width = 487
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label15: TLabel
      Left = 5
      Top = 5
      Width = 44
      Height = 19
      Caption = 'Canal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 75
      Top = 5
      Width = 4
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
