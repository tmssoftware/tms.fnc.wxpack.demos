unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLTMSFNCWXCamera, LCLTMSFNCTypes;

type

  { TForm1 }

  TForm1 = class(TForm)
    startBtn: TButton;
    pauseBtn: TButton;
    stopBtn: TButton;
    ssBtn: TButton;
    Image1: TImage;
    TMSFNCWXCamera1: TTMSFNCWXCamera;
    procedure startBtnClick(Sender: TObject);
    procedure TMSFNCWXCamera1Pause(Sender: TObject);
    procedure TMSFNCWXCamera1Snapshot(Sender: TObject; ABitmap: TTMSFNCBitmap);
    procedure TMSFNCWXCamera1Start(Sender: TObject);
    procedure TMSFNCWXCamera1Stop(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.TMSFNCWXCamera1Start(Sender: TObject);
begin
  startBtn.Enabled := False;
  ssBtn.Enabled := True;
  pauseBtn.Enabled := True;
  stopBtn.Enabled := True;
end;

procedure TForm1.TMSFNCWXCamera1Stop(Sender: TObject);
begin
  startBtn.Enabled := True;
  ssBtn.Enabled := False;
  pauseBtn.Enabled := False;
  stopBtn.Enabled := False;
end;

procedure TForm1.TMSFNCWXCamera1Snapshot(Sender: TObject; ABitmap: TTMSFNCBitmap
  );
begin
  Image1.Picture.Assign(ABitmap);
end;

procedure TForm1.TMSFNCWXCamera1Pause(Sender: TObject);
begin
  startBtn.Enabled := True;
  ssBtn.Enabled := True;
  pauseBtn.Enabled := False;
  stopBtn.Enabled := True;
end;

procedure TForm1.startBtnClick(Sender: TObject);
begin
  case (Sender as TButton).Tag of
    101: TMSFNCWXCamera1.Start;
    102: TMSFNCWXCamera1.Pause;
    103: TMSFNCWXCamera1.Stop;
    104: TMSFNCWXCamera1.TakeSnapshot;
  end;
end;

end.

