unit uFrmPersonnelFunctions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, RxLookup,
  Buttons, RXCtrls;

type
  TFrmPersonnelFunctions = class(TFrmBaseSys)
    Label1: TLabel;
    rxbdLookupCargo: TRxDBLookupCombo;
    Label2: TLabel;
    edtDesc: TEdit;
    Label3: TLabel;
    cbStatus: TComboBox;
    LCargo: TLabel;
    LDesc: TLabel;
    Label4: TLabel;
    rxdbCargo: TRxDBLookupCombo;
    dbDesc: TDBEdit;
    rxdbStatus: TRxDBComboBox;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure SetCtr;
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  FrmPersonnelFunctions: TFrmPersonnelFunctions;

implementation

uses uDmSys1, AppSparkSysMain, uFrmBaseCadastro, uFrmBase, uGeralFunctions,
  uConst, uDmConexao, uDmSys, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmPersonnelFunctions.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmPersonnelFunctions.FormShow(Sender: TObject);
begin
  inherited;
    ct:='select PF.*, PF.PF_Status As Status_ID, PT.PRST_ID AS ID_PRST, PT.PRST_Desc FROM PERSONNELFUNCTIONS PF '+
        'join PERSONNELTYPES PT ON PF.PRST_ID = PT.PRST_ID %where% %order%';
    defOrder:=' ORDER BY PF_ID ';
    strOrder:=defOrder;

  OpenTablesSys([dmSys1.cdsPersonnalFunctions, dmSys.cdsPersonnelTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr(dmSys1.cdsPersonnalFunctions.RecordCount ) + ' Registro(s)';
end;

procedure TFrmPersonnelFunctions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsPersonnalFunctions, dmSys.cdsPersonnelTypes]);
  FrmPersonnelFunctions := nil;
end;

procedure TFrmPersonnelFunctions.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsPersonnalFunctions);
  SetActions([], False, FrmPersonnelFunctions, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmPersonnelFunctions, t_form_objects);
  SetCtr;
  rxdbCargo.SetFocus;
end;

procedure TFrmPersonnelFunctions.SetCtr;
begin
  rxdbCargo.Enabled := (Status = stInsert);
end;

procedure TFrmPersonnelFunctions.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmPersonnelFunctions, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmPersonnelFunctions, t_form_objects);
  rxdbCargo.SetFocus;
end;

procedure TFrmPersonnelFunctions.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys([rxdbCargo, dbDesc], [dmSys1.cdsPersonnalFunctions]) then
       Begin
         SetActions([], True, FrmPersonnelFunctions, t_form_objects);
         SetActions([actApplyUpdates, actCancel], False, FrmPersonnelFunctions, t_form_objects);
         tbtnRefresh.Click;
       end;
  end;
end;

procedure TFrmPersonnelFunctions.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsPersonnalFunctions.Cancel;
    SetActions([], True, FrmPersonnelFunctions, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmPersonnelFunctions, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;

end;

procedure TFrmPersonnelFunctions.actDeleteExecute(Sender: TObject);
begin
  //inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsPersonnalFunctions.Edit;
         cdsPersonnalFunctions.FieldByName('PF_STATUS').AsString := 'I';
         cdsPersonnalFunctions.FieldByName('STATUS_ID').AsString := 'I';
         cdsPersonnalFunctions.Post;
         cdsPersonnalFunctions.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

end;

procedure TFrmPersonnelFunctions.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsPersonnalFunctions;
end;

procedure TFrmPersonnelFunctions.actFilterExecute(Sender: TObject);
var
  strwhere:string;
begin
  inherited;
 strwhere:='';

  if (rxbdLookupCargo.Text <> '') then strwhere:= ' where PF.PRST_ID = ' + QuoteDStr(rxbdLookupCargo.KeyValue);

  if (Trim(edtDesc.Text) <> '') then
  if (strwhere <> '') then strwhere:=strwhere + ' and PF.PF_DESC LIKE ' + QuoteDStr(Trim(edtDesc.Text) + '%')
  else strwhere:='where PF.PF_DESC LIKE ' + QuoteDStr(Trim(edtDesc.Text) + '%');

  if (Trim(cbStatus.Text) <> '') then
  Begin
    if (strwhere <> '') then strwhere:=strwhere + ' and PF.PF_Status = ' else strwhere:=' where PF.PF_Status = ';
    if (cbStatus.Text = 'Ativo') then strwhere:= strwhere + QuoteDStr('A') else strwhere:= strwhere + QuoteDStr('I');
  end;

  with dmSys1 do
  Begin
    cdsPersonnalFunctions.Close;
    cdsPersonnalFunctions.CommandText:='select PF.*, PF.PF_Status As Status_ID, PT.PRST_ID AS ID_PRST, PT.PRST_Desc from PERSONNELFUNCTIONS PF join PERSONNELTYPES PT ON PF.PRST_ID = PT.PRST_ID '+ strwhere +' order by PF_ID';
    cdsPersonnalFunctions.Open;
  end;

   FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsPersonnalFunctions.RecordCount ) + ' Registro(s)';
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmPersonnelFunctions.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmPersonnelFunctions.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmPersonnelFunctions.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmPersonnelFunctions.btnLimpaStatusClick(Sender: TObject);
begin cbStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmPersonnelFunctions.lbFiltradoClick(Sender: TObject);
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
procedure TFrmPersonnelFunctions.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
