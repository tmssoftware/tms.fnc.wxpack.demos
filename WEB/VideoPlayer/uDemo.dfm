object Demo: TDemo
  Width = 1043
  Height = 657
  Caption = 'TMS FNC WX VideoPlayer Demo'
  FormContainer = 'appcontent'
  OnCreate = WebFormCreate
  object WebLabel1: TWebLabel
    Left = 8
    Top = 527
    Width = 34
    Height = 13
    Caption = 'Volume'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel2: TWebLabel
    Left = 8
    Top = 582
    Width = 62
    Height = 13
    Caption = 'Playbackrate'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel3: TWebLabel
    Left = 8
    Top = 634
    Width = 345
    Height = 13
    Alignment = taRightJustify
    Caption = 
      'video: (c) copyright 2008, Blender Foundation / www.bigbuckbunny' +
      '.org'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel4: TWebLabel
    Left = 779
    Top = 617
    Width = 167
    Height = 13
    Caption = 'FNC WX VideoPlayer for web demo'
    ElementID = 'title'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel5: TWebLabel
    Left = 779
    Top = 636
    Width = 164
    Height = 13
    Caption = 'Usage of TTMSFNCWXVideoPlayer'
    ElementID = 'description'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object TMSFNCWXVideoPlayer1: TTMSFNCWXVideoPlayer
    Left = 8
    Top = 10
    Width = 1009
    Height = 481
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    AutoPlay = False
    AutoPictureInPicture = True
    Controls = False
    CurrentTime = 8.948858000000000000
    DisablePictureInPicture = False
    EnableContextMenu = False
    EnableShowDebugConsole = False
    Loop = False
    Muted = False
    OnTimeUpdate = TMSFNCWXVideoPlayer1TimeUpdate
    OnMetaDataLoaded = TMSFNCWXVideoPlayer1MetaDataLoaded
    PictureInPicture = False
    PlayBackRate = 1.000000000000000000
    Preload = plAuto
    URL = 
      'https://upload.wikimedia.org/wikipedia/commons/3/37/Big_Buck_Bun' +
      'ny_with_VTT_acid_test.webm'
    Volume = 0.500000000000000000
  end
  object Play: TWebButton
    Left = 496
    Top = 527
    Width = 72
    Height = 73
    Caption = 'Play'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = PlayClick
  end
  object Forward: TWebButton
    Left = 574
    Top = 527
    Width = 72
    Height = 73
    Caption = '>>'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = ForwardClick
  end
  object Rewind: TWebButton
    Left = 418
    Top = 527
    Width = 72
    Height = 73
    Caption = '<<'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = RewindClick
  end
  object Mute: TWebButton
    Left = 652
    Top = 527
    Width = 72
    Height = 73
    Caption = 'Mute'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = MuteClick
  end
  object Restart: TWebButton
    Left = 340
    Top = 527
    Width = 72
    Height = 73
    Caption = 'Restart'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = RestartClick
  end
  object TogglePiP: TWebButton
    Left = 856
    Top = 527
    Width = 161
    Height = 73
    Caption = 'Picture in Picture'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = TogglePiPClick
  end
  object VolumeBar: TWebTrackBar
    Left = 112
    Top = 527
    Width = 150
    Height = 20
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ChildOrder = 8
    Max = 100
    Min = 0
    Position = 0
    Role = ''
    OnChange = VolumeBarChange
  end
  object ToggleLoop: TWebCheckBox
    Left = 611
    Top = 606
    Width = 113
    Height = 22
    Caption = 'Loop'
    ChildOrder = 9
    Color = clNone
    HeightPercent = 100.000000000000000000
    State = cbUnchecked
    WidthPercent = 100.000000000000000000
    OnClick = ToggleLoopClick
  end
  object ToggleAutoPlay: TWebCheckBox
    Left = 472
    Top = 606
    Width = 113
    Height = 22
    Caption = 'Autoplay'
    ChildOrder = 9
    Color = clNone
    HeightPercent = 100.000000000000000000
    State = cbUnchecked
    WidthPercent = 100.000000000000000000
    OnClick = ToggleAutoPlayClick
  end
  object ToggleControls: TWebCheckBox
    Left = 340
    Top = 606
    Width = 113
    Height = 22
    Caption = 'Show Controls'
    ChildOrder = 9
    Color = clNone
    HeightPercent = 100.000000000000000000
    State = cbUnchecked
    WidthPercent = 100.000000000000000000
    OnClick = ToggleControlsClick
  end
  object WebProgressBar1: TWebProgressBar
    Left = 8
    Top = 497
    Width = 1009
    Height = 24
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ChildOrder = 12
  end
  object PlayBackRate: TWebComboBox
    Left = 112
    Top = 579
    Width = 145
    Height = 21
    HeightPercent = 100.000000000000000000
    Text = 'x 1.00'
    WidthPercent = 100.000000000000000000
    OnChange = PlayBackRateChange
    ItemIndex = 3
    Items.Strings = (
      'x 0.25'
      'x 0.50'
      'x 0.75'
      'x 1.00'
      'x 1.25'
      'x 1.50'
      'x 1.75'
      'x 2.00')
  end
end
