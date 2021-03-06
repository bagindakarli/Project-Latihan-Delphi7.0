unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, XPMan, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    id: TEdit;
    namab: TEdit;
    kelas: TEdit;
    hargab: TEdit;
    Label1: TLabel;
    baru: TButton;
    edit: TButton;
    transaksi: TButton;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button1: TButton;
    XPManifest1: TXPManifest;
    Button2: TButton;
    Database1: TDatabase;
    Table1: TTable;
    DataSource1: TDataSource;
    procedure idKeyPress(Sender: TObject; var Key: Char);
    procedure namabKeyPress(Sender: TObject; var Key: Char);
    procedure kelasKeyPress(Sender: TObject; var Key: Char);
    procedure hargabKeyPress(Sender: TObject; var Key: Char);
    procedure baruClick(Sender: TObject);
    procedure transaksiClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit4;

{$R *.dfm}

procedure TForm1.idKeyPress(Sender: TObject; var Key: Char);
var ada : boolean;
begin
if not (key in['A'..'Z', 'a'..'z', '0'..'9', #8, #13]) then
  begin
    showmessage('Tidak bisa input SPASI atau yang mengandung simbol khusus');
    key:=#0;
  end;
if not (key=chr(13)) then exit;
  begin
    if id.text='' then
      begin
        showmessage('Mohon isi ID Buku dengan benar');
        id.setfocus;
      end
    else if id.text=' ' then
      begin
        showmessage('Mohon isi ID Buku dengan benar');
        id.Text:='';
        id.setfocus;
      end
    else
      begin
        table1.indexname:='';
        ada:=table1.FindKey([id.text]);
        if ada then
          begin
            namab.text:=table1['Nama Buku'];
            kelas.text:=table1['Kelas'];
            hargab.text:=table1['Harga Satuan Buku'];
            namab.Enabled:=false;
            kelas.Enabled:=false;
            hargab.enabled:=false;
            if messagedlg('Data sudah ada, ingin diedit?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
              begin
                hargab.Enabled:=true;
                hargab.SetFocus;
                groupbox1.Visible:=false;
              end
            else
              begin
                id.Text:='';
                namab.Text:='';
                kelas.text:='';
                hargab.text:='';
                id.enabled:=true;
                id.SetFocus;
                namab.enabled:=false;
                kelas.enabled:=false;
                hargab.enabled:=false;
                baru.enabled:=false;
                edit.enabled:=false;
              end;
          end
        else
          begin
            if messagedlg('Data tidak ada, ingin ditambahkan sebagai data baru?', mtconfirmation, [mbYes,mbNo], 0) = mrYes then
              begin
                namab.enabled:=true;
                namab.setfocus;
                groupbox1.Visible:=false;
              end;
          end;
      end;
  end
end;

procedure TForm1.namabKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['A'..'Z', 'a'..'z', #8, #13, #32]) then
  begin
   showmessage('Hanya Bisa Mengetik Huruf');
   key:=#0;
  end;
if not (key=chr(13)) then exit;
if namab.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    namab.SetFocus;
  end
else
  begin
    kelas.Enabled:=true;
    kelas.setfocus;
  end;
end;

procedure TForm1.kelasKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #8, #13]) then
  begin
   showmessage('Hanya Bisa Mengetik Angka');
   key:=#0;
  end;
if not (key=chr(13)) then exit;
if kelas.text='' then
  begin
    showmessage('Data tidak boleh kosong');
    kelas.SetFocus;
  end
else if kelas.text>='13' then
  begin
    showmessage('Maksimal Kelas 12 (3 SMA/SMK/Sederajat)');
    kelas.SetFocus;
  end
else
  begin
    hargab.Enabled:=true;
    hargab.setfocus;
  end;
end;

procedure TForm1.hargabKeyPress(Sender: TObject; var Key: Char);
var ada : boolean;
begin
if not (key in['0'..'9', #8, #13]) then
  begin
   showmessage('Hanya Bisa Mengetik Angka');
   key:=#0;
  end;
if not (key=chr(13)) then exit;
if hargab.text='' then
  begin
    showmessage('Isi harga dengan benar');
    hargab.SetFocus;
  end
else
  begin
    baru.Enabled:=true;
    edit.enabled:=true;
    baru.setfocus;
    table1.indexname:='';
    ada:=table1.findkey([id.text]);
    if ada then
    begin
      baru.enabled:=false;
      edit.setfocus;
    end;
  end;
end;

procedure TForm1.baruClick(Sender: TObject);
begin
table1.append;
table1['ID Buku']:=id.text;
table1['Nama Buku']:=namab.text;
table1['Kelas']:=kelas.text;
table1['Harga Satuan Buku']:=strtocurr(hargab.text);
table1.post;
if messagedlg ('Data berhasil ditambahkan, ingin melanjutkan transaksi?', mtConfirmation, [mbyes,mbNo], 0) = mrYes then
  begin
    id.text:='';
    namab.text:='';
    kelas.text:='';
    hargab.text:='';
    form1.hide;
    form2.show;
    form2.nota.setfocus;
  end
else
  begin
    id.text:='';
    namab.text:='';
    kelas.text:='';
    hargab.text:='';
    id.SetFocus;
    groupbox1.Visible:=true;
    baru.enabled:=false;
    edit.enabled:=false;
  end;
end;

procedure TForm1.transaksiClick(Sender: TObject);
begin
if messagedlg ('Ingin melanjutkan transaksi?', mtConfirmation, [mbyes,mbNo], 0) = mrYes then
  begin
    id.text:='';
    namab.text:='';
    kelas.text:='';
    hargab.text:='';
    form1.hide;
    form2.show;
    form2.nota.setfocus;
  end;
end;

procedure TForm1.editClick(Sender: TObject);
begin
table1.edit;
table1['ID Buku']:=id.text;
table1['Nama Buku']:=namab.text;
table1['Kelas']:=kelas.text;
table1['Harga Satuan Buku']:=strtocurr(hargab.text);
table1.post;
showmessage('Data berhasil di edit');
id.text:='';
namab.text:='';
kelas.text:='';
hargab.Text:='';
id.SetFocus;
groupbox1.Visible:=true;
baru.enabled:=false;
edit.enabled:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if messagedlg('Apakah anda yakin ingin keluar?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    application.Terminate;
  end
else
  begin
    id.setfocus;  
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if messagedlg('Apakah ingin kembali ke Menu?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    id.Text:='';
    namab.text:='';
    kelas.text:='';
    hargab.text:='';
    form1.Hide;
    form4.show;
    form4.Button1.setfocus;
  end;
end;

procedure TForm1.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=false;
end;

end.
