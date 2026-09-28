unit frmDocx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXDocX, Vcl.StdCtrls, VCL.TMSFNCWXDocx.Models,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCBitmapContainer, Vcl.ComCtrls, system.IOUtils;

type
  TForm3 = class(TForm)
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    Basic: TButton;
    Intermediate: TButton;
    Advanced: TButton;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    MultiDoc: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    procedure BasicClick(Sender: TObject);
    procedure IntermediateClick(Sender: TObject);
    procedure AdvancedClick(Sender: TObject);
    procedure TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
    Procedure GenerateIntermediateDocument(FileName, Title: String);
    procedure MultiDocClick(Sender: TObject);
  private
    FMulti: Boolean;
  end;

  Open = class(TTMSFNCWXDocx);
var
  Form3: TForm3;

implementation

uses
  ShellAPI;

{$R *.dfm}

procedure TForm3.BasicClick(Sender: TObject);
var
  section: TTMSFNCWXDocxSection;
  paragraph:  TTMSFNCWXDocxParagraph;
  text: TTMSFNCWXDocxText;
begin
  FMulti := false;
  TMSFNCWXDocx1.Document.Sections.Clear;
  section := TMSFNCWXDocx1.Document.AddSection;
  paragraph := section.AddParagraph;
  text := paragraph.AddText('Hello world');
  text.Font.Color := clRed;

  TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(TPath.GetDocumentsPath, 'BasicDocx.docx'));
end;


procedure TForm3.GenerateIntermediateDocument(FileName, Title: String);
var
  section: TTMSFNCWXDocxSection;
  paragraph:  TTMSFNCWXDocxParagraph;
  table: TTMSFNCWXDocxTable;
  tableCell: TTMSFNCWXDocxTableCell;
  TableRow: TTMSFNCWXDocxTableRow;
  i, j: Integer;
begin
  TMSFNCWXDocx1.Document.Sections.Clear;
  section := TMSFNCWXDocx1.Document.AddSection;
  section.Page.Orientation := poLandscape;
  paragraph := section.AddParagraph;
  paragraph.Heading := hlTitle;
  paragraph.AddText(Title);
  paragraph.Alignment := taCenter;
  section := TMSFNCWXDocx1.Document.AddSection;
  paragraph := section.AddParagraph;
  paragraph.AddText('Hello World - table');
  paragraph.Heading := hlHeading1;
  paragraph.Alignment := taCenter;
  table := section.AddTable;

  for i := 0 to 3 do
  begin
    tableRow := Table.AddRow;
    for j := 0 to 3 do
    begin
      tableCell := tableRow.AddCell;
      paragraph := TableCell.AddParagraph;
      paragraph.AddText('row ' + IntToStr(i) + ' cell ' + IntToStr(j));
    end;
  end;

  section := TMSFNCWXDocx1.Document.AddSection;
  paragraph := section.AddParagraph;
  paragraph.Heading := hlHeading2;
  paragraph.Alignment := taRight;
  paragraph.AddText('image');
  paragraph.AddImage(TMSFNCBitmapContainer1.Bitmaps[0],500,500);
  TMSFNCWXDocx1.GetDocxAsFile(fileName);
end;

procedure TForm3.IntermediateClick(Sender: TObject);
begin
  FMulti := false;
  GenerateIntermediateDocument(TPath.Combine(TPath.GetDocumentsPath,'intermediateDocx.Docx'), 'My Document');
end;

procedure TForm3.MultiDocClick(Sender: TObject);
var
  i: Integer;
begin
  FMulti := true;
  for I := 0 to 9 do
  begin
    GenerateIntermediateDocument(TPath.Combine(TPath.GetDocumentsPath,'intermediateDocx' + IntToStr(i) + '.Docx'), 'My Document' + IntToStr(i));
  end;

  TTMSFNCUtils.OpenURL(GetCurrentDir);
end;

procedure TForm3.AdvancedClick(Sender: TObject);
var
  section: TTMSFNCWXDocxSection;
  paragraph:  TTMSFNCWXDocxParagraph;
  text: TTMSFNCWXDocxText;
  table: TTMSFNCWXDocxTable;
  tableCell: TTMSFNCWXDocxTableCell;
  TableRow: TTMSFNCWXDocxTableRow;
  i, j: Integer;
  toc: TTMSFNCWXDocxTableOfContents;
  internalHyperlink: TTMSFNCWXDocxInternalHyperLink;
  externalHyperlink: TTMSFNCWXDocxExternalHyperlink;
begin
  FMulti := false;
  TMSFNCWXDocx1.Document.Features.UpdateFields := false;
  TMSFNCWXDocx1.Document.Sections.Clear;
  section := TMSFNCWXDocx1.Document.AddSection;
  section.Page.Orientation := poLandscape;
  paragraph := section.AddParagraph;
  paragraph.Heading := hlTitle;
  paragraph.Alignment := taCenter;
  paragraph.AddBookmark('titleBookMark', 'Demo: a Docx.js Story');
  section := TMSFNCWXDocx1.Document.AddSection;
  toc := section.AddTableOfContents;
  toc.Hyperlink := true;
  section := TMSFNCWXDocx1.Document.AddSection;
  paragraph := section.AddParagraph;
  paragraph.AddText('Hello World - table');
  paragraph.Heading := hlHeading1;
  paragraph.Alignment := taCenter;
  table := section.AddTable;

  for i := 0 to 3 do
  begin
    tableRow := Table.AddRow;
    for j := 0 to 3 do
    begin
      tableCell := tableRow.AddCell;
      paragraph := TableCell.AddParagraph;
      text := paragraph.AddText;
      text.Text := 'row ' + IntToStr(i) + ' cell ' + IntToStr(j);
    end;
  end;

  paragraph := section.Footers.DefaultFooter.AddParagraph;
  paragraph.AddPageNumber;
  paragraph := section.AddParagraph;
  paragraph.Heading := hlHeading2;
  paragraph.Alignment := taRight;
  paragraph.AddText('image');
  paragraph := section.AddParagraph;
  paragraph.AddImage(TMSFNCBitmapContainer1.Bitmaps[0],500,500);

  paragraph := section.AddParagraph;
  paragraph.Heading := hlHeading2;
  paragraph.Alignment := taRight;
  paragraph.AddText('Some random text');
  paragraph := section.AddParagraph;
  paragraph.Alignment := taLeft;
  paragraph.AddText('lorem ipsum and something else.');
  text.Font.Color := gcAquamarine;
  paragraph.AddText('lorem ipsum and something else.');
  text.Font.Style := [TFontStyle.fsUnderline];
  text.Underline.UnderlineType := utDouble;
  paragraph.AddText('lorem ipsum and something else.');
  paragraph.AddText('lorem ipsum and something else.');
  paragraph.AddBreak;
  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 0;
  text := paragraph.AddText;
  text.Text := 'bullet point level 0';
  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 1;
  text := paragraph.AddText;
  text.Text := 'bullet point level 1';
  text.Font.Color := clRed;
  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 2;
  text := paragraph.AddText;
  text.Text := 'bullet point level 2';
  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 3;
  text := paragraph.AddText;
  text.Text := 'bullet point level 3';

  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 0;
  internalHyperlink := paragraph.AddInternalHyperlink;
  internalHyperlink.Anchor := 'titleBookmark';
  text := internalHyperlink.AddText;
  text.Text := 'link to title';

  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 0;
  externalHyperlink := paragraph.AddExternalHyperlink;
  externalHyperlink.Link := 'https://www.tmssoftware.com';
  text := externalHyperlink.AddText;
  text.Text := 'link to tmssoftware page';

  TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(TPath.GetDocumentsPath,'AdvancedDocx.docx'));
end;

procedure TForm3.TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
begin
  if not FMulti then
    TTMSFNCUtils.OpenFile(FileName);
end;

end.
