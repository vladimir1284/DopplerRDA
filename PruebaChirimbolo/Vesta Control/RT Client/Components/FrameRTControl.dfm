object Frame_RTControl: TFrame_RTControl
  Left = 0
  Top = 0
  Width = 168
  Height = 60
  TabOrder = 0
  DesignSize = (
    168
    60)
  object Bulb1: TBulb
    Left = 148
    Top = 34
    Width = 16
    Height = 16
    Hint = 'En control'
    Anchors = [akTop, akRight]
  end
  object Button1: TButton
    Left = 5
    Top = 30
    Width = 138
    Height = 25
    Hint = 'Tomar Control'
    Anchors = [akLeft, akTop, akRight]
    Caption = '&Control'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 5
    Top = 5
    Width = 161
    Height = 21
    Hint = 'Controlador'
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 1
  end
end
