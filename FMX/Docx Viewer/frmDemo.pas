unit frmDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXDocxViewer, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.TMSFNCWXPDFViewer;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    LoadFileButton: TButton;
    PrevPageButton: TButton;
    NextPageButton: TButton;
    pageIndexLabel: TLabel;
    pageCountLabel: TLabel;
    TMSFNCWXDocxViewer1: TTMSFNCWXDocxViewer;
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

{$R *.fmx}

procedure TForm2.LoadFileButtonClick(Sender: TObject);
begin
  With TOpenDialog.Create(Self) Do
  Try
    InitialDir := TTMSFNCUtils.GetDocumentsPath;
    Filter := 'Documents(*.docx)|*.docx';
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
  pageCountLabel.Text :='Total Pages: ' + PageCount.ToString ;
end;

procedure TForm2.TMSFNCWXDocxViewer1PageChange(Sender: TObject;
  ActivePage: Integer);
begin
  pageIndexLabel.Text :='ActivePage: ' + (ActivePage + 1).ToString;
end;

end.
