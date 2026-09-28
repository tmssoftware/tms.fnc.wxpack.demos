object Demo: TDemo
  Width = 641
  Height = 328
  Caption = 'TMS FNC WX SpeechSynthesis Demo'
  FormContainer = 'appcontent'
  object WebLabel1: TWebLabel
    Left = 16
    Top = 276
    Width = 3
    Height = 13
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel2: TWebLabel
    Left = 8
    Top = 276
    Width = 188
    Height = 13
    Caption = 'FNC WX JSON Formatter for web demo'
    ElementID = 'title'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel3: TWebLabel
    Left = 8
    Top = 295
    Width = 217
    Height = 13
    Caption = 'usage of TTMSFNCWXJSONFormatter control'
    ElementID = 'description'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object TMSFNCWXSpeechSynthesis1: TTMSFNCWXSpeechSynthesis
    Left = 449
    Top = 212
    Width = 26
    Height = 26
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Visible = True
    Pitch = 1.000000000000000000
    Rate = 1.000000000000000000
    Volume = 1.000000000000000000
    OnStart = TMSFNCWXSpeechSynthesis1Start
    OnPause = TMSFNCWXSpeechSynthesis1Pause
    OnResume = TMSFNCWXSpeechSynthesis1Resume
    OnEnd = TMSFNCWXSpeechSynthesis1End
  end
  object Input: TWebMemo
    Left = 9
    Top = 8
    Width = 624
    Height = 193
    Hint = 'Type your text here...'
    AutoSize = False
    ElementClassName = 'form-control'
    HeightPercent = 100.000000000000000000
    Lines.Strings = (
      
        'Did you know that  the speech synthesis component can speak in d' +
        'ifferent languages and voice types? Click on configure voice '
      'to find out more.')
    SelLength = 0
    SelStart = 144
    WidthPercent = 100.000000000000000000
  end
  object Speak: TWebButton
    Left = 9
    Top = 212
    Width = 96
    Height = 50
    Caption = 'Speak'
    ChildOrder = 2
    ElementClassName = 'btn btn-secondary'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = SpeakClick
  end
  object Configure: TWebButton
    Left = 481
    Top = 212
    Width = 152
    Height = 50
    Caption = 'Configure Voice'
    ChildOrder = 2
    ElementClassName = 'btn btn-secondary'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = ConfigureClick
  end
  object Pause: TWebButton
    Left = 111
    Top = 212
    Width = 96
    Height = 50
    Caption = 'Pause'
    ChildOrder = 2
    ElementClassName = 'btn btn-secondary'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = PauseClick
  end
  object Resume: TWebButton
    Left = 213
    Top = 212
    Width = 96
    Height = 50
    Caption = 'Resume'
    ChildOrder = 2
    ElementClassName = 'btn btn-secondary'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = ResumeClick
  end
  object Cancel: TWebButton
    Left = 315
    Top = 212
    Width = 96
    Height = 50
    Caption = 'Cancel'
    ChildOrder = 2
    ElementClassName = 'btn btn-secondary'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = CancelClick
  end
end
