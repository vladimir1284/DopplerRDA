object Frame_TxRx_Calibration: TFrame_TxRx_Calibration
  Left = 0
  Top = 0
  Width = 328
  Height = 306
  TabOrder = 0
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 328
    Height = 306
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Estado'
      inline Status: TFrame_TxRx
        Left = 0
        Top = 0
        Width = 320
        Height = 278
        Align = alClient
        TabOrder = 0
        inherited Panel6: TPanel
          Width = 320
          inherited Led11: TLed
            Left = 298
          end
          inherited CheckBox4: TCheckBox
            Left = 234
          end
        end
        inherited GroupBox1: TGroupBox
          Width = 320
          inherited TuneGauge1: TTuneGauge
            Width = 110
          end
          inherited GroupBox5: TGroupBox
            Left = 173
          end
          inherited Potencia: TStaticText
            Left = 259
          end
        end
        inherited GroupBox2: TGroupBox
          Width = 320
          inherited TuneGauge2: TTuneGauge
            Width = 93
          end
          inherited TuneGauge3: TTuneGauge
            Width = 94
          end
          inherited TuneGauge4: TTuneGauge
            Width = 94
          end
          inherited GroupBox7: TGroupBox
            Left = 173
          end
          inherited Ruido: TStaticText
            Left = 259
          end
          inherited Ganancia: TStaticText
            Left = 259
          end
          inherited Sintonia: TStaticText
            Left = 259
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
        Width = 320
        Height = 278
        Align = alClient
        TabOrder = 0
        inherited Panel1: TPanel
          Top = 242
          Width = 320
          inherited Panel2: TPanel
            Left = 179
            inherited Button1: TButton
              OnClick = CalibrationButton1Click
            end
            inherited Button2: TButton
              OnClick = CalibrationButton2Click
            end
          end
        end
        inherited PageControl1: TPageControl
          Width = 320
          Height = 242
          inherited TabSheet3: TTabSheet
            inherited HeaderControl1: THeaderControl
              Sections = <
                item
                  AllowClick = False
                  ImageIndex = -1
                  Text = 'Potencia [dB]'
                  Width = 100
                end
                item
                  Alignment = taCenter
                  AllowClick = False
                  ImageIndex = -1
                  Text = 'Codigo'
                  Width = 117
                end>
            end
          end
          inherited TabSheet4: TTabSheet
            inherited Panel4: TPanel
              Width = 320
              Height = 242
            end
          end
        end
      end
    end
  end
end
