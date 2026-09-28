unit uDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXJSONFormatter, WEBLib.ExtCtrls,
  WEBLib.WebCtrls;

type
  TDemo = class(TWebForm)
    TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter;
    input: TWebMemo;
    format: TWebButton;
    Theme: TWebComboBox;
    WebPanel1: TWebPanel;
    WebPanel2: TWebPanel;
    WebSplitter1: TWebSplitter;
    WebFilePicker1: TWebFilePicker;
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    procedure ThemeChange(Sender: TObject);
    procedure formatClick(Sender: TObject);
    procedure WebFilePicker1Change(Sender: TObject);
    procedure WebFilePicker1GetFileAsDataURL(Sender: TObject;
      AFileIndex: Integer; AURL: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.formatClick(Sender: TObject);
begin
  TMSFNCWXJSONFormatter1.JSON.Text := input.text;
end;

procedure TDemo.ThemeChange(Sender: TObject);
begin
  case theme.Items[theme.itemIndex] of
     'Light': TMSFNCWXJSONFormatter1.Theme := ftLight;
     'Dark': TMSFNCWXJSONFOrmatter1.Theme := ftDark;
     'Custom': TMSFNCWXJSONFormatter1.Theme := ftCustom;
  end;
end;

procedure TDemo.WebFilePicker1Change(Sender: TObject);
begin
 WebFilePicker1.Files[0].GetFileAsDataURL;
end;

procedure TDemo.WebFilePicker1GetFileAsDataURL(Sender: TObject;
  AFileIndex: Integer; AURL: string);
begin
  input.Lines.loadFromFileAsync(AURL);
end;

end.
