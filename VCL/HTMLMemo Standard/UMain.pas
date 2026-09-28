unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXHTMLMemo, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo;
    btnOpen: TButton;
    btnSave: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.btnOpenClick(Sender: TObject);
var
  fn: string;
begin
  if TTMSFNCUtils.SelectFile(fn, '', 'HTML files|*.html|Text files|*.txt') then
    TMSFNCWXHTMLMemo1.HTML.LoadFromFile(fn);
end;

procedure TForm3.btnSaveClick(Sender: TObject);
var
  fn: string;
begin
  fn := 'TMSFNCWXHTMLMemoDemo.html';
  if TTMSFNCUtils.SaveFile(fn) then
    TMSFNCWXHTMLMemo1.HTML.SaveToFile(fn);
end;

end.
