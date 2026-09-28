object Form1: TForm1
  Width = 553
  Height = 257
  OnCreate = WebFormCreate
  object WebButton1: TWebButton
    Left = 1
    Top = 1
    Width = 176
    Height = 42
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Caption = 'Create Invoices'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object WebButton2: TWebButton
    Left = 4
    Top = 45
    Width = 173
    Height = 48
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Caption = 'Load Template'
    ChildOrder = 1
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton2Click
  end
  object TMSFNCWXDocx1: TTMSFNCWXDocx
    Left = 20
    Top = 137
    Width = 26
    Height = 26
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 2
    Visible = True
  end
  object Customers: TWebClientDataSet
    Connection = CustomerConnection
    Params = <>
    Left = 147
    Top = 219
  end
  object Orders: TWebClientDataSet
    Connection = OrderConnection
    Params = <>
    Left = 157
    Top = 91
  end
  object CustomerConnection: TWebClientConnection
    Active = False
    DataNode = 'ROWDATA'
    URI = 'Customer.JSON'
    Left = 452
    Top = 26
  end
  object CustomerDataSource: TWebDataSource
    DataSet = Customers
    Left = 291
    Top = 22
  end
  object OrderDataSource: TWebDataSource
    DataSet = Orders
    Left = 386
    Top = 144
  end
  object OrderConnection: TWebClientConnection
    Active = False
    DataNode = 'ROWDATA'
    URI = 'Orders.JSON'
    Left = 249
    Top = 98
  end
  object WebOpenDialog1: TWebOpenDialog
    Left = 336
    Top = 280
  end
end
