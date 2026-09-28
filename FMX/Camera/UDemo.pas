unit UDemo;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser, FMX.TMSFNCCustomWEBControl,
  FMX.TMSFNCWXCamera, System.ImageList, FMX.ImgList;

type
  TForm2 = class(TForm)
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    startBtn: TButton;
    pauseBtn: TButton;
    stopBtn: TButton;
    ssBtn: TButton;
    Label1: TLabel;
    ImageControl1: TImageControl;
    procedure startBtnClick(Sender: TObject);
    procedure TMSFNCWXCamera1Start(Sender: TObject);
    procedure TMSFNCWXCamera1Pause(Sender: TObject);
    procedure TMSFNCWXCamera1Stop(Sender: TObject);
    procedure TMSFNCWXCamera1Snapshot(Sender: TObject; ABitmap: TTMSFNCBitmap);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

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

procedure TForm2.TMSFNCWXCamera1Snapshot(Sender: TObject; ABitmap: TTMSFNCBitmap);
begin
  ImageControl1.Bitmap.Assign(ABitmap);
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
