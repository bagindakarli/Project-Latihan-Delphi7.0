unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tfbook = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbook: Tfbook;

implementation

uses Unit2;

{$R *.dfm}

procedure Tfbook.Button1Click(Sender: TObject);
begin
fbook.hide;
end;

end.
