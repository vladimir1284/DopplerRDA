object Frame_Admin: TFrame_Admin
  Left = 0
  Top = 0
  Width = 250
  Height = 199
  TabOrder = 0
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 250
    Height = 174
    Align = alClient
    Columns = <
      item
        AutoSize = True
        Caption = 'Nombre'
      end
      item
        Alignment = taCenter
        Caption = 'Nivel'
        Width = 80
      end>
    ColumnClick = False
    FullDrag = True
    HotTrack = True
    HotTrackStyles = [htUnderlineHot]
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 0
    Top = 174
    Width = 250
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      250
      25)
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 250
      Height = 25
      Hint = 'Ejecutar plantilla'
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = '&Actualizar'
      Default = True
      Enabled = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 155
    Top = 135
    object Editar1: TMenuItem
      Caption = '&Editar...'
      ShortCut = 16397
      OnClick = Editar1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Insertar1: TMenuItem
      Caption = '&Insertar'
      ShortCut = 45
      OnClick = Insertar1Click
    end
    object Eliminar1: TMenuItem
      Caption = 'E&liminar'
      ShortCut = 46
      OnClick = Eliminar1Click
    end
  end
end
