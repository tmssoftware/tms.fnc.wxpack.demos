unit uDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCWXJSONFormatter,
  Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.WebCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXOCR, WEBLib.ExtCtrls,
  WEBLib.ComCtrls, Vcl.Imaging.jpeg;

type
  TDemo = class(TWebForm)
    TMSFNCWXOCR1: TTMSFNCWXOCR;
    StartOCR: TWebButton;
    WebLabel1: TWebLabel;
    TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter;
    WebMemo1: TWebMemo;
    WebProgressBar1: TWebProgressBar;
    WebImageControl1: TWebImageControl;
    WebLabel2: TWebLabel;
    WebFilePicker1: TWebFilePicker;
    WebPanel1: TWebPanel;
    WebGridPanel1: TWebGridPanel;
    WebPanel2: TWebPanel;
    WebScrollBox1: TWebScrollBox;
    WebLabel3: TWebLabel;
    WebLabel4: TWebLabel;
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

  private
    procedure DoFileLoaded(const AFile: TTMSFNCUtilsFile);
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
  TMSFNCWXJSONFormatter1.JSON.Text := Result.JSONString;
  WebMemo1.Text := Result.text;
  WebLabel2.caption := 'Confidence: ' + FloatToStr(Result.Confidence) + ' (Accuracy of the OCR)';
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

procedure TDemo.StartOCRClick(Sender: TObject);
var
  s: string;
begin
  if WebFilePicker1.Files.count <> 0 then
    TTMSFNCUtils.LoadFile(WebFilePicker1.Files[0].FileObject, @DoFileLoaded)
  else
  begin
    TMSFNCWXOCR1.RecognizeBase64(WebImageControl1.Base64Image, 'ImageControl1');
  end;
end;

procedure TDemo.WebFilePicker1Change(Sender: TObject);
begin
  WebFilePicker1.Files[0].GetFileAsDataURL;
end;

procedure TDemo.WebFilePicker1GetFileAsDataURL(Sender: TObject;
  AFileIndex: Integer; AURL: string);
begin
  WebImageControl1.URL := AURL;
end;

procedure TDemo.WebFormCreate(Sender: TObject);
begin
  WebMemo1.Text := '';
end;

procedure TDemo.DoFileLoaded(const AFile: TTMSFNCUtilsFile);
begin
   TMSFNCWXOCR1.RecognizeFile(AFile, AFile.Name);
end;

end.
