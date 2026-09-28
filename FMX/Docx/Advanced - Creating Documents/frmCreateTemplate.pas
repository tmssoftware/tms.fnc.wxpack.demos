unit frmCreateTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TMSFNCCustomControl,
  FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCCustomWEBComponent, FMX.TMSFNCWXDocX, FMX.TMSFNCWXDocx.Models,
  FMX.Ani, FMX.Edit, system.IOUtils;

type
  TForm2 = class(TForm)
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    Preview: TButton;
    Label1: TLabel;
    CompanyEdit: TEdit;
    Label2: TLabel;
    AdressEdit: TEdit;
    Label3: TLabel;
    PhoneNumberEdit: TEdit;
    Label4: TLabel;
    EmailEdit: TEdit;
    ExportJSON: TButton;
    OpenDialog1: TOpenDialog;
    ImageControl1: TImageControl;
    LoadIcon: TButton;
    procedure PreviewClick(Sender: TObject);
    procedure TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
    procedure ConstructDocument;
    procedure ExportJSONClick(Sender: TObject);
    procedure LoadIconClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    pth: String;
  public
    { Public declarations }
  end;

  Open = class(TTMSFNCWXDocx);
var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.PreviewClick(Sender: TObject);
begin
  ConstructDocument;
  TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(pth, 'preview.docx'));
end;

procedure TForm2.ConstructDocument;
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
  i.Bitmap.Assign(ImageControl1.Bitmap);
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
  Paragraph.AddText(PhoneNumberEdit.Text);
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

procedure TForm2.ExportJSONClick(Sender: TObject);
var
  ss: TStringStream;
begin
  ConstructDocument;

  ss := TStringStream.Create(TMSFNCWXDocx1.Document.ToJSON);
  try
    ss.SaveToFile(TPath.Combine(pth,'Template.JSON'));
  finally
    ss.Free;
  end;

  TTMSFNCUtils.Message('Template has been created at ' + pth);

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  {$IFDEF ANDROID}
  pth := TPath.GetSharedDocumentsPath;
  {$ELSE}
  pth := TPath.GetDocumentsPath;
  {$ENDIF}
end;

procedure TForm2.LoadIconClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.Files.Count > 0 then
      ImageControl1.LoadFromFile(OpenDialog1.Files[0]);
  end;
end;

procedure TForm2.TMSFNCWXDocx1DownloadFile(Sender: TObject; FileName: string);
begin
  TTMSFNCUtils.OpenFile(FileName);
end;

end.
