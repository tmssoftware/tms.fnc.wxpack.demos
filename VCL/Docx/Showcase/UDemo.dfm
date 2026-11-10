object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX Pack - Docx generator and viewer'
  ClientHeight = 840
  ClientWidth = 1280
  Color = 15921906
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 4929572
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 840
    Align = alLeft
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblTitle: TLabel
      Left = 22
      Top = 20
      Width = 68
      Height = 25
      Caption = 'Invoice'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 6503963
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
    object lblSubTitle: TLabel
      Left = 22
      Top = 48
      Width = 300
      Height = 15
      Caption = 'Change anything, the document on the right follows.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9666411
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblCustomer: TLabel
      Left = 22
      Top = 86
      Width = 52
      Height = 15
      Caption = 'Customer'
    end
    object lblNumber: TLabel
      Left = 22
      Top = 142
      Width = 82
      Height = 15
      Caption = 'Invoice number'
    end
    object lblAccent: TLabel
      Left = 180
      Top = 142
      Width = 68
      Height = 15
      Caption = 'Accent colour'
    end
    object lblItems: TLabel
      Left = 22
      Top = 198
      Width = 55
      Height = 15
      Caption = 'Line items'
    end
    object edCustomer: TEdit
      Left = 22
      Top = 105
      Width = 300
      Height = 23
      TabOrder = 0
      Text = 'Northwind Bicycles NV'
      OnChange = InputChange
    end
    object edNumber: TEdit
      Left = 22
      Top = 161
      Width = 142
      Height = 23
      TabOrder = 1
      Text = '2026-0042'
      OnChange = InputChange
    end
    object cbAccent: TComboBox
      Left = 180
      Top = 161
      Width = 142
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'Blue'
      OnChange = InputChange
      Items.Strings = (
        'Blue'
        'Green'
        'Orange'
        'Purple')
    end
    object sgItems: TStringGrid
      Left = 22
      Top = 217
      Width = 300
      Height = 180
      ColCount = 3
      DefaultRowHeight = 24
      FixedCols = 0
      RowCount = 7
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor]
      ScrollBars = ssNone
      TabOrder = 3
      OnSetEditText = sgItemsSetEditText
    end
    object chkLandscape: TCheckBox
      Left = 22
      Top = 414
      Width = 300
      Height = 17
      Caption = 'Landscape page'
      TabOrder = 4
      OnClick = InputChange
    end
    object chkTerms: TCheckBox
      Left = 22
      Top = 440
      Width = 300
      Height = 17
      Caption = 'Add a terms and conditions page'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = InputChange
    end
    object btnSave: TButton
      Left = 22
      Top = 480
      Width = 300
      Height = 34
      Caption = 'Save as .docx...'
      Default = True
      TabOrder = 6
      OnClick = btnSaveClick
    end
    object btnOpen: TButton
      Left = 22
      Top = 522
      Width = 300
      Height = 34
      Caption = 'Open an existing .docx...'
      TabOrder = 7
      OnClick = btnOpenClick
    end
    object TMSFNCWXDocx1: TTMSFNCWXDocx
      Left = 22
      Top = 580
      Width = 26
      Height = 26
      OnDownloadAsFile = TMSFNCWXDocx1DownloadAsFile
      OnDownloadAsBase64 = TMSFNCWXDocx1DownloadAsBase64
      OnInitialized = TMSFNCWXDocx1Initialized
    end
  end
  object pnlRight: TPanel
    Left = 344
    Top = 0
    Width = 936
    Height = 840
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object pnlToolbar: TPanel
      Left = 0
      Top = 0
      Width = 936
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object lblPage: TLabel
        Left = 196
        Top = 16
        Width = 3
        Height = 15
      end
      object lblStatus: TLabel
        Left = 716
        Top = 16
        Width = 200
        Height = 15
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9666411
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnPrevious: TButton
        Left = 16
        Top = 10
        Width = 36
        Height = 28
        Hint = 'Previous page'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = btnPreviousClick
      end
      object btnNext: TButton
        Left = 56
        Top = 10
        Width = 36
        Height = 28
        Hint = 'Next page'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnNextClick
      end
      object btnZoomOut: TButton
        Left = 104
        Top = 10
        Width = 36
        Height = 28
        Hint = 'Zoom out'
        Caption = '-'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnZoomOutClick
      end
      object btnZoomIn: TButton
        Left = 144
        Top = 10
        Width = 36
        Height = 28
        Hint = 'Zoom in'
        Caption = '+'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnZoomInClick
      end
    end
    object pnlViewer: TPanel
      Left = 0
      Top = 48
      Width = 936
      Height = 792
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object TMSFNCWXDocxViewer1: TTMSFNCWXDocxViewer
        Left = 0
        Top = 0
        Width = 936
        Height = 792
        OnDocumentRendered = TMSFNCWXDocxViewer1DocumentRendered
        OnPageChange = TMSFNCWXDocxViewer1PageChange
        OnLinkClick = TMSFNCWXDocxViewer1LinkClick
      end
    end
  end
  object tmrPreview: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrPreviewTimer
    Left = 96
    Top = 580
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'docx'
    Filter = 'Word documents (*.docx)|*.docx'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 160
    Top = 580
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Word documents (*.docx)|*.docx'
    Left = 232
    Top = 580
  end
end
