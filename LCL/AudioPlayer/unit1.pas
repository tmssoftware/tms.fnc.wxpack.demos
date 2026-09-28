unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ComCtrls, LCLTMSFNCWXCamera, LCLTMSFNCWXAudioPlayer, LCLTMSFNCTypes, LCLTMSFNCWXMediaPlayer;

type

  { TForm1 }

  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    rateCb: TComboBox;
    Label1: TLabel;
    replayBtn: TButton;
    rewBtn: TButton;
    playBtn: TButton;
    forwBtn: TButton;
    ctrlChk: TCheckBox;
    autoChk: TCheckBox;
    loopChk: TCheckBox;
    muteChk: TCheckBox;
    lengthPb: TProgressBar;
    TMSFNCWXAudioPlayer1: TTMSFNCWXAudioPlayer;
    volTb: TTrackBar;
    urlBtn: TButton;
    fileBtn: TButton;
    urlEdt: TEdit;
    procedure autoChkChange(Sender: TObject);
    procedure ctrlChkChange(Sender: TObject);
    procedure fileBtnClick(Sender: TObject);
    procedure forwBtnClick(Sender: TObject);
    procedure loopChkChange(Sender: TObject);
    procedure muteChkChange(Sender: TObject);
    procedure playBtnClick(Sender: TObject);
    procedure rateCbChange(Sender: TObject);
    procedure replayBtnClick(Sender: TObject);
    procedure rewBtnClick(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1MetaDataLoaded(Sender: TObject; Val: Double);
    procedure TMSFNCWXAudioPlayer1Pause(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1Play(Sender: TObject);
    procedure TMSFNCWXAudioPlayer1TimeUpdate(Sender: TObject; Val: Double);
    procedure urlBtnClick(Sender: TObject);
    procedure volTbChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.urlBtnClick(Sender: TObject);
begin
  playBtn.Caption := 'Play';
  TMSFNCWXAudioPlayer1.URL := urlEdt.Text;
end;

procedure TForm1.volTbChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Volume := volTb.Position / 100;
end;

procedure TForm1.fileBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    playBtn.Caption := 'Play';
    TMSFNCWXAudioPlayer1.URL := StringReplace(OpenDialog1.FileName, '\', '/', [rfReplaceAll]);
  end;
end;

procedure TForm1.forwBtnClick(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.ForwardAudio(5);
end;

procedure TForm1.loopChkChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Loop := loopChk.Checked;
end;

procedure TForm1.muteChkChange(Sender: TObject);
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

procedure TForm1.TMSFNCWXAudioPlayer1MetaDataLoaded(Sender: TObject; Val: Double
  );
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

procedure TForm1.ctrlChkChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.Controls := ctrlChk.Checked;
end;

procedure TForm1.autoChkChange(Sender: TObject);
begin
  TMSFNCWXAudioPlayer1.AutoPlay := autoChk.Checked;
end;

end.

