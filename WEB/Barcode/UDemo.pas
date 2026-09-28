unit UDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, VCL.TMSFNCWXBarcode, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXQRCode;

type
  TForm1 = class(TWebForm)
    TMSFNCWXQRCode1: TTMSFNCWXQRCode;
    TMSFNCWXBarcode1: TTMSFNCWXBarcode;
    WebLabel1: TWebLabel;
    WebEdit1: TWebEdit;
    WebRadioButton1: TWebRadioButton;
    WebRadioButton2: TWebRadioButton;
    WebRadioButton3: TWebRadioButton;
    WebRadioButton4: TWebRadioButton;
    WebRadioButton5: TWebRadioButton;
    WebRadioButton6: TWebRadioButton;
    WebLabel2: TWebLabel;
    procedure WebRadioButton4Click(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure WebEdit1Change(Sender: TObject);
  private
    { Private declarations }
    FClickedRBtn: Integer;
    procedure GenerateBarcode;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.GenerateBarcode;
begin
  if FClickedRBtn = 100 then
  begin
    if not TMSFNCWXQRCode1.Visible then
    begin
      TMSFNCWXQRCode1.Visible := True;
      TMSFNCWXBarcode1.Visible := False;
    end;

    TMSFNCWXQRCode1.Text := WebEdit1.Text;
  end
  else
  begin
    if not TMSFNCWXBarcode1.Visible then
    begin
      TMSFNCWXBarcode1.Visible := True;
      TMSFNCWXQRCode1.Visible := False;
    end;

    try
      case FClickedRBtn of
        101: TMSFNCWXBarcode1.BarcodeType := bciCode128;
        102: TMSFNCWXBarcode1.BarcodeType := bciCode39Ext;
        103: TMSFNCWXBarcode1.BarcodeType := bciCode93Ext;
        104: TMSFNCWXBarcode1.BarcodeType := bciTelepen;
        105: TMSFNCWXBarcode1.BarcodeType := bciPDF417;
      end;
    except
      on E: Exception do
      begin
        WebEdit1.Text := '';
        ShowMessage(E.Message);
      end;
    end;

    try
      TMSFNCWXBarcode1.Text := WebEdit1.Text;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TForm1.WebEdit1Change(Sender: TObject);
begin
  GenerateBarcode;
end;

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  FClickedRBtn := 100;
end;

procedure TForm1.WebRadioButton4Click(Sender: TObject);
begin
  FClickedRBtn := (Sender as TWebRadioButton).Tag;
  GenerateBarcode;
end;

end.