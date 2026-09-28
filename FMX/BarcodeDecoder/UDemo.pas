unit UDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.TMSFNCWXBarcode,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXQRCode, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.TMSFNCWXCamera, FMX.TMSFNCWXQRDecoder, FMX.TMSFNCCustomWEBComponent,
  FMX.TMSFNCWXBarcodeDecoder;

type
  TForm2 = class(TForm)
    qrRBtn: TRadioButton;
    code128Rbtn: TRadioButton;
    upcRBtn: TRadioButton;
    eanRBtn: TRadioButton;
    codaRBtn: TRadioButton;
    Label1: TLabel;
    TMSFNCWXBarcodeDecoder1: TTMSFNCWXBarcodeDecoder;
    TMSFNCWXQRDecoder1: TTMSFNCWXQRDecoder;
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    decodeCamBtn: TButton;
    decodeImgBtn: TButton;
    Panel1: TPanel;
    Label2: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    procedure RadioBtnClick(Sender: TObject);
    procedure decodeCamBtnClick(Sender: TObject);
    procedure TMSFNCWXBarcodeDecoder1Decoded(Sender: TObject; AFound: Boolean;
      AResult: string);
    procedure FormCreate(Sender: TObject);
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

{$R *.fmx}

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
    decodeCamBtn.Text := 'Decode from camera';
  end;
end;

procedure TForm2.decodeCamBtnClick(Sender: TObject);
begin
  if not FCamDecode then
  begin
    decodeCamBtn.Text := 'Stop camera';
    TMSFNCWXCamera1.Start;
    FCamDecode := True;
    SetControlsState(False);
  end
  else
  begin
    decodeCamBtn.Text := 'Decode from camera';
    TMSFNCWXCamera1.Stop;
    FCamDecode := False;
    SetControlsState(True);
  end;
end;

procedure TForm2.decodeImgBtnClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if qrRBtn.IsChecked then
      TMSFNCWXQRDecoder1.DecodeFromFile(OpenDialog1.FileName)
    else
      TMSFNCWXBarcodeDecoder1.DecodeFromFile(OpenDialog1.FileName);
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FCamDecode := False;
end;

procedure TForm2.RadioBtnClick(Sender: TObject);
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
