unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    dbgrd1: TDBGrid;
    edt3: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    btn5: TButton;
    btn6: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  edt1.Clear;
  edt2.Clear;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('INSERT INTO satuan (nama, diskripsi) VALUES (:nama, :diskripsi)');
  zqry1.ParamByName('nama').AsString := edt1.Text;
  zqry1.ParamByName('diskripsi').AsString := edt2.Text;
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('SELECT * FROM satuan');
  zqry1.Open;
  ShowMessage('Data Berhasil Disimpan!');
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
  edt1.Text := Form1.zqry1.Fields[1].AsString;
  edt2.Text := Form1.zqry1.Fields[2].AsString;
  a := Form1.zqry1.Fields[0].AsString;
end;

procedure TForm1.btn3Click(Sender: TObject);
var
  idValue: Integer;
begin
  if TryStrToInt(a, idValue) then
  begin
    zqry1.SQL.Clear;
    zqry1.SQL.Add('UPDATE satuan SET nama = :nama, diskripsi = :diskripsi WHERE id = :id');
    zqry1.ParamByName('nama').AsString := edt1.Text;
    zqry1.ParamByName('diskripsi').AsString := edt2.Text;
    zqry1.ParamByName('id').AsInteger := idValue;
    zqry1.ExecSQL;

    zqry1.SQL.Clear;
    zqry1.SQL.Add('SELECT * FROM satuan');
    zqry1.Open;
    ShowMessage('Data Berhasil Diubah!');
  end
  else
  begin
    ShowMessage('ID tidak valid!');
  end;
end;

procedure TForm1.btn4Click(Sender: TObject);
var
  idValue: Integer;
begin
  if TryStrToInt(a, idValue) then
  begin
    zqry1.SQL.Clear;
    zqry1.SQL.Add('DELETE FROM satuan WHERE id = :id');
    zqry1.ParamByName('id').AsInteger := idValue;
    zqry1.ExecSQL;

    zqry1.SQL.Clear;
    zqry1.SQL.Add('SELECT * FROM satuan');
    zqry1.Open;
    ShowMessage('Data Berhasil Dihapus!');
  end
  else
  begin
    ShowMessage('ID tidak valid!');
  end;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  edt1.Clear;
  edt2.Clear;
  edt3.Clear;
  edt1.SetFocus;
end;

procedure TForm1.btn6Click(Sender: TObject);
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('SELECT * FROM satuan WHERE nama LIKE :nama OR diskripsi LIKE :diskripsi');
  zqry1.ParamByName('nama').AsString := '%' + edt3.Text + '%';
  zqry1.ParamByName('diskripsi').AsString := '%' + edt3.Text + '%';
  zqry1.Open;

  if zqry1.RecordCount = 0 then
  begin
    ShowMessage('Data tidak ditemukan!');
  end;
end;

end.




