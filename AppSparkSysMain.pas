unit AppSparkSysMain;

interface

uses
  Windows, Messages, SysUtils, IniFiles, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AppMain, ImgList, StdActns, ActnList, Menus, ComCtrls, ToolWin,
  jpeg, ExtCtrls, RxGIF, uGeralFunctions, XPMan, StdCtrls, TypInfo, DB, Registry,
  RXCtrls;

type
  TStringObject = class(TObject)
    public
      Value: string;
      constructor Create(const AValue: string);
    end;
  TFrmSparkSysMain = class(TFrmMain)
    mnuLines: TMenuItem;
    mnuLineGroups: TMenuItem;
    mnuSystem: TMenuItem;
    mnuExit: TMenuItem;
    mnuApplication: TMenuItem;
    mnuPersonnelTypes: TMenuItem;
    mnuValidator: TMenuItem;
    mnuValidadorMessages: TMenuItem;
    mnuTabelasbasicas: TMenuItem;
    mnuDiscountTypes: TMenuItem;
    mnuValidatorDisplays: TMenuItem;
    mnuTimeGroups: TMenuItem;
    mnuMasterApplication: TMenuItem;
    mnuIssuers: TMenuItem;
    mnuSystemParameters: TMenuItem;
    mnuStatisticalFamilies: TMenuItem;
    mnuUserTypes: TMenuItem;
    mnuCardDesign: TMenuItem;
    mnuCardTemplates: TMenuItem;
    mnuReloadPeriod: TMenuItem;
    mnuPersonnelTypesXValidatorFunctions: TMenuItem;
    mnuHolidays: TMenuItem;
    mnuTransportProviders: TMenuItem;
    mnuApplications: TMenuItem;
    mnuProviderTypes: TMenuItem;
    mnuCollectors: TMenuItem;   //cidel-
    mnuCard: TMenuItem;
    mnuTimeLimits: TMenuItem;
    mnuVt: TMenuItem;
    mnuPaymentModes: TMenuItem;
    mnuPos: TMenuItem;
    mnuStatisticalGroups: TMenuItem;
    mnuAcceptedFunctional: TMenuItem;
    mnuCardTypes: TMenuItem;
    mnuEod: TMenuItem;
    mnuExportLocations: TMenuItem;
    mnuIntegration: TMenuItem;
    Action1: TAction;
    mnuHandicappedTypes: TMenuItem;
    mnuDepots: TMenuItem;
    mnuSoftwaresTypes: TMenuItem;
    mnuSoftwares: TMenuItem;
    mnuHotlistReason: TMenuItem;
    mnuSecurity: TMenuItem;
    mnuDataTypes: TMenuItem;
    mnuLanguages: TMenuItem;
    mnuForms: TMenuItem;
    mnuModules: TMenuItem;
    N7: TMenuItem;
    Privilgios1: TMenuItem;
    GruposdeUsuriosdoSystema1: TMenuItem;
    Objetos1: TMenuItem;
    iposdeObjetos1: TMenuItem;
    ObjectTraslation1: TMenuItem;
    raduoemMassa1: TMenuItem;
    mnmTransportProvidersGroups: TMenuItem;
    iposdeEndereos1: TMenuItem;
    Tipos: TMenuItem;
    iposdeTelefone1: TMenuItem;
    iposdeDocumentos1: TMenuItem;
    ImpressorasRemotas1: TMenuItem;
    Funes1: TMenuItem;
    Impresso1: TMenuItem;
    N12: TMenuItem;
    Modais1: TMenuItem;
    Relatrios1: TMenuItem;
    iposdedescontos1: TMenuItem;
    GruposdeAplicao1: TMenuItem;
    iposdeAprovao1: TMenuItem;
    PreosdosCartes1: TMenuItem;
    FunesdoValidador1: TMenuItem;
    Aplicaes1: TMenuItem;
    Estados1: TMenuItem;
    Regies1: TMenuItem;
    SubRegies1: TMenuItem;
    Cidades1: TMenuItem;
    iposdeRazes1: TMenuItem;
    Razes1: TMenuItem;
    EquipamentosparaDeficincia1: TMenuItem;
    Financeiro1: TMenuItem;
    Bancos1: TMenuItem;
    iposdeEstudantes1: TMenuItem;
    Funes2: TMenuItem;
    FunesdaAplicao1: TMenuItem;
    GrupodeSeleodeLinhas1: TMenuItem;
    mnuPontosTrechos: TMenuItem;
    mnuTrechos: TMenuItem;
    mnyRecibos: TMenuItem;
    mnuitmIntegracao: TMenuItem;
    N1: TMenuItem;
    mnuIntegTimeGroups: TMenuItem;
    mnuIntegPeriods: TMenuItem;
    mnuIntegTimeLimits: TMenuItem;
    USERESTRICTIONGROUPS: TMenuItem;
    Integraoportipodecarto1: TMenuItem;
    GruposdeCargosdeOperador1: TMenuItem;
    mnuFtpExportLocations: TMenuItem;
    mnuInfoParametersRDO: TMenuItem;
    mnuTransportProvidersxParametersRDO: TMenuItem;
    menuAutomatizacaoTarifas: TMenuItem;
    Image1: TImage;
    Image3: TImage;
    menuBiometriaFacial: TMenuItem;
    pnOpcoes: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbTabelasBasicas: TListBox;
    Panel1: TPanel;
    lbSeg: TListBox;
    Panel4: TPanel;
    lbAplicacao: TListBox;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel12: TPanel;
    lbEod: TListBox;
    Panel13: TPanel;
    Panel14: TPanel;
    lbValidador: TListBox;
    Panel15: TPanel;
    RxLabel1: TRxLabel;
    Panel11: TPanel;
    lbRelat: TListBox;
    Panel9: TPanel;
    lbModais: TListBox;
    Panel17: TPanel;
    lbCartao: TListBox;
    Panel10: TPanel;
    lbFinanceiro: TListBox;
    Panel16: TPanel;
    lbFuncoes: TListBox;
    Panel18: TPanel;
    lbIntegracao: TListBox;
    RxLabel2: TRxLabel;
    RxLabel3: TRxLabel;
    RxLabel4: TRxLabel;
    RxLabel5: TRxLabel;
    RxLabel6: TRxLabel;
    RxLabel7: TRxLabel;
    RxLabel8: TRxLabel;
    RxLabel9: TRxLabel;
    RxLabel10: TRxLabel;
    RxLabel11: TRxLabel;
    RxLabel12: TRxLabel;
    procedure mnuLineGroupsClick(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuPersonnelTypesClick(Sender: TObject);
    procedure mnuValidadorMessagesClick(Sender: TObject);
    procedure mnuDiscountTypesClick(Sender: TObject);
    procedure mnuValidatorDisplaysClick(Sender: TObject);
    procedure mnuTimeGroupsClick(Sender: TObject);
    procedure mmLinePricesClick(Sender: TObject);
    procedure mmLineDiscountsClick(Sender: TObject);
    procedure mnuMasterApplicationClick(Sender: TObject);
    procedure mnuIssuersClick(Sender: TObject);
    procedure mnuSystemParametersClick(Sender: TObject);
    procedure mnuStatisticalFamiliesClick(Sender: TObject);
    procedure mnuUserTypesClick(Sender: TObject);
    procedure mnuCardDesignClick(Sender: TObject);
    procedure mnuCardTemplatesClick(Sender: TObject);
    procedure mnuReloadPeriodClick(Sender: TObject);
    procedure mnuPersonnelTypesXValidatorFunctionsClick(Sender: TObject);
    procedure mnuHolidaysClick(Sender: TObject);
    procedure mnuTransportProvidersClick(Sender: TObject);
    procedure mnuApplicationsClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure mnuProviderTypesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuCollectorsClick(Sender: TObject);
    procedure stMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure mnuTimeLimitsClick(Sender: TObject);
    procedure mnuPaymentModesClick(Sender: TObject);
    procedure mnuStatisticalGroupsClick(Sender: TObject);
    procedure mnuAcceptedFunctionalClick(Sender: TObject);
    procedure mnuCardTypesClick(Sender: TObject);
    procedure mnuExportLocationsClick(Sender: TObject);
    procedure mnuIntegrationClick(Sender: TObject);
    procedure mnuDiscountsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuHandicappedTypesClick(Sender: TObject);
    procedure mnuDepotsClick(Sender: TObject);
    procedure mnuSoftwaresTypesClick(Sender: TObject);
    procedure mnuSoftwaresClick(Sender: TObject);
    procedure mnuHotlistReasonClick(Sender: TObject);
    procedure mnuDataTypesClick(Sender: TObject);
    procedure mnuLanguagesClick(Sender: TObject);
    procedure mnuFormsClick(Sender: TObject);
    procedure mnuModulesClick(Sender: TObject);
    procedure mnuKeyTypesClick(Sender: TObject);
    procedure Privilgios1Click(Sender: TObject);
    procedure GruposdeUsuriosdoSystema1Click(Sender: TObject);
    procedure Objetos1Click(Sender: TObject);
    procedure iposdeObjetos1Click(Sender: TObject);
    procedure ObjectTraslation1Click(Sender: TObject);
    procedure raduoemMassa1Click(Sender: TObject);
    procedure mnmTransportProvidersGroupsClick(Sender: TObject);
    procedure iposdeEndereos1Click(Sender: TObject);
    procedure TiposClick(Sender: TObject);
    procedure iposdeTelefone1Click(Sender: TObject);
    procedure iposdeDocumentos1Click(Sender: TObject);
    procedure ImpressorasRemotas1Click(Sender: TObject);
    procedure Funes1Click(Sender: TObject);
    procedure mnuLinesClick(Sender: TObject);
    procedure Impresso1Click(Sender: TObject);
    procedure iposdedescontos1Click(Sender: TObject);
    procedure GruposdeAplicao1Click(Sender: TObject);
    procedure iposdeAprovao1Click(Sender: TObject);
    procedure PreosdosCartes1Click(Sender: TObject);
    procedure FunesdoValidador1Click(Sender: TObject);
    procedure Aplicaes1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Regies1Click(Sender: TObject);
    procedure SubRegies1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure iposdeRazes1Click(Sender: TObject);
    procedure Razes1Click(Sender: TObject);
    procedure EquipamentosparaDeficincia1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure iposdeEstudantes1Click(Sender: TObject);
    procedure FunesdaAplicao1Click(Sender: TObject);
    procedure GrupodeSeleodeLinhas1Click(Sender: TObject);
    procedure mnuPontosTrechosClick(Sender: TObject);
    procedure mnuTrechosClick(Sender: TObject);
    procedure mnyRecibosClick(Sender: TObject);
    procedure mnuIntegTimeGroupsClick(Sender: TObject);
    procedure mnuIntegPeriodsClick(Sender: TObject);
    procedure mnuIntegTimeLimitsClick(Sender: TObject);
    procedure USERESTRICTIONGROUPSClick(Sender: TObject);
    procedure Integraoportipodecarto1Click(Sender: TObject);
    procedure GruposdeCargosdeOperador1Click(Sender: TObject);
    procedure mnuFtpExportLocationsClick(Sender: TObject);
    procedure mnuInfoParametersRDOClick(Sender: TObject);
    procedure mnuTransportProvidersxParametersRDOClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure menuAutomatizacaoTarifasClick(Sender: TObject);
    procedure menuBiometriaFacialClick(Sender: TObject);
    procedure lbMenuClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure lbDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure FormDeactivate(Sender: TObject);
    // procedure GrupodeSeleodeLinhas1Click(Sender: TObject);
    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormPaint(Sender: TObject);
  private
    procedure VerificaVersao;
  public
    { Public declarations }
    sInit, sTab : String;
    bUseIntegrationGroups: Boolean;
    Function GetVersion : String;
  end;

var
  FrmSparkSysMain: TFrmSparkSysMain;
  Debug: Boolean;

implementation

uses
  uFrmBaseCadastro, uFrmLineMT, uFrmLineGroups, uPersonnelTypes,
  uValidatorMessages, uDiscountTypes, uValidatorDisplaysMT, uTimeLimits,
  uTimeGroups, uLinePrices, uLineDiscounts, uMasterApplications, uIssuers,
  uSystemParameters, uStatisticalFamilies, uUserTypes, uCardDesign,
  uCardTemplates, uReloadPeriod, uPersonnelTypesXValidatorFcts, uHolidays,
  uTransportProviders, uApplications, uAppAbout, uFrmInfoParameters,
  uProviderTypes, uDmConexao, MConnect, DBClient, uFrmCollectors,
  uPaymentModesVt, uStatisticalGroups, uFrmAcceptedFct, uCardTypes,
  uExportLocations, uFTPExportLocations, uLineIntegration, uHandicapTypes, uDepot,
  uSoftwareTypes, uSoftwares, uHotlistReason, uFrmDataTypes, uFrmLanguages,
  uFrmForms, uFrmModules, uFrmKeyTypes, uFrmSystemRoles,
  uFrmSystemUserGroups, uFrmObjects, uFrmObjectTypes,
  uFrmObjectTranslation, uFrmBatchTranslation, uFrmTransportProvidersXInfoParameters,
  uFrmTransportProvidersGroups, uFrmAddressTypes, uFrmEmailTypes,
  uFrmTelephoneTypes, uFrmDocumentTypes, uFrmRemotePrinters,
  uFrmPersonnelFunctions, UFrmRptDialog, uFrmPeriodUseTypes,
  ufrmApplicationGroups, ufrmApprovationtypes, uFrmCardLevelPrices,
  uValidatorFunctions, uRelApplications, uStates, uRegion, uDmSys1,
  uCities, uReasonTypes, uReasons, uHandicapEquipment, ufrmBanks,
  ufrmStudentTypes, uFrmApplicationFunctions, uFrmLineSelGroups,
  uFrmZoneLocations, uFrmZones, ufrmReceipts, uDmSys,
  uFrmLineIntegTimeGroups, uFrmLineIntegPeriods, uFrmLineIntegTimeLimits,
  uUseRestrictionGroups, uCardBUTypeLineIntegrationType,
  uFrmPersonnelFunctionGroup, uFrmBaseLogin, Aguarde, uFrrmTarifas,
  uFrmAutoTarifas, uFrmBioFacial;

{$R *.dfm}

procedure TFrmSparkSysMain.mnuLineGroupsClick(Sender: TObject);
begin
  inherited;
  FormAguarde.Caption:='Grupo de Linhas';
  FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
  FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
  IF FrmLineGroups = nil Then  
    Begin
     FrmLineGroups := TFrmLineGroups.Create(Self);
     FrmLineGroups.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuExitClick(Sender: TObject);
begin
  inherited;
  Application.Terminate;
end;

procedure TFrmSparkSysMain.mnuPersonnelTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmPersonnelTypes = nil Then
    Begin
     FrmPersonnelTypes := TFrmPersonnelTypes.Create(Self);
     FrmPersonnelTypes.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuValidadorMessagesClick(Sender: TObject);
begin
  inherited;
  IF FrmValidadorMessages = nil Then
    Begin
     FormAguarde.Caption:='Mensagens';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmValidadorMessages := TFrmValidadorMessages.Create(Self);
     FrmValidadorMessages.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuDiscountTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmDiscountTypes = nil Then
    Begin
     FrmDiscountTypes := TFrmDiscountTypes.Create(Self);
     FrmDiscountTypes.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuValidatorDisplaysClick(Sender: TObject);
begin
  inherited;
  IF FrmValidatorDisplaysMT = nil Then
    Begin
     FormAguarde.Caption:='Displays';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmValidatorDisplaysMT := TFrmValidatorDisplaysMT.Create(Self);
     FrmValidatorDisplaysMT.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuTimeGroupsClick(Sender: TObject);
begin
  inherited;
  IF FrmTimeGroups = nil Then
    Begin
     FormAguarde.Caption:='Grupos de Tempo';  
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmTimeGroups := TFrmTimeGroups.Create(Self);
     FrmTimeGroups.Show;
    End;
end;

procedure TFrmSparkSysMain.mmLinePricesClick(Sender: TObject);
begin
  inherited;
  IF FrmLinePrices = nil Then
  Begin
   FrmLinePrices := TFrmLinePrices.Create(Self);
   FrmLinePrices.Show;
  End;

end;

procedure TFrmSparkSysMain.mmLineDiscountsClick(Sender: TObject);
begin
  inherited;
  IF FrmLineDiscounts = nil Then
  Begin
   FrmLineDiscounts := TFrmLineDiscounts.Create(Self);
   FrmLineDiscounts.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuMasterApplicationClick(Sender: TObject);
begin
  inherited;
  IF FrmMasterApp = nil Then
  Begin
   FrmMasterApp := TFrmMasterApp.Create(Self);
   FrmMasterApp.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuIssuersClick(Sender: TObject);
begin
  inherited;
  IF FrmIssuers = nil Then
  Begin
     FormAguarde.Caption:='Emissor';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
   FrmIssuers := TFrmIssuers.Create(Self);
   FrmIssuers.Show;
  End;

end;

procedure TFrmSparkSysMain.mnuSystemParametersClick(Sender: TObject);
begin
  inherited;
  IF FrmSystemParameters = nil Then
  Begin
     FormAguarde.Caption:='Parâmetros do Sistema';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
   FrmSystemParameters := TFrmSystemParameters.Create(Self);
   FrmSystemParameters.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuStatisticalFamiliesClick(Sender: TObject);
begin
  inherited;
  IF FrmStatisticalFamilies = nil Then
  Begin
     FormAguarde.Caption:='Contador Estatístico';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmStatisticalFamilies := TFrmStatisticalFamilies.Create(Self);
    FrmStatisticalFamilies.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuUserTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmUserTypes = nil Then
  Begin
    FrmUserTypes := TFrmUserTypes.Create(Self);
    FrmUserTypes.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuCardDesignClick(Sender: TObject);
begin
  inherited;
  IF FrmCardDesign = nil Then
  Begin
     FormAguarde.Caption:='Desenhos do Cartão';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmCardDesign := TFrmCardDesign.Create(Self);
    FrmCardDesign.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuCardTemplatesClick(Sender: TObject);
begin
  inherited;
  IF FrmCardTemplates = nil Then
  Begin
     FormAguarde.Caption:='Templates do Cartão';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmCardTemplates := TFrmCardTemplates.Create(Self);
    FrmCardTemplates.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuReloadPeriodClick(Sender: TObject);
begin
  inherited;
  IF FrmReloadPeriod = nil Then
  Begin
    FrmReloadPeriod := TFrmReloadPeriod.Create(Self);
    FrmReloadPeriod.Show;
  End;

end;

procedure TFrmSparkSysMain.mnuPersonnelTypesXValidatorFunctionsClick(
  Sender: TObject);
begin
  inherited;
    IF FrmPersonnelTypesXValidatorFcts = nil Then
  Begin
    FormAguarde.Caption:='Funções do Operador';
    FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
    FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmPersonnelTypesXValidatorFcts := TFrmPersonnelTypesXValidatorFcts.Create(Self);
    FrmPersonnelTypesXValidatorFcts.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuHolidaysClick(Sender: TObject);
begin
  inherited;
  IF FrmHolidays = nil Then
  Begin
    FrmHolidays := TFrmHolidays.Create(Self);
    FrmHolidays.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuTransportProvidersClick(Sender: TObject);
begin
  inherited;
  IF FrmTransportProviders = nil Then
  Begin
    FormAguarde.Caption:='Empresas';
    FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
    FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmTransportProviders := TFrmTransportProviders.Create(Self);
    FrmTransportProviders.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuApplicationsClick(Sender: TObject);
begin
  inherited;
  IF FrmApplications = nil Then
  Begin
     FormAguarde.Caption:='Aplicações';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmApplications := TFrmApplications.Create(Self);
    FrmApplications.Show;
  End;
end;

procedure TFrmSparkSysMain.actAboutExecute(Sender: TObject);
begin
//  inherited;
FrmAbout := TFrmAbout.Create(Self);
FrmAbout.ShowModal;
FrmAbout.Free;
end;

Function TFrmSparkSysMain.GetVersion : String;
Var
 VerInfoSize: DWORD;
 Dummy: DWORD;
 VerValue: PVSFixedFileInfo;
 Prog : string;
 VerInfo: Pointer;
 VerValueSize: DWORD;
 V1, V2, V3, V4: Word;
Begin
  Prog := Application.Exename;
  VerInfoSize := GetFileVersionInfoSize(PChar(prog), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(prog), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);

 with VerValue^ do
  begin
  V1 := dwFileVersionMS shr 16;
  V2 := dwFileVersionMS and $FFFF;
  V3 := dwFileVersionLS shr 16;
  V4 := dwFileVersionLS and $FFFF;
  end;
Result := InttoStr(V1)+'.'+InttoStr(V2)+'.'+InttoStr(V3)+'.'+InttoStr(V4);
End;

procedure TFrmSparkSysMain.FormCreate(Sender: TObject);
Var
 Spark_Conf : TIniFile;
 systemDir  : String;
 buffer     : array[0..144] of Char;
begin
  inherited;
  GetSystemDirectory(Buffer,144);
  systemDir := StrPas(Buffer);
  Spark_Conf := TIniFile.Create(systemDir+'\dbxconnections.ini');
//stMain.Panels[4].Text := Spark_Conf.ReadString('MSORCLSpark','User_Name', '');   //cidel-
  stMain.Panels[4].Text := Spark_Conf.ReadString('MSORCLSpark','DataBase', '');  //cidel+

//  FrmSparkSysMain.Caption := 'Spark Sys '+ GetVersion; //cidel-
  Caption := Caption+' '+GetVersion;   //cidel+
end;

procedure TFrmSparkSysMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Application.Terminate;
end;

procedure TFrmSparkSysMain.mnuCollectorsClick(Sender: TObject);
begin
  inherited;
  IF FrmCollectors = nil Then
  Begin
    FrmCollectors := TFrmCollectors.Create(Self);
    FrmCollectors.Show;
  End;

end;

procedure TFrmSparkSysMain.stMainDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
  Var
   Fim : String;
   I : Integer;
begin
  inherited;
    with stMain.Canvas do
 begin
  FillRect(Rect);
  Fim := '';
  //Definir Font e Style
  Font.Name := 'Tahoma';
  Font.Color := clWhite;
//  Font.Style := [fsBold];

  IF (Panel.Text = 'Consulta') OR
     (Panel.Text = '')  Then
     Begin
       stMain.Canvas.Brush.Color := clBtnFace;
       Font.Color := clBlack;
     End
  Else
  IF  (Panel.Text = 'Edição') Then
      stMain.Canvas.Brush.Color := $00004000
  Else
  IF  (Panel.Text = 'Inserção') Then
      stMain.Canvas.Brush.Color :=  clNavy;

  //Desenha as imagens de acordo com o indice de cada panel
  //ImageList1.Draw(StatusBar1.Canvas,Rect.Left+5,Rect.Top+1,Panel.Index);

  For I := 0 to (Panel.Width - Length(Panel.Text)-1) do
     Fim := Fim + ' ';

  IF Trim(Panel.Text) = '' Then
     stMain.Panels[2].Text := ' '
  Else
  if Panel.Index = 2 then
     TextOut(Rect.Left, Rect.Top, Panel.Text+Fim);

 end;

end;


procedure TFrmSparkSysMain.mnuTimeLimitsClick(Sender: TObject);
begin
  inherited;
  IF FrmTimeLimits = nil Then
    Begin
     FormAguarde.Caption:='Limites de Tempo';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmTimeLimits := TFrmTimeLimits.Create(Self);
     FrmTimeLimits.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuPaymentModesClick(Sender: TObject);
begin
  inherited;
  If FrmPaymentModesVt = nil Then
    Begin
     FrmPaymentModesVt := TFrmPaymentModesVt.Create(Self);
     FrmPaymentModesVt.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuStatisticalGroupsClick(Sender: TObject);
begin
  inherited;
  IF FrmStatisticalGroups = nil Then
    Begin
     FrmStatisticalGroups := TFrmStatisticalGroups.Create(Self);
     FrmStatisticalGroups.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuAcceptedFunctionalClick(Sender: TObject);
begin
  inherited;
  IF FrmAcceptedFct = nil Then    //cidel ancora
    Begin
     FormAguarde.Caption:='Relacionamento de Funcionários';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmAcceptedFct := TFrmAcceptedFct.Create(Self);
     FrmAcceptedFct.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuCardTypesClick(Sender: TObject);
begin
  inherited;
  IF frmCardTypes  = nil Then
  Begin
    frmCardTypes := TfrmCardTypes.Create(Self);
    frmCardTypes.Show;
  End;

end;

procedure TFrmSparkSysMain.mnuExportLocationsClick(Sender: TObject);
begin
  inherited;
  IF frmExportLocations  = nil Then
  Begin
    frmExportLocations := TfrmExportLocations.Create(Self);
    frmExportLocations.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuIntegrationClick(Sender: TObject);
begin
  inherited;
  IF FrmLineIntegration  = nil Then
  Begin
    FrmLineIntegration := TFrmLineIntegration.Create(Self);
    FrmLineIntegration.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuDiscountsClick(Sender: TObject);
begin
  inherited;
  IF FrmLineDiscounts = nil Then
  Begin
    FrmLineDiscounts := TFrmLineDiscounts.Create(Self);
    FrmLineDiscounts.Show;
  End;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.lbMenuClick(Sender: TObject);
Var Obj: TStringObject; N1,N2,N3: Integer;
begin
IF (Sender as TListBox).ItemIndex = -1 THEN Exit;
Obj:=TStringObject((Sender as TListBox).Items.Objects[(Sender as TListBox).ItemIndex]);
GetItem(';',Obj.Value);
N1:=StrToInt(GS[1]);
N2:=StrToInt(GS[2]);
N3:=-1; IF GS[3]<>'' THEN N3:=StrToInt(GS[3]);
//ShowMessage('N1 = '+GS[1]+'  N2 = '+GS[2]+'  N3 = '+GS[3]);
//N1:=(Sender as TListBox).Tag;
//N2:=(Sender as TListBox).ItemIndex;
pnOpcoes.Visible:=false; Application.ProcessMessages;
IF GS[3] <> ''
THEN mnuMain.Items[N1].Items[N2].Items[N3].OnClick(mnuMain.Items[N1].Items[N2].Items[N3])
ELSE mnuMain.Items[N1].Items[N2].OnClick(mnuMain.Items[N1].Items[N2]);
(Sender as TListBox).ItemIndex:=-1;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.FormShow(Sender: TObject);
Var Obj: TStringObject;
    S,nivel: String;
    menuGeral: TStringList;
{------------------------------------------------------------------------------}
procedure CarregaSub(menu: TMenuItem; lb: TListBox);
Var N3: Integer;
begin
FOR N3:=0 to menu.Count-1
DO IF menu.Items[N3].Caption <> '-'
   THEN BEGIN
        Obj:=TStringObject.Create(Format('%s;%d',[nivel,N3]));
        lb.Items.AddObject(menu.Items[N3].Caption,Obj);
        menuGeral.Add(StringReplace(S+' / '+menu.Items[N3].Caption,
                      '&','',[rfReplaceAll]));
        END;
end;
{------------------------------------------------------------------------------}
procedure lbCarrega(N1: Integer; lb: TListBox);
Var N2: Integer;
begin
FOR N2:=0 to mnuMain.Items[N1].Count-1
DO IF (mnuMain.Items[N1].Items[N2].Caption = '-')or
      (not mnuMain.Items[N1].Items[N2].Visible)
   THEN Continue
   ELSE IF mnuMain.Items[N1].Items[N2].Count > 0
        THEN BEGIN
             nivel:=Format('%d;%d',[N1,N2]);
             S:=mnuMain.Items[N1].Caption+' / '+
                mnuMain.Items[N1].Items[N2].Caption;
             CarregaSub(mnuMain.Items[N1].Items[N2],lbIntegracao);
             END
        ELSE BEGIN
             nivel:=Format('%d;%d',[N1,N2]);
             Obj:=TStringObject.Create(nivel);
             lb.Items.AddObject(mnuMain.Items[N1].Items[N2].Caption,Obj);
             S:=mnuMain.Items[N1].Caption+' / '+
                mnuMain.Items[N1].Items[N2].Caption;
             S:=StringReplace(S,'&','',[rfReplaceAll]);
             menuGeral.Add(S);
             END;
end;
{------------------------------------------------------------------------------}
begin
  inherited;    //porra
  menuGeral:=TstringList.Create;
  mnuValidadorMessages.Caption:='Mensagens';
  mnuAcceptedFunctional.Caption:='Relacionamento de Funcionários';
  mnuHandicappedTypes.Caption:='Tipos de Deficiência';
  EquipamentosparaDeficincia1.Caption:='Equipamentos para Deficiente';
  Funes1.Caption:='Cargos de Operador';

  pnOpcoes.Top:=10;
  pnOpcoes.Left:=10;
  lbCarrega(1,lbTabelasBasicas);
  lbCarrega(2,lbFinanceiro);
  lbCarrega(3,lbFuncoes);
  lbCarrega(4,lbAplicacao);
  lbCarrega(5,lbModais);
  lbCarrega(6,lbRelat);
  lbCarrega(7,lbCartao);
  lbCarrega(8,lbValidador);
  lbCarrega(9,lbEOD);
  lbCarrega(13,lbSeg);

  //menuGeral.SaveToFile(ExtractFilePath(Application.ExeName)+'menuGeral.txt');
  menuGeral.Free;

///////////////Controle de versão do servidor de aplicação -  Renato Cardeal  ////////////////////
//                                                                                              //
// Sempre quando atualizar o Servidor de Aplicacão alterar a variavel VersionAppServer          //
// para versão atual do servidor e copiar o arquivo PrjMercury2_Server.dll para pasta system32. //
//////////////////////////////////////////////////////////////////////////////////////////////////
(*   //cidel-
 try
    stMain.Panels[5].Text := 'AppServer : '+dmConexao.ConnBrkMaster.AppServer.VersionAppServer('SYS');
 except
    MessageDlg('Versão do SyS não compatível com a versão do Servidor de Aplicação!!!'#13+
              'Para usar este versão do SyS será necessário atualizar o Servidor de Aplicação.',mtError,[mbOk], 0);
    Application.Terminate;
 end;

// if not FileExists('C:\WINDOWS\system32\PrjMercury2_Server.dll') then
//        MessageDlg('Não foi localizado o arquivo C:\WINDOWS\system32\PrjMercury2_Server.dll !!!',mtError,[mbNo],0);

  VersionAppServer := '14.8.0.0';

 if VersionAppServer <> dmConexao.ConnBrkMaster.AppServer.VersionAppServer('SYS') then
    MessageDlg('Versão do SyS diferente da versão do Servidor de Aplicação!!!'#13+
               'Servidor de Aplicação em uso = '+dmConexao.ConnBrkMaster.AppServer.VersionAppServer('SYS')+#13+
               'Servidor de Aplicação Compatível = '+VersionAppServer,mtInformation,[mbOk], 0);


    ShortMonthNames[1]  := 'Jan';
    ShortMonthNames[2]  := 'Feb';
    ShortMonthNames[3]  := 'Mar';
    ShortMonthNames[4]  := 'Apr';
    ShortMonthNames[5]  := 'May';
    ShortMonthNames[6]  := 'Jun';
    ShortMonthNames[7]  := 'Jul';
    ShortMonthNames[8]  := 'Aug';
    ShortMonthNames[9]  := 'Sep';
    ShortMonthNames[10] := 'Oct';
    ShortMonthNames[11] := 'Nov';
    ShortMonthNames[12] := 'Dec';


  // Verifica se serão utilizados os campos de Grupos de Integração
  DmSys.cdsGeral.CommandText := 'SELECT SP_VALUE FROM SYSTEMPARAMETERS WHERE SP_CODE = ''INTEGRATIONFILE''';
  DmSys.cdsGeral.Open;
  bUseIntegrationGroups := ( Not DmSys.cdsGeral.IsEmpty ) And ( DmSys.cdsGeral.FieldByName( 'SP_VALUE' ).AsInteger = 1 );
  DmSys.cdsGeral.Close;

  // Oculta os menus que exibem formulários de manutenção relacionados aos Grupos de Integração
  If Not bUseIntegrationGroups Then Begin
    FreeAndNil( mnuIntegTimeGroups );
    FreeAndNil( mnuIntegPeriods    );
    FreeAndNil( mnuIntegTimeLimits );
    mnuitmIntegracao.Remove( mnuIntegration );
    mnuValidator.Insert( mnuValidator.IndexOf( mnuitmIntegracao ), mnuIntegration );
    FreeAndNil( mnuitmIntegracao );
  End;  *)
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.mnuHandicappedTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmHandicapTypes = nil Then
    Begin
    FormAguarde.Caption:='Tipos de Deficiência';
    FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
    FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmHandicapTypes := TFrmHandicapTypes.Create(Self);
     FrmHandicapTypes.Show;
    End;

end;

procedure TFrmSparkSysMain.mnuDepotsClick(Sender: TObject);
begin
  inherited;
  IF FrmDepots = nil Then
    Begin
    FormAguarde.Caption:='Garagens';
    FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
    FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmDepots := TFrmDepots.Create(Self);
     FrmDepots.Show;
    End;

end;

procedure TFrmSparkSysMain.mnuSoftwaresTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmSoftwareTypes = nil Then
    Begin
     FrmSoftwareTypes := TFrmSoftwareTypes.Create(Self);
     FrmSoftwareTypes.Show;
    End;

end;

procedure TFrmSparkSysMain.mnuSoftwaresClick(Sender: TObject);
begin
  inherited;
  IF FrmSoftwares = nil Then
    Begin
     FrmSoftwares := TFrmSoftwares.Create(Self);
     FrmSoftwares.Show;
    End;

end;

procedure TFrmSparkSysMain.mnuHotlistReasonClick(Sender: TObject);
begin
  inherited;
  IF FrmHotlistReason = nil Then
    Begin
     FrmHotlistReason := TFrmHotlistReason.Create(Self);
     FrmHotlistReason.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuDataTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmDataTypes = nil Then
    Begin
     FrmDataTypes := TFrmDataTypes.Create(Self);
     FrmDataTypes.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuLanguagesClick(Sender: TObject);
begin
  inherited;
  IF FrmLanguages = nil Then
    Begin
     FrmLanguages := TFrmLanguages.Create(Self);
     FrmLanguages.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuFormsClick(Sender: TObject);
begin
  inherited;
  IF FrmForms = nil Then
    Begin
     FrmForms := TFrmForms.Create(Self);
     FrmForms.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuModulesClick(Sender: TObject);
begin
  inherited;
  IF FrmModules = nil Then
    Begin
     FrmModules := TFrmModules.Create(Self);
     FrmModules.Show;
    End;
end;

procedure TFrmSparkSysMain.mnuKeyTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmKeyTypes = nil Then
    Begin
     FrmKeyTypes := TFrmKeyTypes.Create(Self);
     FrmKeyTypes.Show;
    End;
end;

procedure TFrmSparkSysMain.Privilgios1Click(Sender: TObject);
begin
  inherited;
  IF FrmSystemRoles = nil Then
    Begin
     FrmSystemRoles := TFrmSystemRoles.Create(Self);
     FrmSystemRoles.Show;
    End;
end;

procedure TFrmSparkSysMain.GruposdeUsuriosdoSystema1Click(Sender: TObject);
begin
  inherited;
  IF FrmSystemUserGroups = nil Then
    Begin
     FrmSystemUserGroups := TFrmSystemUserGroups.Create(Self);
     FrmSystemUserGroups.Show;
    End;
end;

procedure TFrmSparkSysMain.Objetos1Click(Sender: TObject);
begin
  inherited;
  If FrmObjects = nil Then
    Begin
     FrmObjects := TFrmObjects.Create(Self);
     FrmObjects.Show;
    End;

end;

procedure TFrmSparkSysMain.iposdeObjetos1Click(Sender: TObject);
begin
  inherited;
  If FrmObjectTypes = nil Then
    Begin
     FrmObjectTypes := TFrmObjectTypes.Create(Self);
     FrmObjectTypes.Show;
    End;

end;

procedure TFrmSparkSysMain.ObjectTraslation1Click(Sender: TObject);
begin
  inherited;
  If FrmObjectTranslation = nil Then
    Begin
     FrmObjectTranslation := TFrmObjectTranslation.Create(Self);
     FrmObjectTranslation.Show;
    End;
end;

procedure TFrmSparkSysMain.raduoemMassa1Click(Sender: TObject);
begin
  inherited;
  If FrmBatchTranslation = nil Then
    Begin
     FrmBatchTranslation := TFrmBatchTranslation.Create(Self);
     FrmBatchTranslation.Show;
    End;
end;

procedure TFrmSparkSysMain.mnmTransportProvidersGroupsClick(
  Sender: TObject);
begin
  inherited;
  If FrmTransportProvidersGroups = nil Then
    Begin
    FormAguarde.Caption:='Relacionamento de Empresas';
    FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
    FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmTransportProvidersGroups := TFrmTransportProvidersGroups.Create(Self);
    FrmTransportProvidersGroups.Show;
    End;

end;

procedure TFrmSparkSysMain.iposdeEndereos1Click(Sender: TObject);
begin
  inherited;
  If FrmAddressTypes = nil then
  Begin
    FrmAddressTypes := TFrmAddressTypes.Create(self);
    FrmAddressTypes.Show;
  end;
end;

procedure TFrmSparkSysMain.TiposClick(Sender: TObject);
begin
  inherited;
  If FrmEmailTypes = nil then
  Begin
    FrmEmailTypes := TFrmEmailTypes.Create(self);
    FrmEmailTypes.Show;
  end;
end;

procedure TFrmSparkSysMain.iposdeTelefone1Click(Sender: TObject);
begin
  inherited;
  If FrmTelephoneTypes = nil then
  Begin
    FrmTelephoneTypes := TFrmTelephoneTypes.Create(self);
    FrmTelephoneTypes.Show;
  end;
end;

procedure TFrmSparkSysMain.iposdeDocumentos1Click(Sender: TObject);
begin
  inherited;
  If FrmDocumentTypes = nil then
  Begin
    FrmDocumentTypes := TFrmDocumentTypes.Create(self);
    FrmDocumentTypes.Show;
  end;
end;

procedure TFrmSparkSysMain.ImpressorasRemotas1Click(Sender: TObject);
begin
  inherited;
  If FrmRemotePrinters = nil then
  Begin
    FrmRemotePrinters := TFrmRemotePrinters.Create(self);
    FrmRemotePrinters.Show;
  end;
end;

procedure TFrmSparkSysMain.Funes1Click(Sender: TObject);
begin
  inherited;
  If FrmPersonnelFunctions = nil then
  Begin
     FormAguarde.Caption:='Cargos de Operador';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    FrmPersonnelFunctions := TFrmPersonnelFunctions.Create(self);
    FrmPersonnelFunctions.Show;
  end;
end;

procedure TFrmSparkSysMain.mnuLinesClick(Sender: TObject);
begin
  inherited;
IF FrmLineMT = nil Then
    Begin                                        
     FormAguarde.Caption:='Linhas';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmLineMT := TFrmLineMT.Create(Self);
//   FrmLineMT.WindowState := wsNormal;
     FrmLineMT.Show;
    End;
end;

procedure TFrmSparkSysMain.Impresso1Click(Sender: TObject);
begin
  inherited;
  FrmRptDialog := TFrmRptDialog.Create(self);
  FrmRptDialog.Show;
end;

procedure TFrmSparkSysMain.iposdedescontos1Click(Sender: TObject);
begin
  inherited;
  // Rotina responsável por chamar Tela de Tipo de Período
  If FrmPeriodUseTypes = nil then
  Begin
    FrmPeriodUseTypes := TFrmPeriodUseTypes.Create(self);
    FrmPeriodUseTypes.Show;
  end;
end;

procedure TFrmSparkSysMain.GruposdeAplicao1Click(Sender: TObject);
begin
  inherited;
  // Daniel - 24/05/05
  // Rotina responsável por chamar Tela de Grupos de Aplicação
  If frmApplicationGroups = nil then
  Begin
    frmApplicationGroups := TfrmApplicationGroups.Create(self);
    frmApplicationGroups.Show;
  end;

end;

procedure TFrmSparkSysMain.iposdeAprovao1Click(Sender: TObject);
begin
  inherited;
  // Daniel - 24/05/05
  // Rotina responsável por chamar Tela de Tipos de Aprovação
  If frmApprovationTypes = nil then
  Begin
    frmApprovationTypes := TfrmApprovationTypes.Create(self);
    frmApprovationTypes.Show;
  end;

end;

procedure TFrmSparkSysMain.PreosdosCartes1Click(Sender: TObject);
begin
  inherited;
  // Daniel - 24/05/05
  // Rotina responsável por chamar Tela de Preços de Cartões por Níveis
  If frmCardLevelPrices = nil then
  Begin
    frmCardLevelPrices := TfrmCardLevelPrices.Create(self);
    frmCardLevelPrices.Show;
  end;

end;

procedure TFrmSparkSysMain.FunesdoValidador1Click(Sender: TObject);
begin
  inherited;
  // Daniel - 24/05/05
  // Rotina responsável por chamar Tela de Funções do Validador
     FormAguarde.Caption:='Funções do Validador';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
  If frmValidatorFunctions = nil then
  Begin
    frmValidatorFunctions := TfrmValidatorFunctions.Create(self);
    frmValidatorFunctions.Show;
  end;
end;

procedure TFrmSparkSysMain.Aplicaes1Click(Sender: TObject);
begin
  inherited;
  // Daniel - 31/08/05
  // Rotina responsável por chamar Tela de Relatórios de Aplicações
  If frmRelApplications = nil then
  Begin
    frmRelApplications := TfrmRelApplications.Create(self);
    frmRelApplications.Show;
  end;
end;

procedure TFrmSparkSysMain.Estados1Click(Sender: TObject);
begin
  inherited;
  If frmStates = nil then
  Begin
    frmStates := TfrmStates.Create(self);
    frmStates.Show;
  end;
end;

procedure TFrmSparkSysMain.Regies1Click(Sender: TObject);
begin
  inherited;
//  If frmRegion = nil then
  Begin
    sInit := 'REG';
    sTab  := 'REGION';
    frmRegion := TfrmRegion.Create(self);
    frmRegion.dtsMaster.DataSet := dmSys1.cdsRegion;
    frmRegion.Show;
  end;
end;

procedure TFrmSparkSysMain.SubRegies1Click(Sender: TObject);
begin
  inherited;
//  If frmRegion = nil then
  Begin
    sInit := 'SUBREG';
    sTab  := 'SUBREGION';
    frmRegion := TfrmRegion.Create(self);
    frmRegion.dtsMaster.DataSet := dmSys1.cdsSubRegion;
    frmRegion.Show;
  end;
end;

procedure TFrmSparkSysMain.Cidades1Click(Sender: TObject);
begin
  inherited;
  If frmCities = nil then
  Begin
    frmCities := TfrmCities.Create(self);
    frmCities.Show;
  end;
end;

procedure TFrmSparkSysMain.iposdeRazes1Click(Sender: TObject);
begin
  inherited;
  If frmReasonTypes = nil then
  Begin
    frmReasonTypes := TfrmReasonTypes.Create(self);
    frmReasonTypes.Show;
  end;
end;

procedure TFrmSparkSysMain.Razes1Click(Sender: TObject);
begin
  inherited;
  If frmReasons = nil then
  Begin
    frmReasons := TfrmReasons.Create(self);
    frmReasons.Show;
  end;
end;

procedure TFrmSparkSysMain.EquipamentosparaDeficincia1Click(
  Sender: TObject);
begin
  inherited;
  If frmHandicapEquipment = nil then
  Begin
     FormAguarde.Caption:='Equipamentos para Deficiente';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    frmHandicapEquipment := TfrmHandicapEquipment.Create(self);
    frmHandicapEquipment.Show;
  end;
end;

procedure TFrmSparkSysMain.Bancos1Click(Sender: TObject);
begin
  inherited;
  If frmBanks = nil then
  Begin
    frmBanks := TfrmBanks.Create(self);
    frmBanks.Show;
  end;
end;

procedure TFrmSparkSysMain.iposdeEstudantes1Click(Sender: TObject);
begin
  inherited;
  If frmStudentTypes = nil then
  Begin
    frmStudentTypes := TfrmStudentTypes.Create(self);
    frmStudentTypes.Show;
  end;
end;

procedure TFrmSparkSysMain.FunesdaAplicao1Click(Sender: TObject);
begin
  inherited;
  If FrmApplicationFunction = nil then
  Begin
    FrmApplicationFunction := TFrmApplicationFunction.Create(self);
    FrmApplicationFunction.Show;
  end;
end;

procedure TFrmSparkSysMain.GrupodeSeleodeLinhas1Click(Sender: TObject);
begin
  inherited;
     FormAguarde.Caption:='Seleção de Grupo de Linhas';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
  FrmLineSelGroups := TFrmLineSelGroups.Create(Self);
  FrmLineSelGroups.Show;
end;

procedure TFrmSparkSysMain.mnuPontosTrechosClick(Sender: TObject);
begin
  inherited;
     FormAguarde.Caption:='Pontos de Trechos';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
  FrmZoneLocations := TFrmZoneLocations.Create(Self);
  FrmZoneLocations.Show;
end;

procedure TFrmSparkSysMain.mnuTrechosClick(Sender: TObject);
begin
  inherited;
     FormAguarde.Caption:='Trechos';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
  FrmZones := TFrmZones.Create(Self);
  FrmZones.Show;
end;

procedure TFrmSparkSysMain.mnyRecibosClick(Sender: TObject);
begin
  inherited;
  frmReceipts := TFrmReceipts.Create(Self);
  frmReceipts.Show;
end;

procedure TFrmSparkSysMain.mnuIntegTimeGroupsClick(Sender: TObject);
begin
  inherited;
  If FrmLineIntegTimeGroups = Nil Then
  Begin
    FrmLineIntegTimeGroups := TFrmLineIntegTimeGroups.Create( Self );
    FrmLineIntegTimeGroups.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuIntegPeriodsClick(Sender: TObject);
begin
  inherited;
  If frmLineIntegPeriods = Nil Then
  Begin
    frmLineIntegPeriods := TfrmLineIntegPeriods.Create( Self );
    frmLineIntegPeriods.Show;
  End;
end;

procedure TFrmSparkSysMain.mnuIntegTimeLimitsClick(Sender: TObject);
begin
  inherited;
  If frmLineIntegTimeLimits = Nil Then
  Begin
    frmLineIntegTimeLimits := TfrmLineIntegTimeLimits.Create( Self );
    frmLineIntegTimeLimits.Show;
  End;
end;

procedure TFrmSparkSysMain.USERESTRICTIONGROUPSClick(Sender: TObject);
begin
  inherited;
  IF FrmUseRestrictionGroups = nil Then
  Begin
    FrmUseRestrictionGroups := TFrmUseRestrictionGroups.Create(Self);
    FrmUseRestrictionGroups.Show;
  End;
end;

procedure TFrmSparkSysMain.Integraoportipodecarto1Click(Sender: TObject);
begin
  inherited;
  IF FrmCardBUTypeLineIntegrationType = nil Then
  Begin
    FrmCardBUTypeLineIntegrationType := TFrmCardBUTypeLineIntegrationType.Create(Self);
    FrmCardBUTypeLineIntegrationType.Show;
  End;
end;

procedure TFrmSparkSysMain.GruposdeCargosdeOperador1Click(Sender: TObject);
begin
  inherited;
  IF FrmPersonnelFunctionGroup = nil Then
  Begin
    FrmPersonnelFunctionGroup := TFrmPersonnelFunctionGroup.Create(Self);
    FrmPersonnelFunctionGroup.Show;
  End;

end;

procedure TFrmSparkSysMain.mnuFtpExportLocationsClick(Sender: TObject);
begin
  inherited;
  if FrmFTPExportLocations = nil then
  begin
    FrmFTPExportLocations := TFrmFTPExportLocations.Create(Self);
    FrmFTPExportLocations.Show;
  end;
end;

procedure TFrmSparkSysMain.mnuInfoParametersRDOClick(Sender: TObject);
begin
  inherited;
  if FrmInfoParameters = nil then
  begin
    FrmInfoParameters := TFrmInfoParameters.Create(Self);
    FrmInfoParameters.Show;
  end;
end;

procedure TFrmSparkSysMain.mnuTransportProvidersxParametersRDOClick(
  Sender: TObject);
begin
  inherited;
  if FrmTransportProvidersXInfoParameters = nil then
  begin
    FrmTransportProvidersXInfoParameters := TFrmTransportProvidersXInfoParameters.Create(Self);
    FrmTransportProvidersXInfoParameters.Show;
  end;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TileImage(DestImage: TImage; TileBitmap: TBitmap);
var
  X, Y: Integer;
begin
  // Garante que a imagem de destino tenha o mesmo tamanho do componente
  DestImage.Picture.Bitmap.Width := DestImage.Width;
  DestImage.Picture.Bitmap.Height := DestImage.Height;

  // Percorre toda a área do TImage repetindo o bitmap
  for Y := 0 to DestImage.Height div TileBitmap.Height do
    for X := 0 to DestImage.Width div TileBitmap.Width do
      DestImage.Canvas.Draw(X * TileBitmap.Width, Y * TileBitmap.Height, TileBitmap);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.FormActivate(Sender: TObject); //cidel+
begin
  inherited;
  TileImage(Image1, Image3.Picture.Bitmap);
  OnActivate:=nil;
  WITH FrmBaseLogin
  DO BEGIN
     top:=56; left:=9;
     IF Debug //FileExists('c:\users\public\cta.dll')
     THEN BEGIN
          edtUser.Text:='admin';
          edtPass.Text:='LABHOMOL';
          END;
     Application.ProcessMessages;
     IF ShowModal <> mrOk then Application.Terminate;
     pnOpcoes.Visible:=true;
     Application.ProcessMessages;
     END;
  VerificaVersao;
  Application.OnIdle:=AppIdle;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
//cidel+ SU-41236 Esta rotina estava no DPR
//cidel+ SU-41236 ERRO "Field value required" resolvido com a inversão das rotinas
procedure TFrmSparkSysMain.VerificaVersao;
Var
 actualversion, erro, version, sSU_ID  : String;
 reg : TRegistry;
 bVersionFree : Integer;
begin
//  Verificar se a versão está valida
  Application.ProcessMessages;
  actualversion := dmConexao.GetActualVersion('APBSYS',erro);
  if erro <> '' then
    begin
      DisplayMsg(FrmSparkSysMain.t_form_objects, '%T %S', [2831], [erro]);
//      Application.Terminate;
    end;

  version:=FrmSparkSysMain.GetVersion;

  if actualversion <> version then
    begin
    sSU_ID:=IntToStr(dmConexao.SystemUser_Id);
     dmConexao.cdsGeral.Close;
     dmConexao.cdsGeral.CommandText := 'SELECT DISTINCT FRMOBJSR.OBJ_ID ' +
                                       'FROM FORMOBJECTXSYSTEMROLES FRMOBJSR, ' +
                                       '     SYSTEMROLES SR, ' +
                                       '     SYSTEMUSERGROUPSXSYSTEMROLES SUGSR, ' +
                                       '     SYSTEMUSERGROUPS SUG, ' +
                                       '     SYSTEMUSERSXSYSUSERGROUPS SUSUG '       +
                                       'WHERE FRMOBJSR.SR_ID  = SR.SR_ID AND '       +
                                       '      SR.SR_ID        =  SUGSR.SR_ID AND '   +
                                       '      SUGSR.SUG_ID    = SUG.SUG_ID AND '     +
                                       '      SUG.SUG_ID      = SUSUG.SUG_ID AND '   +
                                       '      SR.SR_STATUS    = ''A'' AND ' +
                                       '      SUG.SUG_STATUS  = ''A'' AND ' +
                                       '      SUSUG.SU_ID     = ' + sSU_ID + ' AND ' +
                                       '      FRMOBJSR.FRM_ID = ' + IntToStr(FrmSparkSysMain.Tag) + ' AND ' +
                                       '      FRMOBJSR.OBJ_ID = ' + IntToStr(FrmSparkSysMain.mnuSoftwares.Tag);
      dmConexao.cdsGeral.Open;


      if dmConexao.cdsGeral.Eof then
        begin
          DisplayMsg(FrmSparkSysMain.t_form_objects, '%T', [2832], []);
          dmConexao.cdsGeral.Close;
//          Application.Terminate;
        end
        else
        begin
          IF Debug THEN Exit;
          bVersionFree := 0;
       // reg := TRegistry.Create;
          reg:=TRegistry.Create(KEY_READ or $0100);
          reg.RootKey := HKEY_LOCAL_MACHINE;
          reg.OpenKey('SOFTWARE\AES Prodata\Sys', False);
          if reg.ValueExists('VersionFree') then
            bVersionFree := reg.ReadInteger('VersionFree');
          reg.Free;

          if bVersionFree = 1 then
          begin
            if Application.MessageBox('Versão do banco difere da versão do executável. Deseja alterar a versão agora?','ATENÇÃO',MB_YESNO) = ID_YES then
              bVersionFree := 0;
          end;

          Application.ProcessMessages;
          if bVersionFree = 0 then
          begin
            dmConexao.cdsGeral.Close;
            dmSys1.cdsSoftwares.CommandText := 'SELECT SF.*,SF.SF_STATUS AS STATUS_ID , SFT.SFT_DESC ' +
                                               'FROM SOFTWARES SF ' +
                                               'INNER JOIN SOFTWARETYPES SFT ' +
                                               'ON SFT.SFT_ID = SF.SFT_ID ' +
                                               'WHERE SF.SF_STATUS = ''A'' AND ' +
                                               'SF_ID = 3 ' +
                                               'ORDER BY SF_COD';

            DisplayMsg(FrmSparkSysMain.t_form_objects, 'Versão do SYS inválida. Cadastre uma nova versão!   ',[],[]);
            Application.CreateForm(TFrmSoftwares, FrmSoftwares);
            FrmSoftwares.FormStyle := fsNormal;
            FrmSoftwares.Visible := False;
            FrmSoftwares.tsBaseCadastroFiltro.TabVisible := False;

            FrmSoftwares.tbtnInsert.Visible := False;
            FrmSoftwares.tbtnDelete.Visible := False;
            FrmSoftwares.tbtnFiltrar.Visible := False;
            FrmSoftwares.tbtnFirst.Visible := False;
            FrmSoftwares.tbtnNext.Visible := False;
            FrmSoftwares.tbtnPrior.Visible := False;
            FrmSoftwares.tbtnLast.Visible := False;
            FrmSoftwares.tbtnRefresh.Visible := False;
            FrmSoftwares.tbtnNew1.Visible := False;
            FrmSoftwares.tbtnNew2.Visible := False;

            Application.ProcessMessages;
            FrmSoftwares.ShowModal;
            if Assigned(FrmSoftwares) then FrmSoftwares.Free;
            DisplayMsg(FrmSparkSysMain.t_form_objects, 'O SYS deve ser reinicializado para que as alterações entrem em vigor!   ',[],[]);
            Application.Terminate; Exit;
          end;
        end;
    end;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.menuAutomatizacaoTarifasClick(Sender: TObject);
begin
inherited;
//FrmTarifas.ShowModal;
FrmAutoTarifas.ShowModal;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.menuBiometriaFacialClick(Sender: TObject);
begin
inherited;
IF FrmBioFacial = nil
Then BEGIN
     FormAguarde.Caption:='Biometria Facial';
     FormAguarde.lblPosi.Caption:='Coletando INFORMAÇÕES';
     FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     FrmBioFacial := TFrmBioFacial.Create(Self);
     FrmBioFacial.Show;
     END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.mnuProviderTypesClick(Sender: TObject);
begin
  inherited;
  IF FrmProviderTypes = nil Then
  Begin
    FrmProviderTypes := TFrmProviderTypes.Create(Self);
    FrmProviderTypes.Show;
  End;

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.Image1Click(Sender: TObject);
begin
//pnOpcoes.Visible:=not pnOpcoes.Visible;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.lbDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var Lista: TListBox;
begin

  Lista := Control as TListBox; //porra

// Se estiver selecionado, pinta fundo azul e letra branca
// Lista.Canvas.Brush.Color := clGray;
  if odSelected in State then
  begin
    Lista.Canvas.Brush.Color := clNavy;
    Lista.Canvas.Font.Color := clWhite;
  end
  else
  begin
    Lista.Canvas.Font.Color := clBlack;
    IF Debug THEN BEGIN
    IF Lista.Items[Index] = 'Parâmetros do Sistema'        THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Emissor'                      THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Tipos de Deficiência'         THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Equipamentos para Deficiente' THEN Lista.Canvas.Font.Color := clRed;

    IF Lista.Items[Index] = 'Aplicações'                   THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Contador Estatístico'         THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Empresas'                     THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Garagens'                     THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Relacionamento de Funcionários'    //muito difícil usa filter
    THEN BEGIN
         Lista.Canvas.Font.Color := clWhite;
         Lista.Canvas.Brush.Color := clRed;
         END;
    IF Lista.Items[Index] = 'Relacionamento de Empresas'   THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Desenhos do Cartão'           THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Templates do Cartão'          THEN Lista.Canvas.Font.Color := clRed;

    IF Lista.Items[Index] = 'Mensagens'                    THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Displays do Validador'        THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Funções do Operador'               //muito difícil usa distinct
    THEN BEGIN
         Lista.Canvas.Font.Color := clWhite;
         Lista.Canvas.Brush.Color := clRed;
         END;
    IF Lista.Items[Index] = 'Cargos de Operador'           THEN Lista.Canvas.Brush.Color := clGray;

    IF Lista.Items[Index] = 'Limites de Tempo'             THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Grupos de Tempo'              THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Linhas'                       THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Grupo de Linhas'              THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Funções do Validador'         THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Seleção de Grupo de Linhas'   THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Pontos de Trechos'            THEN Lista.Canvas.Font.Color := clRed;
    IF Lista.Items[Index] = 'Trechos'                      THEN Lista.Canvas.Font.Color := clRed;;
    IF Lista.Items[Index] = 'Biometria Facial'             THEN Lista.Canvas.Font.Color := clRed;
    END; // Debug
  end;

  // Preenche fundo
  Lista.Canvas.FillRect(Rect);
  // Desenha o texto do item
  Lista.Canvas.TextOut(Rect.Left + 2, Rect.Top, Lista.Items[Index]);end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.FormDeactivate(Sender: TObject);
begin
pnOpcoes.Visible:=false; Application.ProcessMessages;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.AppIdle(Sender: TObject; var Done: Boolean);
begin
pnOpcoes.Visible:=MDIChildCount = 0;
Application.ProcessMessages;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
constructor TStringObject.Create(const AValue: string);
begin Value := AValue; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN Close; Key:=#0; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmSparkSysMain.FormPaint(Sender: TObject);
begin if lbTabelasBasicas.CanFocus then lbTabelasBasicas.SetFocus; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.

