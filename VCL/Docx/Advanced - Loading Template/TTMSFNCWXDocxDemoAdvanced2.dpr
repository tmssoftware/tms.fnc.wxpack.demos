program TTMSFNCWXDocxDemoAdvanced2;

uses
  Vcl.Forms,
  frmLoadTemplate in 'frmLoadTemplate.pas' {TFrmLoadTemplate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TTFrmLoadTemplate, TFrmLoadTemplate);
  Application.Run;
end.
