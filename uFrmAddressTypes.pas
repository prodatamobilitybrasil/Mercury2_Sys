unit uFrmAddressTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb;

type
  TFrmAddressTypes = class(TFrmBaseSys)
    edtShortDesc: TEdit;
    edtLongDesc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbShortDesc: TDBEdit;
    dbLongDesc: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure SetCtr;
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAddressTypes: TFrmAddressTypes;

implementation

uses uDmSys1, AppSparkSysMain, uFrmBaseCadastro, uFrmBase, uGeralFunctions,
  uConst, uDmConexao;

{$R *.dfm}

procedure TFrmAddressTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsAddressTypes]);
  FrmAddressTypes := nil;
end;

procedure TFrmAddressTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsAddressTypes;
end;

procedure TFrmAddressTypes.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsAddressTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsAddressTypes.RecordCount ) + ' Registro(s)';
end;

procedure TFrmAddressTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsAddressTypes);
  SetActions([], False, FrmAddressTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmAddressTypes, t_form_objects);
  SetCtr;
  dbShortDesc.SetFocus;
end;

procedure TFrmAddressTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmAddressTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmAddressTypes, t_form_objects);
  dbShortDesc.SetFocus;
end;

procedure TFrmAddressTypes.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys([dbShortDesc, dbLongDesc], [dmSys1.cdsAddressTypes]) then
       Begin
         SetActions([], True, FrmAddressTypes, t_form_objects);
         SetActions([actApplyUpdates, actCancel], False, FrmAddressTypes, t_form_objects);
         tbtnRefresh.Click;
       end;
  end;
end;

procedure TFrmAddressTypes.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsAddressTypes.Cancel;
    SetActions([], True, FrmAddressTypes, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmAddressTypes, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;
end;

procedure TFrmAddressTypes.SetCtr;
begin
  dbShortDesc.Enabled := (Status = stInsert);
end;

procedure TFrmAddressTypes.actDeleteExecute(Sender: TObject);
begin
  //inherited;
   If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dmSys1.cdsAddressTypes.Delete;
      dmSys1.cdsAddressTypes.ApplyUpdates(-1);
    end;  
end;

procedure TFrmAddressTypes.actFilterExecute(Sender: TObject);
var
  strWhere:string;
begin
  inherited;
  strWhere:='';

  If Trim(edtShortDesc.Text) <> '' then
  Begin
    strwhere:=' where';
    strWhere := strWhere + ' addresstypes.at_shortdesc LIKE ' + QuotedStr(Trim(edtShortDesc.Text) + '%');
  end;

  If Trim(edtLongDesc.Text) <> '' then
    if strWhere <> '' then
    Begin
      strWhere := strWhere + ' and addresstypes.at_longdesc LIKE ' + QuotedStr(Trim(edtLongDesc.Text) + '%')
    end
    else
    Begin
      strWhere := ' where';
      strWhere := strWhere + ' addresstypes.at_longdesc LIKE ' + QuotedStr(Trim(edtLongDesc.Text) + '%');
    end;

  With dmSys1 do
  Begin
    cdsAddressTypes.Close;
    cdsAddressTypes.CommandText:='select * from Addresstypes' + strwhere;
    cdsAddressTypes.Open;
  end;

  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsAddressTypes.RecordCount ) + ' Registro(s)';
end;

end.
