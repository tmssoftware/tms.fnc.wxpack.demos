unit frmDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  VCL.Controls, VCL.Forms, VCL.Graphics, VCL.Dialogs,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXDocxViewer, VCL.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    TMSFNCWXDocxViewer1: TTMSFNCWXDocxViewer;
    Panel1: TPanel;
    LoadFileButton: TButton;
    PrevPageButton: TButton;
    NextPageButton: TButton;
    pageIndexLabel: TLabel;
    pageCountLabel: TLabel;
    procedure LoadFileButtonClick(Sender: TObject);
    procedure PrevPageButtonClick(Sender: TObject);
    procedure NextPageButtonClick(Sender: TObject);
    procedure TMSFNCWXDocxViewer1PageChange(Sender: TObject;
      ActivePage: Integer);
    procedure TMSFNCWXDocxViewer1DocumentRendered(Sender: TObject;
      PageCount: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.LoadFileButtonClick(Sender: TObject);
begin
  With TOpenDialog.Create(Self) Do
  Try
    InitialDir := TTMSFNCUtils.GetDocumentsPath;
    Filter := 'All files (*.*)|*.*';
    If Execute then
       TMSFNCWXDocxViewer1.LoadFromFile(FileName);
  Finally
    Free;
  end;
end;

procedure TForm2.NextPageButtonClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.NextPage;
end;

procedure TForm2.PrevPageButtonClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.PreviousPage;
end;

procedure TForm2.TMSFNCWXDocxViewer1DocumentRendered(Sender: TObject;
  PageCount: Integer);
begin
  pageCountLabel.Caption :='Total Pages: ' + PageCount.ToString ;
end;

procedure TForm2.TMSFNCWXDocxViewer1PageChange(Sender: TObject;
  ActivePage: Integer);
begin
  pageIndexLabel.Caption :='ActivePage: ' + (ActivePage + 1).ToString;
end;

end.
