unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXContainer,
  Vcl.ExtCtrls, Vcl.StdCtrls, JSON;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    TMSFNCWXContainer1: TTMSFNCWXContainer;
    Previous: TButton;
    Next: TButton;
    ImageIndex: TLabel;
    OpenDialog1: TOpenDialog;
    procedure PreviousClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure TMSFNCWXContainer1ControlInitialized(Sender: TObject);
    procedure TMSFNCWXContainer1CustomEvent(Sender: TObject;
      AEventData: TTMSFNCCustomWEBControlEventData);
    procedure TMSFNCWXContainer1ElementContainers0Actions0Execute(
      Sender: TObject; AEventData: TTMSFNCCustomWEBControlEventData);
    procedure TMSFNCWXContainer1ElementContainers0Actions1Execute(
      Sender: TObject; AEventData: TTMSFNCCustomWEBControlEventData);
  private
    { Private declarations }
    FCycling: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.NextClick(Sender: TObject);
begin
  TMSFNCWXContainer1.ExecuteJavaScript('$(''.carousel'').carousel(''next'')');
end;

procedure TForm1.PreviousClick(Sender: TObject);
begin
  TMSFNCWXContainer1.ExecuteJavaScript('$(''.carousel'').carousel(''prev'')');
end;

procedure TForm1.TMSFNCWXContainer1ControlInitialized(Sender: TObject);
begin
  TMSFNCWXContainer1.ExecuteJavaScript('InitCarousel()');
end;

procedure TForm1.TMSFNCWXContainer1CustomEvent(Sender: TObject;
  AEventData: TTMSFNCCustomWEBControlEventData);
var
  JSON: TJSONValue;
begin
  JSON := TTMSFNCUtils.ParseJSON(AEventData.CustomData);
  ImageIndex.Caption := 'Slide ' + IntToStr(TTMSFNCUtils.GetJSONValueAsInteger(TTMSFNCUtils.GetJSONValue(JSON, 'to'))+1);
end;

procedure TForm1.TMSFNCWXContainer1ElementContainers0Actions0Execute(
  Sender: TObject; AEventData: TTMSFNCCustomWEBControlEventData);
var
  img: String;
begin
  if OpenDialog1.Execute then
  begin
    img := 'data:png;base64,' + TTMSFNCUtils.FileToBase64(OpenDialog1.Files[0]);
    TMSFNCWXContainer1.ExecuteJavaScript('AddImage("' + img + '")');
  end;
end;

procedure TForm1.TMSFNCWXContainer1ElementContainers0Actions1Execute(
  Sender: TObject; AEventData: TTMSFNCCustomWEBControlEventData);
begin
  if not FCycling then
  begin
    TMSFNCWXContainer1.ExecuteJavaScript('$(''.carousel'').carousel(''cycle'')');
    FCycling := true;
  end
  else
  begin
    TMSFNCWXContainer1.ExecuteJavaScript('$(''.carousel'').carousel(''pause'')');
    FCycling := false;
  end;
end;

end.
