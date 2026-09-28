unit UDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.StdCtrls,
  VCL.TMSFNCCustomControl, VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl,
  VCL.TMSFNCWXCamera, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    startBtn: TButton;
    pauseBtn: TButton;
    stopBtn: TButton;
    ssBtn: TButton;
    Label1: TLabel;
    Image1: TImage;
    procedure startBtnClick(Sender: TObject);
    procedure TMSFNCWXCamera1Start(Sender: TObject);
    procedure TMSFNCWXCamera1Stop(Sender: TObject);
    procedure TMSFNCWXCamera1Pause(Sender: TObject);
    procedure TMSFNCWXCamera1Snapshot(Sender: TObject; ABitmap: TTMSFNCBitmap);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.startBtnClick(Sender: TObject);
begin
  case (Sender as TButton).Tag of
    101: TMSFNCWXCamera1.Start;
    102: TMSFNCWXCamera1.Pause;
    103: TMSFNCWXCamera1.Stop;
    104: TMSFNCWXCamera1.TakeSnapshot;
  end;
end;

procedure TForm2.TMSFNCWXCamera1Pause(Sender: TObject);
begin
  startBtn.Enabled := True;
  ssBtn.Enabled := True;
  pauseBtn.Enabled := False;
  stopBtn.Enabled := True;
end;

procedure TForm2.TMSFNCWXCamera1Snapshot(Sender: TObject;
  ABitmap: TTMSFNCBitmap);
begin
  Image1.Picture.Assign(ABitmap);
end;

procedure TForm2.TMSFNCWXCamera1Start(Sender: TObject);
begin
  startBtn.Enabled := False;
  ssBtn.Enabled := True;
  pauseBtn.Enabled := True;
  stopBtn.Enabled := True;
end;

procedure TForm2.TMSFNCWXCamera1Stop(Sender: TObject);
begin
  startBtn.Enabled := True;
  ssBtn.Enabled := False;
  pauseBtn.Enabled := False;
  stopBtn.Enabled := False;
end;

end.
