object Demo: TDemo
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX VideoPlayer Demo'
  ClientHeight = 708
  ClientWidth = 915
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TMSFNCWXVideoPlayer1: TTMSFNCWXVideoPlayer
    Left = 0
    Top = 0
    Width = 915
    Height = 569
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Controls = False
    CurrentTime = 2.380153000000000000
    DisablePictureInPicture = False
    OnTimeUpdate = TMSFNCWXVideoPlayer1TimeUpdate
    OnError = TMSFNCWXVideoPlayer1Error
    OnMetaDataLoaded = TMSFNCWXVideoPlayer1MetaDataLoaded
    URL = 
      'https://upload.wikimedia.org/wikipedia/commons/3/37/Big_Buck_Bun' +
      'ny_with_VTT_acid_test.webm'
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 569
    Width = 915
    Height = 34
    Align = alBottom
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 603
    Width = 915
    Height = 105
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 9
      Top = 61
      Width = 34
      Height = 13
      Caption = 'Volume'
    end
    object Label2: TLabel
      Left = 9
      Top = 30
      Width = 40
      Height = 13
      Caption = 'Playrate'
    end
    object Label3: TLabel
      Left = 254
      Top = 88
      Width = 345
      Height = 13
      Caption = 
        'video: (c) copyright 2008, Blender Foundation / www.bigbuckbunny' +
        '.org'
    end
    object VolumeBar: TTrackBar
      Left = 71
      Top = 54
      Width = 110
      Height = 25
      Max = 100
      TabOrder = 0
      TickStyle = tsNone
      OnChange = VolumeBarChange
    end
    object Restart: TButton
      Left = 200
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Restart'
      TabOrder = 1
      OnClick = RestartClick
    end
    object Rewind: TButton
      Left = 281
      Top = 25
      Width = 75
      Height = 25
      Caption = '<<'
      TabOrder = 2
      OnClick = RewindClick
    end
    object Play: TButton
      Left = 362
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Play'
      TabOrder = 3
      OnClick = PlayClick
    end
    object Forward: TButton
      Left = 443
      Top = 25
      Width = 75
      Height = 25
      Caption = '>>'
      TabOrder = 4
      OnClick = ForwardClick
    end
    object Mute: TButton
      Left = 524
      Top = 25
      Width = 75
      Height = 25
      Caption = 'Mute'
      TabOrder = 5
      OnClick = MuteClick
    end
    object ToggleAutoPlay: TCheckBox
      Left = 200
      Top = 56
      Width = 75
      Height = 17
      Caption = 'Autoplay'
      TabOrder = 6
      OnClick = ToggleAutoPlayClick
    end
    object ToggleLoop: TCheckBox
      Left = 362
      Top = 56
      Width = 75
      Height = 17
      Caption = 'Loop'
      TabOrder = 7
      OnClick = ToggleLoopClick
    end
    object ToggleControls: TCheckBox
      Left = 524
      Top = 56
      Width = 85
      Height = 17
      Caption = 'Show controls'
      TabOrder = 8
      OnClick = ToggleControlsClick
    end
    object PlayRate: TComboBox
      Left = 71
      Top = 27
      Width = 110
      Height = 21
      ItemIndex = 3
      TabOrder = 9
      Text = 'x 1'
      OnChange = PlayRateChange
      Items.Strings = (
        'x 0.25'
        'x 0.5'
        'x 0.75'
        'x 1'
        'x 1.25'
        'x 1.5'
        'x 1.75'
        'x 2')
    end
    object TogglePiP: TButton
      Left = 625
      Top = 22
      Width = 136
      Height = 60
      Caption = 'Toggle Picture In Picture'
      TabOrder = 10
      OnClick = TogglePiPClick
    end
    object LoadLocalVideo: TButton
      Left = 767
      Top = 22
      Width = 136
      Height = 60
      Caption = 'Load Local Video'
      TabOrder = 11
      OnClick = LoadLocalVideoClick
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'video| *.MP4 | *.WEBM | *.OGG'
    Left = 8
    Top = 5
  end
end
