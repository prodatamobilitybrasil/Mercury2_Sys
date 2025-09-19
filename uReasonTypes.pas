unit uReasonTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, DBClient;

type
  TfrmReasonTypes = class(TFrmBaseSys)
    dbeRT_DESC: TDBEdit;
    dbcRT_STATUS: TRxDBComboBox;
    Label1: TLabel;
    Label2: TLabel;
    edtPesqDesc: TEdit;
    Label3: TLabel;
    cbxProcura: TComboBox;
    Label4: TLabel;
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
  frmReasonTypes: TfrmReasonTypes;

implementation

uses uDmSys1, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao;

{$R *.dfm}

procedure TfrmReasonTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
  CloseTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  frmReasonTypes := Nil;
  Action := caFree;
end;

procedure TfrmReasonTypes.FormCreate(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);
end;

procedure TfrmReasonTypes.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('RT_ID', 'FROM REASONTYPES', 'False', '') ) + ' Registro(s)';
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;

procedure TfrmReasonTypes.pcBaseCadastroChange(Sender: TObject);
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

procedure TfrmReasonTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys((dtsMaster.DataSet as TClientDataSet));
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeRT_DESC.SetFocus;
end;

procedure TfrmReasonTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeRT_DESC.SetFocus;
end;

procedure TfrmReasonTypes.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;

  IF Trim(dbeRT_DESC.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Descrição"   ', [], []);
     dbeRT_DESC.SetFocus;
    End
  Else
  IF Trim(dbcRT_STATUS.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Status"   ', [], []);
     dbcRT_STATUS.SetFocus;
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

procedure TfrmReasonTypes.actCancelExecute(Sender: TObject);
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

procedure TfrmReasonTypes.actDeleteExecute(Sender: TObject);
begin
// inherited;
  if dtsMaster.DataSet.FieldByName('RT_STATUS').AsString = 'A' then
  begin
    If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dtsMaster.DataSet.Edit;
      dtsMaster.DataSet.FieldByName('RT_STATUS').AsString := 'I';
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

procedure TfrmReasonTypes.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' RT_DESC LIKE ' + QuotedStr(edtPesqDesc.Text + '%') + ' AND ';
       end;

     Case cbxProcura.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' RT_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' RT_STATUS = ' + QuotedStr('I') + ' AND ';
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
  (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT * FROM REASONTYPES ' + strWhere + ' ORDER BY RT_ID';
  dtsMaster.DataSet.Open;
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('RT_ID', 'FROM REASONTYPES', 'True', strWhere) ) + ' Registro(s)';

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
end;

end.
