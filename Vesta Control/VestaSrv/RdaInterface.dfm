object RdaSrv: TRdaSrv
  OldCreateOrder = False
  AllowPause = False
  DisplayName = 'Rda'
  StartType = stManual
  OnStart = ServiceStart
  OnStop = ServiceStop
  Left = 192
  Top = 103
  Height = 150
  Width = 215
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 72
    Top = 32
  end
end
