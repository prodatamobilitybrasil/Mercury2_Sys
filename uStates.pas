unit uStates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, DBClient;

type
  TfrmStates = class(TFrmBaseSys)
    dbeST_CODE: TDBEdit;
    dbeST_DESC: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPesqDesc: TEdit;
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStates: TfrmStates;

implementation

uses uDmSys1, uFuncoes, uGeralFunctions, uFrmBaseCadastro, uDmConexao,
  uConst, AppSparkSysMain, uDmSys;

{$R *.dfm}

procedure TfrmStates.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsStates);
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeST_CODE.ReadOnly := False;
end;

procedure TfrmStates.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeST_CODE.ReadOnly := True;
end;

procedure TfrmStates.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;
  IF Trim(dbeST_CODE.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Código"   ', [], []);
     dbeST_CODE.SetFocus;
     exit;
    End
  else
  if dtsMaster.DataSet.State = dsInsert then
    Begin
     dmSys.cdsGeral.Close;
     DmSys.cdsGeral.CommandText := 'SELECT * FROM STATES WHERE ST_CODE = '+QuotedStr(dbeST_CODE.Text);
     DmSys.cdsGeral.Open;
     if not DmSys.cdsGeral.Eof then
       begin
        DisplayMsg(t_form_objects, 'Código já existente!   ', [], []);
        dbeST_CODE.SetFocus;
        exit;
       end;
    End;



  IF Trim(dbeST_DESC.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Descrição"   ', [], []);
     dbeST_DESC.SetFocus;
    End
  Else
  If DisplayMsg(t_form_objects, 'Confirma a gravação do registro?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Try
       dmConexao.ConnBrkMaster.AppServer.StartTransaction;

       (dtsMaster.DataSet as TClientDataSet).ApplyUpdates(-1);

       SetCCAActions([], True, Self);
       SetCCAActions([actApplyUpdates, actCancel], False, Self);
       actRefresh.Execute;

       status := stConsult;
       FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);

       dmConexao.ConnBrkMaster.AppServer.Commit;
     Except
       dmConexao.ConnBrkMaster.AppServer.RollBack;
     End;
     pcBaseCadastro.ActivePageIndex := 0;
   End;
   actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmStates.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, 'Confirma o cancelamento da edição do registro?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Status := stConsult;
     dtsMaster.DataSet.Cancel;
     (dtsMaster.DataSet as TClientDataSet).CancelUpdates;
     SetCCAActions([], True, Self);
     SetCCAActions([actApplyUpdates, actCancel], False, Self);
     pcBaseCadastro.ActivePageIndex := 0;
     actRefresh.Execute;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmStates.actDeleteExecute(Sender: TObject);
begin
// inherited;
  If DisplayMsg(t_form_objects, 'Confirma a exclusão do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
  begin
    dtsMaster.DataSet.Delete;
    (dtsMaster.DataSet as TClientDataSet).ApplyUpdates(-1);
    tbtnRefresh.Click;
    FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
  end; //With...

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmStates.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited;
  CloseTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  frmStates := Nil;
  Action := caFree;
end;

procedure TfrmStates.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsStates;
  SetCCAActions([], False, Self);
  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);
end;

procedure TfrmStates.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ST_CODE', 'FROM STATES', 'False', '') ) + ' Registro(s)';
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;

procedure TfrmStates.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edtPesqDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' ST_DESC LIKE ' + QuotedStr(edtPesqDesc.Text + '%') + ' AND ';
       end;

{     Case cbxProcuraStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SFC_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SFC_STATUS = ' + QuotedStr('I') + ' AND ';
           End;
      End; //Case...}

      // Verifica se é necessário tirar o AND

      if qtd_campos > 0 then
         begin
           i := Length(strWhere) - 4;
           strWhere := ' WHERE ' + Copy(strWhere,1,i);
         end;
    End;
begin
  inherited;
  strWhere  := '';
  BuiltStrWhere;

  dtsMaster.DataSet.Close;
  (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT * FROM STATES ' + strWhere + ' ORDER BY ST_CODE';
  dtsMaster.DataSet.Open;
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ST_CODE', 'FROM STATES', 'True', strWhere) ) + ' Registro(s)';

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
end;

procedure TfrmStates.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetCCAActions([], True, Self);
      SetCCAActions([actFilter, actDelete, actRefresh], False, Self);
      if not (dtsMaster.DataSet.State in [dsEdit, dsInsert]) then
        SetCCAActions([actApplyUpdates, actCancel], False, Self);
     End
  Else
    Begin
      SetCCAActions([], False, Self);
      SetCCAActions([actInsert, actFilter, actDelete, actRefresh, actExit], True, Self);
      if dtsMaster.DataSet.RecordCount > 0 then
        SetCCAActions([actEdit], True, Self);
    End;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
end;

end.
