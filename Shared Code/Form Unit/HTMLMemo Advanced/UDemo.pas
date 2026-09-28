unit UDemo;

interface

{$IFDEF LCL}
{$mode objfpc}{$H+}{$modeswitch advancedrecords}
{$ENDIF}

uses
  {$IFDEF VCL}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UBL,
  VCL.TMSFNCCustomComponent, VCL.TMSFNCBitmapContainer, VCL.TMSFNCButton, VCL.TMSFNCRibbon;
  {$ENDIF}

  {$IFDEF WEBLIB}
  SysUtils, Classes, WEBLib.Graphics,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.StdCtrls, UBL, WEBLib.Controls,
  Vcl.Controls, WEBLib.TMSFNCRibbon, WEBLib.TMSFNCBitmapContainer;
  {$ENDIF}

  {$IFDEF FMX}
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Forms, FMX.Controls, FMX.Graphics, FMX.Dialogs, UBL,
  FMX.TMSFNCCustomComponent, FMX.TMSFNCBitmapContainer, FMX.TMSFNCRibbon;
  {$ENDIF}

  {$IFDEF LCL}
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, UBL,
  LCLTMSFNCCustomComponent, LCLTMSFNCBitmapContainer, LCLTMSFNCButton, LCLTMSFNCRibbon;
  {$ENDIF}

type
  {$IFDEF WEBLIB}
  TForm1 = class(TWebForm)
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FHTMLMemoLogic: THTMLMemoLogic;
  public
  end;
  {$ENDIF}
  {$IFNDEF WEBLIB}
  TForm1 = class(TTMSFNCRibbonForm)
    TMSFNCBitmapContainer1: TTMSFNCBitmapContainer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    FHTMLMemoLogic: THTMLMemoLogic;
  public
  end;
  {$ENDIF}

var
  Form1: TForm1;

implementation

{$IFDEF FMX}
{$R *.fmx}
{$ENDIF}
{$IFDEF VCL}
{$R *.dfm}
{$ENDIF}
{$IFDEF WEBLIB}
{$R *.dfm}
{$ENDIF}
{$IFDEF LCL}
{$R *.lfm}
{$ENDIF}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FHTMLMemoLogic := THTMLMemoLogic.Create;
  FHTMLMemoLogic.InitHTMLMemo(Self, TMSFNCBitmapContainer1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FHTMLMemoLogic.Free;
end;

{$IFNDEF WEBLIB}
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
//
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
//
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
//
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
//
end;
{$ENDIF}

end.
