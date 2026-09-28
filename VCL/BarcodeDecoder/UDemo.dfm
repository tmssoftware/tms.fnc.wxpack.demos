object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'TMS FNC WX Barcode Decoder Demo'
  ClientHeight = 545
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object TMSFNCWXCamera1: TTMSFNCWXCamera
    Left = 8
    Top = 8
    Width = 500
    Height = 350
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 364
    Width = 500
    Height = 173
    TabOrder = 1
    object Label2: TLabel
      Left = 12
      Top = 7
      Width = 74
      Height = 16
      Caption = 'Barcode type'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 264
      Top = 8
      Width = 40
      Height = 16
      Caption = 'Result:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object qrRBtn: TRadioButton
      Tag = 100
      Left = 12
      Top = 26
      Width = 77
      Height = 17
      Caption = 'QR'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = qrRBtnClick
    end
    object code128RBtn: TRadioButton
      Tag = 101
      Left = 112
      Top = 26
      Width = 97
      Height = 17
      Caption = 'Code 128'
      TabOrder = 1
      OnClick = qrRBtnClick
    end
    object upcRBtn: TRadioButton
      Tag = 102
      Left = 12
      Top = 49
      Width = 94
      Height = 17
      Caption = 'UPC-A'
      TabOrder = 2
      OnClick = qrRBtnClick
    end
    object eanRBtn: TRadioButton
      Tag = 103
      Left = 112
      Top = 49
      Width = 97
      Height = 17
      Caption = 'EAN-13'
      TabOrder = 3
      OnClick = qrRBtnClick
    end
    object codaRBtn: TRadioButton
      Tag = 104
      Left = 12
      Top = 72
      Width = 94
      Height = 17
      Caption = 'Codabar'
      TabOrder = 4
      OnClick = qrRBtnClick
    end
    object decodeCamBtn: TButton
      Left = 12
      Top = 104
      Width = 225
      Height = 25
      Caption = 'Decode from camera'
      TabOrder = 5
      OnClick = decodeCamBtnClick
    end
    object decodeImgBtn: TButton
      Left = 12
      Top = 135
      Width = 225
      Height = 25
      Caption = 'Decode from image'
      TabOrder = 6
      OnClick = decodeImgBtnClick
    end
    object Memo1: TMemo
      Left = 264
      Top = 30
      Width = 223
      Height = 130
      TabOrder = 7
    end
    object TMSFNCWXBarcodeDecoder1: TTMSFNCWXBarcodeDecoder
      Left = 215
      Top = 16
      Width = 39
      Height = 39
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 8
      Visible = True
      OnDecoded = TMSFNCWXBarcodeDecoder1Decoded
    end
    object TMSFNCWXQRDecoder1: TTMSFNCWXQRDecoder
      Left = 215
      Top = 48
      Width = 39
      Height = 39
      ParentDoubleBuffered = False
      DoubleBuffered = True
      TabOrder = 9
      Visible = True
      Camera = TMSFNCWXCamera1
      OnDecoded = TMSFNCWXBarcodeDecoder1Decoded
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 304
    Top = 412
  end
end
