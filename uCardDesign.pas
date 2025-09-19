unit uCardDesign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, RxLookup,
  Buttons, RXCtrls;

type
  TFrmCardDesign = class(TFrmBaseSys)
    gbCarddesign: TGroupBox;
    lbDescricao: TLabel;
    dbDesc: TDBEdit;
    lbCertificate: TLabel;
    dbCertificate: TDBEdit;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    edDesc: TEdit;
    Label7: TLabel;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    pcSubApplications: TPageControl;
    TabSheet1: TTabSheet;
    Label19: TLabel;
    btDisplayCancel: TSpeedButton;
    btDisplayOK: TSpeedButton;
    dbLkApplications: TRxDBLookupCombo;
    dbgAplicacoes: TDBGrid;
    actNewApp: TAction;
    actEditApp: TAction;
    actDeleteApp: TAction;
    actOkApp: TAction;
    actCancelApp: TAction;
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
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure SetApp;
    procedure BeforePost;
    Procedure SetStatus(Status : boolean);
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCardDesign: TFrmCardDesign;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uFrmBaseCadastro, uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardDesign.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardDesign.FormShow(Sender: TObject);
begin
  inherited;
    ct:='SELECT '+ ccardDesign +' FROM CARDDESIGN %where% %order% ';
    defOrder:=' ORDER BY CD_DESC ';
    strOrder:=defOrder;
    OpenTablesSys([DmSys.cdsCarddesignCad, DmSys.cdsCardDesignXApp, DmSys.cdsApplicationsLook ]);

    //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CD_ID', 'FROM CARDDESIGN', 'True', ' WHERE CD_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsCarddesignCad.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    actLog.Enabled := DmSys.cdsCarddesignCad.RecordCount > 0
end;

procedure TFrmCardDesign.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsCarddesignCad, DmSys.cdsCardDesignXApp, DmSys.cdsApplicationsLook]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsCarddesignCad.CommandText := 'SELECT '+ ccardDesign +' From CARDDESIGN where CD_STATUS = ''A'' ORDER BY CD_DESC';
    FrmCardDesign := Nil;
end;

procedure TFrmCardDesign.actInsertExecute(Sender: TObject);
begin
  inherited;
  SetStatus(True);
  ActionInsertSys(DmSys.cdsCarddesignCad);
  SetActions([], False, FrmCardDesign, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCardDesign, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmCardDesign.BeforePost;
Var
 vCD_ID : Integer;
Begin
  vCD_ID := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('CARDDESIGN','CD_ID', 'False', '');

  DmSys.cdsCardDesignXApp.First;

  While Not DmSys.cdsCardDesignXApp.Eof do
     Begin
        DmSys.cdsCardDesignXApp.Edit;
        DmSys.cdsCardDesignXApp.FieldByName('CD_ID').AsInteger := vCD_ID;
        DmSys.cdsCardDesignXApp.Post;
     End;

  DmSys.cdsCarddesignCad.Edit;
  DmSys.cdsCarddesignCad.FieldByName('CD_ID').AsInteger := vCD_ID;
  DmSys.cdsCarddesignCad.Post;

End;

procedure TFrmCardDesign.actEditExecute(Sender: TObject);
begin
  inherited;
  SetStatus(True);
  SetActions([], False, FrmCardDesign, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCardDesign, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmCardDesign.actApplyUpdatesExecute(Sender: TObject);
begin
  If dbDesc.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
    dbDesc.SetFocus;
  end
  Else
  If dbCertificate.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
    dbCertificate.SetFocus;
  End
  Else
  Begin
  inherited;
  If  status = stConsult Then
    BEGIN
    If dtsMaster.DataSet.State = dsInsert Then
       BeforePost;
     If ApplyTablesSys([dbDesc, dbCertificate], [DmSys.cdsCarddesignCad,
                                                 DmSys.cdsCarddesignXApp]) Then
         begin
          SetActions([], True, FrmCardDesign, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmCardDesign, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
  End;

  actLog.Enabled := True;

end;

Procedure TFrmCardDesign.SetStatus(Status : Boolean);
Begin
  gbCarddesign.Enabled := Status;
  cbCardApps.Enabled := Status;
End;

procedure TFrmCardDesign.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsCarddesignCad.Cancel;
     DmSys.cdsCarddesignXApp.Cancel;
     DmSys.cdsCardDesignXApp.CancelUpdates;
     SetActions([], True, FrmCardDesign, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmCardDesign, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

  actLog.Enabled := DmSys.cdsCarddesignCad.RecordCount > 0;

end;

procedure TFrmCardDesign.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsCarddesignCad.Edit;
         cdsCarddesignCad.FieldByName('CD_STATUS').AsString := 'I';
         cdsCarddesignCad.Post;
         cdsCarddesignCad.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

  actLog.Enabled := DmSys.cdsCarddesignCad.RecordCount > 0;
  
end;

procedure TFrmCardDesign.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatus(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmCardDesign, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmCardDesign, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmCardDesign.SetApp;
Begin
   DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([DmSys.cdsCarddesignXApp.FieldByName('APP_ID').AsInteger,
                                                                 DmSys.cdsCarddesignXApp.FieldByName('ISS_ID').AsInteger]), [] );
   dbLkApplications.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger;
End;

procedure TFrmCardDesign.actFilterExecute(Sender: TObject);
// Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' CD_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' CD_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' CD_STATUS = ' + QuotedStr('I') + ' AND ';
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
 // inherited;
  strWhere  := '';
  BuiltStrWhere;
  with DmSys do
    begin
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
//    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
//    lbFiltrado.Visible:=strWhere <> '';
      cdsCarddesignCad.Close;
      cdsCarddesignCad.CommandText := 'SELECT '+ ccardDesign +' From CARDDESIGN ' + strWhere + strOrder; //' ORDER BY CD_DESC';
      cdsCarddesignCad.Open;

//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CD_ID', 'FROM CARDDESIGN', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsCarddesignCad.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;

  actLog.Enabled := DmSys.cdsCarddesignCad.RecordCount > 0;
  
end;

procedure TFrmCardDesign.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatus(False);
end;

procedure TFrmCardDesign.actNewAppExecute(Sender: TObject);
begin
  inherited;
  DmSys.cdsCardDesignXApp.Insert;
//  edApp.Text := '';
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
  dbgAplicacoes.Visible    := False;
end;

procedure TFrmCardDesign.actEditAppExecute(Sender: TObject);
begin
  inherited;
  dbgAplicacoes.Visible := False;
  SetApp;
  DmSys.cdsCardDesignXApp.Edit;

  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
end;

procedure TFrmCardDesign.actDeleteAppExecute(Sender: TObject);
begin
  inherited;
   DmSys.cdsCarddesignXApp.Edit;
   DmSys.cdsCarddesignXApp.FieldByName('CDAPP_STATUS').AsString := 'I';
   DmSys.cdsCarddesignXApp.FieldByName('STATUS_ID').AsString    := 'I';
   DmSys.cdsCarddesignXApp.Post;
end;

procedure TFrmCardDesign.actOkAppExecute(Sender: TObject);
begin
  inherited;
  if dbLkApplications.Text <> '' then
  With DmSys do
   Begin
     SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
     SetCategories([Applications], True, Self, t_form_objects);

     cdsCardDesignXApp.FieldByName('APP_ID').AsString := cdsApplicationsLook.fieldByName('APP_ID').AsString;
     cdsCardDesignXApp.FieldByName('ISS_ID').AsString := cdsApplicationsLook.fieldByName('ISS_ID').AsString;
     cdsCardDesignXApp.FieldByName('APP_DESCSHORT').AsString := cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
     cdsCardDesignXApp.FieldByName('ISS_DESCLONG').AsString  := cdsApplicationsLook.fieldByName('ISS_DESCLONG').AsString;
     cdsCardDesignXApp.FieldByName('CDAPP_STATUS').AsString  := 'A';
     cdsCardDesignXApp.FieldByName('STATUS_ID').AsString     := 'A';


     cdsCardDesignXApp.Post;
     dbgAplicacoes.Visible := True;
  End
  else
    begin
      DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
//      edApp.SetFocus;
    end;
end;

procedure TFrmCardDesign.actCancelAppExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewApp, actEditApp], True, Self, t_form_objects);
   SetActions([actDeleteApp], NOT (dmSys.cdsCardDesignXApp.RecordCount = 0), Self, t_form_objects);

   DmSys.cdsCardDesignXApp.Cancel;
   dbgAplicacoes.Visible := True;
end;

procedure TFrmCardDesign.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsCarddesignCad;
//  actFilter.Execute;
end;

procedure TFrmCardDesign.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '5';
  FrmSystemLog.pSLG_ID := DmSys.cdsCarddesignCad.FieldByName('CD_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardDesign.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmCardDesign.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmCardDesign.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmCardDesign.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmCardDesign.lbFiltradoClick(Sender: TObject);
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
procedure TFrmCardDesign.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
