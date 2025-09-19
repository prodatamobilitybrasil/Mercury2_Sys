unit uFrmPeriodUseTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, DBClient;

type
  TFrmPeriodUseTypes = class(TFrmBaseSys)
    Label7: TLabel;
    edDesc: TEdit;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    gbPeriodUseTypes: TGroupBox;
    lbDesc: TLabel;
    lblStatusCardUsers: TLabel;
    dbDesc: TDBEdit;
    dbStatus: TRxDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFilterExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
  private
    { Private declarations }
    procedure setStatus(Enabled: Boolean);
  public
    { Public declarations }
  end;

var
  FrmPeriodUseTypes: TFrmPeriodUseTypes;

implementation

uses uFrmBaseCadastro, uDmSys1, AppSparkSysMain, uDmConexao, uGeralFunctions, uConst;

{$R *.dfm}

procedure TFrmPeriodUseTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsPeriodUseTypes;

end;

procedure TFrmPeriodUseTypes.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsPeriodUseTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsPeriodUseTypes.RecordCount ) + ' Registro(s)';
  // Deixa label de pesquisa avançada invisível, pois tela não possui pesquisa avançada 
  lblAdvancedSearch.Visible := False;
  
end;

procedure TFrmPeriodUseTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsPeriodUseTypes]);
  FrmPeriodUseTypes := nil;
end;

procedure TFrmPeriodUseTypes.actFilterExecute(Sender: TObject);
var
  strSQL, strWhere: String;
begin
  inherited;
  // Faz o a pesquisa de acordo com os filtros especificados
  with dmSys1 do
  begin
    strWhere  := ' WHERE UPPER(PUT_DESC) LIKE UPPER(' + QuotedStr(Trim(edDesc.Text) + '%') + ') ';
    case lkFilterStatus.ItemIndex of
      -1, 0: strWhere := strWhere + ' AND PUT_STATUS = ''A'''; // Registros Ativos
      1: strWhere := strWhere + ' AND PUT_STATUS = ''I'''; // Registros Inativos
    end;
    strSQL := ' SELECT PUT.*, PUT.PUT_STATUS AS STATUS_ID ' +
              ' FROM PERIODUSETYPES PUT ' +
              strWhere +
              ' ORDER BY PUT_DESC ';

    cdsPeriodUseTypes.Close;
    cdsPeriodUseTypes.CommandText := strSQL;
    cdsPeriodUseTypes.Open;

    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('PUT_ID', 'FROM PERIODUSETYPES', 'True', strWhere) ) + ' Registro(s)';
  end;
end;

procedure TFrmPeriodUseTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsPeriodUseTypes);
  SetActions([], False, FrmPeriodUseTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmPeriodUseTypes, t_form_objects);
  setStatus(True);
  dbdesc.SetFocus;
end;

procedure TFrmPeriodUseTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmPeriodUseTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmPeriodUseTypes, t_form_objects);
  setStatus(True);
  dbDesc.SetFocus;
end;

procedure TFrmPeriodUseTypes.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys([dbDesc, dbStatus], [dmSys1.cdsPeriodUseTypes]) then
       Begin
         SetActions([], True, FrmPeriodUseTypes, t_form_objects);
         SetActions([actApplyUpdates, actCancel], False, FrmPeriodUseTypes, t_form_objects);
         setStatus(False);
         tbtnRefresh.Click;
       end;
  end;
end;

procedure TFrmPeriodUseTypes.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsPeriodUseTypes.Cancel;
    SetActions([], True, FrmPeriodUseTypes, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmPeriodUseTypes, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    setStatus(False);
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;
{}

end;

procedure TFrmPeriodUseTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
  begin
    TClientDataSet(dtsMaster.DataSet).Edit;
    TClientDataSet(dtsMaster.DataSet).FieldByName('PUT_STATUS').AsString := 'I';
    ApplyTablesSys([], [TClientDataSet(dtsMaster.DataSet)]);
    tbtnRefresh.Click;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end;

  actLog.Enabled := TClientDataSet(dtsMaster.DataSet).RecordCount > 0;
end;

procedure TFrmPeriodUseTypes.setStatus(Enabled: Boolean);
begin
  gbPeriodUseTypes.Enabled := Enabled;
end;

procedure TFrmPeriodUseTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
    SetStatus(False);
end;

end.
