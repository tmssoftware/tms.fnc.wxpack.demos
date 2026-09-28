program FNCWXHTMLVideoPlayerDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmVideoPlayer in 'frmVideoPlayer.pas' {Demo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemo, Demo);
  Application.Run;
end.
