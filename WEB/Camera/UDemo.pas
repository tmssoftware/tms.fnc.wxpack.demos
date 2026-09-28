unit UDemo;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, VCL.TMSFNCTypes, VCL.TMSFNCUtils,
  VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, VCL.TMSFNCCustomControl,
  VCL.TMSFNCWebBrowser, VCL.TMSFNCCustomWEBControl, VCL.TMSFNCWXCamera,
  WEBLib.ExtCtrls;

type
  TForm1 = class(TWebForm)
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    startBtn: TWebButton;
    pauseBtn: TWebButton;
    stopBtn: TWebButton;
    ssBtn: TWebButton;
    WebLabel1: TWebLabel;
    WebImageControl1: TWebImageControl;
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
  Form1: TForm1;

implementation

uses
  WEBLib.WebTools;

{$R *.dfm}

procedure TForm1.TMSFNCWXCamera1Pause(Sender: TObject);
begin
  startBtn.Enabled := True;
  pauseBtn.Enabled := False;
  stopBtn.Enabled := True;
  ssBtn.Enabled := True;
end;

procedure TForm1.TMSFNCWXCamera1Snapshot(Sender: TObject;
  ABitmap: TTMSFNCBitmap);
begin
  WebImageControl1.URL := 'data:image/png;base64,' + HexImageDecodeAsBase64(ABitmap.Data);
end;

procedure TForm1.TMSFNCWXCamera1Start(Sender: TObject);
begin
  startBtn.Enabled := False;
  pauseBtn.Enabled := True;
  stopBtn.Enabled := True;
  ssBtn.Enabled := True;
end;

procedure TForm1.TMSFNCWXCamera1Stop(Sender: TObject);
begin
  startBtn.Enabled := True;
  pauseBtn.Enabled := False;
  stopBtn.Enabled := False;
  ssBtn.Enabled := False;
end;

procedure TForm1.startBtnClick(Sender: TObject);
begin
  case (Sender as TWebButton).Tag of
    101: TMSFNCWXCamera1.Start;
    102: TMSFNCWXCamera1.Pause;
    103: TMSFNCWXCamera1.Stop;
    104: TMSFNCWXCamera1.TakeSnapshot;
  end;
end;

end.