unit UDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  System.ImageList, FMX.ImgList, FMX.TMSFNCWXMediaPlayer,
  FMX.TMSFNCWXAudioPlayer, FMX.Edit, FMX.ListBox;

type
  TForm2 = class(TForm)
    TMSFNCWXAudioPlayer1: TTMSFNCWXAudioPlayer;
    lengthPb: TProgressBar;
    volTb: TTrackBar;
    playBtn: TButton;
    rewBtn: TButton;
    forwBtn: TButton;
    replayBtn: TButton;
    rateCb: TComboBox;
    urlBtn: TButton;
    fileBtn: TButton;
    urlEdt: TEdit;
    Label1: TLabel;
    ctrlChk: TCheckBox;
    autoChk: TCheckBox;
    loopChk: TCheckBox;
    OpenDialog1: TOpenDialog;
    muteChk: TCheckBox;
    procedure TMSFNCWXAudioPlayer1MetaDataLoaded(Sender: TObject; Val: Double);
    procedure TMSFNCWXAudioPlayer1Pause(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1Play(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1TimeUpdate(Sender: TObject; Val: Double);
    procedure volTbTracking(Sender: TObject);
    procedure urlBtnClick(Sender: TObject);
    procedure fileBtnClick(Sender: TObject);
    procedure playBtnClick(Sender: TObject);
    procedure autoChkChange(Sender: TObject);
    procedure ctrlChkChange(Sender: TObject);
    procedure loopChkChange(Sender: TObject);
    procedure replayBtnClick(Sender: TObject);
    procedure rewBtnClick(Sender: TObject);
    procedure forwBtnClick(Sender: TObject);
    procedure rateCbChange(Sender: TObject);
    procedure muteChkChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.autoChkChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.AutoPlay := autoChk.IsChecked;
end;

procedure TForm2.urlBtnClick(Sender: TObject);
begin
  playBtn.Text := 'Play';
  TMSFNCWXAudioPlayer1.URL := urlEdt.Text;
end;

procedure TForm2.fileBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    playBtn.Text := 'Play';
    TMSFNCWXAudioPlayer1.URL := StringReplace(OpenDialog1.FileName, '\','/', [rfReplaceAll]);
  end;
end;

procedure TForm2.rateCbChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.PlayBackRate := (rateCb.ItemIndex + 1) * 0.25;
end;

procedure TForm2.ctrlChkChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Controls := ctrlChk.IsChecked;
end;

procedure TForm2.forwBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.ForwardAudio(5);
end;

procedure TForm2.loopChkChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Loop := loopChk.IsChecked;
end;

procedure TForm2.muteChkChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Muted := muteChk.IsChecked;
end;

procedure TForm2.playBtnClick(Sender: TObject);
begin
  if not TMSFNCWXAudioPlayer1.IsPlaying then
    TMSFNCWXAudioPlayer1.Play
  else
    TMSFNCWXAudioPlayer1.Pause;
end;

procedure TForm2.replayBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.CurrentTime := 0.0;
  if not TMSFNCWXAudioPlayer1.IsPlaying then
    TMSFNCWXAudioPlayer1.Play;
end;

procedure TForm2.rewBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.RewindAudio(5);
end;

procedure TForm2.TMSFNCWXAudioPlayer1MetaDataLoaded(Sender: TObject;
  Val: Double);
begin
  lengthPb.Max := Val;
end;

procedure TForm2.TMSFNCWXAudioPlayer1Pause(Sender: TObject);
begin
  playBtn.Text := 'Play';
end;

procedure TForm2.TMSFNCWXAudioPlayer1Play(Sender: TObject);
begin
  playBtn.Text := 'Pause';
end;

procedure TForm2.TMSFNCWXAudioPlayer1TimeUpdate(Sender: TObject; Val: Double);
begin
  lengthPb.Value := Val;
end;

procedure TForm2.volTbTracking(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Volume := volTb.Value;
end;

end.
