unit UMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXPDFViewer, Vcl.StdCtrls, WEBLib.StdCtrls,
  WEBLib.Buttons, Vcl.Imaging.pngimage, WEBLib.ExtCtrls;

type
  TForm1 = class(TWebForm)
    TMSFNCWXPDFViewer1: TTMSFNCWXPDFViewer;
    WebOpenDialog1: TWebOpenDialog;
    WebToolBar1: TWebToolBar;
    BtLoadPDF: TWebImageControl;
    BtPreviousPage: TWebImageControl;
    BtNextPage: TWebImageControl;
    BtZoomIn: TWebImageControl;
    BtZoomOut: TWebImageControl;
    BtRotateLeft: TWebImageControl;
    BtRotateRight: TWebImageControl;
    procedure BtLoadPDFClick(Sender: TObject);
    procedure BtPreviousPageClick(Sender: TObject);
    procedure BtNextPageClick(Sender: TObject);
    procedure BtZoomInClick(Sender: TObject);
    procedure BtZoomOutClick(Sender: TObject);
    procedure BtRotateLeftClick(Sender: TObject);
    procedure BtRotateRightClick(Sender: TObject);
    procedure TMSFNCWXPDFViewer1ViewerInitialized(Sender: TObject);
  private
    { Private declarations }
    [async]
    procedure LoadFile;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UResource;

{$R *.dfm}

procedure TForm1.BtRotateRightClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.TurnAngleRight;
end;

procedure TForm1.BtRotateLeftClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.TurnAngleLeft;
end;

procedure TForm1.BtZoomOutClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.ZoomOut;
end;

procedure TForm1.BtZoomInClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.ZoomIn;
end;

procedure TForm1.BtNextPageClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.NextPage;
end;

procedure TForm1.BtPreviousPageClick(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.PreviousPage;
end;

procedure TForm1.BtLoadPDFClick(Sender: TObject);
begin
  LoadFile;
end;

procedure TForm1.LoadFile;
var
  res: boolean;
  pdfData: string;
begin
  res := await(Boolean, WebOpenDialog1.Perform);
  if res then
  begin
    pdfData := await(string, WebOpenDialog1.Files[0].FileAsBase64);
    TMSFNCWXPDFViewer1.LoadFromBase64(pdfData);
  end;
end;

procedure TForm1.TMSFNCWXPDFViewer1ViewerInitialized(Sender: TObject);
begin
  TMSFNCWXPDFViewer1.LoadFromBase64(GetFileBase64);
end;

end.