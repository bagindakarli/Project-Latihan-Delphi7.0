unit UnitBuku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, ExtCtrls, DBCtrls, Grids,
  DBGrids;

type
  Tfbuku = class(TForm)
    id: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    namab: TComboBox;
    Label4: TLabel;
    tingkat: TComboBox;
    kelas: TComboBox;
    hargab: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    cari: TButton;
    baru: TButton;
    transaksi: TButton;
    menu: TButton;
    keluar: TButton;
    Database1: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure namabKeyPress(Sender: TObject; var Key: Char);
    procedure namabChange(Sender: TObject);
    procedure tingkatChange(Sender: TObject);
    procedure kelasChange(Sender: TObject);
    procedure hargabKeyPress(Sender: TObject; var Key: Char);
    procedure cariClick(Sender: TObject);
    procedure baruClick(Sender: TObject);
    procedure keluarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbuku: Tfbuku;

implementation

uses Unit1;

{$R *.dfm}

procedure Tfbuku.namabKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;

end;

procedure Tfbuku.namabChange(Sender: TObject);
begin
tingkat.enabled:=true;
tingkat.setfocus;
end;

procedure Tfbuku.tingkatChange(Sender: TObject);
begin
if tingkat.text='SD/Sederajat' then
  begin
    kelas.items.BeginUpdate;
    kelas.Items.Clear;
    kelas.Items.add('1');
    kelas.items.add('2');
    kelas.items.add('3');
    kelas.Items.add('4');
    kelas.items.add('5');
    kelas.Items.add('6');
    kelas.items.EndUpdate;
    kelas.enabled:=true;
    kelas.setfocus;
  end
else if tingkat.text='SMP/Sederajat' then
  begin
    kelas.items.BeginUpdate;
    kelas.items.Clear;
    kelas.Items.add('1');
    kelas.items.add('2');
    kelas.items.add('3');
    kelas.items.EndUpdate;
    kelas.enabled:=true;
    kelas.setfocus;
  end
else if tingkat.text='SMA/Sederajat' then
  begin
    kelas.Items.beginupdate;
    kelas.Items.Clear;
    kelas.Items.add('1');
    kelas.items.add('2');
    kelas.items.add('3');
    kelas.items.EndUpdate;
    kelas.enabled:=true;
    kelas.setfocus;
  end
else
  begin
  end;
end;

procedure tfbuku.kelasChange(Sender: TObject);
begin
hargab.enabled:=true;
hargab.setfocus;
end;

procedure Tfbuku.hargabKeyPress(Sender: TObject; var Key: Char);
var a,b,c:string;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    showmessage('Hanya bisa input angka');
    key:=#0
  end;
if not (key=chr(13)) then exit;
if hargab.text='' then
  begin
    showmessage('Data harus diisi');
    hargab.setfocus;
  end
else
  begin
    a:=namab.text;
    b:=tingkat.text;
    c:=kelas.text;
    if a='MATEMATIKA' then
      begin
        if b='SD/Sederajat' then
          begin
            id.text:='MTK'+'-'+'SD'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end
        else if b='SMP/Sederajat' then
          begin
            id.text:='MTK'+'-'+'SMP'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end
        else if b='SMA/Sederajat' then
          begin
            id.text:='MTK'+'-'+'SMA'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end;
      end
    else if a='ILMU PENGETAHUAN ALAM' then
      begin
        if b='SD/Sederajat' then
          begin
            id.text:='IPA'+'-'+'SD'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end
        else if b='SMP/Sederajat' then
          begin
            id.text:='IPA'+'-'+'SMP'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end
        else if b='SMA/Sederajat' then
          begin
            id.text:='IPA'+'-'+'SMA'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end;
      end
    else if a='BAHASA INGGRIS' then
      begin
        if b='SD/Sederajat' then
          begin
            id.text:='ING'+'-'+'SD'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end
        else if b='SMP/Sederajat' then
          begin
            id.text:='ING'+'-'+'SMP'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end
        else if b='SMA/Sederajat' then
          begin
            id.text:='ING'+'-'+'SMA'+'-'+(kelas.text);
            cari.Enabled:=true;
            cari.SetFocus;
          end;
      end;
  end;
end;

procedure Tfbuku.cariClick(Sender: TObject);
var ada:boolean;
begin
table1.IndexFieldNames:='ID Buku';
ada:=table1.FindKey([id.Text]);
if ada then
  begin
    if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
      begin
        feditbuku.show;
        showmessage('Hanya bisa edit harga satuan buku');
        feditbuku.id.text:=table1['ID Buku'];
        feditbuku.namab.text:=table1['Nama Buku'];
        feditbuku.tingkat.text:=table1['Tingkat'];
        feditbuku.kelas.Text:=table1['Kelas'];
        feditbuku.hargab.setfocus;
      end;
  end
else
  begin
    showmessage('Data baru, bisa disimpan');
    baru.Enabled:=true;
    baru.setfocus;
  end;
end;

procedure Tfbuku.baruClick(Sender: TObject);
begin
table1.append;
table1['Nama Buku']:=namab.text;
table1['Tingkat']:=tingkat.text;
table1['Kelas']:=kelas.text;
table1['Harga Satuan']:=hargab.Text;
table1['ID Buku']:=id.text;
table1.Post;
namab.text:='';
tingkat.text:='';
kelas.Text:='';
hargab.text:='';
id.text:='';
showmessage('Data sudah disimpan');
baru.enabled:=false;
transaksi.setfocus;
end;

procedure Tfbuku.keluarClick(Sender: TObject);
begin
if messagedlg('Anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    close;
  end;
end;



end.
