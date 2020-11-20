object Form1: TForm1
  Left = 379
  Top = 357
  Width = 405
  Height = 188
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 256
    Top = 64
    Width = 5
    Height = 24
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabeledEdit1: TLabeledEdit
    Left = 16
    Top = 16
    Width = 57
    Height = 21
    EditLabel.Width = 36
    EditLabel.Height = 13
    EditLabel.Caption = 'N1 (ms)'
    TabOrder = 0
    Text = '0'
  end
  object N1: TUpDown
    Left = 73
    Top = 16
    Width = 15
    Height = 21
    Associate = LabeledEdit1
    TabOrder = 1
  end
  object Degree: TLabeledEdit
    Left = 16
    Top = 72
    Width = 57
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Angulo (Grados)'
    TabOrder = 2
  end
  object LabeledEdit3: TLabeledEdit
    Left = 16
    Top = 128
    Width = 57
    Height = 21
    EditLabel.Width = 135
    EditLabel.Height = 13
    EditLabel.Caption = 'Velocidad de la antena (rpm)'
    TabOrder = 3
    Text = '0'
  end
  object Speed: TUpDown
    Left = 73
    Top = 128
    Width = 15
    Height = 21
    Associate = LabeledEdit3
    TabOrder = 4
  end
  object Button1: TButton
    Left = 170
    Top = 63
    Width = 55
    Height = 25
    Caption = '->'
    TabOrder = 5
    OnClick = Button1Click
  end
end
