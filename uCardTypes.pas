unit uCardTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, RxLookup,
  Buttons;

type
  TFrmCardTypes = class(TFrmBaseSys)
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    pcSubApplications: TPageControl;
    TabSheet1: TTabSheet;
    Label19: TLabel;
    btDisplayCancel: TSpeedButton;
    btDisplayOK: TSpeedButton;
    dbLkApplications: TRxDBLookupCombo;
    edApp: TEdit;
    dbgAplicacoes: TDBGrid;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label5: TLabel;
    db_CTY_BLOCKSPERSECTOR: TDBEdit;
    dbCardUsersStatus: TRxDBComboBox;
    lStatus: TLabel;
    Label3: TLabel;
    db_CTY_SECTORQTY: TDBEdit;
    db_CTY_BLOCKSIZE: TDBEdit;
    Label4: TLabel;
    Label1: TLabel;
    dbMastersecidmin: TDBEdit;
    Label6: TLabel;
    dbMastersecidmax: TDBEdit;
    Label7: TLabel;
    db_CTYAPP_BUSECIDMIN: TDBEdit;
    Label8: TLabel;
    db_CTYAPP_BUSECIDMAX: TDBEdit;
    Label9: TLabel;
    db_CTYAPP_REPEATQTY: TDBEdit;
    edDesc: TEdit;
    Label10: TLabel;
    lkFilterStatus: TComboBox;
    Label11: TLabel;
    actNewApp: TAction;
    actEditApp: TAction;
    actDeleteApp: TAction;
    actOkApp: TAction;
    actCancelApp: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure tbtnEditCardAppClick(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure dbLkApplicationsCloseUp(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actNewAppExecute(Sender: TObject);
    procedure actEditAppExecute(Sender: TObject);
    procedure actDeleteAppExecute(Sender: TObject);
    procedure actOkAppExecute(Sender: TObject);
    procedure actCancelAppExecute(Sender: TObject);
    procedure db_CTY_SECTORQTYChange(Sender: TObject);
    procedure db_CTY_BLOCKSIZEChange(Sender: TObject);
    procedure dbMastersecidminChange(Sender: TObject);
    procedure dbMastersecidmaxChange(Sender: TObject);
    procedure db_CTYAPP_BUSECIDMINChange(Sender: TObject);
    procedure db_CTYAPP_BUSECIDMAXChange(Sender: TObject);
    procedure db_CTYAPP_REPEATQTYChange(Sender: TObject);
    procedure db_CTY_BLOCKSPERSECTORChange(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
  private
     ccardTypes : String;
     Procedure SetApp;
     Procedure SetStatus(Status : Boolean);
     Procedure BeforeUpdate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCardTypes: TFrmCardTypes;

implementation

uses uDmSys, AppSparkSysMain, uDmConexao, uConst,
     uGeralFunctions, uDmSys1, uFrmBaseCadastro, uFrmSystemLog;

{$R *.dfm}

Procedure TFrmCardTypes.BeforeUpdate;
Var
 vCTY_ID : Integer;
Begin
  vCTY_ID := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('CARDTYPES','CTY_ID', 'False', '');

  DmSys.cdsCardTypesXApplications.First;

  While NOT DmSys.cdsCardTypesXApplications.Eof do
      Begin
         DmSys.cdsCardTypesXApplications.Edit;
         DmSys.cdsCardTypesXApplications.FieldByName('CTY_ID').AsInteger := vCTY_ID;
         DmSys.cdsCardTypesXApplications.Post;
      End;

  DmSys.cdsCardTypes.Edit;
  DmSys.cdsCardTypes.FieldByName('CTY_ID').AsInteger := vCTY_ID;
  DmSys.cdsCardTypes.Post;


End;

Procedure TFrmCardTypes.SetStatus(Status : Boolean);
Begin
  cbCardApps.Enabled := Status;
End;

procedure TFrmCardTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsCardTypes, DmSys.cdsCardTypesXApplications, DmSys.cdsApplicationsLook,
                   DmSys.cdsCardTypesXApplications]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CTY_ID', 'FROM CARDTYPES ', 'True', ' WHERE CTY_STATUS = ''A'' ') ) + ' Registro(s)';

    actLog.Enabled := DmSys.cdsCardTypes.RecordCount > 0;

end;

procedure TFrmCardTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsCardTypes, DmSys.cdsCardTypesXApplications, DmSys.cdsApplicationsLook,
                    DmSys.cdsCardTypesXApplications]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsSeries.CommandText := 'SELECT '+ cCardTypes +' From CARDTYPES where CTY_STATUS = ''A'' ORDER BY CTY_DESC';
    FrmCardTypes := Nil;
end;

procedure TFrmCardTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetStatus(True);
  SetActions([], False, FrmCardTypes, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCardTypes, t_form_objects);
  dbDesc.SetFocus;
  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsCardTypesXApplications.IsEmpty ), FrmCardTypes, t_form_objects);
end;

procedure TFrmCardTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  SetStatus(True);
  ActionInsertSys(DmSys.cdsCardTypes);
  SetActions([], False, FrmCardTypes, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCardTypes, t_form_objects);
  dbDesc.SetFocus;

  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsCardTypesXApplications.IsEmpty ), FrmCardTypes, t_form_objects);
end;

procedure TFrmCardTypes.actApplyUpdatesExecute(Sender: TObject);
begin
  If Trim(dbDesc.Text) = '' Then
     Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
       dbDesc.SetFocus;
       Exit;
     End;

 inherited;
  If  status = stConsult Then
    BEGIN
     If dtsMaster.DataSet.State = dsInsert Then
        BeforeUpdate;
     If ApplyTablesSys([dbDesc], [DmSys.cdsCardTypes,
                                  DmSys.cdsCardTypesXApplications]) Then
         begin
          SetActions([], True, FrmCardTypes, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmCardTypes, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;

  actLog.Enabled := True

End;

procedure TFrmCardTypes.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsCardTypes.Cancel;
     DmSys.cdsCardTypesXApplications.Cancel;
     DmSys.cdsCardTypesXApplications.Close;
     DmSys.cdsCardTypesXApplications.Open;
     SetActions([], True, FrmCardTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmCardTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

  actLog.Enabled := DmSys.cdsCardTypes.RecordCount > 0;

end;

procedure TFrmCardTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatus(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmCardTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True,  FrmCardTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmCardTypes.SetApp;
Var Str : String;
Begin
   DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([DmSys.cdsCardTypesXApplications.FieldByName('APP_ID').AsInteger,
                                                                 DmSys.cdsCardTypesXApplications.FieldByName('ISS_ID').AsInteger]), [] );

   Str :=  dmSys.cdsCardTypesXApplications.FieldByName('APP_DESCSHORT').AsString +
           '        -        '+
           dmSys.cdsCardTypesXApplications.FieldByName('ISS_DESCLONG').AsString;
   If Trim(Str) = '-' Then
      Str := '';
    edApp.Text := Str;

End;


procedure TFrmCardTypes.tbtnEditCardAppClick(Sender: TObject);
begin
  inherited;
  dbgAplicacoes.Visible := False;
  dbMastersecidmin.SetFocus;
  SetApp;
  DmSys.dtsCardTypesXApplications.Edit;

  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);

end;

procedure TFrmCardTypes.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
   SetStatus(False);
end;

procedure TFrmCardTypes.dbLkApplicationsCloseUp(Sender: TObject);
begin
  inherited;
   edApp.SetFocus;
   IF Trim(dbLkApplications.Text) <> '' Then
      Begin
         edApp.Text := dmSys.cdsApplicationsLook.FieldByName('APP_DESCSHORT').AsString +
                       '        -        '+
                       dmSys.cdsApplicationsLook.FieldByName('ISS_DESCLONG').AsString;
      End;

end;

procedure TFrmCardTypes.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' CTY_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' CTY_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' CTY_STATUS = ' + QuotedStr('I') + ' AND ';
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
  with DmSys do
    begin
      cdsCardTypes.Close;
      cdsCardTypes.CommandText := 'SELECT '+ ccardTypes +' From CARDTYPES CTY ' +
                                      strWhere +
                                      ' ORDER BY CTY.CTY_DESC';
      cdsCardTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CTY_ID', 'FROM CARDTYPES', 'True', strWhere) ) + ' Registro(s)';
    end;

  actLog.Enabled := DmSys.cdsCardTypes.RecordCount > 0;

end;

procedure TFrmCardTypes.FormCreate(Sender: TObject);
begin
  inherited;
  ccardTypes := ' CTY.*, CTY.CTY_STATUS AS STATUS_ID ';
  dtsMaster.DataSet := DmSys.cdsCardTypes;
end;

procedure TFrmCardTypes.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsCardTypes.Edit;
         cdsCardTypes.FieldByName('CTY_STATUS').AsString := 'I';
         cdsCardTypes.Post;
         cdsCardTypes.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

   actLog.Enabled := DmSys.cdsCardTypes.RecordCount > 0;

end;

procedure TFrmCardTypes.actNewAppExecute(Sender: TObject);
begin
  inherited;
  edApp.Text := '';
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
  dbgAplicacoes.Visible   := False;
  DmSys.cdsCardTypesXApplications.Insert;
end;

procedure TFrmCardTypes.actEditAppExecute(Sender: TObject);
begin
  inherited;
  dbgAplicacoes.Visible := False;
  dbMastersecidmin.SetFocus;
  SetApp;
  DmSys.dtsCardTypesXApplications.Edit;

  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
end;

procedure TFrmCardTypes.actDeleteAppExecute(Sender: TObject);
begin
  inherited;
  DmSys.cdsCardTypesXApplications.Delete;
  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsCardTypesXApplications.IsEmpty ), FrmCardTypes, t_form_objects);
end;

procedure TFrmCardTypes.actOkAppExecute(Sender: TObject);
begin
  inherited;
  With DmSys, DmSys1 do
   Begin
     If Trim(dbMastersecidmin.Text) = '' Then
        Begin
          DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
          dbMastersecidmin.SetFocus;
          Exit;
        End
     Else
     If Trim(dbMastersecidmax.Text) = '' Then
        Begin
          DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
          dbMastersecidmax.SetFocus;
          Exit;
        End
     Else
     If Trim(db_CTYAPP_REPEATQTY.Text) = '' Then
        Begin
          DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
          db_CTYAPP_REPEATQTY.SetFocus;
          Exit;
        End;

     SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
     SetCategories([Applications], True, Self, t_form_objects);

     cdsCardTypesXApplications.FieldByName('APP_ID').AsString := cdsApplicationsLook.fieldByName('APP_ID').AsString;
     cdsCardTypesXApplications.FieldByName('ISS_ID').AsString := cdsApplicationsLook.fieldByName('ISS_ID').AsString;
     cdsCardTypesXApplications.FieldByName('APP_DESCSHORT').AsString := cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
     cdsCardTypesXApplications.FieldByName('ISS_DESCLONG').AsString  := cdsApplicationsLook.fieldByName('ISS_DESCLONG').AsString;

     cdsCardTypesXApplications.Post;
     dbgAplicacoes.Visible   := True;
  End;
end;

procedure TFrmCardTypes.actCancelAppExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel, actNewApp, actEditApp], True, Self, t_form_objects);
  SetActions([actDeleteApp], NOT (dmSys.cdsCardTypesXApplications.RecordCount = 0), Self, t_form_objects);
  DmSys.cdsCardTypesXApplications.Cancel;
  dbgAplicacoes.Visible := True;
end;

procedure TFrmCardTypes.db_CTY_SECTORQTYChange(Sender: TObject);
begin
  inherited;
  db_CTY_SECTORQTY.Text := ValidateValues(db_CTY_SECTORQTY.Text);
end;

procedure TFrmCardTypes.db_CTY_BLOCKSIZEChange(Sender: TObject);
begin
  inherited;
  db_CTY_BLOCKSIZE.Text := ValidateValues(db_CTY_BLOCKSIZE.Text);
end;

procedure TFrmCardTypes.dbMastersecidminChange(Sender: TObject);
begin
  inherited;
  dbMastersecidmin.Text := ValidateValues(dbMastersecidmin.Text);
end;

procedure TFrmCardTypes.dbMastersecidmaxChange(Sender: TObject);
begin
  inherited;
  dbMastersecidmax.Text := ValidateValues(dbMastersecidmax.Text);
end;

procedure TFrmCardTypes.db_CTYAPP_BUSECIDMINChange(Sender: TObject);
begin
  inherited;
db_CTYAPP_BUSECIDMIN.Text := ValidateValues(db_CTYAPP_BUSECIDMIN.Text);
end;

procedure TFrmCardTypes.db_CTYAPP_BUSECIDMAXChange(Sender: TObject);
begin
  inherited;
db_CTYAPP_BUSECIDMAX.Text := ValidateValues(db_CTYAPP_BUSECIDMAX.Text);
end;

procedure TFrmCardTypes.db_CTYAPP_REPEATQTYChange(Sender: TObject);
begin
  inherited;
db_CTYAPP_REPEATQTY.Text := ValidateValues(db_CTYAPP_REPEATQTY.Text);
end;

procedure TFrmCardTypes.db_CTY_BLOCKSPERSECTORChange(Sender: TObject);
begin
  inherited;
db_CTY_BLOCKSPERSECTOR.Text := ValidateValues(db_CTY_BLOCKSPERSECTOR.Text);
end;

procedure TFrmCardTypes.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '7';
  FrmSystemLog.pSLG_ID := DmSys.cdsCardTypes.FieldByName('CTY_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

end.
