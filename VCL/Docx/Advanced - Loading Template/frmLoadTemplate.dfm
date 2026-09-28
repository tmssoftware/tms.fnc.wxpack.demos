object TFrmLoadTemplate: TTFrmLoadTemplate
  Left = 0
  Top = 0
  Caption = 'TTMSFNCWXDocxDemo - Load Template'
  ClientHeight = 222
  ClientWidth = 238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object TMSFNCWXDocx1: TTMSFNCWXDocx
    Left = 24
    Top = 160
    Width = 39
    Height = 39
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Visible = True
  end
  object CreateInvoices: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 57
    Caption = 'Create Invoices'
    TabOrder = 1
    OnClick = CreateInvoicesClick
  end
  object LoadTemplate: TButton
    Left = 8
    Top = 80
    Width = 145
    Height = 57
    Caption = 'Load Template From JSON'
    TabOrder = 2
    OnClick = LoadTemplateClick
  end
  object Customers: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 16
  end
  object Orders: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 92
  end
  object OpenDialog1: TOpenDialog
    Left = 100
    Top = 148
  end
end
