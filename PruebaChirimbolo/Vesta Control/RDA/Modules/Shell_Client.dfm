object ShellClient: TShellClient
  Left = 27
  Top = 53
  Width = 1251
  Height = 761
  Caption = 'Vesta|RDA'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 177
    Height = 707
    Align = alLeft
    BevelOuter = bvSpace
    Constraints.MinWidth = 173
    TabOrder = 0
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 175
      Height = 60
      Align = alTop
      BevelOuter = bvSpace
      TabOrder = 0
      inline Control: TFrame_Control
        Left = 1
        Top = 1
        Width = 173
        Height = 58
        Align = alClient
        Constraints.MinHeight = 57
        Constraints.MinWidth = 173
        TabOrder = 0
      end
    end
    object Panel9: TPanel
      Left = 1
      Top = 61
      Width = 175
      Height = 146
      Align = alTop
      BevelOuter = bvSpace
      TabOrder = 1
      inline Radar: TFrame_Radar
        Left = 1
        Top = 1
        Width = 173
        Height = 144
        Align = alClient
        AutoScroll = False
        Constraints.MinHeight = 83
        Constraints.MinWidth = 173
        TabOrder = 0
        inherited GroupBox1: TGroupBox
          Top = 91
        end
        inherited Panel1: TPanel
          Top = 28
        end
        inherited GroupBox2: TGroupBox
          Top = 117
        end
        inherited Panel2: TPanel
          Height = 28
        end
        inherited Panel3: TPanel
          Top = 65
        end
      end
    end
    object Panel10: TPanel
      Left = 1
      Top = 207
      Width = 175
      Height = 499
      Align = alClient
      TabOrder = 2
      object PageControl1: TPageControl
        Left = 1
        Top = 29
        Width = 173
        Height = 469
        ActivePage = TabSheet1
        Align = alClient
        Constraints.MinWidth = 173
        TabOrder = 0
        OnChange = PageControl1Change
        object TabSheet1: TTabSheet
          Caption = 'Observaciones'
          inline Observations: TFrame_Observations
            Left = 0
            Top = 0
            Width = 165
            Height = 441
            Align = alClient
            TabOrder = 0
            inherited ListView1: TListView
              Width = 165
              Height = 416
            end
            inherited Panel1: TPanel
              Top = 416
              Width = 165
              inherited Button1: TButton
                Width = 165
                OnClick = ObservationsButton1Click
              end
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Usuarios'
          ImageIndex = 1
          inline Admin: TFrame_Admin
            Left = 0
            Top = 0
            Width = 165
            Height = 441
            Align = alClient
            Constraints.MinWidth = 165
            TabOrder = 0
            inherited ListView1: TListView
              Width = 165
              Height = 416
            end
            inherited Panel1: TPanel
              Top = 416
              Width = 165
              inherited Button1: TButton
                Width = 176
              end
            end
            inherited PopupMenu1: TPopupMenu
              inherited Editar1: TMenuItem
                OnClick = AdminEditar1Click
              end
            end
          end
        end
      end
      object Panel11: TPanel
        Left = 1
        Top = 1
        Width = 173
        Height = 28
        Align = alTop
        TabOrder = 1
        object Label15: TLabel
          Left = 5
          Top = 5
          Width = 115
          Height = 19
          Caption = 'Administracion'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 177
    Top = 0
    Width = 1066
    Height = 707
    Align = alClient
    BevelOuter = bvSpace
    TabOrder = 1
    object Splitter5: TSplitter
      Left = 1
      Top = 401
      Width = 1064
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Beveled = True
      ResizeStyle = rsUpdate
    end
    object Panel3: TPanel
      Left = 1
      Top = 404
      Width = 1064
      Height = 302
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1064
        Height = 122
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 122
          Align = alClient
          TabOrder = 0
          inline Observation: TFrame_Observation
            Left = 1
            Top = 1
            Width = 1062
            Height = 120
            Align = alClient
            AutoScroll = False
            TabOrder = 0
            inherited Bulb1: TBulb
              Left = 1039
            end
            inherited ProgressBar1: TProgressBar
              Top = 101
              Width = 975
            end
            inherited Edit2: TEdit
              Width = 855
            end
            inherited Button1: TButton
              Left = 989
              Top = 100
            end
            inherited ScrollBox1: TScrollBox
              Width = 1044
              Height = 49
              inherited Label2: TMemo
                Width = 1044
                Height = 49
              end
            end
          end
        end
      end
      inline Video: TFrame_Video
        Left = 0
        Top = 122
        Width = 1064
        Height = 180
        Align = alClient
        Constraints.MinHeight = 145
        Constraints.MinWidth = 385
        TabOrder = 1
        inherited Panel4: TPanel
          Width = 881
          Height = 180
          inherited Video1: TVideo
            Width = 867
            Height = 163
          end
          inherited Panel1: TPanel
            Top = 164
            Width = 879
            inherited Bulb1: TBulb
              Left = 866
            end
            inherited ScrollBar1: TScrollBar
              Width = 808
            end
          end
          inherited Panel2: TPanel
            Left = 868
            Height = 163
            inherited Label1: TLabel
              Top = 153
            end
            inherited Label2: TLabel
              Top = 143
            end
          end
        end
        inherited Panel6: TPanel
          Left = 954
          Height = 180
        end
        inherited Panel3: TPanel
          Height = 180
        end
      end
    end
    object PageControl2: TPageControl
      Left = 1
      Top = 1
      Width = 1064
      Height = 400
      ActivePage = TabSheet3
      Align = alTop
      TabOrder = 1
      OnChange = PageControl2Change
      object TabSheet3: TTabSheet
        Caption = 'Antena'
        object Panel5: TPanel
          Left = 784
          Top = 0
          Width = 272
          Height = 372
          Align = alRight
          TabOrder = 0
          inline Antenna: TFrame_Antenna
            Left = 1
            Top = 1
            Width = 270
            Height = 252
            Align = alTop
            AutoScroll = False
            Constraints.MinHeight = 240
            Constraints.MinWidth = 173
            TabOrder = 0
            inherited pnlRays: TPanel
              Width = 270
            end
            inherited Panel2: TPanel
              Width = 270
              DesignSize = (
                270
                123)
              inherited TuneGauge1: TTuneGauge
                Width = 221
              end
              inherited TuneGauge2: TTuneGauge
                Width = 221
              end
              inherited TuneGauge3: TTuneGauge
                Width = 221
              end
              inherited TuneGauge4: TTuneGauge
                Width = 221
              end
              inherited StaticText1: TStaticText
                Left = 229
              end
              inherited StaticText13: TStaticText
                Left = 229
              end
              inherited StaticText2: TStaticText
                Left = 229
              end
              inherited StaticText3: TStaticText
                Left = 229
              end
            end
            inherited Panel1: TPanel
              Width = 270
              DesignSize = (
                270
                32)
              inherited ledStatus: TLed
                Left = 249
              end
              inherited btnAcc: TButton
                Left = 145
              end
            end
            inherited Panel3: TPanel
              Width = 270
            end
          end
          inline SunPosition: TFrame_SunPosition
            Left = 1
            Top = 253
            Width = 270
            Height = 118
            Align = alClient
            Constraints.MinHeight = 116
            Constraints.MinWidth = 270
            TabOrder = 1
            inherited Image1: TImage
              Left = 143
            end
            inherited LRadarLongitude: TLabel
              Left = 181
            end
            inherited LRadarLatitude: TLabel
              Left = 181
            end
            inherited LRadarAltitude: TLabel
              Left = 181
            end
            inherited Image2: TImage
              Left = 185
            end
            inherited LSunAzimuth: TLabel
              Left = 218
            end
            inherited LSunElevation: TLabel
              Left = 218
            end
            inherited Label3: TLabel
              Left = 6
            end
            inherited CheckBox1: TCheckBox
              Left = 56
            end
            inherited SunCalcMethod: TComboBox
              Left = 54
            end
          end
        end
        object pnlMotors: TPanel
          Left = 0
          Top = 0
          Width = 784
          Height = 372
          Align = alClient
          TabOrder = 1
          object pnlMotorEl: TPanel
            Left = 393
            Top = 1
            Width = 390
            Height = 370
            Align = alRight
            TabOrder = 0
            inline MotorEl: TFrame_Motor
              Left = 1
              Top = 1
              Width = 388
              Height = 368
              Align = alClient
              Constraints.MinHeight = 270
              Constraints.MinWidth = 270
              TabOrder = 0
              inherited Panel2: TPanel
                Top = 315
                Width = 388
                inherited SpeedButton1: TSpeedButton
                  Left = 315
                end
              end
              inherited Panel1: TPanel
                Width = 388
                Height = 315
                inherited Antenna: TAntenna
                  Width = 386
                  Height = 313
                  AntennaType = at_Elevation
                end
              end
            end
          end
          object pnlMotorAz: TPanel
            Left = 1
            Top = 1
            Width = 392
            Height = 370
            Align = alClient
            TabOrder = 1
            inline MotorAz: TFrame_Motor
              Left = 1
              Top = 1
              Width = 390
              Height = 368
              Align = alClient
              Constraints.MinHeight = 270
              Constraints.MinWidth = 270
              TabOrder = 0
              inherited Panel2: TPanel
                Top = 315
                Width = 390
                inherited SpeedButton1: TSpeedButton
                  Left = 309
                end
              end
              inherited Panel1: TPanel
                Width = 390
                Height = 315
                inherited Antenna: TAntenna
                  Width = 388
                  Height = 313
                end
              end
            end
          end
        end
      end
      object TxsRxsSheet: TTabSheet
        Caption = 'TxsRxs'
        ImageIndex = 1
        object pnlTxRx1: TPanel
          Left = 0
          Top = 0
          Width = 489
          Height = 372
          Align = alLeft
          TabOrder = 0
          inline TxRx1: TFrame_TxRx_Calibration
            Left = 1
            Top = 1
            Width = 487
            Height = 370
            Align = alClient
            Constraints.MinHeight = 362
            Constraints.MinWidth = 487
            TabOrder = 0
            inherited PageControl1: TPageControl
              Height = 340
              inherited TabSheet1: TTabSheet
                inherited Tx: TFrame_Tx
                  Height = 312
                  inherited Panel3: TPanel
                    Height = 215
                    inherited Panel1: TPanel
                      Height = 213
                    end
                    inherited GroupBox2: TGroupBox
                      Height = 213
                      inherited Synchro: TFrame_Synchro
                        Height = 196
                      end
                    end
                  end
                end
              end
            end
          end
        end
        object pnlTxRx2: TPanel
          Left = 489
          Top = 0
          Width = 567
          Height = 372
          Align = alClient
          TabOrder = 1
          inline TxRx2: TFrame_TxRx_Calibration
            Left = 1
            Top = 1
            Width = 565
            Height = 370
            Align = alClient
            Constraints.MinHeight = 362
            Constraints.MinWidth = 487
            TabOrder = 0
            inherited PageControl1: TPageControl
              Width = 565
              Height = 340
              inherited TabSheet1: TTabSheet
                inherited Tx: TFrame_Tx
                  Width = 557
                  Height = 312
                  inherited Panel2: TPanel
                    Width = 557
                    inherited GroupBox5: TGroupBox
                      Width = 452
                    end
                    inherited GroupBox1: TGroupBox
                      Left = 453
                    end
                  end
                  inherited Panel3: TPanel
                    Width = 557
                    Height = 215
                    inherited Panel1: TPanel
                      Width = 416
                      Height = 213
                      inherited Label28: TLabel
                        Left = 394
                      end
                      inherited Label27: TLabel
                        Left = 394
                      end
                      inherited Label26: TLabel
                        Left = 394
                      end
                      inherited Label25: TLabel
                        Left = 394
                      end
                      inherited Label24: TLabel
                        Left = 394
                      end
                      inherited Label23: TLabel
                        Left = 394
                      end
                      inherited Label22: TLabel
                        Left = 394
                      end
                      inherited Label17: TLabel
                        Left = 394
                      end
                      inherited Label15: TLabel
                        Left = 394
                      end
                      inherited TuneGauge9: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge8: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge7: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge6: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge4: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge3: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge2: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge10: TTuneGauge
                        Width = 262
                      end
                      inherited TuneGauge1: TTuneGauge
                        Width = 262
                      end
                      inherited StaticText1: TStaticText
                        Left = 353
                      end
                      inherited StaticText9: TStaticText
                        Left = 353
                      end
                      inherited StaticText8: TStaticText
                        Left = 353
                      end
                      inherited StaticText7: TStaticText
                        Left = 353
                      end
                      inherited StaticText6: TStaticText
                        Left = 353
                      end
                      inherited StaticText5: TStaticText
                        Left = 353
                      end
                      inherited StaticText3: TStaticText
                        Left = 353
                      end
                      inherited StaticText2: TStaticText
                        Left = 353
                      end
                      inherited StaticText13: TStaticText
                        Left = 353
                      end
                    end
                    inherited GroupBox2: TGroupBox
                      Left = 417
                      Height = 213
                      inherited Synchro: TFrame_Synchro
                        Height = 196
                      end
                    end
                  end
                end
              end
            end
            inherited Panel6: TPanel
              Width = 565
            end
          end
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Configuracion'
        ImageIndex = 2
        inline Configuration: TFrame_Configuration
          Left = 0
          Top = 0
          Width = 1056
          Height = 372
          Align = alClient
          Constraints.MinHeight = 329
          Constraints.MinWidth = 757
          TabOrder = 0
          inherited Panel1: TPanel
            Top = 341
            Width = 1056
            inherited Button2: TButton
              Left = 904
            end
            inherited Button1: TButton
              Left = 974
            end
          end
          inherited PageControl1: TPageControl
            Width = 1056
            Height = 341
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Registros'
        ImageIndex = 3
        inline Frame_Logs: TFrame_Logs
          Left = 0
          Top = 0
          Width = 1056
          Height = 372
          Align = alClient
          TabOrder = 0
          inherited Label1: TLabel
            Top = 341
          end
          inherited Button1: TButton
            Left = 976
            Top = 341
          end
          inherited ScrollBox1: TScrollBox
            Width = 1056
            Height = 322
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Reportes'
        ImageIndex = 4
        inline StatisticsView: TFrame_Statistics
          Left = 0
          Top = 0
          Width = 1056
          Height = 372
          Align = alClient
          PopupMenu = StatisticsView.PopupMenu1
          TabOrder = 0
        end
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 50
    OnTimer = RefreshRadar
    Left = 44
    Top = 559
  end
  object MainMenu1: TMainMenu
    Images = ImageList2
    Left = 4
    Top = 8
    object Cliente1: TMenuItem
      Caption = '&Cliente'
      object Creditos1: TMenuItem
        Caption = '&Creditos...'
        ImageIndex = 13
        OnClick = Creditos1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Terminar1: TMenuItem
        Caption = 'Terminar'
        ShortCut = 32856
        OnClick = Terminar1Click
      end
    end
    object RDA1: TMenuItem
      Caption = '&RDA'
      object iempoReal1: TMenuItem
        Caption = 'Tiempo Real Ch1'
        ShortCut = 16449
        OnClick = iempoReal1Click
      end
      object iempoRealCh21: TMenuItem
        Caption = 'Tiempo Real Ch2'
        ShortCut = 16450
        OnClick = iempoRealCh21Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Refrescar1: TMenuItem
        Caption = '&Refrescar'
        Checked = True
        ShortCut = 16466
        OnClick = Refrescar1Click
      end
      object Actualizar1: TMenuItem
        Caption = 'Actualizar'
        ShortCut = 49217
        OnClick = Actualizar1Click
      end
      object Version1: TMenuItem
        Caption = 'Version'
        OnClick = Version1Click
      end
    end
  end
  object ImageList2: TImageList
    Left = 203
    Top = 373
    Bitmap = {
      494C010110001400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600000000000000000000000000C6C6C600C6C6C6000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B0000000000000000007B7B7B007B7B7B007B7B7B000000
      0000BDBDBD00FFFFFF000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B7B00000000007B7B7B007B7B7B007B7B7B0000000000BDBDBD00BDBD
      BD00BDBDBD00FFFFFF000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      000000000000000000000084840000848400008484000000000000000000C6C6
      C600C6C6C60000000000000000000000000000000000BDBDBD007B7B7B000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00000000007B7B7B007B7B7B007B7B7B0000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF0000000000
      00000000000000000000000000000000000000000000C6C6C600C6C6C6000000
      0000008484000084840000848400008484000084840000848400000000000000
      0000C6C6C60000000000000000000000000000000000BDBDBD007B7B7B000000
      00000000000000000000BDBDBD000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD007B7B7B007B7B7B0000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FFFFFF00FFFFFF00FF000000FF000000FF0000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000008484000084840000848400008484000084840000848400008484000000
      0000C6C6C60000000000000000000000000000000000BDBDBD007B7B7B000000
      00000000000000000000BDBDBD000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B0000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FFFFFF00FFFFFF00FF000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000C6C6C6000084840000848400008484000084840000848400008484000000
      0000C6C6C60000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B7B0000000000BDBDBD0000000000BDBDBD00BDBDBD00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000848400C6C6C60000848400008484000084840000848400000000000000
      0000C6C6C600000000000000000000000000000000000000000000000000BDBD
      BD007B7B7B0000000000000000000000000000000000BDBDBD007B7B7B000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000BDBDBD00BDBDBD00BDBDBD0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      00000000000000848400C6C6C600C6C6C6000084840000848400000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000007B7B
      7B0000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00FFFFFF000000000000000000FFFFFF00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000007B7B
      7B0000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B0000007B00000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF000000000000000000000000000000000000FFFF00FFFFFF00BDBDBD00BDBD
      BD00BDBDBD0000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000007B007B7B7B00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007B0000007B0000007B0000007B0000007B
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000000000000000000000000000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF0000007B0000007B0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      7B0000007B0000007B00007B0000007B0000007B0000007B0000007B0000007B
      0000007B000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF00000000000000000000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000007B000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000007B0000000000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B00000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      7B00000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000007B00007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000007B00007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000000000FFFFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000007B7B00007B7B00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000007B00007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000007B7B00007B7B00007B7B00007B7B00000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B0000007B0000000000007B000000000000FFFFFF00007B0000007B0000007B
      0000007B0000007B00000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD000000000000FFFF0000FFFF00000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00007B7B00007B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000007B00FFFFFF000000
      000000007B0000000000007B0000007B0000FFFFFF0000000000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00007B7B00007B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000007B0000000000FFFF
      FF0000007B0000007B0000000000007B0000007B000000000000007B0000007B
      0000007B00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00000000000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00007B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      00000000000000007B0000007B000000000000000000007B0000007B00000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007B0000007B0000007B0000007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      000000FF000000FF000000FF000000FF000000FF0000000000000000000000FF
      000000FF00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF00000000000000000000BDBDBD000000000000FF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00BDBDBD00FFFFFF00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00BDBDBD00FFFFFF00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00000000000000000000000000000000000000000000000000BDBD
      BD0000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000007B0000007B0000007B0000000000000000000000
      0000BDBDBD000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000007B0000007B0000007B0000000000000000000000
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000007B007B000000000000000000000000007B007B00FF000000FF00
      0000FF000000FF000000FF000000FF0000000000000000000000BDBDBD000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      0000BDBDBD00BDBDBD0000000000000000000000000000000000BDBDBD000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      0000BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000007B00
      7B00000000007B007B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      000000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      000000000000BDBDBD0000000000000000000000000000000000BDBDBD000000
      000000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      000000000000BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00FFFFFF00BDBDBD00FFFFFF00BDBD
      BD000000000000000000000000000000000000000000000000007B007B007B00
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      000000007B00BDBDBD0000007B0000007B0000007B0000007B0000007B000000
      000000000000BDBDBD0000000000000000000000000000000000BDBDBD000000
      000000007B00BDBDBD0000007B0000007B0000007B0000007B0000007B000000
      000000000000BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00BDBDBD00FFFFFF00BDBDBD00FFFF
      FF00BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      000000000000BDBDBD0000007B0000007B0000007B0000007B0000007B000000
      000000000000BDBDBD0000000000000000000000000000000000BDBDBD000000
      000000000000BDBDBD0000007B0000007B0000007B0000007B0000007B000000
      000000000000BDBDBD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00BDBDBD00FFFFFF00FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      00000000000000007B00BDBDBD00BDBDBD00BDBDBD0000007B00000000000000
      0000BDBDBD000000000000000000000000000000000000000000FFFFFF000000
      00000000000000007B00BDBDBD00BDBDBD00BDBDBD0000007B00000000000000
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00BDBDBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B007B007B007B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00000000000000000000000000000000000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00FFFFFF000000000000000000000000000000000000000000000000000000
      00007B007B00000000007B007B007B007B000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00BDBDBD000000000000000000000000000000000000000000BDBDBD00BDBD
      BD0000000000000000000000000000000000000000000000000000000000FFFF
      FF00BDBDBD000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B007B00000000007B007B007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B007B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF007B7B0000FFFFFF007B7B00007B7B000000FFFF000000
      0000000000000000000000000000000000000000FF0000FF00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      000000FFFF000000000000000000000000007B7B00000000FF007B7B000000FF
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00007B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00000000FF0000FFFF0000000000000000007B7B00007B7B00007B7B00007B7B
      00007B7B000000FF00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF0000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B0000000000000000000000000000000000000000000000FF
      FF00007B7B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00000000
      FF007B7B00007B7B000000000000000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FF00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF0000000000BDBDBD0000FFFF0000FF
      FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF00007B7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00000000FF007B7B
      00007B7B00007B7B000000FFFF00000000007B7B00007B7B00007B7B00000000
      FF007B7B00007B7B00007B7B00007B7B00007B7B000000FF00007B7B00007B7B
      00007B7B00007B7B00007B7B00000000000000000000BDBDBD007B7B00000000
      FF007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B000000FF
      FF007B7B00007B7B000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF00007B7B00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00000000FF007B7B00007B7B
      00007B7B00007B7B00007B7B0000000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FF
      00007B7B00007B7B0000FFFFFF000000000000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00007B7B000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF000000FF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FF0000000000000000000000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00007B7B00007B7B0000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B00007B7B00007B7B00007B7B
      00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B0000FFFFFF00000000000000000000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B000000FFFF000000FF007B7B00007B7B00007B7B00000000
      FF007B7B00007B7B000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF00007B7B000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000000000000000000000000000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B000000FFFF000000FF007B7B00007B7B00000000FF007B7B
      00007B7B00007B7B000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF00007B7B0000000000000000000000
      000000000000000000000000000000000000000000007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF0000FF00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF00000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000FFFFFF0000000000000000000000000000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF00007B7B00000000000000
      000000000000000000000000000000000000000000007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF00000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B000000FF
      FF000000000000000000000000000000000000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00007B7B000000
      00000000000000000000000000000000000000000000000000007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B000000FF00007B7B00007B7B
      00007B7B000000FFFF0000000000000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00000000FF0000FFFF00FFFFFF000000
      00000000000000000000000000000000000000000000BDBDBD007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B
      7B00000000000000000000000000000000000000000000000000FFFFFF007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00000000000000000000000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007B7B000000000000000000000000000000000000000000000000000000
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B000000FF0000FFFF
      FF00000000000000000000000000000000007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00007B7B0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000007B7B000000FFFF007B7B000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFE00FFFFFFFFFFFFFE00FFFFFFFFF
      07C1F87FC007F03F07C1F0FFC007E00F07C1E003E00FC0070101C003E00F8007
      0001C003F01F80030001F007F01F80030001E00FF83F80038003E01FF83F8003
      C107E03FFC7F8007C107C03FFC7FC007E38FC0CFFEFFC00FE38FC1EFFEFFE01F
      FFFFC3FFFFFFF87FFFFFFFFFFFFFFFFFFFFFFFEF83FFFFFFFFDFF6C781FFFFFF
      FB9FE08381FFC00FFFBFC0138103C00FF20FC4078101C00FF007C64F8183C00F
      C003C03FC187C00F8001C00FFFCFC00F8001E007FCDFC00F0001FC03F07FC00F
      0001F467F03FC00F0001E063E03FC00F0001C007E07FC01F8003880FF07FC03F
      8007C35FF9FFFFFFC07FE7FFFFFFFFFFFFFFFFFFE007FF7FFFFFFFFFE007FF7F
      F81FF81FF00FFFFFE00FE00FF81FFFFFC007C007F80FFFC3C003C003F007FB80
      80038003E007EBFF80038003E007CFFF80038003E003FEFF80038003E007FEFF
      C003C003E007FCFFC007C007E003F4FFE007E007F003F4FFF00FF00FF003F7FF
      FC3FFC3FF80FFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFBFFFF01F0000FFFF
      9FFFE0070000FFFFCFFFC00300008003C7FF800300008003E3FF800100018003
      E1FF000100018003E0FF000100038003E07F000100038003F0FF000100078003
      F07F800100078003F83F8001000F8003F81FC003001F8003FC0FC007007F8003
      FC07F00F00FFFFFFFE03FC3F03FFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList1: TImageList
    Height = 32
    Width = 32
    Left = 222
    Top = 397
    Bitmap = {
      494C010110001400040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000080000000A000000001002000000000000040
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00BDBDBD007B7B
      7B007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD007B7B7B007B7B7B007B7B
      7B007B7B7B00000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD007B7B7B007B7B7B007B7B7B000000
      000000000000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FFFFFF00FF000000FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD007B7B7B007B7B7B00000000000000
      00007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000084840000848400008484000084840000848400008484000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD007B7B7B007B7B7B0000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFFFF00FFFF
      FF00FF000000FF000000FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600000000000000000000000000000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000000000000000000000000000000000C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000007B7B7B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD007B7B7B0000000000000000007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000007B7B7B0000000000000000000000000000000000000000000000
      000000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B000000000000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000007B7B7B0000000000000000000000000000000000000000000000
      000000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD007B7B7B007B7B
      7B007B7B7B007B7B7B000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C60000000000000000000000000000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000007B7B7B0000000000000000000000000000000000000000000000
      000000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD007B7B7B007B7B
      7B007B7B7B000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C60000000000000000000000000000848400C6C6C6000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000007B7B7B0000000000000000000000000000000000000000000000
      000000000000BDBDBD000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD007B7B7B007B7B7B007B7B
      7B000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C60000000000000000000000000000848400C6C6C600C6C6
      C600008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD007B7B7B007B7B7B000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000FF000000FF000000FF000000FFFFFF00FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C60000000000000000000000000000848400C6C6C600C6C6
      C600008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000848400000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD007B7B7B00000000000000
      0000BDBDBD00BDBDBD000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C6000000000000000000000000000000000000848400C6C6
      C600C6C6C6000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD000000000000000000BDBDBD00BDBDBD00BDBD
      BD00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600000000000000000000000000008484000084
      8400C6C6C600C6C6C60000848400008484000084840000848400008484000084
      84000084840000848400000000000000000000000000C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000BDBDBD00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600000000000000000000000000000000000084
      840000848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600008484000084
      84000084840000000000000000000000000000000000C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD0000000000BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C6000000000000000000000000000000
      0000000000000084840000848400008484000084840000848400008484000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD0000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD0000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF000000FF000000FF000000FF000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF000000FF000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00BDBDBD00BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      0000000000007B7B7B007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B7B0000FFFF000000
      0000000000000000000000FFFF00007B7B000000000000000000000000000000
      0000BDBDBD00BDBDBD00000000000000000000000000BDBDBD00BDBDBD000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00007B000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00007B7B0000FF
      FF00007B7B0000FFFF00007B7B0000FFFF000000000000000000000000000000
      0000BDBDBD00000000000000000000000000FFFFFF0000000000BDBDBD000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00007B000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF00007B7B0000FFFF00007B
      7B0000FFFF00007B7B0000FFFF00007B7B0000FFFF000000000000000000BDBD
      BD00BDBDBD000000000000000000000000000000000000000000BDBDBD00BDBD
      BD0000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00007B000000000000007B7B7B0000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B0000FFFF00007B7B0000FFFF00007B7B000000
      00000000000000000000007B7B0000FFFF00007B7B0000FFFF00007B7B000000
      0000BDBDBD000000000000000000000000000000000000000000BDBDBD000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00007B000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B007B7B7B000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00007B7B0000FFFF00007B7B00000000000000
      000000000000FFFFFF0000000000007B7B0000FFFF00007B7B0000FFFF000000
      0000BDBDBD00BDBDBD00000000000000000000000000BDBDBD00BDBDBD000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00007B000000000000007B7B7B0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF00000000000000
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000FFFF00007B7B0000000000000000000000
      00000000000000000000FFFFFF0000000000007B7B0000FFFF0000000000FFFF
      FF0000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00007B000000000000007B7B7B000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000000000007B000000
      7B00000000007B7B7B007B7B7B00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007B7B0000FFFF0000000000000000000000
      00000000000000000000000000000000000000FFFF00007B7B00000000000000
      0000FFFFFF000000000000000000BDBDBD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00007B000000000000007B7B7B000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000000000007B000000
      7B0000007B000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00007B7B0000000000000000000000
      000000000000000000000000000000000000007B7B0000FFFF00000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B000000000000007B7B7B00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000007B0000007B000000
      7B00000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000007B0000007B000000
      7B000000000000000000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00007B7B0000FFFF00007B7B00000000000000
      0000000000000000000000000000007B7B0000FFFF00007B7B0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      000000000000000000007B7B7B00000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000007B0000007B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000007B0000007B0000007B0000007B000000
      7B0000000000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B0000FFFF00007B7B0000FFFF00007B7B000000
      00000000000000000000007B7B0000FFFF00007B7B0000FFFF00007B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000007B0000007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000007B0000007B0000007B0000007B0000007B000000
      000000000000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000FFFF00007B7B0000FFFF00007B
      7B0000FFFF00007B7B0000FFFF00007B7B0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000000000007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000FFFF00007B7B0000FF
      FF00007B7B0000FFFF00007B7B0000FFFF000000000000FFFF00007B7B000000
      00000000000000000000007B7B0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000000000007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B00000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B7B0000FFFF000000
      0000000000000000000000FFFF000000000000000000007B7B0000FFFF00007B
      7B0000FFFF00007B7B0000FFFF00007B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007B0000007B0000007B0000007B0000007B0000007B0000000000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      000000000000FFFFFF000000000000000000007B7B0000FFFF00007B7B0000FF
      FF00007B7B0000FFFF00007B7B0000FFFF00007B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B007B7B7B007B7B7B007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000000000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00007B7B0000FFFF00007B7B0000FFFF000000
      0000000000000000000000FFFF00007B7B0000FFFF00007B7B0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000007B7B7B007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000000000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000007B7B0000FFFF00007B7B0000FFFF00000000000000
      000000000000FFFFFF000000000000FFFF00007B7B0000FFFF00007B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007B
      7B0000FFFF00007B7B00007B7B0000000000000000007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000000000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000007B7B0000FFFF0000000000000000000000
      00000000000000000000FFFFFF000000000000FFFF00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00007B7B0000FF
      FF00007B7B0000FFFF00007B7B00007B7B00007B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000000000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF00007B7B0000000000000000000000
      000000000000000000000000000000000000007B7B0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000007B7B0000FFFF00007B
      7B0000FFFF00007B7B0000FFFF00007B7B00007B7B00000000007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00000000007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000000000007B
      0000007B0000007B0000007B0000000000000000000000000000007B0000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B0000007B000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BDBDBD00000000000000
      0000000000000000000000000000007B7B0000FFFF0000000000000000000000
      00000000000000000000000000000000000000FFFF00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007B7B0000FFFF00007B7B00007B7B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B00000000000000
      0000007B0000007B0000007B000000000000FFFFFF00FFFFFF0000000000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD000000000000000000007B7B0000FFFF00007B7B0000FFFF00000000000000
      000000000000000000000000000000FFFF00007B7B0000FFFF00007B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00007B7B0000FFFF00007B7B00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000000000000000000000000000007B0000007B0000007B0000007B000000
      0000007B0000007B0000007B0000007B000000000000FFFFFF0000000000007B
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000007B00000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00000000000000000000000000BDBD
      BD00BDBDBD000000000000FFFF00007B7B0000FFFF00007B7B0000FFFF000000
      0000000000000000000000FFFF00007B7B0000FFFF00007B7B0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF00007B7B0000FFFF00000000007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007B000000
      7B0000000000FFFFFF00FFFFFF000000000000007B0000007B0000007B000000
      000000000000007B0000007B0000007B000000000000FFFFFF00FFFFFF000000
      0000007B0000007B0000007B0000007B0000007B0000007B0000007B0000007B
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00000000000000000000000000FFFFFF000000
      0000BDBDBD00000000000000000000000000007B7B0000FFFF00007B7B0000FF
      FF00007B7B0000FFFF00007B7B0000FFFF00007B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF0000FFFF00007B7B0000FFFF00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7B0000007B0000000000FFFFFF000000000000007B0000007B0000007B000000
      7B000000000000000000007B0000007B0000007B000000000000FFFFFF00FFFF
      FF0000000000007B0000007B0000007B0000007B0000007B0000007B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00000000000000000000000000000000000000
      0000BDBDBD00BDBDBD0000000000FFFFFF0000000000007B7B0000FFFF00007B
      7B0000FFFF00007B7B0000FFFF00007B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF0000FFFF0000FFFF00007B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7B0000007B0000000000FFFFFF00FFFFFF000000000000007B0000007B000000
      7B0000007B000000000000000000007B0000007B0000007B0000000000000000
      000000000000007B0000007B0000007B0000007B0000007B0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000000000000000000000000000000000
      0000BDBDBD000000000000000000000000000000000000FFFF00007B7B000000
      00000000000000000000007B7B0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00007B7B0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007B0000007B0000000000FFFFFF00FFFFFF000000000000007B000000
      7B0000007B0000007B000000000000000000007B0000007B0000007B0000007B
      0000007B0000007B0000007B0000007B0000007B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00000000000000000000000000BDBD
      BD00BDBDBD00000000000000000000000000FFFFFF0000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007B0000007B0000000000000000000000000000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000007B0000007B
      0000007B0000007B0000007B0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000007B0000007B0000007B000000
      7B0000007B0000007B0000007B0000007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FF000000FF000000FF000000FF000000FF000000FF
      000000FF000000FF000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000FF000000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF000000FF000000FF000000FF
      000000FF000000FF000000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000FF000000FF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      00000000000000000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      00000000000000000000FF000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      00000000000000000000FF000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      00000000000000000000FF000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      000000000000FF00000000000000FF00000000000000FF00000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      7B00000000000000000000000000000000007B007B0000000000000000007B00
      7B0000000000FF00000000000000FF00000000000000FF00000000000000FF00
      000000000000FF00000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      7B00000000000000000000000000000000007B007B0000000000000000007B00
      7B0000000000FF00000000000000FF00000000000000FF00000000000000FF00
      000000000000FF00000000000000FF0000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00000000000000000000000000000000000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000000000000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00000000000000000000000000000000000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000000000000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      7B00000000000000000000000000000000007B007B0000000000000000007B00
      7B0000000000FF00000000000000FF00000000000000FF000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD0000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B00000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD00BDBDBD0000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B00000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B007B000000000000000000000000007B00
      7B00000000000000000000000000000000007B007B0000000000000000000000
      0000FF000000000000000000000000000000FF00000000000000000000000000
      0000FF00000000000000FF000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD000000000000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD000000000000000000000000000000000000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B007B000000000000000000000000007B00
      7B00000000000000000000000000000000007B007B0000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD0000000000000000000000000000007B0000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD0000000000000000000000000000007B0000007B000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B007B00000000007B007B0000000000000000007B007B000000
      00007B007B000000000000000000000000007B007B0000000000000000000000
      000000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD0000000000000000000000000000007B00BDBDBD000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD0000000000000000000000000000007B00BDBDBD000000
      7B0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000007B007B007B007B00000000007B00
      7B00000000007B007B00000000007B007B0000000000000000007B007B000000
      00007B007B0000000000000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD0000000000000000000000000000007B00BDBDBD00BDBD
      BD0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD0000000000000000000000000000007B00BDBDBD00BDBD
      BD0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBDBD00000000000000
      00000000000000000000000000000000000000000000000000007B007B000000
      00007B007B00000000007B007B00000000007B007B00000000007B007B000000
      00007B007B0000000000000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD0000000000000000000000000000007B00BDBDBD00BDBD
      BD0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD0000000000000000000000000000007B00BDBDBD00BDBD
      BD0000007B0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000007B00000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBDBD00FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00FFFFFF00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B007B00000000007B007B00000000007B007B000000
      00007B007B0000000000000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD000000000000000000000000000000000000007B00BDBD
      BD00BDBDBD0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD000000000000000000000000000000000000007B00BDBD
      BD00BDBDBD0000007B0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B0000000000000000000000000000000000BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF00FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      00007B007B0000000000000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD00BDBDBD0000000000000000000000000000007B000000
      7B00BDBDBD00BDBDBD0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B00000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00BDBDBD00BDBDBD0000000000000000000000000000007B000000
      7B00BDBDBD00BDBDBD0000007B0000007B0000007B0000007B0000007B000000
      7B0000007B0000007B00000000000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00FFFFFF00FFFFFF00FF000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      00007B007B0000000000000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00BDBDBD00000000000000000000000000000000000000
      7B0000007B00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000007B000000
      7B0000007B0000000000000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00BDBDBD00000000000000000000000000000000000000
      7B0000007B00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD0000007B000000
      7B0000007B0000000000000000000000000000000000BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B007B00000000007B007B000000
      0000000000007B007B00000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00BDBDBD00BDBDBD000000000000000000000000000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00BDBDBD00BDBDBD000000000000000000000000000000
      00000000000000007B0000007B0000007B0000007B0000007B0000007B000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000007B007B00000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000007B007B00000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD00BDBDBD00BDBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BDBDBD00BDBDBD00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000007B007B00000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00BDBDBD00BDBDBD00BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDBDBD00BDBDBD00BDBDBD00BDBDBD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000007B007B00000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00BDBDBD00BDBD
      BD00BDBDBD00000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      0000000000007B007B00000000007B007B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B007B00000000000000
      000000000000000000007B007B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00BDBDBD00FFFFFF00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B007B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B007B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B007B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B007B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FF0000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FF000000FF00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000007B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      0000FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000FF007B7B000000FF
      000000FF00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00000000FF007B7B
      00007B7B000000FF000000FF00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00007B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B0000FFFFFF0000FFFF00000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00000000
      FF007B7B00007B7B00007B7B000000FF000000FF00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00007B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00000000
      FF007B7B00007B7B00007B7B00007B7B00007B7B000000FF000000FF00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF0000FFFF00000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF00007B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF007B7B000000FF
      FF0000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FF
      000000FF00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF00000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF00007B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00000000FF007B7B00007B7B0000FFFF
      FF0000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FF000000FF00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF00000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      000000FFFF00000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FF000000FF00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF00000000000000000000000000BDBD
      BD0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FFFF0000FF
      FF00BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00007B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B0000FFFFFF000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B000000FF000000FF00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF0000FFFF0000000000000000000000000000000000BDBD
      BD000000FF000000FF007B7B00007B7B00000000FF000000FF000000FF000000
      FF000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B000000FFFF000000FF000000FF000000
      FF00BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00007B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FF
      000000FF00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF0000000000000000000000000000000000BDBD
      BD007B7B00007B7B00000000FF000000FF007B7B00007B7B000000FFFF007B7B
      00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF000000FF007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00007B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B0000FFFFFF000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FF000000FF00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B0000FFFFFF0000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FF
      FF007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF000000FF007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00007B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00000000
      FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FF000000FF00007B7B00007B7B00007B7B
      00007B7B0000FFFFFF000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      000000FFFF007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00000000FF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B0000FFFFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B000000FF000000FF00007B7B
      000000FFFF0000FFFF000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      000000FFFF007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00007B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00000000FF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FF
      000000FF0000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      000000FFFF007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF000000FF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B0000FFFFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000FFFFFF00000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007B7B00007B7B00007B7B00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000FF0000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00000000
      FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B0000FFFF
      FF0000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF000000FF007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF0000FF00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B0000FFFFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FFFF0000FF
      FF0000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00007B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF0000FF00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FFFF000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF007B7B00000000FF007B7B00007B7B00000000FF007B7B
      00007B7B00000000FF0000FFFF007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B000000FF00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B0000FFFFFF0000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B0000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF007B7B00007B7B00000000FF000000FF007B7B00000000
      FF000000FF007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B000000FF00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B0000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B000000FF00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B0000FFFFFF000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF0000FFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B000000FF00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B000000FFFF000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B
      000000FFFF007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00007B7B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B000000FF
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000FFFFFF00000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00000000FF007B7B00007B7B00007B7B
      00007B7B00007B7B0000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF007B7B000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00007B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B000000FF
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FF
      FF0000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF007B7B000000FF
      FF007B7B0000FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF00007B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      000000FF00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B0000FFFF
      FF0000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF007B7B000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF00007B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      000000FF00007B7B00007B7B00007B7B00007B7B00007B7B000000FFFF000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B000000FF00007B7B00007B7B000000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B000000FFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00007B7B
      00007B7B000000FF00007B7B0000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B
      00007B7B00007B7B0000FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF007B7B00007B7B00007B7B0000FFFFFF007B7B00007B7B00007B7B00000000
      000000FFFF00FFFFFF0000FF0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B00007B7B
      00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B00007B7B000000FF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007B
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF007B7B00007B7B000000FF
      FF0000FFFF007B7B00007B7B000000FFFF0000FFFF00FFFFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF0000FF
      FF0000FFFF00FFFFFF00FFFFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000A00000000100010000000000000A00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFC00007FFFFFFFFFFFFFFFFF
      FFFFFFFFF800003FFFFFFFFFFFFFFFFFFFFFFFFFFC00007FFFFFFFFFFFFFFFFF
      FFFFFFFFFE0000FFFFFFFFFFFFF00FFF803FF803FFE03FFFF000001FFFC003FF
      803FF803FFC07FFFF000001FFF0000FF803FF803FF80FFFFF800003FFE00007F
      803FF803FF01800FF800003FFC00003F803FF803FE000007FC00007FF800001F
      80038003FC000007FC00007FF800001F80038003F8000007FE0000FFF000000F
      80038003F800000FFE0000FFF000000F80000003F800000FFF0001FFE0000007
      80000003FC00001FFF0001FFE000000780000003FF00003FFF8003FFE0000007
      80000003FE00003FFF8003FFE000000780000003FE00007FFFC007FFE0000007
      C0000007FE0000FFFFC007FFE0000007C0000007FC0001FFFFE00FFFE0000007
      C0000007FC0003FFFFE00FFFE0000007F803803FFC0007FFFFF01FFFF000000F
      F803803FF8000FFFFFF01FFFF000000FF803803FF8000FFFFFF83FFFF800001F
      F803803FF80020FFFFF83FFFF800001FFC07C07FF800707FFFFC7FFFFC00003F
      FC07C07FF800F87FFFFC7FFFFE00007FFC07C07FF801FC7FFFFEFFFFFF0000FF
      FC07C07FF803FFFFFFFEFFFFFFC003FFFFFFFFFFF80FFFFFFFFFFFFFFFF00FFF
      FFFFFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FFFFFFFEFFE007FFFFFFFFFFFF
      FFF7F7FFFFFFF83FC003FFFFFFFFFFFFFFF7FBFFFF9CF01FC001FFFFFFFFFFFF
      FFF7FBFFFF00600FC001FFFFFFFFFFFFFFE7C3FFFE00400FC001FFFFF800007F
      FFCFC3FFFC000307C001800FF000007FFFDFE7FFF800030FC0010007F000007F
      FF8781FFF000000FC0010003F000007FFF86007FF038001FC0018001F000007F
      FFCC003FF83C003FC0018003F000007FFF00001FF83C107FC001C007F000007F
      FC00000FF81C0DFFE001C00FF000007FF8000007F0000FFFF003E01FF000007F
      F0000003F0001CFFFFFFE03FF000007FE0000003F800007FFFFFF07FF000007F
      E0000001FE00007FFFFFF0FFF000007FC0000001FE00001FFFF0F9FFF000007F
      80000001FF38000FFFC03FFFF000007F80000001FFF0000FFF801FFFF000007F
      80000001FFF0381FFF001FFFF000007F80000001FFB83C1FFF000FFFF000007F
      80000001FE083C1FFE000FFFF000007F80000001FC001C0FFE000FFFF00000FF
      80000003F800000FFE000FFFF00001FF80000003F000001FFE001FFFF00003FF
      80000007F0C0003FFF001FFFF00007FFC000000FE0C2007FFF003FFFF0000FFF
      C000001FF00200FFFF807FFFF0001FFFE000003FF00739FFFFE1FFFFFFFFFFFF
      F00000FFF80FFFFFFFFFFFFFFFFFFFFFF8003FFFFC1FFFFFFFFFFFFFFFFFFFFF
      FE00FFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00003FFFFFBFFF
      FFFFFFFFFFFFFFFFFC00003FFFFFBFFFFFFFFFFFFFFFFFFFFC00003FFFFFBFFF
      FFF00FFFFFF00FFFFC00003FFFFFBDFFFFC003FFFFC003FFFF0000FFFFFF5DFF
      FF0000FFFF0000FFFF0000FFFFFF5DDFFE00007FFE00007FFFC003FFFFFF5DDF
      FC00003FFC00003FFFC003FFFFFF5DDFF800001FF800001FFFC000FFFFFF5AAF
      F800001FF800001FFFC000FFFFEF6AABF000000FF000000FFF00003FFFEF6AAA
      F000000FF000000FFF00003FFFEF6AB5E0000007E0000007FC00003FFEEF7775
      E0000007E0000007FC00003FFEEF7F77E0000007E0000007FC00003FFAD77F7F
      E0000007E0000007FC00003F2AD6FFFFE0000007E0000007FC00000FD556FFFF
      E0000007E0000007FC00000FFD56FFFFE0000007E0000007FC00003FFF56FFFF
      E0000007E0000007FC00003FFF56FFFFF000000FF000000FFC00003FFF5AFFFF
      F000000FF000000FFC00003FFFBAFFFFF800001FF800001FFC00000FFFBAFFFF
      F800001FF800001FFC00000FFFBAFFFFFC00003FFC00003FFF00000FFFBAFFFF
      FE00007FFE00007FFF00000FFFBAFFFFFF0000FFFF0000FFFF00000FFFBDFFFF
      FFC003FFFFC003FFFF00000FFFFDFFFFFFF00FFFFFF00FFFFFC000FFFFFDFFFF
      FFFFFFFFFFFFFFFFFFC000FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF
      CFFFFFFFFFF00FFF00000000FFFFFFFFC7FFFFFFFF8001FF00000000FFFFFFFF
      E3FFFFFFFF0000FF00000000FFFFFFFFE1FFFFFFFC00003F00000000FFFFFFFF
      F0FFFFFFF800001F00000000E0000007F07FFFFFF000000F00000000E0000007
      F83FFFFFF000000F00000000E0000007F81FFFFFE000000700000000E0000007
      FC0FFFFFC000000300000001E0000007FC07FFFFC000000300000001E0000007
      FE03FFFFC000000300000001E0000007FE01FFFF8000000100000003E0000007
      FF00FFFF8000000100000003E0000007FC007FFF8000000100000007E0000007
      FC003FFF8000000100000007E0000007FE001FFF800000010000000FE0000007
      FE000FFF800000010000000FE0000007FF007FFF800000010000001FE0000007
      FF003FFF800000010000003FE0000007FF801FFFC00000030000003FE0000007
      FF800FFFC00000030000007FE0000007FFC007FFC0000003000000FFE0000007
      FFC003FFE0000007000001FFE0000007FFE001FFF000000F000003FFE0000007
      FFE000FFF000000F000007FFE0000007FFF0007FF800001F00001FFFE0000007
      FFF0003FFC00003F00003FFFFFFFFFFFFFF8001FFF0000FF0000FFFFFFFFFFFF
      FFF8000FFF8011FF0003FFFFFFFFFFFFFFFC0007FFF00FFF000FFFFFFFFFFFFF
      FFFC0003FFFFFFFF00FFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end
