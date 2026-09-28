unit UDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls, VCL.TMSFNCWXQRCode,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXBarcode, Vcl.ExtCtrls, VCL.TMSFNCWXCamera,
  VCL.TMSFNCWXQRDecoder, VCL.TMSFNCCustomWEBComponent,
  VCL.TMSFNCWXBarcodeDecoder;

type
  TForm2 = class(TForm)
    Label2: TLabel;
    qrRBtn: TRadioButton;
    code128RBtn: TRadioButton;
    upcRBtn: TRadioButton;
    eanRBtn: TRadioButton;
    codaRBtn: TRadioButton;
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    Panel1: TPanel;
    decodeCamBtn: TButton;
    decodeImgBtn: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    TMSFNCWXBarcodeDecoder1: TTMSFNCWXBarcodeDecoder;
    TMSFNCWXQRDecoder1: TTMSFNCWXQRDecoder;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure qrRBtnClick(Sender: TObject);
    procedure TMSFNCWXBarcodeDecoder1Decoded(Sender: TObject; AFound: Boolean;
      AResult: string);
    procedure decodeCamBtnClick(Sender: TObject);
    procedure decodeImgBtnClick(Sender: TObject);
  private
    { Private declarations }
    FCamDecode: Boolean;
    procedure SetControlsState(AEnable: Boolean);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.decodeCamBtnClick(Sender: TObject);
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

procedure TForm2.decodeImgBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if qrRBtn.Checked then
      TMSFNCWXQRDecoder1.DecodeFromFile(OpenDialog1.FileName)
    else
      TMSFNCWXBarcodeDecoder1.DecodeFromFile(OpenDialog1.FileName);
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FCamDecode := False;
end;

procedure TForm2.qrRBtnClick(Sender: TObject);
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

procedure TForm2.SetControlsState(AEnable: Boolean);
begin
  decodeImgBtn.Enabled := AEnable;
  qrRBtn.Enabled := AEnable;
  code128Rbtn.Enabled := AEnable;
  upcRBtn.Enabled := AEnable;
  eanRBtn.Enabled := AEnable;
  codaRBtn.Enabled := AEnable;
end;

procedure TForm2.TMSFNCWXBarcodeDecoder1Decoded(Sender: TObject;
  AFound: Boolean; AResult: string);
begin
  Memo1.Text := AResult;
  if AFound and FCamDecode then
  begin
    TMSFNCWXCamera1.Stop;
    SetControlsState(True);
    FCamDecode := False;
    decodeCamBtn.Caption := 'Decode from camera';
  end;
end;

end.
