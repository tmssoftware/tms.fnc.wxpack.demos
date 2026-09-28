object Demo: TDemo
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX JSONFormatter Demo'
  ClientHeight = 727
  ClientWidth = 1048
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
  object Splitter1: TSplitter
    Left = 521
    Top = 41
    Height = 686
    ExplicitLeft = 536
    ExplicitTop = 328
    ExplicitHeight = 100
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 521
    Height = 686
    Align = alLeft
    BorderStyle = bsNone
    Lines.Strings = (
      '{"widget":{"debug":"on","window":{"title":"Sample Konfabulator '
      'Widget","name":"main_window","width":500,"height":500},"image":'
      
        '{"src":"Images/Sun.png","name":"sun1","hOffset":250,"vOffset":25' +
        '0,"alignment":"center"},"text":'
      '{"data":"Click '
      
        'Here","size":36,"style":"bold","name":"text1","hOffset":250,"vOf' +
        'fset":100,"alignment":"center","onMo'
      'useUp":"sun1.opacity = (sun1.opacity / 100) * 90;"}}}')
    ScrollBars = ssVertical
    TabOrder = 0
    ExplicitLeft = -24
    ExplicitTop = 39
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1048
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 328
      Top = 14
      Width = 108
      Height = 13
      Caption = 'JSON formatter theme'
    end
    object ShowJSON: TButton
      Left = 143
      Top = 10
      Width = 108
      Height = 23
      Hint = 'Show text left as formatted JSON right'
      Caption = 'Show JSON'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ShowJSONClick
    end
    object ThemeSelect: TComboBox
      Left = 442
      Top = 11
      Width = 108
      Height = 21
      Hint = 'Select theme for the JSON formatter'
      Style = csDropDownList
      ItemIndex = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'Light'
      OnChange = ThemeSelectChange
      Items.Strings = (
        'Dark'
        'Light'
        'Custom')
    end
    object LoadJSON: TButton
      Left = 15
      Top = 10
      Width = 108
      Height = 23
      Hint = 'Show text left as formatted JSON right'
      Caption = 'Load'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = LoadJSONClick
    end
  end
  object TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter
    Left = 524
    Top = 41
    Width = 524
    Height = 686
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    JSON.Strings = (
      '')
    Theme = ftLight
    OpenAtDepth = 10.000000000000000000
    Appearance.FontName = 'Arial'
  end
  object OpenDialog1: TOpenDialog
    Filter = 'JSON files|*.json|All files|*.*'
    Left = 992
  end
end
