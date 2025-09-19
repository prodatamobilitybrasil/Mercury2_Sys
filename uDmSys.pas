unit uDmSys;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, Dialogs, Variants, RecError, uGeralFunctions;

Const
  Meses                 : array[1..12] of String = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');
  HotListReason_Actions : array[1..2] of String = ('Cancelar', 'Bloquear');


type RegLineMT = Record
     LM_ID : Integer;
     End;

type
  TDmSys = class(TDataModule)

    cdsLineMt: TClientDataSet;
    ConnBrkMaster: TConnectionBroker;
    shrConnMaster: TSharedConnection;
    dtsFarelevels: TDataSource;
    cdsFarelevels: TClientDataSet;
    cdsLineTypes: TClientDataSet;
    dtsLineTypes: TDataSource;
    cdsLocations: TClientDataSet;
    dtsLocations: TDataSource;
    cdsLineGroups: TClientDataSet;
    dtsLineGroups: TDataSource;
    cdsPersonnelTypes: TClientDataSet;
    dtsPersonnelTypes: TDataSource;
    cdsValidatorFunctions: TClientDataSet;
    dtsValidatorFunctions: TDataSource;
    cdsValidatorStates: TClientDataSet;
    dtsValidatorStates: TDataSource;
    cdsPersonneltypesXValidatorfcts: TClientDataSet;
    dtsPersonnelTypesXValidatorfcts: TDataSource;
    cdsValidatorMessages: TClientDataSet;
    cdsDiscountTypes: TClientDataSet;
    cdsValidatorDisplaysMT: TClientDataSet;
    cdsValidatorDisplaysDT: TClientDataSet;
    dtsValidatorDisplaysMT: TDataSource;
    dtsValidatorDisplaysDT: TDataSource;
    cdsTimeLimits: TClientDataSet;
    cdsGeral: TClientDataSet;
    cdsTimeGroups: TClientDataSet;
    cdsLinePrices: TClientDataSet;
    dtsLineMT: TDataSource;
    cdsLineDiscounts: TClientDataSet;
    dtsDiscountTypes: TDataSource;
    cdsMasterApp: TClientDataSet;
    cdsIssuers: TClientDataSet;
    cdsSystemParameters: TClientDataSet;
    cdsStatisticalFamilies: TClientDataSet;
    cdsUserTypesCad: TClientDataSet;
    cdsCardTypes: TClientDataSet;
    dtsCardTypes: TDataSource;
    cdsUserTypes: TClientDataSet;
    dtsUserTypes: TDataSource;
    cdsCarddesignCad: TClientDataSet;
    cdsCardTemplates: TClientDataSet;
    cdsReloadPeriodMT: TClientDataSet;
    cdsApplications: TClientDataSet;
    dtsApplications: TDataSource;
    cdsReloadPeriodDT: TClientDataSet;
    dtsReloadPeriodDT: TDataSource;
    dtsReloadPeriodMT: TDataSource;
    cdsLineDT: TClientDataSet;
    dtsLineDT: TDataSource;
    cdsVehicleTypes: TClientDataSet;
    dtsVehicleTypes: TDataSource;
    cdsValidatorFunctionsDisp: TClientDataSet;
    cdsHolidays: TClientDataSet;
    dtsHolidays: TDataSource;
    dtsIssuers: TDataSource;
    dtsStatisticalFamilies: TDataSource;
    dtsMasterApplications: TDataSource;
    cdsApplicationFunctions: TClientDataSet;
    dtsApplicationFunctions: TDataSource;
    cdsSubApplications: TClientDataSet;
    dtsSubApplications: TDataSource;
    cdsApplicationsLook: TClientDataSet;
    dtsApplicationsLook: TDataSource;
    cdsValidatorActions: TClientDataSet;
    dtsValidatorActions: TDataSource;
    cdsAppsXValidatorActions: TClientDataSet;
    dtsAppsXValidatorActions: TDataSource;
    cdsAppsXValidatorConditions: TClientDataSet;
    dtsAppsXValidatorConditions: TDataSource;
    cdsValidatorConditions: TClientDataSet;
    dtsValidatorConditions: TDataSource;
    cdsAppsXValVisualActions: TClientDataSet;
    dtsAppsXValVisualActions: TDataSource;
    cdsValVisualActions: TClientDataSet;
    dtsValVisualActions: TDataSource;
    cdsValidatorStatesXApps: TClientDataSet;
    dtsValidatorStatesXApps: TDataSource;
    cdsTransportProvidersXLineMT: TClientDataSet;
    dtsTransportProvidersXLineMT: TDataSource;
    cdsProviders: TClientDataSet;
    dtsProviders: TDataSource;
    cdsProviderTypes: TClientDataSet;
    dtsLinePrices: TDataSource;
    cdsFarelevelsLinePrices: TClientDataSet;
    dtsFarelevelsLinePrices: TDataSource;
    dtsLineDiscounts: TDataSource;
    cdsCollectors: TClientDataSet;
    cdsCollectorsXTransportProviders: TClientDataSet;
    dtsCollectors: TDataSource;
    dtsCollectorsXTransportProviders: TDataSource;
    cdsCardTemplatesXApp: TClientDataSet;
    dtsCardTemplatesXApp: TDataSource;
    dtsCardTemplates: TDataSource;
    cdsCardDesignXApp: TClientDataSet;
    dtsCarddesignXApp: TDataSource;
    dtsCarddesignCad: TDataSource;
    cdsSeries: TClientDataSet;
    cdsTransportProviders: TClientDataSet;
    dtsTransportProviders: TDataSource;
    cdsTimeGroupsXTimeLimits: TClientDataSet;
    dtsTimeGroupsXtimeLimits: TDataSource;
    dtsTimeGroups: TDataSource;
    cdsStatGroupsXConditions: TClientDataSet;
    dtsStatisticalGroups: TDataSource;
    dtsStatGroupsXConditions: TDataSource;
    cdsStatisticalGroups: TClientDataSet;
    cdsTransportProvidersXStatGroups: TClientDataSet;
    dtsTransportProvidersXStatGroups: TDataSource;
    cdsStatFamiliesXConditions: TClientDataSet;
    cdsUserTypesXApplicationsCad: TClientDataSet;
    dtsUsertypesCad: TDataSource;
    dtsUserTypesXApplicationsCad: TDataSource;
    cdsCardTypesXApplications: TClientDataSet;
    dtsCardTypesXApplications: TDataSource;
    cdsLineDetails: TClientDataSet;
    dtsLineDetails: TDataSource;
    cdsLineDetailTypes: TClientDataSet;
    dtsLineDetailTpes: TDataSource;
    dtsProviderTypes: TDataSource;
    cdsProvidersxProviderTypes: TClientDataSet;
    dtsProvidersxProviderTypes: TDataSource;
    cdsProviderSubTypes: TClientDataSet;
    dtsProviderSubTypes: TDataSource;
    cdsApplicationStrings: TClientDataSet;
    dtsApplicationStrings: TDataSource;
    cdsOrigAppLook: TClientDataSet;
    dtsOrigAppLook: TDataSource;
    cdsHandicapTypes: TClientDataSet;
    cdsHotListReason: TClientDataSet;
    cdsKeyTypes: TClientDataSet;
    cdsTransportProvidersGroups: TClientDataSet;
    dtsTransportProvidersGroups: TDataSource;
    cdsTranspGroupsXTransp: TClientDataSet;
    dtsTranspGroupsXTransp: TDataSource;
    cdsValFunc: TClientDataSet;
    DataSource1: TDataSource;
    cdsStudentTypes: TClientDataSet;
    dtsStudentTypes: TDataSource;
    dstApplicationFunctionVersions: TDataSource;
    cdsApplicationFunctionVersions: TClientDataSet;
    cdsVehTypXApp: TClientDataSet;
    dtsVehTypXApp: TDataSource;
    ConnBrkBase: TConnectionBroker;
    shrConnBase: TSharedConnection;
    cdsTransprovXVehTypesXApps: TClientDataSet;
    dtsTransprovXVehTypesXApps: TDataSource;
    dtsZoneLocations: TDataSource;
    cdsZoneLocations: TClientDataSet;
    cdsZones: TClientDataSet;
    dtsZones: TDataSource;
    cdsLineDetailsXZones: TClientDataSet;
    dtsLineDetailsXZones: TDataSource;
    dtsReceiptMt: TDataSource;
    cdsReceiptMt: TClientDataSet;
    cdsReceiptDt: TClientDataSet;
    dtsReceiptDt: TDataSource;
    cdsLineDetailsAux: TClientDataSet;
    dtsLineDetailsAux: TDataSource;
    cdsReceiptFields: TClientDataSet;
    dtsReceiptFields: TDataSource;
    dtsUseRestrictionGroups: TDataSource;
    cdsUseRestrictionGroups: TClientDataSet;
    cdsUseRestGroupsXPerUseTypes: TClientDataSet;
    dtsUseRestGroupsXPerUseTypes: TDataSource;
    cdsLineIntegrationTypes: TClientDataSet;
    dtsLineIntegrationTypes: TDataSource;
    cdsCardBUType: TClientDataSet;
    dtsCardBUType: TDataSource;
    cdsCardBUTypeXLineintegrationtypes: TClientDataSet;
    dtsCardBUTypeXLineintegrationtypes: TDataSource;
    cdsReloadTypesLKP: TClientDataSet;
    dstReloadTypesLKP: TDataSource;
    cdsPeriodUseTypes: TClientDataSet;
    dtsPeriodUseTypes: TDataSource;
    cdsPersonnelFunctionsGroup: TClientDataSet;
    dtsPersonnelFunctionsGroup: TDataSource;
    cdsGridPeriodo: TClientDataSet;
    cdsGridPeriodoURGPUT_ID: TIntegerField;
    cdsGridPeriodoURG_ID: TIntegerField;
    cdsGridPeriodoPUT_ID: TIntegerField;
    cdsGridPeriodoURGPUT_PERUSELIMIT: TIntegerField;
    cdsGridPeriodoURGPUT_STATUS: TStringField;
    cdsGridPeriodoURGPUT_REGUSER: TStringField;
    dtsGridPeriodo: TDataSource;
    cdsGridPeriodoURGPUT_REGDATE: TDateTimeField;
    cdsGridPeriodoPUT_DESC: TStringField;
    dtsAux: TDataSource;
    cdsAux: TClientDataSet;
    dsCodTrecho: TClientDataSet;
    dtsCodTrech: TDataSource;
    ClientDataSet1: TClientDataSet;
    cdsBioFacial: TClientDataSet;
    procedure cdsLineMtBeforePost(DataSet: TDataSet);
    procedure cdsLineMtAfterScroll(DataSet: TDataSet);
    procedure cdsValidatorDisplaysDTPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsSystemParametersPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsReloadPeriodMTPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsReloadPeriodDTPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsValidatorDisplaysDTAfterInsert(DataSet: TDataSet);
    procedure cdsApplicationsAfterScroll(DataSet: TDataSet);
    procedure cdsApplicationsBeforePost(DataSet: TDataSet);
    procedure cdsApplicationsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsAppsXValidatorActionsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsAppsXValidatorConditionsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsAppsXValVisualActionsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsValidatorStatesXAppsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsIssuersPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsProviderTypesPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsProviderTypePostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsProviderTypesReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsValidatorDisplaysMTPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsLinePricesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsCardTemplatesXAppPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsCardDesignXAppPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsMasterAppPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsUserTypesXApplicationsCadPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsCardTypesXApplicationsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsProvidersxProviderTypesPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsPersonnelTypesPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsCarddesignCadReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsCardTemplatesReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsHandicapTypesAfterScroll(DataSet: TDataSet);
    procedure cdsStudentTypesReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsApplicationFunctionVersionsBeforePost(DataSet: TDataSet);
    procedure cdsTransprovXVehTypesXAppsPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure cdsVehTypXAppPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsReceiptMtAfterScroll(DataSet: TDataSet);
    procedure cdsReceiptDtAfterScroll(DataSet: TDataSet);
    procedure cdsUseRestGroupsXPerUseTypesPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);

  private
    Procedure VerificaExiste;
    procedure StatusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure StatusSetText(Sender: TField; const Text: String);
    procedure PeriodGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure ReasonTypeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure ReasonActionGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure App_IssGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure App_IssOrigGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    { Private declarations }
    Function GetPeriod(pYear : String) : Integer;
  public
    procedure SetNameUser(DataSet : TDataSet; dbInicials : String);
    Procedure Selecionadisponiveis;
    procedure StaTimeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure EndTimeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    { Public declarations }
  end;

var
  DmSys: TDmSys;
  vLM_ID : array of RegLineMT;

implementation

  USES uPersonnelTypes,
  uLineDiscounts, uSystemParameters, uReloadPeriod, uLinePrices,
  uFrmLineMT, uApplications, uIssuers, uDmConexao, uProviderTypes,
  uValidatorDisplaysMT, uFrmCollectors, uCardTemplates, uCardDesign,
  uTransportProviders, uMasterApplications, uTimeGroups,
  uStatisticalGroups, uStatisticalFamilies, uUserTypes, uCardTypes,
  uDataBaseFunctions, uDmSys1, uCommonFunctions, uHandicapTypes,
  uUseRestrictionGroups;

{$R *.dfm}

procedure TDmSys.SetNameUser(DataSet : TDataSet; dbInicials : String);
begin
 DataSet.FieldByName(dbInicials + '_REGDATE').AsDateTime := DmConexao.ConnBrkMaster.AppServer.GetCurrentDateTime;
// DataSet.FieldByName(dbInicials + '_RegUser').AsString := GetNetUser;
 DataSet.FieldByName(dbInicials + '_REGUSER').AsString := UpperCase(DMConexao.SystemUser_Str); 
end;
// ***


Function TDmSys.GetPeriod(pYear : String) : Integer;
Begin
 With dmConexao do
   Begin
    cdsGeral.close;
    cdsGeral.commandtext := 'SELECT MAX(RPM_PERIOD) FROM RELOADPERIODMT WHERE RPM_YEAR = :RPM_YEAR';
    cdsGeral.Params.ParamByName('RPM_YEAR').AsString := pYear;
    cdsGeral.Open;

    If cdsGeral.Fields.Fields[0].Value = null Then
       Result := 1
    Else
       Result := cdsGeral.Fields.Fields[0].AsInteger + 1;
   End;


End;

procedure TDmSys.cdsLineMtBeforePost(DataSet: TDataSet);
var inicials : String;
begin
   if DataSet = cdsLineMt then
    begin
      if DataSet.FieldByName('LM_Id').IsNull then
         DataSet.FieldByName('LM_Id').AsInteger := -1;
      inicials := 'LM'
    end
  Else
   if DataSet = cdsLineDt then
    begin
      IF FrmLineMT.ContrLDT_ID = 0
      Then FrmLineMT.ContrLDT_ID := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('LINEDT','LDT_ID', 'False', '')
      Else Inc(FrmLineMT.ContrLDT_ID);

      if DataSet.FieldByName('LDT_ID').IsNull then Begin
         DataSet.FieldByName('LDT_ID').AsInteger := FrmLineMT.ContrLDT_ID;
      End;
      inicials := 'LDT'
    end
  Else
  if DataSet = cdsLineDetails Then
    Begin
      if DataSet.FieldByName('LD_ID').IsNull then
         Begin
           If cdsLineMt.State = dsInsert Then
           begin
               If FrmLineMT.vSEQNBR = 0 Then
                 FrmLineMT.vSEQNBR := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('LINEDETAILS', 'LD_ID', 'False', '' ) - 1;

                 FrmLineMT.vSEQNBR := FrmLineMT.vSEQNBR + 1;

                 DataSet.FieldByName('LD_ID').AsInteger := FrmLineMT.vSEQNBR;
           end
           Else
           If cdsLineMt.State = dsEdit Then
              Begin
               If FrmLineMT.vSEQNBR = 0 Then
                 FrmLineMT.vSEQNBR := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('LINEDETAILS', 'LD_ID', 'False', '' ) - 1;

                 FrmLineMT.vSEQNBR := FrmLineMT.vSEQNBR + 1;
              End;

              DataSet.FieldByName('LD_ID').AsInteger := FrmLineMT.vSEQNBR
         End;
      inicials := 'LD'
    End
  Else
  if DataSet = cdsLineGroups Then
    Begin
      if DataSet.FieldByName('LG_ID').IsNull then
         DataSet.FieldByName('LG_ID').AsInteger := -1;
      inicials := 'LG'
    End
  Else
  if DataSet = cdsPersonnelTypes Then
    Begin
      if DataSet.FieldByName('PRST_ID').IsNull then
         DataSet.FieldByName('PRST_ID').AsInteger := -1;
      inicials := 'PRST'
    End
  Else
  if DataSet = cdsStudentTypes Then
    Begin
      if DataSet.FieldByName('STUTP_ID').IsNull then
         DataSet.FieldByName('STUTP_ID').AsInteger := -1;
      if DataSet.FieldByName('STUTP_STATUS').IsNull then
         DataSet.FieldByName('STUTP_STATUS').AsString := 'A';
      inicials := 'STUTP'
    End
  Else
  if DataSet = cdsValidatorDisplaysMT Then
    Begin
//      if DataSet.FieldByName('VDM_CODE').IsNull then
//         DataSet.FieldByName('VDM_CODE').AsInteger := -1;
      inicials := 'VDM'
    End
  Else
  if DataSet = cdsValidatorDisplaysDT Then
    Begin
      if DataSet.State = dsInsert Then
         VerificaExiste;
//      if DataSet.FieldByName('VDM_CODE').IsNull then
//         DataSet.FieldByName('VDM_CODE').AsInteger := -1;
      if DataSet.FieldByName('VDD_STATUS').IsNull Then
         Begin
         DataSet.FieldByName('VDD_STATUS').AsString := 'A';
         DataSet.FieldByName('STATUS_ID').AsString  := 'A';
         End;
      inicials := 'VDD'
    End
  Else
  if DataSet = cdsTimeLimits Then
    Begin
      if DataSet.FieldByName('TL_ID').IsNull then
         DataSet.FieldByName('TL_ID').AsInteger := -1;
      inicials := 'TL'
    End
  Else
  if DataSet = cdsTimeGroups Then
    Begin
      if DataSet.FieldByName('TG_ID').IsNull then
         DataSet.FieldByName('TG_ID').AsInteger := -1;
      inicials := 'TG'
    End
  Else
  if DataSet = cdsLinePrices Then
    Begin
      inicials := 'LP'
    End
  Else
  if DataSet = cdsLineDiscounts Then
    Begin
     if DataSet.FieldByName('LDI_SEQNBR').IsNull then
        Begin
        FrmLineMT.ContrSeqDiscounts := FrmLineMT.ContrSeqDiscounts - 1;
        DataSet.FieldByName('LDI_SEQNBR').AsInteger := FrmLineMT.ContrSeqDiscounts;
        End;
      inicials := 'LDI'
    End
  Else
  if DataSet = cdsMasterApp Then
    Begin
      inicials := 'MA'
    End
  Else
  if DataSet = cdsIssuers Then
    Begin
      if DataSet.FieldByName('ISS_ID').IsNull then
         DataSet.FieldByName('ISS_ID').AsInteger := -1;
      inicials := 'ISS'
    End
  Else
  if DataSet = cdsSystemParameters Then
    Begin
      if DataSet.FieldByName('SP_CODE').IsNull then
         DataSet.FieldByName('SP_CODE').AsInteger := -1;
      inicials := 'SP'
    End
  Else
  if DataSet = cdsStatisticalFamilies Then
    Begin
      if DataSet.FieldByName('SF_ID').IsNull then
         DataSet.FieldByName('SF_ID').AsInteger := -1;
      inicials := 'SF'
    End
  Else
  if DataSet = cdsUserTypesCad Then
    Begin
      if DataSet.FieldByName('UT_ID').IsNull then
         DataSet.FieldByName('UT_ID').AsInteger := -1;
      inicials := 'UT'
    End
  Else
  if DataSet = cdsCarddesignCad Then
    Begin
      if DataSet.FieldByName('CD_ID').IsNull then
         DataSet.FieldByName('CD_ID').AsInteger := -1;
      inicials := 'CD'
    End
  Else
  if DataSet = cdsCardTemplates Then
    Begin
      if DataSet.FieldByName('CTE_ID').IsNull then
         DataSet.FieldByName('CTE_ID').AsInteger := -1;
      inicials := 'CTE'
    End
  Else
  if DataSet = cdsReloadPeriodMT Then
    Begin
      if DataSet.FieldByName('RPM_PERIOD').IsNull then
         DataSet.FieldByName('RPM_PERIOD').AsInteger := GetPeriod(DataSet.FieldByName('RPM_YEAR').AsString);
      inicials := 'RPM'
    End
  Else
  if DataSet = cdsReloadPeriodDT Then
    Begin
      inicials := 'RPD'
    End
  Else
  if DataSet = cdsHolidays Then
    Begin
     if DataSet.FieldByName('HOL_ID').IsNull then
        DataSet.FieldByName('HOL_ID').AsInteger := -1;
      inicials := 'HOL'
    End
  Else
  if DataSet = cdsTransportProviders Then
    Begin
//     if DataSet.FieldByName('TP_ID').IsNull then
//        DataSet.FieldByName('TP_ID').AsInteger := -1;
      inicials := 'TP'
    End
  Else
  if DataSet = cdsValidatorMessages Then
    Begin
     if DataSet.FieldByName('MSG_ID').IsNull then
        DataSet.FieldByName('MSG_ID').AsInteger := -1;
      inicials := 'MSG';
    End
  Else
  if DataSet = cdsTransportProvidersXLineMT Then
  begin
     inicials := 'TPLM'
  end
  Else
  if DataSet = cdsZoneLocations Then
  begin
     inicials := 'ZNL'
  end
  else
  if DataSet = cdsZones Then
  begin
     inicials := 'ZN'
  end
  else
  if DataSet = cdsLineDetailsXZones Then
  begin
    if DataSet.FieldByName('LDZN_SEQNBR').IsNull then
      DataSet.FieldByName('LDZN_SEQNBR').AsInteger := -1;
    if DataSet.FieldByName('LDZN_STATUS').IsNull then
      DataSet.FieldByName('LDZN_STATUS').AsString := 'A';
    if DataSet.FieldByName('STATUS_ID').IsNull then
      DataSet.FieldByName('STATUS_ID').AsString := 'A';
     inicials := 'LDZN'
  end
  else
  if DataSet = cdsReceiptMt then
  begin
    if DataSet.FieldByName('STATUS_ID').IsNull then
      DataSet.FieldByName('STATUS_ID').AsString := 'A';

    inicials := 'RCPTMT';
  end
  else
  if DataSet = cdsReceiptDt then
  begin
    if DataSet.FieldByName('STATUS_ID').IsNull then
      DataSet.FieldByName('STATUS_ID').AsString := 'A';
    inicials := 'RCPTDT';
  end
  Else
  if DataSet = cdsPersonnelFunctionsGroup Then
    Begin
     if DataSet.FieldByName('PFG_ID').IsNull then
        DataSet.FieldByName('PFG_ID').AsInteger := -1;
    if DataSet.FieldByName('PFG_STATUS').IsNull then
      DataSet.FieldByName('PFG_STATUS').AsString := 'A';
        
      inicials := 'PFG'
    End

  Else
  if DataSet = cdsUseRestrictionGroups Then
    Begin
      if DataSet.FieldByName('URG_ID').IsNull then
         DataSet.FieldByName('URG_ID').AsInteger := -1;
      if DataSet.FieldByName('URG_STATUS').IsNull then
        DataSet.FieldByName('URG_STATUS').AsString := 'A';
      if DataSet.FieldByName('STATUS_ID').IsNull then
        DataSet.FieldByName('STATUS_ID').AsString := 'A';
      inicials := 'URG';
    End
  Else
  if DataSet = cdsUseRestGroupsXPerUseTypes Then
    Begin
      if DataSet.FieldByName('URGPUT_ID').IsNull then
         DataSet.FieldByName('URGPUT_ID').AsInteger := -1;
      if DataSet.FieldByName('URGPUT_STATUS').IsNull then
        DataSet.FieldByName('URGPUT_STATUS').AsString := 'A';
      if DataSet.FieldByName('STATUS_ID').IsNull then
        DataSet.FieldByName('STATUS_ID').AsString := 'A';
      inicials := 'URGPUT';
    End
  ;

  SetNameUser(DataSet, inicials);
end;

Procedure TDmSys.VerificaExiste;
Begin
 //Este procedimento foi criado para verificar se existe um registro inativo
 //na tabela (VALIDATORDISPLAYSDT) no momento da inserção.
 cdsGeral.Close;
 cdsGeral.CommandText := 'SELECT * FROM VALIDATORDISPLAYSDT WHERE VDM_CODE = :VDM_CODE AND '+
                         'VDD_LINE = :VDD_LINE AND '+
                         'VDD_COLUMN = :VDD_COLUMN  AND VDD_STATUS = ''I''';
 cdsGeral.Params.ParamByName('VDM_CODE').Value    := cdsValidatorDisplaysMT.fieldbyName('VDM_CODE').Value;
// cdsGeral.Params.ParamByName('VDM_VERSION').AsString := cdsValidatorDisplaysMT.fieldbyName('VDM_VERSION').AsString;
 cdsGeral.Params.ParamByName('VDD_LINE').Value    := cdsValidatorDisplaysDT.fieldbyName('VDD_LINE').Value;
 cdsGeral.Params.ParamByName('VDD_COLUMN').Value  := cdsValidatorDisplaysDT.fieldbyName('VDD_COLUMN').Value;
 cdsGeral.Open;


 IF cdsGeral.RecordCount > 0 Then
    Begin
       DisplayMsg(FrmValidatorDisplaysMT.t_form_objects, '%T $S%T', [2816, 2817], [#13], mtInformation, [mbOK]);

       cdsGeral.Close;
       cdsGeral.CommandText := 'UPDATE VALIDATORDISPLAYSDT SET VDD_STATUS = ''A'' WHERE VDM_CODE = :VDM_CODE '+
                               'AND VDD_LINE = :VDD_LINE AND VDD_COLUMN = :VDD_COLUMN';
       cdsGeral.Params.ParamByName('VDM_CODE').AsString    := cdsValidatorDisplaysMT.fieldbyName('VDM_CODE').AsString;
//       cdsGeral.Params.ParamByName('VDM_VERSION').AsString := cdsValidatorDisplaysMT.fieldbyName('VDM_VERSION').AsString;
       cdsGeral.Params.ParamByName('VDD_LINE').AsString    := cdsValidatorDisplaysDT.fieldbyName('VDD_LINE').AsString;
       cdsGeral.Params.ParamByName('VDD_COLUMN').AsString  := cdsValidatorDisplaysDT.fieldbyName('VDD_COLUMN').AsString;
       cdsGeral.Execute;
    End;

End;

procedure TDmSys.cdsLineMtAfterScroll(DataSet: TDataSet);
var
  wLeds : String;
  sHex  : String;
begin
   IF Dataset = cdsLineMt Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsLineDt Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsLineDetails Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
       if (dmSys1.cdsLineZonePrices.ChangeCount <= 0) then
       begin
         if DataSet.FieldByName('LD_ID').AsString <> '' then
         begin
           dmSys1.cdsLineZonePrices.Close;
           dmSys1.cdsLineZonePrices.Params.ParamByName('id').AsString := DataSet.FieldByName('LD_ID').AsString;
           dmSys1.cdsLineZonePrices.Open;
         end;
       end;
     End
   Else
   If Dataset = cdsLineGroups Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;

//       If (frmLineGroups <> nil) Then
//          frmLineGroups.SetLines;

(*       If DataSet.fieldByname('LG_ID').AsString <> '' Then
         Begin
          cdsLineGroupsXLineMT.Close;
          cdsLineGroupsXLineMT.Params.ParamByName('LG_ID').AsString := DataSet.fieldByname('LG_ID').AsString;
          cdsLineGroupsXLineMT.Open;
         End;
 *)
{       cdsLineMTDisponiveis.Close;
       cdsLineMTDisponiveis.Params.ParamByName('LG_ID').AsString := DataSet.fieldByname('LG_ID').AsString;
       cdsLineMTDisponiveis.Open;
 }
//       If (cdsLineGroupsXLineMT.Active) Then
//       Selecionadisponiveis;
     End
   Else
   If Dataset = cdsPersonnelTypes Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   If Dataset = cdsPersonneltypesXValidatorfcts Then
     Begin
        //
     End
   Else
   If Dataset = cdsValidatorDisplaysMT Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;

       if Assigned(FrmValidatorDisplaysMT) then
       begin
         sHex := IntToHex(DataSet.FieldByName('VDM_LEDSETTINGS').AsInteger,4);
         wLeds := HexToBin2(sHex);
         with FrmValidatorDisplaysMT do
         begin
           chkBeepCurto.Checked     := False;
           chkVermelho.Checked      := False;
           chkPiscaVermelho.Checked := False;
           chkAmarelo.Checked       := False;
           chkPiscaAmarelo.Checked  := False;
           chkVerde.Checked         := False;
           chkPiscaVerde.Checked    := False;
           chkBeepLongo.Checked     := False;
           chkSetLeds.Checked       := False;
           chkOrLeds.Checked        := False;


           if (Copy(wLeds,Length(wLeds),1)    = '1') and (Length(wLeds) > 0) then
             chkPiscaVermelho.Checked     := True;
           if (Copy(wLeds,Length(wLeds)-1,1)  = '1') and (Length(wLeds)-1 > 0) then
             chkPiscaAmarelo.Checked      := True;
           if (Copy(wLeds,Length(wLeds)-2,1)  = '1') and (Length(wLeds)-2 > 0) then
             chkPiscaVerde.Checked        := True;
           if (Copy(wLeds,Length(wLeds)-3,1)  = '1') and (Length(wLeds)-3 > 0) then
             chkBeepCurto.Checked         := True;
           if (Copy(wLeds,Length(wLeds)-4,1)  = '1') and (Length(wLeds)-4 > 0) then
             chkVermelho.Checked          := True;
           if (Copy(wLeds,Length(wLeds)-5,1)  = '1') and (Length(wLeds)-5 > 0) then
             chkAmarelo.Checked           := True;
           if (Copy(wLeds,Length(wLeds)-6,1)  = '1') and (Length(wLeds)-6 > 0) then
             chkVerde.Checked             := True;
           if (Copy(wLeds,Length(wLeds)-7,1)  = '1') and (Length(wLeds)-7 > 0) then
             chkBeepLongo.Checked         := True;
           if (Copy(wLeds,Length(wLeds)-8,1)  = '1') and (Length(wLeds)-8 > 0) then
             chkSetLeds.Checked       := True;
           if (Copy(wLeds,Length(wLeds)-9,1)  = '1') and (Length(wLeds)-9 > 0) then
             chkOrLeds.Checked        := True;
         end;
       end;
     End
   Else
   If Dataset = cdsValidatorDisplaysDT Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   If Dataset = cdsTimeLimits Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText   := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText   := StatusSetText;
       DataSet.FieldByName('TL_STATIME').OnGetText  := StaTimeGetText;
       DataSet.FieldByName('TL_ENDTIME').OnGetText  := EndTimeGetText;
     End
   Else
   If Dataset = cdsTimeGroups Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText   := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText   := StatusSetText;
       IF frmTimeGroups <> NIl then
       frmTimeGroups.ListaTimeLimits;
     End
   Else
   If Dataset = cdsLinePrices Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText   := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText   := StatusSetText;
     End
   Else
   If Dataset = cdsLineDiscounts Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
       DataSet.FieldByName('LDI_TIMESTART').OnGetText := StaTimeGetText;
       DataSet.FieldByName('LDI_TIMEEND').OnGetText   := EndTimeGetText;
       dmSys1.CreateLineDiscountsIndividual;
       IF (FrmLineDiscounts <> Nil) Then
          FrmLineDiscounts.GetDateTime;
     End
   Else
   If Dataset = cdsMasterApp Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsIssuers Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsSystemParameters Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsStatisticalFamilies Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
       If (FrmStatisticalFamilies <> Nil) Then
           FrmStatisticalFamilies.ListConditions;
     End
   Else
   If Dataset = cdsUserTypesCad Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsCarddesignCad Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsCardTemplates Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsReloadPeriodMT Then
     Begin
       DataSet.FieldByName('PERIODO').OnGetText      := PeriodGetText;
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
//       cdsReloadPeriodDT.Close;
//       cdsReloadPeriodDT.Params.ParamByName('RPM_YEAR').AsString   := DataSet.FieldByname('RPM_YEAR').AsString;
//       cdsReloadPeriodDT.Params.ParamByName('RPM_PERIOD').AsString := DataSet.FieldByname('RPM_PERIOD').AsString;
//       cdsReloadPeriodDT.Open;
     End
   Else
   If Dataset = cdsReloadPeriodDT Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsHolidays Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsTransportProviders Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
       IF FrmTransportProviders <> NIl Then
          FrmTransportProviders.SetLines;
     End
   Else
   If Dataset = cdsTransportProvidersXLineMT Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
   Else
   If Dataset = cdsUseRestrictionGroups Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;


       cdsGeral.Close;
       cdsGeral.CommandText := 'Select URGPUT_ID,                        '+
                               '       URG_ID,                           '+
                               '       PUT.PUT_ID,                       '+
                               '       URGPUT_PERUSELIMIT,               '+
                               '       URGPUT_STATUS,                    '+
                               '       URGPUT_REGDATE,                   '+
                               '       URGPUT_REGUSER,                   '+
                               '       PUT.PUT_DESC                      '+
                               '  FROM USERESTGROUPSXPERUSETYPES URGPUT  '+
                               ' INNER JOIN PERIODUSETYPES PUT           '+
                               '    ON URGPUT.PUT_ID=PUT.PUT_ID          '+
                               ' WHERE URG_ID= ' + INTTOSTR(cdsUseRestrictionGroups.FieldByName('URG_ID').AsInteger);
       cdsGeral.Open;

       cdsGridPeriodo.Close;
       cdsGridPeriodo.CreateDataSet;

       cdsGeral.First;

       while not cdsGeral.Eof do
       begin
          cdsGridPeriodo.Append;
          cdsGridPeriodo.FieldByName('URGPUT_ID').AsInteger          := cdsGeral.FieldByName('URGPUT_ID').AsInteger;
          cdsGridPeriodo.FieldByName('URG_ID').AsInteger             := cdsGeral.FieldByName('URG_ID').AsInteger;
          cdsGridPeriodo.FieldByName('PUT_ID').AsInteger             := cdsGeral.FieldByName('PUT_ID').AsInteger;
          cdsGridPeriodo.FieldByName('URGPUT_PERUSELIMIT').AsInteger := cdsGeral.FieldByName('URGPUT_PERUSELIMIT').AsInteger;
          cdsGridPeriodo.FieldByName('URGPUT_STATUS').AsString       := cdsGeral.FieldByName('URGPUT_STATUS').AsString;
          cdsGridPeriodo.FieldByName('URGPUT_STATUS').AsString       := cdsGeral.FieldByName('URGPUT_STATUS').AsString;
          cdsGridPeriodo.FieldByName('URGPUT_REGDATE').AsDateTime    := cdsGeral.FieldByName('URGPUT_REGDATE').AsDateTime;
          cdsGridPeriodo.FieldByName('PUT_DESC').AsString            := cdsGeral.FieldByName('PUT_DESC').AsString;
          cdsGridPeriodo.FieldByName('URGPUT_REGUSER').AsString      := cdsGeral.FieldByName('URGPUT_REGUSER').AsString;
          cdsGridPeriodo.Post;
          cdsGeral.Next;
       end;
     End
   Else
   If Dataset = cdsUseRestGroupsXPerUseTypes Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText    := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText    := StatusSetText;
     End
  ;
end;

procedure TDmSys.StatusSetText(Sender: TField; const Text: String);
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

procedure TDmSys.PeriodGetText(Sender: TField; var Text: String; DisplayText: Boolean);
Begin
  if DisplayText then
     Text    := Meses[Sender.AsInteger];
End;

procedure TDmSys.StaTimeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
Begin
  if DisplayText then
     IF Sender.AsDatetime = 0 Then
        Text := ''
     Else
        Text := FormatDateTime('hh:mm',Sender.AsDateTime);
End;

procedure TDmSys.EndTimeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
Begin
  if DisplayText then
     IF Sender.AsDateTime = 0 Then
        Text := ''
     Else
       Text    := FormatDateTime('hh:mm',Sender.AsDateTime);
End;

procedure TDmSys.StatusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
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

procedure TDmSys.App_IssGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
 inherited;
     Text := cdsApplicationsLook.fieldByName('APP_ID').AsString + cdsApplicationsLook.fieldByName('ISS_ID').AsString;
end;

procedure TDmSys.App_IssOrigGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
 inherited;
     Text := cdsOrigAppLook.fieldByName('APP_ID').AsString + cdsOrigAppLook.fieldByName('ISS_ID').AsString;
end;


procedure TDmSys.ReasonActionGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      Try
        Text := HotListReason_Actions[Sender.asInteger];
      Except
        Text := '';
      End;
    end;
end;

procedure TDmSys.ReasonTypeGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if Sender.AsString = 'A' then
         Text := 'Aplicação'
      else
         if Sender.AsString = 'S' then
            Text := 'Único'
      else
         if Sender.AsString = 'R' then
            Text := 'Intervalo'
      else
         if Sender.AsString = 'E' then
            Text := 'Todos'
      else
            Text := '';
    end;
end;


procedure TDmSys.cdsValidatorDisplaysDTPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := UpperCase(E.Message);
  if ErroMens = 'KEY VIOLATION.' then
    begin
      DisplayMsg(FrmValidatorDisplaysMT.t_form_objects, '%T %T', [2818, 1502], []);
      action := daAbort;
    end
  Else
  if ErroMens = 'FIELD '+'''VDD_LINE'''+ ' MUST HAVE A VALUE' then
    begin
      DisplayMsg(FrmValidatorDisplaysMT.t_form_objects, '%T', [2820], []);
      action := daAbort;
    end
  Else
  if ErroMens = 'FIELD '+'''VDD_COLUMN'''+' MUST HAVE A VALUE' then
    begin
      DisplayMsg(FrmValidatorDisplaysMT.t_form_objects, '%T', [2821], []);
      action := daAbort;
    end
  Else
  if ErroMens = 'FIELD '+'''VDD_TEXT'''+' MUST HAVE A VALUE' then
    begin
      DisplayMsg(FrmValidatorDisplaysMT.t_form_objects, '%T', [2822], []);
      action := daAbort;
    end
end;

procedure TDmSys.cdsSystemParametersPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmSystemParameters.t_form_objects, '%T %T %T', [2818, 1502, 1602], []);
      FrmSystemParameters.dbCodigo.setfocus;
      action := daAbort;
    end
end;

procedure TDmSys.cdsReloadPeriodMTPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmReloadPeriod.t_form_objects, '%T %T %T %T', [2818, 1502, 2823, 1605], []);
//      FrmReloadPeriod.dblkPeriod.setfocus;
      action := daAbort;
    end
end;

procedure TDmSys.cdsReloadPeriodDTPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmReloadPeriod.t_form_objects, '%T %T %T %T', [2818, 1502, 1522, 1605], []);
      FrmReloadPeriod.dbLkApplications.setfocus;
      action := daAbort;
    end

end;

Procedure TDmSys.Selecionadisponiveis;
Begin

End;

procedure TDmSys.cdsValidatorDisplaysDTAfterInsert(DataSet: TDataSet);
begin
  dmsys.cdsValidatorDisplaysDT.FieldByName('VDM_CODE').AsInteger :=
  dmsys.cdsValidatorDisplaysMT.FieldByName('VDM_CODE').AsInteger
end;

procedure TDmSys.cdsApplicationsAfterScroll(DataSet: TDataSet);
begin
   IF Dataset = cdsBioFacial Then  //cidel+SU-50158
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsApplications Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
       If FrmApplications <> Nil Then
       begin
          if DataSet.State <> dsInsert then
          begin
            dmSys1.cdsCardDesignxApps.Close;
            dmSys1.cdsCardDesignxApps.CommandText := 'SELECT CD.CD_DESC, CDXA.* FROM CARDDESIGNXAPPLICATIONS CDXA LEFT JOIN CARDDESIGN CD ON CD.CD_ID = CDXA.CD_ID WHERE CDXA.APP_ID = '+DataSet.FieldByName('APP_ID').AsString+' AND CDXA.ISS_ID = '+DataSet.FieldByName('ISS_ID').AsString;
            dmSys1.cdsCardDesignxApps.Open;

            dmSys1.cdsCardTemplatesxApps.Close;
            dmSys1.cdsCardTemplatesxApps.CommandText := 'SELECT CTE.CTE_DESC, PUT.PUT_DESC, TG.TG_DESC, VP.VP_DESC, LG.LG_DESC, LM.LM_DESC, VT.VT_DESC, DS.DS_DESC, CTA.CTA_VALDATEQTY, CTA.ISS_ID, CTA.APP_ID, CTA.CTE_ID, CTA.PUT_ID, CTA.TG_ID, CTA.VP_ID, CTA.LG_ID, CTA.LM_ID, CTA.VT_ID, CTA.DS_ID ';
            dmSys1.cdsCardTemplatesxApps.CommandText := dmSys1.cdsCardTemplatesxApps.CommandText + 'FROM CARDTEMPLATESXAPPLICATIONS CTA LEFT JOIN CARDTEMPLATES CTE    ON CTE.CTE_ID = CTA.CTE_ID LEFT JOIN PERIODUSETYPES PUT   ON PUT.PUT_ID = CTA.PUT_ID LEFT JOIN TIMEGROUPS TG        ON TG.TG_ID ';
            dmSys1.cdsCardTemplatesxApps.CommandText := dmSys1.cdsCardTemplatesxApps.CommandText + ' = CTA.TG_ID LEFT JOIN VALIDATIONPERIODS VP ON VP.VP_ID   = CTA.VP_ID LEFT JOIN LINEGROUPS LG        ON LG.LG_ID   = CTA.LG_ID LEFT JOIN LINEMT LM            ON LM.LM_ID   = CTA.LM_ID LEFT JOIN ';
            dmSys1.cdsCardTemplatesxApps.CommandText := dmSys1.cdsCardTemplatesxApps.CommandText + 'VALIDITYTYPES VT     ON VT.VT_ID   = CTA.VT_ID LEFT JOIN DATESTATUS DS        ON DS.DS_ID   = CTA.DS_ID WHERE CTA.APP_ID = ' + DataSet.FieldByName('APP_ID').AsString+' AND CTA.ISS_ID = '+DataSet.FieldByName('ISS_ID').AsString;
            dmSys1.cdsCardTemplatesxApps.Open;

            dmSys1.cdsCardTypesXApps.Close;
            dmSys1.cdsCardTypesXApps.CommandText := 'SELECT CTY.CTY_DESC,CTYAPP.* FROM CARDTYPESXAPPLICATIONS CTYAPP LEFT JOIN CARDTYPES CTY ON CTY.CTY_ID = CTYAPP.CTY_ID WHERE CTYAPP.APP_ID = '+DataSet.FieldByName('APP_ID').AsString+' AND CTYAPP.ISS_ID = '+DataSet.FieldByName('ISS_ID').AsString;
            dmSys1.cdsCardTypesXApps.Open;

            dmSys1.cdsTPXApps.Close;
            dmSys1.cdsTPXApps.CommandText := 'SELECT TP.TP_DESC, TPA.* FROM TRANSPORTPROVIDERSXAPPS TPA LEFT JOIN TRANSPORTPROVIDERS TP ON TP.TP_ID = TPA.TP_ID WHERE TPA.APP_ID = '+DataSet.FieldByName('APP_ID').AsString+' AND TPA.ISS_ID = '+DataSet.FieldByName('ISS_ID').AsString;
            dmSys1.cdsTPXApps.Open;

            dmSys1.cdsUserTypesXApps.Close;
            dmSys1.cdsUserTypesXApps.CommandText := 'SELECT UT.UT_DESC, UTA.* FROM USERTYPESXAPPLICATIONS UTA LEFT JOIN USERTYPES UT ON UT.UT_ID = UTA.UT_ID WHERE UTA.APP_ID = '+DataSet.FieldByName('APP_ID').AsString+' AND UTA.ISS_ID = '+DataSet.FieldByName('ISS_ID').AsString;
            dmSys1.cdsUserTypesXApps.Open;

            dmSys1.cdsApplicationsXLineMT.Close;
            dmSys1.cdsApplicationsXLineMT.CommandText := 'SELECT APPLM.*, LM.LM_DESC, APP.APP_DESCSHORT, ISS.ISS_DESCLONG  FROM APPLICATIONSXLINEMT APPLM INNER JOIN APPLICATIONS APP ON (APP.APP_ID =  APPLM.APP_ID AND APP.ISS_ID = APPLM.ISS_ID) INNER JOIN LINEMT LM ON (LM.LM_ID = APPLM.LM_ID) ';
            dmSys1.cdsApplicationsXLineMT.CommandText := dmSys1.cdsApplicationsXLineMT.CommandText + ' INNER JOIN ISSUERS ISS ON (ISS.ISS_ID = APPLM.ISS_ID) WHERE APPLM.ISS_ID = '+DataSet.FieldByName('ISS_ID').AsString+' AND APPLM.APP_ID = '+DataSet.FieldByName('APP_ID').AsString;
            dmSys1.cdsApplicationsXLineMT.Open;

          end
          else
          begin
            dmSys1.cdsCardDesignxApps.Close;
            dmSys1.cdsCardTemplatesxApps.Close;
            dmSys1.cdsCardTypesXApps.Close;
            dmSys1.cdsTPXApps.Close;
            dmSys1.cdsUserTypesXApps.Close;
          end;

          FrmApplications.SetOrigApp;
       end;
     End
   Else
   IF Dataset = cdsSubApplications Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsHotListReason Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText   := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText   := StatusSetText;
       DataSet.FieldByName('ACTION_DESC').OnGetText := ReasonActionGetText;
       DataSet.FieldByName('TYPE_DESC').OnGetText   := ReasonTypeGetText;
     End
   Else
   IF Dataset = cdsValidatorStatesXApps Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsProviderTypes Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsValidatorMessages Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsCollectors Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsCardDesignXApp Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
       IF FrmCardDesign <> nil Then
         begin
          FrmCardDesign.tbtnDeletePeriod.Enabled := NOT (Dataset.RecordCount = 0);
          FrmCardDesign.tbtnEditCardApp.Enabled  := NOT (Dataset.RecordCount = 0);
         end;
     End
   Else
   IF Dataset = cdsCardDesignXApp Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
       IF FrmCardDesign <> nil Then
         begin
          FrmCardDesign.tbtnDeletePeriod.Enabled := NOT (Dataset.RecordCount = 0);
          FrmCardDesign.tbtnEditCardApp.Enabled  := NOT (Dataset.RecordCount = 0);
         end;
     End
   Else
   IF Dataset = cdsCardTemplatesXApp Then
     Begin
       IF FrmCardTemplates <> nil Then
         begin
           FrmCardTemplates.tbtnDeletePeriod.Enabled := NOT (Dataset.RecordCount = 0);
           FrmCardTemplates.tbtnEditCardApp.Enabled  := NOT (Dataset.RecordCount = 0);
         end;
     End
   Else
   IF Dataset = cdsSeries Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsStatisticalGroups Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsCardTypes Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   IF Dataset = cdsProvidersxProviderTypes Then
     Begin
       DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
       DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
     End
   Else
   If Dataset = cdsApplicationsLook Then
     Begin
       DataSet.FieldByName('APP_ISS_ID').OnGetText := App_IssGetText;
     End
   Else
   If Dataset = cdsOrigAppLook Then
     Begin
       DataSet.FieldByName('APP_ISS_ID').OnGetText := App_IssOrigGetText;
     End
   Else
   IF Dataset = cdsTransportProvidersGroups Then
      Begin
        DataSet.FieldByName('STATUS_ID').OnGetText  := StatusGetText;
        DataSet.FieldByName('STATUS_ID').OnSetText  := StatusSetText;
      End

end;

procedure TDmSys.cdsApplicationsBeforePost(DataSet: TDataSet);
var inicials : String;
begin
   if DataSet = cdsBioFacial then  //cidel+SU-50158
     Begin
      inicials := 'BIDC';
      if DataSet.FieldByName(inicials+'_ID').IsNull then
         DataSet.FieldByName(inicials+'_ID').AsInteger := -1;
     End
   Else
   if DataSet = cdsApplications then
      inicials := 'APP'
   Else
   if DataSet = cdsValFunc then
      inicials := 'VF'
   Else
   if DataSet = cdsSubApplications then
      inicials := 'SA'
   Else
   if DataSet = cdsKeyTypes then
    begin
      if DataSet.FieldByName('KT_STATUS').IsNull then
         DataSet.FieldByName('KT_STATUS').AsString := 'A';
      if DataSet.FieldByName('STATUS_ID').IsNull then
         DataSet.FieldByName('STATUS_ID').AsString := 'A';
      inicials := 'KT'
    end
   Else
   if DataSet = cdsValidatorStatesXApps then
      inicials := 'VSAPP'
   Else
   if DataSet = cdsProviders then
     Begin
      if DataSet.FieldByName('PRV_ID').IsNull then
         DataSet.FieldByName('PRV_ID').AsInteger := -1;
      inicials := 'PRV'
     End
   Else
   if DataSet = cdsProviderTypes then
     Begin
      inicials := 'PRVT'
     End
   Else
   if DataSet = cdsCollectors then
     Begin
      if DataSet.FieldByName('COL_ID').IsNull then
         DataSet.FieldByName('COL_ID').AsInteger := -1;
       inicials := 'COL'
     End
   Else
   if DataSet = cdsCardDesignXApp then
     Begin
       inicials := 'CDAPP'
     End
   Else
   if DataSet = cdsSeries then
     Begin
       inicials := 'SE'
     End
   Else
   if DataSet = cdsTimeGroupsXTimeLimits then
     Begin
       inicials := 'TGTL'
     End
   Else
   if DataSet = cdsStatisticalGroups then
     Begin
      if DataSet.FieldByName('SG_ID').IsNull then
         DataSet.FieldByName('SG_ID').AsInteger := -1;
       inicials := 'SG'
     End
   Else
   if DataSet = cdsCardTypes then
     Begin
      if DataSet.FieldByName('CTY_ID').IsNull then
         DataSet.FieldByName('CTY_ID').AsInteger := -1;
       inicials := 'CTY'
     End
   Else
   if DataSet = cdsHandicapTypes then
     Begin
      if DataSet.FieldByName('HT_ID').IsNull then
         DataSet.FieldByName('HT_ID').AsInteger := -1;
      if DataSet.FieldByName('HT_STATUS').IsNull then
         DataSet.FieldByName('HT_STATUS').AsString := 'A';
       inicials := 'HT'
     End
   Else
   if DataSet = cdsHotListReason then
     Begin
      if DataSet.FieldByName('HLR_ID').IsNull then
         DataSet.FieldByName('HLR_ID').AsInteger := -1;
      if DataSet.FieldByName('HLR_STATUS').IsNull then
         DataSet.FieldByName('HLR_STATUS').AsString := 'A';
       inicials := 'HLR'
     End
  Else
  if DataSet = cdsProvidersxProviderTypes Then
     Begin
       inicials := 'PRVPRVT';
     End
  Else
  if DataSet = cdsTransportProvidersGroups Then
     Begin
       inicials := 'TPG';
     End;

  SetNameUser(DataSet, inicials);
end;

procedure TDmSys.cdsApplicationsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmApplications.t_form_objects, '%T %T %T %T', [2818, 1502, 1522, 1605], []);
      FrmApplications.dbApp.setfocus;
      action := daAbort;
    end

end;

procedure TDmSys.cdsAppsXValidatorActionsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmApplications.t_form_objects, '%T', [2819], []);
      action := daAbort;
    end
end;

procedure TDmSys.cdsAppsXValidatorConditionsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmApplications.t_form_objects, '%T', [2819], []);
      action := daAbort;
    end
end;

procedure TDmSys.cdsAppsXValVisualActionsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmApplications.t_form_objects, '%T', [2819], []);
      action := daAbort;
    end
end;

procedure TDmSys.cdsValidatorStatesXAppsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmApplications.t_form_objects, '%T', [2819], []);
      action := daAbort;
    end
end;

procedure TDmSys.cdsIssuersPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(frmissuers.t_form_objects, '%T', [1602], []);
      frmissuers.dbCodigo.setfocus;
      action := daAbort;
    end
end;

procedure TDmSys.DataModuleCreate(Sender: TObject);
begin
  if DmConexao.connectionType = 'DCOMM' then
     shrConnMaster.ParentConnection := DmConexao.DCOMConnMaster
  else
     shrConnMaster.ParentConnection := DmConexao.SocketConnMaster;
  ConnBrkMaster.Connected := True;  //cidel- teste
end;

procedure TDmSys.DataModuleDestroy(Sender: TObject);
begin
  ConnBrkMaster.Connected := False;
end;

procedure TDmSys.cdsProviderTypesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmProviderTypes.t_form_objects, '%T', [1602], []);
      FrmProviderTypes.dbCodigo.setfocus;
      action := daAbort;
    end

end;

procedure TDmSys.cdsProviderTypePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmProviderTypes.t_form_objects, '%T', [1602], []);
      FrmProviderTypes.dbCodigo.setfocus;
      action := daAbort;
    end
end;

procedure TDmSys.cdsProviderTypesReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  DataSet.Cancel;
  DataSet.Close;
  DataSet.Open;
//  DisplayMsg(FrmProviderTypes.t_form_objects, '%T', [1602], []);
  Action := raCancel;
end;

procedure TDmSys.cdsValidatorDisplaysMTPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
 Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmValidatorDisplaysMT.t_form_objects, '%T', [1602], []);
      FrmValidatorDisplaysMT.dbCodigo.setfocus;
      action := daAbort;
    end

end;

procedure TDmSys.cdsLinePricesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
 Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmLineMT.t_form_objects, '%T %T %T %T', [2818, 1502, 1567, 2824], []);
      FrmLineMT.dbDate.setfocus;
      action := daAbort;
    end

end;

procedure TDmSys.cdsCardTemplatesXAppPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
 Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmCardTemplates.t_form_objects, '%T %T', [1522, 1605], []);
      FrmCardTemplates.dbLkApplications.setfocus;
      action := daAbort;
    end
end;

procedure TDmSys.cdsCardDesignXAppPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
 Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmCardDesign.t_form_objects, '%T %T', [1522, 1605], []);
      FrmCardDesign.dbLkApplications.setfocus;
      action := daAbort;
    end
end;

procedure TDmSys.cdsMasterAppPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
 Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmMasterApp.t_form_objects, '%T', [1602], []);
      FrmMasterApp.dbCodigo.setfocus;
      action := daAbort;
    end
end;


procedure TDmSys.cdsUserTypesXApplicationsCadPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
 Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmUserTypes.t_form_objects, '%T %T', [1522, 1605], []);
      FrmUserTypes.dbLkApplications.setfocus;
      action := daAbort;
    end
end;

procedure TDmSys.cdsCardTypesXApplicationsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
 Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmCardTypes.t_form_objects, '%T %T', [1522, 1605], []);
      FrmCardTypes.dbLkApplications.setfocus;
      action := daAbort;
    end

end;

procedure TDmSys.cdsProvidersxProviderTypesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
//  Var
//ErroMens :String;
begin
{ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(t_form_objects, '%T %T', [1600, 1605], []);
      FrmProviders.dbProviderTypes.setfocus;
      action := daAbort;
    end
}
end;

procedure TDmSys.cdsPersonnelTypesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
  Var
ErroMens :String;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmPersonnelTypes.t_form_objects, '%T', [1602], []);
      FrmPersonnelTypes.dbPrstId.setfocus;
      action := daAbort;
    end

end;

procedure TDmSys.cdsCarddesignCadReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDmSys.cdsCardTemplatesReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);

end;

procedure TDmSys.cdsHandicapTypesAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FrmHandicapTypes) then
    FrmHandicapTypes.PreencheCheckBoxes;
end;

procedure TDmSys.cdsStudentTypesReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDmSys.cdsApplicationFunctionVersionsBeforePost(
  DataSet: TDataSet);
begin
 with tclientDataSet(DataSet) do
 Begin
  if FieldByName('AFV_VALIDITY').IsNull then FieldByName('AFV_VALIDITY').value := formatDateTime('DD/MM/YYY',dmConexao.GetCurrentDateTime);


  FieldByName('AF_ID').Value := cdsApplicationFunctions.FieldByName('AF_ID').value;

  if state = dsInsert then
  Begin
    FieldByName('AFV_RegDate').AsDateTime := DmConexao.ConnBrkMaster.AppServer.GetCurrentDateTime;
    FieldByName('AFV_RegUser').AsString := UpperCase(DMConexao.SystemUser_Str);
    FieldByName('AFV_STATUS').Value  := 'A';
  end;



 end;

end;

procedure TDmSys.cdsTransprovXVehTypesXAppsPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  ErroMens: string;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
  begin
    DisplayMsg(FrmApplications.t_form_objects, '%T', [2819], []);
    action := daAbort;
  end;
end;

procedure TDmSys.cdsVehTypXAppPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  ErroMens: string;
begin
ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
  begin
    DisplayMsg(FrmApplications.t_form_objects, '%T', [2819], []);
    action := daAbort;
  end;
end;

procedure TDmSys.cdsReceiptMtAfterScroll(DataSet: TDataSet);
begin
  DataSet.FieldByName('STATUS_ID').OnGetText := StatusGetText;
  DataSet.FieldByName('STATUS_ID').OnSetText := StatusSetText;
end;

procedure TDmSys.cdsReceiptDtAfterScroll(DataSet: TDataSet);
begin
  DataSet.FieldByName('STATUS_ID').OnGetText := StatusGetText;
  DataSet.FieldByName('STATUS_ID').OnSetText := StatusSetText;
end;

procedure TDmSys.cdsUseRestGroupsXPerUseTypesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
 Var
  ErroMens :String;
begin
 ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
    begin
      DisplayMsg(FrmUseRestrictionGroups.t_form_objects, '%T %T', [1522, 1605], []);
      action := daAbort;
    end
end;

end.
