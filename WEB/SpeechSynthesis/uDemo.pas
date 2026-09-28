unit uDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls, WEBLib.StdCtrls,
  Vcl.Controls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent,
  VCL.TMSFNCWXSpeechSynthesis;

type
  TDemo = class(TWebForm)
    TMSFNCWXSpeechSynthesis1: TTMSFNCWXSpeechSynthesis;
    Input: TWebMemo;
    Speak: TWebButton;
    Configure: TWebButton;
    Pause: TWebButton;
    Resume: TWebButton;
    Cancel: TWebButton;
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    WebLabel3: TWebLabel;
    procedure ConfigureClick(Sender: TObject);
    procedure SpeakClick(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Start(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Resume(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Pause(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1End(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure PauseClick(Sender: TObject);
    procedure ResumeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.TMSFNCWXSpeechSynthesis1End(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.IsSpeaking then
    Weblabel1.Caption := 'Speaking...'
  else
    WebLabel1.Caption := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Pause(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.IsSpeaking then
    Weblabel1.Caption := 'Speaking...'
  else
    WebLabel1.Caption := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Resume(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.IsSpeaking then
    Weblabel1.Caption := 'Speaking...'
  else
    WebLabel1.Caption := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Start(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.IsSpeaking then
    Weblabel1.Caption := 'Speaking...'
  else
    WebLabel1.Caption := '';
end;

procedure TDemo.SpeakClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Speak(Input.Text);
end;

procedure TDemo.ConfigureClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.ConfigureVoices;
end;

procedure TDemo.PauseClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Pause;
end;

procedure TDemo.ResumeClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Resume;
end;

procedure TDemo.CancelClick(Sender: TObject);
begin
   TMSFNCWXSpeechSynthesis1.Cancel;
end;

end.
