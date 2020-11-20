object AcquireShotsInSector: TAcquireShotsInSector
  Left = 374
  Top = 204
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Adquirir Rayo a Rayo pa'#39' Roberto'
  ClientHeight = 187
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 8
    Width = 64
    Height = 13
    Caption = 'Tipo de Scan'
  end
  object ScanType: TComboBox
    Left = 104
    Top = 24
    Width = 65
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'PPI'
    Items.Strings = (
      'PPI'
      'RHI')
  end
  object CellCount: TLabeledEdit
    Left = 8
    Top = 112
    Width = 57
    Height = 21
    Hint = 'Cantidad de Celdas'
    EditLabel.Width = 32
    EditLabel.Height = 13
    EditLabel.Caption = 'Celdas'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = '1000'
  end
  object StartAngle: TLabeledEdit
    Left = 8
    Top = 72
    Width = 57
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Angulo de Inicio'
    TabOrder = 2
    Text = '0'
  end
  object FinishAngle: TLabeledEdit
    Left = 104
    Top = 72
    Width = 57
    Height = 21
    EditLabel.Width = 109
    EditLabel.Height = 13
    EditLabel.Caption = 'Angulo de Terminacion'
    TabOrder = 3
    Text = '15'
  end
  object Button1: TButton
    Left = 272
    Top = 151
    Width = 49
    Height = 25
    Caption = 'Adquirir'
    Default = True
    TabOrder = 4
    OnClick = Button1Click
  end
  object Timeout: TLabeledEdit
    Left = 104
    Top = 112
    Width = 57
    Height = 21
    Hint = 'Tiempo maximo para la adquisicion'
    EditLabel.Width = 85
    EditLabel.Height = 13
    EditLabel.Caption = 'Tiempo de espera'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = '1'
  end
  object Ch3cm: TCheckBox
    Left = 8
    Top = 8
    Width = 84
    Height = 17
    Caption = 'Canal 3cm'
    TabOrder = 6
  end
  object Ch10cm: TCheckBox
    Left = 8
    Top = 32
    Width = 84
    Height = 17
    Caption = 'Canal 10cm'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object Path: TLabeledEdit
    Left = 8
    Top = 152
    Width = 261
    Height = 21
    Hint = 
      'Si se deja en blanco los ficheros se copiaran en el directorio p' +
      'or defecto'
    EditLabel.Width = 151
    EditLabel.Height = 13
    EditLabel.Caption = 'Camino de los ficheros de salida'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object UM: TComboBox
    Left = 168
    Top = 112
    Width = 49
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 9
    Text = 'min'
    Items.Strings = (
      'ms'
      'seg'
      'min')
  end
end
