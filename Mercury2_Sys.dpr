program Mercury2_Sys;

// Origem notebook
// Versão 16.8.0.0

// C:\Spark\BaseForms;C:\Spark\Common;C:\Spark\Mercury\Modules\Common;C:\Spark\Common\Recorder

{%File 'Includes\Rotina_01.inc'}
{%File 'Includes\GravaBanco_01.inc'}
{%File 'Includes\GravaBanco_03.inc'}
{%File 'Includes\GravaBanco_02.inc'}
{%File 'Includes\Rotina_02.inc'}
{%File 'Includes\GravaBanco_04.inc'}
// Utiliza C:\Spark\PrjMercury2_Server

uses
  Forms,
  Controls,
  QDialogs,
  SysUtils,
  Registry,
  Windows,
  uDmSys in 'uDmSys.pas' {DmSys: TDataModule},
  uFrmBaseSys in 'uFrmBaseSys.pas' {FrmBaseSys},
  uFrmLineGroups in 'uFrmLineGroups.pas' {FrmLineGroups},
  uPersonnelTypes in 'uPersonnelTypes.pas' {FrmPersonnelTypes},
  uValidatorMessages in 'uValidatorMessages.pas' {FrmValidadorMessages},
  uValidatorDisplaysMT in 'uValidatorDisplaysMT.pas' {FrmValidatorDisplaysMT},
  uCardDesign in 'uCardDesign.pas' {FrmCardDesign},
  uCardTemplates in 'uCardTemplates.pas' {FrmCardTemplates},
  uIssuers in 'uIssuers.pas' {FrmIssuers},
  uLineDiscounts in 'uLineDiscounts.pas' {FrmLineDiscounts},
  uLinePrices in 'uLinePrices.pas' {FrmLinePrices},
  uMasterApplications in 'uMasterApplications.pas' {FrmMasterApp},
  uReloadPeriod in 'uReloadPeriod.pas' {FrmReloadPeriod},
  uStatisticalFamilies in 'uStatisticalFamilies.pas' {FrmStatisticalFamilies},
  uSystemParameters in 'uSystemParameters.pas' {FrmSystemParameters},
  uTimeGroups in 'uTimeGroups.pas' {FrmTimeGroups},
  uTimeLimits in 'uTimeLimits.pas' {FrmTimeLimits},
  uUserTypes in 'uUserTypes.pas' {FrmUserTypes},
  uDiscountTypes in 'uDiscountTypes.pas' {FrmDiscountTypes},
  uPersonnelTypesXValidatorFcts in 'uPersonnelTypesXValidatorFcts.pas' {frmPersonnelTypesXValidatorFcts},
  uTransportProviders in 'uTransportProviders.pas' {FrmTransportProviders},
  uApplications in 'uApplications.pas' {FrmApplications},
  uFuncoes in 'uFuncoes.pas' {FrmFuncoes},
  uFrmLineMT in 'uFrmLineMT.pas' {FrmLineMT},
  uAppAbout in 'uAppAbout.pas' {FrmAbout},
  uProviderTypes in 'uProviderTypes.pas' {FrmProviderTypes},
  uFrmCollectors in 'uFrmCollectors.pas' {FrmCollectors},
  uHolidays in 'uHolidays.pas' {FrmHolidays},
  uPaymentModesVt in 'uPaymentModesVt.pas' {FrmPaymentModesVt},
  uDmVtPos in 'uDmVtPos.pas' {DmVtPos: TDataModule},
  uStatisticalGroups in 'uStatisticalGroups.pas' {FrmStatisticalGroups},
  uFrmAcceptedFct in 'uFrmAcceptedFct.pas' {FrmAcceptedFct},
  uCardTypes in 'uCardTypes.pas' {FrmCardTypes},
  uExportLocations in 'uExportLocations.pas' {FrmExportLocations},
  uLineIntegration in 'uLineIntegration.pas' {FrmLineIntegration},
  uNewIntegration in 'uNewIntegration.pas' {FrmNewIntegration},
  uListaDescontos in 'uListaDescontos.pas' {FrmListaDescontos},
  uLines_Integrations in 'uLines_Integrations.pas' {FrmLinha_Integracao},
  uHandicapTypes in 'uHandicapTypes.pas' {FrmHandicapTypes},
  uDepot in 'uDepot.pas' {FrmDepots},
  uSoftwareTypes in 'uSoftwareTypes.pas' {FrmSoftwareTypes},
  uSoftwares in 'uSoftwares.pas' {FrmSoftwares},
  uDmSys1 in 'uDmSys1.pas' {dmSys1: TDataModule},
  uHotlistReason in 'uHotlistReason.pas' {FrmHotlistReason},
  uFrmDataTypes in 'uFrmDataTypes.pas' {FrmDataTypes},
  uFrmLanguages in 'uFrmLanguages.pas' {FrmLanguages},
  uFrmForms in 'uFrmForms.pas' {FrmForms},
  uFrmModules in 'uFrmModules.pas' {FrmModules},
  uFrmKeyTypes in 'uFrmKeyTypes.pas' {FrmKeyTypes},
  AppSparkSysMain in 'AppSparkSysMain.pas' {FrmSparkSysMain},
  uFrmSystemRoles in 'uFrmSystemRoles.pas' {FrmSystemRoles},
  uFrmSystemUserGroups in 'uFrmSystemUserGroups.pas' {FrmSystemUserGroups},
  uFrmObjects in 'uFrmObjects.pas' {FrmObjects},
  uFrmObjectTypes in 'uFrmObjectTypes.pas' {FrmObjectTypes},
  uFrmObjectTranslation in 'uFrmObjectTranslation.pas' {FrmObjectTranslation},
  uFrmBatchTranslation in 'uFrmBatchTranslation.pas' {FrmBatchTranslation},
  uFrmTransportProvidersGroups in 'uFrmTransportProvidersGroups.pas' {frmTransportProvidersGroups},
  uFrmAddressTypes in 'uFrmAddressTypes.pas' {FrmAddressTypes},
  uFrmEmailTypes in 'uFrmEmailTypes.pas' {FrmEmailTypes},
  uFrmTelephoneTypes in 'uFrmTelephoneTypes.pas' {FrmTelephoneTypes},
  uFrmDocumentTypes in 'uFrmDocumentTypes.pas' {FrmDocumentTypes},
  uFrmRemotePrinters in 'uFrmRemotePrinters.pas' {FrmRemotePrinters},
  uFrmPersonnelFunctions in 'uFrmPersonnelFunctions.pas' {FrmPersonnelFunctions},
  UFrmRptDialog in 'UFrmRptDialog.pas' {FrmRptDialog},
  uFrmPeriodUseTypes in 'uFrmPeriodUseTypes.pas' {FrmPeriodUseTypes},
  ufrmApprovationtypes in 'ufrmApprovationtypes.pas' {frmApprovationTypes},
  uFrmCardLevelPrices in 'uFrmCardLevelPrices.pas' {frmCardLevelPrices},
  uRelApplications in 'uRelApplications.pas' {frmRelApplications},
  uStates in 'uStates.pas' {frmStates},
  uRegion in 'uRegion.pas' {frmRegion},
  uCities in 'uCities.pas' {frmCities},
  uReasonTypes in 'uReasonTypes.pas' {frmReasonTypes},
  uReasons in 'uReasons.pas' {frmReasons},
  uHandicapEquipment in 'uHandicapEquipment.pas' {frmHandicapEquipment},
  ufrmBanks in 'ufrmBanks.pas' {frmBanks},
  ufrmApplicationFunctions in 'ufrmApplicationFunctions.pas' {frmApplicationFunction},
  uFrmLineSelGroups in 'uFrmLineSelGroups.pas' {FrmLineSelGroups},
  udlg_Ins_TransprovXVehTypesXApps in 'udlg_Ins_TransprovXVehTypesXApps.pas' {dlg_Ins_TransprovXVehTypesXApps},
  uFrmZoneLocations in 'uFrmZoneLocations.pas' {FrmZoneLocations},
  uFrmZones in 'uFrmZones.pas' {frmZones},
  ufrmReceipts in 'ufrmReceipts.pas' {frmReceipts},
  uFrmLineIntegTimeGroups in 'uFrmLineIntegTimeGroups.pas' {FrmLineIntegTimeGroups},
  uFrmLineIntegTimeLimits in 'uFrmLineIntegTimeLimits.pas' {frmLineIntegTimeLimits},
  uFrmLineIntegPeriods in 'uFrmLineIntegPeriods.pas' {FrmLineIntegPeriods},
  ufrmStudentTypes in 'ufrmStudentTypes.pas' {frmStudentTypes},
  uUseRestrictionGroups in 'uUseRestrictionGroups.pas' {FrmUseRestrictionGroups},
  uCardBUTypeLineIntegrationType in 'uCardBUTypeLineIntegrationType.pas' {FrmCardBUTypeLineIntegrationType},
  uFrmPersonnelFunctionGroup in 'uFrmPersonnelFunctionGroup.pas' {FrmPersonnelFunctionGroup},
  uFTPExportLocations in 'uFTPExportLocations.pas' {FrmFTPExportLocations},
  uFrmInfoParameters in 'uFrmInfoParameters.pas' {FrmInfoParameters},
  uFrmTransportProvidersXInfoParameters in 'uFrmTransportProvidersXInfoParameters.pas' {FrmTransportProvidersXInfoParameters},
  SelectAplicacao in 'SelectAplicacao.pas' {FormSelectAplicacao},
  uValidatorFunctions in 'uValidatorFunctions.pas' {FrmValidatorFunctions},
  uFrmBits in 'uFrmBits.pas' {FrmBits},
  uFrrmTarifas in 'uFrrmTarifas.pas' {FrmTarifas},
  uFrmMemo in 'uFrmMemo.pas' {frmMemo},
  uFrmAutoTarifas in 'uFrmAutoTarifas.pas' {FrmAutoTarifas},
  ufrmDetalhe in 'ufrmDetalhe.pas' {frmDetalhe},
  uFrmBioFacial in 'uFrmBioFacial.pas' {FrmBioFacial},
  Aguarde in '..\Common_DC\aguarde.pas' {FormAguarde},
  Dial in '..\Common_DC\Dial.pas' {FormDial},
  uCommonFunctions in '..\Common_DC\UCommonFunctions.pas',
  uDataBaseFunctions in '..\Common_DC\uDataBaseFunctions.pas',
  Julian in '..\Common_DC\Julian.pas',
  Global in '..\Common_DC\Global.pas',
  uFrmBaseCadastro in '..\Common_DC\BaseForms\uFrmBaseCadastro.pas' {FrmBaseCadastro},
  uFrmBaseLogin in '..\Common_DC\BaseForms\uFrmBaseLogin.pas' {FrmBaseLogin},
  uConst in '..\Common_DC\BaseForms\uConst.pas',
  uGeralFunctions in '..\Common_DC\uGeralFunctions.pas',
  uDmBase in '..\Common_DC\BaseForms\uDmBase.pas' {DmBase: TDataModule},
  uDmBaseCadastro in '..\Common_DC\BaseForms\uDmBaseCadastro.pas' {DmBaseCadastro: TDataModule},
  uDmConexao in '..\Common_DC\BaseForms\uDmConexao.pas' {DmConexao: TDataModule},
  uFrmBase in '..\Common_DC\BaseForms\uFrmBase.pas' {FrmBase},
  uFrmBase0 in '..\Common_DC\BaseForms\uFrmBase0.pas' {FrmBase0},
  uFrmReconcileError in '..\Common_DC\BaseForms\uFrmReconcileError.pas' {FrmReconcileError},
  AppMain in '..\Common_DC\BaseForms\AppMain.pas' {FrmMain},
  uFrmSystemLog in '..\Common_DC\BaseForms\uFrmSystemLog.pas' {FrmSystemLog};

{$R *.res}

Var
  erro,dbVersion, exeVersion: string;
  reg: TRegistry;
  bVersionFree: Integer;
  HMutex: THandle;

begin
  HMutex := CreateMutex(nil, True, 'MeuProgramaUnico'); // Nome único do Mutex
  if (HMutex = 0) or (GetLastError = ERROR_ALREADY_EXISTS)
  then begin
       ShowMessage('O programa já está em execução!');
       Halt; // Encerra imediatamente
       end;
  Application.Initialize;
  Application.Title := 'Mercury Sys';
  Application.CreateForm(TFrmSparkSysMain, FrmSparkSysMain);
  Application.CreateForm(TFormAguarde, FormAguarde);
  Application.CreateForm(TFrmBits, FrmBits);
  Application.CreateForm(TFrmTarifas, FrmTarifas);
  Application.CreateForm(TfrmMemo, frmMemo);
  Application.CreateForm(TFrmAutoTarifas, FrmAutoTarifas);
  Application.CreateForm(TfrmDetalhe, frmDetalhe);
  FormAguarde.lblPosi.Caption:='Inicialização do SISTEMA';
  FormAguarde.Show; Application.ProcessMessages;

  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmBase, DmBase);
  Application.CreateForm(TDmSys, DmSys);
  Application.CreateForm(TdmSys1, dmSys1);
  Application.CreateForm(TDmVtPos, DmVtPos);
  Application.CreateForm(TFrmBaseLogin, FrmBaseLogin);

  Debug:=FileExists('c:\users\public\cta.dll');
//  IF Debug THEN // Debug
{ WITH FrmBaseLogin
  DO BEGIN
     edtUser.Text:='ADMIN';
     edtPass.Text:='LABHOMOL';
     END;  }
  Application.CreateForm(TFrmSystemLog, FrmSystemLog);

  dbVersion := dmConexao.GetActualVersion('APBSYS', erro);
  exeVersion := GetVersion(Application.ExeName);

  reg:=TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  reg.RootKey := HKEY_LOCAL_MACHINE;
  reg.OpenKey('SOFTWARE\AES Prodata\SYS', False);

  bVersionFree := 0;
  if reg.ValueExists('VersionFree')
  then bVersionFree := reg.ReadInteger('VersionFree');
  reg.Free;

  IF not Debug THEN
  if bVersionFree = 0 then
  if dbVersion <> exeVersion
  then begin
       FormAguarde.Hide;
       ShowMessage('ERRO FATAL: '#13#10#13#10+
                   'Versão do Banco DIFERE da versão do Executável'#13#10#13#10+
                   'Sistema ENCERRADO');
       Application.Terminate;
       Exit;
       end;
  Application.Run;

end.

