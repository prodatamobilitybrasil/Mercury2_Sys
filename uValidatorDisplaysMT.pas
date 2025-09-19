unit uValidatorDisplaysMT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, Buttons,
  RXCtrls;

type
  TFrmValidatorDisplaysMT = class(TFrmBaseSys)
    gbDisplay: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label3: TLabel;
    dbControle: TDBEdit;
    Label4: TLabel;
    dbOpcao: TDBEdit;
    pgcDetail: TPageControl;
    TabSheet1: TTabSheet;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeleteCardApp: TToolButton;
    dbgDetalhes: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    btDisplayOK: TSpeedButton;
    btDisplayCancel: TSpeedButton;
    edDesc: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    lkFilterStatus: TComboBox;
    dbCodigo: TDBEdit;
    Label5: TLabel;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actDeleteDetail: TAction;
    actOkDetail: TAction;
    actCancelDetail: TAction;
    dbStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    chkPiscaVermelho: TCheckBox;
    chkVermelho: TCheckBox;
    chkPiscaAmarelo: TCheckBox;
    chkAmarelo: TCheckBox;
    chkPiscaVerde: TCheckBox;
    chkVerde: TCheckBox;
    chkBeepLongo: TCheckBox;
    chkBeepCurto: TCheckBox;
    chkSetLeds: TCheckBox;
    chkOrLeds: TCheckBox;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure dbgDetalhesKeyPress(Sender: TObject; var Key: Char);
    procedure dbCodigoExit(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure actDeleteDetailExecute(Sender: TObject);
    procedure actOkDetailExecute(Sender: TObject);
    procedure actCancelDetailExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbControleChange(Sender: TObject);
    procedure dbOpcaoChange(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
     ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
     vdm_code : integer;
     Procedure SetDetail;
     Function VerificaID(ID : String) : Boolean;
     procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
  public
    Procedure ActionBeforeApply; override;
    { Public declarations }
  end;

var
  FrmValidatorDisplaysMT: TFrmValidatorDisplaysMT;

implementation

uses uDmSys, uConst, uGeralFunctions, uFrmLineGroups, AppSparkSysMain,
  uDmConexao, uFrmSystemLog, dbClient, Aguarde;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorDisplaysMT.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorDisplaysMT.FormShow(Sender: TObject);
begin
  inherited;
  grdResultado.Columns[0].Width:=70;
  ct:='SELECT '+ ccardValidatorDisplaysMTSelect +' FROM VALIDATORDISPLAYSMT %where% %order% ';
  defOrder:=' ORDER BY VDM_CODE ';
  strOrder:=defOrder;
  DmSys.cdsValidatorDisplaysMT.CommandText := 'SELECT '+ ccardValidatorDisplaysMTSelect +' FROM VALIDATORDISPLAYSMT ORDER BY VDM_CODE';
  OpenTablesSys([DmSys.cdsValidatorDisplaysMT, DmSys.cdsValidatorDisplaysDT]);

  //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('VDM_CODE', 'FROM VALIDATORDISPLAYSMT', 'True', ' WHERE VDM_STATUS = ''A'' ') ) + ' Registro(s)';
  lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsValidatorDisplaysMT.RecordCount)+' registro(s)';
  FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

  actLog.Enabled := DmSys.cdsValidatorDisplaysMT.RecordCount > 0
end;

procedure TFrmValidatorDisplaysMT.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsValidatorDisplaysMT);
  SetActions([], False, FrmValidatorDisplaysMT, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmValidatorDisplaysMT, t_form_objects);
  SetDetail;
  dbCodigo.SetFocus;
end;

procedure TFrmValidatorDisplaysMT.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmValidatorDisplaysMT, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmValidatorDisplaysMT, t_form_objects);
  SetDetail;
  dbDesc.SetFocus;
end;

Procedure TFrmValidatorDisplaysMT.ActionBeforeApply;
Begin
  IF status = stInsert Then
    Begin
         vdm_code    := Strtoint(dbCodigo.Text);

         dmsys.cdsValidatorDisplaysDT.First;
          While dmsys.cdsValidatorDisplaysDT.RecordCount > 0 Do
            Begin
              IF dmsys.cdsValidatorDisplaysDT.FieldByName('VDM_CODE').AsInteger = 0 Then
                Begin
                  dmsys.cdsValidatorDisplaysDT.Edit;
                  dmsys.cdsValidatorDisplaysDT.FieldByName('VDM_CODE').AsInteger    := vdm_code;
//                  dmsys.cdsValidatorDisplaysDT.FieldByName('VDM_VERSION').AsInteger := vdm_version;
    //              dmsys.cdsValidatorDisplaysDT.Post;
                End;
            dmsys.cdsValidatorDisplaysDT.Next;
          End;

    dmsys.cdsValidatorDisplaysMT.Edit;
    dmsys.cdsValidatorDisplaysMT.FieldByName('VDM_CODE').AsInteger :=  vdm_code;
  End;

status := stConsult;
//pcBaseCadastro.ActivePageIndex := 0;
FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
End;

procedure TFrmValidatorDisplaysMT.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;

  IF Trim(dbCodigo.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, '%T %T', [2825, 1500], []);
     dbCodigo.SetFocus;
    End
  Else
  If DisplayMsg(t_form_objects, '%T', [1511], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
//      ActionBeforeApply;
     Try
     dbControle.Text := '0';

     if chkPiscaVermelho.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 1);
     if chkPiscaAmarelo.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 2);
     if chkPiscaVerde.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 4);
     if chkBeepCurto.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 8);
     if chkVermelho.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 16);
     if chkAmarelo.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 32);
     if chkVerde.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 64);
     if chkBeepLongo.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 128);
     if chkSetLeds.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 256);
     if chkOrLeds.Checked then
       dbControle.Text := IntToStr(StrToInt(dbControle.Text)+ 512);

     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     DmSys.cdsValidatorDisplaysDT.ApplyUpdates(-1);
     DmSys.cdsValidatorDisplaysMT.ApplyUpdates(-1);

  //  ApplyTablesSys([dbDesc, dbVersion], DmSys.cdsValidatorDisplaysMT);
     SetActions([], True, FrmValidatorDisplaysMT, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmValidatorDisplaysMT, t_form_objects);
     actRefresh.Execute;

     status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

     dmSys.cdsValidatorDisplaysDT.Close;
     dmSys.cdsValidatorDisplaysDT.Open;

     dmConexao.ConnBrkMaster.AppServer.Commit;
     Except
     dmConexao.ConnBrkMaster.AppServer.RollBack;
     End;
//     dmSys.cdsValidatorDisplaysDT.Open;
     SetDetail;
    End;
  actLog.Enabled := DmSys.cdsValidatorDisplaysMT.RecordCount > 0
end;

procedure TFrmValidatorDisplaysMT.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Status := stConsult;
     DmSys.cdsValidatorDisplaysMT.Cancel;
     DmSys.cdsValidatorDisplaysDT.CancelUpdates;
     SetActions([], True, FrmValidatorDisplaysMT, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmValidatorDisplaysMT, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     actRefresh.Execute;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsValidatorDisplaysMT.RecordCount > 0
end;

procedure TFrmValidatorDisplaysMT.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     with DmSys do
        Begin
         cdsValidatorDisplaysMT.Edit;
         cdsValidatorDisplaysMT.FieldByName('VDM_STATUS').AsString := 'I';
         cdsValidatorDisplaysMT.Post;
         cdsValidatorDisplaysMT.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsValidatorDisplaysMT.RecordCount > 0
end;

procedure TFrmValidatorDisplaysMT.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsValidatorDisplaysMT;
end;

procedure TFrmValidatorDisplaysMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  DmSys.cdsValidatorDisplaysMT.CLOSE;
  CloseTablesSys([DmSys.cdsValidatorDisplaysDT]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  DmSys.cdsValidatorDisplaysMT.CommandText := 'SELECT '+ ccardValidatorDisplaysMTSelect +' From VALIDATORDISPLAYSMT where VDM_STATUS = ''A'' ORDER BY VDM_CODE';
  FrmValidatorDisplaysMT := Nil;
end;

procedure TFrmValidatorDisplaysMT.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      DmSys.cdsValidatorDisplaysMT.AfterScroll(DmSys.cdsValidatorDisplaysMT);
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh, actDeleteDetail], False, FrmValidatorDisplaysMT, t_form_objects);
      SetDetail;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmValidatorDisplaysMT, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

Procedure TFrmValidatorDisplaysMT.SetDetail;
Begin
   If Status = stInsert Then
      Begin
       dbCodigo.Enabled  := True;
       gbDisplay.Enabled := True;
       pgcDetail.Enabled := False;
      End
   Else
      Begin
       dbCodigo.Enabled  := False;
       pgcDetail.Enabled := False;
       gbDisplay.Enabled := False;

         IF Status = stEdit Then
            Begin
             pgcDetail.Enabled := True;
             gbDisplay.Enabled := True;
            End;

       SetActions([actDeleteDetail], (not (DmSys.cdsValidatorDisplaysDT.RecordCount = 0)) AND (status <> stConsult), Self, t_form_objects);
      End;



End;

procedure TFrmValidatorDisplaysMT.actFirstExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmValidatorDisplaysMT.actPriorExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmValidatorDisplaysMT.actNextExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmValidatorDisplaysMT.actLastExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmValidatorDisplaysMT.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' VDM_DESC LIKE ' + QuotedStr(eddesc.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' VDM_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' VDM_STATUS = ' + QuotedStr('I') + ' AND ';
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
//    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
//    lbFiltrado.Visible:=strWhere <> '';
      cdsValidatorDisplaysMT.Close;
      cdsValidatorDisplaysMT.CommandText := 'SELECT '+ ccardValidatorDisplaysMTSelect +' From VALIDATORDISPLAYSMT ' + strWhere + strOrder; //' ORDER BY VDM_CODE';
      cdsValidatorDisplaysMT.Open;

      //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('VDM_CODE', 'FROM VALIDATORDISPLAYSMT', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsValidatorDisplaysMT.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
    end;
  actLog.Enabled := DmSys.cdsValidatorDisplaysMT.RecordCount > 0;
  lbFiltrado.Visible:=strWhere <> '';
end;

procedure TFrmValidatorDisplaysMT.dbgDetalhesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 Then
     IF DmSys.cdsValidatorDisplaysDT.State in ([dsInsert, dsEdit]) Then
        DmSys.cdsValidatorDisplaysDT.Post;
end;

Function TFrmValidatorDisplaysMT.VerificaID(ID : String) : Boolean;
Begin
  Result := False;
  DmSys.cdsGeral.Close;
  DmSys.cdsGeral.CommandText := 'Select Count(*) as QTDE From ValidatorDisplaysMT where VDM_CODE = '+ID;
  DmSys.cdsGeral.Open;

  IF DmSys.cdsGeral.Fields.Fields[0].AsInteger > 0 Then
     Result := True;
     
  DmSys.cdsGeral.Close;
End;

procedure TFrmValidatorDisplaysMT.dbCodigoExit(Sender: TObject);
begin
  inherited;
   if (VerificaID(dbCodigo.text)) and
      (Status = stInsert) Then
      Begin
         DisplayMsg(t_form_objects, '%T', [1602], []);
         dbCodigo.SetFocus;
      End;
end;

procedure TFrmValidatorDisplaysMT.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
   SetDetail;
end;

procedure TFrmValidatorDisplaysMT.actNewDetailExecute(Sender: TObject);
begin
  inherited;
  dbgDetalhes.Visible := False;
  ActionInsertSys(DmSys.cdsValidatorDisplaysDT);
end;

procedure TFrmValidatorDisplaysMT.actEditDetailExecute(Sender: TObject);
begin
  inherited;
  cbCardApps.Enabled  := False;
  dbgDetalhes.Visible := False;
  DmSys.cdsValidatorDisplaysDT.Edit;
end;

procedure TFrmValidatorDisplaysMT.actDeleteDetailExecute(Sender: TObject);
begin
  DmSys.cdsValidatorDisplaysDT.Edit;
  DmSys.cdsValidatorDisplaysDT.FieldByName('VDD_STATUS').AsString := 'I';
  DmSys.cdsValidatorDisplaysDT.FieldByName('STATUS_ID').AsString  := 'I';
  DmSys.cdsValidatorDisplaysDT.Post;
end;

procedure TFrmValidatorDisplaysMT.actOkDetailExecute(Sender: TObject);
begin
  inherited;
  dmSys.cdsValidatorDisplaysDT.Post;
  dbgDetalhes.Visible := True;
  cbCardApps.Enabled  := True;
  SetDetail;
end;

procedure TFrmValidatorDisplaysMT.actCancelDetailExecute(Sender: TObject);
begin
  inherited;
  dmSys.cdsValidatorDisplaysDT.Cancel;
  dbgDetalhes.Visible := True;
  cbCardApps.Enabled  := True;
end;

procedure TFrmValidatorDisplaysMT.dbControleChange(Sender: TObject);
begin
  inherited;
dbControle.Text := ValidateValues(dbControle.text);
end;

procedure TFrmValidatorDisplaysMT.dbOpcaoChange(Sender: TObject);
begin
  inherited;
dbOpcao.Text := ValidateValues(dbOpcao.Text);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorDisplaysMT.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '16';
  FrmSystemLog.pSLG_ID := DmSys.cdsValidatorDisplaysMT.FieldByName('VDM_CODE').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorDisplaysMT.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmValidatorDisplaysMT.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmValidatorDisplaysMT.FormKeyPress(Sender: TObject;
  var Key: Char); begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmValidatorDisplaysMT.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorDisplaysMT.lbFiltradoClick(Sender: TObject);
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
procedure TFrmValidatorDisplaysMT.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
