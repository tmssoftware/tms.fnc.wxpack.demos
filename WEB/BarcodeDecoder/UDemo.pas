unit UDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, VCL.TMSFNCWXBarcode, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXQRCode,
  WEBLib.ExtCtrls, VCL.TMSFNCWXCamera, VCL.TMSFNCCustomWEBComponent,
  VCL.TMSFNCWXBarcodeDecoder, VCL.TMSFNCWXQRDecoder;

type
  TForm1 = class(TWebForm)
    eanRBtn: TWebRadioButton;
    code128RBtn: TWebRadioButton;
    upcRBtn: TWebRadioButton;
    qrRBtn: TWebRadioButton;
    codaRBtn: TWebRadioButton;
    WebLabel2: TWebLabel;
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    WebPanel1: TWebPanel;
    decodeCamBtn: TWebButton;
    decodeImgBtn: TWebButton;
    WebLabel1: TWebLabel;
    WebMemo1: TWebMemo;
    TMSFNCWXQRDecoder1: TTMSFNCWXQRDecoder;
    TMSFNCWXBarcodeDecoder1: TTMSFNCWXBarcodeDecoder;
    WebOpenDialog1: TWebOpenDialog;
    procedure qrRBtnClick(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure TMSFNCWXBarcodeDecoder1Decoded(Sender: TObject; AFound: Boolean;
      AResult: string);
    procedure decodeCamBtnClick(Sender: TObject);
    [async]
    procedure decodeImgBtnClick(Sender: TObject);
  private
    { Private declarations }
    FCamDecode: Boolean;
    procedure SetControlsState(AEnable: Boolean);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SetControlsState(AEnable: Boolean);
begin
  decodeImgBtn.Enabled := AEnable;
  qrRBtn.Enabled := AEnable;
  code128Rbtn.Enabled := AEnable;
  upcRBtn.Enabled := AEnable;
  eanRBtn.Enabled := AEnable;
  codaRBtn.Enabled := AEnable;
end;

procedure TForm1.TMSFNCWXBarcodeDecoder1Decoded(Sender: TObject;
  AFound: Boolean; AResult: string);
begin
  WebMemo1.Text := AResult;
  if AFound and FCamDecode then
  begin
    TMSFNCWXCamera1.Stop;
    SetControlsState(True);
    FCamDecode := False;
    decodeCamBtn.Caption := 'Decode from camera';
  end;
end;

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  FCamDecode := False;
end;

procedure TForm1.decodeCamBtnClick(Sender: TObject);
begin
  if not FCamDecode then
  begin
    decodeCamBtn.Caption := 'Stop camera';
    TMSFNCWXCamera1.Start;
    FCamDecode := True;
    SetControlsState(False);
  end
  else
  begin
    decodeCamBtn.Caption := 'Decode from camera';
    TMSFNCWXCamera1.Stop;
    FCamDecode := False;
    SetControlsState(True);
  end;
end;

procedure TForm1.decodeImgBtnClick(Sender: TObject);
var
  res: boolean;
  imgData: string;
begin
  res := await(Boolean, WebOpenDialog1.Perform);
  if res then
  begin
    imgData := await(string, WebOpenDialog1.Files[0].FileAsBase64);
    console.log(imgData);
    if qrRBtn.Checked then
      TMSFNCWXQRDecoder1.DecodeFromBase64(imgData)
    else
      TMSFNCWXBarcodeDecoder1.DecodeFromBase64(imgData);
  end;
end;

procedure TForm1.qrRBtnClick(Sender: TObject);
var
  clickedRBtn: Integer;
begin
  clickedRBtn := (Sender as TRadioButton).Tag;

  if clickedRBtn = 100 then
  begin
    TMSFNCWXBarcodeDecoder1.Camera := nil;
    TMSFNCWXQRDecoder1.Camera := TMSFNCWXCamera1;
  end
  else
  begin
    TMSFNCWXQRDecoder1.Camera := nil;
    TMSFNCWXBarcodeDecoder1.Camera := TMSFNCWXCamera1;
    case clickedRBtn of
      101: TMSFNCWXBarcodeDecoder1.BarcodeType := bdtCode128;
      102: TMSFNCWXBarcodeDecoder1.BarcodeType := bdtUPC;
      103: TMSFNCWXBarcodeDecoder1.BarcodeType := bdtEAN;
      104: TMSFNCWXBarcodeDecoder1.BarcodeType := bdtCodabar;
    end;
  end;
end;

end.