unit uFrmZones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, StdCtrls, Menus, DB, ActnList, ImgList, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, RxLookup,
  Buttons, RXCtrls;

type
  TfrmZones = class(TFrmBaseSys)
    lb_origem: TLabel;
    ed_origem: TEdit;
    lkFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    ed_destino: TEdit;
    lb_destino: TLabel;
    cb_origem: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    cb_destino: TRxDBLookupCombo;
    Panel1: TPanel;
    lblContador: TRxLabel;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
    procedure BeforePost;
    {
    }
  public
    { Public declarations }
  end;

var
  frmZones: TfrmZones;

implementation

uses uDmSys, AppSparkSysMain, uDmConexao, uConst, uGeralFunctions,
     Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmZones.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmZones.FormShow(Sender: TObject);
begin
  frmZones := Self;
{
  cCardZones = ' ZN.*, '+
               ' ZNL_ORIG.ZNL_DESCSHORT AS ZNL_DESCSHORT_ORIG, '+
               ' ZNL_DEST.ZNL_DESCSHORT AS ZNL_DESCSHORT_DEST, '+
               ' ZN.ZN_STATUS AS STATUS_ID '+
               ' FROM ZONES ZN '+
               ' JOIN ZONELOCATIONS ZNL_ORIG ON ZN.ZN_ZNLID_ORIG = ZNL_ORIG.ZNL_ID '+
               ' JOIN ZONELOCATIONS ZNL_DEST ON ZN.ZN_ZNLID_DEST = ZNL_DEST.ZNL_ID ';
}
  ct:='SELECT ' + cCardZones + ' %where% %order% '; 
  defOrder:=' ORDER BY ZN.ZN_ZNLID_ORIG, ZN.ZN_ZNLID_DEST ';
  strOrder:=defOrder;

  OpenTablesSys([dmSys.cdsZones, dmSys.cdsZoneLocations]);
  dtsMaster.DataSet := dmSys.cdsZones;
  inherited;
//FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ZN_ID', 'FROM ZONES', 'True','') ) + ' Registro(s)';
  lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsZones.RecordCount)+' registro(s)';
  FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
end;

procedure TfrmZones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DmSys do
  begin
    CloseTablesSys([DmSys.cdsZones, DmSys.cdsZoneLocations]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    cdsZones.CommandText := 'SELECT '+ cCardZones + 'ORDER BY ZN.ZN_ZNLID_ORIG, ZN.ZN_ZNLID_DEST';
  end;
  Action := caFree;
end;

procedure TfrmZones.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  if status = stConsult Then
  begin
    BeforePost;
    if ApplyTablesSys([cb_origem, cb_destino], [dmSys.cdsZones]) then
    begin
      SetActions([], True, frmZones, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, frmZones, t_form_objects);
      actRefresh.Execute;
    end;
  end;
end;

procedure TfrmZones.actFilterExecute(Sender: TObject);
//var strWhere: string;

  procedure BuiltStrWhere;
  var
    qtd_campos, i : integer;

  begin
    qtd_campos := 0;
    strWhere  := '';

    if Trim(ed_origem.Text) <> '' then
    begin
      Inc(qtd_campos);
      strWhere := strWhere + ' ZNL_ORIG.ZNL_DESCSHORT LIKE ' + QuotedStr(ed_origem.Text + '%') + ' AND ';
    end;

    if Trim(ed_destino.Text) <> '' then
    begin
      Inc(qtd_campos);
      strWhere := strWhere + ' ZNL_DEST.ZNL_DESCSHORT LIKE ' + QuotedStr(ed_destino.Text + '%') + ' AND ';
    end;

    case lkFilterStatus.ItemIndex Of
      0:
      begin
        Inc(qtd_campos);
        strWhere := strWhere + ' ZN_STATUS = ' + QuotedStr('A') + ' AND ';
      end;
      1:
      begin
        Inc(qtd_campos);
        strWhere := strWhere + ' ZN_STATUS = ' + QuotedStr('I') + ' AND ';
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
    cdsZones.Close;
    cdsZones.CommandText := 'SELECT '+ cCardZones + strWhere + strOrder;
    cdsZones.Open;
//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ZN_ID', 'FROM ZONES ZN JOIN ZONELOCATIONS ZNL_ORIG ON ZN.ZN_ZNLID_ORIG = ZNL_ORIG.ZNL_ID JOIN ZONELOCATIONS ZNL_DEST ON ZN.ZN_ZNLID_DEST = ZNL_DEST.ZNL_ID ', 'True', strWhere) ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsZones.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
    lbFiltrado.Visible:=strWhere <> '';
  end;

end;

procedure TfrmZones.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsZones);
  SetActions([], False, frmZones, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmZones, t_form_objects);
  cb_origem.SetFocus;
end;

procedure TfrmZones.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  begin
    DmSys.cdsZones.Cancel;
    SetActions([], True, frmZones, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, frmZones, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end;
end;

procedure TfrmZones.BeforePost;
begin
  if (dtsMaster.DataSet.State = dsInsert) then
    DmSys.cdsZones.FieldByName('ZN_ID').Value := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('ZONES', 'ZN_ID', 'False', '' );
end;

procedure TfrmZones.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmZones, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmZones, t_form_objects);
  cb_origem.SetFocus;
end;

procedure TfrmZones.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
  begin
    with DmSys do
    Begin
      cdsZones.Edit;
      cdsZones.FieldByName('ZN_STATUS').AsString := 'I';
      cdsZones.Post;
      cdsZones.ApplyUpdates(-1);
      tbtnRefresh.Click;
    End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end; //With...
  actLog.Enabled := DmSys.cdsZones.RecordCount > 0;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmZones.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TfrmZones.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TfrmZones.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TfrmZones.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmZones.lbFiltradoClick(Sender: TObject);
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
procedure TfrmZones.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
