object FTPSettings: TFTPSettings
  Left = 398
  Top = 287
  BorderStyle = bsSingle
  Caption = 'Configuracion FTP'
  ClientHeight = 179
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 185
    Height = 168
    Caption = 'FTP'
    TabOrder = 0
    object Label1: TLabel
      Left = 17
      Top = 17
      Width = 39
      Height = 13
      Caption = 'Servidor'
    end
    object Label2: TLabel
      Left = 25
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Puerto'
    end
    object Label3: TLabel
      Left = 20
      Top = 63
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label4: TLabel
      Left = 2
      Top = 86
      Width = 54
      Height = 13
      Caption = 'Contrase'#241'a'
    end
    object Label9: TLabel
      Left = 17
      Top = 111
      Width = 37
      Height = 13
      Caption = 'Carpeta'
    end
    object FTPPassword: TEdit
      Left = 59
      Top = 84
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object FTPPort: TEdit
      Left = 59
      Top = 36
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object FTPUser: TEdit
      Left = 59
      Top = 60
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object FTPHost: TEdit
      Left = 59
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object FTPFolder: TEdit
      Left = 58
      Top = 108
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object MakeDirs: TCheckBox
      Left = 58
      Top = 139
      Width = 121
      Height = 17
      Caption = 'Crear Subdirectorios'
      TabOrder = 5
    end
  end
  object GroupBox2: TGroupBox
    Left = 200
    Top = 34
    Width = 185
    Height = 114
    Caption = 'Proxy'
    TabOrder = 2
    object Label5: TLabel
      Left = 17
      Top = 17
      Width = 39
      Height = 13
      Caption = 'Servidor'
    end
    object Label6: TLabel
      Left = 25
      Top = 40
      Width = 31
      Height = 13
      Caption = 'Puerto'
    end
    object Label7: TLabel
      Left = 20
      Top = 63
      Width = 36
      Height = 13
      Caption = 'Usuario'
    end
    object Label8: TLabel
      Left = 2
      Top = 86
      Width = 54
      Height = 13
      Caption = 'Contrase'#241'a'
    end
    object ProxyHost: TEdit
      Left = 59
      Top = 12
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object ProxyPort: TEdit
      Left = 59
      Top = 36
      Width = 41
      Height = 21
      TabOrder = 1
    end
    object ProxyUser: TEdit
      Left = 59
      Top = 60
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object ProxyPassword: TEdit
      Left = 59
      Top = 84
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object Button1: TButton
    Left = 229
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 309
    Top = 152
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
  end
  object UseProxy: TCheckBox
    Left = 200
    Top = 13
    Width = 97
    Height = 17
    Caption = 'Usar proxy'
    TabOrder = 1
  end
end
