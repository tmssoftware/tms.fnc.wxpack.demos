program DocxViewerDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmDemo in 'frmDemo.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
