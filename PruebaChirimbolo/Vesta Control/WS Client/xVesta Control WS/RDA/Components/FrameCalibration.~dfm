object Frame_Calibration: TFrame_Calibration
  Left = 0
  Top = 0
  Width = 227
  Height = 248
  TabOrder = 0
  object Panel1: TPanel
    Left = 0
    Top = 212
    Width = 227
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Label15: TLabel
      Left = 10
      Top = 8
      Width = 57
      Height = 19
      Caption = 'Canal #'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 86
      Top = 0
      Width = 141
      Height = 36
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Button1: TButton
        Left = 70
        Top = 10
        Width = 70
        Height = 20
        Caption = '&Configurar'
        Default = True
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 0
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
    Width = 227
    Height = 212
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'General'
      object Label1: TLabel
        Left = 10
        Top = 15
        Width = 130
        Height = 13
        Caption = '&Potencia en el impulso [Kw]'
        FocusControl = Edit1
      end
      object Label2: TLabel
        Left = 10
        Top = 45
        Width = 78
        Height = 13
        Caption = '&Sensibilidad [dB]'
        FocusControl = Edit2
      end
      object Label7: TLabel
        Left = 84
        Top = 110
        Width = 56
        Height = 13
        Caption = 'Pulso &Largo'
        FocusControl = Edit7
      end
      object Label8: TLabel
        Left = 154
        Top = 110
        Width = 54
        Height = 13
        Caption = 'Pulso &Corto'
        FocusControl = Edit8
      end
      object Label9: TLabel
        Left = 10
        Top = 135
        Width = 64
        Height = 13
        Caption = 'C. Radar [dB]'
      end
      object Label10: TLabel
        Left = 10
        Top = 165
        Width = 65
        Height = 13
        Caption = 'Pot. Met. [dB]'
      end
      object Label3: TLabel
        Left = 10
        Top = 75
        Width = 99
        Height = 13
        Caption = '&Rango dinamico [dB]'
        FocusControl = Edit3
      end
      object Edit1: TEdit
        Left = 159
        Top = 11
        Width = 40
        Height = 21
        Hint = 'Potencia del disparo del transmisor'
        ReadOnly = True
        TabOrder = 0
        Text = '160'
      end
      object Edit2: TEdit
        Left = 159
        Top = 41
        Width = 40
        Height = 21
        Hint = 'Limite de sensibilidad'
        ReadOnly = True
        TabOrder = 2
        Text = '-134'
        OnChange = Edit2Change
      end
      object Edit7: TEdit
        Left = 84
        Top = 131
        Width = 60
        Height = 21
        Hint = 'Constante del radar en pulso largo'
        TabOrder = 6
        Text = '95.3946'
      end
      object Edit8: TEdit
        Left = 154
        Top = 131
        Width = 60
        Height = 21
        Hint = 'Constante del radar en pulso corto'
        TabOrder = 7
        Text = '92.3843'
      end
      object Edit10: TEdit
        Left = 154
        Top = 161
        Width = 60
        Height = 21
        Hint = 'Potencial meteorologico en pulso corto'
        ParentColor = True
        ReadOnly = True
        TabOrder = 9
        Text = '-38.4255'
      end
      object Edit9: TEdit
        Left = 84
        Top = 161
        Width = 60
        Height = 21
        Hint = 'Potencial meteorologico en pulso largo'
        ParentColor = True
        ReadOnly = True
        TabOrder = 8
        Text = '-41.4358'
      end
      object UpDown1: TUpDown
        Left = 199
        Top = 11
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
      object UpDown2: TUpDown
        Left = 199
        Top = 41
        Width = 16
        Height = 21
        Hint = 'Limite de sensibilidad'
        Associate = Edit2
        Min = -80
        Max = -160
        Position = -134
        TabOrder = 3
        Thousands = False
      end
      object Edit3: TEdit
        Left = 159
        Top = 71
        Width = 40
        Height = 21
        Hint = 'Rango dinamico del receptor'
        ReadOnly = True
        TabOrder = 4
        Text = '70'
        OnChange = Edit2Change
      end
      object UpDown3: TUpDown
        Left = 199
        Top = 71
        Width = 16
        Height = 21
        Hint = 'Rango dinamico del receptor'
        Associate = Edit3
        Position = 70
        TabOrder = 5
        Thousands = False
        OnChangingEx = UpDown3ChangingEx
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Video'
      object StringGrid1: TStringGrid
        Left = 0
        Top = 25
        Width = 219
        Height = 159
        Align = alClient
        BorderStyle = bsNone
        ColCount = 2
        DefaultColWidth = 100
        DefaultRowHeight = 16
        RowCount = 257
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goAlwaysShowEditor, goThumbTracking]
        PopupMenu = PopupMenu1
        ScrollBars = ssVertical
        TabOrder = 0
        RowHeights = (
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16
          16)
      end
      object HeaderControl1: THeaderControl
        Left = 0
        Top = 0
        Width = 219
        Height = 25
        BorderWidth = 1
        HotTrack = True
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
            AutoSize = True
            ImageIndex = -1
            Text = 'Codigo'
            Width = 117
          end>
        OnSectionResize = HeaderControl1SectionResize
        OnResize = HeaderControl1Resize
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Medicion'
      ImageIndex = 3
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 219
        Height = 184
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label33: TLabel
          Left = 10
          Top = 20
          Width = 42
          Height = 13
          Caption = 'Potencia'
        end
        object Label34: TLabel
          Left = 10
          Top = 40
          Width = 28
          Height = 13
          Caption = 'Ruido'
        end
        object Label35: TLabel
          Left = 10
          Top = 60
          Width = 46
          Height = 13
          Caption = 'Ganancia'
        end
        object Label36: TLabel
          Left = 10
          Top = 80
          Width = 40
          Height = 13
          Caption = 'Sinton'#237'a'
        end
        object Label16: TLabel
          Left = 10
          Top = 120
          Width = 42
          Height = 13
          Caption = 'Potencia'
        end
        object Label17: TLabel
          Left = 10
          Top = 140
          Width = 28
          Height = 13
          Caption = 'Ruido'
        end
        object Label18: TLabel
          Left = 10
          Top = 160
          Width = 46
          Height = 13
          Caption = 'Ganancia'
        end
        object Label19: TLabel
          Left = 10
          Top = 180
          Width = 40
          Height = 13
          Caption = 'Sinton'#237'a'
        end
        object Label20: TLabel
          Left = 80
          Top = 0
          Width = 17
          Height = 13
          Caption = 'Min'
        end
        object Label21: TLabel
          Left = 165
          Top = 0
          Width = 20
          Height = 13
          Caption = 'Max'
        end
        object Label22: TLabel
          Left = 5
          Top = 0
          Width = 38
          Height = 13
          Caption = 'Rango'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 5
          Top = 100
          Width = 38
          Height = 13
          Caption = 'Sector'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 80
          Top = 100
          Width = 17
          Height = 13
          Caption = 'Min'
        end
        object Label27: TLabel
          Left = 165
          Top = 100
          Width = 20
          Height = 13
          Caption = 'Max'
        end
        object Edit11: TEdit
          Left = 62
          Top = 15
          Width = 50
          Height = 21
          Hint = 'Valor minimo en el indicador de potencia'
          TabOrder = 0
          Text = '0'
        end
        object UpDown11: TUpDown
          Left = 112
          Top = 15
          Width = 15
          Height = 21
          Hint = 'Valor minimo en el indicador de potencia'
          Associate = Edit11
          Max = 4095
          TabOrder = 1
          Thousands = False
        end
        object Edit12: TEdit
          Left = 62
          Top = 35
          Width = 50
          Height = 21
          Hint = 'Valor minimo en el indicador de ruido'
          TabOrder = 4
          Text = '0'
        end
        object UpDown12: TUpDown
          Left = 112
          Top = 35
          Width = 15
          Height = 21
          Hint = 'Valor minimo en el indicador de ruido'
          Associate = Edit12
          Max = 4095
          TabOrder = 5
          Thousands = False
        end
        object Edit13: TEdit
          Left = 62
          Top = 55
          Width = 50
          Height = 21
          Hint = 'Valor minimo en el indicador de ganancia'
          TabOrder = 8
          Text = '0'
        end
        object UpDown13: TUpDown
          Left = 112
          Top = 55
          Width = 15
          Height = 21
          Hint = 'Valor minimo en el indicador de ganancia'
          Associate = Edit13
          Max = 4095
          TabOrder = 9
          Thousands = False
        end
        object Edit14: TEdit
          Left = 62
          Top = 75
          Width = 50
          Height = 21
          Hint = 'Valor minimo en el indicador de sintonia'
          TabOrder = 10
          Text = '0'
        end
        object UpDown14: TUpDown
          Left = 112
          Top = 75
          Width = 15
          Height = 21
          Hint = 'Valor minimo en el indicador de sintonia'
          Associate = Edit14
          Max = 4095
          TabOrder = 11
          Thousands = False
        end
        object Edit15: TEdit
          Left = 147
          Top = 15
          Width = 50
          Height = 21
          Hint = 'Valor maximo en el indicador de potencia'
          TabOrder = 2
          Text = '0'
        end
        object UpDown15: TUpDown
          Left = 197
          Top = 15
          Width = 15
          Height = 21
          Hint = 'Valor maximo en el indicador de potencia'
          Associate = Edit15
          Max = 4095
          TabOrder = 3
          Thousands = False
        end
        object Edit16: TEdit
          Left = 147
          Top = 35
          Width = 50
          Height = 21
          Hint = 'Valor maximo en el indicador de ruido'
          TabOrder = 6
          Text = '0'
        end
        object UpDown16: TUpDown
          Left = 197
          Top = 35
          Width = 15
          Height = 21
          Hint = 'Valor maximo en el indicador de ruido'
          Associate = Edit16
          Max = 4095
          TabOrder = 7
          Thousands = False
        end
        object Edit18: TEdit
          Left = 147
          Top = 75
          Width = 50
          Height = 21
          Hint = 'Valor maximo en el indicador de sintonia'
          TabOrder = 12
          Text = '0'
        end
        object UpDown18: TUpDown
          Left = 197
          Top = 75
          Width = 15
          Height = 21
          Hint = 'Valor maximo en el indicador de sintonia'
          Associate = Edit18
          Max = 4095
          TabOrder = 13
          Thousands = False
        end
        object Edit19: TEdit
          Left = 62
          Top = 115
          Width = 50
          Height = 21
          Hint = 'Valor minimo del sector de potencia'
          TabOrder = 14
          Text = '0'
        end
        object UpDown19: TUpDown
          Left = 112
          Top = 115
          Width = 15
          Height = 21
          Hint = 'Valor minimo del sector de potencia'
          Associate = Edit19
          Max = 4095
          TabOrder = 15
          Thousands = False
        end
        object Edit20: TEdit
          Left = 62
          Top = 135
          Width = 50
          Height = 21
          Hint = 'Valor minimo del sector de ruido'
          TabOrder = 18
          Text = '0'
        end
        object UpDown20: TUpDown
          Left = 112
          Top = 135
          Width = 15
          Height = 21
          Hint = 'Valor minimo del sector de ruido'
          Associate = Edit20
          Max = 4095
          TabOrder = 19
          Thousands = False
        end
        object Edit21: TEdit
          Left = 62
          Top = 155
          Width = 50
          Height = 21
          Hint = 'Valor minimo del sector de ganancia'
          TabOrder = 22
          Text = '0'
        end
        object UpDown21: TUpDown
          Left = 112
          Top = 155
          Width = 15
          Height = 21
          Hint = 'Valor minimo del sector de ganancia'
          Associate = Edit21
          Max = 4095
          TabOrder = 23
          Thousands = False
        end
        object Edit22: TEdit
          Left = 62
          Top = 175
          Width = 50
          Height = 21
          Hint = 'Valor minimo del sector de sintonia'
          TabOrder = 26
          Text = '0'
        end
        object UpDown22: TUpDown
          Left = 112
          Top = 175
          Width = 15
          Height = 21
          Hint = 'Valor minimo del sector de sintonia'
          Associate = Edit22
          Max = 4095
          TabOrder = 27
          Thousands = False
        end
        object Edit23: TEdit
          Left = 147
          Top = 115
          Width = 50
          Height = 21
          Hint = 'Valor maximo del sector de ruido'
          TabOrder = 16
          Text = '0'
        end
        object UpDown23: TUpDown
          Left = 197
          Top = 115
          Width = 15
          Height = 21
          Hint = 'Valor maximo del sector de ruido'
          Associate = Edit23
          Max = 4095
          TabOrder = 17
          Thousands = False
        end
        object Edit24: TEdit
          Left = 147
          Top = 135
          Width = 50
          Height = 21
          Hint = 'Valor maximo del sector de ruido'
          TabOrder = 20
          Text = '0'
        end
        object UpDown24: TUpDown
          Left = 197
          Top = 135
          Width = 15
          Height = 21
          Hint = 'Valor maximo del sector de ruido'
          Associate = Edit24
          Max = 4095
          TabOrder = 21
          Thousands = False
        end
        object Edit25: TEdit
          Left = 147
          Top = 155
          Width = 50
          Height = 21
          Hint = 'Valor maximo del sector de ganancia'
          TabOrder = 24
          Text = '0'
        end
        object UpDown25: TUpDown
          Left = 197
          Top = 155
          Width = 15
          Height = 21
          Hint = 'Valor maximo del sector de ganancia'
          Associate = Edit25
          Max = 4095
          TabOrder = 25
          Thousands = False
        end
        object Edit26: TEdit
          Left = 147
          Top = 175
          Width = 50
          Height = 21
          Hint = 'Valor maximo del sector de sintonia'
          TabOrder = 28
          Text = '0'
        end
        object UpDown26: TUpDown
          Left = 197
          Top = 175
          Width = 15
          Height = 21
          Hint = 'Valor maximo del sector de sintonia'
          Associate = Edit26
          Max = 4095
          TabOrder = 29
          Thousands = False
        end
        object Edit17: TEdit
          Left = 147
          Top = 55
          Width = 50
          Height = 21
          Hint = 'Valor maximo en el indicador de ganancia'
          TabOrder = 30
          Text = '0'
        end
        object UpDown17: TUpDown
          Left = 197
          Top = 55
          Width = 15
          Height = 21
          Hint = 'Valor maximo en el indicador de ganancia'
          Associate = Edit17
          Max = 4095
          TabOrder = 31
          Thousands = False
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 176
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
    Left = 104
    Top = 176
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Ficheros Textos|*.txt'
    Left = 136
    Top = 176
  end
end
