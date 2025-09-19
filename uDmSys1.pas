unit uDmSys1;

interface

uses
  SysUtils, Classes, MConnect, DB, DBClient, Dialogs, uGeralFunctions, RecError,
  FMTBcd, SqlExpr;

type
  TdmSys1 = class(TDataModule)
    ConnBrkMaster: TConnectionBroker;
    shrConnMaster: TSharedConnection;
    cdsAcceptedFct: TClientDataSet;
    dtsAcceptedFct: TDataSource;
    cdsAcceptedFctLista: TClientDataSet;
    dtsAcceptedFctLista: TDataSource;
    cdsTransportprovidersAccepted: TClientDataSet;
    dtsTransportprovidersAccepted: TDataSource;
    cdsExportLocations: TClientDataSet;
    cdsDepots: TClientDataSet;
    dtsDepots: TDataSource;
    cdsDepotsXTransportProviders: TClientDataSet;
    dtsExportLocations: TDataSource;
    dtsDepotsXTransportProviders: TDataSource;
    cdsPeriodUseTypes: TClientDataSet;
    dtsPeriodUseTypes: TDataSource;
    cdsValidationPeriods: TClientDataSet;
    dtsValidationPeriods: TDataSource;
    cdsValidityTypes: TClientDataSet;
    cdsDateStatus: TClientDataSet;
    dtsValidityTypes: TDataSource;
    dtsDateStatus: TDataSource;
    cdsLineSectionsXFarelevels: TClientDataSet;
    dtsSectionsXFarelevels: TDataSource;
    cdsLineSections: TClientDataSet;
    dtsLineSections: TDataSource;
    cdsLinePrices: TClientDataSet;
    dtsLinePrices: TDataSource;
    cdsLineDirections: TClientDataSet;
    dtsLineDirections: TDataSource;
    cdsKeyTypes: TClientDataSet;
    dtsKeyTypes: TDataSource;
    cdsLineGroupsXLineMT: TClientDataSet;
    dtsineGroupsXLineMT: TDataSource;
    cdsLineIntegration: TClientDataSet;
    cdsIntegrationClearing: TClientDataSet;
    dtsIntegrationClearing: TDataSource;
    dtsLineIntegration: TDataSource;
    cdsLineIntegrationCons: TClientDataSet;
    dtsLineIntegrationCons: TDataSource;
    cdsLineSectionsXLineDiscounts: TClientDataSet;
    dtsLineSectionsXLineDiscounts: TDataSource;
    cdsIntegrationList: TClientDataSet;
    dtsIntegrationList: TDataSource;
    cdsIntegrationSeek: TClientDataSet;
    dtsIntegrationSeek: TDataSource;
    cdsTPxLM: TClientDataSet;
    dtsTPxLM: TDataSource;
    cdsProviderDocuments: TClientDataSet;
    dtsProviderDocuments: TDataSource;
    cdsProviderTelephones: TClientDataSet;
    dtsProviderTelephones: TDataSource;
    cdsProviderEmails: TClientDataSet;
    cdsProviderAddresses: TClientDataSet;
    dtsProviderEmails: TDataSource;
    dtsProviderAddresses: TDataSource;
    cdsDocumentTypes: TClientDataSet;
    dtsDocumentTypes: TDataSource;
    cdsAddressTypes: TClientDataSet;
    dtsAddressTypes: TDataSource;
    cdsTelephoneTypes: TClientDataSet;
    dtsTelephoneTypes: TDataSource;
    cdsEmailTypes: TClientDataSet;
    dtsEmailTypes: TDataSource;
    cdsTransportProvidersXApps: TClientDataSet;
    dtsTransportProvidersXApps: TDataSource;
    cdsSoftwareTypes: TClientDataSet;
    dtsSoftwareTypes: TDataSource;
    cdsSoftwares: TClientDataSet;
    dtsSoftwares: TDataSource;
    cdsSoftwareVersions: TClientDataSet;
    dtsSoftwareVersions: TDataSource;
    cdsDataTypes: TClientDataSet;
    dtsDataTypes: TDataSource;
    cdsLanguages: TClientDataSet;
    dtsLanguages: TDataSource;
    cdsSystemUserGroups: TClientDataSet;
    dtsSystemUserGroups: TDataSource;
    cdsObjects: TClientDataSet;
    dtsObjects: TDataSource;
    cdsModules: TClientDataSet;
    dtsModules: TDataSource;
    dtsModulesXSoftwares: TDataSource;
    cdsModulesXSoftwares: TClientDataSet;
    cdsModulesXForms: TClientDataSet;
    dtsModulesXForms: TDataSource;
    cdsForms: TClientDataSet;
    dtsForms: TDataSource;
    cdsSystemRoles: TClientDataSet;
    dtsSystemRoles: TDataSource;
    cdsFormObjectsXSystemRoles: TClientDataSet;
    dtsFormObjectsXSystemRoles: TDataSource;
    cdsModulesXSystemUserGroups: TClientDataSet;
    dtsModulesXSystemUserGroups: TDataSource;
    cdsModulesXFormsLkp: TClientDataSet;
    dtsModulesXFormsLkp: TDataSource;
    cdsSystemUserGroupsXSystemRoles: TClientDataSet;
    dtsSystemUserGroupsXSystemRoles: TDataSource;
    cdsObjectTypes: TClientDataSet;
    dtsObjectTypes: TDataSource;
    cdsObjectTranslationMT: TClientDataSet;
    dtsObjectTranslationMT: TDataSource;
    cdsObjectsXLanguages: TClientDataSet;
    dtsObjectsXLanguages: TDataSource;
    cdsFormsXObjects: TClientDataSet;
    dtsFormsXObjects: TDataSource;
    cdsObjectTranslationDT: TClientDataSet;
    dtsObjectTranslationDT: TDataSource;
    cdsObjectTranslationDTxLanguages: TClientDataSet;
    dtsObjectTranslationDTxLanguages: TDataSource;
    cdsRemotePrinters: TClientDataSet;
    dtsRemotePrinters: TDataSource;
    cdsPersonnalFunctions: TClientDataSet;
    dtsPersonnalFunctions: TDataSource;
    cdsReports: TClientDataSet;
    dtsReports: TDataSource;
    cdsIntegrationDirections: TClientDataSet;
    dtsIntegrationDirections: TDataSource;
    cdsPeriodUseTypesLk: TClientDataSet;
    dtsPeriodUseTypesLk: TDataSource;
    cdsApplicationGroups: TClientDataSet;
    dtsApplicationGroups: TDataSource;
    cdsApplicationSubGroupsMT: TClientDataSet;
    dtsApplicationSubGroupsMT: TDataSource;
    dtsApplicationSubGroupsDT: TDataSource;
    cdsApplicationSubGroupsDT: TClientDataSet;
    cdsApprovationTypes: TClientDataSet;
    dtsApprovationTypes: TDataSource;
    cdsApprovationTypesID: TClientDataSet;
    cdsCardLevelPrices: TClientDataSet;
    dtsCardLevelPrices: TDataSource;
    dtsCardLevelPricesValidity: TDataSource;
    cdsCardLevelPricesValidity: TClientDataSet;
    dtsCardLevelPricesXCardDesign: TDataSource;
    cdsCardLevelPricesXCardDesign: TClientDataSet;
    dtsHotListReasonXCardLPrices: TDataSource;
    cdsHotListReasonXCardLPrices: TClientDataSet;
    dtsCardDesign: TDataSource;
    cdsCardDesign: TClientDataSet;
    dtsHotListReasonList: TDataSource;
    cdsHotListReasonList: TClientDataSet;
    cdsLineZonePrices: TClientDataSet;
    dtsLineZonePrices: TDataSource;
    cdsLineZonePricesIndividual: TClientDataSet;
    cdsLineZonePricesIndividualLZPI_SECTION: TIntegerField;
    cdsLineZonePricesIndividualLZPI_PRICE_GO: TFloatField;
    cdsLineZonePricesIndividualLZPI_PRICE_BACK: TFloatField;
    dtsLineZonePricesIndividual: TDataSource;
    dtsLinePricesIndividual: TDataSource;
    cdsLineDiscountsIndividual: TClientDataSet;
    cdsLineDiscountsIndividualLDI_SECTION: TIntegerField;
    cdsLineDiscountsIndividualLDI_PRICE_GO: TFloatField;
    cdsLineDiscountsIndividualLDI_PRICE_BACK: TFloatField;
    dtsLineDiscountsIndividual: TDataSource;
    cdsLinePricesIndividual: TClientDataSet;
    cdsLinePricesIndividualLPI_SECTION: TIntegerField;
    cdsLinePricesIndividualLPI_PRICE_GO: TFloatField;
    cdsLinePricesIndividualLPI_PRICE_BACK: TFloatField;
    cdsApplicationVersions: TClientDataSet;
    dtsApplicationVersions: TDataSource;
    cdsApplicationVersionSeq: TClientDataSet;
    dtsApplicationVersionSeq: TDataSource;
    cdsAcceptedTransportProviders: TClientDataSet;
    dtsAcceptedTransportProviders: TDataSource;
    dtsTransportProvidersGroups: TDataSource;
    cdsTransportProvidersGroups: TClientDataSet;
    cdsLKTransportProviders: TClientDataSet;
    dtsLKTransportProviders: TDataSource;
    cdsLisTransportProviders: TClientDataSet;
    dtsLisTransportProviders: TDataSource;
    cdsCardDesignxApps: TClientDataSet;
    dtsCardDesignxApps: TDataSource;
    cdsCardTemplatesxApps: TClientDataSet;
    dtsCardTemplatesxApps: TDataSource;
    cdsCardTypesXApps: TClientDataSet;
    dtsCardTypesXApps: TDataSource;
    cdsTPXApps: TClientDataSet;
    dtsTPXApps: TDataSource;
    cdsUserTypesXApps: TClientDataSet;
    dtsUserTypesXApps: TDataSource;
    cdsApplicationsXLineMT: TClientDataSet;
    dtsApplicationsXLineMT: TDataSource;
    cdsRelApplications: TClientDataSet;
    dtsRelApplications: TDataSource;
    cdsRelValidatorActions: TClientDataSet;
    dtsRelValidatorActions: TDataSource;
    cdsLineRange: TClientDataSet;
    dtsLineRange: TDataSource;
    cdsStates: TClientDataSet;
    dtsStates: TDataSource;
    cdsRegion: TClientDataSet;
    dtsRegion: TDataSource;
    cdsSubRegion: TClientDataSet;
    dtsSubRegion: TDataSource;
    cdsCities: TClientDataSet;
    dtsCities: TDataSource;
    cdsStatesLKP: TClientDataSet;
    dtsStatesLKP: TDataSource;
    cdsRegionLKP: TClientDataSet;
    dtsRegionLKP: TDataSource;
    cdsSubRegionLKP: TClientDataSet;
    dtsSubRegionLKP: TDataSource;
    cdsReasonTypes: TClientDataSet;
    dtsReasonTypes: TDataSource;
    cdsReasons: TClientDataSet;
    dtsReasons: TDataSource;
    cdsReasonTypesLKP: TClientDataSet;
    dtsReasonTypesLKP: TDataSource;
    dtsUserTypesLKP: TDataSource;
    cdsUserTypesLKP: TClientDataSet;
    cdsHandicapEquipment: TClientDataSet;
    dtsHandicapEquipment: TDataSource;
    cdsBanks: TClientDataSet;
    dtsBanks: TDataSource;
    cdsNossoNumero: TClientDataSet;
    dtsNossoNumero: TDataSource;
    cdsCedente: TClientDataSet;
    dtsCedente: TDataSource;
    cdsLineSelGroups: TClientDataSet;
    cdsLineIntegTimeGroups: TClientDataSet;
    dtsLineIntegTimeGroups: TDataSource;
    cdsLineIntegrationDT: TClientDataSet;
    dtsLineIntegrationDT: TDataSource;
    cdsLineIntegTimeGroupsxPeriods: TClientDataSet;
    dtsLineIntegTimeGroupsxPeriods: TDataSource;
    cdsLineIntegPeriodsxTimeLimits: TClientDataSet;
    dtsLineIntegPeriodsxTimeLimits: TDataSource;
    dtsLineIntegPeriods: TDataSource;
    cdsLineIntegPeriods: TClientDataSet;
    cdsLineIntegTimeLimits: TClientDataSet;
    dtsLineIntegTimeLimits: TDataSource;
    cdsLineIntegrationDTXApps: TClientDataSet;
    dtsLineIntegrationDTXApps: TDataSource;
    dtsPersonnalFunctions_PFG_ID: TDataSource;
    cdsPersonnelFunctions_PFG_ID: TClientDataSet;
    cdsFTPExportLocations: TClientDataSet;
    dtsFTPExportLocations: TDataSource;
    cdsInfoParameters: TClientDataSet;
    dtsInfoParameters: TDataSource;
    cdsTransportProvidersXInfoParameters: TClientDataSet;
    dtsTransportProvidersXInfoParameters: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsAcceptedFctAfterScroll(DataSet: TDataSet);
    procedure cdsExportLocationsBeforePost(DataSet: TDataSet);
    procedure cdsLinePricesPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsLineSectionsXLineDiscountsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsIntegrationListAfterScroll(DataSet: TDataSet);
    procedure cdsSystemUserGroupsAfterScroll(DataSet: TDataSet);
    procedure cdsModulesAfterScroll(DataSet: TDataSet);
    procedure cdsObjectTranslationMTAfterScroll(DataSet: TDataSet);
    procedure cdsObjectTranslationDTAfterScroll(DataSet: TDataSet);
    procedure cdsApplicationSubGroupsDTReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsApplicationSubGroupsMTAfterScroll(DataSet: TDataSet);
    procedure cdsApplicationGroupsReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure RefreshApplications;
    procedure RefreshHotListReason;
    procedure RefreshCardDesign;
    procedure cdsApprovationTypesReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsCardLevelPricesReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsCardLevelPricesXCardDesignReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure cdsIntegrationClearingReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure CreateLineZonePricesIndividual;
    procedure CreateLinePricesIndividual;
    procedure CreateLineDiscountsIndividual;
    procedure cdsLineZonePricesAfterScroll(DataSet: TDataSet);
    procedure cdsTransportProvidersGroupsAfterScroll(DataSet: TDataSet);
    procedure cdsLineZonePricesBeforeOpen(DataSet: TDataSet);
    procedure dtsLineIntegrationDTDataChange(Sender: TObject;
      Field: TField);
  private
    procedure StatusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure StatusSetText(Sender: TField; const Text: String);
    procedure AcaoGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure PermGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure ValueGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure TipoText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure LinhaDestinoText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure LinhaOrigemText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure VersionGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshLineIntegrationDTXApps;
  end;

var
  dmSys1: TdmSys1;

implementation

uses uDmConexao, uFrmAcceptedFct, uDmSys, uExportLocations, uFrmLineMT,
  uLineIntegration, uDataBaseFunctions, uDmBase, ufrmApplicationGroups,
  Variants, uFrmCardLevelPrices, uFrmTransportProvidersGroups;

{$R *.dfm}


procedure TdmSys1.StatusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if Sender.AsString = 'A' then
         Text := 'Ativo'
      else
         if Sender.AsString = 'I' then
            Text := 'Inativo'
         else
            Text := '';
    end;
end;

procedure TdmSys1.VersionGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
   begin
     Text := cdsSoftwareVersions.FieldByName('SFV_MAJORVERSION').AsString + '.' +
             cdsSoftwareVersions.FieldByName('SFV_MINORVERSION').AsString + '.' +
             cdsSoftwareVersions.FieldByName('SFV_RELEASE').AsString      + '.' +
             cdsSoftwareVersions.FieldByName('SFV_BUILD').AsString;
   end;
end;


procedure TdmSys1.ValueGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
     IF Sender.AsFloat = 0 Then
        Text := ''
     Else
       Text    := FormatFloat('#,##0.00',Sender.AsFloat);
end;

procedure TdmSys1.LinhaOrigemText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
     IF Sender.AsString = '' Then
        Text := cdsLineIntegrationCons.FieldByName('LI_ORIG_LIID').AsString
     Else
        Text := Sender.AsString;
End;

procedure TdmSys1.TipoText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
     IF Sender.AsString = 'L' Then
        Text := 'LINHA'
     Else
        Text := 'INTEGRAÇÃO'
End;


procedure TdmSys1.LinhaDestinoText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if DisplayText then
     IF Sender.AsString = '' Then
        Text := cdsLineIntegrationCons.FieldByName('LI_DEST_LIID').AsString
     Else
        Text := Sender.AsString;
End;

procedure TdmSys1.StatusSetText(Sender: TField; const Text: String);
Begin
  inherited;
  if Sender.Text <> Text then
    begin
      if Text = 'Ativo' then
         Sender.Text := 'A'
      else
      if Text = 'Inativo' then
         Sender.Text := 'I';
    end;
End;

procedure TdmSys1.DataModuleCreate(Sender: TObject);
begin
  if DmConexao.connectionType = 'DCOMM' then
     shrConnMaster.ParentConnection := DmConexao.DCOMConnMaster
  else
     shrConnMaster.ParentConnection := DmConexao.SocketConnMaster;
  ConnBrkMaster.Connected := True; //cidel- teste
end;

procedure TdmSys1.DataModuleDestroy(Sender: TObject);
begin
  ConnBrkMaster.Connected := False;
end;

procedure TdmSys1.cdsAcceptedFctAfterScroll(DataSet: TDataSet);
begin
 If DataSet = cdsAcceptedFct Then
   Begin
      IF FrmAcceptedFct <> Nil Then
         Begin
           FrmAcceptedFct.rxLkTProv.KeyValue := DataSet.fieldBYname('TP_ID').Value;
           FrmAcceptedFct.ListaEmpresas;
         End;
   End
 Else
   IF (Dataset = cdsPeriodUseTypes) or (Dataset = cdsPeriodUseTypesLk) Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
 Else
   IF Dataset = cdsDocumentTypes Then
     Begin
       DataSet.FieldByName('DUPACTION_ID').OnGetText  := AcaoGetText;
       DataSet.FieldByName('DUPALLOWED_ID').OnGetText  := PermGetText;
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
 Else
   IF Dataset = cdsRemotePrinters Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
 Else
   IF Dataset = cdsPersonnalFunctions Then
      Begin
        DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
        DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
      End
 Else
   IF Dataset = cdsModulesXSystemUserGroups Then
     Begin
{       If cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsString <> '' then
         dmSys1.cdsSystemUserGroupsXSystemRoles.Filter := 'MOD_ID = ' + dmSys1.cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsString
       Else
         dmSys1.cdsSystemUserGroupsXSystemRoles.Filter := '';   {}

       {cdsSystemUserGroupsXSystemRoles.Close;
       cdsSystemUserGroupsXSystemRoles.Params.ParamByName('SUG_ID').AsString := cdsModulesXSystemUserGroups.FieldByName('SUG_ID').AsString;
       cdsSystemUserGroupsXSystemRoles.Params.ParamByName('MOD_ID').AsString := cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsString;
       cdsSystemUserGroupsXSystemRoles.Open;

       cdsModulesXFormsLkp.Params.ParamByName('MOD_ID').AsString := cdsModulesXSystemUserGroups.FieldByName('MOD_ID').AsString;
       cdsModulesXFormsLkp.Open; {}

     End
 Else
   IF Dataset = cdsExportLocations Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
       (*If frmExportLocations <> Nil Then
         Begin
           dmSys1.cdsDepotsXTransportProviders.Close;
           dmSys1.cdsDepotsXTransportProviders.Params.ParamByName('DP_ID').Value := Dataset.fieldByName('DP_ID').Value;
           dmSys1.cdsDepotsXTransportProviders.Open;
           If DataSet.State <>  dsInsert Then
           frmExportLocations.CarregaCombo( cdsExportLocations.FieldByName('DP_ID').AsInteger, cdsExportLocations.FieldByName('TP_ID').AsInteger);
         End;*)
     End
   Else
   IF Dataset = cdsFTPExportLocations Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsInfoParameters Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsTransportProvidersXInfoParameters Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsLineSectionsXFarelevels Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsLineSections Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsObjects Then
     Begin
{       cdsObjectsXLanguages.Close;
       cdsObjectsXLanguages.Params.ParamByName('OBJ_ID').AsString := cdsObjects.FieldByName('OBJ_ID').AsString;
       cdsObjectsXLanguages.Open;

       cdsFormsXObjects.Close;
       cdsFormsXObjects.Params.ParamByName('OBJ_ID').AsString := cdsObjects.FieldByName('OBJ_ID').AsString;
       cdsFormsXObjects.Open;
}
     End
{   Else
   IF Dataset = cdsDepots Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End  {}
   Else
   IF Dataset = cdsSoftwares Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsSoftwareVersions Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;

       DataSet.FieldByName('VERSION_NUMBER').OnGetText  := VersionGetText;
     End
   Else
   IF Dataset = cdsLinePrices Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
       CreateLinePricesIndividual;
//       DataSet.FieldByName('LP_PRICE').OnGetText   := ValueGetText
//       DataSet.FieldByName('LP_DATE').OnGetText    := StaDateGetText;
//       If (frmLinemt <> nil) Then
//             frmLineMT.GetDateTime;

     End
   Else
   IF Dataset = cdsLineIntegration Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;

{       if (dmSys1.cdsLineIntegrationDT.Active = True) and (dmSys1.cdsLineIntegrationDT.ChangeCount <= 0) then
       begin
         dmSys1.cdsLineIntegrationDT.Close;
         dmSys1.cdsLineIntegrationDT.Params.ParamByName( 'LI_ID' ).AsInteger := dmSys1.cdsLineIntegration.FieldByName('LI_ID').AsInteger;
         dmSys1.cdsLineIntegrationDT.Open;

         if {(dmSys1.cdsLineIntegrationDTXApps.Active = True) and (dmSys1.cdsLineIntegrationDTXApps.ChangeCount <= 0) then
         begin
           dmSys1.cdsLineIntegrationDTXApps.Close;
           dmSys1.cdsLineIntegrationDTXApps.Params.ParamByName( 'LI_ID' ).AsInteger := dmSys1.cdsLineIntegrationDT.FieldByName('LI_ID').AsInteger;
           dmSys1.cdsLineIntegrationDTXApps.Params.ParamByName( 'LID_DATE' ).AsDate := dmSys1.cdsLineIntegrationDT.FieldByName('LID_DATE').AsDate;
           dmSys1.cdsLineIntegrationDTXApps.Open;
         end;
       end;}
     End
  Else
   IF Dataset = cdsLineSectionsXLineDiscounts Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText     := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText     := StatusSetText;
       DataSet.FieldByName('LDI_TIMESTART').OnGetText := DmSys.StaTimeGetText;
       DataSet.FieldByName('LDI_TIMEEND').OnGetText   := DmSys.EndTimeGetText;
       DataSet.FieldByName('LDI_VALUE').OnGetText     := ValueGetText;
     End
   Else
   IF Dataset = cdsLineIntegrationCons Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText     := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText     := StatusSetText;
       DataSet.FieldByName('LI_ORIG_TYPE').OnGetText  := TipoText;
       DataSet.FieldByName('LINHAORIGEM').OnGetText   := LinhaOrigemText;
       DataSet.FieldByName('LINHADESTINO').OnGetText  := LinhaDestinoText;
     End
   Else
   IF Dataset = cdsProviderDocuments Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsProviderTelephones Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsProviderEmails Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsProviderAddresses Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsTransportProvidersXApps Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
     Else
   IF Dataset = cdsSystemRoles Then
     Begin
       cdsFormObjectsXSystemRoles.Close;
       If cdsSystemRoles.FieldByName('SR_ID').AsString = '' Then
          cdsFormObjectsXSystemRoles.Params.ParamByName('SR_ID').AsString := '-1'
       Else
          cdsFormObjectsXSystemRoles.Params.ParamByName('SR_ID').AsString := cdsSystemRoles.FieldByName('SR_ID').AsString;
       cdsFormObjectsXSystemRoles.Params.ParamByName('SU_ID').AsString := IntToStr(dmConexao.SystemUser_Id);
       cdsFormObjectsXSystemRoles.Open;
     End

end;

procedure TdmSys1.cdsExportLocationsBeforePost(DataSet: TDataSet);
var inicials : String;
begin
  if DataSet = cdsStates Then
    Begin
      inicials := 'ST';
      exit;
    End
  Else
  if DataSet = cdsCities Then
    Begin
      inicials := 'CIT';
      exit;
    End
  Else
  if DataSet = cdsRegion Then
    Begin
      if DataSet.FieldByName('REG_STATUS').IsNull then
         DataSet.FieldByName('REG_STATUS').AsString := 'A';
      inicials := 'REG';
    End
  Else
  if DataSet = cdsBanks Then
    Begin
      if DataSet.FieldByName('BK_ID').IsNull then
         DataSet.FieldByName('BK_ID').AsInteger := -1;
      if DataSet.FieldByName('BK_STATUS').IsNull then
         DataSet.FieldByName('BK_STATUS').AsString := 'A';
      inicials := 'BK';
    End
  Else
  if DataSet = cdsNossoNumero Then
    Begin
      if DataSet.FieldByName('NN_ID').IsNull then
         DataSet.FieldByName('NN_ID').AsInteger := DmConexao.ConnBrkMaster.AppServer.AutoIncremento_Seq('NN_ID', 'True', 'BK_ID = '+cdsBanks.FieldByName('BK_ID').AsString);
      if DataSet.FieldByName('NN_STATUS').IsNull then
         DataSet.FieldByName('NN_STATUS').AsString := 'A';
      inicials := 'NN';
    End
  Else
  if DataSet = cdsCedente Then
    Begin
      if DataSet.FieldByName('CED_ID').IsNull then
         DataSet.FieldByName('CED_ID').AsInteger := DmConexao.ConnBrkMaster.AppServer.AutoIncremento_Seq('CED_ID', 'True', 'BK_ID = '+cdsBanks.FieldByName('BK_ID').AsString);
      if DataSet.FieldByName('CED_STATUS').IsNull then
         DataSet.FieldByName('CED_STATUS').AsString := 'A';
      inicials := 'CED';
    End
  Else
  if DataSet = cdsSubRegion Then
    Begin
      if DataSet.FieldByName('SUBREG_STATUS').IsNull then
         DataSet.FieldByName('SUBREG_STATUS').AsString := 'A';
      inicials := 'SUBREG';
    End
  Else
  if DataSet = cdsReasonTypes Then
    Begin
      if DataSet.FieldByName('RT_STATUS').IsNull then
         DataSet.FieldByName('RT_STATUS').AsString := 'A';
      if DataSet.FieldByName('RT_ID').IsNull then
         DataSet.FieldByName('RT_ID').AsInteger := -1;
      inicials := 'RT';
    End
  Else
  if DataSet = cdsHandicapEquipment Then
    Begin
      if DataSet.FieldByName('HCE_STATUS').IsNull then
         DataSet.FieldByName('HCE_STATUS').AsString := 'A';
      if DataSet.FieldByName('HCE_ID').IsNull then
         DataSet.FieldByName('HCE_ID').AsInteger := -1;
      inicials := 'HCE';
    End
  Else
  if DataSet = cdsReasons Then
    Begin
      if DataSet.FieldByName('RE_STATUS').IsNull then
         DataSet.FieldByName('RE_STATUS').AsString := 'A';
      if DataSet.FieldByName('RE_ID').IsNull then
         DataSet.FieldByName('RE_ID').AsInteger := -1;
      inicials := 'RE';
    End
  Else
  if DataSet = cdsExportLocations Then
    Begin
      inicials := 'EL';
    End
  Else
  if DataSet = cdsFTPExportLocations Then
    Begin
      if DataSet.FieldByName('FTPS_STATUS').IsNull then
         DataSet.FieldByName('FTPS_STATUS').AsString := 'A';
      inicials := 'FTPS';
    End
  Else
  if DataSet = cdsInfoParameters Then
    Begin
      if DataSet.FieldByName('IP_STATUS').IsNull then
         DataSet.FieldByName('IP_STATUS').AsString := 'A';
      inicials := 'IP';
    End
  Else
  if DataSet = cdsTransportProvidersXInfoParameters Then
    Begin
      if DataSet.FieldByName('TPXIP_STATUS').IsNull then
         DataSet.FieldByName('TPXIP_STATUS').AsString := 'A';
      inicials := 'TPXIP';
    End
  Else
  if DataSet = cdsLineRange Then
    Begin
      inicials := 'LR';
    End
  Else
  if DataSet = cdsCardDesignxApps Then
    Begin
      if DataSet.FieldByName('CDAPP_STATUS').IsNull then
         DataSet.FieldByName('CDAPP_STATUS').AsString := 'A';
      inicials := 'CDAPP';
    End
  Else
  if DataSet = cdsTPXApps Then
    Begin
      if DataSet.FieldByName('TPAPP_STATUS').IsNull then
         DataSet.FieldByName('TPAPP_STATUS').AsString := 'A';
      inicials := 'TPAPP';
    End
  Else
  if DataSet = cdsApplicationsXLineMT Then
    Begin
      inicials := 'APPLM';
    End
  Else
  if DataSet = cdsUserTypesXApps Then
    Begin
      inicials := 'UTAPP';
      exit;
    End
  Else
  if DataSet = cdsCardTemplatesxApps Then
    Begin
      inicials := 'CTA';
      exit;
    End
  Else
  if DataSet = cdsCardTypesXApps Then
    Begin
      inicials := 'CTYAPP';
      exit;
    End
  Else
  if DataSet = cdsLineSectionsXFarelevels Then
     Begin
       inicials := 'LSFL';
     End
  Else
  if DataSet = cdsModulesXSoftwares Then
     Begin
      if DataSet.FieldByName('MODSF_STATUS').IsNull then
         DataSet.FieldByName('MODSF_STATUS').AsString := 'A';
       inicials := 'MODSF';
     End
  Else
  if DataSet = cdsModulesXForms Then
     Begin
      if DataSet.FieldByName('MODFRM_STATUS').IsNull then
         DataSet.FieldByName('MODFRM_STATUS').AsString := 'A';
       inicials := 'MODFRM';
     End
  Else
  if DataSet = cdsObjectsXLanguages Then
     Begin
      if DataSet.FieldByName('OBJLNG_STATUS').IsNull then
         DataSet.FieldByName('OBJLNG_STATUS').AsString := 'A';
       inicials := 'OBJLNG';
     End
  Else
  if DataSet = cdsFormsXObjects Then
     Begin
      if DataSet.FieldByName('FRMOBJ_STATUS').IsNull then
         DataSet.FieldByName('FRMOBJ_STATUS').AsString := 'A';
       inicials := 'FRMOBJ';
     End
  Else
  if DataSet = cdsLineSections Then
     Begin
      if DataSet.FieldByName('LS_ID').IsNull then
         DataSet.FieldByName('LS_ID').AsInteger := cdsLineSections.RecordCount + 1;
       inicials := 'LS';
     End
  Else
  if DataSet = cdsLinePrices Then
     Begin
{      if DataSet.FieldByName('LP_SEQNBR').IsNull then
        Begin
          FrmLineMT.ContrSeqPrices := FrmLineMT.ContrSeqPrices - 1;
          DataSet.FieldByName('LP_SEQNBR').AsInteger := FrmLineMT.ContrSeqPrices;
        End;                                                                     }

      if DataSet.FieldByName('LP_SEQNBR').IsNull then
         DataSet.FieldByName('LP_SEQNBR').AsInteger := DmBase.ConnBrkBase.AppServer.SeqNbr_Prices(
                                                       DataSet.FieldByName('LD_ID').AsInteger,
                                                       FormatDateTime('DD-MMM-YYYY',DataSet.FieldByName('LP_DATE').AsDateTime));

       inicials := 'LP';
     End
  Else
  if DataSet = cdsLineIntegration Then
     Begin
      if DataSet.FieldByName('LI_ID').IsNull then
         DataSet.FieldByName('LI_ID').AsInteger := -1;
        inicials := 'LI';
     End
  Else
  if DataSet = cdsDepots Then
     Begin
      if DataSet.FieldByName('DP_ID').IsNull then
         DataSet.FieldByName('DP_ID').AsInteger := -1;
      if DataSet.FieldByName('DP_STATUS').IsNull then
         DataSet.FieldByName('DP_STATUS').AsString := 'A';
        inicials := 'DP';
     End
  Else
  if DataSet = cdsForms Then
     Begin
      if DataSet.FieldByName('FRM_ID').IsNull then
         DataSet.FieldByName('FRM_ID').AsInteger := -1;
      if DataSet.FieldByName('FRM_STATUS').IsNull then
         DataSet.FieldByName('FRM_STATUS').AsString := 'A';
        inicials := 'FRM';
     End
  Else
  if DataSet = cdsDataTypes Then
     Begin
      if DataSet.FieldByName('DT_ID').IsNull then
         DataSet.FieldByName('DT_ID').AsInteger := -1;
      if DataSet.FieldByName('DT_STATUS').IsNull then
         DataSet.FieldByName('DT_STATUS').AsString := 'A';
        inicials := 'DT';
     End
  Else
  if DataSet = cdsModules Then
     Begin
      if DataSet.FieldByName('MOD_ID').IsNull then
         DataSet.FieldByName('MOD_ID').AsInteger := -1;
      if DataSet.FieldByName('MOD_STATUS').IsNull then
         DataSet.FieldByName('MOD_STATUS').AsString := 'A';
        inicials := 'MOD';
     End
  Else
  if DataSet = cdsLanguages Then
     Begin
      if DataSet.FieldByName('LNG_ID').IsNull then
         DataSet.FieldByName('LNG_ID').AsInteger := -1;
      if DataSet.FieldByName('LNG_STATUS').IsNull then
         DataSet.FieldByName('LNG_STATUS').AsString := 'A';
        inicials := 'LNG';
     End
  Else
  if DataSet = cdsObjects Then
     Begin
      if DataSet.FieldByName('OBJ_ID').IsNull then
         DataSet.FieldByName('OBJ_ID').AsInteger := -1;
      if DataSet.FieldByName('OBJ_STATUS').IsNull then
         DataSet.FieldByName('OBJ_STATUS').AsString := 'A';
      if DataSet.FieldByName('OBJ_FIELDNAME').IsNull then
         DataSet.FieldByName('OBJ_FIELDNAME').AsString := '$$EMPTY_FIELD$$';
        inicials := 'OBJ';
     End
  Else
  if DataSet = cdsObjectTypes Then
     Begin
      if DataSet.FieldByName('OT_ID').IsNull then
         DataSet.FieldByName('OT_ID').AsInteger := -1;
      if DataSet.FieldByName('OT_STATUS').IsNull then
         DataSet.FieldByName('OT_STATUS').AsString := 'A';
        inicials := 'OT';
     End
  Else
  if DataSet = cdsObjectTranslationMT Then
     Begin
      if DataSet.FieldByName('OTM_ID').IsNull then
         DataSet.FieldByName('OTM_ID').AsInteger := -1;
      if DataSet.FieldByName('OTM_STATUS').IsNull then
         DataSet.FieldByName('OTM_STATUS').AsString := 'A';
        inicials := 'OTM';
     End
  Else
  if DataSet = cdsObjectTranslationDT Then
     Begin
      if DataSet.FieldByName('OTM_ID').IsNull then
         DataSet.FieldByName('OTM_ID').AsInteger := -1;
      if DataSet.FieldByName('OTD_ID').IsNull then
         DataSet.FieldByName('OTD_ID').AsInteger := -1;
      if DataSet.FieldByName('OTD_STATUS').IsNull then
         DataSet.FieldByName('OTD_STATUS').AsString := 'A';
        inicials := 'OTD';
     End
  Else
  if DataSet = cdsObjectTranslationDTxLanguages Then
     Begin
      if DataSet.FieldByName('OTM_ID').IsNull then
         DataSet.FieldByName('OTM_ID').AsInteger := -1;
      if DataSet.FieldByName('OTD_ID').IsNull then
         DataSet.FieldByName('OTD_ID').AsInteger := -1;
      if DataSet.FieldByName('OTDLNG_STATUS').IsNull then
         DataSet.FieldByName('OTDLNG_STATUS').AsString := 'A';
        inicials := 'OTDLNG';
     End
  Else
  if DataSet = cdsSoftwareTypes Then
     Begin
      if DataSet.FieldByName('SFT_ID').IsNull then
         DataSet.FieldByName('SFT_ID').AsInteger := -1;
        inicials := 'SFT';
     End
  Else
  if DataSet = cdsSoftwares Then
     Begin
      if DataSet.FieldByName('SF_ID').IsNull then
         DataSet.FieldByName('SF_ID').AsInteger := -1;

      if DataSet.FieldByName('SF_STATUS').IsNull then
         DataSet.FieldByName('SF_STATUS').AsString := 'A';

      DataSet.FieldByName('STATUS_ID').AsString := DataSet.FieldByName('SF_STATUS').AsString;

      inicials := 'SF';

     End
  Else
  if DataSet = cdsSystemRoles Then
     Begin
      if DataSet.FieldByName('SR_ID').IsNull then
         DataSet.FieldByName('SR_ID').AsInteger := -1;

      if DataSet.FieldByName('SR_STATUS').IsNull then
         DataSet.FieldByName('SR_STATUS').AsString := 'A';

      inicials := 'SR';
     End
  Else
  if DataSet = cdsSystemUserGroups Then
     Begin
      if DataSet.FieldByName('SUG_ID').IsNull then
         DataSet.FieldByName('SUG_ID').AsInteger := -1;

      if DataSet.FieldByName('SUG_STATUS').IsNull then
         DataSet.FieldByName('SUG_STATUS').AsString := 'A';

      inicials := 'SUG';
     End
  Else
  if DataSet = cdsSystemUserGroupsXSystemRoles Then
     Begin
      if DataSet.FieldByName('SUGSR_STATUS').IsNull then
         DataSet.FieldByName('SUGSR_STATUS').AsString := 'A';

      inicials := 'SUGSR';
     End
  Else
  if DataSet = cdsModulesXSystemUserGroups Then
     Begin
      if DataSet.FieldByName('MODSUG_STATUS').IsNull then
         DataSet.FieldByName('MODSUG_STATUS').AsString := 'A';

      inicials := 'MODSUG';
     End
  Else
  if DataSet = cdsSoftwareVersions Then
     Begin
{       S:=''; //cidel debug
        FOR i:=0 to DataSet.Fields.Count-1
        DO S:=S+DataSet.Fields[i].DisplayName+'='+DataSet.Fields[i].Text+#13;
        ShowMessage(S);   }
//      if DataSet.FieldByName('SFV_ID').IsNull then
//         DataSet.FieldByName('SFV_ID').AsInteger := -1;

      DataSet.FieldByName('STATUS_ID').AsString := DataSet.FieldByName('SFV_STATUS').AsString;
      inicials := 'SFV';
     End
  Else
  if DataSet = cdsLineSectionsXLineDiscounts Then
     Begin
        inicials := 'LSLD';
     End
  Else
  if DataSet = cdsProviderDocuments Then
     Begin
        inicials := 'PRVDOC';
     End
  Else
  if DataSet = cdsProviderTelephones Then
     Begin
        inicials := 'PRVTEL';
     End
  Else
  if DataSet = cdsProviderEmails Then
     Begin
        inicials := 'PRVEM';
     End
  Else
  if DataSet = cdsProviderAddresses Then
     Begin
        inicials := 'PRVADD';
     End
  Else
  if DataSet = cdsTransportProvidersXApps Then
     Begin
        inicials := 'TPAPP';
     End
  Else
  if DataSet = cdsDocumentTypes Then
     Begin
      if DataSet.FieldByName('DT_ID').IsNull then
         DataSet.FieldByName('DT_ID').AsInteger := -1;
         inicials := 'DT';
     End
  Else
  if DataSet = cdsKeyTypes Then
     Begin
      if DataSet.FieldByName('KT_CODE').IsNull then
         DataSet.FieldByName('KT_CODE').AsInteger := -1;
         inicials := 'KT';
     End
  Else
  if DataSet = cdsRemotePrinters Then
     Begin
      if DataSet.FieldByName('RP_ID').IsNull then
         DataSet.FieldByName('RP_ID').AsInteger := -1;
         inicials := 'RP';
     End
  Else
  if DataSet = cdsPersonnalFunctions Then
     Begin
      if DataSet.FieldByName('PF_ID').IsNull then
         DataSet.FieldByName('PF_ID').AsInteger := -1;
         inicials := 'PF';
     End
  else
  if DataSet = cdsPeriodUseTypes Then
     Begin
      if DataSet.FieldByName('PUT_ID').IsNull then
         DataSet.FieldByName('PUT_ID').AsInteger := -1;
      inicials := 'PUT';
     end
  else
  if DataSet = cdsApplicationGroups Then
     Begin
      if DataSet.FieldByName('APPGRP_ID').IsNull then
         DataSet.FieldByName('APPGRP_ID').AsInteger := -1;
      if DataSet.FieldByName('APPGRP_STATUS').IsNull then
         DataSet.FieldByName('APPGRP_STATUS').AsString := 'A';
      inicials := 'APPGRP';
     end
  else
  if DataSet = cdsApplicationSubGroupsMT Then
     Begin
      if DataSet.FieldByName('APPSGRPMT_ID').IsNull then
         DataSet.FieldByName('APPSGRPMT_ID').AsInteger := -1;
      if DataSet.FieldByName('APPSGRPMT_STATUS').IsNull then
         DataSet.FieldByName('APPSGRPMT_STATUS').AsString := 'A';
      inicials := 'APPSGRPMT';
     end
  else
  if DataSet = cdsApplicationSubGroupsDT Then
     Begin
      if DataSet.FieldByName('APPSGRPDT_STATUS').IsNull then
         DataSet.FieldByName('APPSGRPDT_STATUS').AsString := 'A';
      inicials := 'APPSGRPDT';
     end
  else
  if DataSet = cdsCardLevelPrices Then
     Begin
      if DataSet.FieldByName('CLP_ID').IsNull then
         DataSet.FieldByName('CLP_ID').AsInteger := -1;
      if DataSet.FieldByName('CLP_STATUS').IsNull then
         DataSet.FieldByName('CLP_STATUS').AsString := 'A';
      inicials := 'CLP';
     end
  else
  if DataSet = cdsCardLevelPricesValidity Then
     Begin
      if DataSet.FieldByName('CLPVAL_SEQNBR').IsNull then
         DataSet.FieldByName('CLPVAL_SEQNBR').AsInteger := -1;
      if DataSet.FieldByName('CLPVAL_STATUS').IsNull then
         DataSet.FieldByName('CLPVAL_STATUS').AsString := 'A';
      inicials := 'CLPVAL';
     end
  else
  if DataSet = cdsCardLevelPricesXCardDesign Then
     Begin
      if DataSet.FieldByName('CLPCD_SEQNBR').IsNull then
         DataSet.FieldByName('CLPCD_SEQNBR').AsInteger := -1;
      if DataSet.FieldByName('CLPCD_STATUS').IsNull then
         DataSet.FieldByName('CLPCD_STATUS').AsString := 'A';
      inicials := 'CLPCD';
     end
  else
  if DataSet = cdsHotListReasonXCardLPrices Then
     Begin
      if DataSet.FieldByName('HLRCLP_SEQNBR').IsNull then
         DataSet.FieldByName('HLRCLP_SEQNBR').AsInteger := -1;
      if DataSet.FieldByName('HLRCLP_STATUS').IsNull then
         DataSet.FieldByName('HLRCLP_STATUS').AsString := 'A';
      inicials := 'HLRCLP';
     end
  else
  if DataSet = cdsLineZonePrices Then
     Begin
      if DataSet.FieldByName('LZP_SEQNBR').IsNull then
         DataSet.FieldByName('LZP_SEQNBR').AsInteger := -1;
      if DataSet.FieldByName('LZP_STATUS').IsNull then
         DataSet.FieldByName('LZP_STATUS').AsString := 'A';
      inicials := 'LZP';
     end
  else
  if DataSet = cdsApplicationVersions Then
     Begin
      if DataSet.FieldByName('APPVER_STATUS').IsNull then
         DataSet.FieldByName('APPVER_STATUS').AsString := 'A';
      inicials := 'APPVER';
     end
  else
  if DataSet = cdsApprovationTypes Then
     Begin
      inicials := 'APT';
      exit;
     end
  else
  if DataSet = cdsAcceptedTransportProviders Then
     Begin
      inicials := 'ACTP';
      exit;
     end
  else
  if DataSet = cdsLineIntegTimeGroups Then
     Begin
      if DataSet.FieldByName('LITG_ID').IsNull then
         DataSet.FieldByName('LITG_ID').AsInteger := -1;
        inicials := 'LITG';
     End
  else
  if DataSet = cdsLineIntegrationDT Then
     Begin
      if DataSet.FieldByName('LI_ID').IsNull then
         DataSet.FieldByName('LI_ID').AsInteger := -1;
        inicials := 'LID';
     End
  else
  if DataSet = cdsLineIntegrationDTXApps Then
     Begin
      if DataSet.FieldByName('LIDAPP_ID').IsNull then
         DataSet.FieldByName('LIDAPP_ID').AsInteger := -1;
        inicials := 'LIDAPP';
     End
  else
  if DataSet = cdsLineIntegPeriods Then
     Begin
      if DataSet.FieldByName('LIP_ID').IsNull then
         DataSet.FieldByName('LIP_ID').AsInteger := -1;
        inicials := 'LIP';
     End
  else
  if DataSet = cdsLineIntegTimeLimits Then
     Begin
      if DataSet.FieldByName('LIT_ID').IsNull then
         DataSet.FieldByName('LIT_ID').AsInteger := -1;
        inicials := 'LIT';
     End;

  DmSys.SetNameUser(DataSet, inicials);
end;

procedure TdmSys1.cdsLinePricesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmLineMT.t_form_objects, '%T', [2830], []);
      FrmLineMT.dbDate.setfocus;
      action := daAbort;
    end

end;

procedure TdmSys1.cdsLineSectionsXLineDiscountsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmLineMT.t_form_objects, '%T %T', [2799, 1605], []);
      action := daAbort;
    end

end;

procedure TdmSys1.cdsIntegrationListAfterScroll(DataSet: TDataSet);
begin
  If FrmLineIntegration <> nil Then
     Begin
      cdsLineIntegration.Filter := '';
      cdsLineIntegration.Locate('LI_ORIG_LMID', cdsIntegrationList.fieldByname('LI_ORIG_LMID').Value, []);
      FrmLineIntegration.dbLineMT.KeyValue :=    cdsLineIntegration.fieldByName('LI_ORIG_LMID').AsInteger;
      FrmLineIntegration.dbLineMTCloseUp(Self);
     End;
end;

procedure TdmSys1.cdsSystemUserGroupsAfterScroll(DataSet: TDataSet);
begin
{  cdsSystemUserGroupsXSystemRoles.Close;
  cdsSystemUserGroupsXSystemRoles.Params.ParamByName('SUG_ID').AsString := cdsSystemUserGroups.FieldByName('SUG_ID').AsString;
  cdsSystemUserGroupsXSystemRoles.Open;

  cdsModulesXSystemUserGroups.Close;
  cdsModulesXSystemUserGroups.Params.ParamByName('SUG_ID').AsString := cdsSystemUserGroups.FieldByName('SUG_ID').AsString;
  cdsModulesXSystemUserGroups.Open;
}
end;

procedure TdmSys1.cdsModulesAfterScroll(DataSet: TDataSet);
begin
//  cdsModulesXSoftwares.Close;
//  cdsModulesXSoftwares.Params.ParamByName('MOD_ID').AsString := cdsModules.FieldByName('MOD_ID').AsString;
//  cdsModulesXSoftwares.Open;

//  cdsModulesXForms.Close;
//  cdsModulesXForms.Params.ParamByName('MOD_ID').AsString := cdsModules.FieldByName('MOD_ID').AsString;
//  cdsModulesXForms.Open;
end;

procedure TdmSys1.cdsObjectTranslationMTAfterScroll(DataSet: TDataSet);
begin
  cdsObjectTranslationDT.Close;
  cdsObjectTranslationDT.Params.ParamByName('OTM_ID').AsString := cdsObjectTranslationMT.FieldByName('OTM_ID').AsString;
  cdsObjectTranslationDT.Open;

end;

procedure TdmSys1.cdsObjectTranslationDTAfterScroll(DataSet: TDataSet);
begin
  cdsObjectTranslationDTxLanguages.Close;
  cdsObjectTranslationDTxLanguages.Params.ParamByName('OTM_ID').AsString := cdsObjectTranslationDT.FieldByName('OTM_ID').AsString;
  cdsObjectTranslationDTxLanguages.Params.ParamByName('OTD_ID').AsString := cdsObjectTranslationDT.FieldByName('OTD_ID').AsString;
  cdsObjectTranslationDTxLanguages.Open;
end;

procedure TdmSys1.AcaoGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if DisplayText then
    begin
      if Sender.AsString = 'W' then
         Text := 'Aviso'
      else
         if Sender.AsString = 'E' then
            Text := 'Erro'
         else
            if Sender.AsString = 'N' then
            Text := 'Nenhuma Ação'
    end;
end;

procedure TdmSys1.PermGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
if DisplayText then
    begin
      if Sender.AsString = 'Y' then
         Text := 'Sim'
      else
         if Sender.AsString = 'N' then
            Text := 'Não';
    end;

end;

procedure TdmSys1.cdsApplicationSubGroupsDTReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TdmSys1.cdsApplicationSubGroupsMTAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmApplicationGroups) then
  begin
    if frmApplicationGroups.actApplyUpdates.Enabled then
    begin
      frmApplicationGroups.spbtIncAll.Enabled := (cdsApplicationSubGroupsMT.RecordCount > 0);
      frmApplicationGroups.spbtIncOne.Enabled := (cdsApplicationSubGroupsMT.RecordCount > 0);
      frmApplicationGroups.spbtDelOne.Enabled := (cdsApplicationSubGroupsMT.RecordCount > 0);
      frmApplicationGroups.spbtDelAll.Enabled := (cdsApplicationSubGroupsMT.RecordCount > 0);
    end;
  end;

  cdsApplicationSubGroupsDT.Close;
  if (cdsApplicationSubGroupsMT.FieldByName('APPGRP_ID').AsString <> '') and (cdsApplicationSubGroupsMT.FieldByName('APPSGRPMT_ID').AsString <> '') then
  begin
    cdsApplicationSubGroupsDT.Params.ParamByName('id').AsString := cdsApplicationSubGroupsMT.FieldByName('APPGRP_ID').AsString;
    cdsApplicationSubGroupsDT.Params.ParamByName('mt_id').AsString := cdsApplicationSubGroupsMT.FieldByName('APPSGRPMT_ID').AsString;
    cdsApplicationSubGroupsDT.Open;
  end;

  RefreshApplications;
end;

procedure TdmSys1.cdsApplicationGroupsReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TdmSys1.RefreshApplications;
var
  sSql : String;
begin
  if not Assigned(frmApplicationGroups) then
    exit;

  if not cdsApplicationSubGroupsDT.Active then
    exit;

  frmApplicationGroups.sAPP_ID := '';
  cdsApplicationSubGroupsDT.First;
  while not cdsApplicationSubGroupsDT.Eof do
  begin
    frmApplicationGroups.sAPP_ID := frmApplicationGroups.sAPP_ID + cdsApplicationSubGroupsDT.FieldByName('APP_ID').AsString + ',';
    cdsApplicationSubGroupsDT.Next;
  end;

  DmSys.cdsApplications.Close;
  sSql :=        'SELECT APP.*,';
  sSql := sSql + '       APP.APP_STATUS  AS STATUS_ID,';
  sSql := sSql + '       SF.SF_DESC,';
  sSql := sSql + '       MA.MA_DESC,';
  sSql := sSql + '       AF.AF_DESC,';
  sSql := sSql + '       VDM.VDM_DESC,';
  sSql := sSql + '       ISS.ISS_DESCLONG,';
  sSql := sSql + '       KT.KT_DESC';
  sSql := sSql + ' FROM APPLICATIONS APP';
  sSql := sSql + ' LEFT JOIN  ISSUERS ISS ON (ISS.ISS_ID = APP.ISS_ID)';
  sSql := sSql + ' LEFT JOIN  STATISTICALFAMILIES SF  ON (SF.SF_ID = APP.SF_ID)';
  sSql := sSql + ' LEFT JOIN  MASTERAPPLICATIONS MA   ON (MA.MA_ID = APP.MA_ID)';
  sSql := sSql + ' LEFT JOIN  APPLICATIONFUNCTIONS AF ON (AF.AF_ID = APP.AF_ID)';
  sSql := sSql + ' LEFT JOIN  VALIDATORDISPLAYSMT VDM ON (VDM.VDM_CODE = APP.VDM_CODE)';
  sSql := sSql + ' LEFT JOIN KEYTYPES KT ON (KT.KT_CODE = APP.KT_CODE)';
  sSql := sSql + ' WHERE  APP.APP_STATUS = ''A''';

  if cdsApplicationSubGroupsDT.RecordCount > 0 then
    sSql := sSql + ' AND APP_ID NOT IN ('+Copy(frmApplicationGroups.sAPP_ID,1,Length(frmApplicationGroups.sAPP_ID)-1)+')';

{  sSql := sSql + ' AND APP_ID NOT IN (SELECT APP_ID FROM APPLICATIONSUBGROUPSDT WHERE APPGRP_ID = '+QuotedStr(cdsApplicationGroups.FieldByName('APPGRP_ID').AsString)+' AND APPSGRPMT_ID = '+QuotedStr(cdsApplicationSubGroupsMT.FieldByName('APPSGRPMT_ID').AsString)+')';
    if Assigned(frmApplicationGroups) then
    if frmApplicationGroups.sAPP_ID <> '' then
      sSql := sSQL + ' AND APP_ID NOT IN ('+Copy(frmApplicationGroups.sAPP_ID,1,Length(frmApplicationGroups.sAPP_ID)-1)+')';}
  sSql := sSql + ' ORDER BY APP.APP_ID';
  DmSys.cdsApplications.CommandText := sSql;
  DmSys.cdsApplications.Open;
end;



procedure TdmSys1.cdsApprovationTypesReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TdmSys1.cdsCardLevelPricesReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);

end;

procedure TdmSys1.RefreshHotListReason;
var
  sSql : String;
begin
  if not cdsHotListReasonXCardLPrices.Active then
    exit;
  if not Assigned(frmCardLevelPrices) then
    exit;

  frmCardLevelPrices.sHL_ID := '';
  cdsHotListReasonXCardLPrices.First;
  while not cdsHotListReasonXCardLPrices.Eof do
  begin
    frmCardLevelPrices.sHL_ID := frmCardLevelPrices.sHL_ID + cdsHotListReasonXCardLPrices.FieldByName('HLR_ID').AsString + ',';
    cdsHotListReasonXCardLPrices.Next;
  end;

  DmSys.cdsHotListReason.Close;
  sSql :=        ' SELECT HLR.*, HLR.HLR_STATUS AS STATUS_ID, HLR.HLR_TYPE AS TYPE_DESC, HLR.HLR_ACTION AS ACTION_DESC';
  sSql := sSql + ' FROM HOTLISTREASON HLR';
  sSql := sSql + ' WHERE HLR.HLR_ID < 99 AND HLR.HLR_STATUS = ''A''';
  if cdsHotListReasonXCardLPrices.RecordCount > 0 then
    sSql := sSql + ' AND HLR_ID NOT IN ('+Copy(frmCardLevelPrices.sHL_ID,1,Length(frmCardLevelPrices.sHL_ID)-1)+')';
  sSql := sSql + ' ORDER BY HLR.HLR_DESC';
  DmSys.cdsHotListReason.CommandText := sSql;
  DmSys.cdsHotListReason.Open;
end;

procedure TdmSys1.RefreshCardDesign;
var
  sSql : String;
begin
  if not cdsCardLevelPricesXCardDesign.Active then
    exit;
  if not Assigned(frmCardLevelPrices) then
    exit;

  frmCardLevelPrices.sCD_ID := '';
  cdsCardLevelPricesXCardDesign.First;
  while not cdsCardLevelPricesXCardDesign.Eof do
  begin
    frmCardLevelPrices.sCD_ID := frmCardLevelPrices.sCD_ID + cdsCardLevelPricesXCardDesign.FieldByName('CD_ID').AsString + ',';
    cdsCardLevelPricesXCardDesign.next;
  end;

  DmSys.cdsCarddesignCad.Close;
  sSql :=        ' SELECT CD_ID, CD_DESC, CD_CERTIFICATE, CD_STATUS, CD_STATUS AS STATUS_ID,';
  sSql := sSql + ' CD_REGDATE, CD_REGUSER FROM CARDDESIGN';
  sSql := sSql + ' WHERE CD_STATUS = ''A''';
  if cdsCardLevelPricesXCardDesign.RecordCount > 0 then
    sSql := sSql + ' AND CD_ID NOT IN ('+Copy(frmCardLevelPrices.sCD_ID,1,Length(frmCardLevelPrices.sCD_ID)-1)+')';
  sSql := sSql + ' ORDER BY CD_DESC';
  DmSys.cdsCarddesignCad.CommandText := sSql;
  DmSys.cdsCarddesignCad.Open;
end;

procedure TdmSys1.cdsCardLevelPricesXCardDesignReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TdmSys1.cdsIntegrationClearingReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

//Daniel - 09/06/2005 - Cria dataset dos preços da Lista da Proços por Zona
procedure TdmSys1.CreateLineZonePricesIndividual;
var
  i : integer;
begin
  if (cdsLineZonePrices.Active = False) or (cdsLineZonePricesIndividual.Active = False) then
    exit;

  cdsLineZonePricesIndividual.First;
  while not cdsLineZonePricesIndividual.Eof do
    cdsLineZonePricesIndividual.Delete;

  for i := 1 to 30 do
  begin
    if Trim(cdsLineZonePrices.FieldByName('LZP_SCT'+IntToStr(i)+'_IDA').AsString) <> '' then
    begin
      cdsLineZonePricesIndividual.Insert;
      cdsLineZonePricesIndividualLZPI_SECTION.AsInteger  := i;
      cdsLineZonePricesIndividualLZPI_PRICE_GO.AsFloat   := cdsLineZonePrices.FieldByName('LZP_SCT'+IntToStr(i)+'_IDA').AsFloat;
      cdsLineZonePricesIndividualLZPI_PRICE_BACK.AsFloat := cdsLineZonePrices.FieldByName('LZP_SCT'+IntToStr(i)+'_VOLTA').AsFloat;
      cdsLineZonePricesIndividual.Post;
    end; //end if

  end; //end for

end;

procedure TdmSys1.cdsLineZonePricesAfterScroll(DataSet: TDataSet);
begin
  CreateLineZonePricesIndividual;
end;

//Daniel - 09/06/2005 - Cria dataset dos preços da Lista de Preços
procedure TdmSys1.CreateLinePricesIndividual;
var
  i : integer;
begin
  if (cdsLinePrices.Active = False) or (cdsLinePricesIndividual.Active = False) then
    exit;

  cdsLinePricesIndividual.First;
  while not cdsLinePricesIndividual.Eof do
    cdsLinePricesIndividual.Delete;

  for i := 1 to 30 do
  begin
    if Trim(cdsLinePrices.FieldByName('LP_SCT'+IntToStr(i)+'_IDA').AsString) <> '' then
    begin
      cdsLinePricesIndividual.Insert;
      cdsLinePricesIndividualLPI_SECTION.AsInteger  := i;
      cdsLinePricesIndividualLPI_PRICE_GO.AsFloat   := cdsLinePrices.FieldByName('LP_SCT'+IntToStr(i)+'_IDA').AsFloat;
      cdsLinePricesIndividualLPI_PRICE_BACK.AsFloat := cdsLinePrices.FieldByName('LP_SCT'+IntToStr(i)+'_VOLTA').AsFloat;
      cdsLinePricesIndividual.Post;
    end; //end if

  end; //end for

end;

procedure TdmSys1.CreateLineDiscountsIndividual;
var
  i : integer;
begin
  if (DmSys.cdsLineDiscounts.Active = False) or (cdsLineDiscountsIndividual.Active = False) then
    exit;

  cdsLineDiscountsIndividual.First;
  while not cdsLineDiscountsIndividual.Eof do
    cdsLineDiscountsIndividual.Delete;

  for i := 1 to 30 do
  begin
    if Trim(DmSys.cdsLineDiscounts.FieldByName('LDI_SCT'+IntToStr(i)+'_IDA').AsString) <> '' then
    begin
      cdsLineDiscountsIndividual.Insert;
      cdsLineDiscountsIndividualLDI_SECTION.AsInteger  := i;
      cdsLineDiscountsIndividualLDI_PRICE_GO.AsFloat   := DmSys.cdsLineDiscounts.FieldByName('LDI_SCT'+IntToStr(i)+'_IDA').AsFloat;
      cdsLineDiscountsIndividualLDI_PRICE_BACK.AsFloat := DmSys.cdsLineDiscounts.FieldByName('LDI_SCT'+IntToStr(i)+'_VOLTA').AsFloat;
      cdsLineDiscountsIndividual.Post;
    end; //end if

  end; //end for

end;

procedure TdmSys1.cdsTransportProvidersGroupsAfterScroll(DataSet: TDataSet);
begin
  if cdsTransportProvidersGroups.FieldByName('TP_ID').AsString = '' then
  begin
    frmTransportProvidersGroups.SetLines;
    exit;
  end;
  cdsAcceptedTransportProviders.Close;
  cdsAcceptedTransportProviders.CommandText := 'SELECT ATP.*, TP1.TP_DESC TP_ORIG, TP2.TP_DESC TP_DEST FROM ACCEPTEDTRANSPORTPROVIDERS ATP LEFT JOIN TRANSPORTPROVIDERS TP1 ON TP1.TP_ID = ATP.TP_ID LEFT JOIN TRANSPORTPROVIDERS TP2 ON TP2.TP_ID = ATP.ACTP_TPID WHERE ATP.TP_ID = '+cdsTransportProvidersGroups.FieldByName('TP_ID').AsString+' ORDER BY TP1.TP_DESC';
  cdsAcceptedTransportProviders.Open;

  if cdsLKTransportProviders.Active then
    cdsLKTransportProviders.Locate('TP_ID',cdsTransportProvidersGroups.FieldByName('TP_ID').AsString,[]);

  cdsLisTransportProviders.Close;
//  cdsLisTransportProviders.CommandText := 'SELECT TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS TP WHERE TP.TP_ID NOT IN (SELECT ATP.TP_ID FROM ACCEPTEDTRANSPORTPROVIDERS ATP WHERE ATP.TP_ID = '+cdsTransportProvidersGroups.FieldByName('TP_ID').AsString+')';
  cdsLisTransportProviders.CommandText := 'SELECT TP.*, TP_STATUS AS STATUS_ID FROM TRANSPORTPROVIDERS TP';
  cdsLisTransportProviders.Open;

//  frmTransportProvidersGroups.dbedDesc.Text := cdsTransportProvidersGroups.FieldByName('TP_DESC').AsString;

  if Assigned(frmTransportProvidersGroups) then
    frmTransportProvidersGroups.SetLines;
end;

procedure TdmSys1.cdsLineZonePricesBeforeOpen(DataSet: TDataSet);
begin
   // Motivo do uso do AsBCD: http://qualitycentral.borland.com/wc/qcmain.aspx?d=8730 
   cdsLineZonePrices.Params.ParamByName( 'id' ).AsBCD := Int( dmsys.cdsLineDetails.Fields.FieldByName( 'LD_ID' ).AsInteger );
end;

procedure TdmSys1.dtsLineIntegrationDTDataChange(Sender: TObject;
  Field: TField);
begin
{  if (not (dtsLineIntegrationDT.State in [dsInsert, dsEdit]))
  and (not (dtsLineIntegrationDTXApps.State in [dsInsert, dsEdit]))  then
    LidappRefresh;}
end;

procedure TdmSys1.RefreshLineIntegrationDTXApps;
begin
  if cdsLineIntegrationDTXApps.Active then
    cdsLineIntegrationDTXApps.Close;
  cdsLineIntegrationDTXApps.Params.ParamByName('LI_ID').Value := cdsLineIntegrationDT.FieldByName('LI_ID').Value;
  cdsLineIntegrationDTXApps.Params.ParamByName('LID_DATE').AsDateTime := cdsLineIntegrationDT.FieldByName('LID_DATE').AsDateTime;
  cdsLineIntegrationDTXApps.Open;
end;

end.
