unit UDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.TMSFNCWXBarcode,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXQRCode;

type
  TForm2 = class(TForm)
    TMSFNCWXQRCode1: TTMSFNCWXQRCode;
    TMSFNCWXBarcode1: TTMSFNCWXBarcode;
    qrRBtn: TRadioButton;
    Edit1: TEdit;
    code128Rbtn: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure RadioBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Typing(Sender: TObject);
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

{$R *.fmx}

procedure TForm2.Edit1Typing(Sender: TObject);
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

procedure TForm2.RadioBtnClick(Sender: TObject);
begin
  FClickedRBtn := (Sender as TRadioButton).Tag;
  GenerateBarcode;
end;

end.
