unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, XPMan, Mask, ComCtrls,
  jpeg, ExtCtrls, ADODB;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    nota: TEdit;
    sekolah: TEdit;
    id: TEdit;
    namab: TEdit;
    kelas: TEdit;
    hargab: TEdit;
    banyak: TEdit;
    total: TEdit;
    baru: TButton;
    edit: TButton;
    bersihkan: TButton;
    Label17: TLabel;
    Button1: TButton;
    XPManifest1: TXPManifest;
    hapus: TButton;
    Label18: TLabel;
    tanggal: TDateTimePicker;
    total2: TEdit;
    Image2: TImage;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Button2: TButton;
    Label2: TLabel;
    Label19: TLabel;
    bayar: TEdit;
    kembalian: TEdit;
    DBGrid1: TDBGrid;
    Database1: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    ComboBox1: TComboBox;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    procedure notaKeyPress(Sender: TObject; var Key: Char);
    procedure sekolahKeyPress(Sender: TObject; var Key: Char);
    procedure idKeyPress(Sender: TObject; var Key: Char);
    procedure banyakKeyPress(Sender: TObject; var Key: Char);
    procedure baruClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure bersihkanClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tanggalKeyPress(Sender: TObject; var Key: Char);
    procedure hapusClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure bayarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3, Unit4;

{$R *.dfm}

procedure TForm2.notaKeyPress(Sender: TObject; var Key: Char);
var ada : boolean;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    showmessage('Hanya Bisa Mengetik Angka');
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if nota.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    nota.SetFocus;
  end
else
  begin
    table1.IndexName:='';
    ada:=table1.FindKey([nota.text]);
    if ada then
      begin
        tanggal.date:=table1['Tanggal'];
        sekolah.text:=table1['Sekolah'];
        id.text:=table1['ID Buku'];
        namab.text:=table1['Nama Buku'];
        kelas.text:=table1['Kelas'];
        hargab.text:=table1['Harga Satuan Buku'];
        banyak.text:=table1['Banyak Buku'];
        total.text:=table1['Total Harga'];
        showmessage('Data sudah ada, bisa diedit');
        tanggal.enabled:=true;
        tanggal.setfocus;
      end
    else
      begin
        showmessage('Data baru');
        sekolah.text:='';
        id.text:='';
        namab.text:='';
        kelas.text:='';
        hargab.Text:='';
        banyak.text:='';
        total.text:='';
        tanggal.enabled:=true;
        tanggal.setfocus;
      end;
  end;
ADOQuery1.First;
While not ADOQuery1.Eof do
begin
 ComboBox1.Items.Add(ADOQuery1['Sekolah']);
ADOQuery1.Next;
end;
end;

procedure TForm2.sekolahKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if sekolah.text='' then
  begin
    showmessage('Isi nama sekolah anda');
    sekolah.SetFocus;
  end
else
  begin
    id.Enabled:=true;
    id.setfocus;
    groupbox1.Visible:=true;
  end;
end;

procedure TForm2.idKeyPress(Sender: TObject; var Key: Char);
var ada : boolean;
begin
if not (key=chr(13)) then exit;
  begin
    if id.text='' then
      begin
        showmessage('Mohon isi ID Buku dengan benar');
        id.setfocus;
      end
    else
      begin
        form1.table1.indexname:='';
        ada:=form1.table1.FindKey([id.text]);
        if ada then
          begin
            namab.text:=form1.table1['Nama Buku'];
            kelas.text:=form1.table1['Kelas'];
            hargab.text:=form1.table1['Harga Satuan Buku'];
            namab.Enabled:=false;
            kelas.Enabled:=false;
            hargab.enabled:=false;
            banyak.Enabled:=true;
            banyak.SetFocus;
            GroupBox1.Visible:=false;
          end
        else
          begin
            if messagedlg('Data tidak ada, ingin ditambahkan sebagai data baru?', mtconfirmation, [mbYes,mbNo], 0) = mrYes then
              begin
                nota.Text:='';
                sekolah.Text:='';
                id.Text:='';
                form2.hide;
                form1.show;
                form1.id.Enabled:=true;
                form1.id.setfocus;
                groupbox1.Visible:=false;
              end
            else
              begin
                id.setfocus;
              end;
          end;
      end;
  end
end;
procedure TForm2.banyakKeyPress(Sender: TObject; var Key: Char);
var hrg, byk, tot : real;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    showmessage('Hanya Bisa Mengetik Angka');
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if banyak.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    banyak.setfocus;
  end
else
  begin
    hrg:=strtofloat(hargab.text);
    byk:=strtofloat(banyak.text);
    tot:=hrg*byk;
    total2.text:=floattostr(tot);
    bayar.Enabled:=true;
    bayar.SetFocus;
  end;
end;

procedure TForm2.baruClick(Sender: TObject);
begin
table1.Append;
table1['Nomor Nota']:=nota.Text;
table1['Tanggal']:=datetostr(tanggal.date);
table1['Sekolah']:=sekolah.text;
table1['ID Buku']:=id.text;
table1['Nama Buku']:=namab.Text;
table1['Kelas']:=kelas.Text;
table1['Harga Satuan Buku']:=strtocurr(hargab.text);
table1['Banyak Buku']:=strtocurr(banyak.text);
table1['Total Harga']:=strtocurr(total2.Text);
table1['Bayar']:=strtocurr(bayar.text);
table1['Kembalian']:=strtocurr(kembalian.text);
table1.post;
nota.text:='';
tanggal.Enabled:=false;
sekolah.text:='';
sekolah.Enabled:=false;
id.text:='';
namab.text:='';
kelas.text:='';
hargab.text:='';
banyak.text:='';
banyak.Enabled:=false;
total.text:='';
total2.text:='';
bayar.Text:='';
kembalian.text:='';
baru.enabled:=false;
edit.enabled:=false;
nota.setfocus;
showmessage('Transaksi Berhasil, Terima Kasih');

end;

procedure TForm2.editClick(Sender: TObject);
begin
table1.edit;
table1['Nomor Nota']:=nota.Text;
table1['Tanggal']:=datetostr(tanggal.date);
table1['Sekolah']:=sekolah.text;
table1['ID Buku']:=id.text;
table1['Nama Buku']:=namab.Text;
table1['Kelas']:=kelas.Text;
table1['Harga Satuan Buku']:=strtocurr(hargab.text);
table1['Banyak Buku']:=strtocurr(banyak.text);
table1['Total Harga']:=strtocurr(total2.Text);
table1['Bayar']:=strtocurr(bayar.text);
table1['Kembalian']:=strtocurr(kembalian.text);
table1.post;
nota.text:='';
tanggal.enabled:=false;
sekolah.text:='';
sekolah.Enabled:=false;
id.text:='';
namab.text:='';
kelas.text:='';
hargab.text:='';
banyak.text:='';
banyak.Enabled:=false;
total.text:='';
total2.Text:='';
bayar.Text:='';
kembalian.text:='';
baru.enabled:=false;
edit.enabled:=false;
nota.SetFocus;
showmessage('Data berhasil diedit');
end;

procedure TForm2.bersihkanClick(Sender: TObject);
begin
nota.text:='';
tanggal.enabled:=false;
sekolah.text:='';
id.text:='';
namab.text:='';
kelas.text:='';
hargab.text:='';
banyak.text:='';
total.text:='';
total2.text:='';
bayar.Text:='';
kembalian.text:='';
nota.SetFocus;
showmessage('Form sudah dibersihkan');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if messagedlg('Apakah anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    application.Terminate;
  end;
end;





procedure TForm2.tanggalKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
sekolah.Enabled:=true;
sekolah.SetFocus;
end;

procedure TForm2.hapusClick(Sender: TObject);
begin
if table1.IsEmpty then
  begin
    showmessage('Data kosong!');
  end
else
  begin
    form2.Hide;
    form3.show;
    form3.nota.SetFocus;
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
if messagedlg('Apakah ingin kembali ke Menu?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    nota.Text:='';
    sekolah.text:='';
    id.text:='';
    namab.text:='';
    kelas.text:='';
    hargab.text:='';
    banyak.text:='';
    total.text:='';
    total2.Text:='';
    bayar.Text:='';
    kembalian.text:='';
    form2.Hide;
    form4.show;
    form4.Button1.setfocus;
  end;
end;

procedure TForm2.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

procedure TForm2.bayarKeyPress(Sender: TObject; var Key: Char);
var d,e,f:real;
    a,b:integer;
    ada:boolean;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    showmessage('Hanya bisa input angka');
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if bayar.text='' then
  begin
    showmessage('Data harus diisi');
    bayar.setfocus;
  end
else
  begin
  a:=strtoint(total2.Text);
  b:=strtoint(bayar.text);
  if b<a then
    begin
      showmessage('Uang tidak cukup');
      bayar.setfocus;
    end
  else if b>=a then
    begin
      d:=strtofloat(total2.text);
      e:=strtofloat(bayar.text);
      f:=e - d;
      kembalian.text:=floattostr(f);
      table1.IndexName:='';
      ada:=table1.FindKey([nota.text]);
      if ada then
        begin
          edit.Enabled:=true;
          edit.SetFocus;
        end
      else
        begin
          baru.enabled:=true;
          baru.setfocus;
        end;
    end;
  end;
end;

end.
