unit frmDocx;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXDocX, VCL.TMSFNCWXDocx.Models,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCBitmapContainer, WEBLib.ComCtrls;

type
  TForm1 = class(TWebForm)
    Basic: TWebButton;
    InterMediate: TWebButton;
    Advanced: TWebButton;
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    Multi: TWebButton;
    WebPageControl1: TWebPageControl;
    WebPageControl1Sheet1: TWebTabSheet;
    WebPageControl1Sheet2: TWebTabSheet;
    WebPageControl1Sheet3: TWebTabSheet;
    WebPageControl1Sheet4: TWebTabSheet;
    WebMemo1: TWebMemo;
    WebMemo2: TWebMemo;
    WebMemo3: TWebMemo;
    WebMemo4: TWebMemo;
    procedure BasicClick(Sender: TObject);
    procedure TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
    procedure InterMediateClick(Sender: TObject);
    procedure AdvancedClick(Sender: TObject);
    Procedure GenerateIntermediateDocument(FileName, Title: String);
    procedure MultiClick(Sender: TObject);
  private
    FMulti: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  LOGO = 'data:image/png;base64,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'+
  'ABJRU5ErkJggg==';

implementation

{$R *.dfm}

procedure TForm1.AdvancedClick(Sender: TObject);
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
  s: string;
begin
  FMulti := false;
  TMSFNCWXDocx1.Document.Sections.Clear;
  section := TMSFNCWXDocx1.Document.AddSection;
  section.Page.Orientation := poLandscape;
  paragraph := section.AddParagraph;
  paragraph.Heading := hlTitle;
  paragraph.Alignment := taCenter;
  paragraph.AddBookmark('titleBookmark', 'Demo: A docx.js Story');
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
      paragraph.AddText('row ' + IntToStr(i) + ' cell ' + IntToStr(j));
    end;
  end;

  section := TMSFNCWXDocx1.Document.AddSection;
  paragraph := section.Footers.DefaultFooter.AddParagraph;
  paragraph.AddPageNumber;
  paragraph := section.AddParagraph;
  paragraph.Heading := hlHeading2;
  paragraph.Alignment := taRight;
  paragraph.AddText('Image');
  paragraph := section.AddParagraph;
  (paragraph.AddImage).Bitmap.LoadFromResource(Logo);

  paragraph := section.AddParagraph;
  paragraph.Heading := hlHeading2;
  paragraph.Alignment := taRight;
  text := paragraph.AddText('Some random text');
  paragraph := section.AddParagraph;
  paragraph.Alignment := taLeft;
  paragraph.AddText('lorem ipsum and something else.');
  text.Font.Color := gcAquamarine;
  paragraph.AddText('lorem ipsum and something else.');
  text.Font.Style := [TFontStyle.fsUnderline];
  text.Underline.UnderlineType := utDouble;
  paragraph.AddText('lorem ipsum and something else.');
  paragraph.AddText('lorem ipsum and something else.');

  section := TMSFNCWXDocx1.Document.AddSection;
  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 0;
  text := paragraph.AddText;
  text.Text := 'bullet point level 0';
  paragraph := section.AddParagraph;
  paragraph.Bullet.Level := 1;
  text := paragraph.AddText;
  text.Text := 'bullet point level 1';
  text.Font.Color := gcRed;
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

  TMSFNCWXDocx1.GetDocxAsFile('AdvancedDocx.docx');
end;

procedure TForm1.GenerateIntermediateDocument(FileName, Title: String);
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
  paragraph := section.AddParagraph;
  (paragraph.AddImage).Bitmap.LoadFromResource(Logo);
  TMSFNCWXDocx1.GetDocxAsFile(fileName);
end;

procedure TForm1.BasicClick(Sender: TObject);
var
  section: TTMSFNCWXDocxSection;
  paragraph:  TTMSFNCWXDocxParagraph;
  text: TTMSFNCWXDocxText;
begin
  TMSFNCWXDocx1.Document.Sections.Clear;
  section := TMSFNCWXDocx1.Document.AddSection;
  paragraph := section.AddParagraph;
  text := paragraph.AddText('Hello world');
  text.Font.Color := gcRed;

  TMSFNCWXDocx1.GetDocxAsFile('BasicDocx.docx');
end;

procedure TForm1.InterMediateClick(Sender: TObject);
begin
  FMulti := false;
  GenerateIntermediateDocument('intermediateDocx.Docx', 'My Document');
end;

procedure TForm1.MultiClick(Sender: TObject);
var
  i: Integer;
begin
  FMulti := true;
  for I := 0 to 9 do
  begin
    GenerateIntermediateDocument('intermediateDocx' + IntToStr(i) + '.Docx', 'My Document' + IntToStr(i));
  end;

end;

procedure TForm1.TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
begin
  if not FMulti then
    TTMSFNCUtils.OpenFile(FileName);
end;

initialization
  TTMSFNCBitmap.CreateFromResource(LOGO);

end.
