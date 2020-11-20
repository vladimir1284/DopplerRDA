object Frame_AFC: TFrame_AFC
  Left = 0
  Top = 0
  Width = 477
  Height = 394
  Constraints.MinHeight = 265
  Constraints.MinWidth = 419
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 124
    Align = alTop
    TabOrder = 0
    object GroupBox5: TGroupBox
      Left = 1
      Top = 31
      Width = 184
      Height = 90
      Caption = 'Se'#241'ales'
      TabOrder = 0
      object Label12: TLabel
        Left = 108
        Top = 20
        Width = 58
        Height = 13
        Caption = 'Fuente -15V'
      end
      object Led3: TLed
        Left = 7
        Top = 17
        Width = 16
        Height = 16
        Hint = 'Anodo del transmisor (radiando)'
        Color = ldGreen
      end
      object Label13: TLabel
        Left = 24
        Top = 20
        Width = 52
        Height = 13
        Caption = 'Fuente -5V'
      end
      object Led4: TLed
        Left = 89
        Top = 62
        Width = 16
        Height = 16
        Hint = 'Averia del transmisor'
        Color = ldGreen
      end
      object Label14: TLabel
        Left = 23
        Top = 64
        Width = 61
        Height = 13
        Caption = 'Fuente +12V'
      end
      object Led2: TLed
        Left = 89
        Top = 17
        Width = 16
        Height = 16
        Hint = 'Transmisor listo'
        Color = ldGreen
      end
      object Label15: TLabel
        Left = 24
        Top = 42
        Width = 55
        Height = 13
        Caption = 'Fuente +5V'
      end
      object Led1: TLed
        Left = 7
        Top = 39
        Width = 16
        Height = 16
        Hint = 'Caldeo del transmisor'
        Color = ldGreen
      end
      object Led5: TLed
        Left = 89
        Top = 39
        Width = 16
        Height = 16
        Hint = 'Anodo del transmisor (radiando)'
        Color = ldGreen
      end
      object Label16: TLabel
        Left = 108
        Top = 42
        Width = 61
        Height = 13
        Caption = 'Fuente +15V'
      end
      object Label19: TLabel
        Left = 108
        Top = 64
        Width = 63
        Height = 13
        Caption = 'Stalo Locked'
      end
      object Led6: TLed
        Left = 7
        Top = 62
        Width = 16
        Height = 16
        Hint = 'Averia del transmisor'
        Color = ldGreen
      end
    end
    object GroupBox1: TGroupBox
      Left = 187
      Top = 31
      Width = 194
      Height = 90
      Caption = 'AFC'
      TabOrder = 1
      object Label6: TLabel
        Left = 3
        Top = 14
        Width = 31
        Height = 13
        Caption = 'IF (Hz)'
      end
      object Label1: TLabel
        Left = 3
        Top = 33
        Width = 90
        Height = 13
        Caption = 'Frecuencia Tx (Hz)'
      end
      object Label2: TLabel
        Left = 3
        Top = 52
        Width = 87
        Height = 13
        Caption = 'Potencia Tx (dBm)'
      end
      object Label10: TLabel
        Left = 3
        Top = 73
        Width = 45
        Height = 13
        Caption = 'NCO (Hz)'
      end
      object txIF: TStaticText
        Left = 98
        Top = 10
        Width = 90
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 0
      end
      object txTx: TStaticText
        Left = 98
        Top = 29
        Width = 90
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 1
      end
      object txPower: TStaticText
        Left = 98
        Top = 49
        Width = 90
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 2
      end
      object txNCO_Freq: TStaticText
        Left = 98
        Top = 69
        Width = 90
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 3
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 475
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object Label17: TLabel
        Left = 5
        Top = 5
        Width = 4
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 75
        Top = 5
        Width = 52
        Height = 20
        Caption = 'bfghfgdf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 383
      Top = 31
      Width = 93
      Height = 90
      Caption = 'Ordenes'
      TabOrder = 3
      DesignSize = (
        93
        90)
      object ledOn: TLed
        Left = 71
        Top = 21
        Width = 16
        Height = 16
        Color = ldGreen
      end
      object acquiring: TBulb
        Left = 72
        Top = 68
        Width = 16
        Height = 16
        Anchors = [akRight, akBottom]
        OnClick = acquiringClick
      end
      object Button6: TButton
        Left = 6
        Top = 19
        Width = 60
        Height = 20
        Hint = 'Encender/Apagar Receptor'
        Caption = '&Receptor'
        TabOrder = 0
        OnClick = Button3Click
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 124
    Width = 477
    Height = 270
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Pulso TX'
      object powerChart: TChart
        Left = 0
        Top = 0
        Width = 469
        Height = 242
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 9000.000000000000000000
        LeftAxis.Minimum = -9000.000000000000000000
        Legend.Visible = False
        View3D = False
        Align = alClient
        TabOrder = 0
        object Series1: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Espectro TX'
      ImageIndex = 1
      object spectrumChart: TChart
        Left = 0
        Top = 0
        Width = 469
        Height = 242
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 25.000000000000000000
        Legend.Visible = False
        View3D = False
        Align = alClient
        TabOrder = 0
        object FastLineSeries1: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TxRx'
      ImageIndex = 3
      object txrxChart: TChart
        Left = 0
        Top = 0
        Width = 469
        Height = 242
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        LeftAxis.Automatic = False
        LeftAxis.AutomaticMaximum = False
        LeftAxis.AutomaticMinimum = False
        LeftAxis.Maximum = 100.000000000000000000
        Legend.Visible = False
        View3D = False
        Align = alClient
        TabOrder = 0
        object FastLineSeries2: TFastLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          LinePen.Color = clRed
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'STALO'
      ImageIndex = 2
      object Label5: TLabel
        Left = 304
        Top = 37
        Width = 7
        Height = 13
        Caption = 'C'
      end
      object Label7: TLabel
        Left = 304
        Top = 61
        Width = 20
        Height = 13
        Caption = 'dbm'
      end
      object Label8: TLabel
        Left = 305
        Top = 85
        Width = 13
        Height = 13
        Caption = 'Hz'
      end
      object Label11: TLabel
        Left = 282
        Top = 11
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object stTemperature: TStaticText
        Left = 226
        Top = 33
        Width = 77
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 0
      end
      object stPower: TStaticText
        Left = 226
        Top = 57
        Width = 77
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 1
      end
      object stFrequncy: TStaticText
        Left = 226
        Top = 81
        Width = 77
        Height = 17
        Alignment = taCenter
        AutoSize = False
        BorderStyle = sbsSingle
        TabOrder = 2
      end
      object ckManualAFC: TCheckBox
        Left = 8
        Top = 9
        Width = 97
        Height = 17
        Caption = 'AFC Manual'
        TabOrder = 3
        OnClick = ckManualAFCClick
      end
      object Panel2: TPanel
        Left = 8
        Top = 32
        Width = 209
        Height = 147
        BevelOuter = bvNone
        TabOrder = 4
        object Label3: TLabel
          Left = 182
          Top = 35
          Width = 22
          Height = 13
          Caption = 'MHz'
        end
        object Label4: TLabel
          Left = 181
          Top = 60
          Width = 21
          Height = 13
          Caption = 'dBm'
        end
        object Label9: TLabel
          Left = 179
          Top = 130
          Width = 13
          Height = 13
          Caption = 'Hz'
        end
        object txStaloPower: TEdit
          Left = 117
          Top = 55
          Width = 63
          Height = 21
          TabOrder = 0
          Text = '19'
        end
        object Button1: TButton
          Left = 48
          Top = 2
          Width = 75
          Height = 21
          Caption = 'Resetear'
          TabOrder = 1
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 8
          Top = 30
          Width = 105
          Height = 21
          Caption = 'Cambiar Frecuencia'
          TabOrder = 2
          OnClick = Button2Click
        end
        object txStaloFreq: TEdit
          Left = 117
          Top = 30
          Width = 63
          Height = 21
          TabOrder = 3
          Text = '2950'
        end
        object Button3: TButton
          Left = 8
          Top = 55
          Width = 105
          Height = 21
          Caption = 'Cambiar Potencia'
          TabOrder = 4
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 8
          Top = 87
          Width = 89
          Height = 21
          Caption = 'Conectar RF'
          TabOrder = 5
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 104
          Top = 87
          Width = 89
          Height = 21
          Caption = 'Desconectar RF'
          TabOrder = 6
          OnClick = Button5Click
        end
        object Button7: TButton
          Left = 8
          Top = 125
          Width = 105
          Height = 21
          Caption = 'NCO Frecuencia'
          TabOrder = 7
          OnClick = Button7Click
        end
        object txNCO: TEdit
          Left = 117
          Top = 125
          Width = 63
          Height = 21
          TabOrder = 8
          Text = '30000000'
        end
      end
      object Panel3: TPanel
        Left = 221
        Top = 99
        Width = 191
        Height = 77
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 5
        object ckLockRecovery: TCheckBox
          Left = 98
          Top = 6
          Width = 93
          Height = 17
          Caption = 'LockRecovery'
          TabOrder = 0
        end
        object ckExtRef: TCheckBox
          Left = 98
          Top = 40
          Width = 65
          Height = 17
          Caption = 'ExtRef'
          TabOrder = 1
        end
        object ckRef_Unlocked: TCheckBox
          Left = 5
          Top = 56
          Width = 92
          Height = 17
          Caption = 'Ref_Unlocked'
          TabOrder = 2
        end
        object ckRF_Unlocked: TCheckBox
          Left = 5
          Top = 24
          Width = 91
          Height = 17
          Caption = 'RF_Unlocked'
          TabOrder = 3
        end
        object ckRF_Output: TCheckBox
          Left = 5
          Top = 6
          Width = 85
          Height = 17
          Caption = 'RF_Output'
          TabOrder = 4
        end
        object ckVoltageError: TCheckBox
          Left = 98
          Top = 24
          Width = 84
          Height = 17
          Caption = 'VoltageError'
          TabOrder = 5
        end
        object ckRef_Output: TCheckBox
          Left = 5
          Top = 40
          Width = 82
          Height = 17
          Caption = 'Ref_Output'
          TabOrder = 6
        end
        object ckBlanking: TCheckBox
          Left = 98
          Top = 56
          Width = 71
          Height = 17
          Caption = 'Blanking'
          TabOrder = 7
        end
      end
    end
  end
end