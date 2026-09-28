program TMSFNCWXVideoPlayerDemo;

uses
  Vcl.Forms,
  WEBLib.Forms,
  uDemo in 'uDemo.pas' {Demo: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDemo, Demo);
  Application.Run;
end.
