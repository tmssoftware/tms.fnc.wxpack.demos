object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX Barcode Demo'
  ClientHeight = 369
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 376
    Top = 8
    Width = 73
    Height = 13
    Caption = 'Text to encode'
  end
  object Label2: TLabel
    Left = 376
    Top = 64
    Width = 64
    Height = 13
    Caption = 'Barcode type'
  end
  object TMSFNCWXBarcode1: TTMSFNCWXBarcode
    Left = 8
    Top = 8
    Width = 350
    Height = 350
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Text = 'helloworld'
  end
  object TMSFNCWXQRCode1: TTMSFNCWXQRCode
    Left = 8
    Top = 8
    Width = 350
    Height = 350
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
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
  object Edit1: TEdit
    Left = 376
    Top = 27
    Width = 188
    Height = 21
    TabOrder = 2
    Text = 'helloworld'
    OnChange = Edit1Change
  end
  object RadioButton1: TRadioButton
    Tag = 100
    Left = 376
    Top = 83
    Width = 188
    Height = 17
    Caption = 'QR'
    Checked = True
    TabOrder = 3
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Tag = 101
    Left = 376
    Top = 106
    Width = 188
    Height = 17
    Caption = 'Code 128'
    TabOrder = 4
    OnClick = RadioButton1Click
  end
  object RadioButton3: TRadioButton
    Tag = 102
    Left = 376
    Top = 129
    Width = 188
    Height = 17
    Caption = 'Code 39 Extended'
    TabOrder = 5
    OnClick = RadioButton1Click
  end
  object RadioButton4: TRadioButton
    Tag = 103
    Left = 376
    Top = 152
    Width = 188
    Height = 17
    Caption = 'Code 93 Extended'
    TabOrder = 6
    OnClick = RadioButton1Click
  end
  object RadioButton5: TRadioButton
    Tag = 104
    Left = 376
    Top = 175
    Width = 188
    Height = 17
    Caption = 'Telepen'
    TabOrder = 7
    OnClick = RadioButton1Click
  end
  object RadioButton6: TRadioButton
    Tag = 105
    Left = 376
    Top = 198
    Width = 188
    Height = 17
    Caption = 'PDF417'
    TabOrder = 8
    OnClick = RadioButton1Click
  end
end
