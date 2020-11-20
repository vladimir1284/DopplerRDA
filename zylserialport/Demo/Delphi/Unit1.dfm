object Form1: TForm1
  Left = 191
  Top = 185
  Width = 436
  Height = 397
  Caption = 'ZylSerialPort Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    428
    363)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 9
    Top = 15
    Width = 409
    Height = 210
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object btnOpen: TButton
    Left = 9
    Top = 240
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Open'
    TabOrder = 1
    OnClick = btnOpenClick
  end
  object Edit1: TEdit
    Left = 9
    Top = 318
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 2
  end
  object btnSendStr: TButton
    Left = 137
    Top = 317
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Send String'
    TabOrder = 3
    OnClick = btnSendStrClick
  end
  object btnClose: TButton
    Left = 9
    Top = 273
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object lstPort: TListBox
    Left = 91
    Top = 240
    Width = 81
    Height = 57
    Hint = 'Port'
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
      'COM19')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object btnSendData: TButton
    Left = 232
    Top = 317
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Send Data'
    TabOrder = 6
    OnClick = btnSendDataClick
  end
  object rgMode: TRadioGroup
    Left = 280
    Top = 236
    Width = 145
    Height = 60
    Anchors = [akLeft, akBottom]
    ItemIndex = 0
    Items.Strings = (
      'ASCII'
      'Decimal'
      'Hexa')
    TabOrder = 7
  end
  object lstBaudRate: TListBox
    Left = 178
    Top = 240
    Width = 81
    Height = 57
    Hint = 'Baud Rate'
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
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object ZylSerialPort: TZylSerialPort
    Port = spCOM11
    Delay = 1000
    OnReceive = ZylSerialPortReceive
    OnLineStatusChange = ZylSerialPortLineStatusChange
    OnConnect = ZylSerialPortConnect
    OnDisconnect = ZylSerialPortDisconnect
    Left = 57
    Top = 31
  end
end
