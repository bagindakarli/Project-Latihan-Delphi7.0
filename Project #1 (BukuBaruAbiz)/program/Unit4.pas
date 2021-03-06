unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, DBTables, XPMan, Menus, jpeg,
  ExtCtrls, DBCtrls, shellapi;

type
  Tfsekolah = class(TForm)
    tingkat: TComboBox;
    sekolah: TEdit;
    alamat: TEdit;
    baru: TButton;
    edit: TButton;
    hapus: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Database1: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    XPManifest1: TXPManifest;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edhapus: TEdit;
    bthapus: TButton;
    Label5: TLabel;
    btkembali: TButton;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    ManualBook1: TMenuItem;
    ableMasterBuku1: TMenuItem;
    ransaksi1: TMenuItem;
    Keluar1: TMenuItem;
    Image1: TImage;
    T1: TMenuItem;
    M1: TMenuItem;
    M2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure tingkatChange(Sender: TObject);
    procedure tingkatKeyPress(Sender: TObject; var Key: Char);
    procedure sekolahKeyPress(Sender: TObject; var Key: Char);
    procedure alamatKeyPress(Sender: TObject; var Key: Char);
    procedure baruClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure hapusClick(Sender: TObject);
    procedure edhapusKeyPress(Sender: TObject; var Key: Char);
    procedure bthapusClick(Sender: TObject);
    procedure keluarClick(Sender: TObject);
    procedure btkembaliClick(Sender: TObject);
    procedure transaksiClick(Sender: TObject);
    procedure ableMasterBuku1Click(Sender: TObject);
    procedure ransaksi1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure baruExit(Sender: TObject);
    procedure editExit(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fsekolah: Tfsekolah;

implementation

uses Unit3, Unit1, Unit2;

{$R *.dfm}

procedure Tfsekolah.FormShow(Sender: TObject);
begin
sekolah.enabled:=false;
alamat.enabled:=false;
baru.enabled:=false;
edit.enabled:=false;
hapus.Enabled:=false;
tingkat.Enabled:=true;
tingkat.SetFocus;
end;

procedure Tfsekolah.FormHide(Sender: TObject);
begin
sekolah.enabled:=false;
alamat.enabled:=false;
baru.enabled:=false;
edit.enabled:=false;
hapus.visible:=true;
hapus.Enabled:=false;
tingkat.Text:='';
sekolah.Text:='';
alamat.Text:='';
label5.Visible:=false;
GroupBox1.Visible:=false;
end;

procedure Tfsekolah.tingkatChange(Sender: TObject);
begin
if tingkat.Text='SD/Sederajat' then
  begin
    sekolah.text:='SD ';
    sekolah.enabled:=true;
    sekolah.setfocus;
    label5.visible:=true;
  end
else if tingkat.text='SMP/Sederajat' then
  begin
    sekolah.text:='SMP ';
    sekolah.enabled:=true;
    sekolah.setfocus;
    label5.visible:=true;
  end
else if tingkat.text='SMA/Sederajat'then
  begin
    sekolah.text:='SMA ';
    sekolah.enabled:=true;
    sekolah.setfocus;
    label5.visible:=true;
  end;
end;

procedure Tfsekolah.tingkatKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['A'..'Z', #8, #13]) then
  begin
    messagedlg('Pilih data dengan cara tekan tombol panah di samping.', mtInformation, [mbOK],0);
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if tingkat.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    tingkat.setfocus;
  end;
end;

procedure Tfsekolah.sekolahKeyPress(Sender: TObject; var Key: Char);
var ada:boolean;
begin
if not (key=chr(13)) then exit;
if trim(sekolah.text)='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    sekolah.Text:='';
    sekolah.setfocus;
  end
else
  begin
    table1.Indexfieldnames:='';
    ada:=table1.findkey([sekolah.text]);
    if ada then
      begin
        messagedlg('Sekolah sudah terdaftar, bisa edit Alamat.',mtInformation,[mbOK],0);
        alamat.Text:=table1['Alamat'];
        alamat.enabled:=true;
        alamat.setfocus;
        label5.visible:=false;
      end
    else
      begin
        alamat.enabled:=true;
        alamat.setfocus;
        label5.visible:=false;
      end;
  end;
end;

procedure Tfsekolah.alamatKeyPress(Sender: TObject; var Key: Char);
var ada:boolean;
begin
if not (key=chr(13)) then exit;
if trim(alamat.text)='' then
  begin
    messagedlg('Harap isi kolom alamat.',mtWarning,[mbOK],0);
    alamat.text:='';
    alamat.SetFocus;
  end
else
  begin
  table1.IndexFieldNames:='Nama Sekolah';
  ada:=table1.findkey([sekolah.text]);
  if ada then
    begin
      edit.enabled:=true;
      edit.SetFocus;
    end
  else
    begin
      messagedlg('Data baru.',mtInformation,[mbok],0);
      baru.Enabled:=true;
      baru.setfocus;
    end;
  end;
end;

procedure Tfsekolah.baruClick(Sender: TObject);
begin
table1.append;
table1['Tingkat']:=tingkat.text;
table1['Nama Sekolah']:=sekolah.text;
table1['Alamat']:=alamat.Text;
table1.post;
tingkat.Text:='';
sekolah.enabled:=false;
sekolah.text:='';
alamat.enabled:=false;
alamat.text:='';
baru.enabled:=false;
messagedlg('Data berhasil disimpan.',mtInformation,[mbok],0);
hapus.enabled:=true;
end;

procedure Tfsekolah.editClick(Sender: TObject);
begin
table1.edit;
table1['Tingkat']:=tingkat.text;
table1['Nama Sekolah']:=sekolah.text;
table1['Alamat']:=alamat.Text;
table1.post;
tingkat.Text:='';
sekolah.enabled:=false;
sekolah.text:='';
alamat.enabled:=false;
alamat.text:='';
edit.enabled:=false;
messagedlg('Data berhasil diedit.',mtInformation,[mbok],0);
hapus.enabled:=true;
end;

procedure Tfsekolah.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

procedure Tfsekolah.hapusClick(Sender: TObject);
begin
if messagedlg('Ingin hapus data?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    tingkat.Enabled:=false;
    hapus.Visible:=false;
    baru.enabled:=false;
    edit.enabled:=false;
    GroupBox1.visible:=true;
    edhapus.setfocus;
  end;
end;

procedure Tfsekolah.edhapusKeyPress(Sender: TObject; var Key: Char);
var ada:boolean;
begin
if not (key=chr(13)) then exit;
if trim(edhapus.text)='' then
  begin
    messagedlg('Data harus diisi.', mtwarning, [mbOK],0);
    exit;
  end
else
  begin
  table1.IndexFieldNames:='Nama Sekolah';
  ada:=table1.FindKey([edhapus.text]);
  if ada then
    begin
      messagedlg('Data ditemukan.',mtInformation,[mbok],0);
      bthapus.Enabled:=true;
      bthapus.SetFocus;
    end
  else
    begin
      messagedlg('Data tidak ditemukan.', mterror, [mbOK],0);
      edhapus.setfocus;
      exit;
    end;
  end;
end;

procedure Tfsekolah.bthapusClick(Sender: TObject);
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
    GroupBox1.visible:=false;
    hapus.Visible:=true;
    tingkat.enabled:=true;
    baru.enabled:=false;
    edit.Enabled:=false;
  end;
end;
procedure Tfsekolah.keluarClick(Sender: TObject);
begin
if messagedlg('Anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    close;
  end;
end;

procedure Tfsekolah.btkembaliClick(Sender: TObject);
begin
bthapus.enabled:=false;
edhapus.Text:='';
GroupBox1.visible:=false;
hapus.Visible:=true;
tingkat.enabled:=true;
baru.enabled:=false;
edit.enabled:=false;
baru.visible:=true;
edit.visible:=true;
end;

procedure Tfsekolah.transaksiClick(Sender: TObject);
begin
if messagedlg('Apakah ingin melanjutkan transaksi?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
    fsekolah.hide;
    ftransaksi.Show;
  end;
end;

procedure Tfsekolah.ableMasterBuku1Click(Sender: TObject);
begin
if messagedlg('Apakah Anda ingin ke Table Master Buku?', mtConfirmation, [mbYes,mbNo],0)= mrYes then
  begin
    fsekolah.Hide;
    fbuku.Show;
  end;
end;

procedure Tfsekolah.ransaksi1Click(Sender: TObject);
begin
if messagedlg('Apakah Anda ingin melanjutkan Transaksi?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
    fsekolah.Hide;
    ftransaksi.Show;
  end;
end;

procedure Tfsekolah.Keluar1Click(Sender: TObject);
begin
if messagedlg('Anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    close;
  end;
end;

procedure Tfsekolah.baruExit(Sender: TObject);
begin
baru.enabled:=false;
end;

procedure Tfsekolah.editExit(Sender: TObject);
begin
edit.Enabled:=false;
end;



procedure Tfsekolah.T1Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\transaksi\transaksi.pdf', nil, nil, SW_SHOWNORMAL);
end;

procedure Tfsekolah.M1Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\buku\buku.pdf', nil,nil, SW_SHOWNORMAL);
end;

procedure Tfsekolah.M2Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\sekolah\sekolah.pdf', nil, nil, SW_SHOWNORMAL);
end;

end.
