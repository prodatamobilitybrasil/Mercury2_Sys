unit uSystemParameters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, ToolEdit,
  CurrEdit, RXDBCtrl, Buttons, RXCtrls;

type
  TFrmSystemParameters = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbCodigo: TDBEdit;
    GroupBox2: TGroupBox;
    dbCertificado: TDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    dbValue: TDBEdit;
    Label3: TLabel;
    dbDataType: TDBEdit;
    Label2: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    edCodigo: TEdit;
    edDataType: TEdit;
    edTipo: TEdit;
    lStatus: TLabel;
    lkFilterStatus: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbType: TRxDBComboBox;
    btnBits: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure dbCertificadoChange(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure dbCodigoChange(Sender: TObject);
    procedure btnBitsClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    Procedure SetDetail;
  public
    { Public declarations }
  end;

var
  FrmSystemParameters: TFrmSystemParameters;

implementation

Uses uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
     uFrmBaseCadastro, uFrmSystemLog, uFrmBits, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSystemParameters.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSystemParameters.FormShow(Sender: TObject);
begin
  inherited;

    defOrder:=' ORDER BY SP_CODE ';
    strOrder:=defOrder;
    ct:='SELECT '+ ccardSystemParameters +' From SYSTEMPARAMETERS %where% %order% ';

    (dtsMaster.DataSet as TClientDataSet).CommandText:='SELECT '+ ccardSystemParameters +' From SYSTEMPARAMETERS ORDER BY SP_CODE';
    OpenTablesSys([(dtsMaster.DataSet as TClientDataSet)]);

    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SP_CODE', 'FROM SYSTEMPARAMETERS', 'True', ' WHERE SP_STATUS = ''A'' ' ) ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',(dtsMaster.DataSet as TClientDataSet).RecordCount)+' registro(s)';

    actLog.Enabled := (dtsMaster.DataSet as TClientDataSet).RecordCount > 0;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSystemParameters.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsSystemParameters]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsSystemParameters.CommandText := 'SELECT '+ ccardSystemParameters +' From SYSTEMPARAMETERS where SP_STATUS = ''A'' ORDER BY SP_CODE';
    FrmSystemParameters := Nil;
end;

Procedure TFrmSystemParameters.SetDetail;
Begin
  dbCodigo.Enabled := Status = stInsert;
End;

procedure TFrmSystemParameters.actInsertExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
  ActionInsertSys(DmSys.cdsSystemParameters);
  SetActions([], False, FrmSystemParameters, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmSystemParameters, t_form_objects);
  dbCodigo.SetFocus;
end;

procedure TFrmSystemParameters.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmSystemParameters, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmSystemParameters, t_form_objects);
  SetDetail;
  dbDataType.SetFocus;
end;

procedure TFrmSystemParameters.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbCodigo, dbType], [DmSys.cdsSystemParameters]) Then
         begin
          SetActions([], True, FrmSystemParameters, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmSystemParameters, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
  actLog.Enabled := True;
  
end;

procedure TFrmSystemParameters.actCancelExecute(Sender: TObject);
begin
  inherited;
  if status = stConsult then
    begin
     dmSys.cdsSystemParameters.Cancel;
     SetActions([], True, FrmSystemParameters, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmSystemParameters, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsSystemParameters.RecordCount > 0;

end;

procedure TFrmSystemParameters.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     Try
       with DmSys do
        Begin
         cdsSystemParameters.Edit;
         cdsSystemParameters.FieldByName('SP_STATUS').AsString := 'I';
         cdsSystemParameters.Post;
         cdsSystemParameters.ApplyUpdates(-1);
        End;
       Except
        dmConexao.ConnBrkMaster.AppServer.Rollback;
        Exit;
       End;
        dmConexao.ConnBrkMaster.AppServer.Commit;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    tbtnRefresh.Click;
   end; //With...
 actLog.Enabled := DmSys.cdsSystemParameters.RecordCount > 0;
   
end;

procedure TFrmSystemParameters.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
   IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmSystemParameters, t_form_objects);
      SetDetail;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmSystemParameters, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmSystemParameters.actFilterExecute(Sender: TObject);
//Var
//  strWhere  : String;  //cidel-

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edCodigo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' SP_CODE LIKE ' + QuotedStr(edCodigo.Text + '%') + ' AND ';
       end;

     If Trim(edDataType.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' SP_DATATYPE LIKE ' + QuotedStr(edDataType.Text + '%') + ' AND ';
       end;


     If Trim(edTipo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' SP_TYPE LIKE ' + QuotedStr(edTipo.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SP_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SP_STATUS = ' + QuotedStr('I') + ' AND ';
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
      //Passar para uConst...
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;

      (dtsMaster.DataSet as TClientDataSet).Close;
      (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT '+ ccardSystemParameters +' FROM SYSTEMPARAMETERS ' + strWhere + strOrder; // 'ORDER BY SP_CODE';
      (dtsMaster.DataSet as TClientDataSet).Open;

      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SP_CODE', 'FROM SYSTEMPARAMETERS', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',(dtsMaster.DataSet as TClientDataSet).RecordCount)+' registro(s)';
//    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := (dtsMaster.DataSet as TClientDataSet).RecordCount > 0;

end;

procedure TFrmSystemParameters.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
  SetDetail;
end;

procedure TFrmSystemParameters.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsSystemParameters;
end;

procedure TFrmSystemParameters.dbCertificadoChange(Sender: TObject);
begin
  inherited;
  dbCertificado.Text := ValidateValues(dbCertificado.Text);
end;

procedure TFrmSystemParameters.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '3';
  FrmSystemLog.pSLG_ID := DmSys.cdsSystemParameters.FieldByName('SP_TYPE').AsString + '|' +
                          DmSys.cdsSystemParameters.FieldByName('SP_CODE').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSystemParameters.dbCodigoChange(Sender: TObject);
begin //cidel+ SU-47526
  inherited;
dbValue.ReadOnly:=Trim(UpperCase(dbCodigo.Text)) = 'BITS3';
dbValue.Enabled:=not dbValue.ReadOnly;
btnBits.Visible:=dbValue.ReadOnly;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSystemParameters.btnBitsClick(Sender: TObject);
Var S: String; i,t: Integer;
begin //cidel+ SU-47526
  inherited;
S:=dbValue.Text;
i:=Pos('$',S)+1;
t:=Length(S)-i+1;
FrmBits.pnValor.Caption:=Copy(S,i,t);
Label1.Caption:=S;
IF FrmBits.ShowModal = mrOK
THEN dbValue.Text:=Copy(S,1,i-2)+'$'+FrmBits.pnValor.Caption;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSystemParameters.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmSystemParameters.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmSystemParameters.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmSystemParameters.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSystemParameters.lbFiltradoClick(Sender: TObject);
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
procedure TFrmSystemParameters.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
