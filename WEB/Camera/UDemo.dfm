object Form1: TForm1
  Width = 422
  Height = 684
  object WebLabel1: TWebLabel
    Left = 8
    Top = 352
    Width = 152
    Height = 13
    Caption = 'Image taken from camera feed:'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebImageControl1: TWebImageControl
    Left = 8
    Top = 371
    Width = 400
    Height = 300
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ChildOrder = 6
  end
  object TMSFNCWXCamera1: TTMSFNCWXCamera
    Left = 8
    Top = 8
    Width = 400
    Height = 300
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    OnStart = TMSFNCWXCamera1Start
    OnPause = TMSFNCWXCamera1Pause
    OnStop = TMSFNCWXCamera1Stop
    OnSnapshot = TMSFNCWXCamera1Snapshot
  end
  object startBtn: TWebButton
    Tag = 101
    Left = 8
    Top = 314
    Width = 70
    Height = 25
    Caption = 'Start'
    ChildOrder = 2
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = startBtnClick
  end
  object pauseBtn: TWebButton
    Tag = 102
    Left = 84
    Top = 314
    Width = 70
    Height = 25
    Caption = 'Pause'
    ChildOrder = 2
    Enabled = False
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = startBtnClick
  end
  object stopBtn: TWebButton
    Tag = 103
    Left = 160
    Top = 314
    Width = 70
    Height = 25
    Caption = 'Stop'
    ChildOrder = 2
    Enabled = False
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = startBtnClick
  end
  object ssBtn: TWebButton
    Tag = 104
    Left = 236
    Top = 314
    Width = 172
    Height = 25
    Caption = 'Take snapshot'
    ChildOrder = 2
    Enabled = False
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = startBtnClick
  end
end
