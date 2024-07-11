object Form1: TForm1
  Left = 260
  Top = 220
  Width = 541
  Height = 398
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 40
    Top = 56
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl2: TLabel
    Left = 40
    Top = 80
    Width = 48
    Height = 13
    Caption = 'DISKRIPSi'
  end
  object edt1: TEdit
    Left = 112
    Top = 56
    Width = 361
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 112
    Top = 80
    Width = 361
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 40
    Top = 112
    Width = 81
    Height = 33
    Caption = 'Baru'
    TabOrder = 2
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 128
    Top = 112
    Width = 81
    Height = 33
    Caption = 'Simpan'
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 216
    Top = 112
    Width = 81
    Height = 33
    Caption = 'Ubah'
    TabOrder = 4
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 304
    Top = 112
    Width = 81
    Height = 33
    Caption = 'Hapus'
    TabOrder = 5
    OnClick = btn4Click
  end
  object dbgrd1: TDBGrid
    Left = 40
    Top = 152
    Width = 433
    Height = 129
    DataSource = ds1
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nama'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'diskripsi'
        Width = 247
        Visible = True
      end>
  end
  object edt3: TEdit
    Left = 136
    Top = 288
    Width = 337
    Height = 21
    TabOrder = 7
  end
  object btn5: TButton
    Left = 392
    Top = 112
    Width = 81
    Height = 33
    Caption = 'Batal'
    TabOrder = 8
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 40
    Top = 288
    Width = 89
    Height = 33
    Caption = 'Cari'
    TabOrder = 9
    OnClick = btn6Click
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\ACER\OneDrive\Documents\S4 SI\Visual 2\UTS\libmysql.dll'
    Left = 40
    Top = 16
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'Select * from satuan')
    Params = <>
    Left = 72
    Top = 16
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 104
    Top = 16
  end
end
