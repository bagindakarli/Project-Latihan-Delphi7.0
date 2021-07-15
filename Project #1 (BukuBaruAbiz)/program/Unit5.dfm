object fbook: Tfbook
  Left = 878
  Top = 321
  Width = 468
  Height = 371
  Caption = 'Manual Book'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 176
    Top = 32
    Width = 123
    Height = 24
    Caption = 'Manual Book'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 56
    Top = 80
    Width = 345
    Height = 185
    Lines.Strings = (
      '1. Masukkan Nomor Nota (hanya bisa input angka)'
      
        '2. Jika nomor nota sudah ada, data bisa di edit (simpan mengguna' +
        'kan '
      'tombol '#39'Simpan edit'#39
      '3. Jika nomor nota sudah ada, lanjut ke pengisian selanjutnya.'
      '4. Pilih tanggal pembelian'
      '5. Tulis ID buku yang tersedia (contoh penulisan tertera)'
      
        '6. Pilih nama sekolah, jika belum ada, daftarkan terlebih dahulu' +
        '.'
      '7. Jika sekolah sudah dipilih, silahkan edit atau biarkan kolom '
      #39'Alamat'#39
      '8. Jika sudah, masukkan banyak buku yang ingin dibeli'
      '9. Masukkan jumlah uang yang ingin dibayarkan'
      '10. Jika sudah, klik tombol '#39'Simpan Baru'#39
      '11. Selamat Transaksi Berhasil :)')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 200
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Kembali'
    TabOrder = 1
    OnClick = Button1Click
  end
end
