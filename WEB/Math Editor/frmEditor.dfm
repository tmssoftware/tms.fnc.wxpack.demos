object Form1: TForm1
  Width = 2049
  Height = 1090
  Caption = 'Math editor demo'
  PixelsPerInch = 96
  object TMSFNCWXMathEditor1: TTMSFNCWXMathEditor
    Left = 0
    Top = 89
    Width = 2049
    Height = 1001
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Math = 
      '\begin{equation}(1+x)^{n}=\sum_{i=0}^{n}{n\choose i}x^{i} \end{e' +
      'quation}'
    OnGetMath = TMSFNCWXMathEditor1GetMath
    VirtualKeyboardMode = kmManual
    VirtualKeyboards = []
    OnCaptureScreenshot = TMSFNCWXMathEditor1CaptureScreenshot
  end
  object WebPanel1: TWebPanel
    Left = 0
    Top = 0
    Width = 2049
    Height = 89
    Align = alTop
    ChildOrder = 1
    Color = clWhite
    object Undo: TWebSpeedButton
      Left = 8
      Top = 27
      Width = 73
      Height = 33
      Color = clNone
      HeightPercent = 100.000000000000000000
      MaterialGlyph = 'undo'
      WidthPercent = 100.000000000000000000
      OnClick = UndoClick
    end
    object redo: TWebSpeedButton
      Left = 87
      Top = 27
      Width = 73
      Height = 33
      Color = clNone
      HeightPercent = 100.000000000000000000
      MaterialGlyph = 'redo'
      WidthPercent = 100.000000000000000000
      OnClick = redoClick
    end
    object mathFormat: TWebComboBox
      Left = 222
      Top = 27
      Width = 192
      Height = 33
      Hint = 'Math format'
      HeightPercent = 100.000000000000000000
      TabOrder = 2
      Text = 'LaTeX'
      WidthPercent = 100.000000000000000000
      ItemIndex = 0
      Items.Strings = (
        'LaTeX'
        'ASCIIMath'
        'Spoken Text'
        'MathML'
        'Spoken'
        'Spoken SSML'
        'Spoken SSML with Highlighting'
        'LaTeX Expanded')
    end
    object Snapshot: TWebSpeedButton
      Left = 564
      Top = 27
      Width = 73
      Height = 33
      Color = clNone
      HeightPercent = 100.000000000000000000
      MaterialGlyph = 'camera'
      WidthPercent = 100.000000000000000000
      OnClick = SnapshotClick
    end
    object download: TWebSpeedButton
      Left = 420
      Top = 27
      Width = 73
      Height = 33
      Color = clNone
      HeightPercent = 100.000000000000000000
      MaterialGlyph = 'save'
      WidthPercent = 100.000000000000000000
      OnClick = downloadClick
    end
    object Layout: TWebComboBox
      Left = 693
      Top = 27
      Width = 145
      Height = 33
      Hint = 'Keyboard Layout'
      HeightPercent = 100.000000000000000000
      TabOrder = 5
      Text = 'Auto'
      WidthPercent = 100.000000000000000000
      OnChange = LayoutChange
      ItemIndex = 0
      Items.Strings = (
        'Auto'
        'Qwerty'
        'Azerty'
        'Qwertz'
        'Dvorak'
        'Colemak')
    end
    object Mode: TWebComboBox
      Left = 901
      Top = 27
      Width = 145
      Height = 33
      Hint = 'Keyboard mode'
      HeightPercent = 100.000000000000000000
      TabOrder = 6
      Text = 'Auto'
      WidthPercent = 100.000000000000000000
      OnChange = ModeChange
      ItemIndex = 0
      Items.Strings = (
        'Auto'
        'Manual'
        'On Focus'
        'Off')
    end
    object Theme: TWebComboBox
      Left = 1101
      Top = 27
      Width = 145
      Height = 33
      Hint = 'Keyboard Theme'
      HeightPercent = 100.000000000000000000
      TabOrder = 7
      Text = 'Material'
      WidthPercent = 100.000000000000000000
      OnChange = ThemeChange
      ItemIndex = 0
      Items.Strings = (
        'Material'
        'Apple'
        'Device')
    end
    object WebCheckGroup1: TWebCheckGroup
      Left = 1325
      Top = 19
      Width = 681
      Height = 41
      Caption = 'keyboards'
      ChildOrder = 8
      Columns = 6
      Items.Strings = (
        'Numeric'
        'Roman'
        'Greek'
        'Functions'
        'Symbols'
        'LaTeX')
      Role = ''
      OnCheckClick = WebCheckGroup1CheckClick
    end
  end
end
