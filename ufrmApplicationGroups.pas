unit ufrmApplicationGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, DBCtrls, Mask, Buttons, DBClient;

type
  TfrmApplicationGroups = class(TFrmBaseSys)
    eDesc: TEdit;
    Label1: TLabel;
    grpApplicationGroups: TGroupBox;
    dbedDesc: TDBEdit;
    Label2: TLabel;
    dbgrStatusGrupo: TDBRadioGroup;
    dtsSubMT: TDataSource;
    dtsSubDT: TDataSource;
    actNovoSubMT: TAction;
    pnlDown: TPanel;
    GroupBox1: TGroupBox;
    nbSubGruposMT: TNotebook;
    grdSystemUsers: TDBGrid;
    lblSystemUsersProvider: TLabel;
    lblSystemUsersHrId: TLabel;
    lblSystemUsersLogin: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnSystemUsersOk: TBitBtn;
    btnSysUsersCancel: TBitBtn;
    dbColumnSize: TDBEdit;
    dbSortOrder: TDBEdit;
    dbDesc: TDBEdit;
    dbColumnLabel: TDBEdit;
    dbColumnFormat: TDBEdit;
    dbrgStatus: TDBRadioGroup;
    Splitter1: TSplitter;
    pnlDT: TPanel;
    dtsApplications: TDataSource;
    dbgApplicationInGroup: TDBGrid;
    dbgAllApplications: TDBGrid;
    spbtIncAll: TSpeedButton;
    spbtIncOne: TSpeedButton;
    spbtDelOne: TSpeedButton;
    spbtDelAll: TSpeedButton;
    pnlSubMT: TPanel;
    cbSystemUsers: TCoolBar;
    tbSystemUsers: TToolBar;
    tbtnNewSystemUsers: TToolButton;
    tbtnEditSystemUsers: TToolButton;
    tbtnDeleteSystemUsers: TToolButton;
    rgStatusFiltro: TRadioGroup;
    procedure tbtnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNovoSubMTExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InicializaControlesVisuais;
    function IncludeApplicationDetail : Boolean;
    procedure spbtIncOneClick(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure ChangePanelsStatus(Active_Pnl_Left,Active_Pnl_Right: Boolean);
    procedure ChangeButtonStatus(Active : Boolean);
    procedure tbtnNewSystemUsersClick(Sender: TObject);
    procedure tbtnEditSystemUsersClick(Sender: TObject);
    procedure tbtnDeleteSystemUsersClick(Sender: TObject);
    procedure btnSystemUsersOkClick(Sender: TObject);
    procedure btnSysUsersCancelClick(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    function IncludeApplicationDetailAll: Boolean;
    procedure spbtIncAllClick(Sender: TObject);
    function DeleteApplicationDetail: Boolean;
    function DeleteApplicationDetailAll: Boolean;
    procedure spbtDelOneClick(Sender: TObject);
    procedure spbtDelAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DisablePanels(Panel : TPanel; Activate : Boolean);
    procedure actInsertExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sAPP_ID : String;
  end;

var
  frmApplicationGroups: TfrmApplicationGroups;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, DateUtils, uDmSys,
  uGeralFunctions, uConst, uFrmBaseCadastro;

{$R *.dfm}

function TfrmApplicationGroups.DeleteApplicationDetailAll: Boolean;
begin
  with DmSys1 do
  begin
    cdsApplicationSubGroupsDT.First;
    while not cdsApplicationSubGroupsDT.Eof do
    begin
      DeleteApplicationDetail;
    end;
    sAPP_ID := '';
    RefreshApplications;
  end;

end;


function TfrmApplicationGroups.DeleteApplicationDetail: Boolean;
begin
  with DmSys1 do
  begin
    cdsApplicationSubGroupsDT.Delete;
    RefreshApplications;
  end;
end;



function TfrmApplicationGroups.IncludeApplicationDetailAll: Boolean;
begin
  with DmSys1 do
  begin
    DmSys.cdsApplications.First;
    while not DmSys.cdsApplications.Eof do
    begin
      cdsApplicationSubGroupsDT.Append;
      cdsApplicationSubGroupsDT.FieldBYName('APPGRP_ID').AsInteger        := cdsApplicationSubGroupsMT.FieldByName('APPGRP_ID').AsInteger;
      cdsApplicationSubGroupsDT.FieldBYName('APPSGRPMT_ID').AsInteger     := cdsApplicationSubGroupsMT.FieldByName('APPSGRPMT_ID').AsInteger;
      cdsApplicationSubGroupsDT.FieldByName('APPSGRPDT_STATUS').AsString  := 'A';
      cdsApplicationSubGroupsDT.FieldBYName('ISS_ID').AsInteger           := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
      cdsApplicationSubGroupsDT.FieldBYName('APP_ID').AsInteger           := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
      cdsApplicationSubGroupsDT.FieldByName('APP_DESCSHORT').AsString     := DmSys.cdsApplications.FieldByName('APP_DESCSHORT').AsString;
      cdsApplicationSubGroupsDT.Post;
      DmSys.cdsApplications.Next;
      sAPP_ID := sAPP_ID + DmSys.cdsApplications.FieldByName('APP_ID').AsString + ',';
    end;
    RefreshApplications;
  end;

end;


procedure TfrmApplicationGroups.tbtnFiltrarClick(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
     qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(eDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' APPGRP_DESC LIKE ' + QuotedStr(eDesc.Text + '%') + ' AND ';
       end;

     Inc(qtd_campos);
     strWhere := strWhere + ' APPGRP_STATUS = ' + QuotedStr(Copy(rgStatusFiltro.Items.Strings[rgStatusFiltro.ItemIndex],1,1)) + ' AND ';

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

  with dmSys1 do
    begin
      cdsApplicationGroups.Close;
      cdsApplicationGroups.CommandText := 'SELECT APPGRP_ID, APPGRP_DESC, APPGRP_STATUS, APPGRP_REGUSER, APPGRP_REGDATE From ApplicationGroups ' + strWhere + ' ORDER BY APPGRP_ID';
      cdsApplicationGroups.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('APPGRP_ID', 'FROM ApplicationGroups', 'True', strWhere) ) + ' Registro(s)';
    end;
//  actLog.Enabled := DmSys1.cdsApplicationGroups.RecordCount > 0;

end;

procedure TfrmApplicationGroups.FormShow(Sender: TObject);
begin
  inherited;
//  OpenTablesSys([DmSys1.cdsApplicationGroups, DmSys1.cdsApplicationSubGroupsMT, DmSys1.cdsApplicationSubGroupsDT]);
  OpenTablesSys([DmSys1.cdsApplicationGroups, DmSys1.cdsApplicationSubGroupsMT]);
  tbtnFiltrar.Click;
  actLog.Visible := False;
end;

procedure TfrmApplicationGroups.actNovoSubMTExecute(Sender: TObject);
begin
  inherited;
  with DmSys1 do
    begin
      cdsApplicationSubGroupsMT.Append;
      cdsApplicationSubGroupsMT.FieldBYName('APPGRP_ID').AsInteger        := cdsApplicationGroups.FieldByName('APPGRP_ID').AsInteger;
      cdsApplicationSubGroupsMT.FieldByName('APPGRP_STATUS').AsString     := 'A';
    end;

  nbSubGruposMT.PageIndex := 1; // Cadastro

  dbDesc.SetFocus;

//  SetMenu([], False);
//  SetActions([], False, Self, t_form_objects);
//  SetCategories([CardImages, Applications, Restrictions], False, Self, t_form_objects);

end;

procedure TfrmApplicationGroups.FormCreate(Sender: TObject);
begin
  inherited;
  InicializaControlesVisuais;
  sAPP_ID := '';
  dtsMaster.DataSet := dmSys1.cdsApplicationGroups;
end;

procedure TfrmApplicationGroups.InicializaControlesVisuais;
begin
  nbSubGruposMT.PageIndex := 0;
end;

function TfrmApplicationGroups.IncludeApplicationDetail: Boolean;
begin
  with DmSys1 do
  begin
    cdsApplicationSubGroupsDT.Append;
    cdsApplicationSubGroupsDT.FieldBYName('APPGRP_ID').AsInteger        := cdsApplicationSubGroupsMT.FieldByName('APPGRP_ID').AsInteger;
    cdsApplicationSubGroupsDT.FieldBYName('APPSGRPMT_ID').AsInteger     := cdsApplicationSubGroupsMT.FieldByName('APPSGRPMT_ID').AsInteger;
    cdsApplicationSubGroupsDT.FieldByName('APPSGRPDT_STATUS').AsString  := 'A';
    cdsApplicationSubGroupsDT.FieldBYName('ISS_ID').AsInteger           := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
    cdsApplicationSubGroupsDT.FieldBYName('APP_ID').AsInteger           := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
    cdsApplicationSubGroupsDT.FieldByName('APP_DESCSHORT').AsString     := DmSys.cdsApplications.FieldByName('APP_DESCSHORT').AsString;
    cdsApplicationSubGroupsDT.Post;
    sAPP_ID := sAPP_ID + DmSys.cdsApplications.FieldByName('APP_ID').AsString + ',';
  end;
  dmSys1.RefreshApplications;
end;

procedure TfrmApplicationGroups.spbtIncOneClick(Sender: TObject);
begin
  inherited;
  if DmSys.cdsApplications.RecordCount = 0 then
    exit;
  IncludeApplicationDetail;
end;

procedure TfrmApplicationGroups.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetActions([], True, Self, t_form_objects);
  SetActions([actApplyUpdates, actCancel], false, frmApplicationGroups, t_form_objects);
  dmSys1.RefreshApplications;
  ChangePanelsStatus(False,False);
  btnSystemUsersOk.Enabled := False;
  btnSysUsersCancel.Enabled := False;
end;

procedure TfrmApplicationGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmApplicationGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmApplicationGroups, t_form_objects);
  ChangePanelsStatus(True,True);
  btnSystemUsersOk.Enabled := True;
  btnSysUsersCancel.Enabled := True;
  ChangeButtonStatus(True);
  dbedDesc.SetFocus;

end;

procedure TfrmApplicationGroups.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys([dbedDesc, dbgrStatusGrupo], [dmSys1.cdsApplicationGroups]) then
    Begin
      try
        dmConexao.ConnBrkMaster.AppServer.StartTransaction;
        if dmSys1.cdsApplicationSubGroupsMT.Active then
          dmSys1.cdsApplicationSubGroupsMT.ApplyUpdates(-1);
        if dmSys1.cdsApplicationSubGroupsDT.Active then
          dmSys1.cdsApplicationSubGroupsDT.ApplyUpdates(-1);
        dmConexao.ConnBrkMaster.AppServer.Commit;
      except
        dmConexao.ConnBrkMaster.AppServer.RollBack;
      end;
      SetActions([], True, frmApplicationGroups, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, frmApplicationGroups, t_form_objects);
      ChangePanelsStatus(False,False);
      btnSystemUsersOk.Enabled := False;
      btnSysUsersCancel.Enabled := False;
      sAPP_ID := '';
      tbtnRefresh.Click;
    end;
 end;

end;

procedure TfrmApplicationGroups.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsApplicationGroups.Cancel;
    dmSys1.cdsApplicationSubGroupsMT.CancelUpdates;
    dmSys1.cdsApplicationSubGroupsDT.CancelUpdates;
    SetActions([], True, frmApplicationGroups, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, frmApplicationGroups, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
    ChangePanelsStatus(False, False);
    ChangeButtonStatus(False);
    btnSystemUsersOk.Enabled := False;
    btnSysUsersCancel.Enabled := False;
    sAPP_ID := '';
  end;

end;

procedure TfrmApplicationGroups.actDeleteExecute(Sender: TObject);
begin
 //inherited;
  if dmSys1.cdsApplicationSubGroupsMT.RecordCount > 0 then
  begin
    DisplayMsg(t_form_objects, '%T', [3222], [], mtInformation, [mbOk]);
    exit;
  end;

  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsApplicationGroups.Edit;
         cdsApplicationGroups.FieldByName('APPGRP_STATUS').AsString := 'I';
         cdsApplicationGroups.Post;
         cdsApplicationGroups.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //W

end;

procedure TfrmApplicationGroups.ChangePanelsStatus(Active_Pnl_Left,Active_Pnl_Right: Boolean);
begin
  DisablePanels(pnlDown, Active_Pnl_Left);
  DisablePanels(pnlDT, Active_Pnl_Right);
end;

procedure TfrmApplicationGroups.tbtnNewSystemUsersClick(Sender: TObject);
begin
  inherited;
  with dmSys1 do
    begin
      cdsApplicationSubGroupsMT.Append;
      cdsApplicationSubGroupsMT.FieldBYName('APPSGRPMT_ID').AsInteger    := cdsApplicationSubGroupsMT.RecordCount + 1;
      cdsApplicationSubGroupsMT.FieldBYName('APPGRP_ID').AsInteger       := cdsApplicationGroups.FieldByName('APPGRP_ID').AsInteger;
      cdsApplicationSubGroupsMT.FieldByName('APPSGRPMT_STATUS').AsString := 'A';
    end;

  grpApplicationGroups.Enabled := False;
  ChangeButtonStatus(False);
  ChangePanelsStatus(True,False);
  btnSystemUsersOk.Enabled := True;
  btnSysUsersCancel.Enabled := True;
  nbSubGruposMT.PageIndex := 1; // Cadastro

  dbDesc.SetFocus;
  dbrgStatus.ItemIndex := 0;

  SetActions([], False, Self, t_form_objects);

end;

procedure TfrmApplicationGroups.tbtnEditSystemUsersClick(Sender: TObject);
begin
  inherited;
  if DmSys1.cdsApplicationSubGroupsMT.RecordCount > 0 then
    begin
      grpApplicationGroups.Enabled := False;
      ChangeButtonStatus(False);
      ChangePanelsStatus(True,False);
      btnSystemUsersOk.Enabled := True;
      btnSysUsersCancel.Enabled := True;
      btnSystemUsersOk.Enabled := True;
      btnSysUsersCancel.Enabled := True;

      nbSubGruposMT.PageIndex := 1; // Cadastro
      DmSys1.cdsApplicationSubGroupsMT.Edit;

      dbDesc.SetFocus;

      SetActions([], False, Self, t_form_objects);
    end;

end;

procedure TfrmApplicationGroups.tbtnDeleteSystemUsersClick(
  Sender: TObject);
begin
  inherited;
  // Verificar se pode deletar
  if dmSys1.cdsApplicationSubGroupsDT.RecordCount > 0 then
  begin
    dmSys1.cdsApplicationSubGroupsMT.Edit;
    dmSys1.cdsApplicationSubGroupsMT.FieldByName('APPSGRPMT_STATUS').AsString := 'I';
    dmSys1.cdsApplicationSubGroupsMT.Post;
  end;

end;

procedure TfrmApplicationGroups.btnSystemUsersOkClick(Sender: TObject);
begin
  inherited;
  if dbDesc.Text = '' then
    begin
      DisplayMsg(t_form_objects, '%T DESCRIÇÃO %T', [1601, 1500], []);
      dbDesc.SetFocus;
      Exit;
    end;
  if dbSortOrder.Text = '' then
    begin
      DisplayMsg(t_form_objects, '%T ORDEM %T', [1601, 1500], []);
      dbSortOrder.SetFocus;
      Exit;
    end;
  if dbColumnSize.Text = '' then
    begin
      DisplayMsg(t_form_objects, '%T TAMANHO %T', [1601, 1500], []);
      dbColumnSize.SetFocus;
      Exit;
    end;
  if dbColumnLabel.Text = '' then
    begin
      DisplayMsg(t_form_objects, '%T TÍTULO %T', [1601, 1500], []);
      dbColumnLabel.SetFocus;
      Exit;
    end;
  if dbColumnFormat.Text = '' then
    begin
      DisplayMsg(t_form_objects, '%T FORMATO %T', [1601, 1500], []);
      dbColumnFormat.SetFocus;
      Exit;
    end;

  dmSys1.cdsApplicationSubGroupsMT.Post;

  nbSubGruposMT.PageIndex := 0;
  grpApplicationGroups.Enabled := True;
  ChangePanelsStatus(True,True);
  btnSystemUsersOk.Enabled := True;
  btnSysUsersCancel.Enabled := True;
  ChangeButtonStatus(True);
  SetActions([actApplyUpdates, actCancel], true, frmApplicationGroups, t_form_objects);
end;

procedure TfrmApplicationGroups.ChangeButtonStatus(Active: Boolean);
begin
  tbtnNewSystemUsers.Enabled    := Active;
  tbtnEditSystemUsers.Enabled   := Active;
  tbtnDeleteSystemUsers.Enabled := Active;

end;

procedure TfrmApplicationGroups.btnSysUsersCancelClick(Sender: TObject);
begin
  inherited;
  dmSys1.cdsApplicationSubGroupsMT.Cancel;
  nbSubGruposMT.PageIndex := 0;
  grpApplicationGroups.Enabled := True;
  ChangePanelsStatus(True,True);
  btnSystemUsersOk.Enabled := True;
  btnSysUsersCancel.Enabled := True;
  ChangeButtonStatus(True);
  SetActions([actApplyUpdates, actCancel], true, frmApplicationGroups, t_form_objects);
end;

procedure TfrmApplicationGroups.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  SetActions([], True, Self, t_form_objects);
  SetActions([actApplyUpdates, actCancel], false, frmApplicationGroups, t_form_objects);
  dmSys1.RefreshApplications;
  ChangePanelsStatus(False,False);
  btnSystemUsersOk.Enabled := False;
  btnSysUsersCancel.Enabled := False;
end;

procedure TfrmApplicationGroups.FormDestroy(Sender: TObject);
begin
  inherited;
  frmApplicationGroups := Nil;
end;

procedure TfrmApplicationGroups.spbtIncAllClick(Sender: TObject);
begin
  inherited;
  if DmSys.cdsApplications.RecordCount = 0 then
    exit;
  IncludeApplicationDetailAll;
end;

procedure TfrmApplicationGroups.spbtDelOneClick(Sender: TObject);
begin
  inherited;
  if dmSys1.cdsApplicationSubGroupsDT.RecordCount = 0 then
    exit;
  DeleteApplicationDetail;
end;

procedure TfrmApplicationGroups.spbtDelAllClick(Sender: TObject);
begin
  inherited;
  if dmSys1.cdsApplicationSubGroupsDT.RecordCount = 0 then
    exit;
  DeleteApplicationDetailAll;
end;

procedure TfrmApplicationGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmApplicationGroups.DisablePanels(Panel: TPanel; Activate : Boolean);
var
  i : integer;
begin
  for i := 0 to (Panel.ControlCount - 1) do
  begin
    if Panel.Controls[i] is TToolButton then
      (Panel.Controls[i] as TToolButton).Enabled := Activate
    else if Panel.Controls[i] is TButton then
      (Panel.Controls[i] as TButton).Enabled := Activate
    else if Panel.Controls[i] is TSpeedButton then
      (Panel.Controls[i] as TSpeedButton).Enabled := Activate
    else if Panel.Controls[i] is TBitBtn then
      (Panel.Controls[i] as TBitBtn).Enabled := Activate;
  end;
end;

procedure TfrmApplicationGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsApplicationGroups);
  SetActions([], False, frmApplicationGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmApplicationGroups, t_form_objects);
  dbgrStatusGrupo.ItemIndex := 0;
  ChangePanelsStatus(False, False);
  btnSystemUsersOk.Enabled := False;
  btnSysUsersCancel.Enabled := False;
  ChangeButtonStatus(False);
  dbedDesc.SetFocus;
end;

end.
