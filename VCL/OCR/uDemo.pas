unit uDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls,
  VCL.TMSFNCWXJSONFormatter, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXOCR,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TDemo = class(TForm)
    TMSFNCWXOCR1: TTMSFNCWXOCR;
    OpenDialog1: TOpenDialog;
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Memo1: TMemo;
    Panel2: TPanel;
    TMSFNCWXJSONFormatter1: TTMSFNCWXJSONFormatter;
    Panel4: TPanel;
    ProgressLabel: TLabel;
    AccuracyLabel: TLabel;
    StartOCR: TButton;
    ProgressBar1: TProgressBar;
    LoadImage: TButton;
    procedure StartOCRClick(Sender: TObject);
    procedure TMSFNCWXOCR1ProgressOCR(Sender: TObject;
      Progress: TTMSFNCWXOCRProgress);
    procedure TMSFNCWXOCR1FinishOCR(Sender: TObject;
      Result: TTMSFNCWXOCRResult);
    procedure FormCreate(Sender: TObject);
    procedure LoadImageClick(Sender: TObject);
    procedure TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.StartOCRClick(Sender: TObject);
var
  s: string;
begin
  if Assigned (OpenDialog1.Files) AND (OpenDialog1.Files.Count > 0)  then
    TMSFNCWXOCR1.RecognizeFile(OpenDialog1.Files[0], OpenDialog1.FileName)
  else
  begin
    s:= TTMSFNCUtils.SaveBitmapToHexStr(Image1.Picture);
    TMSFNCWXOCR1.RecognizeBytes(TTMSFNCUtils.HexStrToBytes(s), 'BitmapImage');
  end;
end;

procedure TDemo.LoadImageClick(Sender: TObject);
begin
  OpenDialog1.InitialDir := GetCurrentDir;
  OpenDialog1.Filter := 'Images |*.PNG;*.JPEG;*.JPG';
  if OpenDialog1.Execute then
  begin
    Image1.Picture.LoadFromFile( OpenDIalog1.Files[0]);
  end;
end;

procedure TDemo.FormCreate(Sender: TObject);
begin
  Memo1.Text := '';
  TMSFNCWXJSONFormatter1.JSON.Text := '';
end;

procedure TDemo.TMSFNCWXOCR1FinishOCR(Sender: TObject;
  Result: TTMSFNCWXOCRResult);
begin
   TMSFNCWXJSONFormatter1.JSON.Text := Result.JSONString;
   Memo1.Lines.Text := Result.Text;
   AccuracyLabel.Caption := 'Confidence: ' + FloatToStr(Result.Confidence) + ' (indicates accuracy of OCR)';
end;

procedure TDemo.TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
begin
  ProgressLabel.Caption := 'Error: Something went error';
  ProgressBar1.Position := 0;
end;

procedure TDemo.TMSFNCWXOCR1ProgressOCR(Sender: TObject;
  Progress: TTMSFNCWXOCRProgress);
begin
  ProgressLabel.Caption := Progress.Status + ': ';
  ProgressBar1.Position := trunc(Progress.Progress*100);
end;

end.
