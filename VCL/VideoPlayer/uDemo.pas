unit uDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXVideoPlayer,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, VCL.TMSFNCWXMediaPlayer;

type
  TDemo = class(TForm)
    TMSFNCWXVideoPlayer1: TTMSFNCWXVideoPlayer;
    ProgressBar1: TProgressBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    VolumeBar: TTrackBar;
    Restart: TButton;
    Rewind: TButton;
    Play: TButton;
    Forward: TButton;
    Mute: TButton;
    ToggleAutoPlay: TCheckBox;
    ToggleLoop: TCheckBox;
    ToggleControls: TCheckBox;
    PlayRate: TComboBox;
    TogglePiP: TButton;
    OpenDialog1: TOpenDialog;
    LoadLocalVideo: TButton;
    Label3: TLabel;
    procedure PlayClick(Sender: TObject);
    procedure RewindClick(Sender: TObject);
    procedure ForwardClick(Sender: TObject);
    procedure MuteClick(Sender: TObject);
    procedure RestartClick(Sender: TObject);
    procedure PlayRateChange(Sender: TObject);
    procedure VolumeBarChange(Sender: TObject);
    procedure ToggleAutoPlayClick(Sender: TObject);
    procedure ToggleLoopClick(Sender: TObject);
    procedure ToggleControlsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TMSFNCWXVideoPlayer1TimeUpdate(Sender: TObject; Val: Double);
    procedure TMSFNCWXVideoPlayer1Error(Sender: TObject;
      Error: TTMSFNCWXMediaPlayerMediaError);
    procedure TMSFNCWXVideoPlayer1MetaDataLoaded(Sender: TObject; Val: Double);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure LoadLocalVideoClick(Sender: TObject);
    procedure TogglePiPClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.RestartClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.CurrentTime := 0;
end;

procedure TDemo.RewindClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.RewindVideo(5);
end;

procedure TDemo.PlayClick(Sender: TObject);
begin
  if TMSFNCWXVideoPlayer1.IsPlaying then
  begin
    TMSFNCWXVideoPlayer1.Pause;
    Play.Caption := 'Play';
  end
  else
  begin
    TMSFNCWXVideoPlayer1.Play;
    Play.Caption := 'Pause';
  end;
end;

procedure TDemo.ForwardClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.ForwardVideo(5);
end;

procedure TDemo.MuteClick(Sender: TObject);
begin
  if TMSFNCWXVideoPlayer1.Muted then
    TMSFNCWXVideoPlayer1.Muted := false
  else
    TMSFNCWXVideoPlayer1.Muted := true;
end;

procedure TDemo.LoadLocalVideoClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    TMSFNCWXVideoPlayer1.URL := StringReplace(OpenDialog1.Files[0], '\','/', [rfReplaceAll]);
  end;
end;

procedure TDemo.ToggleAutoPlayClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.AutoPlay := ToggleAutoplay.Checked;
end;

procedure TDemo.ToggleLoopClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.Loop := ToggleLoop.Checked;
end;

procedure TDemo.TogglePiPClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.PictureInPicture := not TMSFNCWXVideoPlayer1.PictureInPicture;
end;

procedure TDemo.ToggleControlsClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.Controls := ToggleControls.Checked;
end;

procedure TDemo.PlayRateChange(Sender: TObject);
begin
  case Playrate.itemIndex of
    0: TMSFNCWXVideoPlayer1.PlayBackRate := 0.25;
    1: TMSFNCWXVideoPlayer1.PlayBackRate := 0.50;
    2: TMSFNCWXVideoPlayer1.PlayBackRate := 0.75;
    3: TMSFNCWXVideoPlayer1.PlayBackRate := 1.00;
    4: TMSFNCWXVideoPlayer1.PlayBackRate := 1.25;
    5: TMSFNCWXVideoPlayer1.PlayBackRate := 1.50;
    6: TMSFNCWXVideoPlayer1.PlayBackRate := 1.75;
    7: TMSFNCWXVideoPlayer1.PlayBackRate := 2.00;
  end;
end;

procedure TDemo.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if NewWidth < 931 then
    Resize := false;
end;

procedure TDemo.FormCreate(Sender: TObject);
begin
  VolumeBar.Position := Trunc(TMSFNCWXVideoPlayer1.Volume * 100);
  ToggleControls.Checked := TMSFNCWXVideoPlayer1.Controls;
  ToggleAutoPlay.Checked := TMSFNCWXVideoPlayer1.AutoPlay;
  ToggleLoop.Checked := TMSFNCWXVideoPlayer1.Loop;
end;

procedure TDemo.TMSFNCWXVideoPlayer1Error(Sender: TObject;
  Error: TTMSFNCWXMediaPlayerMediaError);
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

procedure TDemo.TMSFNCWXVideoPlayer1MetaDataLoaded(Sender: TObject;
  Val: Double);
begin
  progressBar1.Max := trunc(Val * 100);
end;

procedure TDemo.TMSFNCWXVideoPlayer1TimeUpdate(Sender: TObject; Val: Double);
begin
  ProgressBar1.Position := trunc(val * 100);
end;

procedure TDemo.VolumeBarChange(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.Volume := (VolumeBar.Position / 100);
end;

end.
