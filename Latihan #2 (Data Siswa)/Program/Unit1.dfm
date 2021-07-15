object Form1: TForm1
  Left = 192
  Top = 124
  Width = 928
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
    Left = 184
    Top = 80
    Width = 18
    Height = 13
    Caption = 'NIS'
  end
  object Label2: TLabel
    Left = 184
    Top = 120
    Width = 28
    Height = 13
    Caption = 'Nama'
  end
  object DBGrid1: TDBGrid
    Left = 104
    Top = 232
    Width = 377
    Height = 120
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object nis: TEdit
    Left = 224
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'nis'
    OnKeyPress = nisKeyPress
  end
  object nama: TEdit
    Left = 224
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'nama'
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 72
    Top = 40
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'DataSiswa'
    TableName = 'tSiswa'
    Left = 104
    Top = 40
  end
  object Database1: TDatabase
    AliasName = 'DataSiswa'
    Connected = True
    DatabaseName = 'dbSiswa'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 40
    Top = 40
  end
end
