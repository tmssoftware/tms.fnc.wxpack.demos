unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, WEBLib.WebSocketClient, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXWebRTC;

type
  TPeerItem = record
    name: string;
    id: string;
  end;

  TPeerItems = array of TPeerItem;

  TForm2 = class(TWebForm)
    TMSFNCWXWebRTCCommunication1: TTMSFNCWXWebRTCCommunication;
    WebSocketClient1: TWebSocketClient;
    WebEdit1: TWebEdit;
    edtSelf: TWebEdit;
    WebComboBox1: TWebComboBox;
    WebComboBox2: TWebComboBox;
    WebButton1: TWebButton;
    WebButton2: TWebButton;
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    WebLabel3: TWebLabel;
    WebLabel4: TWebLabel;
    WebLabel5: TWebLabel;
    WebListBox1: TWebListBox;
    WebLabel6: TWebLabel;
    WebLabel7: TWebLabel;
    WebLabel8: TWebLabel;
    procedure WebSocketClient1Connect(Sender: TObject);
    procedure WebSocketClient1MessageReceived(Sender: TObject;
      AMessage: string);
    procedure TMSFNCWXWebRTCCommunication1Answer(Sender: TObject; AID,
      AAnswer: string);
    procedure TMSFNCWXWebRTCCommunication1DeviceListInitialized(
      Sender: TObject);
    procedure TMSFNCWXWebRTCCommunication1IceCandidate(Sender: TObject; AID,
      AIceCandidate: string);
    procedure TMSFNCWXWebRTCCommunication1Offer(Sender: TObject; AID,
      AOffer: string);
    procedure WebComboBox1Change(Sender: TObject);
    procedure WebButton1Click(Sender: TObject);
    procedure WebButton2Click(Sender: TObject);
    procedure WebFormBeforeUnload(Sender: TObject; var AMessage: string);
  private
    { Private declarations }
    procedure SetControls(AEnabled: Boolean);
  public
    { Public declarations }
    FPeer, FID: string;
  end;

var
  Form2: TForm2;

implementation

uses
  jsdelphisystem;

{$R *.dfm}

procedure TForm2.SetControls(AEnabled: Boolean);
begin
  if AEnabled then
    WebButton1.Caption := 'Join to peer'
  else
    WebButton1.Caption := 'Disconnect';

  WebComboBox1.Enabled := AEnabled;
  WebComboBox2.Enabled := AEnabled;
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1Answer(Sender: TObject; AID,
  AAnswer: string);
begin
  WebSocketClient1.Send('{"type": "answer", "user": "' + FPeer + '", "answer": ' + AAnswer + '}');
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1DeviceListInitialized(
  Sender: TObject);
var
  I: Integer;
  device: TTMSFNCWXWebRTCDevice;
  idCam, idMic: string;
begin
  WebComboBox1.Clear;
  WebComboBox2.Clear;

  idCam := '';
  idMic := '';

  for I := 0 to TMSFNCWXWebRTCCommunication1.DeviceList.Count - 1 do
  begin
    device := TMSFNCWXWebRTCCommunication1.DeviceList.Items[I];
    if device.Kind = wdkVideoInput then
    begin
      if idCam = '' then
        idCam := device.DeviceID;

      WebComboBox1.Items.AddPair(device.Name, device.DeviceID)
    end
    else if device.Kind = wdkAudioInput then
    begin
      if idMic = '' then
        idMic := device.DeviceID;

      WebComboBox2.Items.AddPair(device.Name, device.DeviceID);
    end;
  end;

  if WebComboBox1.Items.Count > 0 then
    WebComboBox1.ItemIndex := 0;

  if WebComboBox2.Items.Count > 0 then
    WebComboBox2.ItemIndex := 0;

  TMSFNCWXWebRTCCommunication1.RequestUserMedia(idCam, idMic);
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1IceCandidate(Sender: TObject; AID,
  AIceCandidate: string);
begin
  WebSocketClient1.Send('{"type": "candidate", "user": "' + FPeer + '", "candidate": ' + AIceCandidate + '}');
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1Offer(Sender: TObject; AID,
  AOffer: string);
begin
  WebSocketClient1.Send('{"type": "offer", "user": "' + FPeer + '", "offer": ' + AOffer + '}');
end;

procedure TForm2.WebButton1Click(Sender: TObject);
begin
  if WebButton1.Caption <> 'Disconnect' then
  begin
    if WebListBox1.ItemIndex <> -1 then
    begin
      FPeer := WebListBox1.Values[WebListBox1.ItemIndex];
      WebSocketClient1.Send('{"type": "join", "user": "' + FPeer + '", "sender": "' + FID + '"}');
    end;
  end
  else
  begin
    TMSFNCWXWebRTCCommunication1.RemovePeerConnection(FPeer);
    WebSocketClient1.Send('{"type": "disconnect", "user": "' + FPeer + '", "sender": "' + FID + '"}');
    FPeer := '';
    SetControls(True);
  end;
end;

procedure TForm2.WebButton2Click(Sender: TObject);
begin
  if edtSelf.Text <> '' then
  begin
    WebSocketClient1.Port := StrToInt(WebEdit1.Text);
    WebSocketClient1.Connect;
  end;
end;

procedure TForm2.WebComboBox1Change(Sender: TObject);
var
  cam, mic: string;
begin
  cam := WebComboBox1.Items.ValueFromIndex[WebComboBox1.ItemIndex];
  mic := WebComboBox2.Items.ValueFromIndex[WebComboBox2.ItemIndex];
  TMSFNCWXWebRTCCommunication1.RequestUserMedia(cam, mic);
end;

procedure TForm2.WebFormBeforeUnload(Sender: TObject; var AMessage: string);
begin
  try
    WebSocketClient1.Send('{"type": "close", "user": "' + FID + '"}');
  except
    //underlying websocket object was already released
  end;
end;

procedure TForm2.WebSocketClient1Connect(Sender: TObject);
begin
  WebSocketClient1.Send('{"type": "request-id", "sender": "' + edtSelf.Text + '"}');
  WebButton2.Enabled := False;
end;

procedure TForm2.WebSocketClient1MessageReceived(Sender: TObject;
  AMessage: string);
var
  msgType, user, data: string;
  jsonVal: JSValue;
  jsObj: TJSObject;
  itms: TPeerItems;
  I: Integer;
begin
  //Server sends an occasional 'ping' message, ignore
  if AMessage = 'ping' then
    Exit;

  jsonVal := TJSJSON.parse(AMessage);
  jsObj := TJSObject(TObject(jsonVal));

  msgType := string(jsObj.Properties['type']);
  if msgType = 'self-id' then
  begin
    SetControls(True);
    WebButton1.Enabled := True;

    //this is our own ID in the server used for forwarding messages
    //save it and use whenever sending something
    FID := string(jsObj.Properties['id']);
    itms := TPeerItems(jsObj.Properties['users']);
    if Assigned(itms) then
    begin
      for I := 0 to Length(itms) - 1 do
      begin
        WebListBox1.Items.Add(itms[I].name);
        WebListBox1.Values[WebListBox1.Count - 1] := itms[I].id;
      end;
    end;
  end
  else if msgType = 'connect' then
  begin
    //A new user joined the server
    user := string(jsObj.Properties['user']);
    data := string(jsObj.Properties['id']);
    WebListBox1.Items.Add(user);
    WebListBox1.Values[WebListBox1.Count - 1] := data;
  end
  else if msgType = 'join' then
  begin
    //A peer joined us, add their id
    user := string(jsObj.Properties['user']);
    //We are going to persist the connected peer id for now.
    //It's also an option to always send the peer ID along with offers, answers and candidates
    FPeer := user;

    //add peer object?
    TMSFNCWXWebRTCCommunication1.AddPeerConnection(FPeer, '<video class="peer-fullscreen" autoplay playsinline></video>', '');

    //Disable controls
    SetControls(False);
  end
  else if msgType = 'join-success' then
  begin
    //Disable controls
    SetControls(False);

    //Add peer connection object
    TMSFNCWXWebRTCCommunication1.AddPeerConnection(FPeer, '<video class="peer-fullscreen" autoplay playsinline></video>', '');

    //Could join to peer, initiate call by creating offer
    TMSFNCWXWebRTCCommunication1.CreateOffer(FPeer);
  end
  else if msgType = 'join-reject' then
  begin
    //No peer with given ID found
    ShowMessage('There is no peer connected to the signaling server with the "' + FPeer + '" ID.');
    FPeer := '';
  end
  else if msgType = 'offer' then
  begin
    //An offer arrived, accept:
    data := TJSJSON.stringify(jsObj.Properties['offer']);
    TMSFNCWXWebRTCCommunication1.AcceptOffer(FPeer, data);
  end
  else if msgType = 'answer' then
  begin
    //An answer arrived, accept:
    data := TJSJSON.stringify(jsObj.Properties['answer']);
    TMSFNCWXWebRTCCommunication1.AcceptAnswer(FPeer, data);
  end
  else if msgType = 'candidate' then
  begin
    //A candidate arrived, add:
    data := TJSJSON.stringify(jsObj.Properties['candidate']);
    TMSFNCWXWebRTCCommunication1.AddIceCandidate(FPeer, data);
  end
  else if msgType = 'disconnect' then
  begin
    //disconnect from call
    TMSFNCWXWebRTCCommunication1.RemovePeerConnection(FPeer);
    SetControls(True);
  end
  else if msgType = 'close' then
  begin
    //disconnect from server
    user := string(jsObj.Properties['user']);
    if FPeer = user then
    begin
      TMSFNCWXWebRTCCommunication1.RemovePeerConnection(FPeer);
      SetControls(True);
    end;

    for I := 0 to WebListBox1.Count - 1 do
    begin
      if WebListBox1.Values[I] = user then
      begin
        WebListBox1.Items.Delete(I);
        Break;
      end;
    end;
  end;
end;

end.