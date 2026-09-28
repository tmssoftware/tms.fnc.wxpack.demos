unit frmDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  VCL.Controls, VCL.Forms, JS, Web, WEBLib.Graphics, WEBLib.Forms, VCL.Graphics, VCL.Dialogs,
  WEBLib.TMSFNCTypes, WEBLib.TMSFNCUtils, WEBLib.TMSFNCGraphics, WEBLib.TMSFNCGraphicsTypes,
  WEBLib.TMSFNCCustomControl, WEBLib.TMSFNCWebBrowser, WEBLib.TMSFNCCustomWEBControl,
  WEBLib.TMSFNCWXDocxViewer, VCL.StdCtrls, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, WEBLib.WebCtrls, WEBLib.StdCtrls,
  WEBLib.Controls, WEBLib.ExtCtrls, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXDocxViewer;

type
  TForm2 = class(TWebForm)
    TMSFNCWXDocxViewer1: TTMSFNCWXDocxViewer;
    Panel1: TWebPanel;
    PrevPageButton: TWebButton;
    NextPageButton: TWebButton;
    pageIndexLabel: TWebLabel;
    pageCountLabel: TWebLabel;
    WebFilePicker1: TWebFilePicker;
    procedure PrevPageButtonClick(Sender: TObject);
    procedure NextPageButtonClick(Sender: TObject);
    procedure TMSFNCWXDocxViewer1PageChange(Sender: TObject;
      ActivePage: Integer);
    procedure TMSFNCWXDocxViewer1DocumentRendered(Sender: TObject;
      PageCount: Integer);
    procedure WebFilePicker1Change(Sender: TObject);
    procedure WebFilePicker1GetFileAsBase64(Sender: TObject;
      AFileIndex: Integer; ABase64: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TWebForm2;

implementation

{$R *.dfm}

procedure TWebForm2.NextPageButtonClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.NextPage;
end;

procedure TWebForm2.PrevPageButtonClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.PreviousPage;
end;

procedure TWebForm2.TMSFNCWXDocxViewer1DocumentRendered(Sender: TObject;
  PageCount: Integer);
begin
  pageCountLabel.Caption :='Total Pages: ' + PageCount.ToString ;
end;

procedure TWebForm2.TMSFNCWXDocxViewer1PageChange(Sender: TObject;
  ActivePage: Integer);
begin
  pageIndexLabel.Caption :='ActivePage: ' + (ActivePage + 1).ToString;
end;

procedure TForm2.WebFilePicker1Change(Sender: TObject);
begin
  WebFilePicker1.Files[0].GetFileAsBase64;
end;

procedure TForm2.WebFilePicker1GetFileAsBase64(Sender: TObject;
  AFileIndex: Integer; ABase64: string);
begin
   TMSFNCWXDocxViewer1.LoadFromBase64(ABase64);
end;

end.
