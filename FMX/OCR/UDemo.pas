unit UDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TMSFNCCustomControl,
  FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl, FMX.TMSFNCWXOCR,
  FMX.TMSFNCWXJSONFormatter, FMX.TMSFNCCustomWEBComponent, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Objects, FMX.Layouts;

type
  TDemo = class(TForm)
    StartOCR: TButton;
    OpenDlg: TOpenDialog;
    TMSFNCWXOCR1: TTMSFNCWXOCR;
    Memo1: TMemo;
    TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter;
    ResultLabel: TLabel;
    ProgressBar1: TProgressBar;
    ImageControl1: TImageControl;
    ProgressLabel: TLabel;
    LoadImage: TButton;
    GridPanelLayout1: TGridPanelLayout;
    Panel1: TPanel;
    Rectangle1: TRectangle;
    procedure StartOCRClick(Sender: TObject);
    procedure LoadImageClick(Sender: TObject);
    procedure TMSFNCWXOCR1FinishOCR(Sender: TObject; Result: TTMSFNCWXOCRResult);
    procedure TMSFNCWXOCR1ProgressOCR(Sender: TObject;
      Progress: TTMSFNCWXOCRProgress);
    procedure TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.fmx}

procedure TDemo.StartOCRClick(Sender: TObject);
var
  s : String;
  b: TBytes;
begin
  if OpenDlg.FIles.Count > 0 then
    TMSFNCWXOCR1.RecognizeFile(OpenDlg.Files[0], OpenDlg.FileName)
  else
  begin
    s := TTMSFNCUtils.SaveBitmapToHexStr(ImageControl1.Bitmap);
    b := TTMSFNCUtils.HexStrToBytes(s);
    TMSFNCWXOCR1.RecognizeBytes(b, 'ImageControl');
  end;

end;

procedure TDemo.LoadImageClick(Sender: TObject);
begin
  OpenDlg.InitialDir := GetCurrentDir;
  if OpenDlg.Execute then
  begin
    ImageControl1.LoadFromFile(OpenDlg.Files[0]);
  end;
end;

procedure TDemo.TMSFNCWXOCR1FinishOCR(Sender: TObject; Result: TTMSFNCWXOCRResult);
begin
  Memo1.Text := Result.Text;
  TMSFNCWXJSONFormatter1.JSON.text := Result.JSONString;
  ResultLabel.Text := 'Confidence: ' + FloatToStr(Result.Confidence) + ' (Accuracy of OCR)';
end;

procedure TDemo.TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
begin
  ProgressLabel.Text := Error;
  ProgressBar1.value := 0;
end;

procedure TDemo.TMSFNCWXOCR1ProgressOCR(Sender: TObject;
  Progress: TTMSFNCWXOCRProgress);
begin
  ProgressLabel.Text := Progress.Status + ': ';
  ProgressBar1.Value := Progress.Progress * 100;
end;

end.
