object Configuration: TConfiguration
  Left = 328
  Top = 170
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Configuracion'
  ClientHeight = 296
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000F00200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000008000000000000
    00000000000000000888880000000000000003B000B300008800088000000000
    00000B3B3B3B00008000F080000000000000B3B3B3B3B0088000008800000000
    003B3B30003B3B30800000800000000000B3B3000F03B3B08800088000000000
    0F0B300000F03B0F08888800000000000003B0000000B300F008000000000000
    000B300000003B0000F000000000000000B3B3000003B3B00000000000000000
    003B3B30003B3B3000000000000000000F00B3B3B3B3B0000000000000000000
    000F0B3B3B3B0B30003B000000000000000003B000B003B3B3B3000000000000
    0000F0000F003B3B3B3B3000000000000000000000B3B3B000B3B3B000000000
    00000000003B3B000F0B3B3000000000000000000F03B00000F0B30000000000
    00000000000B300000003B0000000000000008000003B0000000B30000000000
    00088888003B3B00000B3B30000000000088000880B3B3B000B3B3B000000000
    008000F080003B3B3B3B30000000000008800000880F03B3B3B3000000000000
    F080000080000B30003B000000000000008800088000F0000F00000000000000
    0F08888800000000000000000000000000F00800000000000000000000000000
    0000F0000000000000000000000000000000000000000000000000000000FFFF
    FEFFFFFFF83FFF9CF01FFF00600FFE00400FFC000307F800030FF000000FF038
    001FF83C003FF83C107FF81C0DFFF0000FFFF0001CFFF800007FFE00007FFE00
    001FFF38000FFFF0000FFFF0381FFFB83C1FFE083C1FFC001C0FF800000FF000
    001FF0C0003FE0C2007FF00200FFF00739FFF80FFFFFFC1FFFFFFF7FFFFF0000
    000000000000}
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline FConfiguration: TFrame_RTConfiguration
    Left = 0
    Top = 0
    Width = 492
    Height = 296
    Align = alClient
    TabOrder = 0
    inherited Panel1: TPanel
      Top = 265
      Width = 492
      inherited Button2: TButton
        Left = 348
      end
      inherited Button1: TButton
        Left = 418
        OnClick = FConfigurationButton1Click
      end
    end
    inherited PageControl1: TPageControl
      Width = 492
      Height = 265
    end
  end
end
