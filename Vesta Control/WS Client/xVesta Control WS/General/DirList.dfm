object DirectoryList: TDirectoryList
  Left = 399
  Top = 154
  Width = 316
  Height = 324
  BorderIcons = []
  Caption = 'Seleccione un directorio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  DesignSize = (
    308
    290)
  PixelsPerInch = 96
  TextHeight = 13
  object Directories: TShellTreeView
    Left = 0
    Top = 0
    Width = 308
    Height = 241
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    UseShellImages = True
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoRefresh = False
    BorderStyle = bsNone
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
    OnChange = DirectoriesChange
  end
  object BitBtn1: TBitBtn
    Left = 154
    Top = 245
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Aceptar'
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 230
    Top = 245
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 2
    Kind = bkCancel
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 271
    Width = 308
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end
