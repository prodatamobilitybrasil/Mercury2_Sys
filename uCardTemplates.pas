unit uCardTemplates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxLookup, Mask, DBCtrls, RxDBComb,
  Buttons, RXCtrls;

type
  TFrmCardTemplates = class(TFrmBaseSys)
    gbTemplates: TGroupBox;
    lbDesc: TLabel;
    dbDesc: TDBEdit;
    Label2: TLabel;
    dbUt_Id: TRxDBLookupCombo;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    Label7: TLabel;
    edDesc: TEdit;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    pcSubApplications: TPageControl;
    TabSheet1: TTabSheet;
    Label19: TLabel;
    btDisplayCancel: TSpeedButton;
    btDisplayOK: TSpeedButton;
    dbLkApplications: TRxDBLookupCombo;
    dbgAplicacoes: TDBGrid;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rdbPerioduseTypes: TRxDBLookupCombo;
    rdbLineGroups: TRxDBLookupCombo;
    rdbTimeGroups: TRxDBLookupCombo;
    rdbValidationPeriods: TRxDBLookupCombo;
    rdbLinha: TRxDBLookupCombo;
    rdbDateStatus: TRxDBLookupCombo;
    Label9: TLabel;
    actNewApp: TAction;
    actEditApp: TAction;
    actDeleteApp: TAction;
    actOkApp: TAction;
    actCancelApp: TAction;
    dbCty_ID: TRxDBLookupCombo;
    Label11: TLabel;
    gbAuto: TGroupBox;
    rdbValidityTypes: TRxDBLookupCombo;
    Label8: TLabel;
    dbQtde: TDBEdit;
    Label10: TLabel;
    dbePeriodUseLimit: TDBEdit;
    Label12: TLabel;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actNewAppExecute(Sender: TObject);
    procedure actEditAppExecute(Sender: TObject);
    procedure actDeleteAppExecute(Sender: TObject);
    procedure actOkAppExecute(Sender: TObject);
    procedure actCancelAppExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure ClearTabSheet(Tab : TTabSheet);
    procedure rdbDateStatusChange(Sender: TObject);
    procedure TrataCampos;
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure SetApp;
    Procedure BeforePost;
    Procedure SetStatus(status : Boolean);
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCardTemplates: TFrmCardTemplates;

implementation

uses uDmSys, uDmSys1, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uFrmBaseCadastro, uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardTemplates.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardTemplates.FormShow(Sender: TObject);
begin
  inherited;
    ct:='SELECT '+ ccardTemplates +' FROM CARDTEMPLATES CT ' +
        'INNER JOIN USERTYPES UT ON (UT.UT_ID = CT.UT_ID) %where% %order% ';
    defOrder:=' ORDER BY CT.CTE_DESC ';
    strOrder:=defOrder;

    DmSys.cdsCardTemplates.CommandText := 'SELECT '+ ccardTemplates +' FROM CARDTEMPLATES CT ' +
                                          'INNER JOIN USERTYPES UT ON (UT.UT_ID = CT.UT_ID) ' +
                                          strOrder;

    OpenTablesSys([DmSys.cdsCardTemplates, DmSys.cdsCardTemplatesXApp, DmSys.cdsUserTypes,
                   DmSys.cdsApplicationsLook, DmSys.cdsTimeGroups, DmSys.cdsLineGroups, DmSys.cdsLineMt,
                   DmSys1.cdsPeriodUseTypesLk,  DmSys1.cdsValidationPeriods, DmSys1.cdsValidityTypes, DmSys1.cdsDateStatus, DmSys.cdsCardTypes]);
    DmSys.cdsCardTemplatesXApp.Close;
    DmSys.cdsCardTemplatesXApp.Open;

//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CTE_ID', 'FROM CARDTEMPLATES', 'True', ' WHERE CTE_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsCardTemplates.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    actLog.Enabled := DmSys.cdsCardTemplates.RecordCount > 0
end;

procedure TFrmCardTemplates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    FrmSparkSysMain.stMain.Panels[2].Text := '';
    FrmSparkSysMain.stMain.Panels[3].Text := '';
    Action := caFree;
    if (tbtnCancel.enabled) and (not tbtnInsert.enabled) then
    begin
       dmSys.cdsCardTemplates.Cancel;
       DmSys.cdsCardTemplatesXApp.Cancel;
       DmSys.cdsCardTemplatesXApp.Close;
       DmSys.cdsCardTemplatesXApp.Open;
       SetActions([], True, FrmCardTemplates, t_form_objects);
       SetActions([actApplyUpdates, actCancel], False, FrmCardTemplates, t_form_objects);
       pcBaseCadastro.ActivePageIndex := 0;
       Status := stConsult;
       FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
    CloseTablesSys([DmSys.cdsCardTemplates, DmSys.cdsUserTypes,
                    DmSys.cdsCardTemplatesXApp,  DmSys.cdsApplicationsLook, DmSys.cdsTimeGroups, DmSys.cdsLineGroups, DmSys.cdsCardTypes,
                    DmSys.cdsLineMt, DmSys1.cdsValidationPeriods, DmSys1.cdsValidityTypes, DmSys1.cdsDateStatus, dmSys1.cdsPeriodUseTypesLk]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsCardTemplates.CommandText := 'SELECT '+ ccardTemplates +' From CARDTEMPLATES CT ' +
                                          'INNER JOIN USERTYPES UT ON (UT.UT_ID = CT.UT_ID)  ' +
                                          'Where CTE_STATUS = ''A'' ORDER BY CT.CTE_DESC';
    FrmCardTemplates := Nil;
end;

procedure TFrmCardTemplates.actInsertExecute(Sender: TObject);
begin
  inherited;
  SetStatus(True);
  ActionInsertSys(DmSys.cdsCardTemplates);
  SetActions([], False, FrmCardTemplates, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCardTemplates, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmCardTemplates.actEditExecute(Sender: TObject);
begin
  inherited;
  SetStatus(True);
  SetActions([], False, FrmCardTemplates, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCardTemplates, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmCardTemplates.actApplyUpdatesExecute(Sender: TObject);
begin
  If Trim(dbDesc.Text) = '' Then
     Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
       dbDesc.SetFocus;
       Exit;
     End;

 inherited;
  If  status = stConsult Then
    BEGIN
    If dtsMaster.DataSet.State = dsInsert Then
       BeforePost;
     If ApplyTablesSys([dbDesc, dbCty_ID], [DmSys.cdsCardTemplates,
                                  DmSys.cdsCardTemplatesXApp]) Then
         begin
          SetActions([], True, FrmCardTemplates, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmCardTemplates, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;

  actLog.Enabled := True;

end;

Procedure TFrmCardTemplates.BeforePost;
Var
 vCTE_ID : Integer;
Begin
  vCTE_ID := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('CARDTEMPLATES','CTE_ID', 'False', '');

  DmSys.cdsCardTemplatesXApp.First;

  While Not DmSys.cdsCardTemplatesXApp.Eof do
     Begin
        DmSys.cdsCardTemplatesXApp.Edit;
        DmSys.cdsCardTemplatesXApp.FieldByName('CTE_ID').AsInteger := vCTE_ID;
        DmSys.cdsCardTemplatesXApp.Post;
     End;

  DmSys.cdsCardTemplates.Edit;
  DmSys.cdsCardTemplates.FieldByName('CTE_ID').AsInteger := vCTE_ID;
  DmSys.cdsCardTemplates.Post;
     
End;

procedure TFrmCardTemplates.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsCardTemplates.Cancel;
     DmSys.cdsCardTemplatesXApp.Cancel;
     DmSys.cdsCardTemplatesXApp.Close;
     DmSys.cdsCardTemplatesXApp.Open;
     SetActions([], True, FrmCardTemplates, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmCardTemplates, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

  actLog.Enabled := DmSys.cdsCardTemplates.RecordCount > 0;

end;

procedure TFrmCardTemplates.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsCardTemplates.Edit;
         cdsCardTemplates.FieldByName('CTE_STATUS').AsString := 'I';
         cdsCardTemplates.Post;
         cdsCardTemplates.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

   actLog.Enabled := DmSys.cdsCardTemplates.RecordCount > 0;

end;

procedure TFrmCardTemplates.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatus(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmCardTemplates, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True,  FrmCardTemplates, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

Procedure TFrmCardTemplates.SetStatus(status : Boolean);
Begin
  gbTemplates.enabled := Status;
  cbCardApps.enabled := Status;
End;

procedure TFrmCardTemplates.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' CTE_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' CTE_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' CTE_STATUS = ' + QuotedStr('I') + ' AND ';
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
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
      cdsCardTemplates.Close;
      cdsCardTemplates.CommandText := 'SELECT '+ ccardTemplates +' From CARDTEMPLATES CT ' +
                                      'INNER JOIN USERTYPES UT ON (UT.UT_ID = CT.UT_ID) ' +
                                      strWhere + strOrder; // ' ORDER BY CT.CTE_DESC';
      cdsCardTemplates.Open;

      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CTE_ID', 'FROM CARDTEMPLATES', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsCardTemplates.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
    end;

  lbFiltrado.Visible:=strWhere <> '';
  actLog.Enabled := DmSys.cdsCardTemplates.RecordCount > 0;

end;

procedure TFrmCardTemplates.SetApp;
Begin
   DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([DmSys.cdsCardTemplatesXApp.FieldByName('APP_ID').AsInteger,
                                                                 DmSys.cdsCardTemplatesXApp.FieldByName('ISS_ID').AsInteger]), [] );

   dbLkApplications.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger;
End;



procedure TFrmCardTemplates.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatus(False);
end;

procedure TFrmCardTemplates.actNewAppExecute(Sender: TObject);
begin
  inherited;
  DmSys.cdsCardTemplatesXApp.Insert;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
  ClearTabSheet(TabSheet1);
  dbgAplicacoes.Visible   := False;
  TrataCampos;
end;

procedure TFrmCardTemplates.actEditAppExecute(Sender: TObject);
begin
  inherited;
  dbgAplicacoes.Visible := False;
  SetApp;
  DmSys.cdsCardTemplatesXApp.Edit;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
  TrataCampos;
end;

procedure TFrmCardTemplates.actDeleteAppExecute(Sender: TObject);
begin
  inherited;
  DmSys.cdsCardTemplatesXApp.Delete;
end;

procedure TFrmCardTemplates.actOkAppExecute(Sender: TObject);
begin
  inherited;
  if dbLkApplications.Text = '' then
    begin
      DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
      dbLkApplications.SetFocus;
      exit;
    end;

  With DmSys, DmSys1 do
   Begin
     SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
     SetCategories([Applications], True, Self, t_form_objects);

     if (dbePeriodUseLimit.Text <> '') and (rdbPerioduseTypes.Text = '') then
     begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
       rdbPerioduseTypes.SetFocus;
       Exit;
     end;

     If rdbDateStatus.KeyValue <> Null Then
     Case rdbDateStatus.KeyValue of
       0 : Begin
             If rdbValidationPeriods.KeyValue = NULL Then
                Begin
                   DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
                   rdbValidationPeriods.SetFocus;
                   Exit;
                End;
           End;

       1,2 : Begin
             If rdbValidityTypes.KeyValue = NULL Then
                Begin
                   DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
                   rdbValidityTypes.SetFocus;
                   Exit;
                End
             Else
             If dbQtde.Text = '' Then
                Begin
                   DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
                   dbQtde.SetFocus;
                   Exit;
                End
           End;
       End;

     cdsCardTemplatesXApp.FieldByName('APP_ID').AsString := cdsApplicationsLook.fieldByName('APP_ID').AsString;
     cdsCardTemplatesXApp.FieldByName('ISS_ID').AsString := cdsApplicationsLook.fieldByName('ISS_ID').AsString;
     cdsCardTemplatesXApp.FieldByName('APP_DESCSHORT').AsString := cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
     cdsCardTemplatesXApp.FieldByName('ISS_DESCLONG').AsString  := cdsApplicationsLook.fieldByName('ISS_DESCLONG').AsString;


     If rdbLinha.KeyValue <> NULL Then
        cdsCardTemplatesXApp.FieldByName('LM_DESC').AsString    := cdsLineMt.fieldByName('LM_DESC').AsString
     Else
        cdsCardTemplatesXApp.FieldByName('LM_DESC').AsString    := '';

     If rdbTimeGroups.KeyValue <> NULL Then
        cdsCardTemplatesXApp.FieldByName('TG_DESC').AsString    := cdsTimeGroups.fieldByName('TG_DESC').AsString
     Else
        cdsCardTemplatesXApp.FieldByName('TG_DESC').AsString    := '';


     If rdbLineGroups.KeyValue <> NULL Then
        cdsCardTemplatesXApp.FieldByName('LG_DESC').AsString    := cdsLineGroups.fieldByName('LG_DESC').AsString
     Else
        cdsCardTemplatesXApp.FieldByName('LG_DESC').AsString    := '';

     If rdbPerioduseTypes.KeyValue  <> NULL Then
        cdsCardTemplatesXApp.FieldByName('PUT_DESC').AsString   := cdsPeriodUseTypesLk.fieldByName('PUT_DESC').AsString
     Else
        cdsCardTemplatesXApp.FieldByName('PUT_DESC').AsString   := '';

     If rdbValidationPeriods.KeyValue  <> NULL Then
        cdsCardTemplatesXApp.FieldByName('VP_DESC').AsString    := cdsValidationPeriods.fieldByName('VP_DESC').AsString
     Else
        cdsCardTemplatesXApp.FieldByName('VP_DESC').AsString    := '';

     If rdbValidityTypes.KeyValue  <> NULL Then
        cdsCardTemplatesXApp.FieldByName('VT_DESC').AsString    := cdsValidityTypes.fieldByName('VT_DESC').AsString
     Else
        cdsCardTemplatesXApp.FieldByName('VT_DESC').AsString    := '';

     If rdbDateStatus.KeyValue  <> NULL Then
        cdsCardTemplatesXApp.FieldByName('DS_DESC').AsString    := cdsDateStatus.fieldByName('DS_DESC').AsString
     Else
        cdsCardTemplatesXApp.FieldByName('DS_DESC').AsString    := '';

     Case rdbDateStatus.KeyValue of
       0   : begin
               DmSys.cdsCardTemplatesxApp.FieldByName('CTA_VALDATEQTY').AsString := '';
               DmSys.cdsCardTemplatesxApp.FieldByName('VT_ID').AsString          := '';
             end;
       1,2 : begin
               DmSys.cdsCardTemplatesxApp.FieldByName('VP_ID').AsString          := '';
             end;
     end;

     cdsCardTemplatesXApp.Post;
     dbgAplicacoes.Visible   := True;
  End;
end;

procedure TFrmCardTemplates.actCancelAppExecute(Sender: TObject);
begin
  inherited;
  dmSYs.cdsCardTemplatesXApp.Cancel;
  SetActions([actApplyUpdates, actCancel, actNewApp, actEditApp], True, Self, t_form_objects);
  SetActions([actDeleteApp], NOT (dmSys.cdsCardTemplatesXApp.RecordCount = 0), Self, t_form_objects);
  dbgAplicacoes.Visible := True;
end;

procedure TFrmCardTemplates.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsCardTemplates;
end;

procedure TFrmCardTemplates.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '6';
  FrmSystemLog.pSLG_ID := DmSys.cdsCardTemplates.FieldByName('CTE_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TFrmCardTemplates.ClearTabSheet(Tab: TTabSheet);
var
  i : integer;
begin
  for i := 0 to (Tab.ControlCount - 1) do
  begin
    if (Tab.Controls[i] is TRxDBLookupCombo) then
      (Tab.Controls[i] as TRxDBLookupCombo).ClearValue
    else if (Tab.Controls[i] is TDBEdit) then
      (Tab.Controls[i] as TDBEdit).Clear;
  end;
end;

procedure TFrmCardTemplates.rdbDateStatusChange(Sender: TObject);
begin
  inherited;
  TrataCampos;
end;

procedure TFrmCardTemplates.TrataCampos;
begin
  if rdbDateStatus.KeyValue = null then
  begin
    dbQtde.Enabled := True;
    rdbValidityTypes.Enabled := True;
    rdbValidationPeriods.Enabled := True;
  end
  else
  begin
    Case rdbDateStatus.KeyValue of
      0   : begin
              dbQtde.Enabled := False;
              rdbValidityTypes.Enabled := False;
              rdbValidationPeriods.Enabled := True;
            end;
      1,2 : begin
              dbQtde.Enabled := True;
              rdbValidityTypes.Enabled := True;
              rdbValidationPeriods.Enabled := False;
            end;
    end;
  end;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardTemplates.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmCardTemplates.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmCardTemplates.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmCardTemplates.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardTemplates.lbFiltradoClick(Sender: TObject);
Var i,j: Integer;
begin
j:=0;
FOR i := 0 to gbFiltro.ControlCount - 1
DO BEGIN {$include Limpa_Filtro.pas} END;
IF j <> gbFiltro.ControlCount
THEN BEGIN
     ShowMessage('ERRO DO SISTEMA:'#13#10'Falta componente(s) na Limpa Filtro');
     END
ELSE tbtnFiltrar.Click;
grdResultado.SetFocus;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardTemplates.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
