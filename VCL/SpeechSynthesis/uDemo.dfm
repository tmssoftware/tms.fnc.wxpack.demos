object Demo: TDemo
  Left = 0
  Top = 0
  ParentCustomHint = False
  BorderStyle = bsSingle
  Caption = 'TMS FNC WX SpeechSynthesis Demo'
  ClientHeight = 259
  ClientWidth = 718
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
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 703
    Height = 193
    Lines.Strings = (
      
        'Did you know that the speech synthesis component can speak in di' +
        'fferent languages and voice types? Click on configure voice to f' +
        'ind out more.')
    TabOrder = 0
  end
  object Speak: TButton
    Left = 8
    Top = 207
    Width = 100
    Height = 26
    Caption = 'Speak'
    TabOrder = 1
    OnClick = SpeakClick
  end
  object Configure: TButton
    Left = 574
    Top = 207
    Width = 136
    Height = 26
    Caption = 'Configure Voices'
    TabOrder = 2
    OnClick = ConfigureClick
  end
  object Pause: TButton
    Left = 114
    Top = 207
    Width = 100
    Height = 26
    Caption = 'Pause'
    TabOrder = 3
    OnClick = PauseClick
  end
  object Resume: TButton
    Left = 220
    Top = 207
    Width = 100
    Height = 26
    Caption = 'Resume'
    TabOrder = 4
    OnClick = ResumeClick
  end
  object Cancel: TButton
    Left = 326
    Top = 207
    Width = 100
    Height = 26
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = CancelClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 240
    Width = 718
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object TMSFNCWXSpeechSynthesis1: TTMSFNCWXSpeechSynthesis
    Left = 480
    Top = 207
    Width = 26
    Height = 26
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 7
    Visible = True
    Pitch = 1.000000000000000000
    Rate = 1.000000000000000000
    Volume = 1.000000000000000000
  end
end
