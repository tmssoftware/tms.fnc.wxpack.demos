object Form1: TForm1
  Width = 559
  Height = 370
  Caption = 'TMS FNC WX Barcode Demo'
  OnCreate = WebFormCreate
  object WebLabel1: TWebLabel
    Left = 376
    Top = 8
    Width = 73
    Height = 13
    Caption = 'Text to encode'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel2: TWebLabel
    Left = 376
    Top = 72
    Width = 64
    Height = 13
    Caption = 'Barcode type'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object TMSFNCWXBarcode1: TTMSFNCWXBarcode
    Left = 8
    Top = 8
    Width = 350
    Height = 350
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    Visible = False
    Text = 'helloworld'
  end
  object WebEdit1: TWebEdit
    Left = 376
    Top = 27
    Width = 161
    Height = 22
    ChildOrder = 3
    HeightPercent = 100.000000000000000000
    Text = 'helloworld'
    WidthPercent = 100.000000000000000000
    OnChange = WebEdit1Change
  end
  object WebRadioButton1: TWebRadioButton
    Tag = 103
    Left = 376
    Top = 163
    Width = 161
    Height = 22
    Caption = 'Code 93 Extended'
    Checked = False
    ChildOrder = 4
    Color = clNone
    GroupName = 'codetype'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebRadioButton4Click
  end
  object WebRadioButton2: TWebRadioButton
    Tag = 101
    Left = 376
    Top = 116
    Width = 161
    Height = 22
    Caption = 'Code 128'
    Checked = False
    ChildOrder = 4
    Color = clNone
    GroupName = 'codetype'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebRadioButton4Click
  end
  object WebRadioButton3: TWebRadioButton
    Tag = 102
    Left = 376
    Top = 139
    Width = 161
    Height = 22
    Caption = 'Code 39 Extended'
    Checked = False
    ChildOrder = 4
    Color = clNone
    GroupName = 'codetype'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebRadioButton4Click
  end
  object WebRadioButton4: TWebRadioButton
    Tag = 100
    Left = 376
    Top = 93
    Width = 161
    Height = 22
    Caption = 'QR'
    Checked = True
    ChildOrder = 4
    Color = clNone
    GroupName = 'codetype'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebRadioButton4Click
  end
  object WebRadioButton5: TWebRadioButton
    Tag = 104
    Left = 376
    Top = 187
    Width = 161
    Height = 22
    Caption = 'Telepen'
    Checked = False
    ChildOrder = 4
    Color = clNone
    GroupName = 'codetype'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebRadioButton4Click
  end
  object WebRadioButton6: TWebRadioButton
    Tag = 105
    Left = 376
    Top = 211
    Width = 161
    Height = 22
    Caption = 'PDF417'
    Checked = False
    ChildOrder = 4
    Color = clNone
    GroupName = 'codetype'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebRadioButton4Click
  end
  object TMSFNCWXQRCode1: TTMSFNCWXQRCode
    Left = 8
    Top = 8
    Width = 350
    Height = 350
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Text = 'helloworld'
    Settings.TitleFont.Charset = DEFAULT_CHARSET
    Settings.TitleFont.Color = clWindowText
    Settings.TitleFont.Height = -11
    Settings.TitleFont.Name = 'Tahoma'
    Settings.TitleFont.Style = []
    Settings.SubTitleFont.Charset = DEFAULT_CHARSET
    Settings.SubTitleFont.Color = clWindowText
    Settings.SubTitleFont.Height = -11
    Settings.SubTitleFont.Name = 'Tahoma'
    Settings.SubTitleFont.Style = []
    Settings.AutoColorDarkAlpha = 0.600000023841857900
    Settings.AutoColorLightAlpha = 0.699999988079071000
  end
end
