object Form1: TForm1
  Left = 309
  Top = 169
  Width = 716
  Height = 319
  Caption = 'Table Master'
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 13
  object TLabel
    Left = 88
    Top = 80
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 88
    Top = 112
    Width = 61
    Height = 14
    Caption = 'Nama Buku'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 88
    Top = 144
    Width = 30
    Height = 14
    Caption = 'Kelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 88
    Top = 176
    Width = 102
    Height = 14
    Caption = 'Harga Satuan Buku'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 88
    Top = 80
    Width = 41
    Height = 14
    Caption = 'ID Buku'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label12: TLabel
    Left = 96
    Top = 16
    Width = 573
    Height = 24
    Caption = 'TOKO BUKU ANAK SEKOLAH PT.BINTANG BANJARBARU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object GroupBox1: TGroupBox
    Left = 320
    Top = 56
    Width = 337
    Height = 113
    Caption = 'ID Buku'
    TabOrder = 7
    object Label5: TLabel
      Left = 8
      Top = 24
      Width = 97
      Height = 13
      Caption = '([Kode Buku][Kelas])'
    end
    object Label6: TLabel
      Left = 128
      Top = 24
      Width = 59
      Height = 13
      Caption = 'Kode Buku :'
    end
    object Label7: TLabel
      Left = 192
      Top = 24
      Width = 87
      Height = 13
      Caption = 'Matematika (MTK)'
    end
    object Label8: TLabel
      Left = 192
      Top = 40
      Width = 138
      Height = 13
      Caption = 'Ilmu Pengetahuan Alam (IPA)'
    end
    object Label9: TLabel
      Left = 192
      Top = 56
      Width = 98
      Height = 13
      Caption = 'Bahasa Inggris (ING)'
    end
    object Label10: TLabel
      Left = 128
      Top = 72
      Width = 83
      Height = 13
      Caption = 'Kelas          : 1-12'
    end
    object Label11: TLabel
      Left = 128
      Top = 88
      Width = 90
      Height = 13
      Caption = 'Contoh       : MTK1'
    end
  end
  object id: TEdit
    Left = 192
    Top = 80
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 0
    OnKeyPress = idKeyPress
  end
  object namab: TEdit
    Left = 192
    Top = 112
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = namabKeyPress
  end
  object kelas: TEdit
    Left = 192
    Top = 144
    Width = 121
    Height = 21
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 2
    ParentFont = False
    TabOrder = 2
    OnKeyPress = kelasKeyPress
  end
  object hargab: TEdit
    Left = 192
    Top = 176
    Width = 121
    Height = 21
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnKeyPress = hargabKeyPress
  end
  object baru: TButton
    Left = 64
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Simpan Baru'
    Enabled = False
    TabOrder = 4
    OnClick = baruClick
  end
  object edit: TButton
    Left = 152
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Simpan Edit'
    Enabled = False
    TabOrder = 5
    OnClick = editClick
  end
  object transaksi: TButton
    Left = 240
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Transaksi'
    TabOrder = 6
    OnClick = transaksiClick
  end
  object Button1: TButton
    Left = 352
    Top = 208
    Width = 137
    Height = 40
    Caption = 'Keluar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 504
    Top = 208
    Width = 137
    Height = 41
    Caption = 'Menu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = Button2Click
  end
  object XPManifest1: TXPManifest
    Left = 8
    Top = 104
  end
  object Database1: TDatabase
    AliasName = 'Buku'
    Connected = True
    DatabaseName = 'buku'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 8
    Top = 8
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'buku'
    TableName = 'tMasterBuku'
    Left = 8
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 8
    Top = 72
  end
end
