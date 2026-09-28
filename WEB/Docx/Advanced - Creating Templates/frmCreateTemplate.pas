unit frmCreateTemplate;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCWXDocx.Models, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXDocX,
  WEBLib.ExtCtrls, Vcl.Imaging.pngimage, WEBLib.WebCtrls, Data.DB, WEBLib.CDS,
  WEBLib.DB;

type
  TForm1 = class(TWebForm)
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    WebLabel3: TWebLabel;
    WebLabel4: TWebLabel;
    CompanyEdit: TWebEdit;
    AdressEdit: TWebEdit;
    PhoneEdit: TWebEdit;
    EmailEdit: TWebEdit;
    WebImageControl1: TWebImageControl;
    Preview: TWebButton;
    Export: TWebButton;
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    WebFilePicker1: TWebFilePicker;
    WebLabel5: TWebLabel;
    procedure ConstructDocument;
    procedure WebFilePicker1Change(Sender: TObject);
    procedure WebFilePicker1GetFileAsDataURL(Sender: TObject;
      AFileIndex: Integer; AURL: string);
    procedure PreviewClick(Sender: TObject);
    procedure ExportClick(Sender: TObject);
    procedure TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ConstructDocument;
var
  Section: TTMSFNCWXDocxSection;
  Paragraph: TTMSFNCWXDocxParagraph;
  Text: TTMSFNCWXDocxText;
  Table: TTMSFNCWXDocxTable;
  Row: TTMSFNCWXDocxTableRow;
  Cell: TTMSFNCWXDocxTableCell;
  i: TTMSFNCWXDocxImage;
begin
  TMSFNCWXDocx1.Document.Sections.Clear;
  TMSFNCWXDocx1.Document.Features.UpdateFields := false;
  Section := TMSFNCWXDocx1.Document.AddSection;
  Paragraph := Section.AddParagraph;
  Paragraph.Heading := hlHeading1;
  Paragraph.Alignment := taLeft;
  Paragraph.AddText('Invoice');
  Paragraph := Section.AddParagraph;
  i := Paragraph.AddImage;
  i.Bitmap.Assign(WebImageControl1.Picture);
  i.Transformation.Width := 100;
  i.Transformation.Height := 100;
  i.Floating.HorizontalPosition.Relative := hpRightMargin;
  i.Floating.HorizontalPosition.Align := hpaInside;
  i.Floating.VerticalPosition.Align := vpaInside;
  i.Floating.VerticalPosition.Relative := vpTopMargin;
  i.FloatingEnabled := true;

  Paragraph.Alignment := taRight;
  Paragraph := Section.AddParagraph;
  Paragraph.AddText(CompanyEdit.Text);
  Paragraph := Section.AddParagraph;
  Paragraph.AddText(AdressEdit.Text);
  Paragraph := Section.AddParagraph;
  Paragraph.AddText(PhoneEdit.Text);
  Paragraph := Section.AddParagraph;
  Paragraph.AddText(EmailEdit.Text);
  Text := Paragraph.AddText;
  Text.LineBreak := 1;

  Paragraph := section.AddParagraph;
  Paragraph.AddText('Customer ID: ');
  Text := Paragraph.AddText('{CustNo}');
  Text.Id := 'CustNo';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Contact name: ');
  Text := Paragraph.AddText('{Contact}');
  Text.Id := 'Contact';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Company: ');
  Text := Paragraph.AddText('{Company}');
  Text.Id := 'Company';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Phone number: ');
  Text := Paragraph.AddText('{Phone}');
  Text.Id := 'Phone';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Fax: ');
  Text := Paragraph.AddText('{FAX}');
  Text.Id := 'FAX';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Address 1: ');
  Text := Paragraph.AddText('{Addr1}');
  Text.Id := 'Addr1';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Address 2: ');
  Text := Paragraph.AddText('{Addr2}');
  Text.Id := 'Addr2';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Zip: ');
  Text := Paragraph.AddText('{Zip}');
  Text.Id := 'Zip';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('City: ');
  Text := Paragraph.AddText('{City}');
  Text.Id := 'City';
  Paragraph := section.AddParagraph;
  Paragraph.AddText('Country: ');
  Text := Paragraph.AddText('{Country}');
  Text.Id := 'Country';

  Section.AddParagraph;
  Table := Section.AddTable;
  Table.Id := 'Items';
  Table.Width.WidthType := wtPercentage;
  Table.Width.Size := 100;
  Row := Table.AddRow;
  Cell := Row.AddCell;
  Paragraph := Cell.AddParagraph;
  Paragraph.AddText('No.');
  Cell := Row.AddCell;
  Paragraph := Cell.AddParagraph;
  Paragraph.AddText('Description');
  Cell := Row.AddCell;
  Paragraph := Cell.AddParagraph;
  Paragraph.AddText('Qty');
  Cell := Row.AddCell;
  Paragraph := Cell.AddParagraph;
  Paragraph.AddText('Unit Price');
  Cell := Row.AddCell;
  Paragraph := Cell.AddParagraph;
  Paragraph.AddText('Total');
  Section.AddParagraph;

  Paragraph := Section.AddParagraph;
  Paragraph.Alignment := taRight;
  Paragraph.AddText('Total to pay: ');
  Text := Paragraph.AddText;
  Text.Id := 'TotalToPay';
end;

procedure TForm1.ExportClick(Sender: TObject);
var
  ss: TStringStream;
begin
  ConstructDocument;

  ss := TStringStream.Create(TMSFNCWXDocx1.Document.ToJSON);
  try
    ss.SaveToFile('Template.JSON');
  finally
    ss.Free;
  end;
end;

procedure TForm1.PreviewClick(Sender: TObject);
begin
  ConstructDocument;
  TMSFNCWXDocx1.GetDocxAsFile('Preview.docx');
end;

procedure TForm1.TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
begin
  TTMSFNCUtils.OpenFile(FileName);
end;

procedure TForm1.WebFilePicker1Change(Sender: TObject);
begin
  WebFilePicker1.Files[0].GetFileAsDataURL;
end;

procedure TForm1.WebFilePicker1GetFileAsDataURL(Sender: TObject;
  AFileIndex: Integer; AURL: string);
begin
  WebImageControl1.URL := AURL;
end;

end.
