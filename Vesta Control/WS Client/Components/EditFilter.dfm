object Edit_Filter: TEdit_Filter
  Left = 604
  Top = 203
  BorderStyle = bsDialog
  Caption = 'Editar Filtros'
  ClientHeight = 103
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object HeaderControl1: THeaderControl
    Left = 5
    Top = 15
    Width = 604
    Height = 18
    Align = alNone
    HotTrack = True
    Enabled = False
    Sections = <
      item
        ImageIndex = -1
        MinWidth = 150
        Text = 'Nombre'
        Width = 150
      end
      item
        ImageIndex = -1
        Text = 'B0'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'B1'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'B2'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'B3'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'B4'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'C1'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'C2'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'C3'
        Width = 50
      end
      item
        ImageIndex = -1
        Text = 'C4'
        Width = 50
      end>
    Style = hsFlat
  end
  object txName: TEdit
    Left = 8
    Top = 40
    Width = 144
    Height = 21
    TabOrder = 1
  end
  object txB0: TEdit
    Left = 156
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 2
  end
  object txB1: TEdit
    Left = 205
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 3
  end
  object txB2: TEdit
    Left = 255
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 4
  end
  object txC4: TEdit
    Left = 555
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 5
  end
  object txC3: TEdit
    Left = 505
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 6
  end
  object txC2: TEdit
    Left = 455
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 7
  end
  object txC1: TEdit
    Left = 405
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 8
  end
  object txB4: TEdit
    Left = 355
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 9
  end
  object txB3: TEdit
    Left = 305
    Top = 40
    Width = 48
    Height = 21
    TabOrder = 10
  end
  object Button4: TButton
    Left = 523
    Top = 73
    Width = 80
    Height = 20
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 11
  end
  object Button3: TButton
    Left = 436
    Top = 73
    Width = 80
    Height = 20
    Caption = '&Aceptar'
    Default = True
    ModalResult = 1
    TabOrder = 12
  end
end
