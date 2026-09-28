unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLTMSFNCWXBarcode, LCLTMSFNCWXQRCode, LCLTMSFNCWXCamera,
  LCLTMSFNCWXBarcodeDecoder, LCLTMSFNCWXQRDecoder;

type

  { TForm1 }

  TForm1 = class(TForm)
    decodeCamBtn: TButton;
    decodeImgBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    qrRBtn: TRadioButton;
    code128RBtn: TRadioButton;
    TMSFNCWXBarcodeDecoder1: TTMSFNCWXBarcodeDecoder;
    TMSFNCWXQRDecoder1: TTMSFNCWXQRDecoder;
    upcRBtn: TRadioButton;
    eanRBtn: TRadioButton;
    codaRBtn: TRadioButton;
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    procedure decodeCamBtnClick(Sender: TObject);
    procedure decodeImgBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrRBtnClick(Sender: TObject);
    procedure TMSFNCWXBarcodeDecoder1Decoded(Sender: TObject; AFound: Boolean;
      AResult: string);
  private
    FCamDecode: Boolean;
    procedure SetControlsState(AEnable: Boolean);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
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
begin
  if OpenDialog1.Execute then
  begin
    if qrRBtn.Checked then
      TMSFNCWXQRDecoder1.DecodeFromFile(OpenDialog1.FileName)
    else
      TMSFNCWXBarcodeDecoder1.DecodeFromFile(OpenDialog1.FileName);
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

procedure TForm1.TMSFNCWXBarcodeDecoder1Decoded(Sender: TObject;
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

procedure TForm1.SetControlsState(AEnable: Boolean);
begin
  decodeImgBtn.Enabled := AEnable;
  qrRBtn.Enabled := AEnable;
  code128Rbtn.Enabled := AEnable;
  upcRBtn.Enabled := AEnable;
  eanRBtn.Enabled := AEnable;
  codaRBtn.Enabled := AEnable;
end;

end.

