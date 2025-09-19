unit ufrmSearchTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Db, DbTables, DbClient, StdCtrls, Buttons, CheckLst, ExtCtrls;

type
  Resultado = Array of String;

  TfrmSearchTable = class(TForm)
    lstKeys: TListBox;
    pnlList: TPanel;
    chklstBox: TCheckListBox;
    pnlButtons: TPanel;
    btnCheckAll: TBitBtn;
    btnUncheckAll: TBitBtn;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    procedure btnCheckAllClick(Sender: TObject);
    procedure btnUncheckAllClick(Sender: TObject);
  private
    { Private declarations }
    pDataSet   : TClientDataSet;
    pExibField : String;
    pKeyField  : String;
  public
    { Public declarations }
  published
    property DataSet   : TClientDataSet read pDataSet   write pDataSet;
    property ExibField : String         read pExibField write pExibField;
    property KeyField  : String         read pKeyField  write pKeyField;
    procedure LetsDoIt(var Resultado : Array of String);
  end;

var
  frmSearchTable: TfrmSearchTable;

implementation

{$R *.dfm}

{ TfrmSearchTable }

procedure TfrmSearchTable.LetsDoIt(var Resultado : Array of String);
var
  i,z : Integer;
begin
  if not DataSet.Active then
    DataSet.Open;
  DataSet.First;
  while not DataSet.Eof do
  begin
    chklstBox.Items.Add(DataSet.FieldByName(ExibField).AsString);
    lstKeys.Items.Add(DataSet.FieldByName(KeyField).AsString);
    DataSet.Next;
  end;
  z := 0;
  while Trim(Resultado[z]) <> '' do
  begin
     for i := 0 to (lstKeys.Items.Count - 1) do
     begin
       if lstKeys.Items.Strings[i] = Resultado[z] then
         chklstBox.Checked[i] := True;
     end;
     z := z + 1;
  end;

  ShowModal;
  if ModalResult = mrOk then
  begin
    for i := 0 to (Length(Resultado) - 1) do
      Resultado[i] := '';

    z := 0;
    for i := 0 to (lstKeys.Items.Count - 1) do
    begin
      if chklstBox.Checked[i] then
      begin
        Resultado[z] := lstKeys.Items.Strings[i];
        z := z + 1;
      end;
    end;
    Close;
  end
  else
    Close;
end;

procedure TfrmSearchTable.btnCheckAllClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to (lstKeys.Items.Count - 1) do
    chklstBox.Checked[i] := True;
end;

procedure TfrmSearchTable.btnUncheckAllClick(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to (lstKeys.Items.Count - 1) do
    chklstBox.Checked[i] := False;
end;

end.
