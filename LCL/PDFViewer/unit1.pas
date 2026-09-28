unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  StdCtrls, LCLTMSFNCWXPDFViewer, LCLTMSFNCPrinters, LCLTMSFNCTypes,
  LCLTMSFNCUtils, LCLType;

type

  { TBitmapListItem }

  TBitmapListItem = class(TListItem)
  private
    FBitmap: TTMSFNCBitmap;
  public
    destructor Destroy; override;
    property Bitmap: TTMSFNCBitmap read FBitmap write FBitmap;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    BtLoadFile: TImage;
    BtPreviousPage: TImage;
    BtNextPage: TImage;
    BtZoomIn: TImage;
    BtZoomOut: TImage;
    BtRotateLeft: TImage;
    BtRotateRight: TImage;
    BtPrint: TImage;
    BtSearch: TImage;
    EdtSearch: TEdit;
    BtLoadURL: TImage;
    ImageList1: TImageList;
    ListView1: TListView;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    TMSFNCWXPDFViewer1: TTMSFNCWXPDFViewer;
    procedure BtLoadFileClick(Sender: TObject);
    procedure BtLoadURLClick(Sender: TObject);
    procedure BtNextPageClick(Sender: TObject);
    procedure BtPreviousPageClick(Sender: TObject);
    procedure BtPrintClick(Sender: TObject);
    procedure BtRotateLeftClick(Sender: TObject);
    procedure BtRotateRightClick(Sender: TObject);
    procedure BtSearchClick(Sender: TObject);
    procedure BtZoomInClick(Sender: TObject);
    procedure BtZoomOutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ListView1CreateItemClass(Sender: TCustomListView;
      var ItemClass: TListItemClass);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure TMSFNCWXPDFViewer1GenerateImagePage(Sender: TObject; ImgWidth,
      ImgHeight: Integer; Base64ImgPage: string);
    procedure TMSFNCWXPDFViewer1GenerateThumbnail(Sender: TObject;
      NumPage: Integer; Base64Img: string);
    procedure TMSFNCWXPDFViewer1Loaded(Sender: TObject; NumPages: Integer);
    procedure TMSFNCWXPDFViewer1NotFoundSearchText(Sender: TObject);
    procedure TMSFNCWXPDFViewer1SearchTextFinished(Sender: TObject; AFirst,
      ACount: Integer);
    procedure TMSFNCWXPDFViewer1ThumbnailProgress(Sender: TObject; APosition,
      ASize: Integer);
    procedure TMSFNCWXPDFViewer1ViewerInitialized(Sender: TObject);
  private
    FImgPage: TTMSFNCBitmap;
    procedure HandlePrint;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}
{$R  TMSFNCWXPDFViewerDemo.res}

{ TBitmapListItem }

destructor TBitmapListItem.Destroy;
begin
  if Assigned(FBitmap) then
    FBitmap.Free;
  inherited Destroy;
end;

{ TForm1 }

procedure TForm1.ListView1CreateItemClass(Sender: TCustomListView;
  var ItemClass: TListItemClass);
begin
  ItemClass := TBitmapListItem;
end;

procedure TForm1.BtLoadURLClick(Sender: TObject);
var
  rs: TResourceStream;
  bs: TBytesStream;
  bf: TBytes;
  base: string;
begin
  rs := TResourceStream.Create(HInstance, 'TTMSFNCWXPDFVIEWERBASE64FILE', RT_RCDATA);
  try
    bs := TBytesStream.Create;
    try
      bs.LoadFromStream(rs);
      bf := bs.Bytes;
      SetLength(bf, bs.Size);
      base := TTMSFNCUtils.Encode64(bf, False);
      TMSFNCWXPDFViewer1.LoadFromBase64(base);
    finally
      bs.Free;
    end;
  finally
    rs.Free;
  end;
end;

procedure TForm1.BtNextPageClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.NextPage;
end;

procedure TForm1.BtPreviousPageClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.PreviousPage;
end;

procedure TForm1.BtPrintClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to print the PDF?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0) = mrOk then
    TMSFNCWXPDFViewer1.GenerateImageActualPage;
end;

procedure TForm1.BtRotateLeftClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.TurnAngleLeft;
end;

procedure TForm1.BtRotateRightClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.TurnAngleRight;
end;

procedure TForm1.BtSearchClick(Sender: TObject);
begin
  if EdtSearch.Text <> '' then
    TMSFNCWXPDFViewer1.SearchText(EdtSearch.Text);
end;

procedure TForm1.BtZoomInClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.ZoomIn;
end;

procedure TForm1.BtZoomOutClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.ZoomOut;
end;

procedure TForm1.BtLoadFileClick(Sender: TObject);
var
  FileName: string;
begin
  if TTMSFNCUtils.SelectFile(FileName, '', 'PDF files |*.pdf') then
    TMSFNCWXPDFViewer1.LoadFromFile(FileName);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  FImgPage.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FImgPage := TTMSFNCBitmap.Create;
end;

procedure TForm1.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  r: TRect;
begin
  r := Item.DisplayRect(drBounds);
  r.Width := ListView1.Width;
  Sender.Canvas.TextRect(r, r.Left + 70, r.Top + 25, Item.Caption);
  if Assigned((Item as TBitmapListItem).Bitmap) then
    Sender.Canvas.StretchDraw(Rect(r.Left, r.Top + 1, r.Left + 64, r.Top + 64), (Item as TBitmapListItem).Bitmap.Graphic);

  DefaultDraw := False;
end;

procedure TForm1.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  //Item.Selected := True;
  TMSFNCWXPDFViewer1.ShowPage(Item.Index + 1);
end;

procedure TForm1.TMSFNCWXPDFViewer1GenerateImagePage(Sender: TObject; ImgWidth,
  ImgHeight: Integer; Base64ImgPage: string);
var
  ms: TBytesStream;
  b: TBytes;
  Base64DataImg: string;
begin
  Base64DataImg := Copy(Base64ImgPage, Pos(',', Base64ImgPage) + 1, Length(Base64ImgPage));
  b := TTMSFNCUtils.Decode64ToBytes(Base64DataImg);
  ms := TBytesStream.Create(TTMSFNCUtils.Decode64ToBytes(Base64DataImg));
  FImgPage := TTMSFNCBitmap.CreateFromStream(ms);

  TMSFNCPrinter.OnDrawContent := @HandlePrint;
  TMSFNCPrinter.BeginDoc;
end;

procedure TForm1.TMSFNCWXPDFViewer1GenerateThumbnail(Sender: TObject;
  NumPage: Integer; Base64Img: string);
var
  ms: TBytesStream;
  Base64DataImg: string;
  it: TBitmapListItem;
begin
  it := ListView1.Items.Item[NumPage - 1] as TBitmapListItem;
  Base64DataImg := Copy(Base64Img, Pos(',', Base64Img) + 1, Length(Base64Img));
  ms := TBytesStream.Create(TTMSFNCUtils.Decode64ToBytes(Base64DataImg));
  it.Bitmap := TTMSFNCBitmap.CreateFromStream(ms);
  ms.Free;
end;

procedure TForm1.TMSFNCWXPDFViewer1Loaded(Sender: TObject; NumPages: Integer);
var
  i: Integer;
  it: TListItem;
begin
  ListView1.Clear;
  ProgressBar1.Position := 0;

  if NumPages > 0 then
  begin
    for i := 1 to NumPages do
    begin
      it := ListView1.Items.Add;
      it.Caption := 'Page '+ IntToStr(i);
    end;
  end;
  ProgressBar1.Max := NumPages;
  ProgressBar1.Visible := True;
end;

procedure TForm1.TMSFNCWXPDFViewer1NotFoundSearchText(Sender: TObject);
begin
  ShowMessage('No results for "' + EdtSearch.Text + '"');
end;

procedure TForm1.TMSFNCWXPDFViewer1SearchTextFinished(Sender: TObject; AFirst,
  ACount: Integer);
begin
  ShowMessage('Found ' + IntToStr(ACount) + ' match(es).');
end;

procedure TForm1.TMSFNCWXPDFViewer1ThumbnailProgress(Sender: TObject;
  APosition, ASize: Integer);
begin
  ProgressBar1.Position := APosition;
  if APosition = ASize then
  begin
    ListView1.Invalidate;
    ProgressBar1.Visible := False;
  end;
end;

procedure TForm1.TMSFNCWXPDFViewer1ViewerInitialized(Sender: TObject);
begin
  BtLoadURLClick(nil);
end;

procedure TForm1.HandlePrint;
begin
  TMSFNCPrinter.Graphics.DrawBitmap(0, 0, TMSFNCPrinter.PageWidth, TMSFNCPrinter.PageHeight, FImgPage, True, True);
  TMSFNCPrinter.EndDoc;
end;

end.

