unit uReasons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, DBCtrls, RxDBComb, Mask, DBClient;

type
  TfrmReasons = class(TFrmBaseSys)
    Label3: TLabel;
    edtPesqDesc: TEdit;
    Label4: TLabel;
    cbxProcura: TComboBox;
    Label1: TLabel;
    dbeRE_DESC: TDBEdit;
    Label2: TLabel;
    dbcRE_STATUS: TRxDBComboBox;
    dbcUT_ID: TDBLookupComboBox;
    dbcRT_ID: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReasons: TfrmReasons;

implementation

uses uDmSys1, uGeralFunctions, AppSparkSysMain, uConst, uDmConexao;

{$R *.dfm}

procedure TfrmReasons.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited;
  CloseTablesSys([(dtsMaster.DataSet as TClientDataSet), dmSys1.cdsReasonTypesLKP, dmSys1.cdsUserTypesLKP]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  frmReasons := Nil;
  Action := caFree;
end;

procedure TfrmReasons.FormCreate(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);
end;

procedure TfrmReasons.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([(dtsMaster.DataSet as TClientDataSet), dmSys1.cdsReasonTypesLKP, dmSys1.cdsUserTypesLKP]);
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('RE_ID', 'FROM REASONS', 'False', '') ) + ' Registro(s)';
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;

procedure TfrmReasons.pcBaseCadastroChange(Sender: TObject);
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

procedure TfrmReasons.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys((dtsMaster.DataSet as TClientDataSet));
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeRE_DESC.SetFocus;
end;

procedure TfrmReasons.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeRE_DESC.SetFocus;
end;

procedure TfrmReasons.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;

  IF Trim(dbeRE_DESC.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Descrição"   ', [], []);
     dbeRE_DESC.SetFocus;
    End
  Else
  IF Trim(dbcRE_STATUS.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Status"   ', [], []);
     dbcRE_STATUS.SetFocus;
    End
  Else
  IF Trim(dbcUT_ID.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Tipo de Usuário"   ', [], []);
     dbcUT_ID.SetFocus;
    End
  Else
  IF Trim(dbcRT_ID.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Tipo de Razão"   ', [], []);
     dbcRT_ID.SetFocus;
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

procedure TfrmReasons.actCancelExecute(Sender: TObject);
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

procedure TfrmReasons.actDeleteExecute(Sender: TObject);
begin
// inherited;
  if dtsMaster.DataSet.FieldByName('RE_STATUS').AsString = 'A' then
  begin
    If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dtsMaster.DataSet.Edit;
      dtsMaster.DataSet.FieldByName('RE_STATUS').AsString := 'I';
      dtsMaster.DataSet.Post;
      (dtsMaster.DataSet as TClientDataSet).ApplyUpdates(-1);
      tbtnRefresh.Click;
      FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end; //With...
  end
  else
    DisplayMsg(t_form_objects, 'ATENÇÃO: Esse registro já está desativado!   ', [], [], mtConfirmation, [mbOk]);

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmReasons.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' RE_DESC LIKE ' + QuotedStr(edtPesqDesc.Text + '%') + ' AND ';
       end;

     Case cbxProcura.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' RE_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' RE_STATUS = ' + QuotedStr('I') + ' AND ';
           End;
      End; //Case...

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
  (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT * FROM REASONS ' + strWhere + ' ORDER BY RE_ID';
  dtsMaster.DataSet.Open;
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('RE_ID', 'FROM REASONS', 'True', strWhere) ) + ' Registro(s)';

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
end;

end.
