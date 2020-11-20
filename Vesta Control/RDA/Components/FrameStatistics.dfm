object Frame_Statistics: TFrame_Statistics
  Left = 0
  Top = 0
  Width = 637
  Height = 292
  PopupMenu = PopupMenu1
  TabOrder = 0
  object Label1: TLabel
    Left = 51
    Top = 24
    Width = 23
    Height = 13
    Caption = 'RDA'
  end
  object Label2: TLabel
    Left = 45
    Top = 48
    Width = 29
    Height = 13
    Caption = 'Radar'
  end
  object Label3: TLabel
    Left = 287
    Top = 8
    Width = 70
    Height = 13
    Caption = 'Accionamiento'
    Visible = False
  end
  object Label4: TLabel
    Left = 315
    Top = 32
    Width = 42
    Height = 13
    Caption = 'Motor Az'
    Visible = False
  end
  object Label5: TLabel
    Left = 318
    Top = 56
    Width = 39
    Height = 13
    Caption = 'Motor El'
    Visible = False
  end
  object Label6: TLabel
    Left = 6
    Top = 83
    Width = 68
    Height = 13
    Caption = 'Trasmisor 3cm'
  end
  object Label7: TLabel
    Left = 5
    Top = 107
    Width = 69
    Height = 13
    Caption = 'Radiando 3cm'
  end
  object Label8: TLabel
    Left = 7
    Top = 131
    Width = 67
    Height = 13
    Caption = 'Receptor 3cm'
  end
  object Label9: TLabel
    Left = 7
    Top = 160
    Width = 128
    Height = 13
    Caption = 'Magnetron 3cm Caldeando'
  end
  object Label10: TLabel
    Left = 7
    Top = 184
    Width = 123
    Height = 13
    Caption = 'Magnetron 3cm Radiando'
  end
  object Label11: TLabel
    Left = 7
    Top = 208
    Width = 150
    Height = 13
    Caption = 'Tiratron 3cm Pricipal Caldeando'
  end
  object Label12: TLabel
    Left = 7
    Top = 256
    Width = 95
    Height = 13
    Caption = 'Tiratron 3cm Auxiliar'
  end
  object Label13: TLabel
    Left = 283
    Top = 85
    Width = 74
    Height = 13
    Caption = 'Trasmisor 10cm'
  end
  object Label14: TLabel
    Left = 282
    Top = 109
    Width = 75
    Height = 13
    Caption = 'Radiando 10cm'
  end
  object Label15: TLabel
    Left = 284
    Top = 133
    Width = 73
    Height = 13
    Caption = 'Receptor 10cm'
  end
  object Label16: TLabel
    Left = 313
    Top = 162
    Width = 134
    Height = 13
    Caption = 'Magnetron 10cm Caldeando'
  end
  object Label17: TLabel
    Left = 313
    Top = 186
    Width = 129
    Height = 13
    Caption = 'Magnetron 10cm Radiando'
  end
  object Label18: TLabel
    Left = 313
    Top = 210
    Width = 156
    Height = 13
    Caption = 'Tiratron 10cm Pricipal Caldeando'
  end
  object Label19: TLabel
    Left = 313
    Top = 258
    Width = 101
    Height = 13
    Caption = 'Tiratron 10cm Auxiliar'
  end
  object Label20: TLabel
    Left = 7
    Top = 232
    Width = 145
    Height = 13
    Caption = 'Tiratron 3cm Pricipal Radiando'
  end
  object Label21: TLabel
    Left = 313
    Top = 234
    Width = 151
    Height = 13
    Caption = 'Tiratron 10cm Pricipal Radiando'
  end
  object txRDA: TStaticText
    Left = 83
    Top = 23
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 0
  end
  object txRadar: TStaticText
    Left = 83
    Top = 47
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 1
  end
  object txAcc: TStaticText
    Left = 363
    Top = 7
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 2
    Visible = False
  end
  object txAz: TStaticText
    Left = 363
    Top = 31
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 3
    Visible = False
  end
  object txEl: TStaticText
    Left = 363
    Top = 55
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 4
    Visible = False
  end
  object txTxCaldeo1: TStaticText
    Left = 83
    Top = 82
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 5
  end
  object txTxAnodo1: TStaticText
    Left = 83
    Top = 106
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 6
  end
  object txRx1: TStaticText
    Left = 83
    Top = 130
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 7
  end
  object txMagnetronCaldeo1: TStaticText
    Left = 161
    Top = 159
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 8
  end
  object txMagnetronAnodo1: TStaticText
    Left = 161
    Top = 183
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 9
  end
  object txTiratronPrincipal1: TStaticText
    Left = 161
    Top = 207
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 10
  end
  object txTiratronAuxiliar1: TStaticText
    Left = 161
    Top = 255
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 11
  end
  object Button1: TButton
    Left = 256
    Top = 159
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 12
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 183
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 13
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 256
    Top = 207
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 14
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 256
    Top = 255
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 15
    OnClick = Button4Click
  end
  object txTxCaldeo2: TStaticText
    Left = 363
    Top = 84
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 16
  end
  object txTxAnodo2: TStaticText
    Left = 363
    Top = 108
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 17
  end
  object txRx2: TStaticText
    Left = 363
    Top = 132
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 18
  end
  object txMagnetronCaldeo2: TStaticText
    Left = 473
    Top = 161
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 19
  end
  object txMagnetronAnodo2: TStaticText
    Left = 473
    Top = 185
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 20
  end
  object txTiratronPrincipal2: TStaticText
    Left = 473
    Top = 209
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 21
  end
  object txTiratronAuxiliar2: TStaticText
    Left = 473
    Top = 257
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 22
  end
  object Button5: TButton
    Left = 568
    Top = 161
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 23
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 568
    Top = 185
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 24
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 568
    Top = 209
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 25
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 568
    Top = 257
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 26
    OnClick = Button8Click
  end
  object txTiratronPrincipal1Rad: TStaticText
    Left = 161
    Top = 231
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 27
  end
  object Button9: TButton
    Left = 256
    Top = 231
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 28
    OnClick = Button9Click
  end
  object txTiratronPrincipal2Rad: TStaticText
    Left = 473
    Top = 233
    Width = 90
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BorderStyle = sbsSingle
    TabOrder = 29
  end
  object Button10: TButton
    Left = 566
    Top = 233
    Width = 53
    Height = 17
    Caption = 'Reiniciar'
    TabOrder = 30
    OnClick = Button10Click
  end
  object PopupMenu1: TPopupMenu
    Left = 191
    Top = 48
    object rMinutes: TMenuItem
      AutoCheck = True
      Caption = 'Minutos'
      Checked = True
      RadioItem = True
      ShortCut = 16461
      OnClick = rMinutesClick
    end
    object rHours: TMenuItem
      Tag = 1
      Caption = 'Horas'
      ShortCut = 16456
      OnClick = rMinutesClick
    end
    object rDays: TMenuItem
      Tag = 2
      Caption = 'Dias'
      ShortCut = 16452
      OnClick = rMinutesClick
    end
    object rWeeks: TMenuItem
      Tag = 3
      Caption = 'Semanas'
      ShortCut = 16467
      OnClick = rMinutesClick
    end
    object rMonths: TMenuItem
      Tag = 4
      Caption = 'Meses'
      ShortCut = 16453
      OnClick = rMinutesClick
    end
  end
end
