unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables;

type
  TForm1 = class(TForm)
    DataSource1: TDataSource;
    Table1: TTable;
    Database1: TDatabase;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    nis: TEdit;
    nama: TEdit;
    procedure nisKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.nisKeyPress(Sender: TObject; var Key: Char);
var ada : boolean;
begin
if not (key=chr(13)) then exit;
if nis.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    nis.setfocus;
  end
else
  begin
    table1.indexname:='';
    ada:=table1.findkey([nis.text]);
    if ada then
      begin
        if message
      end
    else
      begin
      end;
  end;
end;

end.
