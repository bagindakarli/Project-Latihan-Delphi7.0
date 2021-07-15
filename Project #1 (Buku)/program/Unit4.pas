unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Unit1, Unit2, Unit3;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
form4.hide;
form1.show;
form1.id.setfocus;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
form4.hide;
form2.show;
form2.nota.setfocus;
end;

procedure TForm4.Button3Click(Sender: TObject);
begin
form4.hide;
form3.show;
form3.nota.setfocus;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
if messagedlg('Apakah anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    application.Terminate;
  end;
end;

procedure TForm4.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
Resize:=false;
end;

end.
