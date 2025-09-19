unit uPersonnelTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb, RxLookup,
  RXDBCtrl, DBTables, MemTable;

Const vCommandText = 'SELECT VF_ID,  VF_DESC,  VF_REGDATE, '+
                    'VF_REGUSER,  VF_STATUS,  VF_STATUS AS STATUS_ID '+
                    'FROM VALIDATORFUNCTIONS '+
                    'WHERE  VF_STATUS  = ''A'' AND  VF_ID NOT IN '+
                    '(SELECT VF_ID FROM PERSONNELTYPESXVALIDATORFCTS '+
                    'WHERE PRST_ID =:PRST_ID   AND   VS_ID =:VS_ID) ';
type
  TFrmPersonnelTypes = class(TFrmBaseSys)
    gbPersonnel: TGroupBox;
    Label1: TLabel;
    dbPrstId: TDBEdit;
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label3: TLabel;
    edPRSTID: TEdit;
    edPRSTDESC: TEdit;
    Label4: TLabel;
    lStatus: TLabel;
    lkFilterStatus: TComboBox;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure btnAddAllLineMtClick(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
  private
  Procedure SetCtr;
    { Private declarations }
  public
    procedure SetStatusPanels(status: Boolean); override;
    { Public declarations }
  end;

var
  FrmPersonnelTypes: TFrmPersonnelTypes;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uFrmSystemLog;

{$R *.dfm}

procedure TFrmPersonnelTypes.SetStatusPanels(status: Boolean);
begin
  gbPersonnel.Enabled := Status;
End;

Procedure TFrmPersonnelTypes.SetCtr;
Begin
  dbPrstId.Enabled := (Status = stInsert)
End;

procedure TFrmPersonnelTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsPersonnelTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('PRST_ID', 'FROM PERSONNELTYPES', 'True', ' WHERE PRST_STATUS = ''A'' ') ) + ' Registro(s)';
    actLog.Enabled := DmSys.cdsPersonnelTypes.RecordCount > 0
End;

procedure TFrmPersonnelTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsPersonnelTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsPersonnelTypes.CommandText := 'SELECT '+ ccardPersonnelTypes +' From PERSONNELTYPES where PRST_STATUS = ''A'' ORDER BY PRST_ID';    
    FrmPersonnelTypes := Nil;
end;


procedure TFrmPersonnelTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsPersonnelTypes);
  SetActions([], False, FrmPersonnelTypes, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmPersonnelTypes, t_form_objects);
  SetCtr;
  SetStatusPanels(True);
end;

procedure TFrmPersonnelTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  dbDesc.SetFocus;
  SetActions([], False, FrmPersonnelTypes, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmPersonnelTypes, t_form_objects);
  SetStatusPanels(True);
  SetCtr;
end;

procedure TFrmPersonnelTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbPrstId, dbDesc], [DmSys.cdsPersonneltypes]) Then
         begin
          SetActions([], True, FrmPersonnelTypes, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmPersonnelTypes, t_form_objects);
          actRefresh.Execute;
         end;
    END;
  actLog.Enabled := DmSys.cdsPersonnelTypes.RecordCount > 0;
end;

procedure TFrmPersonnelTypes.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsPersonnelTypes.Cancel;
     SetActions([], True, FrmPersonnelTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmPersonnelTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

    end;
  actLog.Enabled := DmSys.cdsPersonnelTypes.RecordCount > 0;
end;

procedure TFrmPersonnelTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;

  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsPersonnelTypes.Edit;
         cdsPersonnelTypes.FieldByName('PRST_STATUS').AsString := 'I';
         cdsPersonnelTypes.Post;
         cdsPersonnelTypes.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsPersonnelTypes.RecordCount > 0
  
end;

procedure TFrmPersonnelTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmPersonnelTypes, t_form_objects);
      SetCtr;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmPersonnelTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmPersonnelTypes.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edPRSTID.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRST_ID = ' + QuotedStr(edPRSTID.Text) + ' AND ';
       end;

     If Trim(edPRSTDESC.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRST_DESC LIKE ' + QuotedStr(edPRSTDESC.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' PRST_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' PRST_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsPersonnelTypes.Close;
      cdsPersonnelTypes.CommandText := 'SELECT '+ ccardPersonnelTypes +' From PERSONNELTYPES ' + strWhere + 'ORDER BY PRST_ID';
      cdsPersonnelTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('PRST_ID', 'FROM PERSONNELTYPES', 'True', strWhere) ) + ' Registro(s)';
    end;
  actLog.Enabled := DmSys.cdsPersonnelTypes.RecordCount > 0
end;

procedure TFrmPersonnelTypes.btnAddAllLineMtClick(Sender: TObject);
begin
  DmSys.cdsValidatorFunctions.First;

  While NOT DmSys.cdsValidatorFunctions.Eof do
    Begin
       IF NOT DmSys.cdsPersonnelTypesXValidatorfcts.Locate('PRST_ID;VF_ID;VS_ID',
            VarArrayOf([DmSys.cdsPersonnelTypes.FieldByName('PRST_ID').AsString,
                        DmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsString,
                        DmSys.cdsValidatorStates.FieldByName('VS_ID').AsString]), []) Then
       Begin
         DmSys.cdsPersonnelTypesXValidatorfcts.Insert;
         DmSys.cdsPersonnelTypesXValidatorfcts.FieldByName('PRST_ID').AsString      := DmSys.cdsPersonnelTypes.FieldByName('PRST_ID').AsString;
         DmSys.cdsPersonnelTypesXValidatorfcts.FieldByName('VF_ID').AsString        := DmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsString;
         DmSys.cdsPersonnelTypesXValidatorfcts.FieldByName('VS_ID').AsString        := DmSys.cdsValidatorStates.FieldByName('VS_ID').AsString;
         DmSys.cdsPersonnelTypesXValidatorfcts.FieldByName('VF_DESC').AsString      := DmSys.cdsValidatorFunctions.FieldByName('VF_DESC').AsString;
         DmSys.cdsPersonnelTypesXValidatorfcts.FieldByName('VS_SHORTDESC').AsString := DmSys.cdsValidatorStates.FieldByName('VS_SHORTDESC').AsString;
         DmSys.cdsPersonnelTypesXValidatorfcts.post;
       End;

    DmSys.cdsValidatorFunctions.Next;
    End;
end;

procedure TFrmPersonnelTypes.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '23';
  FrmSystemLog.pSLG_ID := DmSys.cdsPersonnelTypes.FieldByName('PRST_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

end.
