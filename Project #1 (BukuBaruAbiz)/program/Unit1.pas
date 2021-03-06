unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ExtCtrls, DBCtrls, Grids, DBGrids, StdCtrls, XPMan,
  Mask, Menus, jpeg, shellapi;

type
  Tfbuku = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    id: TEdit;
    matpel: TComboBox;
    tingkat: TComboBox;
    kelas: TComboBox;
    hargab: TEdit;
    DBGrid1: TDBGrid;
    XPManifest1: TXPManifest;
    hapus: TButton;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    bthapus: TButton;
    hargab2: TEdit;
    edhapus: TEdit;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    ManualBook1: TMenuItem;
    ableMasterSekolah1: TMenuItem;
    ransaksi1: TMenuItem;
    Keluar1: TMenuItem;
    Database1: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    btkembali: TButton;
    Image1: TImage;
    T1: TMenuItem;
    M1: TMenuItem;
    M2: TMenuItem;
    procedure matpelChange(Sender: TObject);
    procedure tingkatChange(Sender: TObject);
    procedure kelasChange(Sender: TObject);
    procedure hargabKeyPress(Sender: TObject; var Key: Char);
    procedure matpelKeyPress(Sender: TObject; var Key: Char);
    procedure tingkatKeyPress(Sender: TObject; var Key: Char);
    procedure kelasKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure hapusClick(Sender: TObject);
    procedure edhapusKeyPress(Sender: TObject; var Key: Char);
    procedure bthapusClick(Sender: TObject);
    procedure hargab2KeyPress(Sender: TObject; var Key: Char);
    procedure ableMasterSekolah1Click(Sender: TObject);
    procedure ransaksi1Click(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btkembaliClick(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fbuku: Tfbuku;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}

procedure Tfbuku.matpelChange(Sender: TObject);
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

procedure Tfbuku.kelasChange(Sender: TObject);
begin
hargab.enabled:=true;
hargab.setfocus;
end;

procedure Tfbuku.hargabKeyPress(Sender: TObject; var Key: Char);
var a,b,c:string;
    ada:boolean;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    messagedlg('Hanya bisa input angka.', mtInformation, [mbOK],0);
    key:=#0
  end;
if not (key=chr(13)) then exit;
if hargab.text='' then
  begin
    messagedlg('Data tidak boleh kosong.', mtWarning, [mbOK],0);
    hargab.setfocus;
  end
else
  begin
    a:=matpel.text;
    b:=tingkat.text;
    c:=kelas.text;
    if a='MATEMATIKA' then
      begin
        if b='SD/Sederajat' then
          begin
            id.text:='MTK'+'-'+'SD'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end
        else if b='SMP/Sederajat' then
          begin
            id.text:='MTK'+'-'+'SMP'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end
        else if b='SMA/Sederajat' then
          begin
            id.text:='MTK'+'-'+'SMA'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end;
      end
    else if a='ILMU PENGETAHUAN ALAM' then
      begin
        if b='SD/Sederajat' then
          begin
            id.text:='IPA'+'-'+'SD'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end
        else if b='SMP/Sederajat' then
          begin
            id.text:='IPA'+'-'+'SMP'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end
        else if b='SMA/Sederajat' then
          begin
            id.text:='IPA'+'-'+'SMA'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end;
      end
    else if a='BAHASA INGGRIS' then
      begin
        if b='SD/Sederajat' then
          begin
            id.text:='ING'+'-'+'SD'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end
        else if b='SMP/Sederajat' then
          begin
            id.text:='ING'+'-'+'SMP'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end
        else if b='SMA/Sederajat' then
          begin
            id.text:='ING'+'-'+'SMA'+'-'+(kelas.text);
            table1.IndexFieldNames:='ID Buku';
            ada:=table1.FindKey([id.Text]);
            if ada then
              begin
                if messagedlg('Data sudah ada, ingin diedit', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
                  begin
                    messagedlg('Hanya bisa edit Harga Satuan Buku.', mtInformation, [mbOK],0);
                    id.text:=table1['ID Buku'];
                    matpel.text:=table1['Mata Pelajaran'];
                    matpel.Enabled:=false;
                    tingkat.text:=table1['Tingkat'];
                    tingkat.enabled:=false;
                    kelas.Text:=table1['Kelas'];
                    kelas.Enabled:=false;
                    hargab.visible:=false;
                    hargab2.visible:=true;
                    hargab2.text:=table1['Harga Satuan'];
                    hargab2.setfocus;
                  end;
              end
            else
              begin
                if messagedlg('Data baru, apakah ingin disimpan?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
                  begin
                    table1.append;
                    table1['Mata Pelajaran']:=matpel.text;
                    table1['Tingkat']:=tingkat.text;
                    table1['Kelas']:=kelas.text;
                    table1['Harga Satuan']:=hargab.Text;
                    table1['ID Buku']:=id.text;
                    table1.Post;
                    matpel.text:='';
                    tingkat.enabled:=false;
                    tingkat.text:='';
                    kelas.Enabled:=false;
                    kelas.Text:='';
                    hargab.enabled:=false;
                    hargab.text:='';
                    id.text:='';
                    messagedlg('Data berhasil disimpan.', mtInformation, [mbOK],0);
                    hapus.Enabled:=true;
                  end;
              end;
          end;
      end;
  end;
end;

procedure Tfbuku.matpelKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['A'..'Z', #8, #13]) then
  begin
    messagedlg('Pilih data dengan cara tekan tombol panah di samping.', mtInformation, [mbOK],0);
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if matpel.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    matpel.setfocus;
  end;
end;

procedure Tfbuku.tingkatKeyPress(Sender: TObject; var Key: Char);
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

procedure Tfbuku.kelasKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9', #8, #13]) then
  begin
    messagedlg('Pilih data dengan cara tekan tombol panah di samping.', mtInformation, [mbOK],0);
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if kelas.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    kelas.setfocus;
  end;
end;

procedure Tfbuku.FormShow(Sender: TObject);
begin
tingkat.enabled:=false;
kelas.enabled:=false;
hargab.Enabled:=false;
matpel.enabled:=true;
matpel.SetFocus;
hapus.enabled:=false
end;

procedure Tfbuku.FormHide(Sender: TObject);
begin
matpel.text:='';
tingkat.text:='';
kelas.text:='';
hargab.Text:='';
id.Text:='';
tingkat.enabled:=false;
kelas.enabled:=false;
hargab.Enabled:=false;
hapus.visible:=true;
hapus.enabled:=false;
GroupBox1.Visible:=false;
end;

procedure Tfbuku.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

procedure Tfbuku.hapusClick(Sender: TObject);
begin
if messagedlg('Ingin hapus data?',mtConfirmation,[mbYes,mbNo],0)= mryes then
  begin
    hapus.Visible:=false;
    GroupBox1.visible:=true;
    matpel.Enabled:=false;
    matpel.Text:='';
    tingkat.enabled:=false;
    tingkat.text:='';
    kelas.enabled:=false;
    kelas.text:='';
    hargab.enabled:=false;
    hargab.text:='';
    id.Enabled:=false;
    id.text:='';
    edhapus.SetFocus;
  end;
end;

procedure Tfbuku.edhapusKeyPress(Sender: TObject; var Key: Char);
var ada:boolean;
begin
if not (key=chr(13)) then exit;
if edhapus.text='' then
  begin
    messagedlg('Data tidak boleh kosong.', mtwarning, [mbOK],0);
    edhapus.Text:='';
    edhapus.SetFocus;
  end
else
  begin
  table1.IndexFieldNames:='ID Buku';
  ada:=table1.FindKey([edhapus.text]);
  if ada then
    begin
      messagedlg('Data ditemukan.', mtInformation, [mbOK],0);
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

procedure Tfbuku.bthapusClick(Sender: TObject);
begin
if edhapus.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtwarning,[mbok],0);
    edhapus.setfocus;
  end
else
  begin
    table1.Delete;
    messagedlg('Data sudah dihapus.', mtInformation, [mbOK],0);
    bthapus.enabled:=false;
    edhapus.Text:='';
    GroupBox1.visible:=false;
    hapus.Visible:=true;
    matpel.Enabled:=true;
    matpel.setfocus;
  end;
end;

procedure Tfbuku.hargab2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    messagedlg('Hanya bisa input angka.',mtInformation,[mbOK],0);
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if hargab2.text='' then
  begin
    messagedlg('Data tidak boleh kosong.',mtWarning,[mbOK],0);
    hargab2.SetFocus;
  end
else
  begin
    table1.edit;
    table1['Mata Pelajaran']:=matpel.text;
    table1['Tingkat']:=tingkat.text;
    table1['Kelas']:=kelas.text;
    table1['Harga Satuan']:=hargab2.text;
    table1['ID Buku']:=id.text;
    messagedlg('Data berhasil diedit.', mtInformation, [mbOK],0);
    matpel.Text:='';
    tingkat.text:='';
    kelas.text:='';
    id.Text:='';
    hargab.text:='';
    hargab2.Text:='';
    hargab2.Visible:=false;
    hargab.Visible:=true;
    matpel.enabled:=true;
    matpel.SetFocus;
    hapus.enabled:=true;
  end;
end;

procedure Tfbuku.ableMasterSekolah1Click(Sender: TObject);
begin
if messagedlg('Apakah Anda ingin ke Table Master Sekolah?', mtConfirmation, [mbYes,mbNo],0)= mrYes then
  begin
    fbuku.Hide;
    fsekolah.Show;
  end;
end;

procedure Tfbuku.ransaksi1Click(Sender: TObject);
begin
if messagedlg('Apakah Anda ingin melanjutkan Transaksi?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
    fbuku.Hide;
    ftransaksi.Show;
  end;
end;

procedure Tfbuku.Keluar1Click(Sender: TObject);
begin
if messagedlg('Anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    close;
  end;
end;

procedure Tfbuku.Button1Click(Sender: TObject);
begin
messagedlg('Tidak bisa hapus data.',mtError,[mbOK],0);
end;

procedure Tfbuku.btkembaliClick(Sender: TObject);
begin
bthapus.enabled:=false;
edhapus.Text:='';
GroupBox1.visible:=false;
hapus.Visible:=true;
matpel.enabled:=true;
matpel.SetFocus;
end;


procedure Tfbuku.T1Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\transaksi\transaksi.pdf', nil, nil, SW_SHOWNORMAL);
end;

procedure Tfbuku.M1Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\buku\buku.pdf', nil,nil, SW_SHOWNORMAL);
end;

procedure Tfbuku.M2Click(Sender: TObject);
begin
shellexecute(handle, 'open', 'D:\Users\Baginda Karli\SMK TELKOM\XI-D TKJ\Semester 2\PEMROGRAMAN DESKTOP\Project #1 (BukuBaruAbiz)\manual book\sekolah\sekolah.pdf', nil, nil, SW_SHOWNORMAL);
end;

end.
