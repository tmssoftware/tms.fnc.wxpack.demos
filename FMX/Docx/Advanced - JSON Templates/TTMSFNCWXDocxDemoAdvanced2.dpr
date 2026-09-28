program TTMSFNCWXDocxDemoAdvanced2;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTemplate in 'frmTemplate.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
