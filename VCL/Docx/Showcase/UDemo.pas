unit UDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Types, System.UITypes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics,
  VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent,
  VCL.TMSFNCWXDocx, VCL.TMSFNCWXDocx.Models, VCL.TMSFNCWXDocxViewer;

type
  TForm1 = class(TForm)
    pnlLeft: TPanel;
    lblTitle: TLabel;
    lblSubTitle: TLabel;
    lblCustomer: TLabel;
    edCustomer: TEdit;
    lblNumber: TLabel;
    edNumber: TEdit;
    lblAccent: TLabel;
    cbAccent: TComboBox;
    lblItems: TLabel;
    sgItems: TStringGrid;
    chkLandscape: TCheckBox;
    chkTerms: TCheckBox;
    btnSave: TButton;
    btnOpen: TButton;
    pnlRight: TPanel;
    pnlToolbar: TPanel;
    btnPrevious: TButton;
    btnNext: TButton;
    btnZoomOut: TButton;
    btnZoomIn: TButton;
    lblPage: TLabel;
    lblStatus: TLabel;
    pnlViewer: TPanel;
    TMSFNCWXDocx1: TTMSFNCWXDocx;
    TMSFNCWXDocxViewer1: TTMSFNCWXDocxViewer;
    tmrPreview: TTimer;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure InputChange(Sender: TObject);
    procedure sgItemsSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: string);
    procedure tmrPreviewTimer(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure TMSFNCWXDocx1Initialized(Sender: TObject);
    procedure TMSFNCWXDocx1DownloadAsBase64(Sender: TObject; ABase64: string);
    procedure TMSFNCWXDocx1DownloadAsFile(Sender: TObject; FileName: string);
    procedure TMSFNCWXDocxViewer1DocumentRendered(Sender: TObject;
      PageCount: Integer);
    procedure TMSFNCWXDocxViewer1PageChange(Sender: TObject;
      ActivePage: Integer);
    procedure TMSFNCWXDocxViewer1LinkClick(Sender: TObject; Link: string);
  private
    FReady: Boolean;
    FPageCount: Integer;
    function AccentHex: string;
    function AddRun(AParagraph: TTMSFNCWXDocxParagraph; const AText: string;
      ASize: Integer = 10; ABold: Boolean = False;
      const AColorHex: string = '24384B'): TTMSFNCWXDocxText;
    function AddCell(ARow: TTMSFNCWXDocxTableRow; const AText: string;
      AWidth: Integer; AAlignment: TTMSFNCWXDocxTextAlignment;
      const AFillHex, ATextHex: string; ABold: Boolean): TTMSFNCWXDocxTableCell;
    function CreateLogo: TTMSFNCBitmap;
    procedure BuildDocument;
    procedure BuildInvoice(ASection: TTMSFNCWXDocxSection);
    procedure BuildTerms(ASection: TTMSFNCWXDocxSection);
    procedure UpdatePreview;
    procedure ShowPageLabel(APage: Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  ColText = '24384B';
  ColMuted = '6B7F93';
  ColLine = 'DCE4EC';
  ColStripe = 'F4F7FA';
  ColWhite = 'FFFFFF';

function HexToColor(const AHex: string): TColor;
begin
  Result := RGB(StrToInt('$' + Copy(AHex, 1, 2)), StrToInt('$' + Copy(AHex, 3, 2)),
    StrToInt('$' + Copy(AHex, 5, 2)));
end;

function Money(AValue: Double): string;
begin
  Result := #8364' ' + FormatFloat('#,##0.00', AValue, TFormatSettings.Invariant);
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.Align := alClient;

  sgItems.ColWidths[1] := sgItems.ClientWidth div 7;
  sgItems.ColWidths[2] := sgItems.ClientWidth div 4;
  sgItems.ColWidths[0] := sgItems.ClientWidth - sgItems.ColWidths[1] - sgItems.ColWidths[2] - 3;
  sgItems.Cells[0, 0] := 'Description';
  sgItems.Cells[1, 0] := 'Qty';
  sgItems.Cells[2, 0] := 'Unit price';

  sgItems.Cells[0, 1] := 'TMS FNC WX Pack';
  sgItems.Cells[1, 1] := '2';
  sgItems.Cells[2, 1] := '125';
  sgItems.Cells[0, 2] := 'TMS FNC UI Pack';
  sgItems.Cells[1, 2] := '2';
  sgItems.Cells[2, 2] := '295';
  sgItems.Cells[0, 3] := 'On-site training day';
  sgItems.Cells[1, 3] := '1';
  sgItems.Cells[2, 3] := '950';
  sgItems.Cells[0, 4] := 'Priority support, 12 months';
  sgItems.Cells[1, 4] := '1';
  sgItems.Cells[2, 4] := '480';

  lblStatus.Caption := 'Starting...';
end;

function TForm1.AccentHex: string;
begin
  case cbAccent.ItemIndex of
    1: Result := '1F8A5B';
    2: Result := 'D9650B';
    3: Result := '6D3FC4';
  else
    Result := '1E7FC2';
  end;
end;

function TForm1.AddRun(AParagraph: TTMSFNCWXDocxParagraph; const AText: string;
  ASize: Integer; ABold: Boolean; const AColorHex: string): TTMSFNCWXDocxText;
begin
  Result := AParagraph.AddText(AText);
  Result.Font.Name := 'Segoe UI';
  Result.Font.Size := ASize;
  Result.Font.Color := HexToColor(AColorHex);
  if ABold then
    Result.Font.Style := [TFontStyle.fsBold];
end;

function TForm1.AddCell(ARow: TTMSFNCWXDocxTableRow; const AText: string;
  AWidth: Integer; AAlignment: TTMSFNCWXDocxTextAlignment;
  const AFillHex, ATextHex: string; ABold: Boolean): TTMSFNCWXDocxTableCell;
var
  p: TTMSFNCWXDocxParagraph;
begin
  Result := ARow.AddCell;
  Result.Width.WidthType := wtPercentage;
  Result.Width.Size := AWidth;

  // a single thin line under every cell
  Result.Borders.Borders := [boBottom];
  Result.Borders.Bottom.Color := ColLine;
  Result.Borders.Bottom.Size := 6;

  Result.Shading.ShadingType := stClear;
  Result.Shading.Fill := AFillHex;

  p := Result.AddParagraph;
  p.Alignment := AAlignment;
  p.Spacing.Before := 90;
  p.Spacing.After := 90;
  AddRun(p, AText, 10, ABold, ATextHex);
end;

function TForm1.CreateLogo: TTMSFNCBitmap;
var
  bmp: TBitmap;
  r: TRect;
begin
  // the logo is drawn in code, any picture can be used instead
  bmp := TBitmap.Create;
  try
    bmp.SetSize(480, 120);
    bmp.Canvas.Brush.Color := clWhite;
    bmp.Canvas.FillRect(Rect(0, 0, 480, 120));

    bmp.Canvas.Brush.Color := HexToColor(AccentHex);
    bmp.Canvas.Pen.Color := bmp.Canvas.Brush.Color;
    bmp.Canvas.RoundRect(0, 10, 100, 110, 28, 28);

    bmp.Canvas.Font.Name := 'Segoe UI';
    bmp.Canvas.Font.Style := [fsBold];
    bmp.Canvas.Font.Height := 62;
    bmp.Canvas.Font.Color := clWhite;
    r := Rect(0, 10, 100, 110);
    bmp.Canvas.TextRect(r, 30, 22, 'A');

    bmp.Canvas.Brush.Style := bsClear;
    bmp.Canvas.Font.Height := 58;
    bmp.Canvas.Font.Color := HexToColor(ColText);
    bmp.Canvas.TextOut(122, 4, 'Acme Mobility');
    bmp.Canvas.Font.Style := [];
    bmp.Canvas.Font.Height := 30;
    bmp.Canvas.Font.Color := HexToColor(ColMuted);
    bmp.Canvas.TextOut(124, 70, 'Software for people on the move');

    Result := TTMSFNCBitmap.Create;
    Result.Assign(bmp);
  finally
    bmp.Free;
  end;
end;

procedure TForm1.BuildDocument;
var
  doc: TTMSFNCWXDocxDocument;
begin
  doc := TMSFNCWXDocx1.Document;
  doc.Sections.Clear;
  doc.Title := 'Invoice ' + edNumber.Text;
  doc.Subject := 'Invoice for ' + edCustomer.Text;
  doc.Creator := 'TMS FNC WX Pack';

  BuildInvoice(doc.AddSection);
  if chkTerms.Checked then
    BuildTerms(doc.AddSection);
end;

procedure TForm1.BuildInvoice(ASection: TTMSFNCWXDocxSection);
var
  p: TTMSFNCWXDocxParagraph;
  t: TTMSFNCWXDocxText;
  tbl: TTMSFNCWXDocxTable;
  r: TTMSFNCWXDocxTableRow;
  c: TTMSFNCWXDocxTableCell;
  logo: TTMSFNCBitmap;
  i, qty, lines: Integer;
  price, total: Double;
  fill: string;
begin
  // page setup, sizes are in twentieths of a point
  if chkLandscape.Checked then
    ASection.Page.Orientation := poLandscape;
  ASection.Page.Margin := Rect(1200, 1100, 1200, 1100);

  // header and footer
  p := ASection.Headers.DefaultHeader.AddParagraph;
  p.Alignment := taRight;
  AddRun(p, 'Acme Mobility  |  Invoice ' + edNumber.Text, 8, False, ColMuted);

  p := ASection.Footers.DefaultFooter.AddParagraph;
  p.Alignment := taCenter;
  t := p.AddPageNumber('Page %s of %s');
  t.Font.Name := 'Segoe UI';
  t.Font.Size := 8;
  t.Font.Color := HexToColor(ColMuted);

  // logo
  logo := CreateLogo;
  try
    p := ASection.AddParagraph;
    p.Spacing.After := 240;
    p.AddImage(logo, 50, 200);
  finally
    logo.Free;
  end;

  // title with a coloured rule underneath
  p := ASection.AddParagraph;
  p.Border.Borders := [boBottom];
  p.Border.Bottom.Color := AccentHex;
  p.Border.Bottom.Size := 18;
  p.Border.Bottom.Space := 6;
  p.Spacing.After := 240;
  AddRun(p, 'INVOICE', 26, True, AccentHex);
  AddRun(p, '   ' + edNumber.Text, 14, False, ColMuted);

  // billing details in a borderless two column table
  tbl := ASection.AddTable;
  tbl.Width.WidthType := wtPercentage;
  tbl.Width.Size := 100;
  r := tbl.AddRow;

  c := r.AddCell;
  c.Width.WidthType := wtPercentage;
  c.Width.Size := 60;
  AddRun(c.AddParagraph, 'BILLED TO', 8, True, ColMuted);
  AddRun(c.AddParagraph, edCustomer.Text, 13, True);
  AddRun(c.AddParagraph, 'Kerkstraat 12, 8500 Kortrijk, Belgium', 10, False, ColMuted);

  c := r.AddCell;
  c.Width.WidthType := wtPercentage;
  c.Width.Size := 40;
  p := c.AddParagraph;
  p.Alignment := taRight;
  AddRun(p, 'DATE', 8, True, ColMuted);
  p := c.AddParagraph;
  p.Alignment := taRight;
  AddRun(p, FormatDateTime('d mmmm yyyy', Date, TFormatSettings.Invariant));
  p := c.AddParagraph;
  p.Alignment := taRight;
  AddRun(p, 'Due ', 10, False, ColMuted);
  AddRun(p, FormatDateTime('d mmmm yyyy', Date + 30, TFormatSettings.Invariant), 10, True);

  p := ASection.AddParagraph;
  p.Spacing.After := 120;

  // line items
  tbl := ASection.AddTable;
  tbl.Width.WidthType := wtPercentage;
  tbl.Width.Size := 100;

  r := tbl.AddRow;
  r.TableHeader := True;
  AddCell(r, 'Description', 52, taLeft, AccentHex, ColWhite, True);
  AddCell(r, 'Qty', 10, taRight, AccentHex, ColWhite, True);
  AddCell(r, 'Unit price', 18, taRight, AccentHex, ColWhite, True);
  AddCell(r, 'Amount', 20, taRight, AccentHex, ColWhite, True);

  total := 0;
  lines := 0;
  for i := 1 to sgItems.RowCount - 1 do
  begin
    if Trim(sgItems.Cells[0, i]) = '' then
      Continue;

    qty := StrToIntDef(Trim(sgItems.Cells[1, i]), 1);
    price := StrToFloatDef(Trim(sgItems.Cells[2, i]), 0, TFormatSettings.Invariant);
    total := total + qty * price;

    if Odd(lines) then
      fill := ColStripe
    else
      fill := ColWhite;
    Inc(lines);

    r := tbl.AddRow;
    r.CantSplit := True;
    AddCell(r, sgItems.Cells[0, i], 52, taLeft, fill, ColText, False);
    AddCell(r, IntToStr(qty), 10, taRight, fill, ColText, False);
    AddCell(r, Money(price), 18, taRight, fill, ColText, False);
    AddCell(r, Money(qty * price), 20, taRight, fill, ColText, False);
  end;

  // totals, the label spans three columns
  r := tbl.AddRow;
  c := AddCell(r, 'Subtotal', 80, taRight, ColWhite, ColMuted, False);
  c.ColumnSpan := 3;
  AddCell(r, Money(total), 20, taRight, ColWhite, ColText, False);

  r := tbl.AddRow;
  c := AddCell(r, 'VAT 21%', 80, taRight, ColWhite, ColMuted, False);
  c.ColumnSpan := 3;
  AddCell(r, Money(total * 0.21), 20, taRight, ColWhite, ColText, False);

  r := tbl.AddRow;
  c := AddCell(r, 'Total due', 80, taRight, ColWhite, ColText, True);
  c.ColumnSpan := 3;
  AddCell(r, Money(total * 1.21), 20, taRight, AccentHex, ColWhite, True);

  // notes
  p := ASection.AddParagraph;
  p.Spacing.Before := 360;
  p.Spacing.After := 120;
  AddRun(p, 'Payment', 13, True, AccentHex);

  p := ASection.AddParagraph;
  p.Bullet.Level := 0;
  AddRun(p, 'Payment is due ');
  AddRun(p, 'within 30 days', 10, True);
  AddRun(p, ' of the invoice date.');

  p := ASection.AddParagraph;
  p.Bullet.Level := 0;
  AddRun(p, 'Please mention reference ');
  AddRun(p, edNumber.Text, 10, True, AccentHex);
  AddRun(p, ' with your transfer.');

  p := ASection.AddParagraph;
  p.Bullet.Level := 0;
  AddRun(p, 'Questions? Visit ');
  t := p.AddExternalHyperlink('https://www.tmssoftware.com', 'www.tmssoftware.com').Children[0] as TTMSFNCWXDocxText;
  t.Font.Name := 'Segoe UI';
  t.Font.Size := 10;
  t.Font.Color := HexToColor(AccentHex);
  t.Font.Style := [TFontStyle.fsUnderline];

  if chkTerms.Checked then
  begin
    p := ASection.AddParagraph;
    p.Bullet.Level := 0;
    AddRun(p, 'Our ');
    t := p.AddInternalHyperlink('terms', 'terms and conditions').Children[0] as TTMSFNCWXDocxText;
    t.Font.Name := 'Segoe UI';
    t.Font.Size := 10;
    t.Font.Color := HexToColor(AccentHex);
    t.Font.Style := [TFontStyle.fsUnderline];
    AddRun(p, ' are on the next page.');
  end;
end;

procedure TForm1.BuildTerms(ASection: TTMSFNCWXDocxSection);

  procedure AddClause(const ATitle, AText: string);
  var
    p: TTMSFNCWXDocxParagraph;
  begin
    p := ASection.AddParagraph;
    p.KeepNext := True;
    p.Spacing.Before := 280;
    p.Spacing.After := 100;
    AddRun(p, ATitle, 12, True);

    p := ASection.AddParagraph;
    p.Alignment := taJustified;
    p.KeepLines := True;
    AddRun(p, AText);
  end;

var
  p: TTMSFNCWXDocxParagraph;
  t: TTMSFNCWXDocxText;
begin
  ASection.Page.Margin := Rect(1200, 1100, 1200, 1100);

  p := ASection.Footers.DefaultFooter.AddParagraph;
  p.Alignment := taCenter;
  t := p.AddPageNumber('Page %s of %s');
  t.Font.Name := 'Segoe UI';
  t.Font.Size := 8;
  t.Font.Color := HexToColor(ColMuted);

  p := ASection.AddParagraph;
  p.Border.Borders := [boBottom];
  p.Border.Bottom.Color := AccentHex;
  p.Border.Bottom.Size := 18;
  p.Border.Bottom.Space := 6;
  t := p.AddBookmark('terms', 'Terms and conditions').Children[0] as TTMSFNCWXDocxText;
  t.Font.Name := 'Segoe UI';
  t.Font.Size := 22;
  t.Font.Style := [TFontStyle.fsBold];
  t.Font.Color := HexToColor(AccentHex);

  AddClause('1. Licences',
    'Licences are granted per named developer and include all source code. ' +
    'Applications built with the components can be distributed royalty free, ' +
    'on every platform the components support.');
  AddClause('2. Updates and support',
    'Each licence includes one year of free updates and priority support. ' +
    'After that year the licence remains valid for the versions released during it, ' +
    'and can be renewed at a reduced price.');
  AddClause('3. Payment',
    'Invoices are payable within 30 days of the invoice date. ' +
    'Amounts are in euro and exclude VAT unless stated otherwise.');

  p := ASection.AddParagraph;
  p.Spacing.Before := 400;
  p.Shading.ShadingType := stClear;
  p.Shading.Fill := ColStripe;
  AddRun(p, 'This document was generated with TTMSFNCWXDocx and is shown with TTMSFNCWXDocxViewer.',
    9, False, ColMuted);
end;

procedure TForm1.UpdatePreview;
begin
  if not FReady then
    Exit;

  lblStatus.Caption := 'Generating...';
  BuildDocument;
  // the result arrives in OnDownloadAsBase64
  TMSFNCWXDocx1.GetDocxAsBase64;
end;

procedure TForm1.ShowPageLabel(APage: Integer);
begin
  if FPageCount > 0 then
    lblPage.Caption := Format('Page %d of %d', [APage, FPageCount])
  else
    lblPage.Caption := '';
end;

procedure TForm1.TMSFNCWXDocx1Initialized(Sender: TObject);
begin
  FReady := True;
  UpdatePreview;
end;

procedure TForm1.TMSFNCWXDocx1DownloadAsBase64(Sender: TObject;
  ABase64: string);
begin
  // straight from the generator into the viewer, no file involved
  TMSFNCWXDocxViewer1.LoadFromBase64(ABase64);
end;

procedure TForm1.TMSFNCWXDocx1DownloadAsFile(Sender: TObject;
  FileName: string);
begin
  lblStatus.Caption := 'Saved ' + ExtractFileName(FileName);
end;

procedure TForm1.TMSFNCWXDocxViewer1DocumentRendered(Sender: TObject;
  PageCount: Integer);
begin
  FPageCount := PageCount;
  ShowPageLabel(1);
  lblStatus.Caption := 'Ready';
end;

procedure TForm1.TMSFNCWXDocxViewer1PageChange(Sender: TObject;
  ActivePage: Integer);
begin
  // ActivePage is a zero based index
  ShowPageLabel(ActivePage + 1);
end;

procedure TForm1.TMSFNCWXDocxViewer1LinkClick(Sender: TObject; Link: string);
begin
  lblStatus.Caption := 'Link clicked: ' + Link;
end;

procedure TForm1.InputChange(Sender: TObject);
begin
  // restart the timer, the preview follows shortly after the last change
  tmrPreview.Enabled := False;
  tmrPreview.Enabled := True;
end;

procedure TForm1.sgItemsSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
begin
  InputChange(Sender);
end;

procedure TForm1.tmrPreviewTimer(Sender: TObject);
begin
  tmrPreview.Enabled := False;
  UpdatePreview;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
begin
  SaveDialog1.FileName := 'Invoice ' + edNumber.Text + '.docx';
  if FReady and SaveDialog1.Execute then
  begin
    BuildDocument;
    // the file is written asynchronously, OnDownloadAsFile fires when it is there
    TMSFNCWXDocx1.GetDocxAsFile(SaveDialog1.FileName);
  end;
end;

procedure TForm1.btnOpenClick(Sender: TObject);
begin
  // the viewer shows any .docx file, not only generated ones
  if OpenDialog1.Execute then
    TMSFNCWXDocxViewer1.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.btnPreviousClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.PreviousPage;
end;

procedure TForm1.btnNextClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.NextPage;
end;

procedure TForm1.btnZoomOutClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.ZoomOut;
end;

procedure TForm1.btnZoomInClick(Sender: TObject);
begin
  TMSFNCWXDocxViewer1.ZoomIn;
end;

end.
