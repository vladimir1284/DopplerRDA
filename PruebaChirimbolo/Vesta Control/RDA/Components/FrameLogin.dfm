object Frame_Login: TFrame_Login
  Left = 0
  Top = 0
  Width = 150
  Height = 100
  AutoScroll = False
  TabOrder = 0
  DesignSize = (
    150
    100)
  object Button2: TButton
    Left = 60
    Top = 75
    Width = 90
    Height = 25
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = '&Tomar Control'
    Enabled = False
    TabOrder = 0
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 150
    Height = 75
    Align = alTop
    TabOrder = 1
    DesignSize = (
      150
      75)
    object Label1: TLabel
      Left = 5
      Top = 9
      Width = 57
      Height = 13
      Hint = 'Controlador'
      Caption = 'Controlador:'
    end
    object Bulb1: TBulb
      Left = 3
      Top = 30
      Width = 16
      Height = 16
      Hint = 'En Control'
    end
    object Label2: TLabel
      Left = 20
      Top = 34
      Width = 40
      Height = 13
      Hint = 'Nombre'
      Caption = '&Nombre:'
    end
    object Label3: TLabel
      Left = 5
      Top = 54
      Width = 57
      Height = 13
      Hint = 'Contrase'#241'a'
      Caption = '&Contrase'#241'a:'
    end
    object Edit2: TEdit
      Left = 70
      Top = 30
      Width = 74
      Height = 21
      Hint = 'Nombre'
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      TabOrder = 0
      Text = 'Marco'
    end
    object Edit1: TEdit
      Left = 70
      Top = 5
      Width = 74
      Height = 21
      Hint = 'Controlador'
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      ReadOnly = True
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 70
      Top = 50
      Width = 74
      Height = 21
      Hint = 'Contrase'#241'a'
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 0
    Top = 75
    Width = 60
    Height = 25
    Anchors = [akLeft, akTop, akBottom]
    Caption = '&Login'
    Enabled = False
    TabOrder = 2
    OnClick = Button1Click
  end
end
