object Demo: TDemo
  Width = 1165
  Height = 744
  Caption = 'TMS FNC WX JSONFormatter Demo'
  FormContainer = 'appcontent'
  object WebLabel1: TWebLabel
    Left = 152
    Top = 456
    Width = 169
    Height = 13
    Caption = 'FNC JSON Formatter for web demo'
    ElementID = 'title'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel2: TWebLabel
    Left = 328
    Top = 512
    Width = 182
    Height = 13
    Caption = 'Usage of TTMSFNCWXJSONFormatter'
    ElementID = 'description'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebPanel1: TWebPanel
    Left = 461
    Top = 65
    Width = 704
    Height = 679
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alClient
    BorderColor = clSilver
    BorderStyle = bsSingle
    Caption = 'WebPanel1'
    ChildOrder = 4
    Color = clWhite
    ExplicitLeft = 719
    ExplicitWidth = 446
    object TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 698
      Height = 673
      Align = alClient
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 0
      JSON.Strings = (
        '')
      Theme = ftLight
      OpenAtDepth = 10.000000000000000000
      Appearance.FontName = 'Arial'
      ExplicitWidth = 440
    end
  end
  object WebPanel2: TWebPanel
    Left = 0
    Top = 0
    Width = 1165
    Height = 65
    ElementClassName = 'bg-dark'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alTop
    BorderColor = clSilver
    BorderStyle = bsSingle
    ChildOrder = 4
    object format: TWebButton
      AlignWithMargins = True
      Left = 810
      Top = 5
      Width = 110
      Height = 55
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = 'Format'
      ChildOrder = 2
      ElementClassName = 'btn btn-primary'
      HeightStyle = ssPercent
      HeightPercent = 80.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = formatClick
    end
    object Theme: TWebComboBox
      AlignWithMargins = True
      Left = 930
      Top = 5
      Width = 230
      Height = 21
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      ElementClassName = 'form-select'
      HeightStyle = ssPercent
      HeightPercent = 80.000000000000000000
      Text = 'Light'
      WidthPercent = 100.000000000000000000
      OnChange = ThemeChange
      ItemIndex = 0
      Items.Strings = (
        'Light'
        'Dark'
        'Custom')
    end
    object WebFilePicker1: TWebFilePicker
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 292
      Height = 55
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      ElementClassName = 'form-control'
      HeightStyle = ssAuto
      HeightPercent = 80.000000000000000000
      WidthPercent = 100.000000000000000000
      Accept = '.json'
      Align = alLeft
      ChildOrder = 2
      OnChange = WebFilePicker1Change
      OnGetFileAsDataURL = WebFilePicker1GetFileAsDataURL
    end
  end
  object input: TWebMemo
    Left = 0
    Top = 65
    Width = 457
    Height = 679
    Align = alLeft
    AutoSize = False
    HeightPercent = 100.000000000000000000
    Lines.Strings = (
      
        '[{"country":"Belgium","count":1},{"country":"Brazil","count":16}' +
        ','
      '{"country":"Canada","count":2},{"country":"Finland","count":1},'
      '{"country":"Germany","count":2},{"country":"Greece","count":1},'
      
        '{"country":"Italy","count":1},{"country":"Netherlands","count":1' +
        '},'
      
        '{"country":"Paraguay","count":1},{"country":"South Africa","coun' +
        't":1},'
      
        '{"country":"Sweden","count":2},{"country":"United Kingdom","coun' +
        't":2},'
      '{"country":"United States","count":3}]')
    SelLength = 0
    SelStart = 437
    WidthPercent = 100.000000000000000000
  end
  object WebSplitter1: TWebSplitter
    Left = 457
    Top = 65
    Width = 4
    Height = 679
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alLeft
    ChildOrder = 3
    Color = clBtnFace
    ExplicitLeft = 715
  end
end
