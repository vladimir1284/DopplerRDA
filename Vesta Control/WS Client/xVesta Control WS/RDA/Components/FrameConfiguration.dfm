object Frame_Configuration: TFrame_Configuration
  Left = 0
  Top = 0
  Width = 530
  Height = 294
  TabOrder = 0
  object Label73: TLabel
    Left = 26
    Top = 83
    Width = 14
    Height = 13
    Caption = 'N&2'
  end
  object Label74: TLabel
    Left = 26
    Top = 104
    Width = 14
    Height = 13
    Caption = 'N&3'
  end
  object Label75: TLabel
    Left = 26
    Top = 126
    Width = 14
    Height = 13
    Caption = 'N&4'
  end
  object Label76: TLabel
    Left = 26
    Top = 147
    Width = 14
    Height = 13
    Caption = 'N&5'
  end
  object Label77: TLabel
    Left = 26
    Top = 169
    Width = 14
    Height = 13
    Caption = 'N&6'
  end
  object Label78: TLabel
    Left = 5
    Top = 190
    Width = 35
    Height = 13
    Caption = 'N&1CH1'
  end
  object Label79: TLabel
    Left = 5
    Top = 212
    Width = 35
    Height = 13
    Caption = '&N1CH2'
  end
  object Label80: TLabel
    Left = 34
    Top = 91
    Width = 14
    Height = 13
    Caption = 'N&2'
  end
  object Label81: TLabel
    Left = 34
    Top = 112
    Width = 14
    Height = 13
    Caption = 'N&3'
  end
  object Label82: TLabel
    Left = 34
    Top = 134
    Width = 14
    Height = 13
    Caption = 'N&4'
  end
  object Label83: TLabel
    Left = 34
    Top = 155
    Width = 14
    Height = 13
    Caption = 'N&5'
  end
  object Label84: TLabel
    Left = 34
    Top = 177
    Width = 14
    Height = 13
    Caption = 'N&6'
  end
  object Label85: TLabel
    Left = 13
    Top = 198
    Width = 35
    Height = 13
    Caption = 'N&1CH1'
  end
  object Label86: TLabel
    Left = 13
    Top = 220
    Width = 35
    Height = 13
    Caption = '&N1CH2'
  end
  object Label88: TLabel
    Left = 42
    Top = 120
    Width = 14
    Height = 13
    Caption = 'N&3'
  end
  object Label89: TLabel
    Left = 42
    Top = 142
    Width = 14
    Height = 13
    Caption = 'N&4'
  end
  object Panel1: TPanel
    Left = 0
    Top = 263
    Width = 530
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      530
      31)
    object Button2: TButton
      Left = 386
      Top = 8
      Width = 70
      Height = 19
      Anchors = [akRight, akBottom]
      Caption = '&Restaurar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 456
      Top = 7
      Width = 70
      Height = 20
      Anchors = [akRight, akBottom]
      Caption = '&Configurar'
      Default = True
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 530
    Height = 263
    ActivePage = TabSheet9
    Align = alClient
    TabOrder = 1
    object TabSheet9: TTabSheet
      Caption = 'Operador'
      ImageIndex = 8
      object Label10: TLabel
        Left = 17
        Top = 114
        Width = 63
        Height = 13
        Hint = 'Tiempo de espera para el apagado autom'#225'tico'
        Caption = '&Tiempo [min]:'
        FocusControl = Edit10
        ParentShowHint = False
        ShowHint = True
      end
      object Label72: TLabel
        Left = 269
        Top = 100
        Width = 36
        Height = 13
        Caption = 'minutos'
        FocusControl = Button1
      end
      object Label71: TLabel
        Left = 208
        Top = 72
        Width = 174
        Height = 13
        Caption = 'Tiempo de descanso del Radar (Min)'
        FocusControl = Button1
      end
      object Label65: TLabel
        Left = 269
        Top = 44
        Width = 36
        Height = 13
        Caption = 'minutos'
        FocusControl = Button1
      end
      object Label64: TLabel
        Left = 208
        Top = 16
        Width = 189
        Height = 13
        Caption = 'Tiempo de calentamiento del radar (Min)'
        FocusControl = Button1
      end
      object CheckBox8: TCheckBox
        Left = 8
        Top = 16
        Width = 153
        Height = 17
        Caption = 'Regimen continuo'
        TabOrder = 0
      end
      object CheckBox1: TCheckBox
        Left = 7
        Top = 49
        Width = 180
        Height = 17
        Hint = 'Activar/Desactivar observaciones automaticas'
        Caption = 'Observaciones automaticas'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Left = 7
        Top = 84
        Width = 180
        Height = 17
        Hint = 'Apagado automatico del radar'
        Caption = 'Apagado automatico'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object Edit10: TEdit
        Left = 87
        Top = 107
        Width = 30
        Height = 21
        Hint = 'Tiempo de espera para el apagado autom'#225'tico'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '30'
      end
      object UpDown1: TUpDown
        Left = 117
        Top = 107
        Width = 15
        Height = 21
        Hint = 'Tiempo de espera para el apagado autom'#225'tico'
        Associate = Edit10
        Min = 1
        Max = 180
        ParentShowHint = False
        Position = 30
        ShowHint = True
        TabOrder = 4
      end
      object CheckBox5: TCheckBox
        Left = 7
        Top = 149
        Width = 180
        Height = 17
        Hint = 'Login autom'#225'tico en la inicializaci'#243'n del Cliente de RDA'
        Caption = 'Login automatico del cliente'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object UpDown10: TUpDown
        Left = 249
        Top = 96
        Width = 15
        Height = 21
        Associate = Edit17
        Max = 60
        TabOrder = 9
      end
      object Edit17: TEdit
        Left = 208
        Top = 96
        Width = 41
        Height = 21
        TabOrder = 8
        Text = '0'
      end
      object Edit16: TEdit
        Left = 208
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 6
        Text = '0'
      end
      object UpDown6: TUpDown
        Left = 249
        Top = 40
        Width = 15
        Height = 21
        Associate = Edit16
        Max = 60
        TabOrder = 7
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'General'
      ImageIndex = 2
      DesignSize = (
        522
        235)
      object Label1: TLabel
        Left = 10
        Top = 25
        Width = 32
        Height = 13
        Hint = 'Indicativo del radar'
        Caption = '&Radar:'
        ParentShowHint = False
        ShowHint = True
      end
      object ComboBox2: TComboBox
        Left = 50
        Top = 20
        Width = 116
        Height = 21
        Hint = 'Indicativo del radar'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnSelect = ComboBox2Select
        Items.Strings = (
          '(Ninguno)'
          'La Bajada'
          'Punta del Este'
          'Casablanca'
          'Pico San Juan'
          'Camaguey'
          'Pilon'
          'Gran Piedra')
      end
      object GroupBox1: TGroupBox
        Left = 197
        Top = 8
        Width = 324
        Height = 73
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Descripcion del radar'
        TabOrder = 1
        object LRadarName: TLabel
          Left = 8
          Top = 16
          Width = 37
          Height = 13
          Caption = 'Nombre'
        end
        object LRadarOwner: TLabel
          Left = 8
          Top = 36
          Width = 66
          Height = 13
          Caption = 'LRadarOwner'
        end
        object LRadarLongitude: TLabel
          Left = 8
          Top = 56
          Width = 41
          Height = 13
          Caption = 'Longitud'
        end
        object LRadarLatitude: TLabel
          Left = 117
          Top = 56
          Width = 32
          Height = 13
          Caption = 'Latitud'
        end
        object LRadarAltitude: TLabel
          Left = 210
          Top = 56
          Width = 29
          Height = 13
          Caption = 'Altitud'
        end
        object LRadarRange: TLabel
          Left = 207
          Top = 16
          Width = 39
          Height = 13
          Caption = 'Alcance'
        end
      end
      object LabeledEdit7: TLabeledEdit
        Left = 16
        Top = 112
        Width = 65
        Height = 21
        EditLabel.Width = 163
        EditLabel.Height = 13
        EditLabel.Caption = 'Temperatura media anual (Grados)'
        TabOrder = 2
        Text = '0'
      end
      object LabeledEdit8: TLabeledEdit
        Left = 16
        Top = 160
        Width = 65
        Height = 21
        EditLabel.Width = 122
        EditLabel.Height = 13
        EditLabel.Caption = 'Presion media anual (hpa)'
        TabOrder = 3
        Text = '0'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Filtros'
      ImageIndex = 3
      object Label96: TLabel
        Left = 37
        Top = 57
        Width = 73
        Height = 13
        Caption = 'Umbral (metros)'
      end
      object Label111: TLabel
        Left = 8
        Top = 8
        Width = 174
        Height = 13
        Caption = 'Supresion de Ruidos (speckle)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label112: TLabel
        Left = 37
        Top = 109
        Width = 84
        Height = 13
        Caption = 'Umbral (Sectores)'
      end
      object CheckBox6: TCheckBox
        Left = 13
        Top = 36
        Width = 180
        Height = 17
        Hint = 'Activar/Desactivar supresi'#243'n de ecos aislados'
        Caption = 'Supresion en Distancia'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object Edit18: TEdit
        Left = 116
        Top = 54
        Width = 45
        Height = 21
        TabOrder = 1
        Text = '0'
      end
      object Umbral: TUpDown
        Left = 161
        Top = 54
        Width = 15
        Height = 21
        Associate = Edit18
        Max = 30000
        Increment = 50
        TabOrder = 2
      end
      object CheckBox12: TCheckBox
        Left = 16
        Top = 85
        Width = 153
        Height = 17
        Caption = 'Supresion en Azimut'
        TabOrder = 3
      end
      object Edit44: TEdit
        Left = 124
        Top = 106
        Width = 45
        Height = 21
        TabOrder = 4
        Text = '0'
      end
      object UpDown14: TUpDown
        Left = 169
        Top = 106
        Width = 15
        Height = 21
        Associate = Edit44
        Max = 30000
        TabOrder = 5
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Observaciones'
      ParentShowHint = False
      ShowHint = False
      DesignSize = (
        522
        235)
      object Label13: TLabel
        Left = 15
        Top = 164
        Width = 39
        Height = 13
        Hint = 
          'Metodo de compactaci'#243'n en observaciones (ZLib altamente sugerido' +
          ')'
        Caption = '&M'#233'todo:'
        FocusControl = ComboBox1
        ParentShowHint = False
        ShowHint = True
      end
      object Label3: TLabel
        Left = 15
        Top = 75
        Width = 47
        Height = 13
        Hint = 'Error m'#225'ximo permisible en lazo de velocidad (34 sugerido)'
        Caption = '&Vel. [cps]:'
        FocusControl = Edit3
        ParentShowHint = False
        ShowHint = True
      end
      object Label4: TLabel
        Left = 15
        Top = 100
        Width = 52
        Height = 13
        Hint = 'Error m'#225'ximo permisible en el lazo de posici'#243'n (2 sugerido)'
        Caption = '&Ang. [cod]:'
        FocusControl = Edit4
        ParentShowHint = False
        ShowHint = True
      end
      object Label5: TLabel
        Left = 10
        Top = 50
        Width = 53
        Height = 13
        Hint = 'Errores permisibles en lazos de antena'
        Caption = 'Precision'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label12: TLabel
        Left = 10
        Top = 135
        Width = 81
        Height = 13
        Hint = 
          'Metodo de compactaci'#243'n en observaciones (ZLib altamente sugerido' +
          ')'
        Caption = 'Compactaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label2: TLabel
        Left = 10
        Top = 15
        Width = 48
        Height = 13
        Hint = 
          'Direcciones de almacenamiento de las observaciones en la m'#225'quina' +
          ' de adquisici'#243'n'
        Caption = '&Direccion:'
      end
      object Label6: TLabel
        Left = 155
        Top = 50
        Width = 82
        Height = 13
        Hint = 'Ancho del patr'#243'n de radiaci'#243'n'
        Caption = 'Ancho del haz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object Label7: TLabel
        Left = 160
        Top = 75
        Width = 71
        Height = 13
        Hint = 'Ancho del patr'#243'n de radiaci'#243'n'
        Caption = 'Canal &1 (3 cm):'
        FocusControl = Edit5
        ParentShowHint = False
        ShowHint = True
      end
      object Label8: TLabel
        Left = 160
        Top = 100
        Width = 77
        Height = 13
        Hint = 'Ancho del patr'#243'n de radiaci'#243'n'
        Caption = 'Canal &2 (10 cm):'
        FocusControl = Edit6
        ParentShowHint = False
        ShowHint = True
      end
      object Label11: TLabel
        Left = 295
        Top = 75
        Width = 4
        Height = 13
        Hint = 'Ancho del patr'#243'n de radiaci'#243'n'
        Caption = #186
        ParentShowHint = False
        ShowHint = True
      end
      object Label14: TLabel
        Left = 295
        Top = 100
        Width = 4
        Height = 13
        Hint = 'Ancho del patr'#243'n de radiaci'#243'n'
        Caption = #186
        ParentShowHint = False
        ShowHint = True
      end
      object Label118: TLabel
        Left = 157
        Top = 135
        Width = 57
        Height = 13
        Caption = 'Chequeos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ComboBox1: TComboBox
        Left = 75
        Top = 160
        Width = 66
        Height = 21
        Hint = 
          'Metodo de compactaci'#243'n en observaciones (ZLib altamente sugerido' +
          ')'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Items.Strings = (
          'No'
          'Das'
          'ZLib')
      end
      object Edit3: TEdit
        Left = 75
        Top = 71
        Width = 50
        Height = 21
        Hint = 'Error m'#225'ximo permisible en lazo de velocidad (34 sugerido)'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '34'
      end
      object Edit4: TEdit
        Left = 75
        Top = 96
        Width = 50
        Height = 21
        Hint = 'Error m'#225'ximo permisible en el lazo de posici'#243'n (2 sugerido)'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        Text = '0'
      end
      object UpDown3: TUpDown
        Left = 125
        Top = 71
        Width = 16
        Height = 21
        Hint = 'Error m'#225'ximo permisible en lazo de velocidad (34 sugerido)'
        Associate = Edit3
        Max = 500
        ParentShowHint = False
        Position = 34
        ShowHint = True
        TabOrder = 2
      end
      object UpDown4: TUpDown
        Left = 125
        Top = 96
        Width = 16
        Height = 21
        Hint = 'Error m'#225'ximo permisible en el lazo de posici'#243'n (2 sugerido)'
        Associate = Edit4
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
      end
      object Edit2: TEdit
        Left = 83
        Top = 11
        Width = 402
        Height = 21
        Hint = 
          'Direcciones de almacenamiento de las observaciones en la m'#225'quina' +
          ' de adquisici'#243'n'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = '0'
      end
      object Edit5: TEdit
        Left = 245
        Top = 71
        Width = 45
        Height = 21
        Hint = 'Ancho del patr'#243'n de radiaci'#243'n'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Text = '0.5'
      end
      object Edit6: TEdit
        Left = 245
        Top = 96
        Width = 45
        Height = 21
        Hint = 'Ancho del patr'#243'n de radiaci'#243'n'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Text = '1.5'
      end
      object Button3: TButton
        Left = 60
        Top = 11
        Width = 21
        Height = 21
        Caption = '...'
        TabOrder = 8
        OnClick = Button3Click
      end
      object CheckBox9: TCheckBox
        Left = 160
        Top = 160
        Width = 193
        Height = 17
        Caption = 'Chequear parametros en cada PPI'
        TabOrder = 9
      end
      object CheckBox4: TCheckBox
        Left = 160
        Top = 184
        Width = 185
        Height = 17
        Caption = 'Validar PPI'
        TabOrder = 10
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sincronismo'
      ImageIndex = 3
      OnShow = TabSheet2Show
      object Label44: TLabel
        Left = 1
        Top = 211
        Width = 35
        Height = 13
        Caption = '&N1CH2'
        FocusControl = Edit25
      end
      object Label30: TLabel
        Left = 303
        Top = 25
        Width = 54
        Height = 13
        Hint = 'Velocidad_El'
        Caption = 'Pulso &Corto'
        FocusControl = Edit1
        ParentShowHint = False
        ShowHint = True
      end
      object Label29: TLabel
        Left = 175
        Top = 25
        Width = 56
        Height = 13
        Hint = 'Velocidad_El'
        Caption = 'Pulso &Largo'
        FocusControl = Edit11
        ParentShowHint = False
        ShowHint = True
      end
      object Label28: TLabel
        Left = 2
        Top = 2
        Width = 123
        Height = 13
        Caption = 'Fuente de disparo N&1'
        FocusControl = ComboBox17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 274
        Top = 4
        Width = 91
        Height = 13
        Caption = 'Frecuencia [Hz]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 22
        Top = 168
        Width = 14
        Height = 13
        Caption = 'N&6'
        FocusControl = Edit25
      end
      object Label24: TLabel
        Left = 22
        Top = 146
        Width = 14
        Height = 13
        Caption = 'N&5'
        FocusControl = Edit24
      end
      object Label23: TLabel
        Left = 22
        Top = 125
        Width = 14
        Height = 13
        Caption = 'N&4'
        FocusControl = Edit23
      end
      object Label22: TLabel
        Left = 22
        Top = 103
        Width = 14
        Height = 13
        Caption = 'N&3'
        FocusControl = Edit22
      end
      object Label21: TLabel
        Left = 22
        Top = 82
        Width = 14
        Height = 13
        Caption = 'N&2'
        FocusControl = Edit21
      end
      object Label20: TLabel
        Left = 1
        Top = 189
        Width = 35
        Height = 13
        Caption = 'N&1CH1'
        FocusControl = Edit26
      end
      object Label19: TLabel
        Left = 292
        Top = 64
        Width = 54
        Height = 13
        Caption = 'Pulso Corto'
      end
      object Label26: TLabel
        Left = 83
        Top = 64
        Width = 56
        Height = 13
        Caption = 'Pulso Largo'
      end
      object Label27: TLabel
        Left = 131
        Top = 46
        Width = 153
        Height = 13
        Caption = 'Demora entre disparos ['#181's]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label87: TLabel
        Left = 234
        Top = 83
        Width = 14
        Height = 13
        Caption = 'N&2'
        FocusControl = Edit21
      end
      object Label90: TLabel
        Left = 234
        Top = 104
        Width = 14
        Height = 13
        Caption = 'N&3'
        FocusControl = Edit22
      end
      object Label91: TLabel
        Left = 234
        Top = 126
        Width = 14
        Height = 13
        Caption = 'N&4'
        FocusControl = Edit23
      end
      object Label92: TLabel
        Left = 234
        Top = 147
        Width = 14
        Height = 13
        Caption = 'N&5'
        FocusControl = Edit24
      end
      object Label93: TLabel
        Left = 234
        Top = 169
        Width = 14
        Height = 13
        Caption = 'N&6'
        FocusControl = Edit25
      end
      object Label94: TLabel
        Left = 213
        Top = 190
        Width = 35
        Height = 13
        Caption = 'N&1CH1'
        FocusControl = Edit26
      end
      object Label95: TLabel
        Left = 213
        Top = 212
        Width = 35
        Height = 13
        Caption = '&N1CH2'
        FocusControl = Edit25
      end
      object Edit37: TEdit
        Tag = 5
        Left = 252
        Top = 213
        Width = 40
        Height = 22
        Hint = 'N6'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 44
        Text = '0'
      end
      object Edit27: TEdit
        Tag = 5
        Left = 43
        Top = 213
        Width = 40
        Height = 22
        Hint = 'N6'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 23
        Text = '0'
      end
      object UpDown37: TUpDown
        Tag = 6
        Left = 292
        Top = 213
        Width = 15
        Height = 22
        Hint = 'N6'
        Associate = Edit37
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 45
        Thousands = False
        OnClick = UpDownPC
      end
      object UpDown27: TUpDown
        Tag = 6
        Left = 83
        Top = 213
        Width = 15
        Height = 22
        Hint = 'N6'
        Associate = Edit27
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 24
        Thousands = False
        OnClick = UpDownPL
      end
      object ComboBox17: TComboBox
        Left = 2
        Top = 21
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Digital Interno'
          'Digital Externo')
      end
      object UpDown2: TUpDown
        Left = 397
        Top = 21
        Width = 15
        Height = 20
        Hint = 'N0'
        Associate = Edit1
        Min = 100
        Max = 4095
        Increment = 10
        ParentShowHint = False
        Position = 500
        ShowHint = True
        TabOrder = 4
        Thousands = False
        OnClick = UpDown2Click
      end
      object Edit1: TEdit
        Left = 362
        Top = 21
        Width = 35
        Height = 20
        Hint = 'N0'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Text = '500'
      end
      object UpDown5: TUpDown
        Left = 269
        Top = 21
        Width = 15
        Height = 20
        Hint = 'N0'
        Associate = Edit11
        Min = 100
        Max = 1000
        Increment = 10
        ParentShowHint = False
        Position = 250
        ShowHint = True
        TabOrder = 2
        Thousands = False
        OnClick = UpDown5Click
      end
      object Edit11: TEdit
        Left = 234
        Top = 21
        Width = 35
        Height = 20
        Hint = 'N0'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Text = '250'
      end
      object UpDown35: TUpDown
        Tag = 4
        Left = 292
        Top = 168
        Width = 15
        Height = 22
        Hint = 'N6'
        Associate = Edit35
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 39
        Thousands = False
        OnClick = UpDownPC
      end
      object UpDown34: TUpDown
        Tag = 3
        Left = 292
        Top = 145
        Width = 15
        Height = 22
        Hint = 'N5'
        Associate = Edit34
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 36
        Thousands = False
        OnClick = UpDownPC
      end
      object UpDown33: TUpDown
        Tag = 2
        Left = 292
        Top = 123
        Width = 15
        Height = 22
        Hint = 'N4'
        Associate = Edit33
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 33
        Thousands = False
        OnClick = UpDownPC
      end
      object UpDown32: TUpDown
        Tag = 1
        Left = 292
        Top = 101
        Width = 15
        Height = 22
        Hint = 'N3'
        Associate = Edit32
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 30
        Thousands = False
        OnClick = UpDownPC
      end
      object UpDown31: TUpDown
        Left = 292
        Top = 79
        Width = 15
        Height = 22
        Hint = 'N2'
        Associate = Edit31
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 27
        Thousands = False
        OnClick = UpDownPC
      end
      object UpDown36: TUpDown
        Tag = 5
        Left = 292
        Top = 190
        Width = 15
        Height = 22
        Hint = 'N0'
        Associate = Edit36
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 42
        Thousands = False
        OnClick = UpDownPC
      end
      object Edit35: TEdit
        Tag = 5
        Left = 252
        Top = 168
        Width = 40
        Height = 22
        Hint = 'N6'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 38
        Text = '0'
      end
      object Edit34: TEdit
        Tag = 4
        Left = 252
        Top = 145
        Width = 40
        Height = 22
        Hint = 'N5'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 35
        Text = '0'
      end
      object Edit33: TEdit
        Tag = 3
        Left = 252
        Top = 123
        Width = 40
        Height = 22
        Hint = 'N4'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 32
        Text = '0'
      end
      object Edit32: TEdit
        Tag = 2
        Left = 252
        Top = 101
        Width = 40
        Height = 22
        Hint = 'N3'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 29
        Text = '0'
      end
      object Edit31: TEdit
        Tag = 1
        Left = 252
        Top = 79
        Width = 40
        Height = 22
        Hint = 'N2'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 26
        Text = '0'
      end
      object Edit36: TEdit
        Left = 252
        Top = 190
        Width = 40
        Height = 22
        Hint = 'N0'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 41
        Text = '0'
      end
      object UpDown25: TUpDown
        Tag = 4
        Left = 83
        Top = 168
        Width = 15
        Height = 22
        Hint = 'N6'
        Associate = Edit25
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 18
        Thousands = False
        OnClick = UpDownPL
      end
      object UpDown24: TUpDown
        Tag = 3
        Left = 83
        Top = 145
        Width = 15
        Height = 22
        Hint = 'N5'
        Associate = Edit24
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        Thousands = False
        OnClick = UpDownPL
      end
      object UpDown23: TUpDown
        Tag = 2
        Left = 83
        Top = 123
        Width = 15
        Height = 22
        Hint = 'N4'
        Associate = Edit23
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Thousands = False
        OnClick = UpDownPL
      end
      object UpDown22: TUpDown
        Tag = 1
        Left = 83
        Top = 101
        Width = 15
        Height = 22
        Hint = 'N3'
        Associate = Edit22
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        Thousands = False
        OnClick = UpDownPL
      end
      object UpDown21: TUpDown
        Left = 83
        Top = 79
        Width = 15
        Height = 22
        Hint = 'N2'
        Associate = Edit21
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Thousands = False
        OnClick = UpDownPL
      end
      object UpDown26: TUpDown
        Tag = 5
        Left = 83
        Top = 190
        Width = 15
        Height = 22
        Hint = 'N0'
        Associate = Edit26
        Max = 4095
        ParentShowHint = False
        ShowHint = True
        TabOrder = 21
        Thousands = False
        OnClick = UpDownPL
      end
      object Edit25: TEdit
        Tag = 5
        Left = 43
        Top = 168
        Width = 40
        Height = 22
        Hint = 'N6'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 17
        Text = '0'
      end
      object Edit24: TEdit
        Tag = 4
        Left = 43
        Top = 145
        Width = 40
        Height = 22
        Hint = 'N5'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 14
        Text = '0'
      end
      object Edit23: TEdit
        Tag = 3
        Left = 43
        Top = 123
        Width = 40
        Height = 22
        Hint = 'N4'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 11
        Text = '0'
      end
      object Edit22: TEdit
        Tag = 2
        Left = 43
        Top = 101
        Width = 40
        Height = 22
        Hint = 'N3'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 8
        Text = '0'
      end
      object Edit21: TEdit
        Tag = 1
        Left = 43
        Top = 79
        Width = 40
        Height = 22
        Hint = 'N2'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
        Text = '0'
      end
      object Edit26: TEdit
        Left = 43
        Top = 190
        Width = 40
        Height = 22
        Hint = 'N0'
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 20
        Text = '0'
      end
      object TrackBar21: TTrackBar
        Left = 99
        Top = 79
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 7
        TickStyle = tsNone
        OnChange = TrackBarPLChange
      end
      object TrackBar22: TTrackBar
        Tag = 1
        Left = 98
        Top = 101
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 10
        TickStyle = tsNone
        OnChange = TrackBarPLChange
      end
      object TrackBar27: TTrackBar
        Tag = 6
        Left = 100
        Top = 213
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 25
        TickStyle = tsNone
        OnChange = TrackBarPLChange
      end
      object TrackBar24: TTrackBar
        Tag = 3
        Left = 99
        Top = 145
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 16
        TickStyle = tsNone
        OnChange = TrackBarPLChange
      end
      object TrackBar25: TTrackBar
        Tag = 4
        Left = 99
        Top = 168
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 19
        TickStyle = tsNone
        OnChange = TrackBarPLChange
      end
      object TrackBar26: TTrackBar
        Tag = 5
        Left = 99
        Top = 190
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 22
        TickStyle = tsNone
        OnChange = TrackBarPLChange
      end
      object TrackBar23: TTrackBar
        Tag = 2
        Left = 99
        Top = 123
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 13
        TickStyle = tsNone
        OnChange = TrackBarPLChange
      end
      object TrackBar31: TTrackBar
        Left = 308
        Top = 79
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 28
        TickStyle = tsNone
        OnChange = TrackBarPCChange
      end
      object TrackBar32: TTrackBar
        Tag = 1
        Left = 308
        Top = 101
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 31
        TickStyle = tsNone
        OnChange = TrackBarPCChange
      end
      object TrackBar33: TTrackBar
        Tag = 2
        Left = 308
        Top = 123
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 34
        TickStyle = tsNone
        OnChange = TrackBarPCChange
      end
      object TrackBar34: TTrackBar
        Tag = 3
        Left = 308
        Top = 145
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 37
        TickStyle = tsNone
        OnChange = TrackBarPCChange
      end
      object TrackBar35: TTrackBar
        Tag = 4
        Left = 308
        Top = 168
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 40
        TickStyle = tsNone
        OnChange = TrackBarPCChange
      end
      object TrackBar36: TTrackBar
        Tag = 5
        Left = 308
        Top = 190
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 43
        TickStyle = tsNone
        OnChange = TrackBarPCChange
      end
      object TrackBar37: TTrackBar
        Tag = 6
        Left = 308
        Top = 213
        Width = 110
        Height = 22
        Max = 3999
        PageSize = 100
        TabOrder = 46
        TickStyle = tsNone
        OnChange = TrackBarPCChange
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Conversores A/D'
      ImageIndex = 4
      OnShow = TabSheet5Show
      object Label31: TLabel
        Left = 223
        Top = 183
        Width = 12
        Height = 13
        Hint = 'Reserva_2'
        Caption = '15'
        FocusControl = ComboBox16
        ParentShowHint = False
        ShowHint = True
      end
      object Label32: TLabel
        Left = 223
        Top = 163
        Width = 12
        Height = 13
        Hint = 'Reserva_1'
        Caption = '14'
        FocusControl = ComboBox15
        ParentShowHint = False
        ShowHint = True
      end
      object Label33: TLabel
        Left = 223
        Top = 143
        Width = 12
        Height = 13
        Hint = 'Rx1_Ruido'
        Caption = '13'
        FocusControl = ComboBox14
        ParentShowHint = False
        ShowHint = True
      end
      object Label34: TLabel
        Left = 223
        Top = 123
        Width = 12
        Height = 13
        Hint = 'Rx1_Ganancia'
        Caption = '12'
        FocusControl = ComboBox13
        ParentShowHint = False
        ShowHint = True
      end
      object Label35: TLabel
        Left = 223
        Top = 103
        Width = 12
        Height = 13
        Hint = 'Rx1_Sintonia'
        Caption = '11'
        FocusControl = ComboBox12
        ParentShowHint = False
        ShowHint = True
      end
      object Label36: TLabel
        Left = 223
        Top = 83
        Width = 12
        Height = 13
        Hint = 'Tx1_Potencia'
        Caption = '10'
        FocusControl = ComboBox11
        ParentShowHint = False
        ShowHint = True
      end
      object Label37: TLabel
        Left = 223
        Top = 63
        Width = 6
        Height = 13
        Hint = 'Corriente_El'
        Caption = '9'
        FocusControl = ComboBox10
        ParentShowHint = False
        ShowHint = True
      end
      object Label38: TLabel
        Left = 223
        Top = 43
        Width = 6
        Height = 13
        Hint = 'Corriente_Az'
        Caption = '8'
        FocusControl = ComboBox9
        ParentShowHint = False
        ShowHint = True
      end
      object Label39: TLabel
        Left = 20
        Top = 183
        Width = 6
        Height = 13
        Hint = 'Velocidad_El'
        Caption = '7'
        FocusControl = ComboBox8
        ParentShowHint = False
        ShowHint = True
      end
      object Label40: TLabel
        Left = 20
        Top = 163
        Width = 6
        Height = 13
        Hint = 'Velocidad_Az'
        Caption = '6'
        FocusControl = ComboBox7
        ParentShowHint = False
        ShowHint = True
      end
      object Label41: TLabel
        Left = 20
        Top = 143
        Width = 6
        Height = 13
        Hint = 'Muestra_Fuente_N'
        Caption = '5'
        FocusControl = ComboBox6
        ParentShowHint = False
        ShowHint = True
      end
      object Label42: TLabel
        Left = 20
        Top = 123
        Width = 6
        Height = 13
        Hint = 'Muestra_Fuente_P'
        Caption = '4'
        FocusControl = ComboBox5
        ParentShowHint = False
        ShowHint = True
      end
      object Label43: TLabel
        Left = 20
        Top = 103
        Width = 6
        Height = 13
        Hint = 'Rx2_Ruido'
        Caption = '3'
        FocusControl = ComboBox4
        ParentShowHint = False
        ShowHint = True
      end
      object Label45: TLabel
        Left = 20
        Top = 83
        Width = 6
        Height = 13
        Hint = 'Rx2_Ganancia'
        Caption = '2'
        FocusControl = ComboBox3
        ParentShowHint = False
        ShowHint = True
      end
      object Label46: TLabel
        Left = 20
        Top = 63
        Width = 6
        Height = 13
        Hint = 'Rx2_Sintonia'
        Caption = '1'
        FocusControl = ComboBox18
        ParentShowHint = False
        ShowHint = True
      end
      object Label47: TLabel
        Left = 20
        Top = 43
        Width = 6
        Height = 13
        Hint = 'Tx2_Potencia'
        Caption = '0'
        FocusControl = ComboBox19
        ParentShowHint = False
        ShowHint = True
      end
      object Label48: TLabel
        Left = 10
        Top = 15
        Width = 55
        Height = 13
        Caption = 'Ganancia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ComboBox16: TComboBox
        Left = 355
        Top = 180
        Width = 60
        Height = 21
        Hint = 'Reserva_2'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 15
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox15: TComboBox
        Left = 355
        Top = 160
        Width = 60
        Height = 21
        Hint = 'Rx1_Sintonia'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox14: TComboBox
        Left = 355
        Top = 140
        Width = 60
        Height = 21
        Hint = 'Reserva_1'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 13
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox13: TComboBox
        Left = 355
        Top = 120
        Width = 60
        Height = 21
        Hint = 'Rx1_Ganancia'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox12: TComboBox
        Left = 355
        Top = 100
        Width = 60
        Height = 21
        Hint = 'Rx1_Ruido'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox11: TComboBox
        Left = 355
        Top = 80
        Width = 60
        Height = 21
        Hint = 'Tx1_Potencia'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox10: TComboBox
        Left = 355
        Top = 60
        Width = 60
        Height = 21
        Hint = 'Corriente_El'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox9: TComboBox
        Left = 355
        Top = 40
        Width = 60
        Height = 21
        Hint = 'Muestra_Fuente_N'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox8: TComboBox
        Left = 136
        Top = 180
        Width = 60
        Height = 21
        Hint = 'Corriente_Az'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox7: TComboBox
        Left = 136
        Top = 160
        Width = 60
        Height = 21
        Hint = 'Rx2_Sintonia'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox6: TComboBox
        Left = 136
        Top = 140
        Width = 60
        Height = 21
        Hint = 'Velocidad_El'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox5: TComboBox
        Left = 136
        Top = 120
        Width = 60
        Height = 21
        Hint = 'Muestra_Fuente_P'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox4: TComboBox
        Left = 136
        Top = 100
        Width = 60
        Height = 21
        Hint = 'Velocidad_Az'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox3: TComboBox
        Left = 136
        Top = 80
        Width = 60
        Height = 21
        Hint = 'Rx2_Ganancia'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox18: TComboBox
        Left = 136
        Top = 60
        Width = 60
        Height = 21
        Hint = 'Rx2_Ruido'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
      object ComboBox19: TComboBox
        Left = 136
        Top = 40
        Width = 60
        Height = 21
        Hint = 'Tx2_Potencia'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Items.Strings = (
          'x1'
          'x2'
          'x4'
          'x8'
          'x0.5')
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Video'
      ImageIndex = 5
      object Label49: TLabel
        Left = 15
        Top = 129
        Width = 54
        Height = 13
        Hint = 'Velocidad_El'
        Caption = 'Pulso &Corto'
        FocusControl = Edit12
        ParentShowHint = False
        ShowHint = True
      end
      object Label50: TLabel
        Left = 15
        Top = 105
        Width = 56
        Height = 13
        Hint = 'Velocidad_El'
        Caption = 'Pulso &Largo'
        FocusControl = Edit13
        ParentShowHint = False
        ShowHint = True
      end
      object Label51: TLabel
        Left = 10
        Top = 70
        Width = 110
        Height = 13
        Caption = 'Cantidad de celdas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label52: TLabel
        Left = 202
        Top = 8
        Width = 120
        Height = 13
        Caption = 'Tama'#241'o de celda [m]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label53: TLabel
        Left = 10
        Top = 7
        Width = 183
        Height = 13
        Caption = 'Frecuencia de conversion [KHz]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label54: TLabel
        Left = 146
        Top = 70
        Width = 116
        Height = 13
        Caption = 'Puertos de la tarjeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 143
        Top = 105
        Width = 53
        Height = 13
        Hint = 'Velocidad_El'
        Caption = 'Canal 3 cm'
        FocusControl = Edit13
        ParentShowHint = False
        ShowHint = True
      end
      object Label56: TLabel
        Left = 143
        Top = 128
        Width = 59
        Height = 13
        Hint = 'Velocidad_El'
        Caption = 'Canal 10 cm'
        FocusControl = Edit13
        ParentShowHint = False
        ShowHint = True
      end
      object Label66: TLabel
        Left = 290
        Top = 70
        Width = 133
        Height = 13
        Caption = 'Ganancias de la tarjeta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label67: TLabel
        Left = 294
        Top = 106
        Width = 44
        Height = 13
        Caption = 'Canal 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label68: TLabel
        Left = 294
        Top = 130
        Width = 44
        Height = 13
        Caption = 'Canal 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label69: TLabel
        Left = 294
        Top = 154
        Width = 44
        Height = 13
        Caption = 'Canal 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label70: TLabel
        Left = 294
        Top = 178
        Width = 44
        Height = 13
        Caption = 'Canal 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 166
        Width = 133
        Height = 13
        Caption = 'Puerto del osciloscopio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ComboBox20: TComboBox
        Left = 12
        Top = 29
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnSelect = ComboBox20Select
        Items.Strings = (
          '10,000,000'
          '5,000,000'
          '3,333,333'
          '2,000,000'
          '1,250,000'
          '1,000,000'
          '625,000'
          '500,000'
          '250,000')
      end
      object Edit12: TEdit
        Left = 85
        Top = 125
        Width = 40
        Height = 20
        Hint = 'N0'
        TabStop = False
        AutoSize = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
      end
      object Edit13: TEdit
        Left = 85
        Top = 101
        Width = 40
        Height = 20
        Hint = 'N0'
        TabStop = False
        AutoSize = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
      end
      object Edit14: TEdit
        Left = 207
        Top = 27
        Width = 120
        Height = 20
        Hint = 'N0'
        TabStop = False
        AutoSize = False
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        Text = '150'
      end
      object Edit15: TEdit
        Left = 208
        Top = 100
        Width = 65
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 6
        Text = '0'
      end
      object ComboBox21: TComboBox
        Left = 208
        Top = 125
        Width = 65
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 2
        Text = '1'
        OnSelect = ComboBox21Select
        Items.Strings = (
          '0'
          '1'
          '2'
          '3')
      end
      object ComboBox23: TComboBox
        Left = 349
        Top = 100
        Width = 57
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 7
        Text = '+/- 5.0 V'
        Items.Strings = (
          '+/- 5.0 V'
          '+/- 2.5 V'
          '+/- 1 V'
          '+/- 0.5 V')
      end
      object ComboBox24: TComboBox
        Left = 349
        Top = 124
        Width = 57
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 8
        Text = '+/- 5.0 V'
        Items.Strings = (
          '+/- 5.0 V'
          '+/- 2.5 V'
          '+/- 1 V'
          '+/- 0.5 V')
      end
      object ComboBox25: TComboBox
        Left = 349
        Top = 148
        Width = 57
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 9
        Text = '+/- 5.0 V'
        Items.Strings = (
          '+/- 5.0 V'
          '+/- 2.5 V'
          '+/- 1 V'
          '+/- 0.5 V')
      end
      object ComboBox26: TComboBox
        Left = 349
        Top = 172
        Width = 57
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 10
        Text = '+/- 5.0 V'
        Items.Strings = (
          '+/- 5.0 V'
          '+/- 2.5 V'
          '+/- 1 V'
          '+/- 0.5 V')
      end
      object RadioGroup1: TRadioGroup
        Left = 344
        Top = 10
        Width = 137
        Height = 55
        Caption = 'Fuente FrecuenciaAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Externa'
          'Interna')
        ParentFont = False
        TabOrder = 1
      end
      object txOsciloscopePort: TEdit
        Left = 13
        Top = 189
        Width = 40
        Height = 20
        Hint = 'N0'
        TabStop = False
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 11
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Deva'
      ImageIndex = 6
      object Label57: TLabel
        Left = 20
        Top = 128
        Width = 168
        Height = 13
        Caption = 'En contra de las manecillas del reloj'
      end
      object Label58: TLabel
        Left = 22
        Top = 147
        Width = 156
        Height = 13
        Caption = 'A favor de las manecillas del reloj'
      end
      object Label62: TLabel
        Left = 57
        Top = 108
        Width = 87
        Height = 13
        Caption = 'Sentido de giro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label63: TLabel
        Left = 10
        Top = 15
        Width = 169
        Height = 13
        Caption = 'Frecuencia de refrescamiento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ComboBox22: TComboBox
        Left = 20
        Top = 45
        Width = 120
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '2.5   MHz'
          '1.25 MHz'
          '625  KHz'
          '312  KHz'
          '156  KHz'
          '78    KHz')
      end
      object AzClockwise: TRadioGroup
        Left = 200
        Top = 112
        Width = 29
        Height = 58
        Caption = 'Az'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          ''
          '')
        ParentFont = False
        TabOrder = 1
      end
      object ElClockwise: TRadioGroup
        Left = 232
        Top = 112
        Width = 29
        Height = 58
        Caption = 'El'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          ''
          '')
        ParentFont = False
        TabOrder = 2
      end
      object ExtraClockwise: TRadioGroup
        Left = 264
        Top = 112
        Width = 45
        Height = 58
        Caption = 'Extra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          ''
          '')
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Correo'
      ImageIndex = 7
      DesignSize = (
        522
        235)
      object CheckBox7: TCheckBox
        Left = 6
        Top = 5
        Width = 283
        Height = 17
        Caption = 'Enviar una notificaci'#243'n del error por correo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 19
        Top = 24
        Width = 240
        Height = 209
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Enviar correo electronico a:'
        TabOrder = 1
        DesignSize = (
          240
          209)
        object Label97: TLabel
          Left = 6
          Top = 60
          Width = 160
          Height = 13
          Caption = 'Direcciones de Correo electronico'
        end
        object Button4: TButton
          Left = 170
          Top = 108
          Width = 65
          Height = 25
          Caption = 'Adicionar'
          TabOrder = 3
          OnClick = Button4Click
        end
        object ListBox1: TListBox
          Left = 6
          Top = 76
          Width = 161
          Height = 126
          Anchors = [akLeft, akTop, akBottom]
          ItemHeight = 13
          TabOrder = 1
          OnClick = ListBox1Click
        end
        object LabeledEdit1: TLabeledEdit
          Left = 7
          Top = 32
          Width = 160
          Height = 21
          EditLabel.Width = 148
          EditLabel.Height = 13
          EditLabel.Caption = 'Direccion de correo electronico'
          TabOrder = 0
        end
        object Button6: TButton
          Left = 170
          Top = 76
          Width = 65
          Height = 25
          Caption = 'Reemplazar'
          TabOrder = 2
          OnClick = Button6Click
        end
        object Button5: TButton
          Left = 170
          Top = 140
          Width = 65
          Height = 25
          Caption = 'Borrar'
          TabOrder = 4
          OnClick = Button5Click
        end
      end
      object GroupBox3: TGroupBox
        Left = 264
        Top = 24
        Width = 193
        Height = 209
        Caption = 'Configuracion del servidor de correo'
        TabOrder = 2
        object LabeledEdit2: TLabeledEdit
          Left = 8
          Top = 72
          Width = 129
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = 'Servidor SMTP'
          TabOrder = 1
        end
        object LabeledEdit3: TLabeledEdit
          Left = 8
          Top = 112
          Width = 89
          Height = 21
          EditLabel.Width = 86
          EditLabel.Height = 13
          EditLabel.Caption = 'Cuenta de usuario'
          TabOrder = 3
        end
        object LabeledEdit4: TLabeledEdit
          Left = 104
          Top = 112
          Width = 81
          Height = 21
          EditLabel.Width = 54
          EditLabel.Height = 13
          EditLabel.Caption = 'Contrase'#241'a'
          PasswordChar = '*'
          TabOrder = 4
        end
        object LabeledEdit5: TLabeledEdit
          Left = 144
          Top = 72
          Width = 41
          Height = 21
          EditLabel.Width = 31
          EditLabel.Height = 13
          EditLabel.Caption = 'Puerto'
          TabOrder = 2
          Text = '25'
        end
        object Button7: TButton
          Left = 7
          Top = 147
          Width = 178
          Height = 21
          Caption = 'Probar Configuracion'
          TabOrder = 5
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 8
          Top = 171
          Width = 177
          Height = 21
          Caption = 'Enviar un correo de prueba'
          TabOrder = 6
          OnClick = Button8Click
        end
        object LabeledEdit6: TLabeledEdit
          Left = 7
          Top = 31
          Width = 178
          Height = 21
          EditLabel.Width = 148
          EditLabel.Height = 13
          EditLabel.Caption = 'Direccion de correo electronico'
          TabOrder = 0
        end
      end
    end
  end
end