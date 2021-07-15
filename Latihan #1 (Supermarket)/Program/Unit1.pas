unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, DBTables, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    nota: TEdit;
    kasir: TEdit;
    kodeb: TEdit;
    namab: TEdit;
    hargab: TEdit;
    jumlah: TEdit;
    total: TEdit;
    Table1: TTable;
    Database1: TDatabase;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    beli: TButton;
    edit: TButton;
    hapus: TButton;
    bersihkan: TButton;
    groupkode: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure notaKeyPress(Sender: TObject; var Key: Char);
    procedure kasirKeyPress(Sender: TObject; var Key: Char);
    procedure kodebKeyPress(Sender: TObject; var Key: Char);
    procedure jumlahKeyPress(Sender: TObject; var Key: Char);
    procedure beliClick(Sender: TObject);
    procedure editClick(Sender: TObject);
    procedure bersihkanClick(Sender: TObject);
    procedure hapusClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.notaKeyPress(Sender: TObject; var Key: Char);
var ada : boolean;
begin
  if not (key in['0'..'9', #8, #13]) then
    begin
      showmessage('Hanya bisa mengetik angka!');
      key:=#0;
    end;
  if not (key=chr(13)) then exit;
    if nota.Text='' then
      begin
        showmessage('Isilah data dengan benar');
        nota.setfocus;
      end
    else
      begin
        table1.IndexName:='';
        ada:=table1.FindKey([nota.text]);
        if ada then
          begin
            if messagedlg('Data sudah ada, apakah ingin diubah?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              begin
                nota.text:=table1['Nomor Nota'];
                kasir.text:=table1['Nama Kasir'];
                kodeb.text:=table1['Kode Barang'];
                namab.text:=table1['Nama Barang'];
                hargab.text:=table1['Harga Barang'];
                jumlah.text:=table1['Jumlah'];
                total.text:=table1['Total'];
                kasir.SetFocus;
              end
          end
        else
          begin
            showmessage('Data baru, silahkan lanjutkan transaksi');
            kasir.setfocus;
          end;
      end;
end;

procedure TForm1.kasirKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in['A'..'Z', 'a'..'z', #8,#13,#32]) then
  begin
    showmessage('Hanya bisa mengetik huruf');
    key:=#0;
  end;
 if not (key=chr(13)) then exit;
  if kasir.text='' then
   begin
    showmessage('Mohon Isi Nama Petugas Kasir');
    kasir.setfocus;
   end
  else
   begin
    kodeb.SetFocus;
    groupkode.Visible:=true;
   end;
end;

procedure TForm1.kodebKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['A'..'Z', 'a'..'z', #8, #13]) then
    begin
      showmessage('Hanya bisa mengetik huruf');
      key:=#0
    end;
  if not (key=chr(13)) then exit;
    if kodeb.text='BRS' then
      begin
        namab.text:='Beras';
        hargab.text:='50000';
        jumlah.setfocus;
      end
    else if kodeb.text='brs' then
      begin
        namab.text:='Beras';
        hargab.text:='50000';
        jumlah.setfocus;
      end
    else if kodeb.text='SBL' then
      begin
        namab.text:='Sambel';
        hargab.text:='5000';
        jumlah.setfocus;
      end
    else if kodeb.text='sbl' then
      begin
        namab.text:='Sambel';
        hargab.text:='5000';
        jumlah.setfocus;
      end
    else if kodeb.text='MYK' then
      begin
        namab.text:='Minyak';
        hargab.text:='15000';
        jumlah.setfocus;
      end
    else if kodeb.text='myk' then
      begin
        namab.text:='Minyak';
        hargab.text:='15000';
        jumlah.setfocus;
      end
    else if kodeb.text='TLR' then
      begin
        namab.text:='Telor';
        hargab.text:='2000';
        jumlah.setfocus;
      end
    else if kodeb.text='tlr' then
      begin
        namab.text:='Telor';
        hargab.text:='2000';
        jumlah.setfocus;
      end
    else if kodeb.text='BWG' then
      begin
        namab.text:='Bawang';
        hargab.text:='500';
        jumlah.SetFocus;
      end
    else if kodeb.text='bwg' then
      begin
        namab.text:='Bawang';
        hargab.text:='500';
        jumlah.SetFocus;
      end
    else
      begin
        showmessage('Barang tidak ada');
        kodeb.setfocus;
      end;
end;

procedure TForm1.jumlahKeyPress(Sender: TObject; var Key: Char);
var jum:real;
    hrg, tot:currency;
begin
  if not (key in['0'..'9', #8, #13]) then
    begin
      showmessage('Hanya bisa mengetik angka');
      key:=#0;
    end;
  if not (key=chr(13)) then exit;
  if jumlah.text='' then
    begin
      showmessage('Data tidak boleh kosong');
      jumlah.setfocus;
    end
  else
    begin
      jum:=strtoint(jumlah.text);
      hrg:=strtocurr(hargab.text);
      tot:=jum*hrg;
      total.text:=currtostr(tot);
      beli.setfocus;
    end;
end;

procedure TForm1.beliClick(Sender: TObject);
begin
if messagedlg('Apakah anda yakin ingin membeli barang tersebut?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    table1.append;
    table1['Nomor Nota']:=nota.text;
    table1['Nama Kasir']:=kasir.Text;
    table1['Kode Barang']:=kodeb.text;
    table1['Nama Barang']:=namab.text;
    table1['Harga Barang']:=strtocurr(hargab.text);
    table1['Jumlah']:=strtocurr(jumlah.Text);
    table1['Total']:=strtocurr(total.text);
    table1.Post;
    showmessage('Pembelian Anda berhasil, Terima Kasih');
    nota.text:='';
    kasir.text:='';
    kodeb.text:='';
    namab.text:='';
    hargab.Text:='';
    jumlah.text:='';
    total.text:='';
    nota.SetFocus;
    groupkode.Visible:=false;
  end;
end;

procedure TForm1.editClick(Sender: TObject);
begin
    table1.edit;
    table1['Nomor Nota']:=nota.text;
    table1['Nama Kasir']:=kasir.Text;
    table1['Kode Barang']:=kodeb.text;
    table1['Nama Barang']:=namab.text;
    table1['Harga Barang']:=strtocurr(hargab.text);
    table1['Jumlah']:=strtocurr(jumlah.Text);
    table1['Total']:=strtocurr(total.text);
    table1.Post;
    showmessage('Data berhasil diganti, Terima Kasih');
    groupkode.Visible:=false;
end;

procedure TForm1.bersihkanClick(Sender: TObject);
begin
nota.text:='';
kasir.text:='';
kodeb.text:='';
namab.text:='';
hargab.Text:='';
jumlah.text:='';
total.text:='';
nota.SetFocus;
groupkode.Visible:=false;
end;

procedure TForm1.hapusClick(Sender: TObject);
begin
table1.delete;
showmessage('Data sudah dihapus');
end;

end.
