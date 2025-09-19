unit uValidatorFunctions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb, Buttons,
  RXCtrls;

type
  TFrmValidatorFunctions = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbCodigo: TDBEdit;
    Label2: TLabel;
    dbDesc: TDBEdit;
    lbCodigo: TLabel;
    edtDescricao: TEdit;
    lkFilterStatus: TComboBox;
    dbStatus: TRxDBComboBox;
    Label6: TLabel;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    Label3: TLabel;
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  FrmValidatorFunctions: TFrmValidatorFunctions;

implementation

uses uDmSys, AppSparkSysMain, uFuncoes, uGeralFunctions, uConst,
  uFrmBaseCadastro, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorFunctions.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorFunctions.FormShow(Sender: TObject);
begin
  inherited;
  ct:='SELECT * FROM VALIDATORFUNCTIONS %where% %order% ';
  defOrder:=' ORDER BY VF_ID ';
  strOrder:=defOrder;
  
  OpenTablesSys(dmSys.cdsValFunc);
  lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsValFunc.RecordCount)+' registro(s)';
  FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
  grdResultado.Columns[0].Title.Caption:='Código';
  grdResultado.Columns[1].Title.Caption:='Descrição';
  grdResultado.Columns[2].Title.Caption:='Status';
end;

procedure TFrmValidatorFunctions.actInsertExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.Enabled := True;
  ActionInsertSys(DmSys.cdsValFunc);
  SetActions([], False, FrmValidatorFunctions,t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmValidatorFunctions,t_form_objects);
  dbCodigo.SetFocus;
end;

procedure TFrmValidatorFunctions.actEditExecute(Sender: TObject);
begin
  inherited;
  dbCodigo.Enabled := False;
  SetActions([], False, FrmValidatorFunctions,t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmValidatorFunctions,t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmValidatorFunctions.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;
  if Trim(dbCodigo.Text) = '' then
  begin
    MessageDlg('Campo obrigatório',mtWarning,[mbOk],0);
    dbCodigo.SetFocus;
    exit;
  end;
  if Trim(dbDesc.Text) = '' then
  begin
    MessageDlg('Campo obrigatório',mtWarning,[mbOk],0);
    dbDesc.SetFocus;
    exit;
  end;

  if (Trim(dbCodigo.Text) <> '') and (dmSys.cdsValFunc.State = dsInsert) then
  begin
    dmSys.cdsGeral.Close;
    dmSys.cdsGeral.CommandText := 'SELECT * FROM VALIDATORFUNCTIONS WHERE VF_ID = '+QuotedStr(dbCodigo.Text);
    dmSys.cdsGeral.Open;
    if not dmSys.cdsGeral.Eof then
    begin
      MessageDlg('Já existe uma função cadastrada com esse código!', mtWarning, [mbOk], 0);
      dmSys.cdsGeral.Close;
      exit;
    end;
    dmSys.cdsGeral.Close;
  end;

  if dmSys.cdsValFunc.FieldByName('VF_STATUS').AsString = '' then
    dmSys.cdsValFunc.FieldByName('VF_STATUS').AsString := 'A';
  ApplyTablesSys([dbCodigo, dbDesc, dbStatus], DmSys.cdsValFunc);
  SetActions([], True, FrmValidatorFunctions,t_form_objects);
  SetActions([actApplyUpdates, actCancel], False, FrmValidatorFunctions,t_form_objects);
  actRefresh.Execute;
end;

procedure TFrmValidatorFunctions.actCancelExecute(Sender: TObject);
begin
//  inherited;
  if MessageDlg('Deseja cancelar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
     dmSys.cdsValFunc.Cancel;
     SetActions([], True, FrmValidatorFunctions,t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmValidatorFunctions,t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmValidatorFunctions.actDeleteExecute(Sender: TObject);
begin
 if MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

     with DmSys do
        Begin
         cdsValFunc.Edit;
         cdsValFunc.FieldByName('VF_STATUS').AsString := 'I';
         cdsValFunc.Post;
         cdsValFunc.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

end;

procedure TFrmValidatorFunctions.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    // strUt_Id : String;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edtDescricao.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' VF_DESC LIKE ' + QuotedStr(edtDescricao.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' VF_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' VF_STATUS = ' + QuotedStr('I') + ' AND ';
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
  strWhere:='';
  BuiltStrWhere;
  with DmSys do
    begin
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
      cdsValFunc.Close;
      cdsValFunc.CommandText := 'SELECT * FROM VALIDATORFUNCTIONS ' + strWhere + strOrder; //'ORDER BY VF_ID';
      cdsValFunc.Open;
//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( ConnBrkMaster.AppServer.Spark_Base.GetDBCount('VF_ID', 'FROM VALIDATORFUNCTIONS', 'True', strWhere) ) + ' Registros';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsValFunc.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
end;

procedure TFrmValidatorFunctions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited;
  CloseTablesSys(dmSys.cdsValFunc);
  Action := caFree;
  FrmValidatorFunctions := nil;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorFunctions.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmValidatorFunctions.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmValidatorFunctions.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmValidatorFunctions.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmValidatorFunctions.lbFiltradoClick(Sender: TObject);
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
procedure TFrmValidatorFunctions.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
