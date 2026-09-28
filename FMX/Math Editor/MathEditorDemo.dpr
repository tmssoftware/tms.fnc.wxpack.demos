program MathEditorDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmEditor in 'frmEditor.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
