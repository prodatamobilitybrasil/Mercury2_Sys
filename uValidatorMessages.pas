unit uValidatorMessages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb, Buttons,
  RXCtrls;

type
  TFrmValidadorMessages = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edCodigo: TEdit;
    Label4: TLabel;
    edDescricao: TEdit;
    Label1: TLabel;
    dbDesc: TDBEdit;
    GroupBox3: TGroupBox;
    dbchkPiscaVermelho: TDBCheckBox;
    dbchkPiscaVerde: TDBCheckBox;
    dbchkVermelho: TDBCheckBox;
    dbchkVerde: TDBCheckBox;
    dbchkBipLongo: TDBCheckBox;
    dbchkBipCurto: TDBCheckBox;
    dbchkSetLeds: TDBCheckBox;
    dbchkOrLeds: TDBCheckBox;
    dbComment: TDBEdit;
    lblComment: TLabel;
    dbStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
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
    procedure actFilterExecute(Sender: TObject);
    procedure dbchkSetLedsClick(Sender: TObject);
    procedure dbchkOrLedsClick(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    Procedure SetChk(Status : Boolean);
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
  public
    { Public declarations }
  end;

var
  FrmValidadorMessages: TFrmValidadorMessages;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uPersonnelTypes,
  uDmConexao, uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidadorMessages.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}

procedure TFrmValidadorMessages.FormShow(Sender: TObject);
begin
  inherited;
    ct:='SELECT '+ ccardValidatorMessages +' FROM VALIDATORMESSAGES %where% %order% ';
    defOrder:=' ORDER BY MSG_ID ';
    strOrder:=defOrder;
    
    DmSys.cdsValidatorMessages.CommandText := 'SELECT '+ ccardValidatorMessages +' From VALIDATORMESSAGES ORDER BY MSG_ID';
    OpenTablesSys([DmSys.cdsValidatorMessages]);

//  i:=dmConexao.ConnBrkMaster.AppServer.GetDBCount('MSG_ID', 'FROM VALIDATORMESSAGES', 'True', '');
    lblContador.Caption:=FormatFloat('#,##0',DMSys.cdsValidatorMessages.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    actLog.Enabled := DmSys.cdsValidatorMessages.RecordCount > 0
end;

procedure TFrmValidadorMessages.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsValidatorMessages);
  SetActions([], False, FrmValidadorMessages, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmValidadorMessages, t_form_objects);
  SetChk(False);
end;

Procedure TFrmValidadorMessages.SetChk(Status : Boolean);
Begin
dbchkPiscaVermelho.Checked := Status;
dbchkPiscaVerde.Checked    := Status;
dbchkVermelho.Checked      := Status;
dbchkVerde.Checked         := Status;
dbchkBipCurto.Checked      := Status;
dbchkBipLongo.Checked      := Status;
dbchkSetLeds.Checked       := Status;
dbchkOrLeds.Checked        := Status;
End;

procedure TFrmValidadorMessages.actEditExecute(Sender: TObject);
begin
  inherited;
  dbDesc.SetFocus;
  SetActions([], False, FrmValidadorMessages, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmValidadorMessages, t_form_objects);
end;

procedure TFrmValidadorMessages.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys.cdsValidatorMessages]) Then
         begin
            SetActions([], True, FrmValidadorMessages, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmValidadorMessages, t_form_objects);
            actRefresh.Execute;
         end;
    END;
  actLog.Enabled := DmSys.cdsValidatorMessages.RecordCount > 0
end;

procedure TFrmValidadorMessages.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsValidatorMessages.Cancel;
     SetActions([], True, FrmValidadorMessages, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmValidadorMessages, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsValidatorMessages.RecordCount > 0;
  
end;

procedure TFrmValidadorMessages.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     with DmSys do
        Begin
         cdsValidatorMessages.Delete;
         cdsValidatorMessages.ApplyUpdates(-1);
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsValidatorMessages.RecordCount > 0;

end;

procedure TFrmValidadorMessages.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsValidatorMessages]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsValidatorMessages.CommandText := 'SELECT '+ ccardValidatorMessages +' From VALIDATORMESSAGES where MSG_STATUS = ''A'' ORDER BY MSG_ID';    
    FrmValidadorMessages := nil;
end;

procedure TFrmValidadorMessages.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmValidadorMessages, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmValidadorMessages, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmValidadorMessages.actFilterExecute(Sender: TObject);

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edCodigo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' MSG_ID = ' + QuotedStr(edCodigo.Text) + ' AND ';
       end;

     If Trim(edDescricao.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' MSG_DESC LIKE ' + QuotedStr(edDescricao.Text + '%') + ' AND ';
       end;

     if lkFilterStatus.ItemIndex = 0 then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' MSG_STATUS = ' + QuotedStr('A') + ' AND ';
       end
     else if lkFilterStatus.ItemIndex = 1 then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' MSG_STATUS = ' + QuotedStr('I') + ' AND ';
       end;

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
      cdsValidatorMessages.Close;
      cdsValidatorMessages.CommandText := 'SELECT '+ ccardValidatorMessages +' From VALIDATORMESSAGES ' + strWhere + strOrder; //'ORDER BY MSG_ID';
      cdsValidatorMessages.Open;
    // i:=dmConexao.ConnBrkMaster.AppServer.GetDBCount('MSG_ID', 'FROM VALIDATORMESSAGES', 'True', '');

    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsValidatorMessages.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
    end;
  actLog.Enabled := DmSys.cdsValidatorMessages.RecordCount > 0;
  lbFiltrado.Visible:=strWhere <> '';

end;

procedure TFrmValidadorMessages.dbchkSetLedsClick(Sender: TObject);
begin
  inherited;
   if (dbchkSetLeds.Checked) Then
      dbchkOrLeds.Checked := False;

end;

procedure TFrmValidadorMessages.dbchkOrLedsClick(Sender: TObject);
begin
  inherited;
   if (dbchkOrLeds.Checked) Then
      dbchkSetLeds.Checked := False;
end;

procedure TFrmValidadorMessages.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '15';
  FrmSystemLog.pSLG_ID := DmSys.cdsValidatorMessages.FieldByName('MSG_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TFrmValidadorMessages.edCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #8 then
    exit;
  if Pos(Key, '0123456789') = 0 then
  begin
    Key := #0;
    exit;
  end;

end;

procedure TFrmValidadorMessages.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsValidatorMessages;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidadorMessages.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidadorMessages.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmValidadorMessages.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmValidadorMessages.FormKeyPress(Sender: TObject;
  var Key: Char); begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmValidadorMessages.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidadorMessages.lbFiltradoClick(Sender: TObject);
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
end.
