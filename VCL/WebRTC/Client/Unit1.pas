unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCWebSocketCommon,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXWebRTC, VCL.TMSFNCCustomComponent, VCL.TMSFNCWebSocketClient,
  Vcl.StdCtrls;

type
  TPeer = class
    PeerID: string;
  end;

  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    edtSelf: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    TMSFNCWebsocketClient1: TTMSFNCWebsocketClient;
    TMSFNCWXWebRTCCommunication1: TTMSFNCWXWebRTCCommunication;
    Label6: TLabel;
    Label7: TLabel;
    ListBox1: TListBox;
    Label8: TLabel;
    procedure TMSFNCWXWebRTCCommunication1DeviceListInitialized(
      Sender: TObject);
    procedure TMSFNCWXWebRTCCommunication1Answer(Sender: TObject; AID,
      AAnswer: string);
    procedure TMSFNCWXWebRTCCommunication1Offer(Sender: TObject; AID,
      AOffer: string);
    procedure TMSFNCWXWebRTCCommunication1IceCandidate(Sender: TObject; AID,
      AIceCandidate: string);
    procedure TMSFNCWebsocketClient1Connect(Sender: TObject;
      AConnection: TTMSFNCWebSocketConnection);
    procedure TMSFNCWebsocketClient1MessageReceived(Sender: TObject;
      AConnection: TTMSFNCWebSocketConnection; const aMessage: string);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  JSON, System.Generics.Collections;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if Button1.Caption <> 'Disconnect' then
  begin
    if ListBox1.ItemIndex <> -1 then
    begin
      FPeer := (ListBox1.Items.Objects[ListBox1.ItemIndex] as TPeer).PeerID;
      TMSFNCWebsocketClient1.Send('{"type": "join", "user": "' + FPeer + '", "sender": "' + FID + '"}');
    end;
  end
  else
  begin
    TMSFNCWXWebRTCCommunication1.RemovePeerConnection(FPeer);
    TMSFNCWebsocketClient1.Send('{"type": "disconnect", "user": "' + FPeer + '", "sender": "' + FID + '"}');
    FPeer := '';
    SetControls(True);
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if edtSelf.Text <> '' then
  begin
    TMSFNCWebsocketClient1.Port := StrToInt(Edit1.Text);
    TMSFNCWebsocketClient1.Connect;
  end;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
var
  cam, mic: string;
begin
  cam := ComboBox1.Items.ValueFromIndex[ComboBox1.ItemIndex];
  mic := ComboBox2.Items.ValueFromIndex[ComboBox2.ItemIndex];
  TMSFNCWXWebRTCCommunication1.RequestUserMedia(cam, mic);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TMSFNCWebsocketClient1.Send('{"type": "close", "user": "' + FID + '"}');
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  for var i := ListBox1.Items.Count - 1 downto 0 do
  begin
    ListBox1.Items.Objects[i].Free;
    ListBox1.Items.Objects[i] := nil;
  end;
end;

procedure TForm2.SetControls(AEnabled: Boolean);
begin
  if AEnabled then
    Button1.Caption := 'Join to peer'
  else
    Button1.Caption := 'Disconnect';
  ComboBox1.Enabled := AEnabled;
  ComboBox2.Enabled := AEnabled;
end;

procedure TForm2.TMSFNCWebsocketClient1Connect(Sender: TObject;
  AConnection: TTMSFNCWebSocketConnection);
begin
  AConnection.Send('{"type": "request-id", "sender": "' + edtSelf.Text + '"}');
  Button2.Enabled := False;
end;

procedure TForm2.TMSFNCWebsocketClient1MessageReceived(Sender: TObject;
  AConnection: TTMSFNCWebSocketConnection; const aMessage: string);
var
  msgType, user, userId: string;
  jsonObject: TJSONValue;
  data: TJSONObject;
  arr: TJSONArray;
  I: Integer;
  p: TPeer;
begin
  //Server sends an occasional 'ping' message, ignore
  if AMessage = 'ping' then
    Exit;

  TTMSFNCUtils.Log(AMessage);
  //Parse incoming message
  jsonObject := TTMSFNCUtils.ParseJSON(AMessage);
  try
    jsonObject.TryGetValue<string>('type', msgType);
    if msgType = 'self-id' then
    begin
      SetControls(True);
      Button1.Enabled := True;

      //this is our own ID in the server used for forwarding messages
      //save it and use whenever sending something
      jsonObject.TryGetValue<string>('id', FID);

      if jsonObject.TryGetValue<TJSONArray>('users', arr) then
      begin
        for I := 0 to arr.Count - 1 do
        begin
          (arr.Items[I] as TJSONObject).TryGetValue<string>('name', user);
          (arr.Items[I] as TJSONObject).TryGetValue<string>('id', userId);
          p := TPeer.Create;
          p.PeerID := userId;
          ListBox1.Items.AddObject(user, p);
        end;
      end;
    end
    else if msgType = 'connect' then
    begin
      //A new user joined the server
      jsonObject.TryGetValue<string>('user', user);
      jsonObject.TryGetValue<string>('id', userId);
      p := TPeer.Create;
      p.PeerID := userId;
      ListBox1.Items.AddObject(user, p);
    end
    else if msgType = 'join' then
    begin
      //A peer joined us, add their id
      jsonObject.TryGetValue<string>('user', user);
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
      if jsonObject.TryGetValue<TJSONObject>('offer', data) then
        TMSFNCWXWebRTCCommunication1.AcceptOffer(FPeer, data.ToJSON);
    end
    else if msgType = 'answer' then
    begin
      //An answer arrived, accept:
      if jsonObject.TryGetValue<TJSONObject>('answer', data) then
        TMSFNCWXWebRTCCommunication1.AcceptAnswer(FPeer, data.ToJSON);
    end
    else if msgType = 'candidate' then
    begin
      //A candidate arrived, add:
      if jsonObject.TryGetValue<TJSONObject>('candidate', data) then
        TMSFNCWXWebRTCCommunication1.AddIceCandidate(FPeer, data.ToJSON);
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
      if jsonObject.TryGetValue<string>('user', user) then
      begin
        if FPeer = user then
        begin
          TMSFNCWXWebRTCCommunication1.RemovePeerConnection(FPeer);
          SetControls(True);
        end;

        for I := 0 to ListBox1.Count - 1 do
        begin
          if (ListBox1.Items.Objects[I] as TPeer).PeerID = user then
          begin
            ListBox1.Items.Objects[I].Free;
            ListBox1.Items.Objects[I] := nil;
            ListBox1.Items.Delete(I);
            Break;
          end;
        end;
      end;
    end;
  finally
    jsonObject.Free;
  end;
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1Answer(Sender: TObject; AID,
  AAnswer: string);
begin
  TMSFNCWebsocketClient1.Send('{"type": "answer", "user": "' + FPeer + '", "answer": ' + AAnswer + '}');
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1DeviceListInitialized(
  Sender: TObject);
var
  idCam, idMic: string;
  I: Integer;
  device: TTMSFNCWXWebRTCDevice;
begin
  idCam := '';
  idMic := '';

  for I := 0 to TMSFNCWXWebRTCCommunication1.DeviceList.Count - 1 do
  begin
    device := TMSFNCWXWebRTCCommunication1.DeviceList.Items[I];
    if device.Kind = wdkVideoInput then
    begin
      if idCam = '' then
        idCam := device.DeviceID;
      ComboBox1.Items.AddPair(device.Name, device.DeviceID)
    end
    else if device.Kind = wdkAudioInput then
    begin
      if idMic = '' then
        idMic := device.DeviceID;
      ComboBox2.Items.AddPair(device.Name, device.DeviceID);
    end;
  end;

  if ComboBox1.Items.Count > 0 then
    ComboBox1.ItemIndex := 0;

  if ComboBox2.Items.Count > 0 then
    ComboBox2.ItemIndex := 0;

  //Request access to first items
  TMSFNCWXWebRTCCommunication1.RequestUserMedia(idCam, idMic);
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1IceCandidate(Sender: TObject; AID,
  AIceCandidate: string);
begin
  TMSFNCWebsocketClient1.Send('{"type": "candidate", "user": "' + FPeer + '", "candidate": ' + AIceCandidate + '}');
end;

procedure TForm2.TMSFNCWXWebRTCCommunication1Offer(Sender: TObject; AID,
  AOffer: string);
begin
  TMSFNCWebsocketClient1.Send('{"type": "offer", "user": "' + FPeer + '", "offer": ' + AOffer + '}');
end;

end.
