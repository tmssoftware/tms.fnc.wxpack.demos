unit UBL;

interface

uses
  {$IFDEF VCL}
  Classes, SysUtils, Generics.Collections, VCL.Controls, Types, VCL.Forms, VCL.StdCtrls, UITypes, VCL.TMSFNCTypes, VCL.TMSFNCBitmapContainer,
  VCL.TMSFNCImage, VCL.TMSFNCBitmapPicker, VCL.TMSFNCBitmapSelector, VCL.TMSFNCGraphics, VCL.TMSFNCPanel, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCRichEditor, VCL.TMSFNCRichEditorBase, VCL.TMSFNCPageControl, VCL.TMSFNCUtils, VCL.TMSFNCButton,
  VCL.TMSFNCTabSet, VCL.TMSFNCHTMLText, VCL.TMSFNCToolBar, VCL.TMSFNCStatusBar, VCL.TMSFNCRibbon, VCL.TMSFNCWXHTMLMemo;
  {$ENDIF}

  {$IFDEF FMX}
  Classes, SysUtils, Generics.Collections, FMX.Types, Types, FMX.Forms, IOUtils, UITypes, FMX.TMSFNCTypes, FMX.TMSFNCBitmapContainer, FMX.TMSFNCImage,
  FMX.TMSFNCBitmapPicker, FMX.TMSFNCBitmapSelector, FMX.TMSFNCGraphics, FMX.TMSFNCPanel, FMX.TMSFNCGraphicsTypes, FMX.TMSFNCCustomControl,
  FMX.TMSFNCPageControl, FMX.TMSFNCUtils, FMX.TMSFNCButton,
  FMX.TMSFNCTabSet, FMX.TMSFNCHTMLText, FMX.TMSFNCToolBar, FMX.TMSFNCStatusBar, FMX.TMSFNCRibbon, FMX.TMSFNCWXHTMLMemo;
  {$ENDIF}

  {$IFDEF WEBLIB}
  Web, JS, Classes, Contnrs, SysUtils, Types, WEBLib.Controls, WEBLib.Dialogs, WEBLib.Forms, WEBLib.TMSFNCTypes, WEBLib.TMSFNCBitmapContainer,
  WEBLib.TMSFNCImage, WEBLib.TMSFNCBitmapPicker, WEBLib.TMSFNCBitmapSelector, WEBLib.TMSFNCGraphics, WEBLib.TMSFNCPanel,
  WEBLib.TMSFNCGraphicsTypes, WEBLib.TMSFNCCustomControl, WEBLib.ExtCtrls, WEBLib.TMSFNCWXHTMLMemo, WEBLib.TMSFNCRibbon,
  WEBLib.TMSFNCButton, WEBLib.TMSFNCUtils, WEBLib.TMSFNCToolBar;
  {$ENDIF}

  {$IFDEF LCL}
  Classes, SysUtils, Controls, Types, Forms, StdCtrls, UITypes, LCLTMSFNCTypes, LCLTMSFNCBitmapContainer,
  LCLTMSFNCImage, LCLTMSFNCBitmapPicker, LCLTMSFNCBitmapSelector, LCLTMSFNCGraphics, LCLTMSFNCPanel, LCLTMSFNCGraphicsTypes,
  LCLTMSFNCCustomControl, LCLTMSFNCRichEditor, LCLTMSFNCRichEditorBase, LCLTMSFNCPageControl, LCLTMSFNCUtils, LCLTMSFNCButton,
  LCLTMSFNCTabSet, LCLTMSFNCHTMLText, LCLTMSFNCToolBar, LCLTMSFNCStatusBar, LCLTMSFNCRibbon, LCLTMSFNCWXHTMLMemo;
  {$ENDIF}

type
  THTMLMemoLogic = class
  private
    {$IFDEF FMX}
    FDialogTimer: TTimer;
    {$ENDIF}
    FForm: TCustomForm;
    FNCBitmapContainer: TTMSFNCBitmapContainer;
    HTMLMemo: TTMSFNCWXHTMLMemo;
    rb: TTMSFNCRibbon;
    fntp: TTMSFNCRibbonToolBarItemPicker;
    fntSize: TTMSFNCRibbonToolBarItemPicker;
    btnBold: TTMSFNCRibbonToolBarButton;
    btnItalic: TTMSFNCRibbonToolBarButton;
    btnUnderline: TTMSFNCRibbonToolBarButton;
    btnStrikeout: TTMSFNCRibbonToolBarButton;
    PnlFile: TTMSFNCPanel;
    btnload: TTMSFNCButton;
    btnsave: TTMSFNCButton;
    {$IFDEF WEBLIB}
    openDlg: TWebOpenDialog;
    [async]
    procedure DoBtLoadClick(Sender: TObject);
    {$ENDIF}
    {$IFNDEF WEBLIB}
    procedure DoBtLoadClick(Sender: TObject);
    {$ENDIF}
    {$IFDEF FMX}
    procedure DoOpenDialogTimer(Sender: TObject);
    procedure DoSaveDialogTimer(Sender: TObject);
    {$ENDIF}
    procedure DoBtSaveClick(Sender: TObject);
    procedure DoButtonClick(Sender: TObject);
    procedure DoAlignLeftClick(Sender: TObject);
    procedure DoAlignCenterClick(Sender: TObject);
    procedure DoAlignRightClick(Sender: TObject);
    procedure DoUndoClick(Sender: TObject);
    procedure DoRedoClick(Sender: TObject);
    procedure DoBoldClick(Sender: TObject);
    procedure DoItalicClick(Sender: TObject);
    procedure DoUnderlineClick(Sender: TObject);
    procedure DoStrikeoutClick(Sender: TObject);
    procedure DoFileButtonClick(Sender: TObject);
    procedure DoFontNameSelected(Sender: TObject; AItemIndex: Integer);
    procedure DoFontSizeSelected(Sender: TObject; AItemIndex: Integer);
    procedure HTMLMemoStyleTextUpdate(Sender: TObject; IsBold,
      IsItalic, IsUnderline, IsStrikeThrough: Boolean; FontName: string; FontSize:Integer;
      ForeColor, BackColor: TTMSFNCGraphicsColor);
  public
    destructor Destroy; override;
    procedure InitHTMLMemo(AForm: TCustomForm; AFNCBitmapContainer: TTMSFNCBitmapContainer);
    procedure InitRibbon;
    procedure InitHTMLMemoComponent;
  end;

const
  HTMLMEMODEFAULTTEXT =
  '<p style="text-align: left;">This is sample <span style="background-color: rgb(255, 156, 0);"><font color="#0000ff">formatted' +
  '</font></span> text with <b>bold</b>, <i>italic</i>, <u>underline</u>, <strike>strikethrough</strike></p><p style="text-align' +
  ': left;">You can also insert <a href="https://tmssoftware.com" target="_blank">hyperlinks</a>, images and many more!</p><p><i' +
  'mg src="data:image/png;base64,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" style="width: 20' +
  '0px; float: left;" data-filename="TMS_FAVICON_RGB_low.png" class="note-float-left"><strike><br></strike></p>';

implementation

destructor THTMLMemoLogic.Destroy;
begin
  {$IFDEF WEBLIB}
  openDlg.Free;
  {$ENDIF}
  inherited;
end;

procedure THTMLMemoLogic.InitHTMLMemo(AForm: TCustomForm; AFNCBitmapContainer: TTMSFNCBitmapContainer);
begin
  FForm := AForm;
  {$IFDEF WEBLIB}
  openDlg := TWebOpenDialog.Create(FForm);
  {$ENDIF}
  FNCBitmapContainer := AFNCBitmapContainer;
  {$IFDEF FMX}
  FForm.BorderStyle := TFmxFormBorderStyle.None;
  {$ENDIF}
  {$IFDEF LCL}
  FForm.BorderStyle := bsNone;
  {$ENDIF}
  {$IFDEF VCL}
  FForm.BorderStyle := bsNone;
  {$ENDIF}
  InitRibbon;
  InitHTMLMemoComponent;
end;

procedure THTMLMemoLogic.InitHTMLMemoComponent;
begin
  HTMLMemo := TTMSFNCWXHTMLMemo.Create(FForm);
  HTMLMemo.Toolbar.Visible := False;
  {$IFDEF VCL}
  HTMLMemo.Align := TAlign.alClient;
  {$ENDIF}
  {$IFDEF FMX}
  HTMLMemo.Align := TAlignLayout.Client;
  {$ENDIF}
  {$IFDEF WEBLIB}
  HTMLMemo.Align := TAlign.alClient;
  {$ENDIF}
  {$IFDEF LCL}
  HTMLMemo.Align := TAlign.alClient;
  {$ENDIF}
  HTMLMemo.OnStyleTextUpdate := {$IFDEF LCL}@{$ENDIF}HTMLMemoStyleTextUpdate;
  HTMLMemo.HTML.Text := HTMLMEMODEFAULTTEXT;
  HTMLMemo.Parent := FForm;
end;

procedure THTMLMemoLogic.InitRibbon;
var
  tb: TTMSFNCRibbonToolBar;
  btn: TTMSFNCRibbonToolBarButton;
begin
  rb := TTMSFNCRibbon.Create(FForm);
  rb.Parent := FForm;
  {$IFDEF VCL}
  rb.Align := TAlign.altop;
  {$ENDIF}
  {$IFDEF FMX}
  rb.Align := TAlignLayout.top;
  {$ENDIF}
  {$IFDEF WEBLIB}
  rb.Align := TAlign.altop;
  rb.Mode := rmPageControlOnly;
  {$ENDIF}
  {$IFDEF LCL}
  rb.Align := TAlign.altop;
  {$ENDIF}
  rb.Rebuild;

  rb.PageControl.Collapsable := True;
  rb.PageControl.Pages.Clear;
  rb.PageControl.AddPage('Home').ShortCutHint := 'H';

  tb := rb.PageControl.PageContainers[0].AddToolBar('Alignment');
  tb.ShortCutHint := 'A';
  TTMSFNCUtils.SetFontSize(tb.Font, 11);

  btn := tb.AddButton;
  btn.Text := 'Align Left';
  btn.Layout := bblLabel;
  btn.MaximumLayout := bblLabel;
  btn.BitmapContainer := FNCBitmapContainer;
  btn.Bitmaps.AddBitmapName('Align-Left.png');
  btn.LargeLayoutBitmaps.AddBitmapName('Align-Left_LARGE.png');
  btn.OnClick := {$IFDEF LCL}@{$ENDIF}DoAlignLeftClick;
  btn.AutoBitmapSize := True;
  btn.LargeLayoutAutoBitmapSize := True;
  btn.ShortCutHint := 'AL';

  btn := tb.AddButton;
  btn.Text := 'Align Center';
  btn.Layout := bblLabel;
  btn.MaximumLayout := bblLabel;
  btn.BitmapContainer := FNCBitmapContainer;
  btn.Bitmaps.AddBitmapName('Align-Center.png');
  btn.LargeLayoutBitmaps.AddBitmapName('Align-Center_LARGE.png');
  btn.OnClick := {$IFDEF LCL}@{$ENDIF}DoAlignCenterClick;
  btn.AutoBitmapSize := True;
  btn.LargeLayoutAutoBitmapSize := True;
  btn.ShortCutHint := 'AC';

  btn := tb.AddButton;
  btn.Text := 'Align Right';
  btn.Layout := bblLabel;
  btn.MaximumLayout := bblLabel;
  btn.BitmapContainer := FNCBitmapContainer;
  btn.Bitmaps.AddBitmapName('Align-Right.png');
  btn.LargeLayoutBitmaps.AddBitmapName('Align-Right_LARGE.png');
  btn.OnClick := {$IFDEF LCL}@{$ENDIF}DoAlignRightClick;
  btn.AutoBitmapSize := True;
  btn.LargeLayoutAutoBitmapSize := True;
  btn.ShortCutHint := 'AR';

  tb := rb.PageControl.PageContainers[0].AddToolBar('Font');
  tb.ShortCutHint := 'F';
  TTMSFNCUtils.SetFontSize(tb.Font, 11);

  fntp := tb.AddItemPicker;
  fntp.OnItemSelected := {$IFDEF LCL}@{$ENDIF}DoFontNameSelected;
  fntp.Items.Add('Arial');
  fntp.Items.Add('Arial Black');
  fntp.Items.Add('Comic Sans MS');
  fntp.Items.Add('Courrier New');
  fntp.Items.Add('Helvetica');
  fntp.Items.Add('Impact');
  fntp.Items.Add('Tahoma');
  fntp.Items.Add('Times New Roman');
  fntp.Items.Add('Verdana');
  fntp.SelectedItemIndex := 0;
  fntp.Width := fntp.Width + 20;

  fntSize := tb.AddItemPicker;
  fntSize.OnItemSelected := {$IFDEF LCL}@{$ENDIF}DoFontSizeSelected;
  fntSize.Items.Add('8');
  fntSize.Items.Add('9');
  fntSize.Items.Add('10');
  fntSize.Items.Add('11');
  fntSize.Items.Add('12');
  fntSize.Items.Add('14');
  fntSize.Items.Add('18');
  fntSize.Items.Add('24');
  fntSize.Items.Add('36');
  fntSize.SelectedItemIndex := 0;
  fntSize.Width := fntSize.Width + 20;

  btnBold := tb.AddButton;
  btnBold.BitmapContainer := FNCBitmapContainer;
  btnBold.Bitmaps.AddBitmapName('Bold.png');
  btnBold.Width := 30;
  btnBold.Height := 30;
  btnBold.OnClick := {$IFDEF LCL}@{$ENDIF}DoBoldClick;
  btnBold.ShortCutHint := 'B';

  btnItalic := tb.AddButton;
  btnItalic.BitmapContainer := FNCBitmapContainer;
  btnItalic.Bitmaps.AddBitmapName('Italic.png');
  btnItalic.Width := 30;
  btnItalic.Height := 30;
  btnItalic.OnClick := {$IFDEF LCL}@{$ENDIF}DoItalicClick;
  btnItalic.ShortCutHint := 'I';

  btnUnderline := tb.AddButton;
  btnUnderline.BitmapContainer := FNCBitmapContainer;
  btnUnderline.Bitmaps.AddBitmapName('Underline.png');
  btnUnderline.Width := 30;
  btnUnderline.Height := 30;
  btnUnderline.OnClick := {$IFDEF LCL}@{$ENDIF}DoUnderlineClick;
  btnUnderline.ShortCutHint := 'U';

  btnStrikeout := tb.AddButton;
  btnStrikeout.BitmapContainer := FNCBitmapContainer;
  btnStrikeout.Bitmaps.AddBitmapName('Strikeout.png');
  btnStrikeout.Width := 30;
  btnStrikeout.Height := 30;
  btnStrikeout.OnClick := {$IFDEF LCL}@{$ENDIF}DoStrikeoutClick;
  btnStrikeout.ShortCutHint := 'K';

  tb := rb.PageControl.PageContainers[0].AddToolBar('State');
  tb.ShortCutHint := 'S';
  TTMSFNCUtils.SetFontSize(tb.Font, 11);

  btn := tb.AddButton;
  btn.Text := 'Undo';
  btn.Layout := bblLarge;
  btn.BitmapContainer := FNCBitmapContainer;
  btn.Bitmaps.AddBitmapName('Undo.png');
  btn.LargeLayoutBitmaps.AddBitmapName('Undo_LARGE.png');
  btn.OnClick := {$IFDEF LCL}@{$ENDIF}DoUndoClick;
  btn.AutoBitmapSize := True;
  btn.LargeLayoutAutoBitmapSize := True;
  btn.ShortCutHint := 'UD';

  btn := tb.AddButton;
  btn.Text := 'Redo';
  btn.Layout := bblLarge;
  btn.BitmapContainer := FNCBitmapContainer;
  btn.Bitmaps.AddBitmapName('Redo.png');
  btn.LargeLayoutBitmaps.AddBitmapName('Redo_LARGE.png');
  btn.OnClick := {$IFDEF LCL}@{$ENDIF}DoRedoClick;
  btn.AutoBitmapSize := True;
  btn.LargeLayoutAutoBitmapSize := True;
  btn.ShortCutHint := 'RD';

  tb := rb.PageControl.PageContainers[0].AddToolBar('Insert');
  tb.ShortCutHint := 'I';
  TTMSFNCUtils.SetFontSize(tb.Font, 11);

  btn := tb.AddButton;
  btn.Text := 'Image';
  btn.Layout := bblLarge;
  btn.BitmapContainer := FNCBitmapContainer;
  btn.Bitmaps.AddBitmapName('Image.png');
  btn.LargeLayoutBitmaps.AddBitmapName('Image_LARGE.png');
  btn.OnClick := {$IFDEF LCL}@{$ENDIF}DoButtonClick;
  btn.AutoBitmapSize := True;
  btn.LargeLayoutAutoBitmapSize := True;
  btn.ShortCutHint := 'I';

  btn := tb.AddButton;
  btn.Text := 'Link';
  btn.Layout := bblLarge;
  btn.BitmapContainer := FNCBitmapContainer;
  btn.Bitmaps.AddBitmapName('Internet Link.png');
  btn.LargeLayoutBitmaps.AddBitmapName('Internet Link_LARGE.png');
  btn.OnClick := {$IFDEF LCL}@{$ENDIF}DoButtonClick;
  btn.AutoBitmapSize := True;
  btn.LargeLayoutAutoBitmapSize := True;
  btn.ShortCutHint := 'I';

  PnlFile := TTMSFNCPanel.Create(FForm);
  PnlFile.Header.Visible := False;
  PnlFile.Parent := FForm;
  PnlFile.Width := 200;
  PnlFile.Height := 100;

  btnload := TTMSFNCButton.Create(FForm);
  btnload.Parent := PnlFile;
  btnload.Height := 50;
  btnload.Text := 'Load File';
  {$IFDEF VCL}
  btnload.Align := TAlign.altop;
  {$ENDIF}
  {$IFDEF FMX}
  btnload.Align := TAlignLayout.top;
  {$ENDIF}
  {$IFDEF WEBLIB}
  btnload.Align := TAlign.altop;
  {$ENDIF}
  {$IFDEF LCL}
  btnload.Align := TAlign.altop;
  {$ENDIF}
  btnload.OnClick := {$IFDEF LCL}@{$ENDIF}DoBtLoadClick;

  btnsave := TTMSFNCButton.Create(FForm);
  btnsave.Parent := PnlFile;
  btnsave.Height := 50;
  btnsave.Text := 'Save File';
  {$IFDEF VCL}
  btnsave.Align := TAlign.altop;
  {$ENDIF}
  {$IFDEF FMX}
  btnsave.Align := TAlignLayout.top;
  {$ENDIF}
  {$IFDEF WEBLIB}
  btnsave.Align := TAlign.altop;
  {$ENDIF}
  {$IFDEF LCL}
  btnsave.Align := TAlign.altop;
  {$ENDIF}
  btnsave.OnClick := {$IFDEF LCL}@{$ENDIF}DoBtSaveClick;

  rb.PageControl.FileButton.OnClick := {$IFDEF LCL}@{$ENDIF}DoFileButtonClick;
  rb.PageControl.FileButton.DropDownControl :=  PnlFile;

  rb.ApplyTheme;
end;

procedure THTMLMemoLogic.DoAlignCenterClick(Sender: TObject);
begin
  HTMLMemo.JustifyCenter;
end;

procedure THTMLMemoLogic.DoAlignLeftClick(Sender: TObject);
begin
  HTMLMemo.JustifyLeft;
end;

procedure THTMLMemoLogic.DoAlignRightClick(Sender: TObject);
begin
  HTMLMemo.JustifyRight;
end;

procedure THTMLMemoLogic.DoBoldClick(Sender: TObject);
begin
  HTMLMemo.TextBold;
end;

procedure THTMLMemoLogic.DoBtLoadClick(Sender: TObject);
var
  {$IFNDEF WEBLIB}
  FileName: string;
  {$ENDIF}
  {$IFDEF WEBLIB}
  res: Boolean;
  txt: string;
  {$ENDIF}
begin
  {$IFNDEF WEBLIB}
  {$IFNDEF FMX}
  if TTMSFNCUtils.SelectFile(FileName, '', 'HTML files |*.html') then
    HTMLMemo.HTML.LoadFromFile(FileName);
  {$ENDIF}
  {$IFDEF FMX}
  FDialogTimer := TTimer.Create(Application);
  FDialogTimer.Interval := 1;
  FDialogTimer.OnTimer := DoOpenDialogTimer;
  rb.PageControl.FileButton.GetPopupControl.IsOpen := False;
  FDialogTimer.Enabled := True;
  {$ENDIF}
  {$ENDIF}
  {$IFDEF WEBLIB}
  res := await(Boolean, openDlg.Perform);
  if res then
  begin
    txt := await(string, openDlg.Files[0].FileAsText);
    HTMLMemo.HTML.Text := txt;
  end;
  {$ENDIF}
end;

{$IFDEF FMX}
procedure THTMLMemoLogic.DoOpenDialogTimer(Sender: TObject);
var
  FileName: string;
begin
  FDialogTimer.Enabled := False;
  if TTMSFNCUtils.SelectFile(FileName, '', 'HTML files |*.html') then
    HTMLMemo.HTML.LoadFromFile(FileName);
end;

procedure THTMLMemoLogic.DoSaveDialogTimer(Sender: TObject);
var
  FileName: string;
begin
  FDialogTimer.Enabled := False;
  FileName := 'HTMLMemoDemo.html';
  if TTMSFNCUtils.SaveFile(FileName) then
  begin
    HTMLMemo.HTML.SaveToFile(FileName);
  end;
end;
{$ENDIF}

procedure THTMLMemoLogic.DoBtSaveClick(Sender: TObject);
{$IFNDEF FMX}
var
  FileName: string;
{$ENDIF}
begin
  {$IFNDEF FMX}
  FileName := 'HTMLMemoDemo.html';
  if TTMSFNCUtils.SaveFile(FileName) then
  begin
    HTMLMemo.HTML.SaveToFile(FileName);
  end;
  {$ENDIF}
  {$IFDEF FMX}
  FDialogTimer := TTimer.Create(Application);
  FDialogTimer.Interval := 1;
  FDialogTimer.OnTimer := DoSaveDialogTimer;
  rb.PageControl.FileButton.GetPopupControl.IsOpen := False;
  FDialogTimer.Enabled := True;
  {$ENDIF}
end;

procedure THTMLMemoLogic.DoButtonClick(Sender: TObject);
begin
  if Sender is TTMSFNCRibbonToolBarButton then
    TTMSFNCUtils.Message((Sender as TTMSFNCRibbonToolBarButton).Text + ' Clicked !');
end;


procedure THTMLMemoLogic.DoFileButtonClick(Sender: TObject);
begin
  rb.PageControl.FileButton.DropDown;
end;

procedure THTMLMemoLogic.DoFontNameSelected(Sender: TObject; AItemIndex: Integer);
begin
  HTMLMemo.SetFontName((Sender as TTMSFNCRibbonToolBarItemPicker).Items[AItemIndex]);
end;

procedure THTMLMemoLogic.DoFontSizeSelected(Sender: TObject; AItemIndex: Integer);
begin
  HTMLMemo.SetFontSize(strtoint((Sender as TTMSFNCRibbonToolBarItemPicker).Items[AItemIndex]));
end;

procedure THTMLMemoLogic.DoItalicClick(Sender: TObject);
begin
  HTMLMemo.TextItalic;
end;

procedure THTMLMemoLogic.DoRedoClick(Sender: TObject);
begin
  HTMLMemo.Redo;
end;

procedure THTMLMemoLogic.DoStrikeoutClick(Sender: TObject);
begin
  HTMLMemo.TextStrikeThrough;
end;

procedure THTMLMemoLogic.DoUnderlineClick(Sender: TObject);
begin
  HTMLMemo.TextUnderline;
end;

procedure THTMLMemoLogic.DoUndoClick(Sender: TObject);
begin
  HTMLMemo.Undo;
end;

procedure THTMLMemoLogic.HTMLMemoStyleTextUpdate(Sender: TObject;
  IsBold, IsItalic, IsUnderline, IsStrikeThrough: Boolean; FontName: string; FontSize:Integer;
  ForeColor, BackColor: TTMSFNCGraphicsColor);
var
  i: Integer;
begin
  btnBold.DownState := IsBold;
  btnItalic.DownState := IsItalic;
  btnUnderline.DownState := IsUnderline;
  btnStrikeout.DownState := IsStrikeThrough;
  i := fntp.Items.IndexOf(FontName);
  if i >= 0 then
    fntp.SelectedItemIndex := i;
  i := fntSize.Items.IndexOf(IntToStr(FontSize));
  if i >= 0 then
    fntSize.SelectedItemIndex := i;
end;

end.
