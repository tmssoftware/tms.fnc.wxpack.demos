object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Demo'
  ClientHeight = 452
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnDestroy = FormDestroy
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 67
    Width = 22
    Height = 15
    Caption = 'Port'
  end
  object Label2: TLabel
    Left = 8
    Top = 38
    Width = 71
    Height = 15
    Caption = 'Display name'
  end
  object Label3: TLabel
    Left = 8
    Top = 289
    Width = 89
    Height = 15
    Caption = 'Connected peers'
  end
  object Label4: TLabel
    Left = 8
    Top = 163
    Width = 41
    Height = 15
    Caption = 'Camera'
  end
  object Label5: TLabel
    Left = 8
    Top = 213
    Width = 65
    Height = 15
    Caption = 'Microphone'
  end
  object Label6: TLabel
    Left = 8
    Top = 8
    Width = 169
    Height = 15
    Caption = '1. Connect to the signalin server'
  end
  object Label7: TLabel
    Left = 8
    Top = 142
    Width = 164
    Height = 15
    Caption = '2. Select camera + microphone'
  end
  object Label8: TLabel
    Left = 8
    Top = 268
    Width = 147
    Height = 15
    Caption = '3. Select a peer and connect'
  end
  object Edit1: TEdit
    Left = 58
    Top = 64
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 0
    Text = '8090'
  end
  object edtSelf: TEdit
    Left = 85
    Top = 35
    Width = 94
    Height = 23
    TabOrder = 1
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 184
    Width = 171
    Height = 23
    TabOrder = 2
    OnChange = ComboBox1Change
  end
  object ComboBox2: TComboBox
    Left = 8
    Top = 234
    Width = 171
    Height = 23
    TabOrder = 3
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 8
    Top = 413
    Width = 171
    Height = 25
    Caption = 'Join peer'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 93
    Width = 171
    Height = 25
    Caption = 'Join signaling server'
    TabOrder = 5
    OnClick = Button2Click
  end
  object TMSFNCWebsocketClient1: TTMSFNCWebsocketClient
    Left = 133
    Top = 139
    Width = 39
    Height = 39
    Visible = True
    HostName = 'localhost'
    AutoCheckInterval = 51
    OnConnect = TMSFNCWebsocketClient1Connect
    OnMessageReceived = TMSFNCWebsocketClient1MessageReceived
  end
  object TMSFNCWXWebRTCCommunication1: TTMSFNCWXWebRTCCommunication
    Left = 185
    Top = 8
    Width = 587
    Height = 430
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 7
    HTML.Strings = (
      
        '<video id={%self%} class="self-top-right" muted autoplay playsin' +
        'line></video>')
    CSS.Strings = (
      '.self-top-right {'
      '  position: absolute;'
      '  width: 150px;'
      '  height: 100px;'
      '  z-index: 10;'
      '}'
      ''
      '.peer-fullscreen {'
      '  position: absolute;'
      '  width: 100%;'
      '  height: 100%;'
      '}')
    DefaultIceServers = <>
    Peers = <>
    LocalVideoSettings.EnableAudioTrack = False
    LocalVideoSettings.EnableVideoTrack = False
    OnDeviceListInitialized = TMSFNCWXWebRTCCommunication1DeviceListInitialized
    OnOffer = TMSFNCWXWebRTCCommunication1Offer
    OnIceCandidate = TMSFNCWXWebRTCCommunication1IceCandidate
    OnAnswer = TMSFNCWXWebRTCCommunication1Answer
  end
  object ListBox1: TListBox
    Left = 8
    Top = 310
    Width = 171
    Height = 97
    ItemHeight = 15
    TabOrder = 8
  end
end
