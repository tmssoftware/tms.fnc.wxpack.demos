unit UDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  Vcl.ExtCtrls, VCL.TMSFNCWXMediaPlayer, VCL.TMSFNCWXAudioPlayer, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    TMSFNCWXAudioPlayer1: TTMSFNCWXAudioPlayer;
    urlEdt: TEdit;
    urlBtn: TButton;
    fileBtn: TButton;
    ctrlChk: TCheckBox;
    autoChk: TCheckBox;
    loopChk: TCheckBox;
    lengthPb: TProgressBar;
    volTb: TTrackBar;
    rateCb: TComboBox;
    Label1: TLabel;
    replayBtn: TButton;
    rewBtn: TButton;
    playBtn: TButton;
    forwBtn: TButton;
    OpenDialog1: TOpenDialog;
    muteChk: TCheckBox;
    procedure TMSFNCWXAudioPlayer1MetaDataLoaded(Sender: TObject; Val: Double);
    procedure TMSFNCWXAudioPlayer1TimeUpdate(Sender: TObject; Val: Double);
    procedure TMSFNCWXAudioPlayer1Play(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1Pause(Sender: TObject);
    procedure ctrlChkClick(Sender: TObject);
    procedure autoChkClick(Sender: TObject);
    procedure loopChkClick(Sender: TObject);
    procedure urlBtnClick(Sender: TObject);
    procedure fileBtnClick(Sender: TObject);
    procedure volTbChange(Sender: TObject);
    procedure forwBtnClick(Sender: TObject);
    procedure playBtnClick(Sender: TObject);
    procedure replayBtnClick(Sender: TObject);
    procedure rewBtnClick(Sender: TObject);
    procedure muteChkClick(Sender: TObject);
    procedure rateCbChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.autoChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.AutoPlay := autoChk.Checked;
end;

procedure TForm2.urlBtnClick(Sender: TObject);
begin
  playBtn.Caption := 'Play';
  TMSFNCWXAudioPlayer1.URL := urlEdt.Text;
end;

procedure TForm2.volTbChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Volume := volTb.Position / 100;
end;

procedure TForm2.fileBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    playBtn.Caption := 'Play';
    TMSFNCWXAudioPlayer1.URL := StringReplace(OpenDialog1.FileName, '\', '/', [rfReplaceAll]);
  end;
end;

procedure TForm2.forwBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.ForwardAudio(5);
end;

procedure TForm2.ctrlChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Controls := ctrlChk.Checked;
end;

procedure TForm2.loopChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Loop := loopChk.Checked;
end;

procedure TForm2.muteChkClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Muted := muteChk.Checked;
end;

procedure TForm2.playBtnClick(Sender: TObject);
begin
  if not TMSFNCWXAudioPlayer1.IsPlaying then
    TMSFNCWXAudioPlayer1.Play
  else
    TMSFNCWXAudioPlayer1.Pause;
end;

procedure TForm2.rateCbChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.PlayBackRate := (rateCb.ItemIndex + 1) * 0.25;
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
  lengthPb.Max := Round(Val);
end;

procedure TForm2.TMSFNCWXAudioPlayer1Pause(Sender: TObject);
begin
  playBtn.Caption := 'Play';
end;

procedure TForm2.TMSFNCWXAudioPlayer1Play(Sender: TObject);
begin
  playBtn.Caption := 'Pause';
end;

procedure TForm2.TMSFNCWXAudioPlayer1TimeUpdate(Sender: TObject; Val: Double);
begin
  lengthPb.Position := Round(Val);
end;

end.
