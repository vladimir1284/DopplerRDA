object Form1: TForm1
  Left = 192
  Top = 114
  Width = 520
  Height = 429
  Caption = 'ZylSerialPort Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 16
    Top = 16
    Width = 481
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnOpen: TButton
    Left = 16
    Top = 280
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Open'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object btnClose: TButton
    Left = 16
    Top = 320
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object cmbPort: TListBox
    Left = 104
    Top = 280
    Width = 89
    Height = 65
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    Items.Strings = (
      'COM1'
      'COM2'
      'COM3'
      'COM4'
      'COM5'
      'COM6'
      'COM7'
      'COM8'
      'COM9'
      'COM10'
      'COM11'
      'COM12'
      'COM13'
      'COM14'
      'COM15'
      'COM16'
      'COM17'
      'COM18'
      'COM19'
      'COM20'
      'COM21'
      'COM22'
      'COM23'
      'COM24'
      'COM25')
    TabOrder = 3
  end
  object Button3: TButton
    Left = 16
    Top = 360
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Send'
    TabOrder = 4
    OnClick = Button3Click
  end
  object efText: TEdit
    Left = 104
    Top = 360
    Width = 177
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 5
  end
  object rgMode: TRadioGroup
    Left = 339
    Top = 276
    Width = 161
    Height = 109
    Anchors = [akLeft, akBottom]
    ItemIndex = 0
    Items.Strings = (
      'ASCII'
      'Decimal'
      'Hexa')
    TabOrder = 6
  end
  object lstBaudRate: TListBox
    Left = 205
    Top = 281
    Width = 81
    Height = 62
    Anchors = [akLeft, akBottom]
    ItemHeight = 13
    Items.Strings = (
      '75'
      '110'
      '134'
      '150'
      '300'
      '600'
      '1200'
      '1800'
      '2400'
      '4800'
      '7200'
      '9600'
      '14400'
      '19200'
      '38400'
      '57600'
      '115200'
      '128000'
      '230400'
      '256000'
      '460800'
      '921600')
    TabOrder = 7
  end
  object ZylSerialPort: TZylSerialPort
    Delay = 500
    OnReceive = ZylSerialPortReceive
    OnConnect = ZylSerialPortConnect
    OnDisconnect = ZylSerialPortDisconnect
    Left = 208
    Top = 88
  end
end
