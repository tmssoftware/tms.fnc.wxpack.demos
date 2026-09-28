program TTMSFNCWXDocxDemoAdvanced1;

uses
  Vcl.Forms,
  frmCreateTemplate in 'frmCreateTemplate.pas' {CreateTemplate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCreateTemplate, CreateTemplate);
  Application.Run;
end.
