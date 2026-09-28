unit frmTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCWXDocx.Models, FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser,
  FMX.TMSFNCCustomWEBControl, FMX.TMSFNCCustomWEBComponent, FMX.TMSFNCWXDocX,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, Data.DB, Datasnap.DBClient, midaslib, Data.FMTBcd, Data.SqlExpr, SYstem.IOUtils;

type
  TForm4 = class(TForm)
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    LoadTemplate: TButton;
    OpenDialog1: TOpenDialog;
    CreateInvoice: TButton;
    Customers: TClientDataSet;
    Orders: TClientDataSet;
    procedure LoadTemplateClick(Sender: TObject);
    procedure CreateInvoiceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    pth: String;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

procedure TForm4.LoadTemplateClick(Sender: TObject);
begin
  OpenDialog1.InitialDir := pth;
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.Files.Count > 0 then
      TMSFNCWXDocx1.Document.LoadFromJSONFile(OpenDialog1.Files[0]);
  end;

end;

procedure TForm4.CreateInvoiceClick(Sender: TObject);
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
    TMSFNCWXDocx1.GetDocxAsFile(TPath.Combine(pth,'Invoice' + IntToStr(id) + '.docx'));
    Customers.Next;
  end;

  TTMSFNCUtils.Message('Invoices have been created in folder ' + pth);

  {$IFNDEF ANDROID}
  TTMSFNCUtils.OpenURL(pth);
  {$ENDIF}
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  {$IFDEF ANDROID}
    pth := TPath.GetSharedDocumentsPath;
  {$ELSE}
    pth := TPath.GetDocumentsPath;
  {$ENDIF}
  TMSFNCWXDocx1.Document.LoadFromJSONFile(GetCurrentDir + '/Template.JSON');
end;

end.
