unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXPDFViewer, FMX.Edit, FMX.Objects, FMX.TMSFNCCustomControl,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.TMSFNCGraphics,
  FMX.TMSFNCGraphicsTypes, FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCPrinters,
  FMX.Layouts, FMX.ListBox;

type
  TFrmMain = class(TForm)
    TMSFNCWXPDFViewer1: TTMSFNCWXPDFViewer;
    PnlTop: TPanel;
    ImgLoadURL: TImage;
    ImgRotateRight: TImage;
    ImgRotateLeft: TImage;
    ImgZoomOut: TImage;
    ImgZoomIn: TImage;
    ImgNextPage: TImage;
    ImgPreviousPage: TImage;
    ImgLoadFile: TImage;
    ImgPrint: TImage;
    ImgSearch: TImage;
    EdtSearch: TEdit;
    ListBox1: TListBox;
    procedure ImgLoadURLClick(Sender: TObject);
    procedure ImgLoadFileClick(Sender: TObject);
    procedure ImgPreviousPageClick(Sender: TObject);
    procedure ImgNextPageClick(Sender: TObject);
    procedure ImgZoomInClick(Sender: TObject);
    procedure ImgZoomOutClick(Sender: TObject);
    procedure ImgRotateLeftClick(Sender: TObject);
    procedure ImgRotateRightClick(Sender: TObject);
    procedure TMSFNCPDFViewer1GenerateThumbnail(Sender: TObject;
      NumPage: Integer; Base64Img: string);
    procedure ImgPrintClick(Sender: TObject);
    procedure TMSFNCPDFViewer1Loaded(Sender: TObject; NumPages: Integer);
    procedure ImgSearchClick(Sender: TObject);
    procedure TMSFNCPDFViewer1GenerateImagePage(Sender: TObject;
      ImgWidth,ImgHeight:Integer; Base64ImgPage: string);
    procedure PrintConfirmDialogProc(const AResult: TModalResult);
    procedure TMSFNCWXPDFViewer1ViewerInitialized(Sender: TObject);
    procedure TMSFNCWXPDFViewer1NotFoundSearchText(Sender: TObject);
    procedure TMSFNCWXPDFViewer1SearchTextFinished(Sender: TObject; AFirst,
      ACount: Integer);
    procedure ListBox1ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure TMSFNCWXPDFViewer1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.fmx}
{$R TMSFNCWXPDFViewerDemo.res}

procedure TFrmMain.ImgLoadFileClick(Sender: TObject);
var
  FileName:String;
begin
  if TTMSFNCUtils.SelectFile(FileName,'','PDF files |*.pdf') then
  begin
    TMSFNCWXPDFViewer1.LoadFromFile(FileName);
  end;
end;

procedure TFrmMain.ImgLoadURLClick(Sender: TObject);
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

procedure TFrmMain.ImgNextPageClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.NextPage;
end;

procedure TFrmMain.ImgPreviousPageClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.PreviousPage;
end;

procedure TFrmMain.ImgPrintClick(Sender: TObject);
begin
  MessageDlg('Are you sure you want to print the PDF?', TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK, TMsgDlgBtn.mbCancel], 0, PrintConfirmDialogProc);
end;

procedure TFrmMain.ImgRotateLeftClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.TurnAngleLeft;
end;

procedure TFrmMain.ImgRotateRightClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.TurnAngleRight;
end;

procedure TFrmMain.ImgSearchClick(Sender: TObject);
begin
  if EdtSearch.Text<>'' then
  begin
    TMSFNCWXPDFViewer1.SearchText(EdtSearch.Text);
  end;
end;

procedure TFrmMain.ImgZoomInClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.ZoomIn;
end;

procedure TFrmMain.ImgZoomOutClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.ZoomOut;
end;

procedure TFrmMain.ListBox1ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  TMSFNCWXPDFViewer1.ShowPage(Item.Index + 1);
end;

procedure TFrmMain.PrintConfirmDialogProc(const AResult: TModalResult);
begin
  if AResult = mrOk then
    TMSFNCWXPDFViewer1.GenerateImageActualPage;
end;

procedure TFrmMain.TMSFNCPDFViewer1GenerateImagePage(Sender: TObject;
  ImgWidth,ImgHeight:Integer; Base64ImgPage: string);
var
  ms: TMemoryStream;
  b: TBytes;
  Base64DataImg: string;
  ImgPage:TBitmap;
begin
  Base64DataImg := Copy(Base64ImgPage, Pos(',', Base64ImgPage) + 1, Length(Base64ImgPage));
  b := TTMSFNCUtils.Decode64ToBytes(Base64DataImg);
  ms := TMemoryStream.Create;
  ms.Write(b, Length(b));
  ms.Position := 0;
  ImgPage := TTMSFNCBitmap.Create(ImgWidth, ImgHeight);
  ImgPage.LoadFromStream(ms);

  TMSFNCPrinter.OnDrawContent :=
  procedure
  begin
    TMSFNCPrinter.Graphics.DrawBitmap(0, 0, TMSFNCPrinter.PageWidth, TMSFNCPrinter.PageHeight, ImgPage, True, True);
    TMSFNCPrinter.EndDoc;
  end;
  TMSFNCPrinter.BeginDoc;
end;

procedure TFrmMain.TMSFNCPDFViewer1GenerateThumbnail(Sender: TObject;
  NumPage: Integer; Base64Img: string);
var
  ms: TMemoryStream;
  b: TBytes;
  Base64DataImg: string;
  itm: TListboxItem;
begin
  itm := ListBox1.ListItems[NumPage - 1];
  Base64DataImg := Copy(Base64Img, Pos(',', Base64Img) + 1, Length(Base64Img));
  b := TTMSFNCUtils.Decode64ToBytes(Base64DataImg);
  ms := TMemoryStream.Create;
  ms.Write(b, Length(b));
  ms.Position := 0;
  itm.ItemData.Bitmap := TBitmap.Create(96, 96);
  itm.ItemData.Bitmap.LoadFromStream(ms);
  itm.StyleLookup := 'listboxitemleftdetail';
  ms.Free;
end;

procedure TFrmMain.TMSFNCPDFViewer1Loaded(Sender: TObject; NumPages: Integer);
var
  i: Integer;
  itm: TListBoxItem;
begin
  if Assigned(ListBox1.Content) then
    ListBox1.Clear;

  if NumPages>0 then
  begin
    ListBox1.BeginUpdate;
    for i := 1 to NumPages do
    begin
      itm := TListBoxItem.Create(nil);
      itm.Parent := ListBox1;
      itm.Text := 'Page ' + IntToStr(i);
      itm.Height := 96;
    end;
    ListBox1.EndUpdate;
  end;
end;

procedure TFrmMain.TMSFNCWXPDFViewer1MouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; var Handled: Boolean);
begin
  if ssCtrl in Shift then
  begin
    if WheelDelta > 0 then
      TMSFNCWXPDFViewer1.ZoomIn
    else
      TMSFNCWXPDFViewer1.ZoomOut;
  end;
end;

procedure TFrmMain.TMSFNCWXPDFViewer1NotFoundSearchText(Sender: TObject);
begin
  ShowMessage('No results for "' + EdtSearch.Text + '".');
end;

procedure TFrmMain.TMSFNCWXPDFViewer1SearchTextFinished(Sender: TObject; AFirst,
  ACount: Integer);
begin
  ShowMessage('Found ' + IntToStr(ACount) + ' match(es).');
end;

procedure TFrmMain.TMSFNCWXPDFViewer1ViewerInitialized(Sender: TObject);
begin
  ImgLoadURLClick(nil);
end;

end.
