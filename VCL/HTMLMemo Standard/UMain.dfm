object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX HTMLMemo Demo'
  ClientHeight = 486
  ClientWidth = 681
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 33
    Align = alTop
    TabOrder = 0
    object btnOpen: TButton
      Left = 8
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnOpenClick
    end
    object btnSave: TButton
      Left = 89
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Save as...'
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
  object TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo
    Left = 0
    Top = 33
    Width = 681
    Height = 453
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
  end
end
