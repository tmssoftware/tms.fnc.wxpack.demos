object Form1: TForm1
  Width = 528
  Height = 234
  object WebLabel1: TWebLabel
    Left = 381
    Top = 178
    Width = 65
    Height = 13
    Caption = 'Playback rate'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object TMSFNCWXAudioPlayer1: TTMSFNCWXAudioPlayer
    Left = 8
    Top = 8
    Width = 500
    Height = 65
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
  object urlEdt: TWebEdit
    Left = 8
    Top = 79
    Width = 386
    Height = 25
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    Text = 
      'https://file-examples-com.github.io/uploads/2017/11/file_example' +
      '_MP3_5MG.mp3'
    WidthPercent = 100.000000000000000000
  end
  object urlBtn: TWebButton
    Left = 400
    Top = 79
    Width = 108
    Height = 25
    Caption = 'Load URL'
    ChildOrder = 2
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = urlBtnClick
  end
  object replayBtn: TWebButton
    Left = 8
    Top = 172
    Width = 73
    Height = 25
    Caption = 'Replay'
    ChildOrder = 3
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = replayBtnClick
  end
  object ctrlChk: TWebCheckBox
    Left = 8
    Top = 110
    Width = 96
    Height = 22
    Caption = 'Show controls'
    Checked = True
    ChildOrder = 4
    Color = clNone
    HeightPercent = 100.000000000000000000
    State = cbChecked
    WidthPercent = 100.000000000000000000
    OnClick = ctrlChkClick
  end
  object autoChk: TWebCheckBox
    Left = 110
    Top = 110
    Width = 67
    Height = 22
    Caption = 'Autoplay'
    ChildOrder = 5
    Color = clNone
    HeightPercent = 100.000000000000000000
    State = cbUnchecked
    WidthPercent = 100.000000000000000000
    OnClick = autoChkClick
  end
  object loopChk: TWebCheckBox
    Left = 183
    Top = 110
    Width = 58
    Height = 22
    Caption = 'Loop'
    ChildOrder = 6
    Color = clNone
    HeightPercent = 100.000000000000000000
    State = cbUnchecked
    WidthPercent = 100.000000000000000000
    OnClick = loopChkClick
  end
  object lengthPb: TWebProgressBar
    Left = 8
    Top = 157
    Width = 321
    Height = 9
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ChildOrder = 7
  end
  object volTb: TWebTrackBar
    Left = 342
    Top = 152
    Width = 99
    Height = 20
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ChildOrder = 8
    Max = 100
    Min = 0
    Position = 50
    Role = ''
    OnChange = volTbChange
  end
  object muteChk: TWebCheckBox
    Left = 459
    Top = 152
    Width = 49
    Height = 22
    Caption = 'Mute'
    ChildOrder = 9
    Color = clNone
    HeightPercent = 100.000000000000000000
    State = cbUnchecked
    WidthPercent = 100.000000000000000000
    OnClick = muteChkClick
  end
  object rewBtn: TWebButton
    Left = 87
    Top = 172
    Width = 34
    Height = 25
    Caption = '<<'
    ChildOrder = 10
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = rewBtnClick
  end
  object playBtn: TWebButton
    Left = 127
    Top = 172
    Width = 66
    Height = 25
    Caption = 'Play'
    ChildOrder = 11
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = playBtnClick
  end
  object forwBtn: TWebButton
    Left = 199
    Top = 172
    Width = 34
    Height = 25
    Caption = '>>'
    ChildOrder = 12
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = forwBtnClick
  end
  object rateCb: TWebComboBox
    Left = 452
    Top = 174
    Width = 56
    Height = 21
    HeightPercent = 100.000000000000000000
    Text = 'x1'
    WidthPercent = 100.000000000000000000
    OnChange = rateCbChange
    ItemIndex = 3
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
end
