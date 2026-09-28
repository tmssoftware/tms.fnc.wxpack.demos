unit frmLoadTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCWXDocx.Models,
  Vcl.StdCtrls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXDocX,
  Data.DB, Datasnap.DBClient, MidasLib, System.IOUtils;

type
  TTFrmLoadTemplate = class(TForm)
    Customers: TClientDataSet;
    Orders: TClientDataSet;
    OpenDialog1: TOpenDialog;
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    CreateInvoices: TButton;
    LoadTemplate: TButton;
    procedure CreateInvoicesClick(Sender: TObject);
    procedure LoadTemplateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TFrmLoadTemplate: TTFrmLoadTemplate;

implementation

{$R *.dfm}

procedure TTFrmLoadTemplate.CreateInvoicesClick(Sender: TObject);
var
  id: Integer;
  t: TTMSFNCWXDocxTable;
  tr: TTMSFNCWXDocxTableRow;
  tc: TTMSFNCWXDocxTableCell;
  p: TTMSFNCWXDocxParagraph;
  toPay: Double;
begin
  Customers.LoadFromFile(GetCurrentDir + '\customer.xml');
  Customers.Active := True;

  Orders.LoadFromFile(GetCurrentDir + '\orders.xml');
  Orders.Active := True;

  Customers.First;

  while not Customers.Eof do
  begin
    id := Customers.FieldByName('CustNo').AsInteger;
    AsText(TMSFNCWXDocx1.FindByID('CustNo') as TTMSFNCWXDocxChild).Text := IntToStr(id);
    AsText(TMSFNCWXDocx1.FindByID('Contact') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('Contact').AsString;
    AsText(TMSFNCWXDocx1.FindByID('Company') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('Company').AsString;
    AsText(TMSFNCWXDocx1.FindByID('Phone') as TTMSFNCWXDocxChild).Text :=Customers.FieldByName('Phone').AsString;
    AsText(TMSFNCWXDocx1.FindByID('FAX') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('FAX').AsString;
    AsText(TMSFNCWXDocx1.FindByID('Addr1') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('Addr1').AsString;
    AsText(TMSFNCWXDocx1.FindByID('Addr2') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('Addr2').AsString;
    AsText(TMSFNCWXDocx1.FindByID('Zip') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('Zip').AsString;
    AsText(TMSFNCWXDocx1.FindByID('City') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('City').AsString;
    AsText(TMSFNCWXDocx1.FindByID('Country') as TTMSFNCWXDocxChild).Text := Customers.FieldByName('Country').AsString;
    t := AsTable(TMSFNCWXDocx1.FindByID('Items') as TTMSFNCWXDocxChild);
    toPay := 0;
    orders.Filtered := False;
    Orders.Filter := 'CustNo = ' + IntToStr(id);
    Orders.Filtered := true;
    Orders.First;
    t.Rows.Clear;
    while not Orders.Eof do
    begin
      tr := t.AddRow;
      tc := tr.AddCell;
      p := tc.AddParagraph;
      p.AddText(Orders.FieldByName('ItemNo').AsString);
      tc := tr.AddCell;
      p := tc.AddParagraph;
      p.AddText(Orders.FieldByName('Description').AsString);
      tc := tr.AddCell;
      p := tc.AddParagraph;
      p.AddText(Orders.FieldByName('ItemsTotal').AsString);
      tc := tr.AddCell;
      p := tc.AddParagraph;
      p.AddText(Orders.FieldByName('ItemPrice').AsString);
      tc := tr.AddCell;
      p := tc.AddParagraph;
      p.AddText(Orders.FieldByName('ItemTotalPrice').AsString);
      toPay := toPay + Orders.FieldByName('ItemTotalPrice').AsFloat;
      Orders.Next;
    end;
    AsText(TMSFNCWXDocx1.FindByID('TotalToPay') as TTMSFNCWXDocxChild).Text := FloatToStr(toPay);
    TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(TPath.GetDocumentsPath,'Invoice' + IntToStr(id) + '.docx'));
    Customers.Next;
  end;

  TTMSFNCUtils.Message('Invoices have been saved to ' + TPath.GetDocumentsPath);
  TTMSFNCUtils.OpenURL(TPath.GetDocumentsPath);
end;

procedure TTFrmLoadTemplate.FormCreate(Sender: TObject);
begin
  TMSFNCWXDocx1.Document.LoadFromJSONFile(GetCurrentDir + '/Template.JSON');
end;

procedure TTFrmLoadTemplate.LoadTemplateClick(Sender: TObject);
begin
  OpenDialog1.InitialDir := TPath.GetDocumentsPath;
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.Files.Count > 0 then
      TMSFNCWXDocx1.Document.LoadFromJSONFile(OpenDialog1.Files[0]);
  end;
end;

end.
