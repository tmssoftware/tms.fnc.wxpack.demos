object Form2: TForm2
  Width = 957
  Height = 514
  OnBeforeUnload = WebFormBeforeUnload
  object WebLabel1: TWebLabel
    Left = 8
    Top = 65
    Width = 22
    Height = 15
    Caption = 'Port'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel2: TWebLabel
    Left = 8
    Top = 36
    Width = 71
    Height = 15
    Caption = 'Display name'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel3: TWebLabel
    Left = 8
    Top = 347
    Width = 89
    Height = 15
    Caption = 'Connected peers'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel4: TWebLabel
    Left = 8
    Top = 166
    Width = 41
    Height = 15
    Caption = 'Camera'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel5: TWebLabel
    Left = 8
    Top = 236
    Width = 65
    Height = 15
    Caption = 'Microphone'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel6: TWebLabel
    Left = 8
    Top = 8
    Width = 176
    Height = 15
    Caption = '1. Connect to the signaling server'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel7: TWebLabel
    Left = 8
    Top = 320
    Width = 147
    Height = 15
    Caption = '3. Select a peer and connect'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel8: TWebLabel
    Left = 8
    Top = 145
    Width = 164
    Height = 15
    Caption = '2. Select camera + microphone'
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object TMSFNCWXWebRTCCommunication1: TTMSFNCWXWebRTCCommunication
    Left = 263
    Top = 8
    Width = 674
    Height = 488
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
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
  object WebEdit1: TWebEdit
    Left = 64
    Top = 64
    Width = 177
    Height = 22
    ChildOrder = 1
    EditType = weNumeric
    HeightPercent = 100.000000000000000000
    Text = '8090'
    WidthPercent = 100.000000000000000000
  end
  object edtSelf: TWebEdit
    Left = 88
    Top = 36
    Width = 153
    Height = 22
    ChildOrder = 2
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebComboBox1: TWebComboBox
    Left = 8
    Top = 197
    Width = 233
    Height = 23
    HeightPercent = 100.000000000000000000
    Text = 'WebComboBox1'
    WidthPercent = 100.000000000000000000
    OnChange = WebComboBox1Change
    ItemIndex = -1
  end
  object WebComboBox2: TWebComboBox
    Left = 8
    Top = 267
    Width = 233
    Height = 23
    HeightPercent = 100.000000000000000000
    Text = 'WebComboBox2'
    WidthPercent = 100.000000000000000000
    OnChange = WebComboBox1Change
    ItemIndex = -1
  end
  object WebButton1: TWebButton
    Left = 8
    Top = 471
    Width = 233
    Height = 25
    Caption = 'Join to peer'
    ChildOrder = 6
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object WebButton2: TWebButton
    Left = 8
    Top = 96
    Width = 233
    Height = 25
    Caption = 'Connect to signaling server'
    ChildOrder = 7
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton2Click
  end
  object WebListBox1: TWebListBox
    Left = 8
    Top = 368
    Width = 233
    Height = 97
    HeightPercent = 100.000000000000000000
    ItemHeight = 15
    WidthPercent = 100.000000000000000000
    ItemIndex = -1
  end
  object WebSocketClient1: TWebSocketClient
    HostName = 'localhost'
    PathName = '/'
    OnConnect = WebSocketClient1Connect
    OnMessageReceived = WebSocketClient1MessageReceived
    Left = 96
    Top = 376
  end
end
