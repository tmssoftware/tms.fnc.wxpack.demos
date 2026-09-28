program Demo;

uses
  Vcl.Forms,
  WEBLib.Forms,
  UBL in '..\..\Shared Code\Business Logic\HTMLMemo Advanced\UBL.pas',
  UDemo in '..\..\Shared Code\Form Unit\HTMLMemo Advanced\UDemo.pas' {Form1: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
