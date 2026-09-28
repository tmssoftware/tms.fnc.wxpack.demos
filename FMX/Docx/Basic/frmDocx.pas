unit frmDocx;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TMSFNCTypes, FMX.TMSFNCUtils,
  FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes, FMX.TMSFNCCustomControl,
  FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCCustomWEBComponent, FMX.TMSFNCWXDocX, FMX.TMSFNCWXDocx.Models,
  FMX.TMSFNCCustomComponent, FMX.TMSFNCBitmapContainer, System.IOUtils,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.TabControl;

type
  TForm4 = class(TForm)
    BasicDocx: TButton;
    IntermediateDocx: TButton;
    AdvancedDocx: TButton;
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    Multi: TButton;
    TabControl1: TTabControl;
    Basic: TTabItem;
    Intermediate: TTabItem;
    Advanced: TTabItem;
    Multiple: TTabItem;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    procedure BasicDocxClick(Sender: TObject);
    procedure IntermediateDocxClick(Sender: TObject);
    procedure AdvancedDocxClick(Sender: TObject);
    procedure TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
    procedure MultiClick(Sender: TObject);
    procedure GenerateIntermediateDocument(FileName, Title: string);
    procedure FormCreate(Sender: TObject);
  private
    FMulti: Boolean;
    pth: String;
  public
    { Public declarations }
  end;

  Open = class(TTMSFNCWXDocx);

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.BasicDocxClick(Sender: TObject);
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
  text.Font.Color := gcRed;
  text.Font.Size := 50;
  Text.Font.Name := 'arial';

  TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(pth,'BasicDemo.docx'));
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
 {$IFDEF ANDROID}
 pth := TPath.GetSharedDocumentsPath;
 {$ELSE}
 pth := TPath.GetDocumentsPath;
 {$ENDIF}
 end;

procedure TForm4.GenerateIntermediateDocument(FileName, Title: String);
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

procedure TForm4.IntermediateDocxClick(Sender: TObject);
begin
  FMulti := false;
  GenerateIntermediateDocument(TPath.Combine(pth,'intermediateDocx.Docx'), 'mydoc');
end;

procedure TForm4.MultiClick(Sender: TObject);
var
  i: Integer;
begin
  FMulti := true;
  for I := 0 to 9 do
  begin
    GenerateIntermediateDocument(TPath.Combine(pth,'intermediateDocx' + IntToStr(i) + '.Docx'), 'mydoc');
  end;

  TTMSFNCUtils.Message('Documents have been created in ' + pth);

  {$IFNDEF ANDROID}
  TTMSFNCUtils.OpenURL(pth);
  {$ENDIF}
end;

procedure TForm4.TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
begin
  if not FMulti then
    TTMSFNCUtils.OpenFile(FileName);
end;

procedure TForm4.AdvancedDocxClick(Sender: TObject);
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
    tableRow.TableHeader := true;
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
  paragraph.AddImage(TMSFNCBitmapContainer1.Bitmaps[0],500,500);

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

  TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(pth,'AdvancedDocx.docx'));
end;

end.
