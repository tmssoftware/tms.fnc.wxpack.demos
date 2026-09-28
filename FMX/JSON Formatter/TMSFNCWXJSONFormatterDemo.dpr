program TMSFNCWXJSONFormatterDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  uDemo in 'uDemo.pas' {Demo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemo, Demo);
  Application.Run;
end.
