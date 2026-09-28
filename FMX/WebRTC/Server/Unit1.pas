unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCWebSocketCommon, Vcl.StdCtrls,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCWebSocketServer, Vcl.ExtCtrls;

type
  TRTCPeer = class(TObject)
  private
    FID: string;
    FName: string;
  public
    property Name: string read FName write FName;
    property ID: string read FID write FID;
  end;

  TForm4 = class(TForm)
    TMSFNCWebSocketServer1: TTMSFNCWebSocketServer;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Label2: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TMSFNCWebSocketServer1MessageReceived(Sender: TObject;
      AConnection: TTMSFNCWebSocketConnection; const aMessage: string);
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCWebSocketServer1Disconnect(Sender: TObject;
      AConnection: TTMSFNCWebSocketConnection);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FUserList: TStringList;
  public
    { Public declarations }
    function GetRandomID: string;
    function UserExists(AID: string): Boolean;
    function GetUserArray: string;
    procedure SendMessageToClientWithID(AID: string; AMessage: string);
  end;

var
  Form4: TForm4;

implementation

uses
  JSON;

type
  TTMSFNCWebSocketServerOpen = class(TTMSFNCWebSocketServer);

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var
  p: Integer;
begin
  //Start server
  if TryStrToInt(Edit1.Text, p) then
  begin
    TMSFNCWebSocketServer1.Port := p;
    TMSFNCWebSocketServer1.Active := True;
    Edit1.Enabled := False;
    Button1.Enabled := False;
  end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FUserList.Free;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  FUserList := TStringList.Create;
  TMSFNCWebSocketServer1.AutoSyncEvents := False;
end;

function TForm4.GetRandomID: string;
const
  cChars: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
  len, I: Integer;
begin
  len := Length(cChars);
  SetLength(Result, 10);
  for I := 1 to 10 do
    Result[I] := cChars[Random(len) + 1];
end;

function TForm4.GetUserArray: string;
var
  I: Integer;
begin
  Result := '[';
  for I := 0 to FUserList.Count - 1 do
  begin
    Result := Result + '{"name": "' + FUserList.ValueFromIndex[I] + '", "id": "' + FUserList.Names[I] + '"},';
  end;
  if Result.EndsWith(',') then
    Delete(Result, Length(Result), 1);
  Result := Result + ']';
end;

procedure TForm4.SendMessageToClientWithID(AID, AMessage: string);
begin
  TMSFNCWebSocketServer1.SendMessageTo(AMessage, function (AConnection: TTMSFNCWebSocketServerConnection): Boolean
  begin
    Result := False;
    if TRTCPeer(AConnection.UserData).ID = AID then
      Result := True;
  end);
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
  //Ping all connected clients
  TMSFNCWebSocketServer1.SendMessageTo('ping', function (AConnection: TTMSFNCWebSocketServerConnection): Boolean
  begin
    Result := True;
  end);
end;

procedure TForm4.TMSFNCWebSocketServer1Disconnect(Sender: TObject;
  AConnection: TTMSFNCWebSocketConnection);
var
  id, user: string;
  i: Integer;
begin
  if Assigned(FUserList) then
  begin
    id := TRTCPeer(TTMSFNCWebSocketServerConnection(AConnection).UserData).ID;
    user := TRTCPeer(TTMSFNCWebSocketServerConnection(AConnection).UserData).Name;
    i := FUserList.IndexOfName(id);
    if i <> -1 then
      FUserList.Delete(i);
  end;
end;

procedure TForm4.TMSFNCWebSocketServer1MessageReceived(Sender: TObject;
  AConnection: TTMSFNCWebSocketConnection; const aMessage: string);
var
  json: TJSONValue;
  jObj: TJSONObject;
  typ, user, s, lID: string;
  i: Integer;
begin
  if AMessage = 'ping' then
    Exit;

  json := TJSONObject.ParseJSONValue(AMessage);
  try
    if json.TryGetValue<string>('type', typ) then
    begin
      if typ = 'request-id' then
      begin
        json.TryGetValue<string>('sender', user);
        TTMSFNCWebSocketServerConnection(AConnection).OwnsUserData := True;
        if not Assigned(TTMSFNCWebSocketServerConnection(AConnection).UserData) then
          TTMSFNCWebSocketServerConnection(AConnection).UserData := TRTCPeer.Create;

        lID := GetRandomID;
        TRTCPeer(TTMSFNCWebSocketServerConnection(AConnection).UserData).ID := lID;
        TRTCPeer(TTMSFNCWebSocketServerConnection(AConnection).UserData).Name := user;
        s := '{"type": "self-id", "id": "' + lID + '", "users": ' + GetUserArray + '}';
        AConnection.Send(s);
        FUserList.AddPair(lID, user);
        TMSFNCWebSocketServer1.SendMessageTo('{"type": "connect", "user": "' + user + '", "id": "' + lID + '"}', function (ACConnection: TTMSFNCWebSocketServerConnection): Boolean
          begin
            Result := False;
            if AConnection <> ACConnection then
             Result := True;
          end);
      end
      else if typ = 'join' then
      begin
        if json.TryGetValue<string>('user', user) then
        begin
          json.TryGetValue<string>('sender', s);
          if UserExists(user) then
          begin
            SendMessageToClientWithID(user, '{"type": "join", "user": "' + s + '"}');
            SendMessageToClientWithID(s, '{"type": "join-success"}')
          end
          else
            SendMessageToClientWithID(s, '{"type": "join-reject"}');
        end;
      end
      else if typ = 'offer' then
      begin
        if json.TryGetValue<TJSONObject>('offer', jObj) and json.TryGetValue<string>('user', user) then
        begin
          SendMessageToClientWithID(user, '{"type": "offer", "offer": ' + jObj.ToJSON + '}');
        end;
      end
      else if typ = 'answer' then
      begin
        if json.TryGetValue<TJSONObject>('answer', jObj) and json.TryGetValue<string>('user', user) then
        begin
          SendMessageToClientWithID(user, '{"type": "answer", "answer": ' + jObj.ToJSON + '}');
        end;
      end
      else if typ = 'candidate' then
      begin
        if json.TryGetValue<TJSONObject>('candidate', jObj) and json.TryGetValue<string>('user', user) then
        begin
          SendMessageToClientWithID(user, '{"type": "candidate", "candidate": ' + jObj.ToJSON + '}');
        end;
      end
      else if typ = 'disconnect' then
      begin
        if json.TryGetValue<string>('user', user) then
        begin
          json.TryGetValue<string>('sender', s);
          TMSFNCWebSocketServer1.SendMessageTo('{"type": "disconnect", "user": "' + s + '"}', function (AConnection: TTMSFNCWebSocketServerConnection): Boolean
            begin
              Result := False;
              if TRTCPeer(AConnection.UserData).ID = user then
                Result := True;
            end);
        end;
      end
      else if typ = 'close' then
      begin
        if json.TryGetValue<string>('user', user) then
        begin
          TMSFNCWebSocketServer1.SendMessageTo('{"type": "close", "user": "' + user + '"}', function (ACConnection: TTMSFNCWebSocketServerConnection): Boolean
            begin
              Result := True;
              if AConnection = ACConnection then
                Result := False;
            end);

          i := FUserList.IndexOfName(user);
          if i <> -1 then
            FUserList.Delete(i);
        end;
      end;
    end;
  finally
    json.Free;
  end;
end;

function TForm4.UserExists(AID: string): Boolean;
var
  //ConnectionPtr: Pointer;
  //Connection: TTMSFNCWebSocketServerConnection;
  I: Integer;
begin
  Result := False;
  for I := 0 to FUserList.Count - 1 do
  begin
    if FUserList.Names[I] = AID then
    begin
      Result := True;
      Break;
    end;
  end;
end;

end.
