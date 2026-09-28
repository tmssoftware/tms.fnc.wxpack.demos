unit UMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXHTMLMemo,
  Vcl.Controls, WEBLib.ExtCtrls, WEBLib.Buttons;

type
  TForm1 = class(TWebForm)
    WebPanel1: TWebPanel;
    TMSFNCWXHTMLMemo1: TTMSFNCWXHTMLMemo;
    WebBitBtn1: TWebBitBtn;
    WebBitBtn2: TWebBitBtn;
    WebOpenDialog1: TWebOpenDialog;
    [async]
    procedure WebBitBtn1Click(Sender: TObject);
    procedure WebBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WebBitBtn1Click(Sender: TObject);
var
  res: boolean;
  text: string;
begin
  res := await(Boolean, WebOpenDialog1.Perform);
  if res then
  begin
    text := await(string, WebOpenDialog1.Files[0].FileAsText);
    TMSFNCWXHTMLMemo1.HTML.Text := text;
  end;
end;

procedure TForm1.WebBitBtn2Click(Sender: TObject);
var
  fn: string;
begin
  fn := 'HTMLMemoDemo.html';
  if TTMSFNCUtils.SaveFile(fn) then
  begin
    TMSFNCWXHTMLMemo1.HTML.SaveToFile(fn);
  end;
end;

end.