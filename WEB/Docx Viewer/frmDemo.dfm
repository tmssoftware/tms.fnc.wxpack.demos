object Form2: TForm2
  Width = 1270
  Height = 918
  Caption = 'TTMSFNCWXDocx Demo'
  object TMSFNCWXDocxViewer1: TTMSFNCWXDocxViewer
    Left = 0
    Top = 49
    Width = 1270
    Height = 869
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Options.RenderChanges = False
    OnDocumentRendered = TMSFNCWXDocxViewer1DocumentRendered
    OnPageChange = TMSFNCWXDocxViewer1PageChange
    AutoClearCache = True
    EnableContextMenu = False
    EnableShowDebugConsole = False
    EnableAcceleratorKeys = False
    RemoveMargins = True
    ExplicitTop = 47
  end
  object Panel1: TWebPanel
    Left = 0
    Top = 0
    Width = 1270
    Height = 49
    Align = alTop
    TabOrder = 1
    object pageIndexLabel: TWebLabel
      Left = 832
      Top = 8
      Width = 31
      Height = 25
      Caption = '- / -'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object pageCountLabel: TWebLabel
      Left = 1049
      Top = 8
      Width = 31
      Height = 25
      Caption = '- / -'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
    end
    object PrevPageButton: TWebButton
      Left = 256
      Top = 8
      Width = 81
      Height = 33
      Caption = 'Previous Page'
      HeightPercent = 100.000000000000000000
      TabOrder = 1
      WidthPercent = 100.000000000000000000
      OnClick = PrevPageButtonClick
    end
    object NextPageButton: TWebButton
      Left = 345
      Top = 8
      Width = 81
      Height = 33
      Caption = 'Next Page'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = NextPageButtonClick
    end
    object WebFilePicker1: TWebFilePicker
      Left = 24
      Top = 14
      Width = 121
      Height = 19
      ChildOrder = 4
      OnChange = WebFilePicker1Change
      OnGetFileAsBase64 = WebFilePicker1GetFileAsBase64
    end
  end
end
