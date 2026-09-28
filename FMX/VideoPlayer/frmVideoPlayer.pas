unit frmVideoPlayer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXCamera, FMX.TMSFNCWXHTMLMemo, FMX.TMSFNCWXPDFViewer, FMX.TMSFNCWXVideoPlayer,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TMSFNCWXQRCode,
  FMX.Edit, FMX.EditBox, FMX.SpinBox, FMX.ListBox, encdDecd, system.IOUtils,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.Layouts, FMX.TMSFNCWXMediaPlayer;

type
 TDemo = class(TForm)
    btnPlay: TButton;
    btnMute: TButton;
    btnBackToStart: TButton;
    btnRewind: TButton;
    btnForward: TButton;
    btnPiP: TButton;
    ComboBox1: TComboBox;
    rdbControls: TCheckBox;
    rdbAutoPlay: TCheckBox;
    rdbLoop: TCheckBox;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Layout1: TLayout;
    V: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    ProgressBar1: TProgressBar;
    vPlayer: TTMSFNCWXVideoPlayer;
    Layout7: TLayout;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure vPlayerPlay(Sender: TObject);
    procedure vPlayerPause(Sender: TObject);
    procedure btnBackToStartClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnMuteClick(Sender: TObject);
    procedure btnRewindClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
    procedure Trackbar1Change(Sender: TObject);
    procedure btnPiPClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure rdbControlsChange(Sender: TObject);
    procedure rdbAutoPlayChange(Sender: TObject);
    procedure rdbLoopChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure vPlayerTimeUpdate(Sender: TObject; val: Double);
    procedure vPlayerMetaDataLoaded(Sender: TObject; Val: Double);
    procedure vPlayerError(Sender: TObject; Error: TTMSFNCWXMediaPlayerMediaError);
  private
    isPlaying : boolean;
  public
    { Public declarations }
  end;

  const
  SecPerDay = 86400;


var
  Demo: TDemo;

implementation

{$R *.fmx}

procedure TDemo.btnBackToStartClick(Sender: TObject);
begin
  vPlayer.CurrentTime := 0;
end;

procedure TDemo.btnForwardClick(Sender: TObject);
begin
  vPlayer.ForwardVideo(5);
end;

procedure TDemo.btnMuteClick(Sender: TObject);
begin
  if vPlayer.Muted then
    vPlayer.Muted := false
  else
    vPlayer.Muted := true;
end;

procedure TDemo.btnPiPClick(Sender: TObject);
begin
  if vPlayer.PictureInPicture then
    vPlayer.PictureInPicture := false
  else
    vPlayer.PictureInpicture := true;
end;

procedure TDemo.btnPlayClick(Sender: TObject);
begin
  if vPlayer.IsPlaying then
    vPlayer.Pause
  else
    vPlayer.Play;
end;

procedure TDemo.btnRewindClick(Sender: TObject);
begin
  vPlayer.RewindVideo(5);
end;

procedure TDemo.Button1Click(Sender: TObject);
var
path: string;

begin
   if OpenDialog1.Execute then
   begin
      path := OpenDialog1.Files[0];
      vPlayer.URL := stringreplace(path, '\','/', [rfReplaceAll]);
   end;
end;

procedure TDemo.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.itemIndex of
      0: vPlayer.PlayBackRate := 0.25;
      1: vPlayer.PlayBackRate := 0.50;
      2: vPlayer.PlayBackRate := 0.75;
      3: vPlayer.PlayBackRate := 1.00;
      4: vPlayer.PlayBackRate := 1.25;
      5: vPlayer.PlayBackRate := 1.50;
      6: vPlayer.PlayBackRate := 1.75;
      7: vPlayer.PlayBackRate := 2.00;
  end;
end;

procedure TDemo.FormCreate(Sender: TObject);
begin
  Trackbar1.Value := vPlayer.Volume * 100;
  Trackbar1.OnChange := Trackbar1Change;
  rdbControls.OnChange := nil;
  rdbAutoPlay.OnChange := nil;
  rdbLoop.OnChange := nil;
  rdbControls.IsChecked := vPlayer.Controls;
  rdbAutoPlay.IsChecked := vPlayer.AutoPlay;
  rdbLoop.IsChecked := vPlayer.Loop;
  rdbControls.OnChange := rdbControlsChange;
  rdbAutoPlay.OnChange := rdbAutoPlayChange;
  rdbLoop.OnChange := rdbLoopChange;
  vPlayer.Play;
end;

procedure TDemo.rdbAutoPlayChange(Sender: TObject);
begin
   if vPlayer.AutoPlay then
    vPlayer.AutoPlay := false
  else
    vPlayer.AutoPlay := true;

end;

procedure TDemo.rdbControlsChange(Sender: TObject);
begin
  if vPlayer.Controls then
    vPlayer.Controls := false
  else
    vPlayer.Controls := true;
end;

procedure TDemo.rdbLoopChange(Sender: TObject);
begin
  if vPlayer.Loop then
    vPlayer.Loop := false
  else
    vPlayer.Loop := true;
end;

procedure TDemo.Trackbar1Change(Sender: TObject);
begin
  vPlayer.Volume := (Trackbar1.Value/100);
end;

procedure TDemo.vPlayerError(Sender: TObject; Error: TTMSFNCWXMediaPlayerMediaError);
var
  msg: string;
begin
  case Error of
    MEDIA_ERR_ABORTED: msg := 'The user canceled the video';
    MEDIA_ERR_NETWORK: msg := 'A network error occurred while fetching the video.';
    MEDIA_ERR_DECODE: msg := 'An error occurred while decoding the video.';
    MEDIA_ERR_SRC_NOT_SUPPORTED: msg := 'the video is missing or is in a format not supported by your browser.';
  end;

   TTMSFNCUtils.Log(msg);
end;

procedure TDemo.vPlayerMetaDataLoaded(Sender: TObject; Val: Double);
begin
   ProgressBar1.Max := Val;
   Label1.Text := FormatDateTime('hh:nn:ss', Trunc(vPlayer.CurrentTime) / SecsPerDay) + ' / '+FormatDateTime('hh:nn:ss', Trunc(vPlayer.Duration) / SecsPerDay);
end;

procedure TDemo.vPlayerPause(Sender: TObject);
begin
  btnPlay.Text :='play';

end;

procedure TDemo.vPlayerPlay(Sender: TObject);
begin
  btnPlay.Text := 'pause';
end;

procedure TDemo.vPlayerTimeUpdate(Sender: TObject; val: Double);
begin
  ProgressBar1.Value := val;
  Label1.Text := FormatDateTime('hh:nn:ss', Trunc(vPlayer.CurrentTime) / SecsPerDay)+' / '+FormatDateTime('hh:nn:ss', Trunc(vPlayer.Duration) / SecsPerDay);
end;

end.
