unit uProviders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxLookup, RxDBComb,
  Buttons;

type
  TFrmProviders = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label2: TLabel;
    dbDesc: TDBEdit;
    dbShotDesc: TDBEdit;
    dbPrv_Code: TDBEdit;
    dbLongDesc: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit23: TDBEdit;
    dbCardUsersStatus: TRxDBComboBox;
    DBEdit17: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit22: TDBEdit;
    edDesc: TEdit;
    Label24: TLabel;
    edAdress: TEdit;
    edTel: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    lkFilterStatus: TComboBox;
    pcSubApplications: TPageControl;
    TabSheet1: TTabSheet;
    lExpperiod: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    btDisplayCancel: TSpeedButton;
    btDisplayOK: TSpeedButton;
    dbExpperiod: TDBEdit;
    dbStatus: TRxDBComboBox;
    dbgTipoProvedores: TDBGrid;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    dbProviderTypes: TRxDBLookupCombo;
    dbProviderSubTypes: TRxDBLookupCombo;
    Label32: TLabel;
    pcDetails: TPageControl;
    tsDetailsDocuments: TTabSheet;
    cbDocuments: TCoolBar;
    tbDocuments: TToolBar;
    tbtnNewDocument: TToolButton;
    tbtnEditDocument: TToolButton;
    tbtnDelDocument: TToolButton;
    nbDocuments: TNotebook;
    dbgProviderDocuments: TDBGrid;
    lblIdentificationTypes: TLabel;
    lblIndentificationNbr: TLabel;
    btnDocOk: TSpeedButton;
    btnDocCancel: TSpeedButton;
    dbIdentificationTypes: TDBLookupComboBox;
    dbIdentificationNbr: TDBEdit;
    tsDetailsAddress: TTabSheet;
    cbAddress: TCoolBar;
    tbAddress: TToolBar;
    tbtnNewAddress: TToolButton;
    tbtnEditAddress: TToolButton;
    tbtnDelAddress: TToolButton;
    nbAddress: TNotebook;
    grdAddress: TDBGrid;
    lblAddNum: TLabel;
    lblAddComp: TLabel;
    lblStates: TLabel;
    lblCities: TLabel;
    lblDistricts: TLabel;
    lblCep: TLabel;
    btnAddrOk: TSpeedButton;
    btnAddrCancel: TSpeedButton;
    dbLogrType: TDBLookupComboBox;
    dbAddress: TDBEdit;
    dbAddNum: TDBEdit;
    dbAddComp: TDBEdit;
    dbStates: TDBLookupComboBox;
    dbCities: TDBEdit;
    dbDistrict: TDBEdit;
    dbZip: TDBEdit;
    dbAddressTypes: TDBLookupComboBox;
    tsDetailsTelephone: TTabSheet;
    cbTelephones: TCoolBar;
    tbTelephones: TToolBar;
    tbtnNewTelephone: TToolButton;
    tbtnEditTelephone: TToolButton;
    tbtnDelTelephone: TToolButton;
    nbTelephones: TNotebook;
    grdTelephones: TDBGrid;
    lblAreaCode: TLabel;
    lblTelTypes: TLabel;
    lblTelephone: TLabel;
    lblTelComp: TLabel;
    btnTelOk: TSpeedButton;
    btnTelCancel: TSpeedButton;
    dbAreaCode: TDBEdit;
    dbTelephoneTypes: TDBLookupComboBox;
    dbTelephone: TDBEdit;
    dbTelComp: TDBEdit;
    tsDetailsEmail: TTabSheet;
    cbEMails: TCoolBar;
    tbEMails: TToolBar;
    tbtnNewEmail: TToolButton;
    tbtnEditEMail: TToolButton;
    tbtnDelEMail: TToolButton;
    nbEmails: TNotebook;
    grdEMails: TDBGrid;
    lblAccount: TLabel;
    lblEmailType: TLabel;
    btnEmailOk: TSpeedButton;
    btnEmailCancel: TSpeedButton;
    dbAccount: TDBEdit;
    dbEmailTypes: TDBLookupComboBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFilterExecute(Sender: TObject);
    procedure tbtnNewCardAppClick(Sender: TObject);
    procedure btDisplayCancelClick(Sender: TObject);
    procedure btDisplayOKClick(Sender: TObject);
    procedure tbtnEditCardAppClick(Sender: TObject);
    procedure tbtnDeletePeriodClick(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure tbtnNewDocumentClick(Sender: TObject);
    procedure btnDocCancelClick(Sender: TObject);
    procedure btnDocOkClick(Sender: TObject);
    procedure tbtnNewAddressClick(Sender: TObject);
    procedure btnAddrCancelClick(Sender: TObject);
    procedure btnAddrOkClick(Sender: TObject);
    procedure tbtnNewTelephoneClick(Sender: TObject);
    procedure btnTelCancelClick(Sender: TObject);
    procedure btnTelOkClick(Sender: TObject);
    procedure btnEmailCancelClick(Sender: TObject);
    procedure btnEmailOkClick(Sender: TObject);
    procedure tbtnNewEmailClick(Sender: TObject);
    procedure tbtnEditDocumentClick(Sender: TObject);
    procedure tbtnDelDocumentClick(Sender: TObject);
    procedure tbtnDelAddressClick(Sender: TObject);
    procedure tbtnDelTelephoneClick(Sender: TObject);
    procedure tbtnDelEMailClick(Sender: TObject);
    procedure tbtnEditAddressClick(Sender: TObject);
    procedure tbtnEditTelephoneClick(Sender: TObject);
    procedure tbtnEditEMailClick(Sender: TObject);
  private
     vPrvDoc_SeqNbr,
     vPrvAdd_SeqNbr,
     vPrvTel_SeqNbr,
     vPrvEmt_SeqNbr : Boolean;
     PrvDoc_SeqNbr,
     PrvAdd_SeqNbr,
     PrvTel_SeqNbr,
     PrvEmt_SeqNbr : Integer;
     Procedure BeforePost;
     Procedure SetDT(Status : Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProviders: TFrmProviders;

implementation

uses uDmSys, uDmSys1, uDmBase, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmLineMT;

{$R *.dfm}

procedure TFrmProviders.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmBase.cdsIdentificationTypes, DmBase.cdsCities,
                   DmBase.cdsDistricts, DmBase.cdsStates, DmBase.cdsZip,  DmSys.cdsProviders, dmSys.cdsProvidersxProviderTypes, dmSys.cdsProviderSubTypes,
                   dmSys.cdsProviderTypes, dmSys1.cdsProviderDocuments, dmSys1.cdsDocumentTypes,
                   dmSys1.cdsProviderAddresses, DmBase.cdsStates, dmSys1.cdsAddressTypes, DmBase.cdsLogrTypes,
                   dmSys1.cdsProviderTelephones, dmSys1.cdsTelephoneTypes, dmSys1.cdsProviderEmails, dmSys1.cdsEmailTypes ]);
    dmSys.cdsProvidersxProviderTypes.close;
    dmSys.cdsProvidersxProviderTypes.Open;
    vPrvDoc_SeqNbr := True;
    vPrvAdd_SeqNbr := True;
    vPrvTel_SeqNbr := True;
    vPrvEmt_SeqNbr := True;
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('PRV_ID', 'FROM PROVIDERS', 'True', ' WHERE PRV_STATUS = ''A'' ') ) + ' Registro(s)';
end;

Procedure TFrmProviders.SetDT(Status : Boolean);
Begin
 tbtnNewCardApp.Enabled   := Status;
 tbtnEditCardApp.Enabled  := Status;
 tbtnDeletePeriod.Enabled := Status;

 If dmSys.cdsProvidersxProviderTypes.RecordCount < 1 Then
  Begin
    tbtnEditCardApp.Enabled  := False;
    tbtnDeletePeriod.Enabled := False;
   End;
End;

procedure TFrmProviders.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsProviders);
  SetActions([], False, FrmProviders);
  SetActions([actApplyUpdates, actCancel], true, FrmProviders);
  dbDesc.SetFocus;
  SetDT(True);
end;

procedure TFrmProviders.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmProviders);
  SetActions([actApplyUpdates, actCancel], true, FrmProviders);
  dbDesc.SetFocus;
  SetDT(True);
end;

Procedure TFrmProviders.BeforePost;
Var
 vPrv_ID : Integer;
Begin
  vPrv_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('PROVIDERS', 'PRV_ID', 'False', '' );

  If DmSys.cdsProviders.FieldByName('PRV_CODE').Value = NULL Then
     DmSys.cdsProviders.FieldByName('PRV_CODE').Value := vPrv_ID;

  dmSys.cdsProvidersxProviderTypes.First;

  While not dmSys.cdsProvidersxProviderTypes.Eof do
     Begin
       DmSys.cdsProvidersxProviderTypes.Edit;
       DmSys.cdsProvidersxProviderTypes.FieldByName('PRV_ID').Value := vPrv_ID;
       DmSys.cdsProvidersxProviderTypes.Post;
     End;

End;

procedure TFrmProviders.actApplyUpdatesExecute(Sender: TObject);
begin
  If dmSys.cdsProvidersxProviderTypes.RecordCount = 0 Then
     DisplayMsg(t_form_objects, '%T', [2806], [], mtInformation, [mbOK])
  Else
  Begin

    If Status = stInsert
       Then BeforePost;

    DmSys.cdsProviders.FieldByName('PRV_ADDRESS').AsString := '..';

    ApplyTablesSys([dbDesc, dbShotDesc, dbLongDesc], DmSys.cdsProviders);
    IF status = stConsult then
      Begin
        dmSys.cdsProvidersxProviderTypes.ApplyUpdates(-1);
        dmSys1.cdsProviderDocuments.ApplyUpdates(-1);
        DmSys1.cdsProviderAddresses.ApplyUpdates(-1);
        DmSys1.cdsProviderTelephones.ApplyUpdates(-1);
        DmSys1.cdsProviderEmails.ApplyUpdates(-1);
        SetActions([], True, FrmProviders);
        SetActions([actApplyUpdates, actCancel], False, FrmProviders);
        vPrvDoc_SeqNbr := True;
        vPrvAdd_SeqNbr := True;
        vPrvTel_SeqNbr := True;
        vPrvEmt_SeqNbr := True;
        tbtnRefresh.Click;
        SetDT(False);
        DMSYS.cdsProvidersxProviderTypes.Close;
        DMSYS.cdsProvidersxProviderTypes.Open;
      End;
  End;
end;

procedure TFrmProviders.actCancelExecute(Sender: TObject);
begin
  if MessageDlg(cCancel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
     dmSys.cdsProviders.Cancel;
     dmSys1.cdsProviderDocuments.Cancel;
     DmSys1.cdsProviderAddresses.Cancel;
     SetActions([], True, FrmProviders);
     SetActions([actApplyUpdates, actCancel], False, FrmProviders);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     SetDT(False);
     vPrvDoc_SeqNbr := True;
     vPrvAdd_SeqNbr := True;
     vPrvTel_SeqNbr := True;
     vPrvEmt_SeqNbr := True;
    end;
end;

procedure TFrmProviders.actDeleteExecute(Sender: TObject);
begin
 if MessageDlg(cDelete, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

     with DmSys do
        Begin
         cdsProviders.Edit;
         cdsProviders.FieldByName('PRV_STATUS').AsString := 'I';
         cdsProviders.Post;
         cdsProviders.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

end;

procedure TFrmProviders.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsProviders, DmBase.cdsIdentificationTypes, DmBase.cdsCities,
                   DmBase.cdsDistricts, DmBase.cdsStates, DmBase.cdsZip]);
    DmSys.cdsProviders.CommandText := 'SELECT '+ ccardProviders +' FROM PROVIDERS PRV WHERE PRV_STATUS = ''A'' ORDER BY PRV_DESC';
    FrmProviders := Nil;
end;

procedure TFrmProviders.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edAdress.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRV_ADDRESS LIKE' + QuotedStr(edAdress.Text+'%') + ' AND ';
       end;

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRV_DESC LIKE' + QuotedStr(edDesc.Text+'%') + ' AND ';
       end;

     If Trim(edTel.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRV_TEL LIKE' + QuotedStr(edTel.Text+'%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' PRV_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' PRV_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsProviders.Close;
      cdsProviders.CommandText := 'SELECT '+ ccardProviders +' FROM PROVIDERS PRV ' + strWhere + 'ORDER BY PRV_DESC';
      cdsProviders.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('PRV_ID', 'FROM PROVIDERS', 'True', strWhere) ) + ' Registro(s)';
    end

end;

procedure TFrmProviders.tbtnNewCardAppClick(Sender: TObject);
begin
  inherited;
   tbtnApply.Enabled := False;
   tbtnCancel.Enabled := False;
   dbgTipoProvedores.Visible := False;
   ActionInsertSys(dmSys.cdsProvidersxProviderTypes);
end;

procedure TFrmProviders.btDisplayCancelClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DMSYS.cdsProvidersxProviderTypes.Cancel;
  dbgTipoProvedores.Visible := True;
end;

procedure TFrmProviders.btDisplayOKClick(Sender: TObject);
begin
  inherited;
  If dbProviderTypes.KeyValue = null Then
     Begin

       DisplayMsg(t_form_objects, '%T', [2807], [], mtInformation, [mbOK]);
       dbProviderTypes.SetFocus;
     End
  Else
  If (dbProviderTypes.KeyValue = 1)  and
     (dbProviderSubTypes.KeyValue = null) Then
     Begin
       DisplayMsg(t_form_objects, '%T', [2808], [], mtInformation, [mbOK]);
       dbProviderSubTypes.SetFocus;
     End
  Else
  If Trim(dbExpperiod.Text) = '' Then
     Begin
       DisplayMsg(t_form_objects, '%S %T', [1500], [lExpperiod.Caption], mtInformation, [mbOK]);
       dbExpperiod.SetFocus;
     End
  Else
  Begin
  If DMSYS.cdsProvidersxProviderTypes.State = dsInsert Then
     Begin
      DMSYS.cdsGeral.Close;
      DMSYS.cdsGeral.CommandText := 'select * from ProvidersxProviderTypes where PRV_ID = :PRV_ID '+
      'AND PRVT_CODE = :PRVT_CODE';
      DMSYS.cdsGeral.Params.ParamByName('PRV_ID').Value     := DMSYS.cdsProviders.FieldByName('PRV_ID').Value;
      DMSYS.cdsGeral.Params.ParamByName('PRVT_CODE').Value  := dbProviderTypes.KeyValue;
      DMSYS.cdsGeral.Open;
      If DMSYS.cdsGeral.RecordCount > 0 Then
         Begin
           Application.MessageBox('Tipo de Provedor já cadastrado.', 'Aviso ao usuário', MB_OK+MB_ICONWARNING);
           dbProviderTypes.setfocus;
           Exit;
         End;
     End;

    DMSYS.cdsProvidersxProviderTypes.FieldByName('PRV_ID').Value        := DMSYS.cdsProviders.FieldByName('PRV_ID').Value;
    DMSYS.cdsProvidersxProviderTypes.FieldByName('PRVT_DESC').AsString  := dbProviderTypes.Text;
    DMSYS.cdsProvidersxProviderTypes.FieldByName('PRVST_DESC').AsString := dbProviderSubTypes.Text;
    DMSYS.cdsProvidersxProviderTypes.Post;
    tbtnApply.Enabled := True;
    tbtnCancel.Enabled := True;
    dbgTipoProvedores.Visible := True;
  End;
end;

procedure TFrmProviders.tbtnEditCardAppClick(Sender: TObject);
begin
  inherited;
   tbtnApply.Enabled := False;
   tbtnCancel.Enabled := False;
   dbgTipoProvedores.Visible := False;
   dmSys.cdsProvidersxProviderTypes.Edit;
end;

procedure TFrmProviders.tbtnDeletePeriodClick(Sender: TObject);
begin
  inherited;
   dmSys.cdsProvidersxProviderTypes.Edit;
   dmSys.cdsProvidersxProviderTypes.FieldByName('PRVPRVT_STATUS').AsString := 'I';
   dmSys.cdsProvidersxProviderTypes.FieldByName('STATUS_ID').AsString      := 'I';
   dmSys.cdsProvidersxProviderTypes.Post;
end;

procedure TFrmProviders.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
SetDT(False);
end;

procedure TFrmProviders.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetDT(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmLineMT);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmLineMT);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

end;

procedure TFrmProviders.tbtnNewDocumentClick(Sender: TObject);
begin
  inherited;
  with dmSys1 do
    begin
      cdsProviderDocuments.Append;
//      cdsProviderDocuments.FieldByName('PRV_ID').AsInteger        :=
      if vPrvDoc_SeqNbr then
        begin
          cdsProviderDocuments.FieldByName('PRVDOC_SEQNBR').AsInteger := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('PROVIDERDOCUMENTS', 'PRVDOC_SEQNBR', 'True',
                                                                     'PRV_ID = ' + dmSys.cdsProviders.FieldByName('PRV_ID').AsString );
          PrvDoc_SeqNbr  := cdsProviderDocuments.FieldByName('PRVDOC_SEQNBR').AsInteger;
          vPrvDoc_SeqNbr := False;
        end
      else
        begin
          PrvDoc_SeqNbr := PrvDoc_SeqNbr + 1;
          cdsProviderDocuments.FieldByName('PRVDOC_SEQNBR').AsInteger := PrvDoc_SeqNbr;
        end;

      cdsProviderDocuments.FieldByName('PRVDOC_STATUS').AsString  := 'A';
      cdsProviderDocuments.FieldByName('STATUS_ID').AsString      := 'A';
    end;


   tbtnApply.Enabled := False;
   tbtnCancel.Enabled := False;
   nbDocuments.PageIndex := 1;
// ActionInsertSys(dmSys.cdsProvidersxProviderTypes);
end;

procedure TFrmProviders.btnDocCancelClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DMSYS1.cdsProviderDocuments.Cancel;
  nbDocuments.PageIndex := 0;

end;

procedure TFrmProviders.btnDocOkClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DMSYS1.cdsProviderDocuments.FieldByName('DT_DESC').AsString := dmSys1.cdsDocumentTypes.fieldByName('DT_DESC').asString;
  DMSYS1.cdsProviderDocuments.Post;
  nbDocuments.PageIndex := 0;
end;

procedure TFrmProviders.tbtnNewAddressClick(Sender: TObject);
begin
  inherited;
  with dmSys1 do
    begin
      cdsProviderAddresses.Append;
//      cdsProviderDocuments.FieldByName('PRV_ID').AsInteger        :=
      if vPrvAdd_SeqNbr then
        begin
          cdsProviderAddresses.FieldByName('PRVADD_SEQNBR').AsInteger := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('PROVIDERADDRESSES', 'PRVADD_SEQNBR', 'True',
                                                                     'PRV_ID = ' + dmSys.cdsProviders.FieldByName('PRV_ID').AsString );
          PrvAdd_SeqNbr  := cdsProviderAddresses.FieldByName('PRVADD_SEQNBR').AsInteger;
          vPrvAdd_SeqNbr := False;
        end
      else
        begin
          PrvAdd_SeqNbr := PrvAdd_SeqNbr + 1;
          cdsProviderAddresses.FieldByName('PRVADD_SEQNBR').AsInteger := PrvAdd_SeqNbr;
        end;

      cdsProviderAddresses.FieldByName('PRVADD_STATUS').AsString  := 'A';
      cdsProviderAddresses.FieldByName('STATUS_ID').AsString      := 'A';
    end;


   tbtnApply.Enabled := False;
   tbtnCancel.Enabled := False;
   nbAddress.PageIndex := 1;
// ActionInsertSys(dmSys.cdsProvidersxProviderTypes);
end;

procedure TFrmProviders.btnAddrCancelClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DmSys1.cdsProviderAddresses.Cancel;
  nbAddress.PageIndex := 0;
end;

procedure TFrmProviders.btnAddrOkClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DmSys1.cdsProviderAddresses.FieldByName('AT_SHORTDESC').AsString := dmSys1.cdsAddressTypes.fieldByName('AT_SHORTDESC').asString;
//  DmSys1.cdsProviderAddresses.FieldByName('AT_DESC').AsString := DmBase.dtsLogrTypes.fieldByName('AT_DESC').asString;
  DmSys1.cdsProviderAddresses.Post;
  nbAddress.PageIndex := 0;
end;

procedure TFrmProviders.tbtnNewTelephoneClick(Sender: TObject);
begin
  inherited;
  with dmSys1 do
    begin
      cdsProviderTelephones.Append;
//      cdsProviderDocuments.FieldByName('PRV_ID').AsInteger        :=
      if vPrvTel_SeqNbr then
        begin
          cdsProviderTelephones.FieldByName('PRVTEL_SEQNBR').AsInteger := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('PROVIDERTELEPHONES', 'PRVTEL_SEQNBR', 'True',
                                                                     'PRV_ID = ' + dmSys.cdsProviders.FieldByName('PRV_ID').AsString );
          PrvTel_SeqNbr  := cdsProviderTelephones.FieldByName('PRVTEL_SEQNBR').AsInteger;
          vPrvTel_SeqNbr := False;
        end
      else
        begin
          PrvTel_SeqNbr := PrvTel_SeqNbr + 1;
          cdsProviderTelephones.FieldByName('PRVTEL_SEQNBR').AsInteger := PrvTel_SeqNbr;
        end;

      cdsProviderTelephones.FieldByName('PRVTEL_STATUS').AsString  := 'A';
      cdsProviderTelephones.FieldByName('STATUS_ID').AsString      := 'A';
    end;


   tbtnApply.Enabled := False;
   tbtnCancel.Enabled := False;
   nbTelephones.PageIndex := 1;
end;

procedure TFrmProviders.btnTelCancelClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DmSys1.cdsProviderTelephones.Cancel;
  nbTelephones.PageIndex := 0;
end;

procedure TFrmProviders.btnTelOkClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DmSys1.cdsProviderTelephones.FieldByName('TT_DESC').AsString := dmSys1.cdsTelephoneTypes.fieldByName('TT_DESC').asString;
//  DmSys1.cdsProviderAddresses.FieldByName('AT_DESC').AsString := DmBase.dtsLogrTypes.fieldByName('AT_DESC').asString;
  DmSys1.cdsProviderTelephones.Post;
  nbTelephones.PageIndex := 0;
end;

procedure TFrmProviders.btnEmailCancelClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DmSys1.cdsProviderEmails.Cancel;
  nbEmails.PageIndex := 0;
end;

procedure TFrmProviders.btnEmailOkClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DmSys1.cdsProviderEmails.FieldByName('EMT_DESC').AsString := dmSys1.cdsEmailTypes.fieldByName('EMT_DESC').asString;
  DmSys1.cdsProviderEmails.Post;
  nbEmails.PageIndex := 0;
end;

procedure TFrmProviders.tbtnNewEmailClick(Sender: TObject);
begin
  inherited;
  with dmSys1 do
    begin
      cdsProviderEmails.Append;
//      cdsProviderDocuments.FieldByName('PRV_ID').AsInteger        :=
      if vPrvEmt_SeqNbr then
        begin
          cdsProviderEmails.FieldByName('PRVEM_SEQNBR').AsInteger := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('PROVIDEREMAILS', 'PRVEM_SEQNBR', 'True',
                                                                     'PRV_ID = ' + dmSys.cdsProviders.FieldByName('PRV_ID').AsString );
          PrvEmt_SeqNbr  := cdsProviderEmails.FieldByName('PRVEM_SEQNBR').AsInteger;
          vPrvEmt_SeqNbr := False;
        end
      else
        begin
          PrvEmt_SeqNbr := PrvEmt_SeqNbr + 1;
          cdsProviderEmails.FieldByName('PRVEM_SEQNBR').AsInteger := PrvEmt_SeqNbr;
        end;

      cdsProviderEmails.FieldByName('PRVEM_STATUS').AsString  := 'A';
      cdsProviderEmails.FieldByName('STATUS_ID').AsString     := 'A';
    end;

   tbtnApply.Enabled := False;
   tbtnCancel.Enabled := False;
   nbEmails.PageIndex := 1;
end;

procedure TFrmProviders.tbtnEditDocumentClick(Sender: TObject);
begin
  inherited;
   tbtnApply.Enabled := False;
   tbtnCancel.Enabled := False;
   nbDocuments.PageIndex := 1;
   dmSys1.cdsProviderDocuments.Edit;
end;

procedure TFrmProviders.tbtnDelDocumentClick(Sender: TObject);
begin
  inherited;
   dmSys1.cdsProviderDocuments.Edit;
   dmSys1.cdsProviderDocuments.FieldByName('PRVDOC_STATUS').AsString := 'I';
   dmSys1.cdsProviderDocuments.FieldByName('STATUS_ID').AsString     := 'I';
   dmSys1.cdsProviderDocuments.Post;
end;

procedure TFrmProviders.tbtnDelAddressClick(Sender: TObject);
begin
  inherited;
   dmSys1.cdsProviderAddresses.Edit;
   dmSys1.cdsProviderAddresses.FieldByName('PRVADD_STATUS').AsString := 'I';
   dmSys1.cdsProviderAddresses.FieldByName('STATUS_ID').AsString     := 'I';
   dmSys1.cdsProviderAddresses.Post;
end;

procedure TFrmProviders.tbtnDelTelephoneClick(Sender: TObject);
begin
  inherited;
   dmSys1.cdsProviderTelephones.Edit;
   dmSys1.cdsProviderTelephones.FieldByName('PRVTEL_STATUS').AsString := 'I';
   dmSys1.cdsProviderTelephones.FieldByName('STATUS_ID').AsString     := 'I';
   dmSys1.cdsProviderTelephones.Post;

end;

procedure TFrmProviders.tbtnDelEMailClick(Sender: TObject);
begin
  inherited;
   dmSys1.cdsProviderEmails.Edit;
   dmSys1.cdsProviderEmails.FieldByName('PRVEM_STATUS').AsString  := 'I';
   dmSys1.cdsProviderEmails.FieldByName('STATUS_ID').AsString     := 'I';
   dmSys1.cdsProviderEmails.Post;
end;

procedure TFrmProviders.tbtnEditAddressClick(Sender: TObject);
begin
  inherited;
   tbtnApply.Enabled   := False;
   tbtnCancel.Enabled  := False;
   nbAddress.PageIndex := 1;
   dmSys1.cdsProviderAddresses.Edit;
end;

procedure TFrmProviders.tbtnEditTelephoneClick(Sender: TObject);
begin
  inherited;
   tbtnApply.Enabled   := False;
   tbtnCancel.Enabled  := False;
   nbTelephones.PageIndex := 1;
   dmSys1.cdsProviderTelephones.Edit;
end;

procedure TFrmProviders.tbtnEditEMailClick(Sender: TObject);
begin
  inherited;
   tbtnApply.Enabled   := False;
   tbtnCancel.Enabled  := False;
   nbEmails.PageIndex := 1;
   dmSys1.cdsProviderEmails.Edit;
end;

end.


