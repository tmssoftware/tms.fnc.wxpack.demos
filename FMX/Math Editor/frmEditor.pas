unit frmEditor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.ListBox, FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser,
  FMX.TMSFNCCustomWEBControl, FMX.TMSFNCWXMathEditor, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Menus, FMX.ExtCtrls, FMX.Layouts;

type
  TForm6 = class(TForm)
    TMSFNCWXMathEditor1: TTMSFNCWXMathEditor;
    Panel1: TPanel;
    Keyboards: TGroupBox;
    KeyboardTheme: TGroupBox;
    Numeric: TCheckBox;
    Roman: TCheckBox;
    Greek: TCheckBox;
    Functions: TCheckBox;
    Symbols: TCheckBox;
    LaTeX: TCheckBox;
    Apple: TRadioButton;
    Material: TRadioButton;
    Device: TRadioButton;
    KeyboardMode: TComboBox;
    Label1: TLabel;
    ExportFormat: TComboBox;
    Label2: TLabel;
    Download: TButton;
    Undo: TButton;
    Redo: TButton;
    Snapshot: TButton;
    procedure ASCIIMathFormatClick(Sender: TObject);
    procedure LaTexExpandFormatClick(Sender: TObject);
    procedure LaTexFormatClick(Sender: TObject);
    procedure MathMLFormatClick(Sender: TObject);
    procedure SpokenFormatClick(Sender: TObject);
    procedure SpokenSSMLFormatClick(Sender: TObject);
    procedure SpokenSSMLWithHighlightingFormatClick(Sender: TObject);
    procedure SpokenTextFormatClick(Sender: TObject);
    procedure TMSFNCWXMathEditor1GetMath(Sender: TObject; AResultString: string;
      AResultFormat: TTMSFNCWXMathFormat);
    procedure RedoClick(Sender: TObject);
    procedure UndoClick(Sender: TObject);
    procedure AutoModeClick(Sender: TObject);
    procedure ManualModeClick(Sender: TObject);
    procedure OffModeClick(Sender: TObject);
    procedure OnFocusModeClick(Sender: TObject);
    procedure NumericChange(Sender: TObject);
    procedure RomanChange(Sender: TObject);
    procedure GreekChange(Sender: TObject);
    procedure FunctionsChange(Sender: TObject);
    procedure SymbolsChange(Sender: TObject);
    procedure LaTeXChange(Sender: TObject);
    procedure AppleChange(Sender: TObject);
    procedure DeviceChange(Sender: TObject);
    procedure MaterialChange(Sender: TObject);
    procedure KeyboardModeChange(Sender: TObject);
    procedure DownloadClick(Sender: TObject);
    procedure SnapshotClick(Sender: TObject);
    procedure TMSFNCWXMathEditor1CaptureScreenshot(Sender: TObject;
      AScreenShot: TTMSFNCBitmap);
  private
    { Private declarations }
    Checked: TTMSFNCWXMathVirtualKeyboards;
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.AppleChange(Sender: TObject);
begin
  if Apple.IsChecked then
     TMSFNCWXMathEditor1.VirtualKeyboardTheme := ktApple;
end;

procedure TForm6.ASCIIMathFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfASCIIMath;
end;

procedure TForm6.AutoModeClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardMode := kmAuto;
end;

procedure TForm6.DeviceChange(Sender: TObject);
begin
  if Device.IsChecked then
     TMSFNCWXMathEditor1.VirtualKeyboardTheme := ktDevice;
end;

procedure TForm6.DownloadClick(Sender: TObject);
begin
   TMSFNCWXMathEditor1.GetMath(TTMSFNCWXMathFormat(ExportFormat.ItemIndex));
end;


procedure TForm6.FunctionsChange(Sender: TObject);
begin
  if Functions.isChecked then
    Include(Checked, vkFunctions)
   else
    Exclude(Checked, vkFunctions);

    TMSFNCWXMathEditor1.VirtualKeyboards := Checked;
end;

procedure TForm6.GreekChange(Sender: TObject);
begin
  if Greek.isChecked then
    Include(Checked, vkGreek)
   else
    Exclude(Checked, vkGreek);

    TMSFNCWXMathEditor1.VirtualKeyboards := Checked;
end;

procedure TForm6.KeyboardModeChange(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardMode := TTMSFNCWXMathVirtualKeyboardMode(KeyboardMode.ItemIndex);
end;

procedure TForm6.LaTeXChange(Sender: TObject);
begin
  if LaTex.isChecked then
    Include(Checked, vkLaTeX)
   else
    Exclude(Checked, vkLaTeX);

    TMSFNCWXMathEditor1.VirtualKeyboards := Checked;
end;

procedure TForm6.LaTexExpandFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfLaTeXExpanded;
end;

procedure TForm6.LaTexFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfLaTex;
end;

procedure TForm6.ManualModeClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardMode := kmManual;
end;

procedure TForm6.MaterialChange(Sender: TObject);
begin
  if Material.IsChecked then
   TMSFNCWXMathEditor1.VirtualKeyboardTheme := ktmaterial; 
end;

procedure TForm6.MathMLFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfMathMl;
end;

procedure TForm6.NumericChange(Sender: TObject);
begin
  if Numeric.isChecked then
    Include(Checked, vkNumeric)
   else
    Exclude(Checked, vkNumeric);

    TMSFNCWXMathEditor1.VirtualKeyboards := Checked;
end;

procedure TForm6.OffModeClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardMode := kmOff;
end;

procedure TForm6.OnFocusModeClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.VirtualKeyboardMode := kmOnFocus;
end;

procedure TForm6.RedoClick(Sender: TObject);
begin
 TMSFNCWXMathEditor1.Redo;
end;

procedure TForm6.RomanChange(Sender: TObject);
begin
  if Roman.isChecked then
    Include(Checked, vkRoman)
   else
    Exclude(Checked, vkRoman);

    TMSFNCWXMathEditor1.VirtualKeyboards := Checked;
end;

procedure TForm6.SnapshotClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.CaptureScreenShot;
end;

procedure TForm6.SpokenFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfSpoken;
end;

procedure TForm6.SpokenSSMLFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfSpokenSSML;
end;

procedure TForm6.SpokenSSMLWithHighlightingFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfSpokenSSMLWithHighlighting;
end;

procedure TForm6.SpokenTextFormatClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.MathFormat := mfSpokenText;
end;

procedure TForm6.SymbolsChange(Sender: TObject);
begin
  if Symbols.isChecked then
    Include(Checked, vkSymbols)
   else
    Exclude(Checked, vkSymbols);

    TMSFNCWXMathEditor1.VirtualKeyboards := Checked;
end;

procedure TForm6.TMSFNCWXMathEditor1CaptureScreenshot(Sender: TObject;
  AScreenShot: TTMSFNCBitmap);
begin
  AScreenshot.SaveToFile('screenshot.jpg');
end;

procedure TForm6.TMSFNCWXMathEditor1GetMath(Sender: TObject;
  AResultString: string; AResultFormat: TTMSFNCWXMathFormat);
var
  s: TStringList;
begin
  s := TStringList.Create;
  try
    s.Text := AResultString;
    s.SaveToFile('MathResult.txt');
  finally
    s.Free;
  end;

end;

procedure TForm6.UndoClick(Sender: TObject);
begin
  TMSFNCWXMathEditor1.Undo;
end;

end.
