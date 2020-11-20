object RxPlotForm: TRxPlotForm
  Left = 257
  Top = 220
  Width = 473
  Height = 358
  Caption = 'Tabla del Receptor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Board: TChart
    Left = 0
    Top = 0
    Width = 465
    Height = 324
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'C'#243'digos - Potencia')
    BottomAxis.Grid.Visible = False
    BottomAxis.Title.Caption = 'Potencia'
    LeftAxis.Grid.Visible = False
    LeftAxis.Title.Caption = 'Codigos'
    Legend.Visible = False
    View3D = False
    Align = alClient
    TabOrder = 0
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Title = 'PotVsCod'
      Pointer.Brush.Color = clRed
      Pointer.HorizSize = 1
      Pointer.InflateMargins = True
      Pointer.Style = psCircle
      Pointer.VertSize = 1
      Pointer.Visible = True
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1.000000000000000000
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1.000000000000000000
      YValues.Order = loNone
    end
  end
end