unit uDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls,
  VCL.TMSFNCWXJSONFormatter, VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser,
  VCL.TMSFNCCustomWEBControl, VCL.TMSFNCCustomWEBComponent, VCL.TMSFNCWXOCR,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg, Generics.Collections,
  VCL.TMSFNCWXOCRHelper, Vcl.Imaging.pngimage;

type
  TDemo = class(TForm)
    TMSFNCWXOCR1: TTMSFNCWXOCR;
    OpenDialog1: TOpenDialog;
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
    ProgressLabel: TLabel;
    AccuracyLabel: TLabel;
    StartOCR: TButton;
    ProgressBar1: TProgressBar;
    LoadImage: TButton;
    ClearButton: TButton;
    SaveTemplateButton: TButton;
    LoadFromSavedTemplate: TButton;
    ClearTemplate: TButton;
    TMSFNCWXOCRHelper1: TTMSFNCWXOCRHelper;
    procedure StartOCRClick(Sender: TObject);
    procedure TMSFNCWXOCR1ProgressOCR(Sender: TObject;
      Progress: TTMSFNCWXOCRProgress);
    procedure TMSFNCWXOCR1FinishOCR(Sender: TObject;
      Result: TTMSFNCWXOCRResult);
    procedure FormCreate(Sender: TObject);
    procedure LoadImageClick(Sender: TObject);
    procedure TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
    procedure ClearButtonClick(Sender: TObject);
    procedure LoadFromSavedTemplateClick(Sender: TObject);
    procedure SaveTemplateButtonClick(Sender: TObject);
    procedure ClearTemplateClick(Sender: TObject);
  private
    { Private declarations }
    FTemplate : String;
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.dfm}

procedure TDemo.SaveTemplateButtonClick(Sender: TObject);
begin
  FTemplate := TMSFNCWXOCRHelper1.SaveTemplateToJSON;
end;

procedure TDemo.StartOCRClick(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  if not TMSFNCWXOCRHelper1.CheckRectanglesAvailableForOCR then
    i := MessageDlg('No rectangles available for OCR, start Full image OCR instead?', TMsgDlgType.mtInformation, mbOKCancel, 0);

  if i = mrCancel then
    exit;

  TMSFNCWXOCRHelper1.StartOCR;
end;

procedure TDemo.LoadFromSavedTemplateClick(Sender: TObject);
begin
  if FTemplate.Trim <> '' then
  begin
    TMSFNCWXOCRHelper1.SelectionResults.Clear;
    TMSFNCWXOCRHelper1.LoadTemplateFromJSON(FTemplate);
  end;

end;


procedure TDemo.LoadImageClick(Sender: TObject);
begin
  OpenDialog1.InitialDir := GetCurrentDir;
  OpenDialog1.Filter := 'Images |*.PNG;*.JPEG;*.JPG';
  if OpenDialog1.Execute then
  begin
    TMSFNCWXOCRHelper1.Bitmap.LoadFromFile(OpenDIalog1.Files[0]);
  end;
end;

procedure TDemo.ClearButtonClick(Sender: TObject);
begin
  TMSFNCWXOCRHelper1.ClearAll;
end;

procedure TDemo.ClearTemplateClick(Sender: TObject);
begin
  TMSFNCWXOCRHelper1.ClearNonProcessedSelections;
  FTemplate := '';
end;

procedure TDemo.FormCreate(Sender: TObject);
begin
  Memo1.Text := '';
end;

procedure TDemo.TMSFNCWXOCR1FinishOCR(Sender: TObject;
  Result: TTMSFNCWXOCRResult);
begin
  Memo1.Lines.Add('----' + Result.ID + '----');
  Memo1.Lines.Add(Result.Text);
  Memo1.Lines.Add('---------');
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
