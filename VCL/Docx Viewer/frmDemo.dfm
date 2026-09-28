object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TTMSFNCWXDocx Demo'
  ClientHeight = 918
  ClientWidth = 1270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
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
    LibraryLocation = llOffline
    ExplicitWidth = 1264
    ExplicitHeight = 852
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1270
    Height = 49
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 1264
    object pageIndexLabel: TLabel
      Left = 832
      Top = 8
      Width = 21
      Height = 15
      Caption = '- / -'
    end
    object pageCountLabel: TLabel
      Left = 1049
      Top = 8
      Width = 21
      Height = 15
      Caption = '- / -'
    end
    object LoadFileButton: TButton
      Left = 8
      Top = 8
      Width = 105
      Height = 33
      Caption = 'Open Document'
      TabOrder = 2
      WordWrap = True
      OnClick = LoadFileButtonClick
    end
    object PrevPageButton: TButton
      Left = 256
      Top = 8
      Width = 81
      Height = 33
      Caption = 'Previous Page'
      TabOrder = 1
      WordWrap = True
      OnClick = PrevPageButtonClick
    end
    object NextPageButton: TButton
      Left = 345
      Top = 8
      Width = 81
      Height = 33
      Caption = 'Next Page'
      TabOrder = 0
      WordWrap = True
      OnClick = NextPageButtonClick
    end
  end
end
