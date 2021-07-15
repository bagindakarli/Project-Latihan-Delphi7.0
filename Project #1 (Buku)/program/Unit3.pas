unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, XPMan, DB, DBTables, StdCtrls, ExtCtrls, DBCtrls,
  jpeg, ComCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    XPManifest1: TXPManifest;
    Image1: TImage;
    Button3: TButton;
    kelas: TEdit;
    namab: TEdit;
    Button4: TButton;
    Button5: TButton;
    nota: TEdit;
    sekolah: TEdit;
    Button6: TButton;
    id: TEdit;
    Button7: TButton;
    Label2: TLabel;
    Button8: TButton;
    hapus: TButton;
    Database1: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bnotaClick(Sender: TObject);
    procedure bsekolahClick(Sender: TObject);
    procedure bidClick(Sender: TObject);
    procedure bnamabClick(Sender: TObject);
    procedure bkelasClick(Sender: TObject);
    procedure hapusClick(Sender: TObject);
    procedure notaKeyPress(Sender: TObject; var Key: Char);
    procedure sekolahKeyPress(Sender: TObject; var Key: Char);
    procedure idKeyPress(Sender: TObject; var Key: Char);
    procedure namabKeyPress(Sender: TObject; var Key: Char);
    procedure kelasKeyPress(Sender: TObject; var Key: Char);
    procedure Button8Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit2, Unit4;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
if messagedlg('Apakah anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    application.Terminate;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
if messagedlg('Apakah anda ingin kembali?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    nota.Text:='';
    sekolah.text:='';
    id.Text:='';
    namab.Text:='';
    kelas.text:='';
    form3.hide;
    form2.show;
    form2.nota.setfocus;
  end;
end;

procedure TForm3.bnotaClick(Sender: TObject);
begin
if nota.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    nota.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Nomor Nota';
    table1.findkey([nota.text]);
    table1.IndexFieldNames:='Nomor Nota';
    table1.findnearest([nota.text]);
    if not table1.Locate('Nomor Nota', nota.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        nota.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    nota.Text:='';
  end;
end;

procedure TForm3.bsekolahClick(Sender: TObject);
begin
if sekolah.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    sekolah.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Sekolah';
    table1.findkey([sekolah.text]);
    table1.IndexFieldNames:='Sekolah';
    table1.findnearest([sekolah.text]);
    if not table1.Locate('Sekolah', sekolah.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        sekolah.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    sekolah.Text:='';
  end;
end;

procedure TForm3.bidClick(Sender: TObject);
begin
if id.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    id.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='ID Buku';
    table1.findkey([id.text]);
    table1.IndexFieldNames:='ID Buku';
    table1.findnearest([id.text]);
    if not table1.Locate('ID Buku', id.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        id.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    id.text:='';
  end;
end;

procedure TForm3.bnamabClick(Sender: TObject);
begin
if namab.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    namab.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Nama Buku';
    table1.findkey([namab.text]);
    table1.IndexFieldNames:='Nama Buku';
    table1.findnearest([namab.text]);
    if not table1.Locate('Nama Buku', namab.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        namab.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    namab.text:='';
  end;
end;

procedure TForm3.bkelasClick(Sender: TObject);
begin
if kelas.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    kelas.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Kelas';
    table1.findkey([kelas.text]);
    table1.IndexFieldNames:='Kelas';
    table1.findnearest([kelas.text]);
    if not table1.Locate('Kelas', kelas.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        kelas.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    kelas.text:='';
  end;
end;

procedure TForm3.hapusClick(Sender: TObject);
begin
if table1.IsEmpty then
  begin
    showmessage('Data Kosong');
    hapus.setfocus;
  end
else
  begin
    if messagedlg('Apakah data ingin dihapus?', mtConfirmation, [mbYes,mbNo],0) = mrYes then
      begin
        table1.Delete;
      end
  end;
end;



procedure TForm3.notaKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    showmessage('Hanya bisa ketik angka');
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if nota.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    nota.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Nomor Nota';
    table1.findkey([nota.text]);
    table1.IndexFieldNames:='Nomor Nota';
    table1.findnearest([nota.text]);
    if not table1.Locate('Nomor Nota', nota.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        nota.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    nota.Text:='';
  end;
end;

procedure TForm3.sekolahKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if sekolah.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    sekolah.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Sekolah';
    table1.findkey([sekolah.text]);
    table1.IndexFieldNames:='Sekolah';
    table1.findnearest([sekolah.text]);
    if not table1.Locate('Sekolah', sekolah.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        sekolah.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    sekolah.Text:='';
  end;
end;

procedure TForm3.idKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if id.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    id.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='ID Buku';
    table1.findkey([id.text]);
    table1.IndexFieldNames:='ID Buku';
    table1.findnearest([id.text]);
    if not table1.Locate('ID Buku', id.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        id.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    id.text:='';
  end;
end;

procedure TForm3.namabKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['A'..'Z', 'a'..'z', #8, #13, #32]) then
  begin
    showmessage('Hanya bisa ketik huruf');
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if namab.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    namab.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Nama Buku';
    table1.findkey([namab.text]);
    table1.IndexFieldNames:='Nama Buku';
    table1.findnearest([namab.text]);
    if not table1.Locate('Nama Buku', namab.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        namab.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    namab.text:='';
  end;
end;

procedure TForm3.kelasKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #8, #13]) then
  begin
    showmessage('Hanya bisa ketik angka');
    key:=#0;
  end;
if not (key=chr(13)) then exit;
if kelas.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    kelas.setfocus;
  end
else
  begin
    table1.IndexFieldNames:='Kelas';
    table1.findkey([kelas.text]);
    table1.IndexFieldNames:='Kelas';
    table1.findnearest([kelas.text]);
    if not table1.Locate('Kelas', kelas.text,[]) then
      begin
        showmessage('Data tidak ditemukan');
        kelas.SetFocus;
        hapus.enabled:=false;
      end
    else
      begin
        showmessage('Data ditemukan');
        hapus.enabled:=true;
        hapus.setfocus;
      end;
    kelas.text:='';
  end;
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
if messagedlg('Apakah ingin kembali ke Menu?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    nota.Text:='';
    sekolah.text:='';
    id.Text:='';
    namab.text:='';
    kelas.text:='';
    form3.Hide;
    form4.show;
    form4.Button1.setfocus;
  end;
end;

procedure TForm3.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

end.
