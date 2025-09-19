unit uFrmAcceptedFct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxLookup, Mask, ToolEdit, DBCtrls,
  RXCtrls;

type
  TFrmAcceptedFct = class(TFrmBaseSys)
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    lbDisponiveis: TListBox;
    lbSelecionadas: TListBox;
    cbTransportproviders: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    Label2: TLabel;
    rxLkTProv: TDBLookupComboBox;
    rxLkTransportProviders: TRxDBLookupCombo;
    Label3: TLabel;
    edTp_id: TEdit;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure actFilterExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure tbtnNewLineMtClick(Sender: TObject);
    procedure btnAddAllLineMtClick(Sender: TObject);
    procedure btnDelAllLineMtClick(Sender: TObject);
    procedure tbtnDeleteLineMtClick(Sender: TObject);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rxLkTProvCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure tsBaseCadastroConsultaEnter(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbFiltradoClick(Sender: TObject);
    procedure edTp_idKeyPress(Sender: TObject; var Key: Char);
    procedure edTp_idChange(Sender: TObject);
    procedure rxLkTransportProvidersChange(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
  private
    { Private declarations }
    tp_id : Integer;
    iss_id: string;
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure SetTransportProviders;
    Procedure BeforePost;
    Procedure ActiveLines(Status : Boolean);
  public
    Procedure ListaEmpresas;
    { Public declarations }
  end;

var
  FrmAcceptedFct: TFrmAcceptedFct;

implementation

uses uDmBase, uDmSys1, AppSparkSysMain, uDmConexao,  uConst, uGeralFunctions,
  uDmSys, uFrmLineGroups, uFrmBaseCadastro, uFrmSystemLog, Aguarde, Buttons,
  dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAcceptedFct.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAcceptedFct.FormShow(Sender: TObject);
begin
  inherited;                                 // Distinct
{
  SELECT ACF.TP_ID, ACF_TPID, TP.TP_DESC
  FROM ACCEPTEDFUNCTIONAL ACF
  INNER JOIN TRANSPORTPROVIDERS TP ON ACF.TP_ID = TP.TP_ID
  ORDER BY ACF.Tp_Id, ACF_TPID
}
  ct:='SELECT Distinct ACF.TP_ID, TP.TP_DESC '#13+
      'FROM ACCEPTEDFUNCTIONAL ACF '#13+
      'INNER JOIN TRANSPORTPROVIDERS TP ON ACF.TP_ID = TP.TP_ID '#13+
      '%where% %order%';
  defOrder:=' ORDER BY TP_ID ';
  strOrder:=defOrder;
  DmSys1.cdsAcceptedFct.CommandText:='SELECT Distinct ACF.TP_ID, TP.TP_DESC '#13+
                                     'FROM ACCEPTEDFUNCTIONAL ACF '#13+
                                     'INNER JOIN TRANSPORTPROVIDERS TP ON ACF.TP_ID = TP.TP_ID '#13+
                                     'ORDER BY TP_ID';
  OpenTablesSys([DmSys1.cdsAcceptedFct, dmSys1.cdsTransportprovidersAccepted, DmSys1.cdsAcceptedFctLista, DmBase.cdsTransportProvider ]);

  //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('TP_ID', 'FROM ACCEPTEDFUNCTIONAL', 'True', ' ') ) + ' Registro(s)';
  lblContador.Caption:=FormatFloat('#,##0',DmSys1.cdsAcceptedFct.RecordCount)+' registro(s)';
  FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

  actLog.Enabled := dmSys1.cdsAcceptedFct.RecordCount > 0;
  if dmSys.cdsGeral.Active then
  dmSys.cdsGeral.Active := False;
  dmSys.cdsGeral.CommandText := 'select SP_VALUE from SYSTEMPARAMETERS where SP_CODE = ''ISS_ID''';
  dmSys.cdsGeral.Active := True;
  iss_id := dmSys.cdsGeral.FieldByName('SP_VALUE').AsString;
  grdResultado.Columns[0].Title.Caption:='Código';
  grdResultado.Columns[1].Title.Caption:='Descrição';
end;

procedure TFrmAcceptedFct.actFilterExecute(Sender: TObject);
Var
  qtd_campos, i : Integer; S: String;
begin
  inherited;
  with dmSys1 do
  Begin
{  SELECT Distinct ACF.TP_ID,
              TP.TP_ID,
              TP.TP_DESC
FROM ACCEPTEDFUNCTIONAL ACF
INNER JOIN TRANSPORTPROVIDERS TP
ON ACF.TP_ID = TP.TP_ID   }
//ShowMessage(cdsAcceptedFct.CommandText);
  cdsAcceptedFct.Close;
  cdsAcceptedFct.Filter := '';
  qtd_campos := 0;

  // Parte nova usando select
  //ACF.TP_ID = TP.TP_ID
  strWhere:='';
  If edTp_id.text <> ''
  Then begin
       Inc(qtd_campos);
       strWhere:=strWhere + ' tp.TP_ID = '+edTp_id.Text;
       end
  ELSE
  If rxLkTransportProviders.text <> ''
  Then begin
       Inc(qtd_campos);
       strWhere:=strWhere + ' tp.TP_ID = '+rxLkTransportProviders.KeyValue;
       end;
  IF strWhere <> '' THEN strWhere:=' WHERE '+strWhere;

{
  if rxLkTransportProviders.Text <> '' then
     Begin
       cdsAcceptedFct.Filter := 'TP_ID = ' + rxLkTransportProviders.KeyValue + ' AND';
       Inc(qtd_campos);
     End;

  if edTp_id.Text <> '' then
     Begin
       cdsAcceptedFct.Filter := cdsAcceptedFct.Filter + ' TP_ID = ' + edTp_id.Text + ' AND';
       Inc(qtd_campos);
     End;


   if (edTp_id.Text = '') and
      (rxLkTransportProviders.Text = '') Then
       cdsAcceptedFct.Filter := '';

      // Verifica se é necessário tirar o AND
      if qtd_campos > 0 then
         begin
           i := Length(cdsAcceptedFct.Filter) - 4;
           cdsAcceptedFct.Filter :=  Copy(cdsAcceptedFct.Filter,1,i);
         end;
}
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
      S:=StringReplace(ct, '%where%', strWhere, [rfReplaceAll, rfIgnoreCase]);
      S:=StringReplace(S, '%order%', strOrder, [rfReplaceAll, rfIgnoreCase]);
      cdsAcceptedFct.Close;
      cdsAcceptedFct.CommandText:=S;
      cdsAcceptedFct.Open;

      lblContador.Caption:=FormatFloat('#,##0',DmSys1.cdsAcceptedFct.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      lbFiltrado.Visible:=strWhere <> '';
      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
  end;
  actLog.Enabled :=dmSys1.cdsAcceptedFct.RecordCount > 0;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
Procedure TFrmAcceptedFct.ActiveLines(Status : Boolean);
Begin
  cbTransportproviders.Enabled:=Status;
End;

procedure TFrmAcceptedFct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys1.cdsAcceptedFct, dmBase.cdsTransportProvider]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
//    DmSys.cdsMasterApp.CommandText := 'SELECT '+ ccardMasterApp +' From MASTERAPPLICATIONS where MA_STATUS = ''A'' ORDER BY MA_ID';
    FrmAcceptedFct := Nil;
end;

procedure TFrmAcceptedFct.SetTransportProviders;
begin
  With DmBase, DmSys1 do
     Begin
        tp_id := cdsTransportProvider.FieldByName('TP_ID').AsInteger;
        lbDisponiveis.DragMode  := dmManual;
        lbSelecionadas.DragMode := dmManual;
        cdsTransportProvider.First;
        lbSelecionadas.Items.Clear;
        lbDisponiveis.Items.Clear;

        While not cdsTransportProvider.eof do
           Begin
            IF  cdsAcceptedFct.Locate('ACF_TPID', cdsTransportProvider.FieldByName('TP_ID').AsString, [])
                 Then lbSelecionadas.Items.AddObject(cdsTransportProvider.fieldByName('TP_ID').AsString + '#9'+
                                                     cdsTransportProvider.fieldByName('TP_DESC').AsString,
                                             TObject(cdsTransportProvider.fieldByName('TP_ID').AsInteger))
                 Else lbDisponiveis.Items.AddObject(cdsTransportProvider.fieldByName('TP_ID').AsString + '#9'+
                                                    cdsTransportProvider.fieldByName('TP_DESC').AsString,
                                            TObject(cdsTransportProvider.fieldByName('TP_ID').AsInteger));
               cdsTransportProvider.Next;
           End;
     End;
end;

procedure TFrmAcceptedFct.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  if dmSys1.cdsAcceptedFct.RecordCount = 0 then exit;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetActions([actFilter, actDelete, actRefresh], False, FrmAcceptedFct, t_form_objects);
{     ListaEmpresas;   //cidel-
      ShowMessage(iss_id);
      dmSys1.cdsTransportprovidersAccepted.Close;
      dmSys1.cdsTransportprovidersAccepted.CommandText := 'SELECT 	TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS_EXTERNAL TP '+
                                                          'WHERE TP_STATUS = ''A'' AND TP.ISS_ID = ' + iss_id + ' ORDER BY TP_DESC';
      dmSys1.cdsTransportprovidersAccepted.Open;
      rxLkTProv.KeyValue :=  dmSys1.cdsAcceptedFct.fieldByname('TP_ID').AsString;
      rxLkTProv.Enabled := False;  }
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmAcceptedFct, t_form_objects);
    End;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmAcceptedFct.tbtnNewLineMtClick(Sender: TObject);
begin
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmAcceptedFct.btnAddAllLineMtClick(Sender: TObject);
begin
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmAcceptedFct.btnDelAllLineMtClick(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmAcceptedFct.tbtnDeleteLineMtClick(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmAcceptedFct.lbDisponiveisDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnDelAllLineMt.Click;
end;

procedure TFrmAcceptedFct.lbDisponiveisDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmAcceptedFct.lbSelecionadasDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  btnAddAllLineMt.Click;
end;

procedure TFrmAcceptedFct.lbSelecionadasDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmAcceptedFct.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
{ if dmSys1.cdsAcceptedFct.RecordCount = 0 then exit;
//SetTransportProviders;
  ListaEmpresas;
  rxLkTProv.KeyValue:=dmSys1.cdsAcceptedFct.fieldByname('TP_ID').AsString;
  rxLkTProv.Enabled:=False;
  ActiveLines(False);  }
  pcBaseCadastro.TabIndex:=1;
end;

procedure TFrmAcceptedFct.actDeleteExecute(Sender: TObject);
begin
   If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsGeral.Close;
         cdsGeral.CommandText := 'DELETE FROM ACCEPTEDFUNCTIONAL WHERE TP_ID = :TP_ID';
         cdsGeral.Params.ParamByName('TP_ID').AsString := dmSys1.cdsAcceptedFct.FieldByName('TP_ID').AsString;
         cdsGeral.Execute;
         dmSys1.cdsAcceptedFctLista.ApplyUpdates(-1);
         dmSys1.cdsAcceptedFctLista.Close;
         dmSys1.cdsAcceptedFctLista.Open;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
   actLog.Enabled :=dmSys1.cdsAcceptedFct.RecordCount > 0
end;

procedure TFrmAcceptedFct.ListaEmpresas;
var
  iss_tp_id: integer;
begin
  with dmSys do
  begin
    lbDisponiveis.DragMode  := dmManual;
    lbSelecionadas.DragMode := dmManual;
    lbSelecionadas.Clear;
    lbDisponiveis.Clear;

    dmSys1.cdsTransportprovidersAccepted.Close;
    dmSys1.cdsTransportprovidersAccepted.CommandText := 'SELECT 	TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS_EXTERNAL TP '+
    'WHERE TP_STATUS = ''A'' ORDER BY ISS_ID, TP_ID';
    dmSys1.cdsTransportprovidersAccepted.Open;

    rxLkTProv.KeyValue := dmSys1.cdsAcceptedFct.fieldByName('TP_ID').AsInteger;

    cdsGeral.Close;
    cdsGeral.CommandText := 'SELECT TP_ID, ISS_ID, TP_DESC FROM TRANSPORTPROVIDERS_EXTERNAL WHERE TP_STATUS = ''A'' ORDER BY ISS_ID, TP_ID';
    cdsGeral.Open;

    while not cdsGeral.Eof do
    begin
      iss_tp_id := StrToInt(cdsGeral.fieldByName('ISS_ID').AsString + cdsGeral.fieldByName('TP_ID').AsString);
      if dmSys1.cdsAcceptedFctLista.Locate('ACF_TPID;ACF_ISSID',
         VarArrayOf([cdsGeral.fieldByName('TP_ID').AsString,cdsGeral.fieldByName('ISS_ID').AsString]),[]) then
        lbSelecionadas.Items.AddObject(cdsGeral.fieldByName('ISS_ID').AsString + #9
                                     + cdsGeral.fieldByName('TP_ID').AsString + #9
                                     + cdsGeral.fieldByName('TP_DESC').AsString,
                                       TObject(iss_tp_id))
      else
        lbDisponiveis.Items.AddObject(cdsGeral.fieldByName('ISS_ID').AsString + #9
                                    + cdsGeral.fieldByName('TP_ID').AsString + #9
                                    + cdsGeral.fieldByName('TP_DESC').AsString,
                                      TObject(iss_tp_id));
      cdsGeral.Next;
    end;
  end;
end;

procedure TFrmAcceptedFct.BeforePost;
var
 I : Integer;
 acf_tpid: string;
 iss_tp_id: string;
begin
  with DmSys1 do
  begin
    cdsAcceptedFctLista.First;

    if dtsMaster.DataSet.State = dsEdit then
      while not cdsAcceptedFctLista.Eof do
        cdsAcceptedFctLista.Delete;

    for I := 0 to lbSelecionadas.Items.Count - 1 do
    begin
      iss_tp_id := IntToStr(Integer(lbSelecionadas.Items.Objects[I]));
      acf_tpid := copy(iss_tp_id,2, length(iss_tp_id) - 1);
      cdsAcceptedFctLista.Append;
      cdsAcceptedFctLista.FieldByName('ISS_ID').Value    := iss_id;
      cdsAcceptedFctLista.FieldByName('TP_ID').Value     := rxLkTProv.KeyValue;
      cdsAcceptedFctLista.FieldByName('ACF_TPID').Value  := acf_tpid;
      cdsAcceptedFctLista.FieldByName('ACF_ISSID').Value := copy(iss_tp_id,1,1);
      cdsAcceptedFctLista.Post;
    end;

  end;
end;

procedure TFrmAcceptedFct.actApplyUpdatesExecute(Sender: TObject);
begin
  If Trim(rxLkTProv.Text) = '' Then
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [])
  Else
  IF lbSelecionadas.Count = 0 Then
     DisplayMsg(t_form_objects, '%T', [2809], [], mtInformation, [mbOK])
   Else
   Begin
     inherited;
      If  status = stConsult Then
        BEGIN
         BeforePost;
         If ApplyTablesSys([], [DmSys1.cdsAcceptedFctLista]) Then
             begin
              SetActions([], True, FrmAcceptedFct, t_form_objects);
              SetActions([actApplyUpdates, actCancel], False, FrmAcceptedFct, t_form_objects);
              tbtnRefresh.Click;
              ActiveLines(False);
             end;
        END;
    End;
  actLog.Enabled :=dmSys1.cdsAcceptedFct.RecordCount > 0
end;

procedure TFrmAcceptedFct.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsAcceptedFct.Cancel;
     SetActions([], True, FrmAcceptedFct, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmAcceptedFct, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     ActiveLines(False);
    end;
  actLog.Enabled :=dmSys1.cdsAcceptedFct.RecordCount > 0
end;

procedure TFrmAcceptedFct.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsAcceptedFct);
  SetActions([], False, FrmAcceptedFct, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], True, FrmAcceptedFct, t_form_objects);
  ListaEmpresas;
  rxLkTProv.Enabled := True;

  dmSys1.cdsTransportprovidersAccepted.Close;
  dmSys1.cdsTransportprovidersAccepted.CommandText := 'SELECT 	TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS_EXTERNAL TP '+
   'WHERE TP_STATUS = ''A'' AND  TP_ID NOT IN (SELECT TP_ID FROM ACCEPTEDFUNCTIONAL) AND TP.ISS_ID = ' + iss_id + ' ORDER BY ISS_ID, TP_ID';
  dmSys1.cdsTransportprovidersAccepted.Open;
  rxLkTProv.KeyValue := Null;
  ActiveLines(True);

  iF dmSys1.cdsTransportprovidersAccepted.RecordCount = 0 Then
     Begin
       DisplayMsg(t_form_objects, '%T', [2810], [], mtInformation, [mbOK]);
       rxLkTProv.Enabled := False;
       dmSys1.cdsAcceptedFct.Cancel;
       SetActions([], True, FrmAcceptedFct, t_form_objects);
       SetActions([actApplyUpdates, actCancel], False, FrmAcceptedFct, t_form_objects);
       pcBaseCadastro.ActivePageIndex := 0;
       Status := stConsult;
       FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
       ActiveLines(False);
       Exit;
     End;

  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
//  dbCodigo.SetFocus;
end;

procedure TFrmAcceptedFct.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmAcceptedFct, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], True, FrmAcceptedFct, t_form_objects);
  dmSys1.cdsTransportprovidersAccepted.Close;
  dmSys1.cdsTransportprovidersAccepted.CommandText := 'SELECT 	TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS_EXTERNAL TP '+
   'WHERE TP_STATUS = ''A'' AND TP.ISS_ID = ' + iss_id + ' ORDER BY ISS_ID, TP_DESC';
  dmSys1.cdsTransportprovidersAccepted.Open;

  rxLkTProv.KeyValue :=  dmSys1.cdsAcceptedFct.fieldByname('TP_ID').AsString;
  rxLkTProv.Enabled := False;
  ActiveLines(True);
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
//  SetDetail;
//  dbDesc.SetFocus;
end;

procedure TFrmAcceptedFct.rxLkTProvCloseUp(Sender: TObject);
Var
 I: Integer;
begin
  inherited;
  iF rxLkTProv.KeyValue <> Null Then
     Begin
       lbDisponiveis.ClearSelection;
       tbtnDeleteLineMt.Click;
       I := lbDisponiveis.Items.IndexOf(INttoStr(rxLkTProv.KeyValue)+#9+rxLkTProv.Text);
       lbDisponiveis.Selected[I] := true;
       btnAddAllLineMt.Click;
     End;
end;

procedure TFrmAcceptedFct.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsAcceptedFct;
end;

procedure TFrmAcceptedFct.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '13';
  FrmSystemLog.pSLG_ID := DmSys1.cdsAcceptedFctLista.FieldByName('ACF_TPID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TFrmAcceptedFct.tsBaseCadastroConsultaEnter(Sender: TObject);
begin
  inherited;
//ShowMessage('Entrei');
      ListaEmpresas;  //cidel+
//      ShowMessage(iss_id);
      dmSys1.cdsTransportprovidersAccepted.Close;
      dmSys1.cdsTransportprovidersAccepted.CommandText := 'SELECT 	TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS_EXTERNAL TP '+
                                                          'WHERE TP_STATUS = ''A'' AND TP.ISS_ID = ' + iss_id + ' ORDER BY TP_DESC';
      dmSys1.cdsTransportprovidersAccepted.Open;
      rxLkTProv.KeyValue :=  dmSys1.cdsAcceptedFct.fieldByname('TP_ID').AsString;
      rxLkTProv.Enabled := False;

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAcceptedFct.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmAcceptedFct.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmAcceptedFct.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAcceptedFct.lbFiltradoClick(Sender: TObject);
Var i,j: Integer;
begin
j:=0;
FOR i := 0 to gbFiltro.ControlCount - 1
DO BEGIN
   {$include Limpa_Filtro.pas}
   IF gbFiltro.Controls[i] is TRxDBLookupCombo
   THEN BEGIN
        Inc(j);
        TRxDBLookupCombo(gbFiltro.Controls[i]).ClearValue;
        TRxDBLookupCombo(gbFiltro.Controls[i]).Repaint;
        END;
   END;
IF j <> gbFiltro.ControlCount
THEN BEGIN
     ShowMessage('ERRO DO SISTEMA:'#13#10'Falta componente(s) na Limpa Filtro');
     END
ELSE tbtnFiltrar.Click;
grdResultado.SetFocus;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAcceptedFct.edTp_idKeyPress(Sender: TObject; var Key: Char);
begin FM_SoNumero(Sender,Key); end;

procedure TFrmAcceptedFct.edTp_idChange(Sender: TObject);
begin
rxLkTransportProviders.OnChange:=nil;
rxLkTransportProviders.ClearValue;
rxLkTransportProviders.Repaint;
rxLkTransportProviders.OnChange:=rxLkTransportProvidersChange;
end;

procedure TFrmAcceptedFct.rxLkTransportProvidersChange(Sender: TObject);
begin
edTp_id.OnChange:=nil;
edTp_id.Clear;
edTp_id.OnChange:=edTp_idChange;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAcceptedFct.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
