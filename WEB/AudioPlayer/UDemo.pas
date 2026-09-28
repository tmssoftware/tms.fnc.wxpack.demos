unit UDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  WEBLib.ExtCtrls, VCL.TMSFNCWXMediaPlayer, VCL.TMSFNCWXAudioPlayer,
  WEBLib.ComCtrls;

type
  TForm1 = class(TWebForm)
    TMSFNCWXAudioPlayer1: TTMSFNCWXAudioPlayer;
    urlEdt: TWebEdit;
    urlBtn: TWebButton;
    replayBtn: TWebButton;
    ctrlChk: TWebCheckBox;
    autoChk: TWebCheckBox;
    loopChk: TWebCheckBox;
    lengthPb: TWebProgressBar;
    volTb: TWebTrackBar;
    muteChk: TWebCheckBox;
    rewBtn: TWebButton;
    playBtn: TWebButton;
    forwBtn: TWebButton;
    rateCb: TWebComboBox;
    WebLabel1: TWebLabel;
    procedure muteChkClick(Sender: TObject);
    procedure autoChkClick(Sender: TObject);
    procedure ctrlChkClick(Sender: TObject);
    procedure forwBtnClick(Sender: TObject);
    procedure loopChkClick(Sender: TObject);
    procedure playBtnClick(Sender: TObject);
    procedure rateCbChange(Sender: TObject);
    procedure replayBtnClick(Sender: TObject);
    procedure rewBtnClick(Sender: TObject);
    procedure urlBtnClick(Sender: TObject);
    procedure volTbChange(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1MetaDataLoaded(Sender: TObject; Val: Double);
    procedure TMSFNCWXAudioPlayer1TimeUpdate(Sender: TObject; Val: Double);
    procedure TMSFNCWXAudioPlayer1Play(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1Pause(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  WEBLib.WebTools;

{$R *.dfm}

procedure TForm1.autoChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.AutoPlay := autoChk.Checked;
end;

procedure TForm1.ctrlChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Controls := ctrlChk.Checked;
end;

procedure TForm1.forwBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.ForwardAudio(5);
end;

procedure TForm1.loopChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Loop := loopChk.Checked;
end;

procedure TForm1.muteChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Muted := muteChk.Checked;
end;

procedure TForm1.playBtnClick(Sender: TObject);
begin
  if not TMSFNCWXAudioPlayer1.IsPlaying then
    TMSFNCWXAudioPlayer1.Play
  else
    TMSFNCWXAudioPlayer1.Pause;
end;

procedure TForm1.rateCbChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.PlayBackRate := (rateCb.ItemIndex + 1) * 0.25;
end;

procedure TForm1.replayBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.CurrentTime := 0.0;
  if not TMSFNCWXAudioPlayer1.IsPlaying then
    TMSFNCWXAudioPlayer1.Play;
end;

procedure TForm1.rewBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.RewindAudio(5);
end;

procedure TForm1.TMSFNCWXAudioPlayer1MetaDataLoaded(Sender: TObject;
  Val: Double);
begin
  lengthPb.Max := Round(Val);
end;

procedure TForm1.TMSFNCWXAudioPlayer1Pause(Sender: TObject);
begin
  playBtn.Caption := 'Play';
end;

procedure TForm1.TMSFNCWXAudioPlayer1Play(Sender: TObject);
begin
  playBtn.Caption := 'Pause';
end;

procedure TForm1.TMSFNCWXAudioPlayer1TimeUpdate(Sender: TObject; Val: Double);
begin
  lengthPb.Position := Round(Val);
end;

procedure TForm1.urlBtnClick(Sender: TObject);
begin
  playBtn.Caption := 'Play';
  TMSFNCWXAudioPlayer1.URL := urlEdt.Text;
end;

procedure TForm1.volTbChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Volume := volTb.Position / 100;
end;

end.
