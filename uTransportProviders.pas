unit uTransportProviders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, DBClient,
  RxLookup, Buttons, RXCtrls;

type
  TFrmTransportProviders = class(TFrmBaseSys)
    edTP_Permis: TEdit;
    TP_PERMIS: TLabel;
    edDesc: TEdit;
    Label1: TLabel;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dbAddress: TDBEdit;
    Label2: TLabel;
    dbPermis: TDBEdit;
    Label3: TLabel;
    dbDesc: TDBEdit;
    Label6: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    dbNameoncard: TDBEdit;
    Label5: TLabel;
    edCodigo: TEdit;
    Label7: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    dbTp_id: TDBEdit;
    pcSubApplications: TPageControl;
    TabSheet1: TTabSheet;
    dbgLinhas: TDBGrid;
    TabSheet2: TTabSheet;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbgAppsXValidatorActions: TDBGrid;
    lbDisponiveis: TListBox;
    lbSelecionadas: TListBox;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    Label10: TLabel;
    Label9: TLabel;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    Label19: TLabel;
    dbLkApplications: TRxDBLookupCombo;
    edApp: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    dbCNPJ: TDBEdit;
    Label11: TLabel;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actDeleteDetail: TAction;
    actOkLine: TAction;
    actCancelLine: TAction;
    actAddAllLine: TAction;
    actAddLine: TAction;
    actDelLine: TAction;
    actDelAllLine: TAction;
    actOkApp: TAction;
    actCancelApp: TAction;
    RxDBComboBox1: TRxDBComboBox;
    lbl_cargo: TLabel;
    TabSheet3: TTabSheet;
    pnlGridTPxIP: TPanel;
    lstParamDisp: TListBox;
    lblParamDisp: TLabel;
    btnDetalhe: TBitBtn;
    pnDireita: TPanel;
    lblParamSet: TLabel;
    clbrButtons: TCoolBar;
    tlbButtons: TToolBar;
    btnAllParameters: TToolButton;
    btnAddParameter: TToolButton;
    btnDelParameter: TToolButton;
    btnNoneParameters: TToolButton;
    lstParamSet: TListBox;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure dbLkApplicationsCloseUp(Sender: TObject);
    procedure pcSubApplicationsChange(Sender: TObject);
    procedure pcSubApplicationsChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure actDeleteDetailExecute(Sender: TObject);
    procedure actOkLineExecute(Sender: TObject);
    procedure actCancelLineExecute(Sender: TObject);
    procedure actAddAllLineExecute(Sender: TObject);
    procedure actAddLineExecute(Sender: TObject);
    procedure actDelLineExecute(Sender: TObject);
    procedure actDelAllLineExecute(Sender: TObject);
    procedure actOkAppExecute(Sender: TObject);
    procedure actCancelAppExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbCNPJChange(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure btnAllParametersClick(Sender: TObject);
    procedure btnDelParameterClick(Sender: TObject);
    procedure dbTp_idChange(Sender: TObject);
    procedure btnNoneParametersClick(Sender: TObject);
    procedure btnAddParameterClick(Sender: TObject);
    procedure grdResultadoCellClick(Column: TColumn);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnDetalheClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure soNumero(Sender: TObject; var Key: Char);
    procedure lbFiltradoClick(Sender: TObject);
  private
    cdsLineMtTP  : TClientDataSet;
    ct,strOrder,defOrder,strWhere: String;
    Procedure BeforeUpdate;
    Procedure Rotina_Configuracoes;
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
public
    Procedure SetLines;
    procedure SetParameters;
    { Public declarations }
  end;

var
  FrmTransportProviders: TFrmTransportProviders;

implementation

uses uDmSys, uConst, uGeralFunctions, uDmBase, AppSparkSysMain,
  uCardDesign, uDmConexao, uDmSys1, uCommonFunctions, uFrmSystemLog,
  Aguarde, ufrmDetalhe;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsTransportProviders, DmSys1.cdsTransportProvidersXApps]);
    DmSys.cdsTransportProviders.CommandText := 'SELECT '+ ccardTransportProviders +
         ' FROM TRANSPORTPROVIDERS TP where TP.TP_STATUS  = ''A'' ORDER BY TP_DESC';
    cdsLineMtTP.Close;
    cdsLineMtTP.Free;
    FrmTransportProviders := Nil;
    pnDireita.Visible:=false; lstParamDisp.OnDblClick:=nil;
end;

procedure TFrmTransportProviders.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsTransportProviders);
  SetActions([], False, FrmTransportProviders, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmTransportProviders, t_form_objects);
  dbPermis.SetFocus;
  SetLines;
  cbLineMt.Enabled := True;
  cbCardApps.Enabled := True;
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
  pcSubApplicationsChange(Self);
 // lbl_cargo.Caption:= 'Imprime Cargo Operador?';

end;

Procedure TFrmTransportProviders.BeforeUpdate;
Var
  vTP_ID : Integer;
Begin

 With dmSys do
   Begin
     IF (dtsMaster.DataSet.State = dsInsert) Then
        Begin

           // INSERE O VALOR DE TP_ID NA SEQUENCES CASO NÃO EXISTA
           With dmConexao Do Begin
              If cdsGeral.Active Then
                 cdsGeral.Close;

              cdsGeral.CommandText := 'SELECT SEQ_VALUE FROM SEQUENCES WHERE SEQ_NAME = ''TP_ID''';
              cdsGeral.Open;

              If cdsGeral.Eof Then Begin
                 Try
                    cdsGeral.Close;
                    cdsGeral.CommandText := 'SELECT MAX( TP_ID ) AS MAX_TP_ID FROM TRANSPORTPROVIDERS WHERE TP_ID <> 9999';
                    cdsGeral.Open;

                    vTP_ID := cdsGeral.FieldByName( 'MAX_TP_ID' ).AsInteger;

                    cdsGeral.Close;
                    cdsGeral.CommandText := 'INSERT INTO SEQUENCES ( SEQ_NAME, SEQ_CTRLNBR, SEQ_START, SEQ_END, SEQ_VALUE, SEQ_STATUS, SEQ_REGDATE, SEQ_REGUSER ) ' +
                                            '  VALUES ( ''TP_ID'', 1, 1, 9998, ' + IntToStr( vTP_ID ) + ', ''A'', :REG_DATE, ''PRODATA'' )';
                    cdsGeral.Params.ParamByName( 'REG_DATE' ).Value := FormatDate( DmConexao.ConnBrkMaster.AppServer.GetDBType, Now, False );
                    cdsGeral.Execute;
                 Except
                    On E: Exception Do
                       MessageDlg( 'Erro ao inserir TP_ID na tabela SEQUENCES:' + #13#10 + E.Message, mtError, [mbOk], 0 );
                 End;  // Try
              End;  // If cdsGeral...
           End;  // With

//          vTP_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('TRANSPORTPROVIDERS', 'TP_ID', 'False', '' );
          // DmConexao.ConnBrkMaster.AppServer.AutoIncremento_Seq( 'TP_ID', 'False', '' );
          vTP_ID  := 1; // É atribuído qualquer número pois a sequencia é feita no servidor de aplicação

          cdsTransportProviders.FieldByName( 'TP_ID' ).AsInteger := vTP_ID;

          cdsTransportProvidersXLineMT.First;
          While NOT cdsTransportProvidersXLineMT.Eof do
             Begin
               cdsTransportProvidersXLineMT.Edit;
               cdsTransportProvidersXLineMT.FieldByName('TP_ID').AsInteger := vTP_ID;
               cdsTransportProvidersXLineMT.Post;
//               cdsTransportProvidersXLineMT.Next;
             End;
          dmSys1.cdsTransportProvidersXApps.First;
          While NOT dmSys1.cdsTransportProvidersXApps.Eof do
             Begin
               dmSys1.cdsTransportProvidersXApps.Edit;
               dmSys1.cdsTransportProvidersXApps.FieldByName('TP_ID').AsInteger := vTP_ID;
               dmSys1.cdsTransportProvidersXApps.Post;
//               cdsTransportProvidersXLineMT.Next;
             End;

        End;
   End;
End;

Procedure TFrmTransportProviders.SetLines;
Begin
  With DmSys do
     Begin
        cbLineMt.Enabled := False;
        cbCardApps.Enabled := False;
        lbDisponiveis.DragMode  := dmManual;
        lbSelecionadas.DragMode := dmManual;
        cdsLineMtTP.First;
        lbSelecionadas.Items.Clear;
        lbDisponiveis.Items.Clear;

        While not cdsLineMtTP.eof do
           Begin
            IF  cdsTransportProvidersXLineMT.Locate('LM_ID', cdsLineMtTP.FieldByName('LM_ID').AsString, [])
                 Then lbSelecionadas.Items.AddObject(cdsLineMtTP.fieldByName('LM_DESCSHORT').AsString,
                                     TObject(cdsLineMtTP.fieldByName('LM_ID').AsInteger))
                 Else lbDisponiveis.Items.AddObject(cdsLineMtTP.fieldByName('LM_DESCSHORT').AsString,
                                     TObject(cdsLineMtTP.fieldByName('LM_ID').AsInteger));
               cdsLineMtTP.Next;
           End;
     End;
End;

procedure TFrmTransportProviders.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmTransportProviders, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmTransportProviders, t_form_objects);
  dbPermis.SetFocus;
  SetLines;
  cbLineMt.Enabled := True;
  cbCardApps.Enabled := True;
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
  pcSubApplicationsChange(Self);
  lbl_cargo.Caption:= 'Imprime Grupo de Cargos Operador?';
  RxDBComboBox1.DataField:='TP_PRINTPERSONNELFCTGROUP';

  if dmSys.cdsTransportProviders.FieldByName('TP_PRINTPERSONNELFCTGROUP').AsString='S' then
  RxDBComboBox1.ItemIndex:=0
  else
  RxDBComboBox1.ItemIndex:=1;
  

end;

procedure TFrmTransportProviders.actApplyUpdatesExecute(Sender: TObject);
Var
  sMandatoryDocs: TStrings;
begin

  sMandatoryDocs := TStringList.Create;
  sMandatoryDocs.AddStrings( DmBase.VerifyMandatoryDocParameter('PROVIDER') );

// Comentado por Daniel
//     if length(dbCNPJ.Text) = 14 then
//        dbCNPJ.Text := '0' + dbCNPJ.Text;


     IF Not ( CheckCGC(dbCNPJ.Text) ) And ( sMandatoryDocs.IndexOf( '8' ) > -1 ) Then  // ( sMandatoryDocs.IndexOf( '8' ) > -1 ): CNPJ Obrigatório
        Begin
         DisplayMsg(t_form_objects, '%T %T', [1576, 1504], []);
         dbCNPJ.SetFocus;
         Exit;
        End;

  FreeAndNil( sMandatoryDocs );

 inherited;
  If  status = stConsult Then
    BEGIN
    BeforeUpdate;
     If ApplyTablesSys([dbPermis, dbDesc, dbNameoncard], [DmSys.cdsTransportProviders,
                                                          DmSys.cdsTransportProvidersXLineMT,
                                                          DmSys1.cdsTransportProvidersXApps]) Then
         begin
          SetActions([], True, FrmTransportProviders, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmTransportProviders, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
  actLog.Enabled := True;
  
end;

procedure TFrmTransportProviders.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsTransportProviders.Cancel;
     DmSys.cdsTransportProvidersXLineMT.Cancel;

     DmSys1.cdsTransportProvidersXApps.CancelUpdates;
     DmSys.cdsTransportProvidersXLineMT.CancelUpdates;
     
     SetActions([], True, FrmTransportProviders, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmTransportProviders, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsTransportProviders.RecordCount > 0;
  
end;

procedure TFrmTransportProviders.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsTransportProviders.Edit;
         cdsTransportProviders.FieldByName('TP_STATUS').AsString := 'I';
         cdsTransportProviders.Post;
         cdsTransportProviders.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsTransportProviders.RecordCount > 0;
   
end;

procedure TFrmTransportProviders.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edTP_Permis.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TP_PERMIS =' + QuotedStr(edTP_Permis.Text) + ' AND ';
       end;

     If Trim(edCodigo.Text) <> '' Then
        Begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TP_ID =' + QuotedStr(edCodigo.Text) + ' AND ';
        End;

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TP_DESC LIKE' + QuotedStr(edDesc.Text+'%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' TP_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' TP_STATUS = ' + QuotedStr('I') + ' AND ';
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
//    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
//    lbFiltrado.Visible:=strWhere <> '';
      cdsTransportProviders.Close;
      cdsTransportProviders.CommandText := 'SELECT '+ ccardTransportProviders +' FROM TRANSPORTPROVIDERS TP ' + strWhere + strOrder; //'ORDER BY TP_DESC';
      cdsTransportProviders.Open;

      //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('TP_ID', 'FROM TRANSPORTPROVIDERS', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsTransportProviders.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := DmSys.cdsTransportProviders.RecordCount > 0;

end;

procedure TFrmTransportProviders.FormShow(Sender: TObject);
begin
  inherited;
    defOrder:=' ORDER BY TP_DESC ';
    strOrder:=defOrder;
    ct:='SELECT '+ ccardTransportProviders +' FROM TRANSPORTPROVIDERS TP %where% %order%';

    cdsLineMtTP := TClientDataSet.Create(Self);
    cdsLineMtTP.ConnectionBroker := DmSys.cdsLineMt.ConnectionBroker;
    cdsLineMtTP.ProviderName     := DmSys.cdsLineMt.ProviderName;
    cdsLineMtTP.CommandText      := 'SELECT LM.*, LM.LM_STATUS AS STATUS_ID FROM LINEMT LM '+
                                    'WHERE LM.LM_STATUS  = ''A'' ORDER BY LM.LM_DESCSHORT ';

    OpenTablesSys([DmSys.cdsTransportProviders,  DmSys1.cdsTransportProvidersXApps, DmSys.cdsTransportProvidersXLineMT, cdsLineMtTP,
                   DmSys.cdsApplicationsLook]);

    //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LG_ID', 'FROM LINEGROUPS', 'True', ' WHERE LG_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsTransportProviders.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    actLog.Enabled := DmSys.cdsTransportProviders.RecordCount > 0;
    SetLines;
    lbl_cargo.Caption:= 'Imprime Grupo de Cargos Operador?';
end;

procedure TFrmTransportProviders.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;

  SetLines;
  RxDBComboBox1.DataField:='TP_PRINTPERSONNELFCTGROUP';

  if dmSys.cdsTransportProviders.FieldByName('TP_PRINTPERSONNELFCTGROUP').AsString='S' then
  RxDBComboBox1.ItemIndex:=0
  else
  RxDBComboBox1.ItemIndex:=1;

end;

procedure TFrmTransportProviders.lbSelecionadasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmTransportProviders.lbDisponiveisDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmTransportProviders.lbSelecionadasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btnAddAllLineMt.Click;
end;

procedure TFrmTransportProviders.lbDisponiveisDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btnDelAllLineMt.Click;
end;

procedure TFrmTransportProviders.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  Application.ProcessMessages;
  SetLines;
  RxDBComboBox1.DataField:='TP_PRINTPERSONNELFCTGROUP';

  if dmSys.cdsTransportProviders.FieldByName('TP_PRINTPERSONNELFCTGROUP').AsString='S' then
  RxDBComboBox1.ItemIndex:=0
  else
  RxDBComboBox1.ItemIndex:=1;

end;

procedure TFrmTransportProviders.dbLkApplicationsCloseUp(Sender: TObject);
begin
  inherited;
   edApp.SetFocus;
   IF Trim(dbLkApplications.Text) <> '' Then
      Begin
         edApp.Text := dmSys.cdsApplicationsLook.FieldByName('APP_DESCSHORT').AsString +
                       '        -        '+
                       dmSys.cdsApplicationsLook.FieldByName('ISS_DESCLONG').AsString;
      End;
end;

procedure TFrmTransportProviders.pcSubApplicationsChange(Sender: TObject);
begin
  inherited;
  Case pcSubApplications.ActivePageIndex of
     0 : Begin
           SetActions([actEditDetail, actDeleteDetail], False, Self, t_form_objects);
           If (Status <> stConsult) and
              (DmSys.cdsTransportProvidersXLineMT.RecordCount > 0) Then
              SetActions([actEditDetail], True, Self, t_form_objects);
         End;

     1 : Begin
           SetActions([actEditDetail, actDeleteDetail], False, Self, t_form_objects);

           If (Status <> stConsult) and
              (dmSys1.cdsTransportProvidersXApps.RecordCount > 0) Then
              SetActions([actEditDetail, actDeleteDetail], True, Self, t_form_objects);
         End;

     2 : begin   //porra
          {SetActions([actEditDetail, actDeleteDetail], False, Self, t_form_objects);

           If (Status <> stConsult) and
              (dmSys1.cdsTransportProvidersXApps.RecordCount > 0) Then
              SetActions([actEditDetail, actDeleteDetail], True, Self, t_form_objects); }
          // Rotina_Configuracoes;
         end;
  End;
end;

procedure TFrmTransportProviders.pcSubApplicationsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
   AllowChange :=  (tbtnNewCardApp.Enabled);
end;

procedure TFrmTransportProviders.actNewDetailExecute(Sender: TObject);
begin
  inherited;
  if DmSys.cdsTransportProviders.State = dsInsert then
  begin
    DisplayMsg(t_form_objects, 'Antes de inserir esse registro, inclua a Empresa    ', [], []);
    exit;
  end;

  Case pcSubApplications.ActivePageIndex of
   0 : Begin
        SetActions([actApplyUpdates, actcancel], False, Self, t_form_objects);
        SetCategories([Detail], False, Self, t_form_objects);
        dbgLinhas.Visible    := False;
       End;

   1 : Begin
        dbgAppsXValidatorActions.Visible    := False;
        DmSys1.cdsTransportProvidersXApps.Insert;
        edApp.Text := '';
        SetActions([actApplyUpdates, actcancel], False, Self, t_form_objects);
        SetCategories([Detail], False, Self, t_form_objects);
       End;
   End;
end;

procedure TFrmTransportProviders.actEditDetailExecute(Sender: TObject);
  procedure SetApp;
   Var Str : String;
  Begin
     DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([DmSys1.cdsTransportProvidersXApps.FieldByName('APP_ID').AsInteger,
                                                                   DmSys1.cdsTransportProvidersXApps.FieldByName('ISS_ID').AsInteger]), [] );

     Str :=  dmSys1.cdsTransportProvidersXApps.FieldByName('APP_DESCSHORT').AsString +
             '        -        '+
             dmSys1.cdsTransportProvidersXApps.FieldByName('ISS_DESCLONG').AsString;
     If Trim(Str) = '-' Then
        Str := '';
      edApp.Text := Str;

  End;
begin
  inherited;

  Case pcSubApplications.ActivePageIndex of
   0 : Begin
        SetActions([actApplyUpdates, actcancel], False, Self, t_form_objects);
        SetCategories([Detail], False, Self, t_form_objects);
        dbgLinhas.Visible    := False;
       End;

   1 : Begin
        dbgAppsXValidatorActions.Visible := False;
        SetApp;
        DmSys1.cdsTransportProvidersXApps.Edit;

        SetActions([actApplyUpdates, actcancel], False, Self, t_form_objects);
        SetCategories([Detail], False, Self, t_form_objects);
       End;
   2 : Begin // cidel+ SU-50158
       pnDireita.Visible:=true; lstParamDisp.OnDblClick:=btnAddParameterClick;
       pnDireita.Visible:=true;
       End;
  End;
end;

procedure TFrmTransportProviders.actDeleteDetailExecute(Sender: TObject);
begin
  inherited;
   DmSys1.cdsTransportProvidersXApps.Edit;
   DmSys1.cdsTransportProvidersXApps.FieldByName('TPAPP_STATUS').AsString := 'I';
   DmSys1.cdsTransportProvidersXApps.FieldByName('STATUS_ID').AsString    := 'I';
   DmSys1.cdsTransportProvidersXApps.Post;
end;

procedure TFrmTransportProviders.actOkLineExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actcancel, actNewDetail, actEditDetail], True, Self, t_form_objects);
   dbgLinhas.Visible := True;
end;

procedure TFrmTransportProviders.actCancelLineExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actcancel, actNewDetail, actEditDetail], True, Self, t_form_objects);
   dbgLinhas.Visible := True;
end;

procedure TFrmTransportProviders.actAddAllLineExecute(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  For I := 0 To lbDisponiveis.Count - 1 do
    Begin
      DMSYS.cdsTransportProvidersXLineMT.Append;
      DMSYS.cdsTransportProvidersXLineMT.FieldByName('TP_ID').AsInteger   := DMSYS.cdsTransportProviders.fieldByName('TP_ID').AsInteger;
      DMSYS.cdsTransportProvidersXLineMT.FieldByName('LM_ID').AsInteger   := Integer(lbDisponiveis.items.Objects[I]);
      DMSYS.cdsTransportProvidersXLineMT.FieldByName('LM_DESCSHORT').AsString  := lbDisponiveis.Items.Strings[I];
      DMSYS.cdsTransportProvidersXLineMT.FieldByName('TPLM_STATUS').AsString  := 'A';
      DMSYS.cdsTransportProvidersXLineMT.FieldByName('STATUS_ID').AsString    := 'A';
      DMSYS.cdsTransportProvidersXLineMT.FieldByName('TPLM_BUSQTY').AsInteger := 0;
      DMSYS.cdsTransportProvidersXLineMT.FieldByName('TPLM_SEQNBR').AsInteger := 1;
      DMSYS.cdsTransportProvidersXLineMT.Post;

     lbSelecionadas.Items.AddObject(lbDisponiveis.Items.Strings[I],
                                    lbDisponiveis.items.Objects[I]);

    End;

    lbDisponiveis.SelectAll;
    lbDisponiveis.DeleteSelected;

end;

procedure TFrmTransportProviders.actAddLineExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
  For I := 0 to lbDisponiveis.Count - 1 do
      IF lbDisponiveis.Selected[I] Then
         Begin
            DMSYS.cdsTransportProvidersXLineMT.Append;
            DMSYS.cdsTransportProvidersXLineMT.FieldByName('TP_ID'       ).AsInteger := DMSYS.cdsTransportProviders.fieldByName('TP_ID').AsInteger;
            DMSYS.cdsTransportProvidersXLineMT.FieldByName('LM_ID'       ).AsInteger := Integer(lbDisponiveis.items.Objects[I]);
            DMSYS.cdsTransportProvidersXLineMT.FieldByName('LM_DESCSHORT').AsString  := lbDisponiveis.Items.Strings[I];
            DMSYS.cdsTransportProvidersXLineMT.FieldByName('TPLM_STATUS' ).AsString  := 'A';
            DMSYS.cdsTransportProvidersXLineMT.FieldByName('STATUS_ID'   ).AsString  := 'A';
            DMSYS.cdsTransportProvidersXLineMT.FieldByName('TPLM_BUSQTY' ).AsInteger := 0;
            DMSYS.cdsTransportProvidersXLineMT.FieldByName('TPLM_SEQNBR' ).AsInteger := 1;
            DMSYS.cdsTransportProvidersXLineMT.Post;
         End;

  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmTransportProviders.actDelLineExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
  For I := 0 to lbSelecionadas.Count - 1 do
      IF lbSelecionadas.Selected[I] Then
         Begin
            IF DMSYS.cdsTransportProvidersXLineMT.Locate('TP_ID;LM_ID',
               VarArrayOf([DMSYS.cdsTransportProviders.fieldByName('TP_ID').AsInteger,
               Integer(lbSelecionadas.items.Objects[I])]), [])
            Then
               DMSYS.cdsTransportProvidersXLineMT.Delete;
         End;
 lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmTransportProviders.actDelAllLineExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;

  For I := 0 to lbSelecionadas.Count - 1 do
     Begin
        IF DMSYS.cdsTransportProvidersXLineMT.Locate('TP_ID;LM_ID',
           VarArrayOf([DMSYS.cdsTransportProviders.fieldByName('TP_ID').AsInteger,
           Integer(lbSelecionadas.items.Objects[I])]), [])
        Then
           DMSYS.cdsTransportProvidersXLineMT.Delete;


       lbDisponiveis.Items.AddObject(lbSelecionadas.Items.Strings[I],
                                     lbSelecionadas.items.Objects[I]);
     End;

    lbSelecionadas.SelectAll;
    lbSelecionadas.DeleteSelected;


end;

procedure TFrmTransportProviders.actOkAppExecute(Sender: TObject);
begin
  inherited;
  With DmSys1 do
   Begin
    If dbLkApplications.KeyValue = Null Then
      Begin
         DisplayMsg(t_form_objects, '%T %T', [1506, 1522 ], []);
         dbLkApplications.SetFocus;
      End
    Else
     Begin
     Try
       cdsTransportProvidersXApps.FieldByName('APP_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_ID').AsString;
       cdsTransportProvidersXApps.FieldByName('ISS_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('ISS_ID').AsString;
       cdsTransportProvidersXApps.FieldByName('APP_DESCSHORT').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
       cdsTransportProvidersXApps.FieldByName('ISS_DESCLONG').AsString  := DmSys.cdsApplicationsLook.fieldByName('ISS_DESCLONG').AsString;
       cdsTransportProvidersXApps.FieldByName('TPAPP_STATUS').AsString  := 'A';
       cdsTransportProvidersXApps.FieldByName('STATUS_ID').AsString     := 'A';

       cdsTransportProvidersXApps.Post;
       dbgAppsXValidatorActions.Visible := True;

     Except
       DisplayMsg(t_form_objects, '%T %T', [1522, 2827], [], mtInformation, [mbOK]);
       dbLkApplications.SetFocus;
       Exit;
     End;

     SetActions([actApplyUpdates, actcancel], True, Self, t_form_objects);
     SetCategories([Detail], True, Self, t_form_objects);
     End;
  End;
end;

procedure TFrmTransportProviders.actCancelAppExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], True, Self, t_form_objects);
   SetActions([actDeleteDetail], NOT (dmSys1.cdsTransportProvidersXApps.RecordCount = 0), Self, t_form_objects);

   DmSys1.cdsTransportProvidersXApps.Cancel;
   dbgAppsXValidatorActions.Visible := True;
end;

procedure TFrmTransportProviders.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys.cdsTransportProviders;
lbl_cargo.Caption:= 'Imprime Grupo de Cargos Operador?';
end;

procedure TFrmTransportProviders.dbCNPJChange(Sender: TObject);
begin
  inherited;
    dbCNPJ.Text := ValidateValues(dbCNPJ.Text);
end;

procedure TFrmTransportProviders.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '10';
  FrmSystemLog.pSLG_ID := DmSys.cdsTransportProviders.FieldByName('TP_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TFrmTransportProviders.SetParameters;
begin
  with  dmSys, dmSys1 do
  begin
    if FrmTransportProviders <> nil then
    begin
      lstParamDisp.DragMode := dmManual;
      lstParamSet.DragMode  := dmManual;
      lstParamDisp.Clear;
      lstParamSet.Clear;

//      cdsInfoParameters.First;
      cdsInfoParameters.Open;
//      cdsTransportProvidersXInfoParameters.First;
      cdsTransportProvidersXInfoParameters.Open;

      while not cdsInfoParameters.Eof do  //porra
      begin
        if cdsTransportProvidersXInfoParameters.FieldByName('IP_ID').AsInteger = cdsInfoParameters.FieldByName('IP_ID').AsInteger
        then lbSelecionadas.Items.AddObject(cdsLineMt.fieldByName('LM_ID').AsString+#9+cdsLineMt.fieldByName('LM_DESCSHORT').AsString,
                                           TObject(cdsLineMt.fieldByName('LM_ID').AsInteger))
        else lbDisponiveis.Items.AddObject(cdsLineMt.fieldByName('LM_ID').AsString+#9+cdsLineMt.fieldByName('LM_DESCSHORT').AsString,
                                           TObject(cdsLineMt.fieldByName('LM_ID').AsInteger));
        cdsLineMt.Next;
        //cdsInfoParameters.Next;
      end;

    end;
  end; //With...
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
// cidel+ SU-50158 Rotinas novas até o final
procedure TFrmTransportProviders.Rotina_Configuracoes;
begin
Cursor:=crHourGlass;
lstParamDisp.Clear;
lstParamSet.Clear;
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='select IP_ID, IP_DESC from INFOPARAMETERS where IP_STATUS = ''A'' order by IP_DESC';
   cdsGeral.Open;
   WHILE not cdsGeral.EOF
   DO BEGIN
      lstParamDisp.Items.AddObject(cdsGeral.fieldByName('IP_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('IP_ID').AsInteger));
      cdsGeral.Next;
      END;

   cdsGeral.Close;
   cdsGeral.CommandText:='select TPXIP.IP_ID as ID, IP.IP_DESC as AA '+
                         'from TRANSPORTPROVIDERSXINFOPARAM TPXIP '+
                         'INNER JOIN INFOPARAMETERS IP ON TPXIP.IP_ID = IP.IP_ID '+
                         'WHERE TPXIP.TP_ID = '+dbTp_id.Text+' '+
                         'order by AA';
   cdsGeral.Open;
   WHILE not cdsGeral.EOF
   DO BEGIN
      lstParamSet.Items.AddObject(cdsGeral.fieldByName('AA').AsString,
                                           TObject(cdsGeral.fieldByName('ID').AsInteger));
      cdsGeral.Next;
      END;
   END;
Cursor:=crDefault;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.btnAllParametersClick(Sender: TObject);
begin
  inherited;
lstParamSet.SelectAll;
lstParamSet.DeleteSelected;
lstParamSet.Items.Assign(lstParamDisp.Items);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.btnDelParameterClick(Sender: TObject);
begin
  inherited;
  IF lstParamSet.ItemIndex > -1 THEN lstParamSet.DeleteSelected;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.dbTp_idChange(Sender: TObject);
begin
  inherited;
  IF dbTp_id.Text <> '' THEN Rotina_Configuracoes;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.btnNoneParametersClick(Sender: TObject);
begin
  inherited;
  lstParamSet.SelectAll;
  lstParamSet.DeleteSelected;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.btnAddParameterClick(Sender: TObject);
Var i,j: Integer; existe: Boolean;
begin
  inherited;
  FOR i:=0 to lstParamDisp.Items.Count-1
  DO IF lstParamDisp.Selected[i]
     THEN BEGIN
          existe:=false;
          FOR j:=0 to lstParamSet.Items.Count-1
          DO IF Integer(lstParamDisp.Items.Objects[i]) =
                Integer(lstParamSet.Items.Objects[j]) THEN existe:=true;
          IF not Existe
          THEN lstParamSet.Items.AddObject(lstParamDisp.Items[i],
                           TObject(lstParamDisp.Items.Objects[i]));
          END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.grdResultadoCellClick(Column: TColumn);
begin grdResultadoDblClick(Self); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.btnCancelarClick(Sender: TObject);
begin
//pcBaseCadastro.ActivePageIndex:=0;
pnDireita.Visible:=false; lstParamDisp.OnDblClick:=nil;
Rotina_Configuracoes;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.btnOKClick(Sender: TObject);
Var i: Integer; S,ipID: String;
begin

WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='delete from TRANSPORTPROVIDERSXINFOPARAM '+
                         'where TP_ID = '+dbTp_id.Text;
   cdsGeral.Execute;
   END;

FOR i:=0 to lstParamSet.Items.Count-1 DO
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   ipID:=IntToStr(Integer(lstParamSet.Items.Objects[i]));
   cdsGeral.CommandText:='select * from INFOPARAMETERS where IP_ID = '+ipID;
   cdsGeral.Open;
   S:='(select max(TPXIP_ID)+1 from TRANSPORTPROVIDERSXINFOPARAM), '+
      dbTp_id.Text+', '+ipID+', '+'''A'', SYSDATE, '+
      ''''+cdsGeral.FieldByName('IP_REGUSER').AsString+'''';
   //ShowMessage(S);
   cdsGeral.Close;
   cdsGeral.CommandText:='insert into TRANSPORTPROVIDERSXINFOPARAM values ('+S+')';
   cdsGeral.Execute;
   END;

btnCancelarClick(Sender);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.btnDetalheClick(Sender: TObject);
Var i: Integer; S: String;
begin
  inherited;
  S:='';
  FOR i:=0 to lstParamDisp.Items.Count-1
  DO IF lstParamDisp.Selected[i]
     THEN S:=S+','+IntToStr(Integer(lstParamDisp.Items.Objects[i]));
  IF S = ''
  THEN BEGIN
       ShowMessage('Falta selecionar um Item no "Parâmetros Disponíveis"');
       Exit;
       END
  ELSE Delete(S,1,1);
  frmDetalhe.ipID:=S;
  frmDetalhe.ShowModal;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.FormKeyPress(Sender: TObject;
  var Key: Char); begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmTransportProviders.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
procedure TFrmTransportProviders.Entra(Sender: TObject);
begin FM_Entra(Sender); end;
procedure TFrmTransportProviders.Sai(Sender: TObject);
begin FM_Sai(Sender); end;
procedure TFrmTransportProviders.soNumero(Sender: TObject;
  var Key: Char);
begin If ((Ord(Key) < 48)OR(Ord(Key) > 57)) AND(Ord(Key) <> 8) Then abort; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTransportProviders.lbFiltradoClick(Sender: TObject);
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
procedure TFrmTransportProviders.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
