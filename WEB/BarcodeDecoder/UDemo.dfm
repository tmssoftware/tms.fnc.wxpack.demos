object Form1: TForm1
  Width = 517
  Height = 551
  Caption = 'TMS FNC WX Barcode Decoder Demo'
  OnCreate = WebFormCreate
  object TMSFNCWXCamera1: TTMSFNCWXCamera
    Left = 8
    Top = 8
    Width = 500
    Height = 350
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
  end
  object WebPanel1: TWebPanel
    Left = 8
    Top = 364
    Width = 500
    Height = 178
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    BorderColor = clSilver
    BorderStyle = bsSingle
    ChildOrder = 8
    object WebLabel2: TWebLabel
      Left = 12
      Top = 11
      Width = 74
      Height = 16
      Caption = 'Barcode type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HeightPercent = 100.000000000000000000
      ParentFont = False
      WidthPercent = 100.000000000000000000
    end
    object WebLabel1: TWebLabel
      Left = 277
      Top = 11
      Width = 40
      Height = 16
      Caption = 'Result:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HeightPercent = 100.000000000000000000
      ParentFont = False
      WidthPercent = 100.000000000000000000
    end
    object qrRBtn: TWebRadioButton
      Tag = 100
      Left = 12
      Top = 33
      Width = 74
      Height = 22
      Caption = 'QR'
      Checked = True
      ChildOrder = 4
      Color = clNone
      GroupName = 'codetype'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = qrRBtnClick
    end
    object code128RBtn: TWebRadioButton
      Tag = 101
      Left = 107
      Top = 33
      Width = 102
      Height = 22
      Caption = 'Code 128'
      Checked = False
      ChildOrder = 4
      Color = clNone
      GroupName = 'codetype'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = qrRBtnClick
    end
    object upcRBtn: TWebRadioButton
      Tag = 102
      Left = 12
      Top = 58
      Width = 89
      Height = 22
      Caption = 'UPC-A'
      Checked = False
      ChildOrder = 4
      Color = clNone
      GroupName = 'codetype'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = qrRBtnClick
    end
    object eanRBtn: TWebRadioButton
      Tag = 103
      Left = 107
      Top = 58
      Width = 161
      Height = 22
      Caption = 'EAN-13'
      Checked = False
      ChildOrder = 4
      Color = clNone
      GroupName = 'codetype'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = qrRBtnClick
    end
    object codaRBtn: TWebRadioButton
      Tag = 104
      Left = 12
      Top = 83
      Width = 161
      Height = 22
      Caption = 'Codabar'
      Checked = False
      ChildOrder = 4
      Color = clNone
      GroupName = 'codetype'
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = qrRBtnClick
    end
    object decodeCamBtn: TWebButton
      Left = 12
      Top = 111
      Width = 237
      Height = 25
      Caption = 'Decode from camera'
      ChildOrder = 6
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = decodeCamBtnClick
    end
    object decodeImgBtn: TWebButton
      Left = 12
      Top = 142
      Width = 237
      Height = 25
      Caption = 'Decode from image'
      ChildOrder = 7
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      OnClick = decodeImgBtnClick
    end
    object WebMemo1: TWebMemo
      Left = 274
      Top = 33
      Width = 215
      Height = 134
      AutoSize = False
      HeightPercent = 100.000000000000000000
      SelLength = 0
      SelStart = 0
      WidthPercent = 100.000000000000000000
    end
    object TMSFNCWXQRDecoder1: TTMSFNCWXQRDecoder
      Left = 223
      Top = 16
      Width = 26
      Height = 26
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 9
      Visible = True
      Camera = TMSFNCWXCamera1
      OnDecoded = TMSFNCWXBarcodeDecoder1Decoded
    end
    object TMSFNCWXBarcodeDecoder1: TTMSFNCWXBarcodeDecoder
      Left = 223
      Top = 48
      Width = 26
      Height = 26
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 8
      Visible = True
      OnDecoded = TMSFNCWXBarcodeDecoder1Decoded
    end
  end
  object WebOpenDialog1: TWebOpenDialog
    Left = 320
    Top = 412
  end
end
