program TTMSFNCWXDocxDemoAdvanced1;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  frmCreateTemplate in 'frmCreateTemplate.pas' {Form1: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
