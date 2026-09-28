unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  LCLTMSFNCWXBarcode, LCLTMSFNCWXQRCode;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    TMSFNCWXBarcode1: TTMSFNCWXBarcode;
    TMSFNCWXQRCode1: TTMSFNCWXQRCode;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    FClickedRBtn: Integer;
    procedure GenerateBarcode;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FClickedRBtn := 100;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  GenerateBarcode;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  FClickedRBtn := (Sender as TRadioButton).Tag;
  GenerateBarcode;
end;

procedure TForm1.GenerateBarcode;
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

end.

