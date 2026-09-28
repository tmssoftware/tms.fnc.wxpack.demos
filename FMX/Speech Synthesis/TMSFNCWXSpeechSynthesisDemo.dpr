program TMSFNCWXSpeechSynthesisDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  UDemo in 'UDemo.pas' {Demo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemo, Demo);
  Application.Run;
end.
