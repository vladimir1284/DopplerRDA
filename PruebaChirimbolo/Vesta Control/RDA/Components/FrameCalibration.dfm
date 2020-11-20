object Frame_Calibration: TFrame_Calibration
  Left = 0
  Top = 0
  Width = 410
  Height = 243
  Constraints.MinHeight = 243
  Constraints.MinWidth = 410
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 207
    Width = 410
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 269
      Top = 0
      Width = 141
      Height = 36
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Button1: TButton
        Left = 67
        Top = 10
        Width = 70
        Height = 20
        Caption = '&Configurar'
        Default = True
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = -3
        Top = 10
        Width = 70
        Height = 20
        Caption = '&Restaurar'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 410
    Height = 207
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 2
        Top = 37
        Width = 104
        Height = 13
        Caption = '&Potencia impulso [Kw]'
        FocusControl = Edit1
      end
      object Label7: TLabel
        Left = 266
        Top = 11
        Width = 56
        Height = 13
        Caption = 'Pulso &Largo'
        FocusControl = Edit7
      end
      object Label8: TLabel
        Left = 336
        Top = 11
        Width = 54
        Height = 13
        Caption = 'Pulso &Corto'
        FocusControl = Edit8
      end
      object Label9: TLabel
        Left = 193
        Top = 37
        Width = 64
        Height = 13
        Caption = 'C. Radar [dB]'
      end
      object Label10: TLabel
        Left = 192
        Top = 68
        Width = 65
        Height = 13
        Caption = 'Pot. Met. [dB]'
      end
      object Label30: TLabel
        Left = 174
        Top = 98
        Width = 83
        Height = 13
        Caption = 'Posicion pulso Tx'
        FocusControl = Edit1
      end
      object Label2: TLabel
        Left = 17
        Top = 65
        Width = 89
        Height = 13
        Caption = 'Voltaje MPS (volts)'
        FocusControl = Edit1
      end
      object Label4: TLabel
        Left = 179
        Top = 126
        Width = 78
        Height = 13
        Caption = '&Sensibilidad [dB]'
        FocusControl = Edit4
      end
      object Label5: TLabel
        Left = 158
        Top = 154
        Width = 99
        Height = 13
        Caption = '&Rango dinamico [dB]'
        FocusControl = Edit5
      end
      object Edit1: TEdit
        Left = 110
        Top = 33
        Width = 36
        Height = 21
        Hint = 'Potencia del disparo del transmisor'
        ReadOnly = True
        TabOrder = 0
        Text = '160'
      end
      object Edit7: TEdit
        Left = 266
        Top = 33
        Width = 60
        Height = 21
        Hint = 'Constante del radar en pulso largo'
        TabOrder = 2
        Text = '95.3946'
      end
      object Edit8: TEdit
        Left = 336
        Top = 33
        Width = 60
        Height = 21
        Hint = 'Constante del radar en pulso corto'
        TabOrder = 3
        Text = '92.3843'
      end
      object Edit10: TEdit
        Left = 336
        Top = 64
        Width = 60
        Height = 21
        Hint = 'Potencial meteorologico en pulso corto'
        ParentColor = True
        ReadOnly = True
        TabOrder = 5
        Text = '-38.4255'
      end
      object Edit9: TEdit
        Left = 266
        Top = 64
        Width = 60
        Height = 21
        Hint = 'Potencial meteorologico en pulso largo'
        ParentColor = True
        ReadOnly = True
        TabOrder = 4
        Text = '-41.4358'
      end
      object UpDown1: TUpDown
        Left = 146
        Top = 33
        Width = 16
        Height = 21
        Hint = 'Potencia del disparo del transmisor'
        Associate = Edit1
        Max = 1000
        Increment = 10
        Position = 160
        TabOrder = 1
        Thousands = False
      end
      object _tx_pulse_lp: TEdit
        Left = 266
        Top = 94
        Width = 60
        Height = 21
        Hint = 'Constante del radar en pulso corto'
        TabOrder = 6
      end
      object _tx_pulse_sp: TEdit
        Left = 336
        Top = 94
        Width = 60
        Height = 21
        Hint = 'Constante del radar en pulso corto'
        TabOrder = 7
      end
      object txMPS: TEdit
        Left = 110
        Top = 61
        Width = 53
        Height = 21
        Hint = 'Constante del radar en pulso corto'
        TabOrder = 8
      end
      object _drx_dinamic_range_lp: TUpDown
        Left = 307
        Top = 150
        Width = 16
        Height = 21
        Hint = 'Rango dinamico del receptor'
        Associate = Edit5
        Position = 70
        TabOrder = 9
        Thousands = False
        OnChangingEx = _drx_dinamic_range_lpChangingEx
      end
      object Edit4: TEdit
        Left = 266
        Top = 122
        Width = 42
        Height = 21
        Hint = 'Limite de sensibilidad'
        ReadOnly = True
        TabOrder = 10
        Text = '-134'
        OnChange = Edit5Change
      end
      object _drx_sensibility_lp: TUpDown
        Left = 308
        Top = 122
        Width = 16
        Height = 21
        Hint = 'Limite de sensibilidad'
        Associate = Edit4
        Min = -80
        Max = -160
        Position = -134
        TabOrder = 11
        Thousands = False
      end
      object Edit5: TEdit
        Left = 266
        Top = 150
        Width = 41
        Height = 21
        Hint = 'Rango dinamico del receptor'
        ReadOnly = True
        TabOrder = 12
        Text = '70'
        OnChange = Edit5Change
      end
      object Edit2: TEdit
        Left = 336
        Top = 122
        Width = 42
        Height = 21
        Hint = 'Limite de sensibilidad'
        ReadOnly = True
        TabOrder = 13
        Text = '-134'
        OnChange = Edit2Change
      end
      object _drx_sensibility_sp: TUpDown
        Left = 378
        Top = 122
        Width = 16
        Height = 21
        Hint = 'Limite de sensibilidad'
        Associate = Edit2
        Min = -80
        Max = -160
        Position = -134
        TabOrder = 14
        Thousands = False
      end
      object Edit6: TEdit
        Left = 336
        Top = 150
        Width = 41
        Height = 21
        Hint = 'Rango dinamico del receptor'
        ReadOnly = True
        TabOrder = 15
        Text = '70'
        OnChange = Edit2Change
      end
      object _drx_dinamic_range_sp: TUpDown
        Left = 377
        Top = 150
        Width = 16
        Height = 21
        Hint = 'Rango dinamico del receptor'
        Associate = Edit6
        Position = 70
        TabOrder = 16
        Thousands = False
        OnChangingEx = _drx_dinamic_range_spChangingEx
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Tabla Pulso Largo'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 402
        Height = 179
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object drx_codes_editor_lp: TValueListEditor
          Left = 0
          Top = 0
          Width = 402
          Height = 179
          Align = alClient
          PopupMenu = PopupMenu1
          TabOrder = 0
          TitleCaptions.Strings = (
            'Potencia(dB)'
            'Potencia(Codigo)')
          ColWidths = (
            150
            246)
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tabla Pulso Corto'
      ImageIndex = 3
      object drx_codes_editor_sp: TValueListEditor
        Left = 0
        Top = 0
        Width = 402
        Height = 179
        Align = alClient
        PopupMenu = PopupMenu2
        TabOrder = 0
        TitleCaptions.Strings = (
          'Potencia(dB)'
          'Potencia(Codigo)')
        ColWidths = (
          150
          246)
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'AFC'
      ImageIndex = 3
      object Label6: TLabel
        Left = 8
        Top = 16
        Width = 91
        Height = 13
        Caption = 'Primera muestra PL'
      end
      object Label11: TLabel
        Left = 8
        Top = 40
        Width = 85
        Height = 13
        Caption = 'Ultima muestra PL'
      end
      object Label12: TLabel
        Left = 8
        Top = 64
        Width = 92
        Height = 13
        Caption = 'Primera muestra PC'
      end
      object Label13: TLabel
        Left = 8
        Top = 88
        Width = 86
        Height = 13
        Caption = 'Ultima muestra PC'
      end
      object Label14: TLabel
        Left = 9
        Top = 112
        Width = 66
        Height = 13
        Caption = 'Correccion Tx'
      end
      object Label24: TLabel
        Left = 161
        Top = 40
        Width = 59
        Height = 13
        Caption = 'Demora (ms)'
      end
      object Label25: TLabel
        Left = 150
        Top = 64
        Width = 75
        Height = 13
        Caption = 'Incremento (Hz)'
      end
      object Label28: TLabel
        Left = 161
        Top = 88
        Width = 53
        Height = 13
        Caption = 'Ancho (Hz)'
      end
      object Label29: TLabel
        Left = 177
        Top = 16
        Width = 106
        Height = 13
        Caption = 'Barrido del STALO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 9
        Top = 136
        Width = 83
        Height = 13
        Caption = 'Nivel de potencia'
      end
      object Label37: TLabel
        Left = 9
        Top = 160
        Width = 85
        Height = 13
        Caption = 'Ganancia del lazo'
      end
      object _start_sample_lp: TEdit
        Left = 102
        Top = 11
        Width = 41
        Height = 21
        TabOrder = 0
      end
      object _final_sample_lp: TEdit
        Left = 102
        Top = 35
        Width = 41
        Height = 21
        TabOrder = 1
      end
      object _start_sample_sp: TEdit
        Left = 102
        Top = 59
        Width = 41
        Height = 21
        TabOrder = 2
      end
      object _final_sample_sp: TEdit
        Left = 102
        Top = 83
        Width = 41
        Height = 21
        TabOrder = 3
      end
      object _tx_factor: TEdit
        Left = 102
        Top = 107
        Width = 42
        Height = 21
        TabOrder = 4
      end
      object _stalo_delay: TEdit
        Left = 227
        Top = 35
        Width = 78
        Height = 21
        TabOrder = 5
      end
      object _stalo_step: TEdit
        Left = 227
        Top = 59
        Width = 80
        Height = 21
        TabOrder = 6
      end
      object _stalo_width: TEdit
        Left = 228
        Top = 83
        Width = 80
        Height = 21
        TabOrder = 7
      end
      object _valid_tx_power: TEdit
        Left = 102
        Top = 131
        Width = 42
        Height = 21
        TabOrder = 8
      end
      object _loop_gain: TEdit
        Left = 102
        Top = 155
        Width = 42
        Height = 21
        TabOrder = 9
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 24
    Top = 208
    object Importar1: TMenuItem
      Caption = 'Importar'
      OnClick = Importar1Click
    end
    object Exportar1: TMenuItem
      Caption = 'Exportar'
      OnClick = Exportar1Click
    end
    object Completar1: TMenuItem
      Caption = 'Completar'
      OnClick = Completar1Click
    end
    object Graficar1: TMenuItem
      Caption = 'Graficar'
      OnClick = Graficar1Click
    end
    object Borrar1: TMenuItem
      Caption = 'Borrar'
      OnClick = Borrar1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Ficheros Textos|*.txt'
    Left = 88
    Top = 208
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Ficheros Textos|*.txt'
    Left = 120
    Top = 208
  end
  object PopupMenu2: TPopupMenu
    Left = 56
    Top = 208
    object Importar2: TMenuItem
      Caption = 'Importar'
      OnClick = Importar2Click
    end
    object Exportar2: TMenuItem
      Caption = 'Exportar'
      OnClick = Exportar2Click
    end
    object Completar2: TMenuItem
      Caption = 'Completar'
      OnClick = Completar2Click
    end
    object Graficar2: TMenuItem
      Caption = 'Graficar'
      OnClick = Graficar2Click
    end
    object Borrar2: TMenuItem
      Caption = 'Borrar'
      OnClick = Borrar2Click
    end
  end
end
