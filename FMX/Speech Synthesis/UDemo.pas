unit UDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TMSFNCCustomControl,
  FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl, FMX.TMSFNCWXSpeechSynthesis,
  FMX.ListBox, FMX.Edit, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.TMSFNCCustomWEBComponent, FMX.Layouts;

type
  TDemo = class(TForm)
    Speak: TButton;
    pause: TButton;
    resume: TButton;
    Cancel: TButton;
    Memo1: TMemo;
    TMSFNCWXSpeechSynthesis1: TTMSFNCWXSpeechSynthesis;
    Configure: TButton;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    procedure SpeakClick(Sender: TObject);
    procedure pauseClick(Sender: TObject);
    procedure resumeClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Speak(Sender: TObject;
      IsSpeaking: Boolean);
    procedure ConfigureClick(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Pause(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Resume(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1Start(Sender: TObject);
    procedure TMSFNCWXSpeechSynthesis1End(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}

procedure TDemo.SpeakClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Speak(Memo1.Lines.Text);
end;

procedure TDemo.ConfigureClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.ConfigureVoices;
end;

procedure TDemo.CancelClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Cancel;
end;

procedure TDemo.pauseClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Pause;
end;

procedure TDemo.resumeClick(Sender: TObject);
begin
  TMSFNCWXSpeechSynthesis1.Resume;
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1End(Sender: TObject);
begin
  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    Label1.Text :='Speaking...'
  else
    Label1.Text := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Pause(Sender: TObject);
begin
  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    Label1.Text :='Speaking...'
  else
    Label1.Text := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Resume(Sender: TObject);
begin
 if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    Label1.Text :='Speaking...'
  else
    Label1.Text := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Speak(Sender: TObject;
  IsSpeaking: Boolean);
begin
  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    Label1.Text :='Speaking...'
  else
    Label1.Text := '';
end;

procedure TDemo.TMSFNCWXSpeechSynthesis1Start(Sender: TObject);
begin
  if (TMSFNCWXSpeechSynthesis1.IsSpeaking) then
    Label1.Text :='Speaking...'
  else
    Label1.Text := '';
end;

end.
