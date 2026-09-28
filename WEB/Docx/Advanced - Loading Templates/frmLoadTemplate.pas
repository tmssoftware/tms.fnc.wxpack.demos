unit frmLoadTemplate;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCWXDocx.Models,
  Vcl.Controls, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXDocX,
  Data.DB, WEBLib.CDS, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.DB;

type
  TForm1 = class(TWebForm)
    WebButton1: TWebButton;
    WebButton2: TWebButton;
    Customers: TWebClientDataSet;
    Orders: TWebClientDataSet;
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    CustomerConnection: TWebClientConnection;
    CustomerDataSource: TWebDataSource;
    OrderDataSource: TWebDataSource;
    OrderConnection: TWebClientConnection;
    WebOpenDialog1: TWebOpenDialog;
    procedure WebFormCreate(Sender: TObject);
    procedure WebButton1Click(Sender: TObject);
    procedure WebButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WebButton1Click(Sender: TObject);
var
  id: Integer;
  t: TTMSFNCWXDocxTable;
  tr: TTMSFNCWXDocxTableRow;
  tc: TTMSFNCWXDocxTableCell;
  p: TTMSFNCWXDocxParagraph;
  toPay: Double;
begin
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

    Orders.Filtered := False;
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

    if toPay > 0 then
      TMSFNCWXDocx1.GetDocxAsFile('Invoice' + IntToStr(id) + '.docx');
    Customers.Next;
  end;

end;

procedure TForm1.WebButton2Click(Sender: TObject);
begin
//TODO
end;

procedure TForm1.WebFormCreate(Sender: TObject);
var
  ss: TStringStream;
begin
  Orders.FieldDefs.Clear;
  Orders.FieldDefs.Add('OrderNo',ftInteger,0);
  Orders.FieldDefs.Add('ItemNo',ftInteger,0);
  Orders.FieldDefs.Add('CustNo',ftInteger,0);
  Orders.FieldDefs.Add('Description',ftString,100);
  Orders.FieldDefs.Add('ItemPrice',ftFloat,0);
  Orders.FieldDefs.Add('ItemsTotal',ftInteger,0);
  Orders.FieldDefs.Add('ItemTotalPrice',ftFloat,0);
  OrderConnection.Active := true;

  Customers.FieldDefs.Clear;
  Customers.FieldDefs.Add('CustNo', ftInteger, 0);
  Customers.FieldDefs.Add('Company', ftString, 150);
  Customers.FieldDefs.Add('Addr1', ftString, 200);
  Customers.FieldDefs.Add('Addr2', ftString, 200);
  Customers.FieldDefs.Add('City', ftString, 200);
  Customers.FieldDefs.Add('State', ftString, 200);
  Customers.FieldDefs.Add('Zip', ftString, 200);
  Customers.FieldDefs.Add('Country', ftString, 200);
  Customers.FieldDefs.Add('Phone', ftString, 200);
  Customers.FieldDefs.Add('FAX', ftString, 200);
  Customers.FieldDefs.Add('TaxRate', ftString, 200);
  Customers.FieldDefs.Add('Contact', ftString, 200);
  Customers.FieldDefs.Add('LastInvoiceDate', ftString, 200);
  CustomerConnection.Active := true;

  ss := TStringStream.Create;
  ss.LoadFromFile('Template.JSON');

  TMSFNCWXDocx1.Document.LoadFromJSONStream(ss);
end;

end.