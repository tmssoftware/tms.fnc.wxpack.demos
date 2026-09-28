unit uDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.Memo.Types, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Memo, FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser,
  FMX.TMSFNCCustomWEBControl, FMX.TMSFNCWXJSONFormatter, FMX.TMSFNCWXHTMLMemo,
  FMX.ListBox;

type
  TDemo = class(TForm)
    FormatJSON: TButton;
    ThemeSelect: TComboBox;
    TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter;
    StatusBar1: TStatusBar;
    ErrorLabel: TLabel;
    Panel1: TPanel;
    LoadLocal: TButton;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Splitter1: TSplitter;
    procedure FormatJSONClick(Sender: TObject);
    procedure ThemeSelectChange(Sender: TObject);
    procedure LoadLocalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.fmx}


procedure TDemo.FormatJSONClick(Sender: TObject);
begin
  try
    TMSFNCWXJSONFormatter1.JSON.Text := Memo1.Text;
    ErrorLabel.Text := '';
  except
    on Exception do
       ErrorLabel.Text := 'Error parsing this JSON';
  end;

end;

procedure TDemo.ThemeSelectChange(Sender: TObject);
begin
  if ThemeSelect.Items[ThemeSelect.ItemIndex] = 'Light' then
    TMSFNCWXJSONFormatter1.Theme := ftLight
  else if ThemeSelect.Items[ThemeSelect.ItemIndex] = 'Dark' then
    TMSFNCWXJSONFormatter1.Theme := ftDark
  else if ThemeSelect.Items[ThemeSelect.ItemIndex] = 'Custom' then
    TMSFNCWXJSONFormatter1.Theme := ftCustom ;
end;

procedure TDemo.LoadLocalClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

end.
