unit uDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXJSONFormatter, Vcl.ExtCtrls;

type
  TDemo = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    ShowJSON: TButton;
    ThemeSelect: TComboBox;
    LoadJSON: TButton;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Splitter1: TSplitter;
    TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter;
    procedure ShowJSONClick(Sender: TObject);
    procedure ThemeSelectChange(Sender: TObject);
    procedure LoadJSONClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.ShowJSONClick(Sender: TObject);
begin
  TMSFNCWXJSONFormatter1.JSON.Text := Memo1.Text
end;

procedure TDemo.LoadJSONClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    TMSFNCWXJSONFormatter1.JSON.Text := Memo1.Text
  end;
end;

procedure TDemo.ThemeSelectChange(Sender: TObject);
begin
  if ThemeSelect.Text ='Dark' then
    TMSFNCWXJSONFOrmatter1.Theme := ftDark
  else if ThemeSelect.Text ='Light' then
    TMSFNCWXJSONFOrmatter1.Theme := ftLight
  else if ThemeSelect.Text ='Custom' then
    TMSFNCWXJSONFOrmatter1.Theme := ftCustom
end;

end.
