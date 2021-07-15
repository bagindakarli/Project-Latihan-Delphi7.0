object fbuku: Tfbuku
  Left = 284
  Top = 104
  Width = 885
  Height = 435
  Caption = 'Table Master Buku'
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
    Left = 96
    Top = 96
    Width = 56
    Height = 13
    Caption = 'Nama Buku'
  end
  object Label2: TLabel
    Left = 96
    Top = 176
    Width = 26
    Height = 13
    Caption = 'Kelas'
  end
  object Label3: TLabel
    Left = 96
    Top = 256
    Width = 39
    Height = 13
    Caption = 'ID Buku'
  end
  object Label4: TLabel
    Left = 96
    Top = 136
    Width = 36
    Height = 13
    Caption = 'Tingkat'
  end
  object Label5: TLabel
    Left = 96
    Top = 216
    Width = 66
    Height = 13
    Caption = 'Harga Satuan'
  end
  object Label6: TLabel
    Left = 48
    Top = 32
    Width = 558
    Height = 24
    Caption = 'TOKO BUKU ANAK SEKOLAH PT. BINTANG BANJARBARU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object id: TEdit
    Left = 176
    Top = 256
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object namab: TComboBox
    Left = 176
    Top = 96
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = namabChange
    Items.Strings = (
      'MATEMATIKA'
      'ILMU PENGETAHUAN ALAM'
      'BAHASA INGGRIS')
  end
  object tingkat: TComboBox
    Left = 176
    Top = 136
    Width = 121
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 2
    OnChange = tingkatChange
    Items.Strings = (
      'SD/Sederajat'
      'SMP/Sederajat'
      'SMA/Sederajat')
  end
  object kelas: TComboBox
    Left = 176
    Top = 176
    Width = 121
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 3
    OnChange = kelasChange
  end
  object hargab: TEdit
    Left = 176
    Top = 216
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
    OnKeyPress = hargabKeyPress
  end
  object cari: TButton
    Left = 64
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Cari ID Buku'
    Enabled = False
    TabOrder = 5
    OnClick = cariClick
  end
  object baru: TButton
    Left = 152
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Simpan Baru'
    Enabled = False
    TabOrder = 6
    OnClick = baruClick
  end
  object transaksi: TButton
    Left = 240
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Transaksi'
    TabOrder = 7
  end
  object menu: TButton
    Left = 768
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Menu'
    TabOrder = 8
  end
  object keluar: TButton
    Left = 768
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Keluar'
    TabOrder = 9
    OnClick = keluarClick
  end
  object DBGrid1: TDBGrid
    Left = 360
    Top = 88
    Width = 489
    Height = 120
    DataSource = DataSource1
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 472
    Top = 224
    Width = 220
    Height = 25
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
    TabOrder = 11
  end
  object Database1: TDatabase
    AliasName = 'bukubaru'
    Connected = True
    DatabaseName = 'masterbuku'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 616
    Top = 8
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'masterbuku'
    TableName = 'tMasterBuku'
    Left = 656
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 696
    Top = 8
  end
end
