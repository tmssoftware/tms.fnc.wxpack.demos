unit frmCreateTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VCL.TMSFNCTypes,
  VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCWXDocx.Models, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXDocX,
  Vcl.ExtDlgs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, system.IOUtils;

type
  TCreateTemplate = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CompanyEdit: TEdit;
    Label4: TLabel;
    AdressEdit: TEdit;
    PhoneEdit: TEdit;
    EmailEdit: TEdit;
    Image1: TImage;
    Export: TButton;
    Preview: TButton;
    LoadIcon: TButton;
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    OpenDialog1: TOpenDialog;
    procedure TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
    procedure ConstructDocument;
    procedure PreviewClick(Sender: TObject);
    procedure LoadIconClick(Sender: TObject);
    procedure ExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CreateTemplate: TCreateTemplate;

implementation

{$R *.dfm}

procedure TCreateTemplate.ConstructDocument;
var
  Section: TTMSFNCWXDocxSection;
  Paragraph: TTMSFNCWXDocxParagraph;
  Text: TTMSFNCWXDocxText;
  Table: TTMSFNCWXDocxTable;
  Row: TTMSFNCWXDocxTableRow;
  Cell: TTMSFNCWXDocxTableCell;
  i: TTMSFNCWXDocxImage;
begin
  TMSFNCWXDocx1.Document.Features.UpdateFields := false;
  Section := TMSFNCWXDocx1.Document.AddSection;
  Paragraph := Section.AddParagraph;
  Paragraph.Heading := hlHeading1;
  Paragraph.Alignment := taLeft;
  Paragraph.AddText('Invoice');
  Paragraph := Section.AddParagraph;
  i := Paragraph.AddImage;
  i.Bitmap.Assign(Image1.Picture);
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

procedure TCreateTemplate.ExportClick(Sender: TObject);
var
  ss: TStringStream;
begin
  ConstructDocument;

  ss := TStringStream.Create(TMSFNCWXDocx1.Document.ToJSON);
  try
    ss.SaveToFile(TPath.Combine(TPath.GetDocumentsPath,'Template.JSON'));
  finally
    ss.Free;
  end;

  TTMSFNCUtils.Message('Template has been saved to ' + TPath.GetDocumentsPath);
end;

procedure TCreateTemplate.LoadIconClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.Files.Count > 0 then
      Image1.Picture.LoadFromFile(OpenDialog1.Files[0]);
  end;
end;

procedure TCreateTemplate.PreviewClick(Sender: TObject);
begin
   ConstructDocument;
  TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(TPath.GetDocumentsPath,'preview.docx'));
end;

procedure TCreateTemplate.TMSFNCWXDocx1DownloadFile(Sender: TObject;
  FileName: string);
begin
  TTMSFNCUtils.OpenFile(FileName);
end;

end.
