program DocxBasicDemoFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmDocx in 'frmDocx.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
