unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXHTMLMemo, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo;

type
  TFrmMain = class(TForm)
    TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo;
    Panel1: TPanel;
    btnOpen: TButton;
    btnSave: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}

procedure TFrmMain.btnOpenClick(Sender: TObject);
var
  fn: string;
begin
  if TTMSFNCUtils.SelectFile(fn, '', 'HTML files|*.html|Text files|*.txt') then
    TMSFNCWXHTMLMemo1.HTML.LoadFromFile(fn);
end;

procedure TFrmMain.btnSaveClick(Sender: TObject);
var
  fn: string;
begin
  fn := 'TMSFNCWXHTMLMemoDemo.html';
  if TTMSFNCUtils.SaveFile(fn) then
    TMSFNCWXHTMLMemo1.HTML.SaveToFile(fn);
end;

end.
