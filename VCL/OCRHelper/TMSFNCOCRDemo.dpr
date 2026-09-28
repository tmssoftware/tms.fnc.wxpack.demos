program TMSFNCOCRDemo;

uses
  Vcl.Forms,
  uDemo in 'uDemo.pas' {Demo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDemo, Demo);
  Application.Run;
end.
