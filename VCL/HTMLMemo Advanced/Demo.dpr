program Demo;

uses
  Vcl.Forms,
  UDemo in '..\..\Shared Code\Form Unit\HTMLMemo Advanced\UDemo.pas' {Form1},
  UBL in '..\..\Shared Code\Business Logic\HTMLMemo Advanced\UBL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
