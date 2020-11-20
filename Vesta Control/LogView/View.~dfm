object Form3: TForm3
  Left = 192
  Top = 110
  Width = 696
  Height = 516
  Caption = 'Eventos del sistema'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0777777777777777777770000000000000000000000000000000700000000000
    0FFFFFFFFFFFFFFFFFF07000000000000FFFFFFFFFFFFFFFFFF0700000000000
    0FFFFFFFFFFFFFFFFFF07000000000000FFFF000F0F00F0F00F0700000000000
    0FFF0F0FFFFFFFFFFFF07000000000000FFFFFFFFFFFFFFFFFF0700000000000
    0FFFFFFFFFFFFFFFFFF07000000000000FFFF00000F0FF0F00F0700000000000
    0FF0000FF0000F0FFFF07000000000000FFFFFFFFFFFFFFFFFF0700000000000
    0FFFFFFFFFFFFFFFFFF07000000000000FFFF0F000000000FFF0700000000000
    0FFFF0FF0F0F0FFFFFF07000000000000FFFFFFFFFFFFFFFFFF0700000000000
    0FFFFF000FFFFF8888807000000000000FFFF00F00FFF0000000700000000000
    0FFFFFFFFFFFF0FFFF000000000000000FFFFFFFFFFFF0FFF000000000000000
    0F000000F0FFF0FF00000000000000000FFFFFFFFFFFF0F00000000000000000
    0FFFFFFFFFFFF000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFF800007FF000007FF000007FF000007FF000
    007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF000
    007FF000007FF000007FF000007FF000007FF000007FF00000FFF00001FFF000
    03FFF00007FFF0000FFFF0001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    688
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 430
    Width = 155
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = '* Los ultimos n eventos ocurridos'
  end
  object Button1: TButton
    Left = 598
    Top = 428
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Refrescar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 688
    Height = 417
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clWhite
    ParentColor = False
    TabOrder = 1
    object ShowLogMsg: TStringGrid
      Left = 0
      Top = 0
      Width = 688
      Height = 409
      BorderStyle = bsNone
      ColCount = 6
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
      ScrollBars = ssNone
      TabOrder = 0
      OnDblClick = ShowLogMsgDblClick
      OnKeyPress = ShowLogMsgKeyPress
      ColWidths = (
        72
        89
        95
        96
        64
        268)
    end
  end
  object Button2: TButton
    Left = 512
    Top = 429
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cargar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.log'
    Filter = 'log|*.log'
    Left = 464
    Top = 424
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 240
    object Fichero1: TMenuItem
      Caption = 'Fichero'
      object Cargar1: TMenuItem
        Caption = 'Cargar'
        ShortCut = 16451
        OnClick = Cargar1Click
      end
      object Refrescar1: TMenuItem
        Caption = 'Refrescar'
        ShortCut = 16466
        OnClick = Refrescar1Click
      end
    end
    object Ayuda1: TMenuItem
      Caption = 'Ayuda'
      object Crditos1: TMenuItem
        Caption = 'Cr'#233'ditos'
        ShortCut = 16449
        OnClick = Crditos1Click
      end
    end
  end
end
