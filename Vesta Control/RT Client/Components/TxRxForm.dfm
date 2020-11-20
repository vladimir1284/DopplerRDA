object TxRxs_Form: TTxRxs_Form
  Left = 324
  Top = 208
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Calibracion de los trasmisores y receptores'
  ClientHeight = 296
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000077777777000000000000000000000077777777777700000000000000
    0000777770000007777700000000000000077770000000000777700000000000
    0077700000000000000777000000000000770000000000000000770000000000
    0777000001111110000077700000000007700001111111111000077000000000
    7770001111111111110007770000000077000011111111111100007700000000
    F700011111111111111000770000000077000171111111111110007700000000
    F7000177111111111110007700000000F7000177111111111110007700000000
    F7000017711111111100007700000000F7700011771111111100077700000000
    0F7000011777771110000770000000000F770000011111100000777000000000
    00F7000000000000000077000000000000F77000000000000007770000000000
    000F77700000000007777000000000000000FF77700000077777000000000000
    000000FF77777777770000000000000000000000FFF7F7770000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFF00FFFFFC003FFFF0000FFFE00007FFC00003FF800
    001FF800001FF000000FF000000FE0000007E0000007E0000007E0000007E000
    0007E0000007E0000007E0000007F000000FF000000FF800001FF800001FFC00
    003FFE00007FFF0000FFFFC003FFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFF}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 242
    Height = 296
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TxRx1'
      inline TxRx1: TFrame_Calibration
        Left = 0
        Top = 0
        Width = 234
        Height = 268
        Align = alClient
        TabOrder = 0
        inherited Panel1: TPanel
          Top = 232
          Width = 234
          inherited Panel2: TPanel
            Left = 93
          end
        end
        inherited PageControl1: TPageControl
          Width = 234
          Height = 232
          inherited TabSheet3: TTabSheet
            inherited HeaderControl1: THeaderControl
              Sections = <
                item
                  AllowClick = False
                  ImageIndex = -1
                  Text = 'Potencia [dB]'
                  Width = 100
                end
                item
                  Alignment = taCenter
                  AllowClick = False
                  ImageIndex = -1
                  Text = 'Codigo'
                  Width = 126
                end>
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TxRx2'
      ImageIndex = 1
      inline TxRx2: TFrame_Calibration
        Left = 0
        Top = 0
        Width = 234
        Height = 268
        Align = alClient
        TabOrder = 0
        inherited Panel1: TPanel
          Top = 232
          Width = 234
          inherited Panel2: TPanel
            Left = 93
          end
        end
        inherited PageControl1: TPageControl
          Width = 234
          Height = 232
          inherited TabSheet3: TTabSheet
            inherited HeaderControl1: THeaderControl
              Sections = <
                item
                  AllowClick = False
                  ImageIndex = -1
                  Text = 'Potencia [dB]'
                  Width = 100
                end
                item
                  Alignment = taCenter
                  AllowClick = False
                  ImageIndex = -1
                  Text = 'Codigo'
                  Width = 126
                end>
            end
          end
        end
      end
    end
  end
end
