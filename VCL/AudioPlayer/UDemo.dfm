object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX Audio Demo'
  ClientHeight = 199
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    521
    199)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 385
    Top = 171
    Width = 65
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Playback rate'
  end
  object TMSFNCWXAudioPlayer1: TTMSFNCWXAudioPlayer
    Left = 0
    Top = 0
    Width = 521
    Height = 65
    Align = alTop
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    URL = 
      'https://file-examples-com.github.io/uploads/2017/11/file_example' +
      '_MP3_5MG.mp3'
    OnPlay = TMSFNCWXAudioPlayer1Play
    OnPause = TMSFNCWXAudioPlayer1Pause
    OnTimeUpdate = TMSFNCWXAudioPlayer1TimeUpdate
    OnMetaDataLoaded = TMSFNCWXAudioPlayer1MetaDataLoaded
  end
  object urlEdt: TEdit
    Left = 8
    Top = 71
    Width = 319
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Text = 
      'https://file-examples-com.github.io/uploads/2017/11/file_example' +
      '_MP3_5MG.mp3'
  end
  object urlBtn: TButton
    Left = 333
    Top = 71
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Load URL'
    TabOrder = 2
    OnClick = urlBtnClick
  end
  object fileBtn: TButton
    Left = 414
    Top = 71
    Width = 99
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Load local file'
    TabOrder = 3
    OnClick = fileBtnClick
  end
  object ctrlChk: TCheckBox
    Left = 8
    Top = 102
    Width = 89
    Height = 17
    Caption = 'Show controls'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = ctrlChkClick
  end
  object autoChk: TCheckBox
    Left = 103
    Top = 102
    Width = 73
    Height = 17
    Caption = 'Autoplay'
    TabOrder = 5
    OnClick = autoChkClick
  end
  object loopChk: TCheckBox
    Left = 182
    Top = 102
    Width = 58
    Height = 17
    Caption = 'Loop'
    TabOrder = 6
    OnClick = loopChkClick
  end
  object lengthPb: TProgressBar
    Left = 8
    Top = 143
    Width = 329
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
  end
  object volTb: TTrackBar
    Left = 343
    Top = 136
    Width = 120
    Height = 25
    Anchors = [akTop, akRight]
    Max = 100
    Position = 50
    ShowSelRange = False
    TabOrder = 8
    TickStyle = tsNone
    OnChange = volTbChange
  end
  object rateCb: TComboBox
    Left = 463
    Top = 168
    Width = 50
    Height = 21
    Style = csDropDownList
    Anchors = [akTop, akRight]
    ItemIndex = 3
    TabOrder = 9
    Text = 'x1'
    OnChange = rateCbChange
    Items.Strings = (
      'x0.25'
      'x0.5'
      'x0.75'
      'x1'
      'x1.25'
      'x1.5'
      'x1.75'
      'x2')
  end
  object replayBtn: TButton
    Left = 8
    Top = 164
    Width = 65
    Height = 25
    Caption = 'Replay'
    TabOrder = 10
    OnClick = replayBtnClick
  end
  object rewBtn: TButton
    Left = 79
    Top = 164
    Width = 32
    Height = 25
    Caption = '<<'
    TabOrder = 11
    OnClick = rewBtnClick
  end
  object playBtn: TButton
    Left = 117
    Top = 164
    Width = 66
    Height = 25
    Caption = 'Play'
    TabOrder = 12
    OnClick = playBtnClick
  end
  object forwBtn: TButton
    Left = 189
    Top = 164
    Width = 32
    Height = 25
    Caption = '>>'
    TabOrder = 13
    OnClick = forwBtnClick
  end
  object muteChk: TCheckBox
    Left = 471
    Top = 138
    Width = 42
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Mute'
    TabOrder = 14
    OnClick = muteChkClick
  end
  object OpenDialog1: TOpenDialog
    Left = 264
    Top = 160
  end
end
