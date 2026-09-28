unit UDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TMSFNCCustomControl,
  FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl, FMX.TMSFNCWXOCR,
  FMX.TMSFNCWXJSONFormatter, FMX.TMSFNCCustomWEBComponent, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Objects, FMX.Layouts, Generics.Collections,
  FMX.TMSFNCWXOCRHelper;

type
  TDemo = class(TForm)
    StartOCR: TButton;
    OpenDlg: TOpenDialog;
    TMSFNCWXOCR1: TTMSFNCWXOCR;
    Memo1: TMemo;
    ResultLabel: TLabel;
    ProgressBar1: TProgressBar;
    ProgressLabel: TLabel;
    LoadImage: TButton;
    GridPanelLayout1: TGridPanelLayout;
    Panel1: TPanel;
    clearButton: TButton;
    SaveTemplateButton: TButton;
    LoadFromTemplateButton: TButton;
    TMSFNCWXOCRHelper1: TTMSFNCWXOCRHelper;
    ClearTemplate: TButton;
    procedure StartOCRClick(Sender: TObject);
    procedure LoadImageClick(Sender: TObject);
    procedure TMSFNCWXOCR1FinishOCR(Sender: TObject; Result: TTMSFNCWXOCRResult);
    procedure TMSFNCWXOCR1ProgressOCR(Sender: TObject;
      Progress: TTMSFNCWXOCRProgress);
    procedure TMSFNCWXOCR1OCRError(Sender: TObject; Error: string);
    procedure clearButtonClick(Sender: TObject);
    procedure SaveTemplateButtonClick(Sender: TObject);
    procedure LoadFromTemplateButtonClick(Sender: TObject);
    procedure ClearTemplateClick(Sender: TObject);
  private
    { Private declarations }
    Ftemplate : string;
  public
    { Public declarations }
  end;

var
  Demo: TDemo;

implementation

{$R *.fmx}

procedure TDemo.SaveTemplateButtonClick(Sender: TObject);
begin
  FTemplate := TMSFNCWXOCRHelper1.SaveTemplateToJSON;
  TMSFNCWXOCRHelper1.EnableSelection := False;
  TMSFNCWXOCRHelper1.ClearAll;
end;

procedure TDemo.StartOCRClick(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  if not TMSFNCWXOCRHelper1.CheckRectanglesAvailableForOCR then
    i := MessageDlg('No rectangles available, start full image OCR Process instead?', TMsgDlgType.mtInformation, mbOKCancel, 0);

  if i = mrCancel then
    exit;

  TMSFNCWXOCRHelper1.StartOCR;
end;

procedure TDemo.clearButtonClick(Sender: TObject);
begin
  TMSFNCWXOCRHelper1.ClearAll;
end;

procedure TDemo.ClearTemplateClick(Sender: TObject);
begin
  TMSFNCWXOCRHelper1.ClearNonProcessedSelections;
  FTemplate := '';
end;

procedure TDemo.LoadFromTemplateButtonClick(Sender: TObject);
begin
  TMSFNCWXOCRHelper1.LoadTemplateFromJSON(FTemplate);
end;

procedure TDemo.LoadImageClick(Sender: TObject);
begin
  OpenDlg.InitialDir := GetCurrentDir;
  if OpenDlg.Execute then
  begin
    TMSFNCWXOCRHelper1.Bitmap.LoadFromFile(OpenDlg.Files[0]);
  end;

end;

procedure TDemo.TMSFNCWXOCR1FinishOCR(Sender: TObject; Result: TTMSFNCWXOCRResult);
begin
  Memo1.Lines.Add('----' + Result.ID + '----');
  Memo1.Lines.Add(Result.Text);
  Memo1.Lines.Add('---------');
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
