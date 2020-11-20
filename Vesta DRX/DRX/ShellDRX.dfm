object Shell_DRX: TShell_DRX
  Left = 480
  Top = 394
  ActiveControl = InfoContainer
  Caption = 'Vesta DRX'
  ClientHeight = 504
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object InfoContainer: TPageControl
    Left = 0
    Top = 0
    Width = 767
    Height = 504
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    OnChange = InfoContainerChange
    object TabSheet4: TTabSheet
      Caption = 'AFC'
      ImageIndex = 3
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 759
        Height = 98
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 759
          Height = 297
          Align = alTop
          BevelOuter = bvSpace
          TabOrder = 0
          object Label11: TLabel
            Left = 497
            Top = 16
            Width = 52
            Height = 13
            Caption = 'Frecuencia'
          end
          object Label12: TLabel
            Left = 661
            Top = 16
            Width = 12
            Height = 13
            Caption = 'Hz'
          end
          object GroupBox1: TGroupBox
            Left = 272
            Top = 3
            Width = 211
            Height = 89
            Caption = 'STALO'
            Enabled = False
            TabOrder = 0
            object Label1: TLabel
              Left = 12
              Top = 17
              Width = 62
              Height = 13
              Caption = 'Temperatura'
            end
            object Label9: TLabel
              Left = 12
              Top = 40
              Width = 41
              Height = 13
              Caption = 'Potencia'
            end
            object Label26: TLabel
              Left = 12
              Top = 63
              Width = 52
              Height = 13
              Caption = 'Frecuencia'
            end
            object Label3: TLabel
              Left = 176
              Top = 17
              Width = 7
              Height = 13
              Caption = 'C'
            end
            object Label10: TLabel
              Left = 177
              Top = 40
              Width = 20
              Height = 13
              Caption = 'dbm'
            end
            object Label2: TLabel
              Left = 176
              Top = 63
              Width = 12
              Height = 13
              Caption = 'Hz'
            end
            object txTemp: TEdit
              Left = 80
              Top = 14
              Width = 91
              Height = 21
              TabOrder = 0
              Text = '0'
            end
            object txPow: TEdit
              Left = 80
              Top = 37
              Width = 91
              Height = 21
              TabOrder = 1
              Text = '0'
            end
            object txFrequency: TEdit
              Left = 80
              Top = 60
              Width = 91
              Height = 21
              TabOrder = 2
              Text = '0'
            end
          end
          object GroupBox2: TGroupBox
            Left = 4
            Top = 3
            Width = 249
            Height = 89
            Caption = 'AFC'
            TabOrder = 1
            object Label6: TLabel
              Left = 6
              Top = 17
              Width = 58
              Height = 13
              Caption = 'IF Freq (Hz)'
            end
            object Label7: TLabel
              Left = 10
              Top = 40
              Width = 60
              Height = 13
              Caption = 'Tx Freq (Hz)'
            end
            object Label8: TLabel
              Left = 7
              Top = 63
              Width = 89
              Height = 13
              Caption = 'Pulse Power (dBm)'
            end
            object AverageValue: TLabel
              Left = 110
              Top = 17
              Width = 6
              Height = 13
              Caption = '0'
            end
            object TxFreqLabel: TLabel
              Left = 110
              Top = 40
              Width = 6
              Height = 13
              Caption = '0'
            end
            object PowLabel: TLabel
              Left = 110
              Top = 63
              Width = 6
              Height = 13
              Caption = '0'
            end
          end
          object txFreqSetpoint: TEdit
            Left = 565
            Top = 13
            Width = 91
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object ckAFC_Acquire: TCheckBox
            Left = 497
            Top = 65
            Width = 97
            Height = 17
            Caption = 'Adquirir'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = ckAFC_AcquireClick
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 98
        Width = 759
        Height = 378
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object afcCharts: TPageControl
          Left = 0
          Top = 0
          Width = 759
          Height = 378
          ActivePage = TabSheet3
          Align = alClient
          TabOrder = 0
          object TabSheet3: TTabSheet
            Caption = 'TX'
            ImageIndex = 1
            object txChart: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 350
              Legend.Visible = False
              Title.Text.Strings = (
                'Pulso del Trasmisor')
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 9000.000000000000000000
              LeftAxis.Minimum = -9000.000000000000000000
              View3D = False
              Align = alClient
              TabOrder = 0
              object Series1: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet5: TTabSheet
            Caption = 'Spectro'
            ImageIndex = 2
            object fftChart: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 350
              Legend.Visible = False
              Title.Text.Strings = (
                'Espectro del Pulso del Trasmisor')
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries1: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'IQ'
      ImageIndex = 5
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 759
        Height = 97
        Align = alTop
        TabOrder = 0
        object Label4: TLabel
          Left = 397
          Top = 20
          Width = 32
          Height = 13
          Caption = 'Azimut'
        end
        object Label5: TLabel
          Left = 385
          Top = 47
          Width = 44
          Height = 13
          Caption = 'Elevation'
        end
        object txAzimut: TEdit
          Left = 435
          Top = 17
          Width = 59
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 0
          Text = '0'
        end
        object txElevation: TEdit
          Left = 435
          Top = 44
          Width = 59
          Height = 21
          Alignment = taRightJustify
          ReadOnly = True
          TabOrder = 1
          Text = '0'
        end
        object rgPulse_Mode: TRadioGroup
          Left = 4
          Top = 7
          Width = 109
          Height = 74
          Caption = 'PL o PC'
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Pulso Largo'
            'Pulso Corto')
          TabOrder = 2
        end
        object rgPRF_Mode: TRadioGroup
          Left = 119
          Top = 7
          Width = 115
          Height = 74
          Caption = 'Modo del PRF'
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'Sencillo'
            'Dual')
          TabOrder = 3
        end
        object rgPRF_Rate: TRadioGroup
          Left = 240
          Top = 7
          Width = 112
          Height = 74
          Caption = 'Razon del PRF'
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            '5/4'
            '4/3'
            '3/2')
          TabOrder = 4
        end
        object ckIQ_Acquire: TCheckBox
          Left = 537
          Top = 41
          Width = 97
          Height = 17
          Caption = 'Adquirir'
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = ckIQ_AcquireClick
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 97
        Width = 759
        Height = 379
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object IQ_Charts: TPageControl
          Left = 0
          Top = 0
          Width = 759
          Height = 379
          ActivePage = TabSheet14
          Align = alClient
          TabOrder = 0
          object TabSheet14: TTabSheet
            Caption = 'Potencia'
            ImageIndex = 9
            object chartPower: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'Potencia de Calibracion')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 100.000000000000000000
              LeftAxis.MinimumOffset = 10
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries11: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'dBT'
            object chartT: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'Potencia Total sin Filtrar (db)')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 100.000000000000000000
              LeftAxis.MinimumOffset = 10
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries4: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet11: TTabSheet
            Caption = 'dBZ'
            ImageIndex = 6
            object chartZ: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'Potencia Filtrada (db)')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 100.000000000000000000
              LeftAxis.MinimumOffset = 10
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries7: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet8: TTabSheet
            Caption = 'V'
            ImageIndex = 1
            object chartSpeed: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'Velocidad')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 120.000000000000000000
              LeftAxis.Minimum = -120.000000000000000000
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries2: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object tabW: TTabSheet
            Caption = 'W'
            ImageIndex = 4
            object chartW: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'Ancho Espectral')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 2000.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 120.000000000000000000
              LeftAxis.Minimum = -120.000000000000000000
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries6: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet9: TTabSheet
            Caption = 'SQI'
            ImageIndex = 2
            object chartSQI: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'Indice de Calidad de la Se'#241'al')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 1.200000000000000000
              LeftAxis.MinimumOffset = 10
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries3: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet2: TTabSheet
            Caption = 'LOG'
            ImageIndex = 6
            object chartLOG: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'LOG')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 100.000000000000000000
              LeftAxis.Minimum = -50.000000000000000000
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries8: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet12: TTabSheet
            Caption = 'SIG'
            ImageIndex = 7
            object chartSIG: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'SIG')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              LeftAxis.Automatic = False
              LeftAxis.AutomaticMaximum = False
              LeftAxis.AutomaticMinimum = False
              LeftAxis.Maximum = 100.000000000000000000
              LeftAxis.Minimum = -50.000000000000000000
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries9: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
          object TabSheet13: TTabSheet
            Caption = 'CCOR'
            ImageIndex = 8
            object chartCCOR: TChart
              Left = 0
              Top = 0
              Width = 751
              Height = 351
              Legend.Visible = False
              Title.Text.Strings = (
                'CCOR')
              BottomAxis.Automatic = False
              BottomAxis.AutomaticMaximum = False
              BottomAxis.AutomaticMinimum = False
              BottomAxis.Maximum = 1868.000000000000000000
              View3D = False
              Align = alClient
              TabOrder = 0
              object FastLineSeries10: TFastLineSeries
                Marks.Arrow.Visible = True
                Marks.Callout.Brush.Color = clBlack
                Marks.Callout.Arrow.Visible = True
                Marks.Visible = False
                Title = 'Samples'
                LinePen.Color = clRed
                XValues.Name = 'X'
                XValues.Order = loAscending
                YValues.Name = 'Y'
                YValues.Order = loNone
              end
            end
          end
        end
      end
    end
    object tFilter: TTabSheet
      Caption = 'Filtro'
      Enabled = False
      ImageIndex = 4
      object Label13: TLabel
        Left = 56
        Top = 56
        Width = 12
        Height = 13
        Caption = 'B0'
      end
      object Label14: TLabel
        Left = 111
        Top = 56
        Width = 12
        Height = 13
        Caption = 'B1'
      end
      object Label15: TLabel
        Left = 166
        Top = 56
        Width = 12
        Height = 13
        Caption = 'B2'
      end
      object Label17: TLabel
        Left = 221
        Top = 56
        Width = 12
        Height = 13
        Caption = 'B3'
      end
      object Label18: TLabel
        Left = 276
        Top = 56
        Width = 12
        Height = 13
        Caption = 'B4'
      end
      object Label19: TLabel
        Left = 52
        Top = 120
        Width = 13
        Height = 13
        Caption = 'C1'
      end
      object Label20: TLabel
        Left = 107
        Top = 120
        Width = 13
        Height = 13
        Caption = 'C2'
      end
      object Label21: TLabel
        Left = 162
        Top = 120
        Width = 13
        Height = 13
        Caption = 'C3'
      end
      object Label22: TLabel
        Left = 217
        Top = 120
        Width = 13
        Height = 13
        Caption = 'C4'
      end
      object Label23: TLabel
        Left = 52
        Top = 184
        Width = 72
        Height = 13
        Caption = 'Angulo Maximo'
      end
      object Label24: TLabel
        Left = 52
        Top = 232
        Width = 68
        Height = 13
        Caption = 'Altura Maxima'
      end
      object Label25: TLabel
        Left = 52
        Top = 280
        Width = 82
        Height = 13
        Caption = 'Distancia Maxima'
      end
      object Label16: TLabel
        Left = 289
        Top = 206
        Width = 43
        Height = 13
        Caption = 'Distancia'
      end
      object txB0: TEdit
        Left = 40
        Top = 75
        Width = 49
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object txB1: TEdit
        Left = 95
        Top = 75
        Width = 49
        Height = 21
        TabOrder = 1
        Text = '0'
      end
      object txB2: TEdit
        Left = 150
        Top = 75
        Width = 49
        Height = 21
        TabOrder = 2
        Text = '0'
      end
      object txB3: TEdit
        Left = 205
        Top = 75
        Width = 49
        Height = 21
        TabOrder = 3
        Text = '0'
      end
      object txB4: TEdit
        Left = 260
        Top = 75
        Width = 49
        Height = 21
        TabOrder = 4
        Text = '0'
      end
      object txC1: TEdit
        Left = 40
        Top = 139
        Width = 49
        Height = 21
        TabOrder = 5
        Text = '0'
      end
      object txC2: TEdit
        Left = 95
        Top = 139
        Width = 49
        Height = 21
        TabOrder = 6
        Text = '0'
      end
      object txC3: TEdit
        Left = 150
        Top = 139
        Width = 49
        Height = 21
        TabOrder = 7
        Text = '0'
      end
      object txC4: TEdit
        Left = 205
        Top = 139
        Width = 49
        Height = 21
        TabOrder = 8
        Text = '0'
      end
      object txMaxAngle: TEdit
        Left = 40
        Top = 203
        Width = 57
        Height = 21
        TabOrder = 9
        Text = '0'
      end
      object txMaxHeigh: TEdit
        Left = 40
        Top = 251
        Width = 57
        Height = 21
        TabOrder = 10
        Text = '0'
      end
      object txMaxDistance: TEdit
        Left = 40
        Top = 299
        Width = 57
        Height = 21
        TabOrder = 11
        Text = '0'
      end
      object ckSQI: TCheckBox
        Left = 181
        Top = 183
        Width = 73
        Height = 17
        Caption = 'SQI'
        TabOrder = 12
      end
      object ckCCOR: TCheckBox
        Left = 181
        Top = 253
        Width = 97
        Height = 17
        Caption = 'CCOR'
        TabOrder = 13
      end
      object ckLOG: TCheckBox
        Left = 181
        Top = 207
        Width = 97
        Height = 17
        Caption = 'LOG'
        TabOrder = 14
      end
      object ckSIG: TCheckBox
        Left = 181
        Top = 230
        Width = 97
        Height = 17
        Caption = 'SIG'
        TabOrder = 15
      end
      object txSpeckleDistance: TEdit
        Left = 338
        Top = 203
        Width = 63
        Height = 21
        TabOrder = 16
      end
      object ckSpeckle: TCheckBox
        Left = 264
        Top = 183
        Width = 97
        Height = 17
        Caption = 'Speckles'
        TabOrder = 17
      end
    end
  end
  object Filter_Timer: TTimer
    Interval = 10000
    OnTimer = Filter_TimerTimer
    Left = 576
    Top = 248
  end
  object IQ_Timer: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = IQ_TimerTimer
    Left = 576
    Top = 304
  end
  object AFC_Timer: TTimer
    Interval = 3000
    OnTimer = AFC_TimerTimer
    Left = 512
    Top = 304
  end
  object timerWS: TTimer
    OnTimer = timerWSTimer
    Left = 712
    Top = 88
  end
  object Signals: TTimer
    Interval = 200
    OnTimer = SignalsTimer
    Left = 512
    Top = 248
  end
end