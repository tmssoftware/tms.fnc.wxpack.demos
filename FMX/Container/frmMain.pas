unit frmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXContainer, FMX.StdCtrls, FMX.Controls.Presentation, JSON;

type
  TForm6 = class(TForm)
    TMSFNCWXContainer1: TTMSFNCWXContainer;
    Previous: TButton;
    Next: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    procedure PreviousClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure TMSFNCWXContainer1ControlInitialized(Sender: TObject);
    procedure TMSFNCWXContainer1CustomEvent(Sender: TObject;
      AEventData: TTMSFNCCustomWEBControlEventData);
    procedure TMSFNCWXContainer1ElementContainers1Actions0Execute(
      Sender: TObject; AEventData: TTMSFNCCustomWEBControlEventData);
    procedure TMSFNCWXContainer1ElementContainers1Actions1Execute(
      Sender: TObject; AEventData: TTMSFNCCustomWEBControlEventData);
  private
    { Private declarations }
    FCycling: Boolean;
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.PreviousClick(Sender: TObject);
begin
  TMSFNCWXContainer1.ExecuteJavaScript('$(''.carousel'').carousel(''prev'')');
end;

procedure TForm6.NextClick(Sender: TObject);
begin
  TMSFNCWXContainer1.ExecuteJavaScript('$(''.carousel'').carousel(''next'')');
end;

procedure TForm6.TMSFNCWXContainer1ControlInitialized(Sender: TObject);
begin
  TMSFNCWXContainer1.ExecuteJavaScript('InitCarousel()');
end;

procedure TForm6.TMSFNCWXContainer1CustomEvent(Sender: TObject;
  AEventData: TTMSFNCCustomWEBControlEventData);
var
  JSON: TJSONValue;
begin
  JSON := TTMSFNCUtils.ParseJSON(AEventData.CustomData);
  Label1.Text := 'Slide ' + IntToStr(TTMSFNCUtils.GetJSONValueAsInteger(TTMSFNCUtils.GetJSONValue(JSON, 'to'))+1);
end;

procedure TForm6.TMSFNCWXContainer1ElementContainers1Actions0Execute(
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

procedure TForm6.TMSFNCWXContainer1ElementContainers1Actions1Execute(
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
