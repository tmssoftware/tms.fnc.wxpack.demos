object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX Camera Demo'
  ClientHeight = 674
  ClientWidth = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 347
    Width = 152
    Height = 13
    Caption = 'Image taken from camera feed:'
  end
  object Image1: TImage
    Left = 8
    Top = 366
    Width = 400
    Height = 300
    Proportional = True
  end
  object TMSFNCWXCamera1: TTMSFNCWXCamera
    Left = 7
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
  object startBtn: TButton
    Tag = 101
    Left = 8
    Top = 314
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = startBtnClick
  end
  object pauseBtn: TButton
    Tag = 102
    Left = 89
    Top = 314
    Width = 75
    Height = 25
    Caption = 'Pause'
    Enabled = False
    TabOrder = 2
    OnClick = startBtnClick
  end
  object stopBtn: TButton
    Tag = 103
    Left = 170
    Top = 314
    Width = 75
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 3
    OnClick = startBtnClick
  end
  object ssBtn: TButton
    Tag = 104
    Left = 251
    Top = 314
    Width = 157
    Height = 25
    Caption = 'Take snapshot'
    Enabled = False
    TabOrder = 4
    OnClick = startBtnClick
  end
end
