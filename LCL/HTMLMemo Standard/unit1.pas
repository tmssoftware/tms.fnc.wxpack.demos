unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LCLTMSFNCWXHTMLMemo, LCLTMSFNCUtils;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnOpen: TButton;
    btnSave: TButton;
    Panel1: TPanel;
    TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo;
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnOpenClick(Sender: TObject);
var
  fn: string;
begin
  if TTMSFNCUtils.SelectFile(fn, '', 'HTML files|*.html|Text files|*.txt') then
    TMSFNCWXHTMLMemo1.HTML.LoadFromFile(fn);
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var
  fn: string;
begin
  fn := 'TMSFNCWXHTMLMemoDemo.html';
  if TTMSFNCUtils.SaveFile(fn) then
    TMSFNCWXHTMLMemo1.HTML.SaveToFile(fn);
end;

end.

