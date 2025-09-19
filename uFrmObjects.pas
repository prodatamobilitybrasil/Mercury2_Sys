unit uFrmObjects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxLookup, Mask, DBCtrls, Buttons;

type
  TFrmObjects = class(TFrmBaseSys)
    grbObject: TGroupBox;
    Label1: TLabel;
    dbName: TDBEdit;
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label3: TLabel;
    dbFieldName: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edName: TEdit;
    edDesc: TEdit;
    edFieldName: TEdit;
    lkObjectType: TRxDBLookupCombo;
    dblkType: TRxDBLookupCombo;
    dblkTransType: TRxDBLookupCombo;
    dblkDatatype: TRxDBLookupCombo;
    pcDetail: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cbLanguages: TCoolBar;
    tbLanguages: TToolBar;
    tbtnEditDetail: TToolButton;
    tbtnNewDetail: TToolButton;
    ToolButton3: TToolButton;
    cbFroms: TCoolBar;
    tbForms: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Panel1: TPanel;
    grdLanguages: TDBGrid;
    actNewLanguage: TAction;
    actEditLanguage: TAction;
    actDelLanguage: TAction;
    actLanguageOk: TAction;
    actLanguageCancel: TAction;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dblkLanguage: TRxDBLookupCombo;
    Label11: TLabel;
    dbLangDesc: TDBEdit;
    Label12: TLabel;
    dbLangCaption: TDBEdit;
    Label13: TLabel;
    dbLangHint: TDBEdit;
    Label14: TLabel;
    Panel4: TPanel;
    grdForms: TDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn3: TBitBtn;
    Splitter1: TSplitter;
    Panel8: TPanel;
    cbForms: TCoolBar;
    ToolBar1: TToolBar;
    btnAddForm: TToolButton;
    btnAddAllForms: TToolButton;
    btnDelForm: TToolButton;
    btnDelAllForms: TToolButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Label15: TLabel;
    lsbFrmDisp: TListBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Label16: TLabel;
    lsbFrmSel: TListBox;
    actNewForm: TAction;
    actEditForm: TAction;
    actFormOk: TAction;
    actAddForm: TAction;
    actAddAllForms: TAction;
    actDelForm: TAction;
    actDelAllForms: TAction;
    edOBJ_ID: TEdit;
    Label17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNewLanguageExecute(Sender: TObject);
    procedure actEditLanguageExecute(Sender: TObject);
    procedure actDelLanguageExecute(Sender: TObject);
    procedure actLanguageOkExecute(Sender: TObject);
    procedure actLanguageCancelExecute(Sender: TObject);
    procedure actNewFormExecute(Sender: TObject);
    procedure actEditFormExecute(Sender: TObject);
    procedure actFormOkExecute(Sender: TObject);
    procedure actAddFormExecute(Sender: TObject);
    procedure actAddAllFormsExecute(Sender: TObject);
    procedure actDelFormExecute(Sender: TObject);
    procedure actDelAllFormsExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcDetailChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure lsbFrmDispDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lsbFrmSelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lsbFrmDispDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lsbFrmSelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbNameChange(Sender: TObject);
    procedure dbLangDescChange(Sender: TObject);
  private
    bEditDetail : Boolean;
    procedure FillFormLists;
  public
    { Public declarations }
  end;

var
  FrmObjects: TFrmObjects;

implementation

uses AppSparkSysMain, uConst, uDmSys1, uGeralFunctions, uFrmBaseCadastro,
  uDmConexao;

{$R *.dfm}

procedure TFrmObjects.FillFormLists;
begin
  With dmSys1, dmConexao.cdsGeral do
   begin
     Close;
     CommandText := ' SELECT FRM_ID , FRM.FRM_DESC     '
                  + ' FROM   FORMS FRM                 '
                  + ' WHERE  FRM.FRM_STATUS  =  ''A''  '
                  + ' ORDER BY FRM.FRM_DESC            ';
     Open;

     lsbFrmDisp.Items.Clear;
     lsbFrmSel.Items.Clear;

     While not Eof do
      begin
        If cdsFormsXObjects.Locate('FRM_ID', FieldByName('FRM_ID').Value, [] ) then
         begin
           lsbFrmSel.Items.AddObject(FieldByName('FRM_DESC').AsString, TObject(FieldByName('FRM_ID').AsInteger));
         end
        Else
         begin
           lsbFrmDisp.Items.AddObject(FieldByName('FRM_DESC').AsString, TObject(FieldByName('FRM_ID').AsInteger));
         end;
        Next;
      end;
   end;     {}
end;

procedure TFrmObjects.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsObjects;
end;

procedure TFrmObjects.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsObjects, dmSys1.cdsObjectTypes, dmSys1.cdsObjectTranslationMT, dmSys1.cdsDataTypes, dmSys1.cdsLanguages,
                 dmSys1.cdsObjectsXLanguages, dmSys1.cdsFormsXObjects]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('OBJ_ID', 'FROM OBJECTS', 'False', '') ) + ' Registro(s)';
  grdLanguages.Align := alClient;
  grdForms.Align := alClient;

  SetActions([actNewLanguage, actEditLanguage, actDelLanguage, actNewForm, actEditForm], False, FrmObjects,  t_form_objects);
  bEditDetail := False;
  pcDetail.ActivePageIndex := 0;
end;

procedure TFrmObjects.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsObjects, dmSys1.cdsObjectTypes, dmSys1.cdsObjectTranslationMT, dmSys1.cdsDataTypes, dmSys1.cdsLanguages]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmObjects := Nil;
end;

procedure TFrmObjects.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsObjects);
  DmSys1.cdsObjects.FieldByName('OBJ_ID').AsInteger := -1;
  SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], False, FrmObjects, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewLanguage, actNewForm], true, FrmObjects, t_form_objects);

  SetActions([actEditForm], not ( dmSys1.cdsFormsXObjects.IsEmpty ), FrmObjects, t_form_objects);
  SetActions([actEditLanguage, actDelLanguage], not ( dmSys1.cdsObjectsXLanguages.IsEmpty ), FrmObjects, t_form_objects);
  dbName.SetFocus;

end;

procedure TFrmObjects.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], False, FrmObjects, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewLanguage, actNewForm], true, FrmObjects, t_form_objects);

  SetActions([actEditForm], not ( dmSys1.cdsFormsXObjects.IsEmpty ), FrmObjects, t_form_objects);
  SetActions([actEditLanguage, actDelLanguage], not ( dmSys1.cdsObjectsXLanguages.IsEmpty ), FrmObjects, t_form_objects);
  dbName.SetFocus;

end;

procedure TFrmObjects.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := ' WHERE OBJ.OBJ_STATUS = ''A'' ';

  If Trim(edName.Text) <> '' then
   begin
     strWhere := strWhere + ' AND  OBJ.OBJ_NAME LIKE ' + QuotedStr(Trim(edName.Text) + '%');
   end;
  If Trim(edOBJ_ID.Text) <> '' then
   begin
     strWhere := strWhere + ' AND  OBJ.OBJ_ID = ' + edOBJ_ID.Text;
   end;
  If Trim(edDesc.Text) <> '' then
   begin
     strWhere := strWhere + ' AND  OBJ.OBJ_DESC LIKE ' + QuotedStr(Trim(edDesc.Text) + '%');
   end;
  If Trim(edFieldName.Text) <> '' then
   begin
     strWhere := strWhere + ' AND  OBJ.OBJ_FIELDNAME LIKE ' + QuotedStr(Trim(edFieldName.Text) + '%');
   end;
  If lkObjectType.KeyValue > 0 then
   begin
     strWhere := strWhere + ' AND  OBJ.OT_ID = ' + IntToStr(lkObjectType.KeyValue);
   end;


  with DmSys1 do
    begin
      cdsObjects.Close;
      cdsObjects.CommandText := 'SELECT OBJ.*, OTM.OTM_DESC, DT.DT_DESC, OT.OT_DESC '
                                  + ' FROM   OBJECTS OBJ                        '
                                  + ' LEFT OUTER JOIN OBJECTTRANSLATIONMT OTM   '
                                  + ' ON     OTM.OTM_ID  =  OBJ.OTM_ID          '
                                  + ' LEFT OUTER JOIN DATATYPES DT              '
                                  + ' ON     DT.DT_ID    =  OBJ.DT_ID           '
                                  + ' LEFT OUTER JOIN OBJECTTYPES OT            '
                                  + ' ON     OT.OT_ID    =  OBJ.OT_ID           '
                                  + strWhere
                                  + ' ORDER BY  OTM.OTM_DESC ';
      cdsObjects.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('OBJ.OBJ_ID', 'FROM OBJECTS OBJ', 'True', strWhere) ) + ' Registro(s)';
    end

end;

procedure TFrmObjects.actNewLanguageExecute(Sender: TObject);
begin
  inherited;
  grdLanguages.Visible := False;
  dmSys1.cdsObjectsXLanguages.Append;
  dblkLanguage.SetFocus;

  SetActions([actNewLanguage, actEditLanguage, actDelLanguage, actApplyUpdates, actCancel], False, FrmObjects, t_form_objects);
  bEditDetail := True;
end;

procedure TFrmObjects.actEditLanguageExecute(Sender: TObject);
begin
  inherited;
  grdLanguages.Visible := False;
  dblkLanguage.SetFocus;

  SetActions([actNewLanguage, actEditLanguage, actDelLanguage, actApplyUpdates, actCancel], False, FrmObjects, t_form_objects);
  bEditDetail := True;
end;

procedure TFrmObjects.actDelLanguageExecute(Sender: TObject);
begin
  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
   begin
     dmSys1.cdsObjectsXLanguages.Delete;
   end;
  SetActions([actEditLanguage, actDelLanguage], not ( dmSys1.cdsObjectsXLanguages.IsEmpty ), FrmObjects, t_form_objects);
end;

procedure TFrmObjects.actLanguageOkExecute(Sender: TObject);
var
  Obj_Id : Integer;
begin
  inherited;
  If dblkLanguage.KeyValue < 0 then
   begin
     DisplayMsg(t_form_objects, '%T', [3006], []);
     dblkLanguage.SetFocus;
     exit;
   end;
  If dbLangDesc.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T', [3006], []);
     dbLangDesc.SetFocus;
     exit;
   end;
  Try
    If Status = stInsert then
      Obj_Id := -1
    Else
      Obj_Id := dmSys1.cdsObjects.FieldByName('OBJ_ID').AsInteger;

    dmSys1.cdsObjectsXLanguages.FieldByName('OBJ_ID').AsInteger := Obj_Id;
    dmSys1.cdsObjectsXLanguages.FieldByName('LNG_DESC').AsString := dblkLanguage.Text;
    dmSys1.cdsObjectsXLanguages.Post;
    bEditDetail := False;
  Except
    DisplayMsg(t_form_objects, '%T', [1605], []);
    dblkLanguage.SetFocus;
    exit;
  End;

  grdLanguages.Visible := True;
  SetActions([actNewLanguage, actEditLanguage, actDelLanguage, actApplyUpdates, actCancel], True, FrmObjects, t_form_objects);
  SetActions([actEditLanguage, actDelLanguage], not ( dmSys1.cdsObjectsXLanguages.IsEmpty ), FrmObjects, t_form_objects);
end;

procedure TFrmObjects.actLanguageCancelExecute(Sender: TObject);
begin
  inherited;
  dmSys1.cdsObjectsXLanguages.Cancel;
  grdLanguages.Visible := True;
  SetActions([actNewLanguage, actEditLanguage, actDelLanguage, actApplyUpdates, actCancel], True, FrmObjects, t_form_objects);
  bEditDetail := False;
end;

procedure TFrmObjects.actNewFormExecute(Sender: TObject);
begin
  inherited;
  SetActions([actNewForm, actEditForm, actApplyUpdates, actCancel], False, FrmObjects, t_form_objects);
  bEditDetail := True;

  grdForms.Visible := False;
  FillFormLists;
end;

procedure TFrmObjects.actEditFormExecute(Sender: TObject);
begin
  inherited;
  SetActions([actNewForm, actEditForm, actApplyUpdates, actCancel], False, FrmObjects, t_form_objects);
  bEditDetail := True;

  grdForms.Visible := False;
  FillFormLists;
end;

procedure TFrmObjects.actFormOkExecute(Sender: TObject);
begin
  inherited;
  SetActions([actNewForm, actEditForm, actApplyUpdates, actCancel], True, FrmObjects, t_form_objects);
  bEditDetail := False;

  grdForms.Visible := True;
end;

procedure TFrmObjects.actAddFormExecute(Sender: TObject);
var
  Obj_Id, i : Integer;
begin
  inherited;
  If lsbFrmDisp.SelCount = 0 then Exit;

  If Status = stInsert then
    Obj_Id := -1
  Else
    Obj_Id := dmSys1.cdsObjects.FieldByName('OBJ_ID').AsInteger;

  For i := 0 to lsbFrmDisp.Count -1 do
   begin
     If lsbFrmDisp.Selected[i] then
      begin
        With dmSys1, dmSys1.cdsFormsXObjects do
         begin
           Append;
           FieldByName('OBJ_ID').AsInteger := Obj_Id;
           FieldByName('FRM_ID').AsInteger := Integer(lsbFrmDisp.Items.Objects[i]);
           FieldByName('FRM_DESC').AsString := lsbFrmDisp.Items[i];
           FieldByName('FRMOBJ_STATUS').AsString  := 'A';
           Post;
         end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      end; // If lsbObjDisp.Selected[i] then
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbFrmDisp.MoveSelection(lsbFrmSel);
end;

procedure TFrmObjects.actAddAllFormsExecute(Sender: TObject);
var
  Obj_Id, i : Integer;
begin
  inherited;
  If Status = stInsert then
    Obj_Id := -1
  Else
    Obj_Id := dmSys1.cdsObjects.FieldByName('OBJ_ID').AsInteger;

  For i := 0 to lsbFrmDisp.Count -1 do
   begin
     With dmSys1, dmSys1.cdsFormsXObjects do
      begin
        Append;
        FieldByName('OBJ_ID').AsInteger := Obj_Id;
        FieldByName('FRM_ID').AsInteger := Integer(lsbFrmDisp.Items.Objects[i]);
        FieldByName('FRM_DESC').AsString := lsbFrmDisp.Items[i];
        FieldByName('FRMOBJ_STATUS').AsString  := 'A';
        Post;
      end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbFrmDisp.SelectAll;
  lsbFrmDisp.MoveSelection(lsbFrmSel);
end;

procedure TFrmObjects.actDelFormExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  If lsbFrmSel.SelCount = 0 then Exit;
  For i := 0 to lsbFrmSel.Count -1 do
   begin
     If lsbFrmSel.Selected[i] then
      begin
        With dmSys1, dmSys1.cdsFormsXObjects do
         begin
           If Locate('FRM_ID', Integer(lsbFrmSel.Items.Objects[i]), []) then
            begin
              dmSys1.cdsFormsXObjects.Delete;
            end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
         end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
      end; // If lsbObjDisp.Selected[i] then
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbFrmSel.MoveSelection(lsbFrmDisp);
end;

procedure TFrmObjects.actDelAllFormsExecute(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  For i := 0 to lsbFrmSel.Count -1 do
   begin
     With dmSys1, dmSys1.cdsFormsXObjects do
      begin
        If Locate('FRM_ID', Integer(lsbFrmSel.Items.Objects[i]), []) then
         begin
           dmSys1.cdsFormsXObjects.Delete;
         end; // If dmConexao.cdsGeral.Locate('OBJ_ID', Integer(lsbObjDisp.Items.Objects[i]), []) then
      end; //With dmSys1, dmSys1.cdsFormObjectsXSystemRoles do
   end; // For i := 0 to lsbObjDisp.Count -1 do

  lsbFrmSel.SelectAll;
  lsbFrmSel.MoveSelection(lsbFrmDisp);
end;

procedure TFrmObjects.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetActions([actRefresh, actFilter], False, FrmObjects, t_form_objects);

end;

procedure TFrmObjects.actApplyUpdatesExecute(Sender: TObject);
var
  Obj_Id : Integer;
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1511], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
   begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     Try
       If Status = stInsert then
        begin
         Obj_Id  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('OBJECTS', 'OBJ_ID', 'False', '' );

         If dtsMaster.DataSet.State = dsInsert Then
         Begin
           dmSys1.cdsObjectsXLanguages.First;
           While not dmSys1.cdsObjectsXLanguages.Eof do
            begin
              dmSys1.cdsObjectsXLanguages.Edit;
              dmSys1.cdsObjectsXLanguages.FieldByName('OBJ_ID').AsInteger := Obj_Id;
              dmSys1.cdsObjectsXLanguages.Post;
//             dmSys1.cdsObjectsXLanguages.Next;
            end;

          dmSys1.cdsFormsXObjects.First;
          While not dmSys1.cdsFormsXObjects.Eof do
           begin
             dmSys1.cdsFormsXObjects.Edit;
             dmSys1.cdsFormsXObjects.FieldByName('OBJ_ID').AsInteger := Obj_Id;
             dmSys1.cdsFormsXObjects.Post;
//             dmSys1.cdsFormsXObjects.Next;
           end;
         End;
          DmSys1.cdsObjects.FieldByName('OBJ_ID').AsInteger := Obj_Id;
        end
       Else
        begin
          Obj_Id := DmSys1.cdsObjects.FieldByName('OBJ_ID').AsInteger;
        end;

       ApplyTables([dbName, dbDesc, dblkType], DmSys1.cdsObjects);
       If status = stConsult then
        begin
          dmSys1.cdsObjectsXLanguages.ApplyUpdates(-1);
          dmSys1.cdsFormsXObjects.ApplyUpdates(-1);

          SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmObjects, t_form_objects);
          SetActions([actApplyUpdates, actCancel, actNewLanguage, actNewForm, actEditForm, actEditLanguage, actDelLanguage], False, FrmObjects, t_form_objects);

          DmSys1.cdsObjects.Close;
          DmSys1.cdsObjects.Open;
          DmSys1.cdsObjects.Locate('OBJ_ID', Obj_Id, []);
          //tbtnRefresh.Click;
        end
       Else
        begin
          dmConexao.ConnBrkMaster.AppServer.Rollback;
          Exit;
        end;
       dmConexao.ConnBrkMaster.AppServer.Commit;
     Except
       dmConexao.ConnBrkMaster.AppServer.Rollback;
       Exit;
     end;
   end;

end;

procedure TFrmObjects.actCancelExecute(Sender: TObject);
begin
  //inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
   begin
     dmSys1.cdsObjects.Cancel;
     dmSys1.cdsFormsXObjects.Cancel;
     SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], True, FrmObjects, t_form_objects);
     SetActions([actApplyUpdates, actCancel, actNewLanguage, actNewForm, actEditForm, actEditLanguage, actDelLanguage], False, FrmObjects, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     dmSys1.cdsObjects.Close;
     dmSys1.cdsObjects.Open;
     dmSys1.cdsFormsXObjects.Close;
     dmSys1.cdsFormsXObjects.Open;     
     grdLanguages.Visible := True;
     grdForms.Visible := True;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmObjects.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsObjects.Edit;
         cdsObjects.FieldByName('OBJ_STATUS').AsString := 'I';
         cdsObjects.Post;
         cdsObjects.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmObjects.pcDetailChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  AllowChange := not ( bEditDetail );
end;

procedure TFrmObjects.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
//      SetStatusPanels(False);
        SetActions([actRefresh, actFilter], False, FrmObjects, t_form_objects);
        If Status = stConsult then
          SetActions([actNewLanguage, actEditLanguage, actDelLanguage, actNewForm, actEditForm], False, FrmObjects, t_form_objects);
     End
  Else
    Begin
      If Status = stConsult then
        SetActions([actRefresh, actFilter], True, FrmObjects, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmObjects.lsbFrmDispDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TListBox;
end;

procedure TFrmObjects.lsbFrmSelDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TListBox;

end;

procedure TFrmObjects.lsbFrmDispDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  actDelFormExecute(Self);
end;

procedure TFrmObjects.lsbFrmSelDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  actAddFormExecute(Self);
end;

procedure TFrmObjects.dbNameChange(Sender: TObject);
begin
  inherited;
  if (dbName.Text = '') then dbDesc.Text:='';
  if (DmSys1.cdsObjects.State = dsInsert) and (dbName.Text <> '') then
  dmSys1.cdsObjects.FieldByName('OBJ_DESC').Value:=dbName.Text;
end;

procedure TFrmObjects.dbLangDescChange(Sender: TObject);
begin
  inherited;
  dbLangCaption.Text := dbLangDesc.Text;
  dbLangHint.Text := dbLangDesc.Text;
end;

end.
