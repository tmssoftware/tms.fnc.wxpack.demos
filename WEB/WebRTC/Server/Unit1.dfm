object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Signaling server'
  ClientHeight = 103
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    413
    103)
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 40
    Width = 395
    Height = 30
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 
      'This is the signaling server used for connecting the peers. Afte' +
      'r connection this server can be closed.'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 12
    Width = 60
    Height = 15
    Caption = 'Server port:'
  end
  object TMSFNCWebSocketServer1: TTMSFNCWebSocketServer
    Left = 366
    Top = 16
    Width = 39
    Height = 39
    Visible = True
    OnMessageReceived = TMSFNCWebSocketServer1MessageReceived
    OnDisconnect = TMSFNCWebSocketServer1Disconnect
  end
  object Edit1: TEdit
    Left = 71
    Top = 9
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 1
    Text = '8090'
  end
  object Button1: TButton
    Left = 198
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Start server'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 300000
    OnTimer = Timer1Timer
    Left = 304
    Top = 16
  end
end
