unit uDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCWXJSONFormatter,
  Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.WebCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXOCR, WEBLib.ExtCtrls,
  WEBLib.ComCtrls, Vcl.Imaging.jpeg, generics.Collections,
  VCL.TMSFNCWXOCRHelper;

type
  TDemo = class(TWebForm)
    TMSFNCWXOCR1: TTMSFNCWXOCR;
    LoadTemplate: TWebButton;
    WebLabel1: TWebLabel;
    WebMemo1: TWebMemo;
    WebProgressBar1: TWebProgressBar;
    WebFilePicker1: TWebFilePicker;
    WebPanel2: TWebPanel;
    WebLabel3: TWebLabel;
    WebLabel4: TWebLabel;
    WebSplitter1: TWebSplitter;
    StartOCR: TWebButton;
    SaveToTemplate: TWebButton;
    ClearResults: TWebButton;
    TMSFNCWXOCRHelper1: TTMSFNCWXOCRHelper;
    ClearTemplate: TWebButton;
    procedure StartOCRClick(Sender: TObject);
    procedure TMSFNCWXOCR1FinishOCR(Sender: TObject;
      Result: TTMSFNCWXOCRResult);
    procedure TMSFNCWXOCR1ProgressOCR(Sender: TObject;
      Progress: TTMSFNCWXOCRProgress);
    procedure WebFilePicker1Change(Sender: TObject);
    procedure WebFilePicker1GetFileAsDataURL(Sender: TObject;
      AFileIndex: Integer; AURL: string);
    procedure WebFormCreate(Sender: TObject);
    procedure TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
    procedure LoadTemplateClick(Sender: TObject);
    procedure ClearResultsClick(Sender: TObject);
    procedure SaveToTemplateClick(Sender: TObject);
  private
    FTemplate: string;
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.TMSFNCWXOCR1FinishOCR(Sender: TObject;
  Result: TTMSFNCWXOCRResult);
begin
  WebMemo1.Lines.Add('----'+Result.ID+'----');
  WebMemo1.Lines.Add(Result.text);
  WebMemo1.Lines.Add('---------');

  WebLabel1.Caption := 'Finished';
end;

procedure TDemo.TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
begin
  WebLabel1.Caption := 'Something went wrong: ' + error;
  WebProgressBar1.position := 0;
end;

procedure TDemo.TMSFNCWXOCR1ProgressOCR(Sender: TObject;
  Progress: TTMSFNCWXOCRProgress);
begin
  WebLabel1.Caption := Progress.Status + ': ';
  WebProgressBar1.position := Trunc(Progress.Progress * 100);
end;

procedure TDemo.ClearResultsClick(Sender: TObject);
begin
  WebMemo1.Clear;
  TMSFNCWXOCRHelper1.ClearAll;
end;

procedure TDemo.LoadTemplateClick(Sender: TObject);
begin
  TMSFNCWXOCRHelper1.LoadTemplateFromJSON(FTemplate);
end;

procedure TDemo.SaveToTemplateClick(Sender: TObject);
begin
  FTemplate := TMSFNCWXOCRHelper1.SaveTemplateToJSON;
  TMSFNCWXOCRHelper1.ClearNonProcessedSelections;
end;

procedure TDemo.StartOCRClick(Sender: TObject);
var
  b: Boolean;
begin
  if TMSFNCWXOCRHelper1.CheckRectanglesAvailableForOCR then
    TMSFNCWXOCRHelper1.StartOCR
  else if Confirm('No rectangles available. Do you want to start a full image ocr instead?') then
    TMSFNCWXOCRHelper1.StartOCR;

end;

procedure TDemo.WebFilePicker1Change(Sender: TObject);
begin
  WebFilePicker1.Files[0].GetFileAsDataURL;
end;

procedure TDemo.WebFilePicker1GetFileAsDataURL(Sender: TObject;
  AFileIndex: Integer; AURL: string);
begin
  TMSFNCWXOCRHelper1.Bitmap.LoadFromURL(AURL);
  TMSFNCWXOCRHelper1.ClearAll;
end;

procedure TDemo.WebFormCreate(Sender: TObject);
begin
  WebMemo1.Text := '';
end;

end.
