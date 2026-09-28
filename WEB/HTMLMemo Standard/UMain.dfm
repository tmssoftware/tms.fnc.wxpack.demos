object Form1: TForm1
  Width = 640
  Height = 480
  Caption = 'TMS FNC WX HTMLMemo Demo'
  object WebPanel1: TWebPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alTop
    BorderColor = clSilver
    BorderStyle = bsSingle
    object WebBitBtn1: TWebBitBtn
      Left = 8
      Top = 8
      Width = 80
      Height = 25
      Caption = 'Open'
      Color = clNone
      HeightPercent = 100.000000000000000000
      MaterialGlyph = 'folder_open'
      WidthPercent = 100.000000000000000000
      OnClick = WebBitBtn1Click
    end
    object WebBitBtn2: TWebBitBtn
      Left = 94
      Top = 8
      Width = 80
      Height = 25
      Caption = 'Save'
      Color = clNone
      HeightPercent = 100.000000000000000000
      MaterialGlyph = 'save'
      WidthPercent = 100.000000000000000000
      OnClick = WebBitBtn2Click
    end
  end
  object TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo
    Left = 0
    Top = 41
    Width = 640
    Height = 439
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
  end
  object WebOpenDialog1: TWebOpenDialog
    Left = 552
    Top = 8
  end
end
