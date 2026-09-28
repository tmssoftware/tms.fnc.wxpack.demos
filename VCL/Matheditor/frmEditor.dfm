object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TTMSFNCWXMathEditor Demo'
  ClientHeight = 789
  ClientWidth = 1577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object TMSFNCWXMathEditor1: TTMSFNCWXMathEditor
    Left = 0
    Top = 0
    Width = 1298
    Height = 789
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Math = 
      '\begin{equation}(1+x)^{n}=\sum_{i=0}^{n}{n\choose i}x^{i} \end{e' +
      'quation}'
    OnGetMath = TMSFNCWXMathEditor1GetMath
    VirtualKeyboardMode = kmManual
    VirtualKeyboards = [vkNumeric, vkRoman, vkGreek, vkFunctions, vkSymbols, vkLatex]
    OnCaptureScreenshot = TMSFNCWXMathEditor1CaptureScreenshot
  end
  object Panel1: TPanel
    Left = 1298
    Top = 0
    Width = 279
    Height = 789
    Align = alRight
    TabOrder = 1
    object Undo: TButton
      Left = 24
      Top = 8
      Width = 81
      Height = 65
      Caption = 'Undo'
      TabOrder = 0
      OnClick = UndoClick
    end
    object Redo: TButton
      Left = 176
      Top = 8
      Width = 81
      Height = 65
      Caption = 'Redo'
      TabOrder = 1
      OnClick = RedoClick
    end
    object Screenshot: TButton
      Left = 24
      Top = 79
      Width = 233
      Height = 58
      Caption = 'Take snapshot'
      TabOrder = 2
      OnClick = ScreenshotClick
    end
    object Format: TComboBox
      Left = 24
      Top = 160
      Width = 233
      Height = 23
      TabOrder = 3
      Text = 'LaTex'
      Items.Strings = (
        'LaTeX'
        'ASCIIMath'
        'Spoken Text'
        'MathML'
        'Spoken'
        'Spoken SSML'
        'Spoken SSML With Highlighting'
        'LaTeX Expanded')
    end
    object Download: TButton
      Left = 24
      Top = 189
      Width = 233
      Height = 52
      Caption = 'Download File'
      TabOrder = 4
      OnClick = DownloadClick
    end
    object mode: TComboBox
      Left = 24
      Top = 272
      Width = 233
      Height = 23
      ItemIndex = 0
      TabOrder = 5
      Text = 'Auto'
      OnChange = modeChange
      Items.Strings = (
        'Auto'
        'Manual'
        'On Focus'
        'Off')
    end
    object Theme: TRadioGroup
      Left = 24
      Top = 301
      Width = 233
      Height = 105
      Caption = 'Keyboard Theme'
      ItemIndex = 1
      Items.Strings = (
        'Material'
        'Apple'
        'Device')
      TabOrder = 6
      OnClick = ThemeClick
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 412
      Width = 241
      Height = 237
      Caption = 'Keyboards'
      TabOrder = 7
      object Numeric: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 27
        Width = 231
        Height = 17
        Margins.Top = 10
        Align = alTop
        Caption = 'Numeric'
        TabOrder = 0
        OnClick = NumericClick
      end
      object Roman: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 57
        Width = 231
        Height = 17
        Margins.Top = 10
        Align = alTop
        Caption = 'Roman'
        TabOrder = 1
        OnClick = RomanClick
      end
      object Greek: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 87
        Width = 231
        Height = 17
        Margins.Top = 10
        Align = alTop
        Caption = 'Greek'
        TabOrder = 2
        OnClick = GreekClick
      end
      object Functions: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 147
        Width = 231
        Height = 17
        Margins.Top = 10
        Align = alTop
        Caption = 'Functions'
        TabOrder = 3
        OnClick = FunctionsClick
      end
      object Symbols: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 117
        Width = 231
        Height = 17
        Margins.Top = 10
        Align = alTop
        Caption = 'Symbols'
        TabOrder = 4
      end
      object LaTeX: TCheckBox
        AlignWithMargins = True
        Left = 5
        Top = 177
        Width = 231
        Height = 17
        Margins.Top = 10
        Align = alTop
        Caption = 'LaTeX'
        TabOrder = 5
        OnClick = LaTeXClick
        ExplicitLeft = 3
      end
    end
  end
end
