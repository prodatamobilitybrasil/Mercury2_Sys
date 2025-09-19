unit uRegion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, DBClient, Mask, DBCtrls;

type
  TfrmRegion = class(TFrmBaseSys)
    dbeREG_ID: TDBEdit;
    dbeREG_DESC: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtPesqDesc: TEdit;
    Label3: TLabel;
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
    sInit : String;
    sTab  : String;
  end;

var
  frmRegion: TfrmRegion;

implementation

uses uConst, uGeralFunctions, AppSparkSysMain, uDmSys1, uDmConexao,
  uFrmBaseCadastro, uDmSys;

{$R *.dfm}

procedure TfrmRegion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited;
  CloseTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  frmRegion := Nil;
  Action := caFree;
end;

procedure TfrmRegion.FormCreate(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);
end;

procedure TfrmRegion.FormShow(Sender: TObject);
begin
  inherited;
  sInit := FrmSparkSysMain.sInit;
  sTab := FrmSparkSysMain.sTab;
  if sTab = 'REGION' then
  begin
    dtsMaster.DataSet := dmSys1.cdsRegion;
    dbeREG_ID.DataField := 'REG_ID';
    dbeREG_DESC.DataField := 'REG_DESC';
    Caption := 'Regiões';
  end
  else
  begin
    dtsMaster.DataSet := dmSys1.cdsSubRegion;
    dbeREG_ID.DataField := 'SUBREG_ID';
    dbeREG_DESC.DataField := 'SUBREG_DESC';
    Caption := 'Sub-Regiões';
  end;

  grdResultado.Columns.Items[0].Title.Caption := 'Código';
  grdResultado.Columns.Items[0].FieldName := sInit+'_ID';

  grdResultado.Columns.Items[1].Title.Caption := 'Descrição';
  grdResultado.Columns.Items[1].FieldName := sInit+'_DESC';
  grdResultado.Columns.Items[2].Title.Caption := 'Status';
  grdResultado.Columns.Items[2].FieldName := sInit+'_STATUS';
  grdResultado.Columns.Items[3].Title.Caption := 'Data Cadastro';
  grdResultado.Columns.Items[3].FieldName := sInit+'_REGDATE';
  grdResultado.Columns.Items[4].Title.Caption := 'Usuário';
  grdResultado.Columns.Items[4].FieldName := sInit+'_REGUSER';

  OpenTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount(sInit+'_ID', 'FROM '+sTab, 'False', '') ) + ' Registro(s)';
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;

procedure TfrmRegion.pcBaseCadastroChange(Sender: TObject);
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

procedure TfrmRegion.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys((dtsMaster.DataSet as TClientDataSet));
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeREG_ID.ReadOnly := False;
end;

procedure TfrmRegion.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeREG_ID.ReadOnly := True;
end;

procedure TfrmRegion.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;

  IF Trim(dbeREG_ID.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Código"   ', [], []);
     dbeREG_ID.SetFocus;
     exit;
    End
  Else
  if dtsMaster.DataSet.State = dsInsert then
    Begin
     dmSys.cdsGeral.Close;
     DmSys.cdsGeral.CommandText := 'SELECT * FROM '+sTab+' WHERE '+sInit+'_ID = '+QuotedStr(dbeREG_ID.Text);
     DmSys.cdsGeral.Open;
     if not DmSys.cdsGeral.Eof then
       begin
        DisplayMsg(t_form_objects, 'Código já existente!   ', [], []);
        dbeREG_ID.SetFocus;
        exit;
       end;
    End;

  IF Trim(dbeREG_DESC.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Descrição"   ', [], []);
     dbeREG_DESC.SetFocus;
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

procedure TfrmRegion.actCancelExecute(Sender: TObject);
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

procedure TfrmRegion.actDeleteExecute(Sender: TObject);
begin
// inherited;
  if dtsMaster.DataSet.FieldByName(sInit+'_STATUS').AsString = 'A' then
  begin
    If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dtsMaster.DataSet.Edit;
      dtsMaster.DataSet.FieldByName(sInit+'_STATUS').AsString := 'I';
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

procedure TfrmRegion.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' '+sInit+'_DESC LIKE ' + QuotedStr(edtPesqDesc.Text + '%') + ' AND ';
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
  (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT * FROM '+sTab+' ' + strWhere + ' ORDER BY '+sInit+'_ID';
  dtsMaster.DataSet.Open;
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount(sInit+'_ID', 'FROM '+sTab, 'True', strWhere) ) + ' Registro(s)';

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
end;

end.
