unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, DB, DBTables, StdCtrls, ComCtrls, Grids, DBGrids, ADODB,
  DBCtrls, Menus, jpeg, ExtCtrls, shellapi;

type
  Tftransaksi = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    nota: TEdit;
    id: TEdit;
    matpel: TEdit;
    kelas: TEdit;
    hargab: TEdit;
    banyak: TEdit;
    total2: TEdit;
    bayar: TEdit;
    kembalian: TEdit;
    alamat: TEdit;
    baru: TButton;
    edit: TButton;
    bersihkan: TButton;
    tingkat: TEdit;
    Database1: TDatabase;
    DataSource1: TDataSource;
    XPManifest1: TXPManifest;
    tanggal: TDateTimePicker;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    sekolah: TComboBox;
    Label23: TLabel;
    hapus: TButton;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    edhapus: TEdit;
    bthapus: TButton;
    btkembali: TButton;
    Table2: TTable;
    DataSource2: TDataSource;
    Table2Tingkat: TStringField;
    Table2NamaSekolah: TStringField;
    Table2Alamat: TStringField;
    Label26: TLabel;
    Label27: TLabel;
    Table1: TTable;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    ableMasterBuku1: TMenuItem;
    ableMasterSekolah1: TMenuItem;
    Keluar1: TMenuItem;
    ManualBook1: TMenuItem;
    Database2: TDatabase;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    T1: TMenuItem;
    M1: TMenuItem;
    M2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure notaKeyPress(Sender: TObject; var Key: Char);
    procedure tanggalKeyPress(Sender: TObject; var Key: Char);
    procedure idKeyPress(Sender: TObject; var Key: Char);
    procedure sekolahKeyPress(Sender: TObject; var Key: Char);
    procedure keluarClick(Sender: TObject);
    procedure alamatKeyPress(Sender: TObject; var Key: Char);
    procedure sekolahChange(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure banyakKeyPress(Sender: TObject; var Key: Char);
    procedure bayarKeyPress(Sender: TObject; var Key: Char);
    procedure baruClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure bersihkanClick(Sender: TObject);
    procedure hapusClick(Sender: TObject);
    procedure edhapusKeyPress(Sender: TObject; var Key: Char);
    procedure btkembaliClick(Sender: TObject);
    procedure bthapusClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDeactivate(Sender: TObject);
    procedure ableMasterBuku1Click(Sender: TObject);
    procedure ableMasterSekolah1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure bayarClick(Sender: TObject);
    procedure tanggalClick(Sender: TObject);
    procedure idClick(Sender: TObject);
    procedure alamatClick(Sender: TObject);
    procedure banyakExit(Sender: TObject);
    procedure idExit(Sender: TObject);
    procedure bayarExit(Sender: TObject);
    procedure editExit(Sender: TObject);
    procedure baruExit(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ftransaksi: Tftransaksi;

implementation

uses Unit1, Unit4, Unit3, Unit5;

{$R *.dfm}

procedure Tftransaksi.FormShow(Sender: TObject);
begin
tanggal.Enabled:=false;
id.enabled:=false;
sekolah.enabled:=false;
alamat.enabled:=false;
banyak.Enabled:=false;
bayar.enabled:=false;
baru.enabled:=false;
edit.enabled:=false;
hapus.enabled:=false;
nota.enabled:=true;
nota.setfocus;
label23.Visible:=false;
end;

procedure Tftransaksi.FormHide(Sender: TObject);
begin
tanggal.Enabled:=false;
id.enabled:=false;
sekolah.enabled:=false;
alamat.enabled:=false;
banyak.Enabled:=false;
bayar.enabled:=false;
baru.enabled:=false;
edit.enabled:=false;
hapus.visible:=true;
hapus.enabled:=false;
nota.Text:='';
id.Text:='';
matpel.text:='';
tingkat.text:='';
kelas.text:='';
hargab.text:='';
sekolah.text:='';
alamat.text:='';
banyak.text:='';
total2.text:='';
bayar.text:='';
kembalian.text:='';
sekolah.Items.Clear;
GroupBox2.visible:=false;
end;

procedure Tftransaksi.notaKeyPress(Sender: TObject; var Key: Char);
var ada : boolean;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    messagedlg('Hanya bisa input angka.',mtInformation,[mbOK],0);
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if nota.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    nota.SetFocus;
  end
else
  begin
    table1.IndexName:='';
    ada:=table1.FindKey([nota.text]);
    if ada then
      begin
        tanggal.date:=table1['Tanggal'];
        id.text:=table1['ID Buku'];
        matpel.text:=table1['Mata Pelajaran'];
        tingkat.text:=table1['Tingkat'];
        kelas.text:=table1['Kelas'];
        hargab.text:=table1['Harga Satuan'];
        sekolah.text:=table1['Nama Sekolah'];
        alamat.text:=table1['Alamat'];
        banyak.text:=table1['Banyak Buku'];
        total2.text:=table1['Total Harga'];
        bayar.text:=table1['Bayar'];
        kembalian.text:=table1['Kembali'];
        messagedlg('Data sudah ada, bisa diedit.',mtInformation,[mbok],0);
        nota.Enabled:=false;
        tanggal.enabled:=true;
        tanggal.setfocus;
      end
    else
      begin
        messagedlg('Data baru.',mtInformation,[mbok],0);
        id.text:='';
        matpel.text:='';
        tingkat.text:='';
        kelas.text:='';
        hargab.text:='';
        sekolah.text:='';
        alamat.text:='';
        banyak.Text:='';
        total2.text:='';
        bayar.text:='';
        kembalian.text:='';
        tanggal.enabled:=true;
        tanggal.setfocus;
        nota.enabled:=false;
      end;
  end;
end;


procedure Tftransaksi.tanggalKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
label2.Visible:=false;
label19.visible:=false;
bayar.visible:=false;
kembalian.Visible:=false;
baru.visible:=false;
edit.visible:=false;
bersihkan.visible:=false;
hapus.visible:=false;
label23.Visible:=false;
GroupBox1.visible:=true;
id.Enabled:=true;
id.setfocus;
end;

procedure Tftransaksi.idKeyPress(Sender: TObject; var Key: Char);
var ada:boolean;
begin
if not (key=chr(13)) then exit;
if id.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    id.setfocus;
  end
else
  begin
  fbuku.table1.indexfieldnames:='ID Buku';
  ada:=fbuku.table1.FindKey([id.text]);
  if ada then
    begin
      matpel.text:=fbuku.table1['Mata Pelajaran'];
      tingkat.text:=fbuku.table1['Tingkat'];
      kelas.text:=fbuku.table1['Kelas'];
      hargab.text:=fbuku.table1['Harga Satuan'];
      matpel.Enabled:=false;
      tingkat.enabled:=false;
      kelas.Enabled:=false;
      hargab.enabled:=false;
      label2.Visible:=true;
      label19.visible:=true;
      bayar.visible:=true;
      kembalian.Visible:=true;
      baru.visible:=true;
      edit.visible:=true;
      bersihkan.visible:=true;
      hapus.Visible:=true;
      sekolah.enabled:=true;
      sekolah.SetFocus;
      label23.visible:=true;
      GroupBox1.Visible:=false;
    end
  else
    begin
      messagedlg('Data tidak ditemukan, periksa kembali ID Buku.', mtWarning, [mbOK],0);
      id.SetFocus;
    end;
  end;

end;

procedure Tftransaksi.sekolahKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if sekolah.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    sekolah.setfocus;
  end
else
  begin
    messagedlg('Pilih data dengan cara tekan tombol panah di samping.', mtInformation, [mbOK],0);
    alamat.enabled:=false;
    banyak.enabled:=false;
    bayar.enabled:=false;
    sekolah.setfocus;
  end;
end;

procedure Tftransaksi.keluarClick(Sender: TObject);
begin
if messagedlg('Anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    close;
  end;
end;

procedure Tftransaksi.alamatKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if trim(alamat.text)='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    alamat.text:='';
    alamat.setfocus;
  end
else
  begin
    banyak.enabled:=true;
    banyak.SetFocus;
  end;
end;

procedure Tftransaksi.sekolahChange(Sender: TObject);
var ada:boolean;
begin
fsekolah.Table1.indexfieldnames:='Nama Sekolah';
ada:=fsekolah.table1.FindKey([sekolah.text]);
if ada then
  begin
    alamat.Text:=fsekolah.table1['Alamat'];
    alamat.Enabled:=true;
    alamat.setfocus;
    label23.Visible:=false;
  end
else
  begin
  end;
end;

procedure Tftransaksi.Label23Click(Sender: TObject);
begin
ftransaksi.hide;
fsekolah.Show;
end;

procedure Tftransaksi.banyakKeyPress(Sender: TObject; var Key: Char);
var hrg, byk, tot : real;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    messagedlg('Hanya bisa input angka.',mtInformation,[mbOK],0);
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if banyak.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
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

procedure Tftransaksi.bayarKeyPress(Sender: TObject; var Key: Char);
var a,b,d,e,f:real;
    ada:boolean;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    messagedlg('Hanya bisa input angka.',mtInformation,[mbOK],0);
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if bayar.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    bayar.setfocus;
  end
else
  begin
  a:=strtoint(total2.Text);
  b:=strtoint(bayar.text);
        if b<a then
          begin
            messagedlg('Uang tidak cukup.',mtWarning,[mbok],0);
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

procedure Tftransaksi.baruClick(Sender: TObject);
begin
if (nota.text='') or (id.text='') or (sekolah.text='') or (alamat.text='') or (banyak.text='') or (bayar.text='') then
  begin
    messagedlg('Ada data yang kosong!',mtWarning,[mbok],0);
  end
else
  begin
    table1.Append;
    table1['Nomor Nota']:=nota.Text;
    table1['Tanggal']:=datetostr(tanggal.date);
    table1['ID Buku']:=id.text;
    table1['Mata Pelajaran']:=matpel.Text;
    table1['Tingkat']:=tingkat.text;
    table1['Kelas']:=kelas.Text;
    table1['Harga Satuan']:=strtocurr(hargab.text);
    table1['Nama Sekolah']:=sekolah.text;
    table1['Alamat']:=alamat.text;
    table1['Banyak Buku']:=strtocurr(banyak.text);
    table1['Total Harga']:=strtocurr(total2.Text);
    table1['Bayar']:=strtocurr(bayar.text);
    table1['Kembali']:=strtocurr(kembalian.text);
    table1.post;
    nota.text:='';
    tanggal.Enabled:=false;
    id.enabled:=false;
    id.text:='';
    matpel.text:='';
    tingkat.text:='';
    kelas.text:='';
    hargab.text:='';
    sekolah.Enabled:=false;
    sekolah.text:='';
    alamat.enabled:=false;
    alamat.text:='';
    banyak.text:='';
    banyak.Enabled:=false;
    total2.text:='';
    total2.enabled:=false;
    bayar.Text:='';
    bayar.enabled:=false;
    kembalian.text:='';
    kembalian.enabled:=false;
    baru.enabled:=false;
    edit.enabled:=false;
    nota.enabled:=true;
    nota.setfocus;
    hapus.enabled:=true;
    messagedlg('Transaksi Berhasil, Terima Kasih.',mtInformation,[mbok],0);
  end;
end;

procedure Tftransaksi.editClick(Sender: TObject);
begin
if (nota.text='') or (id.text='') or (sekolah.Text='') or (alamat.text='') or (banyak.text='') or (bayar.text='') then
  begin
    messagedlg('Ada data yang kosong!',mtWarning,[mbok],0);
  end
else
  begin
    table1.edit;
    table1['Nomor Nota']:=nota.Text;
    table1['Tanggal']:=datetostr(tanggal.date);
    table1['ID Buku']:=id.text;
    table1['Mata Pelajaran']:=matpel.Text;
    table1['Tingkat']:=tingkat.text;
    table1['Kelas']:=kelas.Text;
    table1['Harga Satuan']:=strtocurr(hargab.text);
    table1['Nama Sekolah']:=sekolah.text;
    table1['Alamat']:=alamat.text;
    table1['Banyak Buku']:=strtocurr(banyak.text);
    table1['Total Harga']:=strtocurr(total2.Text);
    table1['Bayar']:=strtocurr(bayar.text);
    table1['Kembali']:=strtocurr(kembalian.text);
    table1.post;
    nota.text:='';
    tanggal.Enabled:=false;
    id.enabled:=false;
    id.text:='';
    matpel.text:='';
    tingkat.text:='';
    kelas.text:='';
    hargab.text:='';
    sekolah.Enabled:=false;
    sekolah.text:='';
    alamat.enabled:=false;
    alamat.text:='';
    banyak.text:='';
    banyak.Enabled:=false;
    total2.text:='';
    total2.enabled:=false;
    bayar.Text:='';
    bayar.enabled:=false;
    kembalian.text:='';
    kembalian.enabled:=false;
    baru.enabled:=false;
    edit.enabled:=false;
    nota.enabled:=true;
    nota.setfocus;
    hapus.enabled:=true;
    messagedlg('Data berhasil diedit.', mtInformation, [mbOK],0);
  end;
end;

procedure Tftransaksi.bersihkanClick(Sender: TObject);
var ada:boolean;
begin
table1.indexfieldnames:='Nomor Nota';
ada:=table1.FindKey([nota.text]);
if ada then
  begin
nota.text:='';
tanggal.Enabled:=false;
id.enabled:=false;
id.text:='';
matpel.text:='';
tingkat.text:='';
kelas.text:='';
hargab.text:='';
sekolah.Enabled:=false;
sekolah.text:='';
alamat.enabled:=false;
alamat.text:='';
banyak.text:='';
banyak.Enabled:=false;
total2.text:='';
total2.enabled:=false;
bayar.Text:='';
bayar.enabled:=false;
kembalian.text:='';
kembalian.enabled:=false;
baru.enabled:=false;
edit.enabled:=false;
label23.Visible:=false;
nota.enabled:=true;
nota.setfocus;
messagedlg('Form sudah dibersihkan.',mtInformation,[mbok],0);
  end
else
  begin
  nota.text:='';
tanggal.Enabled:=false;
id.enabled:=false;
id.text:='';
matpel.text:='';
tingkat.text:='';
kelas.text:='';
hargab.text:='';
sekolah.Enabled:=false;
sekolah.text:='';
alamat.enabled:=false;
alamat.text:='';
banyak.text:='';
banyak.Enabled:=false;
total2.text:='';
total2.enabled:=false;
bayar.Text:='';
bayar.enabled:=false;
kembalian.text:='';
kembalian.enabled:=false;
baru.enabled:=false;
edit.enabled:=false;
label23.Visible:=false;
nota.enabled:=true;
nota.setfocus;
messagedlg('Form sudah dibersihkan.',mtInformation,[mbok],0);
  end;
end;

procedure Tftransaksi.hapusClick(Sender: TObject);
begin
if messagedlg('Ingin hapus data?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    nota.Enabled:=false;
    hapus.Visible:=false;
    GroupBox2.visible:=true;
    edhapus.setfocus;
  end;
end;

procedure Tftransaksi.edhapusKeyPress(Sender: TObject; var Key: Char);
var ada:boolean;
begin
if not (key=chr(13)) then exit;
if trim(edhapus.text)='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    edhapus.Text:='';
    edhapus.setfocus;
  end
else
  begin
  table1.IndexFieldNames:='Nomor Nota';
  ada:=table1.FindKey([edhapus.text]);
  if ada then
    begin
      messagedlg('Data ditemukan.',mtInformation,[mbok],0);
      bthapus.Enabled:=true;
      bthapus.SetFocus;
    end
  else
    begin
      messagedlg('Data tidak ditemukan.', mtError, [mbOK],0);
      edhapus.setfocus;
      exit;
    end;
  end;

end;

procedure Tftransaksi.btkembaliClick(Sender: TObject);
begin
bthapus.enabled:=false;
edhapus.Text:='';
GroupBox2.visible:=false;
hapus.Visible:=true;
nota.enabled:=true;
end;

procedure Tftransaksi.bthapusClick(Sender: TObject);
begin
if edhapus.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtwarning,[mbok],0);
    edhapus.setfocus;
  end
else
  begin
    table1.Delete;
    messagedlg('Data sudah dihapus.',mtInformation,[mbok],0);
    bthapus.enabled:=false;
    edhapus.Text:='';
    GroupBox2.visible:=false;
    hapus.Visible:=true;
    nota.enabled:=true;
  end;
end;

procedure Tftransaksi.Button2Click(Sender: TObject);
var i : integer;
begin
i:=Table2.RecordCount;
for i:=1 to i do
  begin
    sekolah.Items.Add(Table2['Nama Sekolah']);
    Table2.Next;
  end;
end;

procedure Tftransaksi.FormActivate(Sender: TObject);
var i : integer;
begin
i:=Table2.RecordCount;
for i:=1 to i do
  begin
    sekolah.Items.Add(Table2['Nama Sekolah']);
    Table2.Next;
  end;
end;

procedure Tftransaksi.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;



procedure Tftransaksi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
sekolah.items.Clear;
end;

procedure Tftransaksi.FormDeactivate(Sender: TObject);
begin
sekolah.Items.clear;
end;

procedure Tftransaksi.ableMasterBuku1Click(Sender: TObject);
begin
if messagedlg('Apakah Anda ingin ke Table Master Buku?', mtConfirmation, [mbYes,mbNo],0)= mrYes then
  begin
    ftransaksi.Hide;
    fbuku.Show;
  end;
end;

procedure Tftransaksi.ableMasterSekolah1Click(Sender: TObject);
begin
if messagedlg('Apakah Anda ingin ke Table Master Sekolah?', mtConfirmation, [mbYes,mbNo],0)= mrYes then
  begin
    ftransaksi.Hide;
    fsekolah.Show;
  end;
end;

procedure Tftransaksi.Keluar1Click(Sender: TObject);
begin
if messagedlg('Anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    close;
  end;
end;

procedure Tftransaksi.Button1Click(Sender: TObject);
begin
sekolah.items.clear;
end;

procedure Tftransaksi.bayarClick(Sender: TObject);
var hrg,byk,tot:real;
    ada:boolean;
begin
table1.IndexFieldNames:='Nomor Nota';
ada:=table1.findkey([nota.text]);
if ada then
  begin
    if banyak.text='' then
      begin
        messagedlg('Banyak Buku tidak boleh kosong.',mtWarning,[mbOK],0);
        banyak.setfocus;
      end
    else
      begin
        hrg:=strtofloat(hargab.text);
        byk:=strtofloat(banyak.text);
        tot:=hrg*byk;
        total2.text:=floattostr(tot);
      end;
  end
else
  begin
    if banyak.text='' then
      begin
        messagedlg('Banyak Buku tidak boleh kosong.',mtWarning,[mbOK],0);
        banyak.setfocus;
      end
    else
      begin
        hrg:=strtofloat(hargab.text);
        byk:=strtofloat(banyak.text);
        tot:=hrg*byk;
        total2.text:=floattostr(tot);
      end;
  end;
end;

procedure Tftransaksi.tanggalClick(Sender: TObject);
var hrg,byk,tot:real;
    ada:boolean;
begin
table1.IndexFieldNames:='Nomor Nota';
ada:=table1.findkey([nota.text]);
if ada then
  begin
    if banyak.text='' then
      begin
        messagedlg('Banyak Buku tidak boleh kosong.',mtWarning,[mbOK],0);
        banyak.setfocus;
      end
    else
      begin
        hrg:=strtofloat(hargab.text);
        byk:=strtofloat(banyak.text);
        tot:=hrg*byk;
        total2.text:=floattostr(tot);
      end;
  end;
end;

procedure Tftransaksi.idClick(Sender: TObject);
var hrg,byk,tot:real;
    ada:boolean;
begin
table1.IndexFieldNames:='Nomor Nota';
ada:=table1.findkey([nota.text]);
if ada then
  begin
    if banyak.text='' then
      begin
        messagedlg('Banyak Buku tidak boleh kosong.',mtWarning,[mbOK],0);
        banyak.setfocus;
      end
    else
      begin
        hrg:=strtofloat(hargab.text);
        byk:=strtofloat(banyak.text);
        tot:=hrg*byk;
        total2.text:=floattostr(tot);
      end;
  end;
end;



procedure Tftransaksi.alamatClick(Sender: TObject);
var hrg,byk,tot:real;
    ada:boolean;
begin
table1.IndexFieldNames:='Nomor Nota';
ada:=table1.findkey([nota.text]);
if ada then
  begin
    if banyak.text='' then
      begin
        messagedlg('Banyak Buku tidak boleh kosong.',mtWarning,[mbOK],0);
        banyak.setfocus;
      end
    else
      begin
        hrg:=strtofloat(hargab.text);
        byk:=strtofloat(banyak.text);
        tot:=hrg*byk;
        total2.text:=floattostr(tot);
      end;
  end;
end;

procedure Tftransaksi.banyakExit(Sender: TObject);
var hrg,byk,tot:real;
    ada:boolean;
begin
table1.IndexFieldNames:='Nomor Nota';
ada:=table1.findkey([nota.text]);
if ada then
  begin
    if banyak.text='' then
      begin
        messagedlg('Banyak Buku tidak boleh kosong.',mtWarning,[mbOK],0);
        banyak.setfocus;
      end
    else
      begin
        hrg:=strtofloat(hargab.text);
        byk:=strtofloat(banyak.text);
        tot:=hrg*byk;
        total2.text:=floattostr(tot);
      end;
  end
else
  begin
    if banyak.text='' then
      begin
        messagedlg('Banyak Buku tidak boleh kosong.',mtWarning,[mbOK],0);
        banyak.setfocus;
      end
    else
      begin
        hrg:=strtofloat(hargab.text);
        byk:=strtofloat(banyak.text);
        tot:=hrg*byk;
        total2.text:=floattostr(tot);
      end;
  end;
end;

procedure Tftransaksi.idExit(Sender: TObject);
var ada:boolean;
begin
if id.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    id.setfocus;
  end
else
  begin
  fbuku.table1.indexfieldnames:='ID Buku';
  ada:=fbuku.table1.FindKey([id.text]);
  if ada then
    begin
      matpel.text:=fbuku.table1['Mata Pelajaran'];
      tingkat.text:=fbuku.table1['Tingkat'];
      kelas.text:=fbuku.table1['Kelas'];
      hargab.text:=fbuku.table1['Harga Satuan'];
      matpel.Enabled:=false;
      tingkat.enabled:=false;
      kelas.Enabled:=false;
      hargab.enabled:=false;
      label2.Visible:=true;
      label19.visible:=true;
      bayar.visible:=true;
      kembalian.Visible:=true;
      baru.visible:=true;
      edit.visible:=true;
      bersihkan.visible:=true;
      hapus.Visible:=true;
      sekolah.enabled:=true;
      sekolah.SetFocus;
      label23.visible:=true;
      GroupBox1.Visible:=false;
    end
  else
    begin
      messagedlg('Data tidak ditemukan, periksa kembali ID Buku.', mtWarning, [mbOK],0);
      id.SetFocus;
    end;
  end;

end;

procedure Tftransaksi.bayarExit(Sender: TObject);
var a,b,d,e,f:real;
    ada:boolean;
begin
if bayar.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    bayar.setfocus;
  end
else
  begin
  a:=strtoint(total2.Text);
  b:=strtoint(bayar.text);
        if b<a then
          begin
            messagedlg('Uang tidak cukup.',mtWarning,[mbok],0);
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

procedure Tftransaksi.editExit(Sender: TObject);
begin
edit.enabled:=false;
end;

procedure Tftransaksi.baruExit(Sender: TObject);
begin
baru.enabled:=false;
end;

procedure Tftransaksi.T1Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\transaksi\transaksi.pdf', nil, nil, SW_SHOWNORMAL);
end;

procedure Tftransaksi.M1Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\buku\buku.pdf', nil,nil, SW_SHOWNORMAL);
end;

procedure Tftransaksi.M2Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\sekolah\sekolah.pdf', nil, nil, SW_SHOWNORMAL);
end;

end.
