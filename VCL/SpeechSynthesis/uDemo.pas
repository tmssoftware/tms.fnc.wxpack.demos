unit uDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXSpeechSynthesis, Vcl.ComCtrls;

type
  TDemo = class(TForm)
    Memo1: TMemo;
    Speak: TButton;
    Configure: TButton;
    Pause: TButton;
    Resume: TButton;
    Cancel: TButton;
    StatusBar1: TStatusBar;
    TMSFNCWXSpeechSynthesis1: TTMSFNCWXSpeechSynthesis;
    procedure ConfigureClick(Sender: TObject);
    procedure SpeakClick(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Pause(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Resume(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Start(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1End(Sender: TObject);
    procedure PauseClick(Sender: TObject);
    procedure ResumeClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.SpeakClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Speak(Memo1.Lines.Text);
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

procedure TDemo.ConfigureClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.ConfigureVoices;
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1End(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.isSpeaking then
    Statusbar1.SimpleText := 'Speaking...'
  else
    Statusbar1.SimpleText := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Pause(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.isSpeaking then
    Statusbar1.SimpleText := 'Speaking...'
  else
    Statusbar1.SimpleText := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Resume(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.isSpeaking then
    Statusbar1.SimpleText  := 'Speaking...'
  else
    Statusbar1.SimpleText  := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Start(Sender: TObject);
begin
  if TMSFNCWXSpeechSynthesis1.isSpeaking then
    Statusbar1.SimpleText := 'Speaking...'
  else
    Statusbar1.SimpleText := '';
end;

end.
