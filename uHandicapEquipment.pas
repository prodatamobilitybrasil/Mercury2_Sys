unit uHandicapEquipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, DBClient,
  RXCtrls, Buttons;

type
  TfrmHandicapEquipment = class(TFrmBaseSys)
    Label3: TLabel;
    edtPesqDesc: TEdit;
    cbxProcura: TComboBox;
    Label4: TLabel;
    Label1: TLabel;
    dbeHCE_DESC: TDBEdit;
    Label2: TLabel;
    dbcHCE_STATUS: TRxDBComboBox;
    Panel1: TPanel;
    lblContador: TRxLabel;
    lbFiltrado: TLabel;
    btnLimpaStatus: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHandicapEquipment: TfrmHandicapEquipment;

implementation

uses uConst, uGeralFunctions, AppSparkSysMain, uDmSys1, uDmConexao,
  uFrmBaseCadastro, Aguarde, uDmSys;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmHandicapEquipment.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmHandicapEquipment.FormShow(Sender: TObject);
begin
  inherited;
  grdResultado.Columns[3].Title.Caption:='Registro';
  pcBaseCadastro.Pages[1].Caption:='&Manutenção';
  ct:='SELECT * FROM HANDICAPEQUIPMENT %where% %order% ';
  defOrder:=' ORDER BY HCE_ID ';
  strOrder:=defOrder;

  dtsMaster.DataSet := dmSys1.cdsHandicapEquipment;
  OpenTablesSys([(dtsMaster.DataSet as TClientDataSet)]);

  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('HCE_ID', 'FROM HANDICAPEQUIPMENT', 'False', '') ) + ' Registro(s)';
  lblContador.Caption:=FormatFloat('#,##0',dmSys1.cdsHandicapEquipment.RecordCount)+' registro(s)';
//FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmHandicapEquipment.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //inherited;
  CloseTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  frmHandicapEquipment := Nil;
  Action := caFree;
end;

procedure TfrmHandicapEquipment.FormCreate(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);
end;

procedure TfrmHandicapEquipment.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetCCAActions([], True, Self);
      SetCCAActions([actFilter, actDelete, actRefresh], False, Self);
      if not (dtsMaster.DataSet.State in [dsEdit, dsInsert]) then
        SetCCAActions([actApplyUpdates, actCancel], False, Self);
     End
  Else
    Begin
      SetCCAActions([], False, Self);
      SetCCAActions([actInsert, actFilter, actDelete, actRefresh, actExit], True, Self);
      if dtsMaster.DataSet.RecordCount > 0 then
        SetCCAActions([actEdit], True, Self);
    End;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TfrmHandicapEquipment.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys((dtsMaster.DataSet as TClientDataSet));
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeHCE_DESC.SetFocus;
end;

procedure TfrmHandicapEquipment.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeHCE_DESC.SetFocus;
end;

procedure TfrmHandicapEquipment.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;

  IF Trim(dbeHCE_DESC.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Descrição"   ', [], []);
     dbeHCE_DESC.SetFocus;
    End
  Else
  IF Trim(dbcHCE_STATUS.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Status"   ', [], []);
     dbcHCE_STATUS.SetFocus;
    End
  Else
  If DisplayMsg(t_form_objects, 'Confirma a gravação do registro?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Try
       dmConexao.ConnBrkMaster.AppServer.StartTransaction;

       (dtsMaster.DataSet as TClientDataSet).ApplyUpdates(-1);

       SetCCAActions([], True, Self);
       SetCCAActions([actApplyUpdates, actCancel], False, Self);
       actRefresh.Execute;

       status := stConsult;
       FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);

       dmConexao.ConnBrkMaster.AppServer.Commit;
     Except
       dmConexao.ConnBrkMaster.AppServer.RollBack;
     End;
     pcBaseCadastro.ActivePageIndex := 0;
   End;
   actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmHandicapEquipment.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, 'Confirma o cancelamento da edição do registro?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Status := stConsult;
     dtsMaster.DataSet.Cancel;
     (dtsMaster.DataSet as TClientDataSet).CancelUpdates;
     SetCCAActions([], True, Self);
     SetCCAActions([actApplyUpdates, actCancel], False, Self);
     pcBaseCadastro.ActivePageIndex := 0;
     actRefresh.Execute;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmHandicapEquipment.actDeleteExecute(Sender: TObject);
begin
// inherited;
  if dtsMaster.DataSet.FieldByName('HCE_STATUS').AsString = 'A' then
  begin
    If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dtsMaster.DataSet.Edit;
      dtsMaster.DataSet.FieldByName('HCE_STATUS').AsString := 'I';
      dtsMaster.DataSet.Post;
      (dtsMaster.DataSet as TClientDataSet).ApplyUpdates(-1);
      tbtnRefresh.Click;
      FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end; //With...
  end
  else
    DisplayMsg(t_form_objects, 'ATENÇÃO: Esse registro já está desativado!   ', [], [], mtConfirmation, [mbOk]);

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmHandicapEquipment.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edtPesqDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' HCE_DESC LIKE ' + QuotedStr(edtPesqDesc.Text + '%') + ' AND ';
       end;

     Case cbxProcura.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' HCE_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' HCE_STATUS = ' + QuotedStr('I') + ' AND ';
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

  FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
  dtsMaster.DataSet.Close;
  (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT * FROM HANDICAPEQUIPMENT ' + strWhere + strOrder;
  dtsMaster.DataSet.Open;

  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('HCE_ID', 'FROM HANDICAPEQUIPMENT', 'True', strWhere) ) + ' Registro(s)';
  lblContador.Caption:=FormatFloat('#,##0',dmSys1.cdsHandicapEquipment.RecordCount)+' registro(s)';
//FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
  FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
  lbFiltrado.Visible:=strWhere <> '';
  grdResultado.SetFocus;

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmHandicapEquipment.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TfrmHandicapEquipment.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TfrmHandicapEquipment.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TfrmHandicapEquipment.btnLimpaStatusClick(Sender: TObject);
begin cbxProcura.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmHandicapEquipment.lbFiltradoClick(Sender: TObject);
Var i,j: Integer;
begin
j:=0;
FOR i := 0 to gbFiltro.ControlCount - 1
DO BEGIN {$include Limpa_Filtro.pas} END;
IF j <> gbFiltro.ControlCount
THEN ShowMessage('ERRO DO SISTEMA:'#13#10'Falta componente(s) na Limpa Filtro')
ELSE tbtnFiltrar.Click;
grdResultado.SetFocus;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmHandicapEquipment.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
