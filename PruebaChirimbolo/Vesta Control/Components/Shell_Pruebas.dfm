object Form2: TForm2
  Left = 206
  Top = 189
  Width = 696
  Height = 480
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Azimut1: TAzimut
    Left = 160
    Top = 88
    Width = 177
    Height = 201
    AntennaType = at_Azimut
    Desired = 0
    Position = 0
    Command = 0
    Count_Rect = 1
    Count_Circ = 1
    Count_Rad = 24
    Count_Small = 144
    Color_Back = clTeal
    Color_Ray = clLime
    Color_Mark = clRed
    Color_Rect = clWhite
    Color_Circ = clWhite
    Color_Rad = clYellow
    Color_Small = clWhite
    Color_Cmd = clMaroon
    ReadOnly = False
  end
  object Button1: TButton
    Left = 424
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Interval = 150
    OnTimer = Timer1Timer
    Left = 464
    Top = 104
  end
end
