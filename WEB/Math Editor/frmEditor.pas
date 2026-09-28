unit frmEditor;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXMathEditor, WEBLib.Buttons, WEBLib.ExtCtrls, Vcl.StdCtrls,
  WEBLib.StdCtrls;

type
  TForm1 = class(TWebForm)
    TMSFNCWXMathEditor1: TTMSFNCWXMathEditor;
    WebPanel1: TWebPanel;
    Undo: TWebSpeedButton;
    redo: TWebSpeedButton;
    mathFormat: TWebComboBox;
    Snapshot: TWebSpeedButton;
    download: TWebSpeedButton;
    Layout: TWebComboBox;
    Mode: TWebComboBox;
    Theme: TWebComboBox;
    WebCheckGroup1: TWebCheckGroup;
    procedure UndoClick(Sender: TObject);
    procedure redoClick(Sender: TObject);
    procedure downloadClick(Sender: TObject);
    procedure TMSFNCWXMathEditor1GetMath(Sender: TObject; AResultString: string;
      AResultFormat: TTMSFNCWXMathFormat);
    procedure TMSFNCWXMathEditor1CaptureScreenshot(Sender: TObject;
      AScreenShot: TTMSFNCBitmap);
    procedure SnapshotClick(Sender: TObject);
    procedure LayoutChange(Sender: TObject);
    procedure ModeChange(Sender: TObject);
    procedure ThemeChange(Sender: TObject);
    procedure WebCheckGroup1CheckClick(Sender: TObject; AIndex: Integer);
  private
    { Private declarations }
    keyboards: TTMSFNCWXMathVirtualKeyboards;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.downloadClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.GetMath(TTMSFNCWXMathFormat(mathFormat.itemIndex));
end;

procedure TForm1.LayoutChange(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardLayout := TTMSFNCWXMathVirtualKeyboardLayout(Layout.itemIndex);
end;

procedure TForm1.ModeChange(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardMode := TTMSFNCWXMathVirtualKeyboardMode(Mode.ItemIndex);
end;

procedure TForm1.redoClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.Redo;
end;

procedure TForm1.SnapshotClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.CaptureScreenShot;
end;

procedure TForm1.ThemeChange(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardTheme := TTMSFNCWXMathVirtualKeyboardTheme(Theme.itemIndex);
end;

procedure TForm1.TMSFNCWXMathEditor1CaptureScreenshot(Sender: TObject;
  AScreenShot: TTMSFNCBitmap);
var
  ms: TMemoryStream;
  b: string;
begin
  ms := TMemoryStream.Create;
  try
    b := TTMSFNCUtils.SaveBitmapToBase64(AScreenShot);
    if Pos(';base64,', b) > 0 then
      Delete(b, 1, Pos(';base64,', b) + 7);

    TTMSFNCUtils.LoadStreamFromBase64(b, ms);
    ms.Position := 0;
    ms.SaveToFile('test.png');
  finally
    ms.Free;
  end;

end;

procedure TForm1.TMSFNCWXMathEditor1GetMath(Sender: TObject;
  AResultString: string; AResultFormat: TTMSFNCWXMathFormat);
var
  s: TStringList;
begin
  s := TStringList.Create;
  try
    s.Text := AResultString;
    s.SaveToFile('Math.txt');
  finally
    s.Free;
  end;
end;

procedure TForm1.UndoClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.Undo;
end;

procedure TForm1.WebCheckGroup1CheckClick(Sender: TObject; AIndex: Integer);
begin
  if WebCheckGroup1.Checked[AIndex] then
    Include(keyboards, TTMSFNCWXMathVirtualKeyboard(AIndex))
  else
    Exclude(keyboards, TTMSFNCWXMathVirtualKeyboard(AIndex));

  TMSFNCWXMathEditor1.VirtualKeyboards := keyboards;
end;

end.
