program Demo;



uses
  System.StartUpCopy,
  FMX.Forms,
  UBL in '..\..\Shared Code\Business Logic\HTMLMemo Advanced\UBL.pas',
  UDemo in '..\..\Shared Code\Form Unit\HTMLMemo Advanced\UDemo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
