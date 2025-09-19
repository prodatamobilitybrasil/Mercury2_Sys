unit uFrmZoneLocations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, StdCtrls, Menus, DB, ActnList, ImgList, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, Buttons,
  RXCtrls;

type
  TFrmZoneLocations = class(TFrmBaseSys)
    lb_descricao: TLabel;
    ed_descricao: TEdit;
    lkFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    Label1: TLabel;
    ed_descricao_curta: TDBEdit;
    Label5: TLabel;
    cb_status: TRxDBComboBox;
    ed_descricao_longa: TDBEdit;
    Label2: TLabel;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    btnLimpaStatus: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbFiltradoClick(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure BeforePost;
  public
    { Public declarations }
  end;

var
  FrmZoneLocations: TFrmZoneLocations;

implementation

uses uDmSys, AppSparkSysMain, uDmConexao, uConst, uGeralFunctions,
     Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmZoneLocations.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}

procedure TFrmZoneLocations.FormShow(Sender: TObject);
begin
  ct:='SELECT '+ cCardZoneLocations +' FROM ZONELOCATIONS ZNL %where% %order%';
  defOrder:=' ORDER BY ZNL_DESC ';
  strOrder:=defOrder;

  frmZoneLocations := Self;
  OpenTablesSys([dmSys.cdsZoneLocations]);
  dtsMaster.DataSet := dmSys.cdsZoneLocations;
  inherited;
  FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ZNL_ID', 'FROM ZONELOCATIONS', 'True','') ) + ' Registro(s)';
  lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsZoneLocations.RecordCount)+' registro(s)';
//FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
end;

procedure TFrmZoneLocations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DmSys do
  begin
    CloseTablesSys([DmSys.cdsZoneLocations]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    cdsZoneLocations.CommandText := 'SELECT '+ cCardZoneLocations +' From ZONELOCATIONS ZNL ORDER BY ZNL_DESC';
  end;
  Action := caFree;
end;

procedure TFrmZoneLocations.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  if status = stConsult Then
  begin
    BeforePost;
    if ApplyTablesSys([ed_descricao_curta, ed_descricao_longa, cb_status], [dmSys.cdsZoneLocations]) then
    begin
      SetActions([], True, frmZoneLocations, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, frmZoneLocations, t_form_objects);
      actRefresh.Execute;
    end;
  end;
end;

procedure TFrmZoneLocations.actFilterExecute(Sender: TObject);
//var strWhere: string;

  procedure BuiltStrWhere;
  var
    qtd_campos, i : integer;

  begin
    qtd_campos := 0;
    strWhere  := '';

    if Trim(ed_descricao.Text) <> '' then
    begin
      Inc(qtd_campos);
      strWhere := strWhere + ' ZNL_DESC LIKE ' + QuotedStr(ed_descricao.Text + '%') + ' AND ';
    end;

    case lkFilterStatus.ItemIndex Of
      0:
      begin
        Inc(qtd_campos);
        strWhere := strWhere + ' ZNL_STATUS = ' + QuotedStr('A') + ' AND ';
      end;
      1:
      begin
        Inc(qtd_campos);
        strWhere := strWhere + ' ZNL_STATUS = ' + QuotedStr('I') + ' AND ';
      end;
    end; //Case...

    // Verifica se é necessário tirar o AND

    if qtd_campos > 0 then
    begin
      i := Length(strWhere) - 4;
      strWhere := ' WHERE ' + Copy(strWhere,1,i);
    end;
  end;

begin
  inherited;
  strWhere  := '';
  BuiltStrWhere;

  with DmSys do
  begin
    FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    cdsZoneLocations.Close;
    cdsZoneLocations.CommandText := 'SELECT '+ cCardZoneLocations +' From ZONELOCATIONS ZNL ' + strWhere + strOrder; // ' ORDER BY ZNL_DESC';
    cdsZoneLocations.Open;

    //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ZNL_ID', 'FROM ZONELOCATIONS', 'True', strWhere) ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsZoneLocations.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
    lbFiltrado.Visible:=strWhere <> '';
  end;

end;

procedure TFrmZoneLocations.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsZoneLocations);
  SetActions([], False, frmZoneLocations, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmZoneLocations, t_form_objects);
   pcBaseCadastro.ActivePage:= tsBaseCadastroConsulta;
  ed_descricao_curta.SetFocus;
end;

procedure TFrmZoneLocations.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  begin
    DmSys.cdsZoneLocations.Cancel;
    SetActions([], True, frmZoneLocations, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, frmZoneLocations, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end;
end;

procedure TFrmZoneLocations.BeforePost;
begin
  if (dtsMaster.DataSet.State = dsInsert) then
    DmSys.cdsZoneLocations.FieldByName('ZNL_ID').Value := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('ZONELOCATIONS', 'ZNL_ID', 'False', '' );
end;

procedure TFrmZoneLocations.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmZoneLocations, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmZoneLocations, t_form_objects);
  pcBaseCadastro.ActivePage:= tsBaseCadastroConsulta;
  ed_descricao_curta.SetFocus;
end;

procedure TFrmZoneLocations.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
  begin
    with DmSys do
    Begin
      cdsZoneLocations.Edit;
      cdsZoneLocations.FieldByName('ZNL_STATUS').AsString := 'I';
      cdsZoneLocations.Post;
      cdsZoneLocations.ApplyUpdates(-1);
      tbtnRefresh.Click;
    End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end; //With...
  actLog.Enabled := DmSys.cdsZoneLocations.RecordCount > 0;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmZoneLocations.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmZoneLocations.Sai(Sender: TObject); begin Fm_Sai(Sender); end;
procedure TFrmZoneLocations.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmZoneLocations.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmZoneLocations.lbFiltradoClick(Sender: TObject);
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
procedure TFrmZoneLocations.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
