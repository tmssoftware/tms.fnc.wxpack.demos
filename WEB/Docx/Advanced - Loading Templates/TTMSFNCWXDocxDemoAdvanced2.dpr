program TTMSFNCWXDocxDemoAdvanced2;

uses
  Vcl.Forms,
  WEBLib.Forms,
  frmLoadTemplate in 'frmLoadTemplate.pas' {Form1: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
