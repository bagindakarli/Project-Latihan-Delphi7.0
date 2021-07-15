object Form1: TForm1
  Left = 242
  Top = 153
  Width = 1219
  Height = 480
  Caption = 'Form1'
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
    Top = 40
    Width = 43
    Height = 13
    Caption = 'No. Nota'
  end
  object Label3: TLabel
    Left = 176
    Top = 72
    Width = 54
    Height = 13
    Caption = 'Nama Kasir'
  end
  object Label4: TLabel
    Left = 176
    Top = 104
    Width = 62
    Height = 13
    Caption = 'Kode Barang'
  end
  object Label5: TLabel
    Left = 176
    Top = 136
    Width = 65
    Height = 13
    Caption = 'Nama Barang'
  end
  object Label6: TLabel
    Left = 176
    Top = 168
    Width = 66
    Height = 13
    Caption = 'Harga Barang'
  end
  object Label7: TLabel
    Left = 176
    Top = 200
    Width = 33
    Height = 13
    Caption = 'Jumlah'
  end
  object Label8: TLabel
    Left = 176
    Top = 232
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object nota: TEdit
    Left = 248
    Top = 40
    Width = 121
    Height = 21
    MaxLength = 5
    TabOrder = 0
    OnKeyPress = notaKeyPress
  end
  object kasir: TEdit
    Left = 248
    Top = 72
    Width = 209
    Height = 21
    TabOrder = 1
    OnKeyPress = kasirKeyPress
  end
  object kodeb: TEdit
    Left = 248
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = kodebKeyPress
  end
  object namab: TEdit
    Left = 248
    Top = 136
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object hargab: TEdit
    Left = 248
    Top = 168
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object jumlah: TEdit
    Left = 248
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 5
    OnKeyPress = jumlahKeyPress
  end
  object total: TEdit
    Left = 248
    Top = 232
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 296
    Width = 1073
    Height = 120
    DataSource = DataSource1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object beli: TButton
    Left = 408
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Beli'
    TabOrder = 8
    OnClick = beliClick
  end
  object edit: TButton
    Left = 496
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 9
    OnClick = editClick
  end
  object hapus: TButton
    Left = 672
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Hapus'
    TabOrder = 10
    OnClick = hapusClick
  end
  object bersihkan: TButton
    Left = 584
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Bersihkan'
    TabOrder = 11
    OnClick = bersihkanClick
  end
  object groupkode: TGroupBox
    Left = 496
    Top = 80
    Width = 145
    Height = 113
    Caption = 'KODE BARANG'
    TabOrder = 12
    Visible = False
    object Label14: TLabel
      Left = 40
      Top = 24
      Width = 70
      Height = 13
      Caption = 'BRS = BERAS'
    end
    object Label15: TLabel
      Left = 40
      Top = 40
      Width = 75
      Height = 13
      Caption = 'SBL = SAMBEL'
    end
    object Label16: TLabel
      Left = 40
      Top = 56
      Width = 76
      Height = 13
      Caption = 'MYK = MINYAK'
    end
    object Label17: TLabel
      Left = 40
      Top = 72
      Width = 69
      Height = 13
      Caption = 'TLR = TELOR'
    end
    object Label18: TLabel
      Left = 40
      Top = 88
      Width = 86
      Height = 13
      Caption = 'BWG = BAWANG'
    end
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'Supermarket'
    TableName = 'Supermarket'
    Left = 16
    Top = 32
  end
  object Database1: TDatabase
    AliasName = 'Supermarket'
    Connected = True
    DatabaseName = 'Supermarket'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 64
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 24
    Top = 72
  end
end
