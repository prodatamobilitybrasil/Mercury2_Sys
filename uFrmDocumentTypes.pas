unit uFrmDocumentTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, DBCtrls, Mask, RxDBComb;

type
  TFrmDocumentTypes = class(TFrmBaseSys)
    Label1: TLabel;
    edDesc: TEdit;
    edMask: TEdit;
    Label2: TLabel;
    edPrintPriority: TEdit;
    Label3: TLabel;
    cmbAction: TComboBox;
    Label4: TLabel;
    dbDTDesc: TDBEdit;
    dbDTMask: TDBEdit;
    dbDTPrintPriority: TDBEdit;
    chDBDupAllowed: TDBCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbDupAction: TRxDBComboBox;
    cmbStatus: TComboBox;
    LStatus: TLabel;
    cbStatus: TRxDBComboBox;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure SetCtr;
    procedure actFilterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDocumentTypes: TFrmDocumentTypes;

implementation

uses AppSparkSysMain, uDmConexao, uGeralFunctions, uConst, uDmSys, uDmSys1;

{$R *.dfm}

procedure TFrmDocumentTypes.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsDocumentTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsDocumentTypes.RecordCount ) + ' Registro(s)';
 end;

procedure TFrmDocumentTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsDocumentTypes]);
  FrmDocumentTypes := nil;
end;

procedure TFrmDocumentTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsDocumentTypes;
end;

procedure TFrmDocumentTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsDocumentTypes);
  SetActions([], False, FrmDocumentTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmDocumentTypes, t_form_objects);
  SetCtr;
  dmSys1.cdsDocumentTypes.FieldByName('DT_DUPALLOWED').AsString:='N';
  dbDTDesc.SetFocus;
end;

procedure TFrmDocumentTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmDocumentTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmDocumentTypes, t_form_objects);
  dbDTDesc.SetFocus;
end;

procedure TFrmDocumentTypes.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;

  If Status = stConsult then
  Begin

    if (chDBDupAllowed.Checked = True) then
    Begin
      if (cbDupAction.Text <> 'Nenhuma Ação') then
      Begin
        DisplayMsg(FrmDocumentTypes.t_form_objects, '%T', [3139], [#13], mtInformation, [mbOK]);
        exit;
      end;
    end;

    if (chDBDupAllowed.Checked = False) then
    Begin
      if ((cbDupAction.Text <> 'Aviso') and (cbDupAction.Text <> 'Erro')) then
      Begin
        DisplayMsg(FrmDocumentTypes.t_form_objects, '%T', [3139], [#13], mtInformation, [mbOK]);
        exit;
      end;
    end;

    {Pesquisa de Duplicidade de Prioridade}
    if (dmSys1.cdsDocumentTypes.State = dsInsert) then
    Begin
      if (dbDTPrintPriority.Text <> '') then
      Begin
        dmSys.cdsGeral.Close;
        dmSys.cdsGeral.CommandText:='select documenttypes.dt_printpriority from documenttypes where documenttypes.dt_printpriority = ' + dbDTPrintPriority.Text;
        dmsys.cdsGeral.open;

        if (dmSys.cdsGeral.RecordCount > 0) then
        Begin
          DisplayMsg(FrmDocumentTypes.t_form_objects, '%T', [3137], [#13], mtInformation, [mbOK]);
          exit;
        end;
      end;
     end;

    if ApplyTablesSys([dbDTDesc, dbDTMask, dbDTPrintPriority, chDBDupAllowed, cbDupAction, cbStatus], [dmSys1.cdsDocumentTypes]) then
    Begin
      SetActions([], True, FrmDocumentTypes, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, FrmDocumentTypes, t_form_objects);
      tbtnRefresh.Click;
    end;
 end;
end;

procedure TFrmDocumentTypes.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsDocumentTypes.Cancel;
    SetActions([], True, FrmDocumentTypes, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmDocumentTypes, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;
end;

procedure TFrmDocumentTypes.actDeleteExecute(Sender: TObject);
begin
 //inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsDocumentTypes.Edit;
         cdsDocumentTypes.FieldByName('DT_STATUS').AsString := 'I';
         cdsDocumentTypes.Post;
         cdsDocumentTypes.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //W
end;

procedure TFrmDocumentTypes.SetCtr;
begin
  dbDTDesc.Enabled := (Status = stInsert);
end;

procedure TFrmDocumentTypes.actFilterExecute(Sender: TObject);
var
  strWhere:string;
begin
  inherited;
  strWhere:='';

  If Trim(edDesc.Text) <> '' then
     if (strWhere = '') then strWhere:=' where DT.DT_Desc LIKE ' + QuotedStr(Trim(edDesc.Text) + '%')
     else
     strWhere := strwhere + ' and DT.DT_Desc LIKE ' + QuotedStr(Trim(edDesc.Text) + '%');

  If Trim(edMask.Text) <> '' then
     if (strWhere = '') then strWhere:=' where DT.DT_Mask LIKE ' + QuotedStr(Trim(edMask.Text) + '%')
     else
     strWhere := strwhere + ' and DT.DT_Mask LIKE ' + QuotedStr(Trim(edMask.Text) + '%');

  If Trim(edPrintPriority.Text) <> '' then
     if (strWhere = '') then strWhere:=' where DT.DT_PrintPriority = ' + edPrintPriority.Text
     else
     strWhere := strwhere + ' and DT.DT_PrintPriority = ' + edPrintPriority.Text;

  If Trim(cmbAction.Text) <> '' then
  Begin
     if (strWhere = '') then strWhere:=' where DT.DT_DupAction = '
     else
     strWhere := strwhere + ' and DT.DT_DupAction = ';

     if (cmbAction.Text = 'AVISO') then  strwhere:= strwhere + Quotedstr('W');
     if (cmbAction.Text = 'ERRO') then  strwhere:= strwhere + Quotedstr('E');
     if (cmbAction.Text = 'NENHUMA AÇÃO') then  strwhere:= strwhere + Quotedstr('N');
  end;

  If Trim(cmbStatus.Text) <> '' then
  Begin
     if (strWhere = '') then strWhere:=' where DT.DT_Status = '
     else
     strWhere := strwhere + ' and DT.DT_Status = ';

     if (cmbStatus.Text = 'ATIVO') then strwhere:= strwhere + Quotedstr('A');
     if (cmbStatus.Text = 'INATIVO') then strwhere:= strwhere + Quotedstr('I');
  end;

  (*if (strWhere = '') then strWhere:=' where documenttypes.DT_DUPALLOWED = '
  else
  strWhere := strwhere + ' and documenttypes.DT_DUPALLOWED= ';
  If chDupAllpwed.Checked = True then strwhere:= strwhere + Quotedstr('Y')
  else strwhere:= strwhere + Quotedstr('N');*)

  With dmSys1 do
  Begin
    cdsDocumentTypes.Close;
    cdsDocumentTypes.CommandText:='SELECT DT.*, DT.DT_STATUS AS STATUS_ID, DT.DT_DUPALLOWED AS DUPALLOWED_ID, DT.DT_DUPACTION AS DUPACTION_ID FROM DOCUMENTTYPES DT ' + strwhere + ' order by DT.DT_DESC';
    cdsDocumentTypes.Open;
  end;

  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsDocumentTypes.RecordCount ) + ' Registro(s)';
end;


end.
