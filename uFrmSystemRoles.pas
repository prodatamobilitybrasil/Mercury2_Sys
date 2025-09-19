unit uFrmSystemRoles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxLookup, Buttons;

type
  TFrmSystemRoles = class(TFrmBaseSys)
    edDesc: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    dbDesc: TDBEdit;
    Label2: TLabel;
    pcDetail: TPageControl;
    TabSheet1: TTabSheet;
    grbChooseForm: TGroupBox;
    cbDetail: TCoolBar;
    tbDetail: TToolBar;
    tbtnNewDetail: TToolButton;
    tbtnEditDetail: TToolButton;
    grdObjects: TDBGrid;
    Label3: TLabel;
    dbLkpForm: TRxDBLookupCombo;
    GroupBox3: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    actObjOk: TAction;
    actObjCancel: TAction;
    actNewDetail: TAction;
    acteditDetail: TAction;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Splitter1: TSplitter;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    lsbObjDisp: TListBox;
    lsbObjSel: TListBox;
    cbForms: TCoolBar;
    tbForms: TToolBar;
    btnAddForm: TToolButton;
    btnAddAllForms: TToolButton;
    btnDelForm: TToolButton;
    btnDelAllForms: TToolButton;
    actAddObject: TAction;
    actDelObject: TAction;
    actAddAllObjects: TAction;
    actDelAllObjects: TAction;
    Label4: TLabel;
    Label5: TLabel;
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
    procedure dbLkpFormChange(Sender: TObject);
    procedure actNewDetailExecute(Sender: TObject);
    procedure acteditDetailExecute(Sender: TObject);
    procedure actObjOkExecute(Sender: TObject);
    procedure actObjCancelExecute(Sender: TObject);
    procedure FillObjectLists;
    procedure actAddObjectExecute(Sender: TObject);
    procedure actAddAllObjectsExecute(Sender: TObject);
    procedure actDelObjectExecute(Sender: TObject);
    procedure actDelAllObjectsExecute(Sender: TObject);
    procedure lsbObjDispDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lsbObjDispDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lsbObjSelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lsbObjSelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
     Procedure BeforePost;
    { Private declarations }
  public
    { Public declarations }
  end;


var
  FrmSystemRoles: TFrmSystemRoles;

implementation

uses uConst, uDmConexao, uDmSys1, uGeralFunctions, AppSparkSysMain,
  uFrmBaseCadastro, uFrmBase, DBClient;

{$R *.dfm}

procedure TFrmSystemRoles.FillObjectLists;
begin
  With dmSys1, dmConexao.cdsGeral do
   begin
     Close;
     CommandText := ' SELECT    DISTINCT OBJ.OBJ_ID, OBJ.OBJ_NAME, OBJLNG.OBJLNG_DESC, OT.OT_DESC, FRMOBJSR.SR_ID'
                  + ' FROM      OBJECTS OBJ'
                  + ' JOIN      OBJECTSXLANGUAGES OBJLNG'
                  + '   ON      OBJLNG.OBJ_ID  =  OBJ.OBJ_ID'
                  + ' JOIN      FORMSXOBJECTS FRMOBJ'
                  + '   ON      FRMOBJ.OBJ_ID  =  OBJ.OBJ_ID'
                  + ' JOIN      SYSTEMUSERS SU'
                  + '   ON      SU.LNG_ID      =  OBJLNG.LNG_ID'
                  + '  AND      SU.SU_ID       =  ' + IntToStr(dmConexao.SystemUser_Id)
                  + ' JOIN      OBJECTTYPES OT'
                  + '   ON      OT.OT_ID       =  OBJ.OT_ID'
                  + ' LEFT JOIN FORMOBJECTXSYSTEMROLES FRMOBJSR'
                  + '   ON      FRMOBJSR.OBJ_ID = OBJ.OBJ_ID'
                  + '  AND      FRMOBJSR.FRM_ID = FRMOBJ.FRM_ID'
                  + '  AND      ((FRMOBJSR.SR_ID  = ' + cdsSystemRoles.FieldByName('SR_ID').AsString + ') OR (FRMOBJSR.SR_ID IS NULL) )' 
                  + ' WHERE     OBJ.OT_ID      IN  (2, 3)'
                  + ' AND       FRMOBJ.FRM_ID  =  ' + IntToStr(dbLkpForm.KeyValue)
                  + ' ORDER BY  OBJLNG.OBJLNG_DESC';
     Open;

     lsbObjDisp.Items.Clear;
     lsbObjSel.Items.Clear;

     While not Eof do
      begin
        If cdsFormObjectsXSystemRoles.Locate('OBJ_ID', FieldByName('OBJ_ID').Value, [] ) then //FieldByName('SR_ID').AsInteger = cdsSystemRoles.FieldByName('SR_ID').AsInteger then
         begin
           lsbObjSel.Items.AddObject(FieldByName('OBJLNG_DESC').AsString, TObject(FieldByName('OBJ_ID').AsInteger));
         end
        Else
         begin
           lsbObjDisp.Items.AddObject(FieldByName('OBJLNG_DESC').AsString, TObject(FieldByName('OBJ_ID').AsInteger));
         end;
        Next;
      end;
   end;
end;

procedure TFrmSystemRoles.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys1.cdsSystemRoles;
end;

procedure TFrmSystemRoles.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys1.cdsSystemRoles, dmSys1.cdsForms]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SR_ID', 'FROM SYSTEMROLES', 'True', '') ) + ' Registro(s)';
  dmSys1.cdsForms.First;
  dbLkpForm.KeyValue :=  dmSys1.cdsForms.FieldByName('FRM_ID').AsInteger;
  dbLkpFormChange(Self);
  pcBaseCadastro.ActivePageIndex := 0;
  grdObjects.Align := alClient;
  grdObjects.Visible := True;
end;

procedure TFrmSystemRoles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys1.cdsSystemRoles, dmSys1.cdsFormObjectsXSystemRoles, dmSys1.cdsForms]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmSystemRoles := Nil;

end;

procedure TFrmSystemRoles.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsSystemRoles);
  SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit, actNewDetail, acteditDetail], False, FrmSystemRoles, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmSystemRoles, t_form_objects);

  SetActions([acteditDetail], not ( dmSys1.cdsFormObjectsXSystemRoles.IsEmpty ), FrmSystemRoles, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmSystemRoles.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], False, FrmSystemRoles, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewDetail, acteditDetail], true, FrmSystemRoles, t_form_objects);
  SetActions([acteditDetail], not ( dmSys1.cdsFormObjectsXSystemRoles.IsEmpty ), FrmSystemRoles, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmSystemRoles.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  If Trim(edDesc.Text) <> '' then
    strWhere := '  WHERE SR_STATUS = ' + QuotedStr('A') + ' AND SR_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
  Else
    strWhere := '  WHERE SR_STATUS = ' + QuotedStr('A');

  with DmSys1 do
    begin
      cdsSystemRoles.Close;
      cdsSystemRoles.CommandText := 'SELECT *  FROM SYSTEMROLES '  + strWhere +  '   ORDER BY SR_DESC';
      cdsSystemRoles.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SR_ID', 'FROM SYSTEMROLES', 'True', strWhere) ) + ' Registro(s)';
    end

end;

Procedure TFrmSystemRoles.BeforePost;
var
  SrId : Integer;
Begin
SrId  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('SYSTEMROLES', 'SR_ID', 'False', '' );

//      dmSys1.cdsFormObjectsXSystemRoles.Filter := '';
dmSys1.cdsFormObjectsXSystemRoles.First;
While not dmSys1.cdsFormObjectsXSystemRoles.Eof do
 begin
   dmSys1.cdsFormObjectsXSystemRoles.Edit;
   dmSys1.cdsFormObjectsXSystemRoles.FieldByName('SR_ID').AsInteger := SrId;
   dmSys1.cdsFormObjectsXSystemRoles.Post;
 end;
DmSys1.cdsSystemRoles.FieldByName('SR_ID').AsInteger := SrId;
End;

procedure TFrmSystemRoles.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
    If dtsMaster.DataSet.State = dsInsert then
       BeforePost;
     If ApplyTablesSys([dbDesc], [DmSys1.cdsSystemRoles,
                                  DmSys1.cdsFormObjectsXSystemRoles]) Then
         begin
          SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmSystemRoles, t_form_objects);
          SetActions([actApplyUpdates, actCancel, actNewDetail, acteditDetail], False, FrmSystemRoles, t_form_objects);
          dbLkpFormChange(Self);
          actFilter.Execute;
         end;
    END;
end;

procedure TFrmSystemRoles.actCancelExecute(Sender: TObject);
begin
  //inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
   begin
     dmSys1.cdsSystemRoles.Cancel;
     SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmSystemRoles, t_form_objects);
     SetActions([actApplyUpdates, actCancel, actNewDetail, acteditDetail], False, FrmSystemRoles, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmSystemRoles.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsSystemRoles.Edit;
         cdsSystemRoles.FieldByName('SR_STATUS').AsString := 'I';
         cdsSystemRoles.Post;
         cdsSystemRoles.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmSystemRoles.pcBaseCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 0 Then  //Manutenção...
     Begin
//      SetStatusPanels(False);
        SetActions([actRefresh, actFilter], False, FrmSystemRoles, t_form_objects);
        If Status = stConsult then
          SetActions([actApplyUpdates, actCancel, actNewDetail, acteditDetail], False, FrmSystemRoles, t_form_objects);
     End
  Else
    Begin
      If Status = stConsult then
        SetActions([actRefresh, actFilter], True, FrmSystemRoles, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;


procedure TFrmSystemRoles.dbLkpFormChange(Sender: TObject);
begin
  inherited;
  If dbLkpForm.KeyValue > 0 then
    dmSys1.cdsFormObjectsXSystemRoles.Filter := 'FRM_ID = ' + IntToStr(dbLkpForm.KeyValue)
  Else
    dmSys1.cdsFormObjectsXSystemRoles.Filter := '';

end;

procedure TFrmSystemRoles.actNewDetailExecute(Sender: TObject);
begin
  inherited;
  If pcDetail.ActivePageIndex = 0 then
   begin
     grdObjects.Visible := False;
     FillObjectLists;
   end;
  actNewDetail.Enabled := False;
  acteditDetail.Enabled := False;
  grbChooseForm.Enabled := False;
  actApplyUpdates.Enabled := False;
  actCancel.Enabled := False;
end;

procedure TFrmSystemRoles.acteditDetailExecute(Sender: TObject);
begin
  inherited;
  If pcDetail.ActivePageIndex = 0 then
   begin
     grdObjects.Visible := False;
     FillObjectLists;
   end;
  actNewDetail.Enabled := False;
  acteditDetail.Enabled := False;
  grbChooseForm.Enabled := False;
  actApplyUpdates.Enabled := False;
  actCancel.Enabled := False;
end;

procedure TFrmSystemRoles.actObjOkExecute(Sender: TObject);
begin
  inherited;
  If pcDetail.ActivePageIndex = 0 then
   begin
     grdObjects.Visible := True;
   end;
  actNewDetail.Enabled := True;
  acteditDetail.Enabled := True;
  grbChooseForm.Enabled := True;
  actApplyUpdates.Enabled := True;
  actCancel.Enabled := True;
end;

procedure TFrmSystemRoles.actObjCancelExecute(Sender: TObject);
begin
  inherited;
  If pcDetail.ActivePageIndex = 0 then
   begin
     grdObjects.Visible := True;
   end;
  actNewDetail.Enabled := True;
  acteditDetail.Enabled := True;
  grbChooseForm.Enabled := True;

  dmSys1.cdsFormObjectsXSystemRoles.Close;
  dmSys1.cdsFormObjectsXSystemRoles.Open;
end;

procedure TFrmSystemRoles.actAddObjectExecute(Sender: TObject);
var
  Sr_Id, i : Integer;
begin
  inherited;
  If lsbObjDisp.SelCount = 0 then Exit;

  If Status = stInsert then
    Sr_Id := -1
  Else
    Sr_Id := dmSys1.cdsSystemRoles.FieldByName('SR_ID').AsInteger;

  For i := 0 to lsbObjDisp.Count -1 do
   begin
     If lsbObjDisp.Selected[i] then
      begin
        With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
         begin
           If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
            begin
              Append;
              FieldByName('FRM_ID').AsInteger := dbLkpForm.KeyValue;
              FieldByName('OBJ_ID').AsInteger := dmConexao.cdsGeral.FieldByName('OBJ_ID').AsInteger;
              FieldByName('SR_ID').AsInteger  := Sr_Id;
              FieldByName('OBJLNG_DESC').AsString := dmConexao.cdsGeral.FieldByName('OBJLNG_DESC').AsString;
              FieldByName('OBJ_NAME').AsString := dmConexao.cdsGeral.FieldByName('OBJ_NAME').AsString;
              FieldByName('OT_DESC').AsString := dmConexao.cdsGeral.FieldByName('OT_DESC').AsString;
              Post;
            end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
         end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      end; // If lsbObjDisp.Selected[i] then
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbObjDisp.MoveSelection(lsbObjSel);
end;

procedure TFrmSystemRoles.actAddAllObjectsExecute(Sender: TObject);
var
  Sr_Id, i: Integer;
begin
  If Status = stInsert then
    Sr_Id := -1
  Else
    Sr_Id := dmSys1.cdsSystemRoles.FieldByName('SR_ID').AsInteger;

  For i := 0 to lsbObjDisp.Count -1 do
   begin
     With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      begin
        If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
         begin
           Append;
           FieldByName('FRM_ID').AsInteger := dbLkpForm.KeyValue;
           FieldByName('OBJ_ID').AsInteger := dmConexao.cdsGeral.FieldByName('OBJ_ID').AsInteger;
           FieldByName('SR_ID').AsInteger  := Sr_Id;
           FieldByName('OBJLNG_DESC').AsString := dmConexao.cdsGeral.FieldByName('OBJLNG_DESC').AsString;
           FieldByName('OBJ_NAME').AsString := dmConexao.cdsGeral.FieldByName('OBJ_NAME').AsString;
           FieldByName('OT_DESC').AsString := dmConexao.cdsGeral.FieldByName('OT_DESC').AsString;
           Post;
         end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
      end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbObjDisp.SelectAll;
  lsbObjDisp.MoveSelection(lsbObjSel);
end;

procedure TFrmSystemRoles.actDelObjectExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  If lsbObjSel.SelCount = 0 then Exit;
  For i := 0 to lsbObjSel.Count -1 do
   begin
     If lsbObjSel.Selected[i] then
      begin
        With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
         begin
           If Locate('OBJ_ID', Integer(lsbObjSel.Items.Objects[i]), []) then
            begin
              dmSys1.cdsFormObjectsXSystemRoles.Delete;
            end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
         end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      end; // If lsbObjDisp.Selected[i] then
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbObjSel.MoveSelection(lsbObjDisp);
end;

procedure TFrmSystemRoles.actDelAllObjectsExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  For i := 0 to lsbObjSel.Count -1 do
   begin
     With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      begin
        If Locate('OBJ_ID', Integer(lsbObjSel.Items.Objects[i]), []) then
         begin
           dmSys1.cdsFormObjectsXSystemRoles.Delete;
         end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
      end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbObjSel.SelectAll;
  lsbObjSel.MoveSelection(lsbObjDisp);

end;

procedure TFrmSystemRoles.lsbObjDispDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  actDelObjectExecute(Self);
end;

procedure TFrmSystemRoles.lsbObjDispDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TListBox;
end;

procedure TFrmSystemRoles.lsbObjSelDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  actAddObjectExecute(Self);
end;

procedure TFrmSystemRoles.lsbObjSelDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TListBox;
end;

end.
