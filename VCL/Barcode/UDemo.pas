unit UDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls, VCL.TMSFNCWXQRCode,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXBarcode;

type
  TForm2 = class(TForm)
    TMSFNCWXBarcode1: TTMSFNCWXBarcode;
    TMSFNCWXQRCode1: TTMSFNCWXQRCode;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    FClickedRBtn: Integer;
    procedure GenerateBarcode;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Edit1Change(Sender: TObject);
begin
  GenerateBarcode;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FClickedRBtn := 100;
end;

procedure TForm2.GenerateBarcode;
begin
  if FClickedRBtn = 100 then
  begin
    TMSFNCWXQRCode1.Visible := True;
    TMSFNCWXBarcode1.Visible := False;
    TMSFNCWXQRCode1.Text := Edit1.Text;
  end
  else
  begin
    TMSFNCWXBarcode1.Visible := True;
    TMSFNCWXQRCode1.Visible := False;

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
        Edit1.Text := '';
        ShowMessage(E.Message);
      end;
    end;

    try
      TMSFNCWXBarcode1.Text := Edit1.Text;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TForm2.RadioButton1Click(Sender: TObject);
begin
  FClickedRBtn := (Sender as TRadioButton).Tag;
  GenerateBarcode;
end;

end.
