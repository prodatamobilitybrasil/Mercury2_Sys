unit uCities;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, DBClient;

type
  TfrmCities = class(TFrmBaseSys)
    dbcST_CODE: TDBLookupComboBox;
    dbeCIT_ID: TDBEdit;
    dbeCIT_DESC: TDBEdit;
    dbcREG_ID: TDBLookupComboBox;
    dbcSUBREG_ID: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtPesqDesc: TEdit;
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
  frmCities: TfrmCities;

implementation

uses uConst, uGeralFunctions, AppSparkSysMain, uDmSys1, uDmConexao, uDmSys;

{$R *.dfm}

procedure TfrmCities.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited;
  CloseTablesSys([(dtsMaster.DataSet as TClientDataSet), dmSys1.cdsStatesLKP, dmSys1.cdsRegionLKP, dmSys1.cdsSubRegionLKP]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  frmCities := Nil;
  Action := caFree;
end;

procedure TfrmCities.FormCreate(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);
end;

procedure TfrmCities.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([(dtsMaster.DataSet as TClientDataSet), dmSys1.cdsStatesLKP, dmSys1.cdsRegionLKP, dmSys1.cdsSubRegionLKP]);
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CIT_ID', 'FROM CITIES', 'False', '') ) + ' Registro(s)';
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;

procedure TfrmCities.pcBaseCadastroChange(Sender: TObject);
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

procedure TfrmCities.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys((dtsMaster.DataSet as TClientDataSet));
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeCIT_ID.ReadOnly := False;
end;

procedure TfrmCities.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeCIT_ID.ReadOnly := True;
end;

procedure TfrmCities.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;

  IF Trim(dbeCIT_ID.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Código"   ', [], []);
     dbeCIT_ID.SetFocus;
     exit;
    End
  Else
  if dtsMaster.DataSet.State = dsInsert then
    Begin
     dmSys.cdsGeral.Close;
     DmSys.cdsGeral.CommandText := 'SELECT * FROM CITIES WHERE CIT_ID = '+QuotedStr(dbeCIT_ID.Text);
     DmSys.cdsGeral.Open;
     if not DmSys.cdsGeral.Eof then
       begin
        DisplayMsg(t_form_objects, 'Código já existente!   ', [], []);
        dbeCIT_ID.SetFocus;
        exit;
       end;
    End;

  IF Trim(dbeCIT_DESC.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Descrição"   ', [], []);
     dbeCIT_DESC.SetFocus;
    End
  Else
  IF Trim(dbcST_CODE.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Estado"   ', [], []);
     dbcST_CODE.SetFocus;
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

procedure TfrmCities.actCancelExecute(Sender: TObject);
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

procedure TfrmCities.actDeleteExecute(Sender: TObject);
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

procedure TfrmCities.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' CIT_DESC LIKE ' + QuotedStr(edtPesqDesc.Text + '%') + ' AND ';
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
  (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT * FROM CITIES ' + strWhere + ' ORDER BY ST_CODE, CIT_ID';
  dtsMaster.DataSet.Open;
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CIT_ID', 'FROM CITIES', 'True', strWhere) ) + ' Registro(s)';

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
end;

end.
