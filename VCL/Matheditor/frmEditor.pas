unit frmEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls, Vcl.ExtCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXMathEditor;

type
  TForm1 = class(TForm)
    TMSFNCWXMathEditor1: TTMSFNCWXMathEditor;
    Panel1: TPanel;
    Undo: TButton;
    Redo: TButton;
    Screenshot: TButton;
    Format: TComboBox;
    Download: TButton;
    mode: TComboBox;
    Theme: TRadioGroup;
    GroupBox1: TGroupBox;
    Numeric: TCheckBox;
    Roman: TCheckBox;
    Greek: TCheckBox;
    Functions: TCheckBox;
    Symbols: TCheckBox;
    LaTeX: TCheckBox;
    procedure UndoClick(Sender: TObject);
    procedure RedoClick(Sender: TObject);
    procedure ScreenshotClick(Sender: TObject);
    procedure ThemeClick(Sender: TObject);
    procedure FunctionsClick(Sender: TObject);
    procedure GreekClick(Sender: TObject);
    procedure LaTeXClick(Sender: TObject);
    procedure NumericClick(Sender: TObject);
    procedure RomanClick(Sender: TObject);
    procedure modeChange(Sender: TObject);
    procedure DownloadClick(Sender: TObject);
    procedure TMSFNCWXMathEditor1CaptureScreenshot(Sender: TObject;
      AScreenShot: TTMSFNCBitmap);
    procedure TMSFNCWXMathEditor1GetMath(Sender: TObject; AResultString: string;
      AResultFormat: TTMSFNCWXMathFormat);
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

procedure TForm1.DownloadClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.GetMath(TTMSFNCWXMathFormat(Format.ItemIndex));
end;

procedure TForm1.FunctionsClick(Sender: TObject);
begin
  if Functions.Checked then
    Include(keyboards, vkFunctions)
  else
    exclude(keyboards, vkFunctions);

  TMSFNCWXMathEditor1.VirtualKeyboards := keyboards;
end;

procedure TForm1.GreekClick(Sender: TObject);
begin
  if Greek.Checked then
    Include(keyboards, vkGreek)
  else
    exclude(keyboards, vkGreek);

  TMSFNCWXMathEditor1.VirtualKeyboards := keyboards;
end;

procedure TForm1.LaTeXClick(Sender: TObject);
begin
  if LaTeX.Checked then
    Include(keyboards, vkLateX)
  else
    exclude(keyboards, vkLateX);

  TMSFNCWXMathEditor1.VirtualKeyboards := keyboards;
end;

procedure TForm1.modeChange(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardMode := TTMSFNCWXMathVirtualKeyboardMode(mode.ItemIndex);
end;

procedure TForm1.NumericClick(Sender: TObject);
begin
  if Numeric.Checked then
    Include(keyboards, vkNumeric)
  else
    exclude(keyboards, vkNumeric);

  TMSFNCWXMathEditor1.VirtualKeyboards := keyboards;
end;

procedure TForm1.RedoClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.Redo;
end;

procedure TForm1.RomanClick(Sender: TObject);
begin
  if Roman.Checked then
    Include(keyboards, vkRoman)
  else
    exclude(keyboards, vkRoman);

  TMSFNCWXMathEditor1.VirtualKeyboards := keyboards;
end;

procedure TForm1.ScreenshotClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.CaptureScreenShot;
end;

procedure TForm1.ThemeClick(Sender: TObject);
begin
  case Theme.ItemIndex of
    0: TMSFNCWXMathEditor1.VirtualKeyboardTheme := ktMaterial;
    1: TMSFNCWXMathEditor1.VirtualKeyboardTheme := ktApple;
    2: TMSFNCWXMathEditor1.VirtualKeyboardTheme := ktDevice;
  end;
end;

procedure TForm1.TMSFNCWXMathEditor1CaptureScreenshot(Sender: TObject;
  AScreenShot: TTMSFNCBitmap);
begin
  AScreenShot.SaveToFile('screenshot.png');
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

end.
