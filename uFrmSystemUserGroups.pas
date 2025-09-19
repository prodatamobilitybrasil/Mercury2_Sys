unit uFrmSystemUserGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxLookup, Buttons;

type
  TFrmSystemUserGroups = class(TFrmBaseSys)
    edDesc: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    pcDetail: TPageControl;
    TabSheet1: TTabSheet;
    actNewMod: TAction;
    actEditMod: TAction;
    actDeleteMod: TAction;
    actNewRole: TAction;
    actEditRole: TAction;
    actDeleteRole: TAction;
    Panel1: TPanel;
    grdModules: TDBGrid;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    actModuleOk: TAction;
    actModuleCancel: TAction;
    actRolesAdd: TAction;
    actRolesAddAll: TAction;
    actRolesDel: TAction;
    actRolesDelAll: TAction;
    actRoleOk: TAction;
    actRoleCancel: TAction;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Splitter2: TSplitter;
    Panel4: TPanel;
    Panel5: TPanel;
    BitBtn3: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    cbForms: TCoolBar;
    tbForms: TToolBar;
    btnAddRole: TToolButton;
    btnAddAllRoles: TToolButton;
    btnDelRole: TToolButton;
    btnDelAllRoles: TToolButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Label5: TLabel;
    lsbRoleDisp: TListBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Label6: TLabel;
    lsbRoleSel: TListBox;
    pnlRoles: TPanel;
    DBGrid1: TDBGrid;
    cbDetail: TCoolBar;
    tbDetail: TToolBar;
    tbtnEditDetail: TToolButton;
    tbtnNewDetail: TToolButton;
    ToolButton3: TToolButton;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel15: TPanel;
    dbLkModulo: TRxDBLookupCombo;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure actNewModExecute(Sender: TObject);
    procedure actEditModExecute(Sender: TObject);
    procedure actDeleteModExecute(Sender: TObject);
    procedure actNewRoleExecute(Sender: TObject);
    procedure actEditRoleExecute(Sender: TObject);
    procedure actModuleOkExecute(Sender: TObject);
    procedure actModuleCancelExecute(Sender: TObject);
    procedure dbLkpFormChange(Sender: TObject);
    procedure actRoleOkExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actRolesAddExecute(Sender: TObject);
    procedure actRolesAddAllExecute(Sender: TObject);
    procedure actRolesDelExecute(Sender: TObject);
    procedure actRolesDelAllExecute(Sender: TObject);
    procedure lsbRoleDispDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lsbRoleDispDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lsbRoleSelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lsbRoleSelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbLkModuloChange(Sender: TObject);
  private
    { Private declarations }
    TAltera : TStringList;
    procedure FillRolesLists;
    Procedure BeforeUpdate;  
  public
    { Public declarations }
  end;

var
  FrmSystemUserGroups: TFrmSystemUserGroups;

implementation

uses AppSparkSysMain, uConst, uDmConexao, uDmSys1, uGeralFunctions,
  uFrmBaseCadastro, uDmSys;

{$R *.dfm}

procedure TFrmSystemUserGroups.FillRolesLists;
begin
  With dmSys1, dmConexao.cdsGeral do
   begin
     Close;
     CommandText :=  ' SELECT DISTINCT SR.SR_ID, SR.SR_DESC       '
                   + ' FROM   SYSTEMROLES SR                      '
//                   + ' JOIN   FORMOBJECTXSYSTEMROLES FRMOBJSR     '
//                   + ' ON     FRMOBJSR.SR_ID  =  SR.SR_ID         '
//                   + ' JOIN   MODULESXFORMS MODFRM                '
//                   + ' ON     MODFRM.FRM_ID   =  FRMOBJSR.FRM_ID  '
//                   + ' AND    MODFRM.MOD_ID   =  ' + cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsString
                   + ' WHERE  SR.SR_STATUS    =  ''A'' ';
     Open;

     lsbRoleDisp.Items.Clear;
     lsbRoleSel.Items.Clear;

     While not Eof do
      begin
        If cdsSystemUserGroupsXSystemRoles.Locate('SR_ID', FieldByName('SR_ID').Value, [] ) then
         begin
           lsbRoleSel.Items.AddObject(FieldByName('SR_DESC').AsString, TObject(FieldByName('SR_ID').AsInteger));
         end
        Else
         begin
           lsbRoleDisp.Items.AddObject(FieldByName('SR_DESC').AsString, TObject(FieldByName('SR_ID').AsInteger));
         end;
        Next;
      end;
   end;
end;


procedure TFrmSystemUserGroups.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsSystemUserGroups;
  TAltera := TStringList.Create;
end;

procedure TFrmSystemUserGroups.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys1.cdsSystemUserGroups, dmSys1.cdsModules,
                 DmSys1.cdsModulesXSystemUserGroups,
  DmSys1.cdsSystemUserGroupsXSystemRoles]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr(dmConexao.ConnBrkMaster.AppServer.GetDBCount( 'SUG_ID', 'FROM SYSTEMUSERGROUPS', 'True', '') ) + ' Registro(s)';
  pcBaseCadastro.ActivePageIndex := 0;
  grdModules.Align := alClient;
  grdModules.Visible := True;
  pnlRoles.Align := alClient;
  pnlRoles.Visible := True;

end;

procedure TFrmSystemUserGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys1.cdsSystemUserGroups, dmSys1.cdsModules]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  TAltera.Free;
  FrmSystemUserGroups := Nil;
end;

procedure TFrmSystemUserGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsSystemUserGroups);
  DmSys1.cdsSystemUserGroups.FieldByName('SUG_ID').AsInteger := -1;
  SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], False, FrmSystemUserGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewMod, actEditMod, actDeleteMod, actNewRole, actEditRole], true, FrmSystemUserGroups, t_form_objects);

  SetActions([actEditMod, actDeleteMod], not (dmSys1.cdsModulesXSystemUserGroups.IsEmpty), FrmSystemUserGroups, t_form_objects);
  SetActions([actEditRole, actDeleteRole], not (dmSys1.cdsSystemUserGroupsXSystemRoles.IsEmpty), FrmSystemUserGroups, t_form_objects);

  dbDesc.SetFocus;

end;

procedure TFrmSystemUserGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmSystemUserGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewMod, actNewRole], true, FrmSystemUserGroups, t_form_objects);

  SetActions([actEditMod, actDeleteMod], not (dmSys1.cdsModulesXSystemUserGroups.IsEmpty), FrmSystemUserGroups, t_form_objects);
  SetActions([actEditRole, actDeleteRole], not (dmSys1.cdsSystemUserGroupsXSystemRoles.IsEmpty), FrmSystemUserGroups, t_form_objects);

  dbDesc.SetFocus;
end;

procedure TFrmSystemUserGroups.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  If Trim(edDesc.Text) <> '' then
    strWhere := '  WHERE SUG_STATUS = ' + QuotedStr('A') + ' AND SUG_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
  Else
    strWhere := '  WHERE SUG_STATUS = ' + QuotedStr('A');

  with DmSys1 do
    begin
      cdsSystemUserGroups.Close;
      cdsSystemUserGroups.CommandText := 'SELECT * FROM SYSTEMUSERGROUPS '  + strWhere +  '   ORDER BY SUG_DESC';
      cdsSystemUserGroups.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SUG_ID', 'FROM SYSTEMUSERGROUPS', 'True', strWhere) ) + ' Registro(s)';
    end
end;

Procedure TFrmSystemUserGroups.BeforeUpdate;
var
  vSug_Id : Integer;
Begin
  vSug_Id  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('SYSTEMUSERGROUPS', 'SUG_ID', 'False', '' );

  dmSys1.cdsSystemUserGroupsXSystemRoles.First;
  While not dmSys1.cdsSystemUserGroupsXSystemRoles.Eof do
   begin
     dmSys1.cdsSystemUserGroupsXSystemRoles.Edit;
     dmSys1.cdsSystemUserGroupsXSystemRoles.FieldByName('SUG_ID').AsInteger := vSug_Id;
     dmSys1.cdsSystemUserGroupsXSystemRoles.Post;
   end;

    dmSys1.cdsModulesXSystemUserGroups.First;
    While not dmSys1.cdsModulesXSystemUserGroups.Eof do
     begin
       dmSys1.cdsModulesXSystemUserGroups.Edit;
       dmSys1.cdsModulesXSystemUserGroups.FieldByName('SUG_ID').AsInteger := vSug_Id;
       dmSys1.cdsModulesXSystemUserGroups.Post;
     end;

  DmSys1.cdsSystemUserGroups.FieldByName('SUG_ID').AsInteger := vSug_Id;
End;


procedure TFrmSystemUserGroups.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If dtsMaster.DataSet.State = dsInsert Then
        BeforeUpdate;
     If ApplyTablesSys([dbDesc], [DmSys1.cdsSystemUserGroups,
                                  DmSys1.cdsSystemUserGroupsXSystemRoles,
                                  DmSys1.cdsModulesXSystemUserGroups]) Then
         begin
          SetActions([], True, FrmSystemUserGroups, t_form_objects);
//          SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmSystemUserGroups, t_form_objects);
          SetActions([actApplyUpdates, actCancel, actNewMod, actEditMod, actDeleteMod, actNewRole, actEditRole], False, FrmSystemUserGroups, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmSystemUserGroups.actCancelExecute(Sender: TObject);
begin
  //inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
   begin
     dmSys1.cdsSystemUserGroups.Cancel;
{     SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmSystemUserGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel, actNewDetail, acteditDetail, actDeleteDetail], False, FrmSystemUserGroups, t_form_objects);{}

     SetActions([], True, FrmSystemUserGroups, t_form_objects);
//     SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmSystemUserGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel, actNewMod, actEditMod, actDeleteMod, actNewRole, actEditRole], False, FrmSystemUserGroups, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     dmSys1.cdsSystemUserGroups.Close;
     dmSys1.cdsSystemUserGroups.Open;
     pnlRoles.Visible := True;
     grdModules.Visible := True;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmSystemUserGroups.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsSystemUserGroups.Edit;
         cdsSystemUserGroups.FieldByName('SUG_STATUS').AsString := 'I';
         cdsSystemUserGroups.Post;
         cdsSystemUserGroups.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmSystemUserGroups.pcBaseCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 0 Then  //Manutenção...
     Begin
//      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmSystemUserGroups, t_form_objects);
      pcDetail.ActivePageIndex := 0;
      If Status = stConsult then
        SetActions([actApplyUpdates, actCancel, actNewMod, actEditMod, actDeleteMod, actNewRole, actEditRole], False, FrmSystemUserGroups, t_form_objects);
     End
  Else
    Begin
      If Status = stConsult then
        SetActions([actFilter, actDelete, actRefresh], True, FrmSystemUserGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;


procedure TFrmSystemUserGroups.actNewModExecute(Sender: TObject);
begin
  inherited;
  grdModules.Visible := False;
  dmSys1.cdsModulesXSystemUserGroups.Insert;
  SetActions([actNewMod, actEditMod, actDeleteMod, actApplyUpdates], False, FrmSystemUserGroups, t_form_objects);
//  SetActions([actNewSubDetail, actEditSubDetail], True, FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.actEditModExecute(Sender: TObject);
begin
  inherited;
  grdModules.Visible := False;
  dmSys1.cdsModulesXSystemUserGroups.Edit;
  SetActions([actNewMod, actEditMod, actDeleteMod, actApplyUpdates], False, FrmSystemUserGroups, t_form_objects);
//  SetActions([actNewSubDetail, actEditSubDetail], True, FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.actDeleteModExecute(Sender: TObject);
begin
  inherited;
  dmSys1.cdsModulesXSystemUserGroups.Delete;
  SetActions([actEditMod, actDeleteMod], not (dmSys1.cdsModulesXSystemUserGroups.IsEmpty), FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.actNewRoleExecute(Sender: TObject);
begin
  inherited;
  FillRolesLists;
  pnlRoles.Visible := False;
  SetActions([actNewRole, actEditRole, actDeleteRole, actApplyUpdates], False, FrmSystemUserGroups, t_form_objects);
//  SetActions([actModuleOk, actModuleCancel], False, FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.actEditRoleExecute(Sender: TObject);
begin
  inherited;
  FillRolesLists;
  pnlRoles.Visible := False;
  SetActions([actNewRole, actEditRole, actDeleteRole, actApplyUpdates], False, FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.actModuleOkExecute(Sender: TObject);
Var
 I : Integer;
 Sug_Id : Integer;
begin
  inherited;
  If dbLkModulo.KeyValue < 0 then
   begin
     DisplayMsg(t_form_objects, '%T', [3006], []);
     dbLkModulo.SetFocus;
     exit;
   end;
  Try
{    If Status = stInsert then
      Sug_Id := -1
    Else
      Sug_Id := dmSys1.cdsSystemUserGroups.FieldByName('SUG_ID').AsInteger;
 }

    dmSys1.cdsModulesXSystemUserGroups.FieldByName('SUG_ID').AsInteger       := dmSys1.cdsSystemUserGroups.FieldByName('SUG_ID').AsInteger;
    dmSys1.cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsInteger       := dbLkModulo.KeyValue;    
    dmSys1.cdsModulesXSystemUserGroups.FieldByName('MOD_DESC').AsString      := dmSys1.cdsModules.FieldByName('MOD_DESC').AsString;
    dmSys1.cdsModulesXSystemUserGroups.FieldByName('MODSUG_STATUS').AsString := 'A';
    dmSys1.cdsModulesXSystemUserGroups.Post;
  Except
    DisplayMsg(t_form_objects, '%T', [1605], []);
    dbLkModulo.SetFocus;
    exit;
  End;

  grdModules.Visible := True;
  SetActions([actNewMod, actEditMod, actDeleteMod, actApplyUpdates], True, FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.actModuleCancelExecute(Sender: TObject);
begin
  inherited;
  grdModules.Visible := True;
  dmSys1.cdsModulesXSystemUserGroups.Cancel;
  SetActions([actNewMod, actEditMod, actDeleteMod, actApplyUpdates], True, FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.dbLkpFormChange(Sender: TObject);
begin
  inherited;
//  dmSys1.cdsSystemUserGroupsXSystemRoles.Filter := 'FRM_ID  =  ';
end;

procedure TFrmSystemUserGroups.actRoleOkExecute(Sender: TObject);
begin
  inherited;
  pnlRoles.Visible := True;
  SetActions([actNewRole, actEditRole, actDeleteRole, actApplyUpdates], True, FrmSystemUserGroups, t_form_objects);
end;

procedure TFrmSystemUserGroups.grdResultadoDblClick(Sender: TObject);
begin
  IF pcBaseCadastro.ActivePageIndex = 0 Then  //Manutenção...
     Begin
//      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmSystemUserGroups, t_form_objects);
      If Status = stConsult then
        SetActions([actApplyUpdates, actCancel, actNewMod, actEditMod, actDeleteMod, actNewRole, actEditRole], False, FrmSystemUserGroups, t_form_objects);
     End
  Else
    Begin
      If Status = stConsult then
        SetActions([actFilter, actDelete, actRefresh], True, FrmSystemUserGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

  inherited;
  //
end;

procedure TFrmSystemUserGroups.actRolesAddExecute(Sender: TObject);
var
  Sug_Id, i : Integer;
begin
  inherited;
  If lsbRoleDisp.SelCount = 0 then Exit;

  If Status = stInsert then
    Sug_Id := -1
  Else
    Sug_Id := dmSys1.cdsSystemUserGroups.FieldByName('SUG_ID').AsInteger;

  For i := 0 to lsbRoleDisp.Count -1 do
   begin
     If lsbRoleDisp.Selected[i] then
      begin
        With dmSys1, dmSys1.cdsSystemUserGroupsXSystemRoles do
         begin
           If dmConexao.cdsGeral.Locate('SR_ID', Integer(lsbRoleDisp.Items.Objects[i]), []) then
            begin
              Append;
              FieldByName('SUG_ID').AsInteger := Sug_Id;
              FieldByName('SR_ID').AsInteger := dmConexao.cdsGeral.FieldByName('SR_ID').AsInteger;
              FieldByName('SUGSR_STATUS').AsString  := 'A';
              FieldByName('SR_DESC').AsString := dmConexao.cdsGeral.FieldByName('SR_DESC').AsString;
              Post;
            end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
         end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      end; // If lsbObjDisp.Selected[i] then
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbRoleDisp.MoveSelection(lsbRoleSel);
end;

procedure TFrmSystemUserGroups.actRolesAddAllExecute(Sender: TObject);
var
  Sug_Id, i : Integer;
begin
  inherited;
  If Status = stInsert then
    Sug_Id := -1
  Else
    Sug_Id := dmSys1.cdsSystemUserGroups.FieldByName('SUG_ID').AsInteger;

  For i := 0 to lsbRoleDisp.Count -1 do
   begin
     With dmSys1, dmSys1.cdsSystemUserGroupsXSystemRoles do
      begin
        If dmConexao.cdsGeral.Locate('SR_ID', Integer(lsbRoleDisp.Items.Objects[i]), []) then
         begin
           Append;
           FieldByName('SUG_ID').AsInteger := Sug_Id;
           FieldByName('SR_ID').AsInteger := dmConexao.cdsGeral.FieldByName('SR_ID').AsInteger;
           FieldByName('SUGSR_STATUS').AsString  := 'A';
           FieldByName('SR_DESC').AsString := dmConexao.cdsGeral.FieldByName('SR_DESC').AsString;
//           FieldByName('MOD_ID').AsInteger := dmSys1.cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsInteger;
           Post;
         end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
      end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbRoleDisp.SelectAll;
  lsbRoleDisp.MoveSelection(lsbRoleSel);
end;

procedure TFrmSystemUserGroups.actRolesDelExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  If lsbRoleSel.SelCount = 0 then Exit;
  For i := 0 to lsbRoleSel.Count -1 do
   begin
     If lsbRoleSel.Selected[i] then
      begin
        With dmSys1, dmSys1.cdsSystemUserGroupsXSystemRoles do
         begin
           If Locate('SR_ID', Integer(lsbRoleSel.Items.Objects[i]), []) then
            begin
              dmSys1.cdsSystemUserGroupsXSystemRoles.Delete;
            end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
         end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      end; // If lsbObjDisp.Selected[i] then
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbRoleSel.MoveSelection(lsbRoleDisp);
end;

procedure TFrmSystemUserGroups.actRolesDelAllExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lsbRoleSel.Count -1 do
   begin
     With dmSys1, dmSys1.cdsSystemUserGroupsXSystemRoles do
      begin
        If Locate('SR_ID', Integer(lsbRoleSel.Items.Objects[i]), []) then
         begin
           dmSys1.cdsSystemUserGroupsXSystemRoles.Delete;
         end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
      end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbRoleSel.SelectAll;
  lsbRoleSel.MoveSelection(lsbRoleDisp);
end;

procedure TFrmSystemUserGroups.lsbRoleDispDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  actRolesDelExecute(Self);
end;

procedure TFrmSystemUserGroups.lsbRoleDispDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TListBox;
end;

procedure TFrmSystemUserGroups.lsbRoleSelDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TListBox;

end;

procedure TFrmSystemUserGroups.lsbRoleSelDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  actRolesAddExecute(Self);
end;

procedure TFrmSystemUserGroups.dbLkModuloChange(Sender: TObject);
begin
  inherited;
{  If dmSys1.cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsString <> '' then
    dmSys1.cdsSystemUserGroupsXSystemRoles.Filter := 'MOD_ID = ' + dmSys1.cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsString;
{}
end;

end.
