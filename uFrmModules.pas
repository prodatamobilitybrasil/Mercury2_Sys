unit uFrmModules;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, Buttons;

type
  TFrmModules = class(TFrmBaseSys)
    edCode: TEdit;
    edDesc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    grpModule: TGroupBox;
    cbDetail: TCoolBar;
    tbDetail: TToolBar;
    tbtnNewDetail: TToolButton;
    tbtnEditDetail: TToolButton;
    tbtnDeleteDetail: TToolButton;
    pgcDetail: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbCode: TDBEdit;
    dbDesc: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbgSoftwares: TDBGrid;
    dbgForms: TDBGrid;
    cbSoftware: TCoolBar;
    tbSoftware: TToolBar;
    tbtnAddAllSoftware: TToolButton;
    btnAddSoftware: TToolButton;
    btnDelSoftware: TToolButton;
    tbtnDelAllSoftware: TToolButton;
    lbSoftwaresDisp: TListBox;
    lbSoftwaresSelec: TListBox;
    Label9: TLabel;
    Label10: TLabel;
    btnOkSoftwares: TSpeedButton;
    btnCancelSoftwares: TSpeedButton;
    cbForms: TCoolBar;
    tbForms: TToolBar;
    btnAddForm: TToolButton;
    btnAddAllForms: TToolButton;
    btnDelForm: TToolButton;
    btnDelAllForms: TToolButton;
    lbFormsDisp: TListBox;
    lbFormsSel: TListBox;
    btnOkForms: TSpeedButton;
    btnCancelForms: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actAddSoftware: TAction;
    actAddAllSoftware: TAction;
    actDelSoftware: TAction;
    actDelAllSoftware: TAction;
    actOKSoftwares: TAction;
    actCancelSoftwares: TAction;
    actAddForm: TAction;
    actAddAllForms: TAction;
    actDelForm: TAction;
    actDelAllForms: TAction;
    actOKForms: TAction;
    actCancelForms: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure tbtnNewDetailClick(Sender: TObject);
    procedure btnCancelSoftwaresClick(Sender: TObject);
    procedure btnAddSoftwareClick(Sender: TObject);
    procedure tbtnAddAllSoftwareClick(Sender: TObject);
    procedure btnDelSoftwareClick(Sender: TObject);
    procedure tbtnDelAllSoftwareClick(Sender: TObject);
    procedure lbSoftwaresDispDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbSoftwaresSelecDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbSoftwaresDispDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSoftwaresSelecDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure pgcDetailChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btnOkSoftwaresClick(Sender: TObject);
    procedure btnCancelFormsClick(Sender: TObject);
    procedure btnOkFormsClick(Sender: TObject);
    procedure btnAddFormClick(Sender: TObject);
    procedure btnAddAllFormsClick(Sender: TObject);
    procedure btnDelFormClick(Sender: TObject);
    procedure btnDelAllFormsClick(Sender: TObject);
    procedure lbFormsDispDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbFormsSelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbFormsDispDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbFormsSelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure actAddSoftwareExecute(Sender: TObject);
    procedure actAddAllSoftwareExecute(Sender: TObject);
    procedure actDelSoftwareExecute(Sender: TObject);
    procedure actDelAllSoftwareExecute(Sender: TObject);
    procedure actOKSoftwaresExecute(Sender: TObject);
    procedure actCancelSoftwaresExecute(Sender: TObject);
    procedure actAddFormExecute(Sender: TObject);
    procedure actAddAllFormsExecute(Sender: TObject);
    procedure actDelFormExecute(Sender: TObject);
    procedure actDelAllFormsExecute(Sender: TObject);
    procedure actOKFormsExecute(Sender: TObject);
    procedure actCancelFormsExecute(Sender: TObject);
    procedure pgcDetailChange(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
  private
    procedure SetSoftwaresLists;
    procedure SetFormsLists;
    Procedure BeforePost;
  public
    { Public declarations }
  end;

var
  FrmModules: TFrmModules;

implementation

uses AppSparkSysMain, uConst, uDmSys1, uGeralFunctions, uDmConexao,
  uFrmBase, uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmModules.SetSoftwaresLists;
begin
  lbSoftwaresDisp.Clear;
  lbSoftwaresSelec.Clear;

  dmSys1.cdsSoftwares.First;
  While not dmSys1.cdsSoftwares.Eof do
   begin
     If dmSys1.cdsModulesXSoftwares.Locate('SF_ID', dmSys1.cdsSoftwares.FieldByName('SF_ID').AsInteger, []) then
      begin
        lbSoftwaresSelec.Items.AddObject( dmSys1.cdsSoftwares.FieldByName('SF_COD').AsString + ' - '
                                       +  dmSys1.cdsSoftwares.FieldByName('SF_DESC').AsString, TObject(dmSys1.cdsSoftwares.FieldByName('SF_ID').AsInteger));
      end
     Else
      begin
        lbSoftwaresDisp.Items.AddObject( dmSys1.cdsSoftwares.FieldByName('SF_COD').AsString + ' - '
                                       +  dmSys1.cdsSoftwares.FieldByName('SF_DESC').AsString, TObject(dmSys1.cdsSoftwares.FieldByName('SF_ID').AsInteger));
      end;
     dmSys1.cdsSoftwares.Next;
   end;
end;

procedure TFrmModules.SetFormsLists;
begin
  lbFormsDisp.Clear;
  lbFormsSel.Clear;

  dmSys1.cdsForms.First;
  While not dmSys1.cdsForms.Eof do
   begin
     If dmSys1.cdsModulesXForms.Locate('FRM_ID', dmSys1.cdsForms.FieldByName('FRM_ID').AsInteger, []) then
      begin
        lbFormsSel.Items.AddObject( dmSys1.cdsForms.FieldByName('FRM_DESC').AsString, TObject(dmSys1.cdsForms.FieldByName('FRM_ID').AsInteger));
      end
     Else
      begin
        lbFormsDisp.Items.AddObject( dmSys1.cdsForms.FieldByName('FRM_DESC').AsString, TObject(dmSys1.cdsForms.FieldByName('FRM_ID').AsInteger));
      end;
     dmSys1.cdsForms.Next;
   end;
end;


procedure TFrmModules.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys1.cdsModules, dmSys1.cdsModulesXSoftwares, dmSys1.cdsModulesXForms, dmSys1.cdsSoftwares, dmSys1.cdsForms]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('MOD_ID', 'FROM MODULES', 'True', '') ) + ' Registro(s)';
  dbgSoftwares.Align := alClient;
  dbgForms.Align := alClient;
  tbDetail.Enabled := False;
end;

procedure TFrmModules.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys1.cdsModules, dmSys1.cdsModulesXSoftwares, dmSys1.cdsModulesXForms, dmSys1.cdsSoftwares, dmSys1.cdsForms]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmModules := Nil;
end;

procedure TFrmModules.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsModules);
  SetActions([], False, FrmModules, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmModules, t_form_objects);
  dbCode.SetFocus;
  tbDetail.Enabled := True;
  dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger := -1;
  pgcDetailChange(Self);
end;

procedure TFrmModules.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmModules, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmModules, t_form_objects);
  dbCode.SetFocus;
  tbDetail.Enabled := True;
end;

procedure TFrmModules.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere := '  WHERE MOD_STATUS = ' + QuotedStr('A');

  If Trim(edCode.Text) <> '' then
    strWhere := strWhere + '  AND MOD_CODE LIKE ' + QuotedStr(edCode.Text + '%');

  If Trim(edDesc.Text) <> '' then
    strWhere := strWhere + '  AND MOD_DESC LIKE ' + QuotedStr(edDesc.Text + '%');
  with DmSys1 do
    begin
      cdsModules.Close;
      cdsModules.CommandText := 'SELECT * FROM MODULES '  + strWhere +  '   ORDER BY MOD_CODE';
      cdsModules.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('MOD_ID', 'FROM MODULES', 'True', strWhere) ) + ' Registro(s)';
    end;
end;

Procedure TFrmModules.BeforePost;
var
  Mod_Id : Integer;
Begin
  If dtsMaster.DataSet.State = dsInsert Then
  Begin
  Mod_Id := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('MODULES', 'MOD_ID', 'False', '' );

  dmSys1.cdsModulesXSoftwares.First;
  While not dmSys1.cdsModulesXSoftwares.Eof do
   begin
     dmSys1.cdsModulesXSoftwares.Edit;
     dmSys1.cdsModulesXSoftwares.FieldByName('MOD_ID').AsInteger := Mod_Id;
     dmSys1.cdsModulesXSoftwares.Post;
   end;

  dmSys1.cdsModulesXForms.First;
  While not dmSys1.cdsModulesXForms.Eof do
   begin
     dmSys1.cdsModulesXForms.Edit;
     dmSys1.cdsModulesXForms.FieldByName('MOD_ID').AsInteger := Mod_Id;
     dmSys1.cdsModulesXForms.Post;
   end;

  DmSys1.cdsModules.FieldByName('MOD_ID').AsInteger := Mod_Id;
  End;
End;

procedure TFrmModules.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     BeforePost;
     If ApplyTablesSys([dbDesc], [DmSys1.cdsModules,
                                  DmSys1.cdsModulesXSoftwares,
                                  DmSys1.cdsModulesXForms]) Then
         begin         
           SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmModules, t_form_objects);
           SetActions([actApplyUpdates, actCancel, actNewDetail, acteditDetail], False, FrmModules, t_form_objects);
           tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmModules.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dmSys1.cdsModules.Cancel;
      SetActions([], True, FrmModules, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, FrmModules, t_form_objects);
      pcBaseCadastro.ActivePageIndex := 0;
      Status := stConsult;
      FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
      tbDetail.Enabled := False;
      dmSys1.cdsModulesXSoftwares.Close;
      dmSys1.cdsModulesXForms.Close;
      dmSys1.cdsModulesXSoftwares.Open;
      dmSys1.cdsModulesXForms.Open;
    end;
end;

procedure TFrmModules.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsModules.Edit;
         cdsModules.FieldByName('MOD_STATUS').AsString := 'I';
         cdsModules.Post;
         cdsModules.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmModules.tbtnNewDetailClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Detail], False, Self, t_form_objects);

  If pgcDetail.TabIndex = 0 then
   begin
     SetSoftwaresLists;
     dbgSoftwares.Visible := False;
   end
  Else If pgcDetail.TabIndex = 1 then
   begin
     SetFormsLists;
     dbgForms.Visible := False;
   end;

end;

procedure TFrmModules.btnCancelSoftwaresClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  dmSys1.cdsModulesXSoftwares.Close;
  dmSys1.cdsModulesXSoftwares.Open;
  SetSoftwaresLists;
  dbgSoftwares.Visible := True;
end;

procedure TFrmModules.btnAddSoftwareClick(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
  If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbSoftwaresDisp.Count -1 do
   begin
     If lbSoftwaresDisp.Selected[i] then
      begin
        If not dmSys1.cdsSoftwares.Locate('SF_ID',Integer(lbSoftwaresDisp.Items.Objects[i]), [] ) then
          Exit;
        dmSys1.cdsModulesXSoftwares.Append;
        dmSys1.cdsModulesXSoftwares.FieldByName('MOD_ID').AsInteger       :=  ModId;
        dmSys1.cdsModulesXSoftwares.FieldByName('SF_ID').AsInteger        :=  Integer(lbSoftwaresDisp.Items.Objects[i]);
        dmSys1.cdsModulesXSoftwares.FieldByName('MODSF_STATUS').AsString  :=  'A';
        dmSys1.cdsModulesXSoftwares.FieldByName('SF_COD').AsString        :=  dmSys1.cdsSoftwares.FieldByName('SF_COD').AsString;
        dmSys1.cdsModulesXSoftwares.FieldByName('SF_DESC').AsString       :=  dmSys1.cdsSoftwares.FieldByName('SF_DESC').AsString;
        dmSys1.cdsModulesXSoftwares.FieldByName('SFT_DESC').AsString      :=  dmSys1.cdsSoftwares.FieldByName('SFT_DESC').AsString;
        dmSys1.cdsModulesXSoftwares.Post;
      end;
   end;

  lbSoftwaresDisp.MoveSelection(lbSoftwaresSelec);
end;


procedure TFrmModules.tbtnAddAllSoftwareClick(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
  If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbSoftwaresDisp.Count -1 do
   begin
     If not dmSys1.cdsSoftwares.Locate('SF_ID',Integer(lbSoftwaresDisp.Items.Objects[i]), [] ) then
       Exit;
     dmSys1.cdsModulesXSoftwares.Append;
     dmSys1.cdsModulesXSoftwares.FieldByName('MOD_ID').AsInteger       :=  ModId;
     dmSys1.cdsModulesXSoftwares.FieldByName('SF_ID').AsInteger        :=  Integer(lbSoftwaresDisp.Items.Objects[i]);
     dmSys1.cdsModulesXSoftwares.FieldByName('MODSF_STATUS').AsString  :=  'A';
     dmSys1.cdsModulesXSoftwares.FieldByName('SF_COD').AsString        :=  dmSys1.cdsSoftwares.FieldByName('SF_COD').AsString;
     dmSys1.cdsModulesXSoftwares.FieldByName('SF_DESC').AsString       :=  dmSys1.cdsSoftwares.FieldByName('SF_DESC').AsString;
     dmSys1.cdsModulesXSoftwares.FieldByName('SFT_DESC').AsString      :=  dmSys1.cdsSoftwares.FieldByName('SFT_DESC').AsString;
     dmSys1.cdsModulesXSoftwares.Post;

     lbSoftwaresSelec.Items.AddObject(lbSoftwaresDisp.Items.Strings[i], lbSoftwaresDisp.Items.Objects[i]);
   end;

  lbSoftwaresDisp.Clear;
end;

procedure TFrmModules.btnDelSoftwareClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lbSoftwaresSelec.Count -1 do
   begin
     If lbSoftwaresSelec.Selected[i] then
      begin
        If dmSys1.cdsModulesXSoftwares.Locate('SF_ID', Integer(lbSoftwaresSelec.Items.Objects[i]), []) then
          dmSys1.cdsModulesXSoftwares.Delete;
      end;
   end;

  lbSoftwaresSelec.MoveSelection(lbSoftwaresDisp);
end;

procedure TFrmModules.tbtnDelAllSoftwareClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lbSoftwaresSelec.Count -1 do
   begin
     If dmSys1.cdsModulesXSoftwares.Locate('SF_ID', Integer(lbSoftwaresSelec.Items.Objects[i]), []) then
       dmSys1.cdsModulesXSoftwares.Delete;
       lbSoftwaresDisp.Items.AddObject(lbSoftwaresSelec.Items.Strings[i], lbSoftwaresSelec.Items.Objects[i]);
   end;

  lbSoftwaresSelec.Clear;
end;

procedure TFrmModules.lbSoftwaresDispDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmModules.lbSoftwaresSelecDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmModules.lbSoftwaresDispDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnDelSoftwareClick(Self);
end;

procedure TFrmModules.lbSoftwaresSelecDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnAddSoftwareClick(Self);
end;

procedure TFrmModules.pgcDetailChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  If (Status <> stConsult) and not tbtnNewDetail.Enabled then
    AllowChange := False
  Else
    AllowChange := True; (**)
end;

procedure TFrmModules.btnOkSoftwaresClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  SetSoftwaresLists;
  dbgSoftwares.Visible := True;
end;

procedure TFrmModules.btnCancelFormsClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  dmSys1.cdsModulesXForms.Close;
  dmSys1.cdsModulesXForms.Open;
  SetFormsLists;
  dbgForms.Visible := True;
end;

procedure TFrmModules.btnOkFormsClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  SetFormsLists;
  dbgForms.Visible := True;

end;

procedure TFrmModules.btnAddFormClick(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
  If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbFormsDisp.Count -1 do
   begin
     If lbFormsDisp.Selected[i] then
      begin
        If not dmSys1.cdsForms.Locate('FRM_ID',Integer(lbFormsDisp.Items.Objects[i]), [] ) then
          Exit;
        dmSys1.cdsModulesXForms.Append;
        dmSys1.cdsModulesXForms.FieldByName('MOD_ID').AsInteger       :=  ModId;
        dmSys1.cdsModulesXForms.FieldByName('FRM_ID').AsInteger       :=  Integer(lbFormsDisp.Items.Objects[i]);
        dmSys1.cdsModulesXForms.FieldByName('MODFRM_STATUS').AsString :=  'A';
        dmSys1.cdsModulesXForms.FieldByName('FRM_DESC').AsString      :=  dmSys1.cdsForms.FieldByName('FRM_DESC').AsString;
        dmSys1.cdsModulesXForms.Post;
      end;
   end;

  lbFormsDisp.MoveSelection(lbFormsSel);
end;

procedure TFrmModules.btnAddAllFormsClick(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
  If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbFormsDisp.Count -1 do
    begin
      If not dmSys1.cdsForms.Locate('FRM_ID',Integer(lbFormsDisp.Items.Objects[i]), [] ) then
        Exit;
      dmSys1.cdsModulesXForms.Append;
      dmSys1.cdsModulesXForms.FieldByName('MOD_ID').AsInteger       :=  ModId;
      dmSys1.cdsModulesXForms.FieldByName('FRM_ID').AsInteger       :=  Integer(lbFormsDisp.Items.Objects[i]);
      dmSys1.cdsModulesXForms.FieldByName('MODFRM_STATUS').AsString :=  'A';
      dmSys1.cdsModulesXForms.FieldByName('FRM_DESC').AsString      :=  dmSys1.cdsForms.FieldByName('FRM_DESC').AsString;
      dmSys1.cdsModulesXForms.Post;

      lbFormsSel.Items.AddObject(lbFormsDisp.Items.Strings[i], lbFormsDisp.Items.Objects[i]);
    end;
  lbFormsDisp.Clear;
end;

procedure TFrmModules.btnDelFormClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lbFormsSel.Count -1 do
   begin
     If lbFormsSel.Selected[i] then
      begin
        If dmSys1.cdsModulesXForms.Locate('FRM_ID', Integer(lbFormsSel.Items.Objects[i]), []) then
          dmSys1.cdsModulesXForms.Delete;
      end;
   end;

  lbFormsSel.MoveSelection(lbFormsDisp);
end;

procedure TFrmModules.btnDelAllFormsClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lbFormsSel.Count -1 do
   begin
     If dmSys1.cdsModulesXForms.Locate('FRM_ID', Integer(lbFormsSel.Items.Objects[i]), []) then
       dmSys1.cdsModulesXForms.Delete;
       lbFormsDisp.Items.AddObject(lbFormsSel.Items.Strings[i], lbFormsSel.Items.Objects[i]);
   end;

  lbFormsSel.Clear;
end;

procedure TFrmModules.lbFormsDispDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;

end;

procedure TFrmModules.lbFormsSelDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;

end;

procedure TFrmModules.lbFormsDispDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnDelFormClick(Self);
end;

procedure TFrmModules.lbFormsSelDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnAddFormClick(Self);
end;

procedure TFrmModules.actNewDetailExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Detail], False, Self, t_form_objects);

  If pgcDetail.TabIndex = 0 then
   begin
     SetSoftwaresLists;
     dbgSoftwares.Visible := False;
   end
  Else If pgcDetail.TabIndex = 1 then
   begin
     SetFormsLists;
     dbgForms.Visible := False;
   end;
end;

procedure TFrmModules.actEditDetailExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Detail], False, Self, t_form_objects);

  If pgcDetail.TabIndex = 0 then
   begin
     SetSoftwaresLists;
     dbgSoftwares.Visible := False;
   end
  Else If pgcDetail.TabIndex = 1 then
   begin
     SetFormsLists;
     dbgForms.Visible := False;
   end;
end;

procedure TFrmModules.actAddSoftwareExecute(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
    If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbSoftwaresDisp.Count -1 do
   begin
     If lbSoftwaresDisp.Selected[i] then
      begin
        If not dmSys1.cdsSoftwares.Locate('SF_ID',Integer(lbSoftwaresDisp.Items.Objects[i]), [] ) then
          Exit;
        dmSys1.cdsModulesXSoftwares.Append;
        dmSys1.cdsModulesXSoftwares.FieldByName('MOD_ID').AsInteger       :=  ModId;
        dmSys1.cdsModulesXSoftwares.FieldByName('SF_ID').AsInteger        :=  Integer(lbSoftwaresDisp.Items.Objects[i]);
        dmSys1.cdsModulesXSoftwares.FieldByName('MODSF_STATUS').AsString  :=  'A';
        dmSys1.cdsModulesXSoftwares.FieldByName('SF_COD').AsString        :=  dmSys1.cdsSoftwares.FieldByName('SF_COD').AsString;
        dmSys1.cdsModulesXSoftwares.FieldByName('SF_DESC').AsString       :=  dmSys1.cdsSoftwares.FieldByName('SF_DESC').AsString;
        dmSys1.cdsModulesXSoftwares.FieldByName('SFT_DESC').AsString      :=  dmSys1.cdsSoftwares.FieldByName('SFT_DESC').AsString;
        dmSys1.cdsModulesXSoftwares.Post;
      end;
   end;

  lbSoftwaresDisp.MoveSelection(lbSoftwaresSelec);

end;

procedure TFrmModules.actAddAllSoftwareExecute(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
  If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbSoftwaresDisp.Count -1 do
   begin
     If not dmSys1.cdsSoftwares.Locate('SF_ID',Integer(lbSoftwaresDisp.Items.Objects[i]), [] ) then
       Exit;
     dmSys1.cdsModulesXSoftwares.Append;
     dmSys1.cdsModulesXSoftwares.FieldByName('MOD_ID').AsInteger       :=  ModId;
     dmSys1.cdsModulesXSoftwares.FieldByName('SF_ID').AsInteger        :=  Integer(lbSoftwaresDisp.Items.Objects[i]);
     dmSys1.cdsModulesXSoftwares.FieldByName('MODSF_STATUS').AsString  :=  'A';
     dmSys1.cdsModulesXSoftwares.FieldByName('SF_COD').AsString        :=  dmSys1.cdsSoftwares.FieldByName('SF_COD').AsString;
     dmSys1.cdsModulesXSoftwares.FieldByName('SF_DESC').AsString       :=  dmSys1.cdsSoftwares.FieldByName('SF_DESC').AsString;
     dmSys1.cdsModulesXSoftwares.FieldByName('SFT_DESC').AsString      :=  dmSys1.cdsSoftwares.FieldByName('SFT_DESC').AsString;
     dmSys1.cdsModulesXSoftwares.Post;

     lbSoftwaresSelec.Items.AddObject(lbSoftwaresDisp.Items.Strings[i], lbSoftwaresDisp.Items.Objects[i]);
   end;

  lbSoftwaresDisp.Clear;

end;

procedure TFrmModules.actDelSoftwareExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lbSoftwaresSelec.Count -1 do
   begin
     If lbSoftwaresSelec.Selected[i] then
      begin
        If dmSys1.cdsModulesXSoftwares.Locate('SF_ID', Integer(lbSoftwaresSelec.Items.Objects[i]), []) then
          dmSys1.cdsModulesXSoftwares.Delete;
      end;
   end;

  lbSoftwaresSelec.MoveSelection(lbSoftwaresDisp);
end;

procedure TFrmModules.actDelAllSoftwareExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
 For i := 0 to lbSoftwaresSelec.Count -1 do
   begin
     If dmSys1.cdsModulesXSoftwares.Locate('SF_ID', Integer(lbSoftwaresSelec.Items.Objects[i]), []) then
       dmSys1.cdsModulesXSoftwares.Delete;
       lbSoftwaresDisp.Items.AddObject(lbSoftwaresSelec.Items.Strings[i], lbSoftwaresSelec.Items.Objects[i]);
   end;

  lbSoftwaresSelec.Clear;
end;

procedure TFrmModules.actOKSoftwaresExecute(Sender: TObject);
begin
  inherited;
  pgcDetailChange(Self);
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  SetSoftwaresLists;
  dbgSoftwares.Visible := True;
end;

procedure TFrmModules.actCancelSoftwaresExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  dmSys1.cdsModulesXSoftwares.Close;
  dmSys1.cdsModulesXSoftwares.Open;
  SetSoftwaresLists;
  dbgSoftwares.Visible := True;
end;

procedure TFrmModules.actAddFormExecute(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
  If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbFormsDisp.Count -1 do
   begin
     If lbFormsDisp.Selected[i] then
      begin
        If not dmSys1.cdsForms.Locate('FRM_ID',Integer(lbFormsDisp.Items.Objects[i]), [] ) then
          Exit;
        dmSys1.cdsModulesXForms.Append;
        dmSys1.cdsModulesXForms.FieldByName('MOD_ID').AsInteger       :=  ModId;
        dmSys1.cdsModulesXForms.FieldByName('FRM_ID').AsInteger       :=  Integer(lbFormsDisp.Items.Objects[i]);
        dmSys1.cdsModulesXForms.FieldByName('MODFRM_STATUS').AsString :=  'A';
        dmSys1.cdsModulesXForms.FieldByName('FRM_DESC').AsString      :=  dmSys1.cdsForms.FieldByName('FRM_DESC').AsString;
        dmSys1.cdsModulesXForms.Post;
      end;
   end;

  lbFormsDisp.MoveSelection(lbFormsSel);

end;

procedure TFrmModules.actAddAllFormsExecute(Sender: TObject);
var
  ModId, i : Integer;
begin
  inherited;
  If Status = stInsert then
    ModId := -1
  Else
    ModId := dmSys1.cdsModules.FieldByName('MOD_ID').AsInteger;

  For i := 0 to lbFormsDisp.Count -1 do
    begin
      If not dmSys1.cdsForms.Locate('FRM_ID',Integer(lbFormsDisp.Items.Objects[i]), [] ) then
        Exit;
      dmSys1.cdsModulesXForms.Append;
      dmSys1.cdsModulesXForms.FieldByName('MOD_ID').AsInteger       :=  ModId;
      dmSys1.cdsModulesXForms.FieldByName('FRM_ID').AsInteger       :=  Integer(lbFormsDisp.Items.Objects[i]);
      dmSys1.cdsModulesXForms.FieldByName('MODFRM_STATUS').AsString :=  'A';
      dmSys1.cdsModulesXForms.FieldByName('FRM_DESC').AsString      :=  dmSys1.cdsForms.FieldByName('FRM_DESC').AsString;
      dmSys1.cdsModulesXForms.Post;

      lbFormsSel.Items.AddObject(lbFormsDisp.Items.Strings[i], lbFormsDisp.Items.Objects[i]);
    end;
  lbFormsDisp.Clear;

end;

procedure TFrmModules.actDelFormExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lbFormsSel.Count -1 do
   begin
     If lbFormsSel.Selected[i] then
      begin
        If dmSys1.cdsModulesXForms.Locate('FRM_ID', Integer(lbFormsSel.Items.Objects[i]), []) then
          dmSys1.cdsModulesXForms.Delete;
      end;
   end;

  lbFormsSel.MoveSelection(lbFormsDisp);
end;

procedure TFrmModules.actDelAllFormsExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lbFormsSel.Count -1 do
   begin
     If dmSys1.cdsModulesXForms.Locate('FRM_ID', Integer(lbFormsSel.Items.Objects[i]), []) then
       dmSys1.cdsModulesXForms.Delete;
       lbFormsDisp.Items.AddObject(lbFormsSel.Items.Strings[i], lbFormsSel.Items.Objects[i]);
   end;

  lbFormsSel.Clear;
end;

procedure TFrmModules.actOKFormsExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  SetFormsLists;
  dbgForms.Visible := True;
  pgcDetailChange(Self);

end;

procedure TFrmModules.actCancelFormsExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  SetCategories([Detail], True, Self, t_form_objects);

  dmSys1.cdsModulesXForms.Close;
  dmSys1.cdsModulesXForms.Open;
  SetFormsLists;
  dbgForms.Visible := True;
end;

procedure TFrmModules.pgcDetailChange(Sender: TObject);
begin
  inherited;
  If pgcDetail.ActivePageIndex = 0 then
    tbtnEditDetail.Enabled := not ( dmSys1.cdsModulesXSoftwares.IsEmpty )
  Else If pgcDetail.ActivePageIndex = 1 then
    tbtnEditDetail.Enabled := not ( dmSys1.cdsModulesXForms.IsEmpty );
end;

procedure TFrmModules.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
//      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmModules, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmModules, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

end.
