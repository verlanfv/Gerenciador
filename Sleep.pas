unit Sleep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmSleep = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    tmrRelogio: TTimer;
    procedure tmrRelogioTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSleep: TfrmSleep;

implementation

uses
    UMenuPrincipal, Login;

{$R *.dfm}

procedure TfrmSleep.FormShow(Sender: TObject);
begin
    tmrRelogio.Enabled := True;

end;

procedure TfrmSleep.tmrRelogioTimer(Sender: TObject);
begin
    tmrRelogio.Enabled := False;
    Close;

end;

end.
