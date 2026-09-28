unit uDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXVideoPlayer, WEBLib.ComCtrls, Vcl.StdCtrls, WEBLib.StdCtrls,
  WEBLib.ExtCtrls;

type
  TDemo = class(TWebForm)
    TMSFNCWXVideoPlayer1: TTMSFNCWXVideoPlayer;
    Play: TWebButton;
    Forward: TWebButton;
    Rewind: TWebButton;
    Mute: TWebButton;
    Restart: TWebButton;
    TogglePiP: TWebButton;
    VolumeBar: TWebTrackBar;
    ToggleLoop: TWebCheckBox;
    ToggleAutoPlay: TWebCheckBox;
    ToggleControls: TWebCheckBox;
    WebProgressBar1: TWebProgressBar;
    PlayBackRate: TWebComboBox;
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    WebLabel3: TWebLabel;
    WebLabel4: TWebLabel;
    WebLabel5: TWebLabel;
    procedure PlayClick(Sender: TObject);
    procedure RewindClick(Sender: TObject);
    procedure ForwardClick(Sender: TObject);
    procedure MuteClick(Sender: TObject);
    procedure RestartClick(Sender: TObject);
    procedure TogglePiPClick(Sender: TObject);
    procedure VolumeBarChange(Sender: TObject);
    procedure PlayBackRateChange(Sender: TObject);
    procedure ToggleLoopClick(Sender: TObject);
    procedure ToggleAutoPlayClick(Sender: TObject);
    procedure ToggleControlsClick(Sender: TObject);
    procedure TMSFNCWXVideoPlayer1MetaDataLoaded(Sender: TObject; Val: Double);
    procedure TMSFNCWXVideoPlayer1TimeUpdate(Sender: TObject; Val: Double);
    procedure WebFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.TMSFNCWXVideoPlayer1MetaDataLoaded(Sender: TObject;
  Val: Double);
begin
  WebProgressBar1.Max := Trunc(Val * 1000);
end;

procedure TDemo.TMSFNCWXVideoPlayer1TimeUpdate(Sender: TObject; Val: Double);
begin
  WebProgressBar1.Position := Trunc(Val * 1000);
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

procedure TDemo.RewindClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.RewindVideo(5);
end;

procedure TDemo.MuteClick(Sender: TObject);
begin
  if TMSFNCWXVideoPlayer1.Muted then
    TMSFNCWXVideoPlayer1.Muted := false
  else
    TMSFNCWXVideoPlayer1.Muted := true;
end;

procedure TDemo.RestartClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.CurrentTime := 0;
end;

procedure TDemo.TogglePiPClick(Sender: TObject);
begin
 if TMSFNCWXVideoPlayer1.PictureInPicture then
  TMSFNCWXVideoPlayer1.PictureInPicture := false
 else
  TMSFNCWXVideoPlayer1.PictureInPicture := true;
end;

procedure TDemo.ToggleLoopClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.Loop := ToggleLoop.Checked;
end;

procedure TDemo.ToggleAutoPlayClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.AutoPlay := ToggleAutoPlay.Checked;
end;

procedure TDemo.ToggleControlsClick(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.Controls := ToggleControls.Checked;
end;

procedure TDemo.PlayBackRateChange(Sender: TObject);
begin
  case PlayBackrate.ItemIndex of
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

procedure TDemo.VolumeBarChange(Sender: TObject);
begin
  TMSFNCWXVideoPlayer1.Volume := (VolumeBar.Position / 100);
end;

procedure TDemo.WebFormCreate(Sender: TObject);
begin
  VolumeBar.Position := Trunc(TMSFNCWXVideoPlayer1.Volume*100);
  ToggleLoop.Checked := TMSFNCWXVideoPlayer1.Loop;
  ToggleAutoPlay.Checked := TMSFNCWXVideoPlayer1.AutoPlay;
  ToggleControls.Checked := TMSFNCWXVideoPlayer1.Controls;
end;

end.