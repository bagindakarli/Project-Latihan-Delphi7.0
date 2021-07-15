unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls, ExtCtrls, ComCtrls, jpeg;

type
  Tfwelcome = class(TForm)
    XPManifest1: TXPManifest;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fwelcome: Tfwelcome;

implementation

uses Unit2;

{$R *.dfm}

procedure Tfwelcome.Button1Click(Sender: TObject);
begin
timer1.enabled:=true;
ProgressBar1.Visible:=true;
if ProgressBar1.Position=100 then
  begin
    fwelcome.Hide;
    ftransaksi.show;
    Timer1.Enabled:=false;
  end
else
  begin
    ProgressBar1.position:=ProgressBar1.Position+20;
  end;
end;

procedure Tfwelcome.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

procedure Tfwelcome.FormActivate(Sender: TObject);
begin
timer1.enabled:=true;
ProgressBar1.Visible:=true;
if ProgressBar1.Position=100 then
  begin
    fwelcome.Hide;
    ftransaksi.show;
    Timer1.Enabled:=false;
  end
else
  begin
    ProgressBar1.position:=ProgressBar1.Position+20;
  end;
end;

end.
