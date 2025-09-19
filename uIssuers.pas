unit uIssuers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, ToolEdit, CurrEdit,
  RxDBComb, Buttons, RXCtrls;

type
  TFrmIssuers = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbDescShort: TDBEdit;
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label3: TLabel;
    dbCertificate: TDBEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    edNome: TEdit;
    edDesc: TEdit;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    dbCodigo: TDBEdit;
    dbKey: TDBEdit;
    db_KeySTR: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    edCodigo: TEdit;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbCertificateChange(Sender: TObject);
    procedure dbKeyChange(Sender: TObject);
    procedure db_KeySTRChange(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    Procedure SetCtr;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmIssuers: TFrmIssuers;

implementation

uses uDmSys, uFrmSystemLog, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmBaseCadastro, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmIssuers.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmIssuers.FormShow(Sender: TObject);
begin
  inherited;
    grdResultado.Columns[6].Title.Caption:='Usuário';

    ct:='SELECT '+ ccardIssuers +' From ISSUERS ISS %where% %order% ';
    defOrder:=' ORDER BY ISS_ID '; strOrder:=defOrder;

    OpenTablesSys([DmSys.cdsIssuers]);
//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ISS_ID', 'FROM ISSUERS', 'True', ' WHERE ISS_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsIssuers.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmIssuers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsIssuers]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsIssuers.CommandText := 'SELECT '+ ccardIssuers +' From ISSUERS ISS WHERE ISS_STATUS = ''A'' ORDER BY ISS_ID';
    FrmIssuers := Nil;
end;

procedure TFrmIssuers.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsIssuers);
  SetActions([], False, FrmIssuers, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmIssuers, t_form_objects);
  SetCtr;
  dbCodigo.SetFocus;
end;

procedure TFrmIssuers.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmIssuers, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmIssuers, t_form_objects);
  SetCtr;
  dbDescShort.SetFocus;  
end;

procedure TFrmIssuers.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbCodigo, dbDescShort, dbDesc, dbCertificate, dbKey, db_KeySTR], [DmSys.cdsIssuers]) Then
         begin
          SetActions([], True, FrmIssuers, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmIssuers, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmIssuers.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsIssuers.Cancel;
     SetActions([], True, FrmIssuers, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmIssuers, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmIssuers.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsIssuers.Edit;
         cdsIssuers.FieldByName('ISS_STATUS').AsString := 'I';
         cdsIssuers.Post;
         cdsIssuers.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

end;

procedure TFrmIssuers.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmIssuers, t_form_objects);
      SetCtr;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmIssuers, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

end;

Procedure TFrmIssuers.SetCtr;
Begin
  dbCodigo.Enabled := (Status = StInsert);
End;

procedure TFrmIssuers.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edCodigo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' ISS_ID = ' + QuotedStr(edCodigo.Text) + ' AND ';
       end;

     If Trim(edNome.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' ISS_DESCSHORT LIKE ' + QuotedStr(edNome.Text + '%') + ' AND ';
       end;


     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' ISS_DESCLONG LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' ISS_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' ISS_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsIssuers.Close;
      cdsIssuers.CommandText := 'SELECT '+ ccardIssuers +' FROM ISSUERS ISS' + strWhere + strOrder;
      cdsIssuers.Open;
//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('ISS_ID', 'FROM ISSUERS', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsIssuers.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end
end;

procedure TFrmIssuers.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsIssuers;
end;

procedure TFrmIssuers.dbCertificateChange(Sender: TObject);
begin
  inherited;
  dbCertificate.Text := ValidateValues(dbCertificate.Text);
end;

procedure TFrmIssuers.dbKeyChange(Sender: TObject);
begin
  inherited;
  dbKey.Text := ValidateValues(dbKey.Text);
end;

procedure TFrmIssuers.db_KeySTRChange(Sender: TObject);
begin
  inherited;
  db_KeySTR.Text := ValidateValues(db_KeySTR.Text);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmIssuers.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmIssuers.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmIssuers.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmIssuers.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmIssuers.lbFiltradoClick(Sender: TObject);
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
procedure TFrmIssuers.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
