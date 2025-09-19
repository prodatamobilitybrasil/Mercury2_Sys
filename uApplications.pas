unit uApplications;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxLookup, RxDBComb,
  Buttons, ToolEdit, CurrEdit, RXDBCtrl, RXSpin, RXCtrls;

type
  TFrmApplications = class(TFrmBaseSys)
    gbApp: TGroupBox;
    pcSubApplications: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label20: TLabel;
    Label5: TLabel;
    TabSheet2: TTabSheet;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    dbgSubApplications: TDBGrid;
    Label18: TLabel;
    dbCERTIFICATE: TDBEdit;
    Label19: TLabel;
    dbLkApplications: TRxDBLookupCombo;
    btDisplayCancel: TSpeedButton;
    btDisplayOK: TSpeedButton;
    dbgAppsXValidatorActions: TDBGrid;
    TabSheet3: TTabSheet;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    gdbValidatorConditions: TDBGrid;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    TabSheet4: TTabSheet;
    dbgVisualActions: TDBGrid;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    TabSheet5: TTabSheet;
    dbgValidatorStatesXApps: TDBGrid;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label25: TLabel;
    eApp: TEdit;
    Label26: TLabel;
    dblkIssuer: TRxDBLookupCombo;
    lkFilterStatus: TComboBox;
    Label27: TLabel;
    lbDisponiveis: TListBox;
    Label28: TLabel;
    lbSelecionadas: TListBox;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    Label16: TLabel;
    lbDisponiveisConditions: TListBox;
    lbSelecionadasConditions: TListBox;
    Label29: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btAddCondictions: TToolButton;
    btDelCondictions: TToolButton;
    ToolButton4: TToolButton;
    lbDispActions: TListBox;
    lbSelActions: TListBox;
    Label23: TLabel;
    Label30: TLabel;
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    btAddVisualActions: TToolButton;
    btDelVisualActions: TToolButton;
    ToolButton8: TToolButton;
    CoolBar3: TCoolBar;
    ToolBar3: TToolBar;
    ToolButton9: TToolButton;
    btAddStates: TToolButton;
    btDelStates: TToolButton;
    ToolButton12: TToolButton;
    lbSelStates: TListBox;
    Label24: TLabel;
    Label31: TLabel;
    lbDispStates: TListBox;
    dbIssuers: TRxDBLookupCombo;
    dbApp: TDBEdit;
    dbSF: TRxDBLookupCombo;
    dbPriority: TDBEdit;
    dbDesc: TDBEdit;
    dbDescLong: TDBEdit;
    DBEdit13: TDBEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    dbVDMCode: TRxDBLookupCombo;
    cmbAF_ID: TRxDBLookupCombo;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    dbAppStatus: TRxDBComboBox;
    Label32: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    dbAppKid: TDBEdit;
    dbApp_KidBu: TDBEdit;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    TabSheet6: TTabSheet;
    dbgStrings: TDBGrid;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    dbLkApplicationsOrigem: TRxDBLookupCombo;
    Label40: TLabel;
    DBEdit6: TDBEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edtFareGracePeriod: TDBEdit;
    Label44: TLabel;
    RxDBCalcEdit1: TRxDBCalcEdit;
    dbAPP_MAXVALUE: TRxDBCalcEdit;
    dbAPP_EXTUSEVALUE: TRxDBCalcEdit;
    actOKVS: TAction;
    actCancelVS: TAction;
    actOKStrings: TAction;
    actCancelStrings: TAction;
    actVSAddAll: TAction;
    actVSAdd: TAction;
    actVSDelAll: TAction;
    actVSDel: TAction;
    actVVAAddAll: TAction;
    actVVAAdd: TAction;
    actVVADelAll: TAction;
    actVVADel: TAction;
    actVVAOK: TAction;
    actVVACancel: TAction;
    actVCOK: TAction;
    actVCCancel: TAction;
    actVCAddAll: TAction;
    actVCAdd: TAction;
    actVCDel: TAction;
    actVCDelAll: TAction;
    actVAOK: TAction;
    actVACancel: TAction;
    actVAAddAll: TAction;
    actVAAdd: TAction;
    actVADel: TAction;
    actVADelAll: TAction;
    actSubAppOK: TAction;
    actSupAppCancel: TAction;
    actInsertSubApp: TAction;
    actEditSubApp: TAction;
    actDeleteSubApp: TAction;
    tabVersoes: TTabSheet;
    dbgVersions: TDBGrid;
    spnedtVersion: TRxSpinEdit;
    dbedtVersionValidity: TDBDateEdit;
    dbedtVersionStatus: TRxDBComboBox;
    Label15: TLabel;
    Label33: TLabel;
    Label45: TLabel;
    btnOkVersion: TSpeedButton;
    SpeedButton12: TSpeedButton;
    actOkVersion: TAction;
    actCancelVersion: TAction;
    DBEdit2: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    TabSheet7: TTabSheet;
    CoolBar5: TCoolBar;
    ToolBar5: TToolBar;
    btnAddAllCardDesign: TToolButton;
    btnAddOneCardDesign: TToolButton;
    btnDelOneCardDesign: TToolButton;
    btnDelAllCardDesign: TToolButton;
    lstDispCardDesign: TListBox;
    Label48: TLabel;
    lstSelecCardDesign: TListBox;
    Label49: TLabel;
    btnOkCardDesign: TSpeedButton;
    btnCancelCardDesign: TSpeedButton;
    dbgCardDesign: TDBGrid;
    actAddAllCardDesign: TAction;
    actAddOneCardDesign: TAction;
    actDelAllCardDesign: TAction;
    actDelOneCardDesign: TAction;
    actCardDesignOK: TAction;
    actCardDesignCancel: TAction;
    TabSheet8: TTabSheet;
    SpeedButton11: TSpeedButton;
    SpeedButton13: TSpeedButton;
    dbgCardTemplatesXApps: TDBGrid;
    actAddAllCTXApplications: TAction;
    actAddOneCTXApplications: TAction;
    actDellAllCTXApplications: TAction;
    actDelOneCTXApplications: TAction;
    actCTXApplicationsOK: TAction;
    actCTXApplicationsCancel: TAction;
    TabSheet9: TTabSheet;
    dbgCardTypesxApps: TDBGrid;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    db_CTYAPP_REPEATQTY: TDBEdit;
    Label52: TLabel;
    dbMastersecidmax: TDBEdit;
    Label53: TLabel;
    dbMastersecidmin: TDBEdit;
    Label54: TLabel;
    db_CTYAPP_BUSECIDMIN: TDBEdit;
    Label56: TLabel;
    db_CTYAPP_BUSECIDMAX: TDBEdit;
    Label57: TLabel;
    actOkCardTypesXApps: TAction;
    actCancelCardTypesxApps: TAction;
    cmbCardTypesXApps: TComboBox;
    Label55: TLabel;
    TabSheet10: TTabSheet;
    CoolBar7: TCoolBar;
    ToolBar7: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    lstDispTPXApps: TListBox;
    lstSelecTPXApps: TListBox;
    Label58: TLabel;
    Label59: TLabel;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    dbgTPXApps: TDBGrid;
    actAddAllTPXApps: TAction;
    actAddOneTPXApps: TAction;
    actDelAllTPXApps: TAction;
    actDelOneTPXApps: TAction;
    actTPXAppsOk: TAction;
    actTPXAppsCancel: TAction;
    TabSheet11: TTabSheet;
    dbgUTXApps: TDBGrid;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    lstSelecUTXApps: TListBox;
    Label60: TLabel;
    CoolBar8: TCoolBar;
    ToolBar8: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    lstDispUTXApps: TListBox;
    Label61: TLabel;
    actAddAllUTXApps: TAction;
    actAddOneUTXApps: TAction;
    actDelAllUTXApps: TAction;
    actDelOneUTXApps: TAction;
    actUTXAppsOK: TAction;
    actUTXAppsCancel: TAction;
    dblkAPP_DISPID2: TRxDBLookupCombo;
    Label62: TLabel;
    dbeDISP2VALSTART: TDBEdit;
    Label63: TLabel;
    DBEdit4: TDBEdit;
    Label21: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    Label38: TLabel;
    DBEdit5: TDBEdit;
    Label64: TLabel;
    Label50: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    rdbTimeGroups: TRxDBLookupCombo;
    Label51: TLabel;
    Label65: TLabel;
    rdbPerioduseTypes: TRxDBLookupCombo;
    rdbLinha: TRxDBLookupCombo;
    Label66: TLabel;
    rdbLineGroups: TRxDBLookupCombo;
    Label67: TLabel;
    rdbValidationPeriods: TRxDBLookupCombo;
    Label68: TLabel;
    rdbValidityTypes: TRxDBLookupCombo;
    Label69: TLabel;
    dbQtde: TDBEdit;
    Label70: TLabel;
    rdbDateStatus: TRxDBLookupCombo;
    Label71: TLabel;
    tabApplicationsXLineMT: TTabSheet;
    CoolBar4: TCoolBar;
    ToolBar4: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    dbgAppsxLineMt: TDBGrid;
    lstSelecAppxLineMT: TListBox;
    Label72: TLabel;
    lstDispAppxLineMT: TListBox;
    Label73: TLabel;
    actAppxLineMTOk: TAction;
    actAppxLineMTCancel: TAction;
    actAddAllAppxLineMT: TAction;
    actAddOneAppxLineMT: TAction;
    actDelAllAppxLineMT: TAction;
    actDelOneAppxLineMT: TAction;

    Label74: TLabel;
    DBEdit7: TDBEdit;
    dbedtFareRule: TDBEdit;
    sbtnFareRule: TRxSpinButton;
    Label75: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    DBEdit8: TDBEdit;
    Label76: TLabel;
    Label77: TLabel;
    DBEdit9: TDBEdit;
    Label78: TLabel;
    DBEdit10: TDBEdit;
    Label79: TLabel;
    DBEdit11: TDBEdit;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    tabvehicletypesxapplications: TTabSheet;
    dbgTransprovXVehTypesXApps: TDBGrid;
    Label86: TLabel;
    DBEdit15: TDBEdit;
    GroupBox1: TGroupBox;
    Label84: TLabel;
    RxDBLookupCombo5: TRxDBLookupCombo;
    RxDBLookupCombo6: TRxDBLookupCombo;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    RxDBComboBox3: TRxDBComboBox;
    Label85: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    GroupBox2: TGroupBox;
    Label92: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    RxDBLookupCombo4: TRxDBLookupCombo;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    pcApplications: TPageControl;
    tsBilheteUnico: TTabSheet;
    tsBilheteUnicoMunicipal: TTabSheet;
    tsTarifaSocial: TTabSheet;
    GroupBox3: TGroupBox;
    Label93: TLabel;
    Label96: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label97: TLabel;
    Label91: TLabel;
    DBEdit25: TDBEdit;
    Label98: TLabel;
    RxDBLookupCombo7: TRxDBLookupCombo;
    RxDBLookupCombo8: TRxDBLookupCombo;
    btnLimpaStatus: TSpeedButton;
    SpeedButton22: TSpeedButton;
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
    procedure dbLkApplicationsCloseUp(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcSubApplicationsChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisConditionsDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasConditionsDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbDispActionsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelActionsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbDispStatesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelStatesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbDisponiveisConditionsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasConditionsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDispActionsDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelActionsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbDispStatesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbSelStatesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pcSubApplicationsChange(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure dbLkApplicationsOrigemCloseUp(Sender: TObject);
    procedure edtFareGracePeriodChange(Sender: TObject);
    procedure actOKVSExecute(Sender: TObject);
    procedure actCancelVSExecute(Sender: TObject);
    procedure actVSAddAllExecute(Sender: TObject);
    procedure actVSAddExecute(Sender: TObject);
    procedure actVSDelExecute(Sender: TObject);
    procedure actVSDelAllExecute(Sender: TObject);
    procedure actVVAAddAllExecute(Sender: TObject);
    procedure actVVAAddExecute(Sender: TObject);
    procedure actVVADelExecute(Sender: TObject);
    procedure actVVADelAllExecute(Sender: TObject);
    procedure actVVAOKExecute(Sender: TObject);
    procedure actVVACancelExecute(Sender: TObject);
    procedure actVCOKExecute(Sender: TObject);
    procedure actVCCancelExecute(Sender: TObject);
    procedure actVCAddAllExecute(Sender: TObject);
    procedure actVCAddExecute(Sender: TObject);
    procedure actVCDelExecute(Sender: TObject);
    procedure actVCDelAllExecute(Sender: TObject);
    procedure actVAOKExecute(Sender: TObject);
    procedure actVACancelExecute(Sender: TObject);
    procedure actVAAddAllExecute(Sender: TObject);
    procedure actVAAddExecute(Sender: TObject);
    procedure actVADelExecute(Sender: TObject);
    procedure actVADelAllExecute(Sender: TObject);
    procedure actSubAppOKExecute(Sender: TObject);
    procedure actSupAppCancelExecute(Sender: TObject);
    procedure actInsertSubAppExecute(Sender: TObject);
    procedure actEditSubAppExecute(Sender: TObject);
    procedure actDeleteSubAppExecute(Sender: TObject);
    procedure dbAppChange(Sender: TObject);
    procedure dbIssuersChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure actOkVersionExecute(Sender: TObject);
    procedure actCancelVersionExecute(Sender: TObject);
    procedure actAddAllCardDesignExecute(Sender: TObject);
    procedure actAddOneCardDesignExecute(Sender: TObject);
    procedure actDelAllCardDesignExecute(Sender: TObject);
    procedure actDelOneCardDesignExecute(Sender: TObject);
    procedure actCardDesignOKExecute(Sender: TObject);
    procedure actCardDesignCancelExecute(Sender: TObject);
    procedure actCTXApplicationsOKExecute(Sender: TObject);
    procedure actCTXApplicationsCancelExecute(Sender: TObject);
    procedure actOkCardTypesXAppsExecute(Sender: TObject);
    procedure actCancelCardTypesxAppsExecute(Sender: TObject);
    procedure dbAppExit(Sender: TObject);
    procedure actAddAllTPXAppsExecute(Sender: TObject);
    procedure actAddOneTPXAppsExecute(Sender: TObject);
    procedure actDelAllTPXAppsExecute(Sender: TObject);
    procedure actDelOneTPXAppsExecute(Sender: TObject);
    procedure actTPXAppsOkExecute(Sender: TObject);
    procedure actTPXAppsCancelExecute(Sender: TObject);
    procedure actAddAllUTXAppsExecute(Sender: TObject);
    procedure actAddOneUTXAppsExecute(Sender: TObject);
    procedure actDelAllUTXAppsExecute(Sender: TObject);
    procedure actDelOneUTXAppsExecute(Sender: TObject);
    procedure actUTXAppsOKExecute(Sender: TObject);
    procedure actUTXAppsCancelExecute(Sender: TObject);
    procedure actOKStringsExecute(Sender: TObject);
    procedure actCancelStringsExecute(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure edtFareGracePeriodKeyPress(Sender: TObject; var Key: Char);
    procedure actAppxLineMTOkExecute(Sender: TObject);
    procedure actAppxLineMTCancelExecute(Sender: TObject);
    procedure actAddAllAppxLineMTExecute(Sender: TObject);
    procedure actAddOneAppxLineMTExecute(Sender: TObject);
    procedure actDelAllAppxLineMTExecute(Sender: TObject);
    procedure actDelOneAppxLineMTExecute(Sender: TObject);
    procedure sbtnFareRuleBottomClick(Sender: TObject);
    procedure sbtnFareRuleTopClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String;
    procedure SetApp;
    procedure SetSubApp;
    Procedure ListaValidatorActions;
    Procedure ListaValidatorConditions;
    Procedure ListaVisualActions;
    Procedure ListaValStates;
    Procedure ListaAppStrings;
    Procedure ListaCardDesign;
    Procedure ListaAppsXLineMt;
    Procedure ListaCardTypes;
    Procedure ListaTranspProv;
    Procedure ListaUserTypes;
    Procedure ListaVehicleTypes;
    procedure OpenChildrens;
    Procedure ChangeCdsOrigAppLook( OnlyActive: Boolean );
    procedure Insere_TransprovXVehTypesXApps;
  public
      procedure SetStatusPanels(status: Boolean); Override;
      procedure SetOrigApp;
    { Public declarations }
  end;

var
  FrmApplications: TFrmApplications;

implementation

uses uDmSys, uDmSys1, uConst, uGeralFunctions, AppSparkSysMain, uCardTemplates,
  uDmConexao, uFrmBaseCadastro, uFrmSystemLog,
  udlg_Ins_TransprovXVehTypesXApps, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmApplications.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmApplications.FormShow(Sender: TObject);
begin
  inherited;
    defOrder:=' ORDER BY APP.APP_ID ';
    strOrder:=defOrder;
    ct:='SELECT '+ ccardApplications + ' FROM APPLICATIONS APP ' +
          'INNER JOIN ISSUERS ISS ON (APP.ISS_ID = ISS.ISS_ID) '+
          'LEFT  JOIN STATISTICALFAMILIES SF  ON (SF.SF_ID = APP.SF_ID) '+
          'LEFT  JOIN MASTERAPPLICATIONS MA   ON (MA.MA_ID = APP.MA_ID) '+
          'LEFT  JOIN APPLICATIONFUNCTIONS AF ON (AF.AF_ID = APP.AF_ID) '+
          'LEFT  JOIN VALIDATORDISPLAYSMT VDM ON (VDM.VDM_CODE = APP.VDM_CODE) '+
          'LEFT JOIN KEYTYPES KT ON (KT.KT_CODE = APP.KT_CODE) '+
          '%where% %order% ';

    OpenTablesSys([DmSys.cdsApplications, DmSys.cdsStatisticalFamilies,
                   DmSys.cdsIssuers,  DmSys.cdsApplicationFunctions,
                   DmSys.cdsMasterApp, DmSys.cdsValidatorDisplaysMT,
                   DmSys.cdsSubApplications, DmSys.cdsApplicationsLook, DmSys.cdsOrigAppLook,
                   DmSys.cdsValidatorStates, DmSys.cdsValidatorStatesXApps,
                   DmSys.cdsValidatorActions, DmSys.cdsAppsXValidatorActions,
                   DmSys.cdsAppsXValidatorConditions, DmSys.cdsValidatorConditions,
                   DmSys.cdsAppsXValVisualActions, DmSys.cdsValVisualActions, DmSys1.cdsKeyTypes,
                   DmSys.cdsApplicationStrings, DmSys1.cdsApplicationVersions, DmSys1.cdsCardDesignxApps,
                   DmSys1.cdsCardTemplatesxApps, DmSys1.cdsCardTypesXApps, DmSys1.cdsTPXApps, DmSys1.cdsUserTypesXApps,
                   DmSys.cdsCardTemplates, DmSYs.cdsTimeGroups, DmSys.cdsLineGroups, dmSys1.cdsPeriodUseTypesLk,
                   DmSys.cdsLineMt, dmSys1.cdsDateStatus, dmSys1.cdsValidationPeriods, dmSys1.cdsValidityTypes,
                   DmSys1.cdsApplicationsXLineMT, DmSys.cdsVehTypXApp, DmSys.cdsTransprovXVehTypesXApps]);
    SetOrigApp;

    //FrmSparksysMain.stMain.Panels[3].Text := intToStr( DmSys.cdsApplications.RecordCount) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsApplications.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    actLog.Enabled := DmSys.cdsApplications.RecordCount > 0;

end;

procedure TFrmApplications.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsApplications, DmSys.cdsStatisticalFamilies,
                    DmSys.cdsIssuers,   DmSys.cdsApplicationFunctions,
                    DmSys.cdsMasterApp, DmSys.cdsValidatorDisplaysMT,
                    DmSys.cdsSubApplications, DmSys.cdsApplicationsLook,
                    DmSys.cdsValidatorStates, DmSys.cdsValidatorStatesXApps,
                    DmSys.cdsValidatorActions, DmSys.cdsAppsXValidatorActions,
                    DmSys.cdsAppsXValidatorConditions, DmSys.cdsValidatorConditions,
                    DmSys.cdsAppsXValVisualActions, DmSys.cdsValVisualActions, DmSys1.cdsKeyTypes,
                    DmSys.cdsApplicationStrings, DmSys1.cdsApplicationVersions, DmSys1.cdsCardDesignxApps,
                    DmSys1.cdsCardTemplatesxApps, DmSys1.cdsCardTypesXApps, DmSys1.cdsTPXApps, DmSys1.cdsUserTypesXApps,
                    DmSys.cdsCardTemplates, DmSYs.cdsTimeGroups, DmSys.cdsLineGroups, dmSys1.cdsPeriodUseTypesLk,
                    DmSys.cdsLineMt, dmSys1.cdsDateStatus, dmSys1.cdsValidationPeriods, dmSys1.cdsValidityTypes,
                    DmSys1.cdsApplicationsXLineMT,DmSys.cdsVehTypXApp, DmSys.cdsTransprovXVehTypesXApps]);

    DmSys.cdsApplications.CommandText := 'SELECT '+ ccardApplications + ' FROM APPLICATIONS APP ' +
                                     'INNER JOIN ISSUERS ISS ON (APP.ISS_ID = ISS.ISS_ID) '+
                                     'LEFT  JOIN STATISTICALFAMILIES SF  ON (SF.SF_ID = APP.SF_ID) '+
                                     'LEFT  JOIN MASTERAPPLICATIONS MA   ON (MA.MA_ID = APP.MA_ID) '+
                                     'LEFT  JOIN APPLICATIONFUNCTIONS AF ON (AF.AF_ID = APP.AF_ID) '+
                                     'LEFT  JOIN VALIDATORDISPLAYSMT VDM ON (VDM.VDM_CODE = APP.VDM_CODE) '+
                                     'LEFT JOIN KEYTYPES KT ON (KT.KT_CODE = APP.KT_CODE) '+
                                     'WHERE APP_STATUS = ''A'' ORDER BY APP.APP_ID';
    FrmApplications := Nil;
end;

Procedure TFrmApplications.ListaValidatorActions;
Begin
  With dmSys do
    Begin
     lbSelecionadas.Clear;
     lbDisponiveis.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT VA_ID, VA_DESC FROM VALIDATORACTIONS  ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF cdsAppsXValidatorActions.Locate('VA_ID', cdsGeral.fieldByName('VA_ID').AsString, [] )
               Then lbSelecionadas.Items.AddObject(cdsGeral.fieldByName('VA_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('VA_ID').AsInteger))
               Else lbDisponiveis.Items.AddObject(cdsGeral.fieldByName('VA_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('VA_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
End;

Procedure TFrmApplications.ListaValStates;
Begin
   With dmSys do
    Begin
     lbSelStates.Clear;
     lbDispStates.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT VS_ID, VS_LONGDESC FROM  VALIDATORSTATES WHERE  VS_STATUS = ''A'' ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin

           IF dmSys.cdsValidatorStatesXApps.Locate('APP_ID;ISS_ID;VS_ID',VarArrayOf([
              dmSys.cdsApplications.FieldByName('APP_ID').AsString,
              dmSys.cdsApplications.FieldByName('ISS_ID').AsString,
              cdsGeral.fieldByName('VS_ID').AsString]), [])
              Then lbSelStates.Items.AddObject(cdsGeral.fieldByName('VS_LONGDESC').AsString,
                                       TObject(cdsGeral.fieldByName('VS_ID').AsInteger))
              Else lbDispStates.Items.AddObject(cdsGeral.fieldByName('VS_LONGDESC').AsString,
                                       TObject(cdsGeral.fieldByName('VS_ID').AsInteger));
           cdsGeral.Next;
           end;
    End;
End;


Procedure TFrmApplications.ListaVisualActions;
Begin
   With dmSys do
    Begin
      lbSelActions.Clear;
      lbDispActions.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT VVA_ID, VVA_DESC FROM VALIDATORVISUALACTIONS  ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF cdsAppsXValVisualActions.Locate('VVA_ID', cdsGeral.fieldByName('VVA_ID').AsString, [] )
                 Then lbSelActions.Items.AddObject(cdsGeral.fieldByName('VVA_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('VVA_ID').AsInteger))
                 Else lbDispActions.Items.AddObject(cdsGeral.fieldByName('VVA_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('VVA_ID').AsInteger));
            cdsGeral.Next;
           end;
    End;
End;

Procedure TFrmApplications.ListaValidatorConditions;
Begin
  With dmSys do
    Begin
     lbSelecionadasConditions.Clear;
     lbDisponiveisConditions.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT VC_ID, VC_DESC FROM VALIDATORCONDITIONS  ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
             IF cdsAppsXValidatorConditions.Locate('VC_ID', cdsGeral.fieldByName('VC_ID').AsString, [] )
               Then lbSelecionadasConditions.Items.AddObject(cdsGeral.fieldByName('VC_DESC').AsString,
                                                     TObject(cdsGeral.fieldByName('VC_ID').AsInteger))
               Else lbDisponiveisConditions.Items.AddObject(cdsGeral.fieldByName('VC_DESC').AsString,
                                                     TObject(cdsGeral.fieldByName('VC_ID').AsInteger));
            cdsGeral.Next;
           end;
    End;
End;

Procedure TFrmApplications.ListaAppStrings;
//Var
//  StrApp : String;
Begin
{   With dmSys do
    Begin
     lbSelStates.Clear;
     lbDispStates.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT APP_ID, ISS_ID, APPSTR_SEQNBR, APPSTR_STRING FROM  APPLICATIONSTRINGS WHERE APPSTR_STATUS = ''A'' ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
           StrApp := cdsGeral.fieldByName('APP_ID').AsString+';'+cdsGeral.fieldByName('ISS_ID').AsString;
           IF dmSys.cdsApplicationStrings.Locate('APP_ID;ISS_ID;APPSTR_SEQNBR',VarArrayOf([
              dmSys.cdsGeral.FieldByName('APP_ID').AsString,
              dmSys.cdsGeral.FieldByName('ISS_ID').AsString,
              cdsGeral.fieldByName('APPSTR_SEQNBR').AsString]), [])
              Then lbSelStrings.Items.AddObject(cdsGeral.fieldByName('APPSTR_STRING').AsString,
                                       TObject(StrApp))
              Else lbDispString.Items.AddObject(cdsGeral.fieldByName('APPSTR_STRING').AsString,
                                       TObject(StrApp));
           cdsGeral.Next;
           end;
    End;}
End;



procedure TFrmApplications.SetSubApp;
Var
  St : Boolean;
Begin
     St := (DmSys.cdsSubApplications.RecordCount > 0);
     SetActions([actDeleteSubApp, actEditSubApp], St, Self, t_form_objects);
     cbCardApps.Enabled := NOT (Status = stConsult);
     pcSubApplications.ActivePageIndex := 1;
End;

procedure TFrmApplications.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsApplications);
  SetActions([], False, FrmApplications, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel, actInsertSubApp], true, FrmApplications, t_form_objects);
  dbIssuers.SetFocus;
  SetSubApp;
  ChangeCdsOrigAppLook( True );
  dbLkApplicationsOrigem.KeyValue := -1;
end;

procedure TFrmApplications.actEditExecute(Sender: TObject);
begin
  DmSys.cdsApplications.AfterScroll(dmSys.cdsApplications);
  ChangeCdsOrigAppLook( True );
  ListaCardDesign;
  ListaTranspProv;
  ListaUserTypes;
  inherited;
  SetActions([], False, FrmApplications, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel, actInsertSubApp], true, FrmApplications, t_form_objects);
  SetSubApp;
  dbIssuers.Enabled := False;
  dbApp.Enabled := False;
end;

procedure TFrmApplications.actApplyUpdatesExecute(Sender: TObject);
var
  iAF_ID : Integer;
begin
 inherited;
  If  status = stConsult Then
    BEGIN

    If dbLkApplicationsOrigem.KeyValue = NULL Then
    Begin
       DmSys.cdsApplications.FieldByName('ISS_ID_ORIG').AsInteger := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
       DmSys.cdsApplications.FieldByName('APP_ID_ORIG').AsInteger := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
    End
    Else
    Begin
       DmSys.cdsApplications.FieldByName('ISS_ID_ORIG').AsInteger := DmSys.cdsOrigAppLook.FieldByName('ISS_ID').AsInteger;
       DmSys.cdsApplications.FieldByName('APP_ID_ORIG').AsInteger := DmSys.cdsOrigAppLook.FieldByName('APP_ID').AsInteger;
    End;

    //Verifica se a FareRule e a FareGracePeriod estão corretos - Daniel
    iAF_ID := 6;

    if cmbAF_ID.Text = '' then
    begin
      DisplayMsg(t_form_objects, 'É necessário selecionar a "Função da Aplicação"   ', [], [], mtConfirmation, [mbOK]);
      cmbAF_ID.SetFocus;
      exit;
    end;

    if dtsMaster.DataSet.FieldByName('AF_ID').AsInteger = iAF_ID then
    begin
      if dbedtFareRule.Text = '' then
      begin
        DisplayMsg(t_form_objects, 'É necessário selecionar uma "Regra de Tarifa"   ', [], [], mtConfirmation, [mbOK]);
        dbedtFareRule.SetFocus;
        exit;
      end;
{      if (dbedtFareRule.Text = '0') and (Trim(edtFareGracePeriod.Text) = '') then
      begin
        DisplayMsg(t_form_objects, 'É necessário digitar um valor em “Tempo de Ret. da Tarifa”   ', [], [], mtConfirmation, [mbOK]);
        edtFareGracePeriod.SetFocus;
        exit;
      end;
    end
    else
    begin
      dtsMaster.DataSet.FieldByName('APP_FARERULE').AsInteger := 0;
      dbedtFareRule.Text := '0';
      edtFareGracePeriod.Text := '0';}
    end;

    SetOrigApp;

    If ApplyTablesSys([dbIssuers, dbApp, dbDesc, dbPriority, dbDescLong ], [DmSys.cdsApplications,
                                                                                           DmSys.cdsSubApplications,
                                                                                           DmSys.cdsApplicationStrings,
                                                                                           DmSys.cdsAppsXValVisualActions,
                                                                                           DmSys.cdsAppsXValidatorActions,
                                                                                           DmSys.cdsAppsXValidatorConditions,
                                                                                           DmSys.cdsValidatorStatesXApps,
                                                                                           DmSys1.cdsApplicationVersions,
                                                                                           DmSys1.cdsCardDesignxApps,
                                                                                           DmSys1.cdsCardTemplatesxApps,
                                                                                           DmSys1.cdsCardTypesXApps,
                                                                                           DmSys1.cdsTPXApps,
                                                                                           DmSys1.cdsUserTypesXApps,
                                                                                           DmSys1.cdsApplicationsXLineMT,
                                                                                           DmSys.cdsVehTypXApp,
                                                                                           DmSys.cdsTransprovXVehTypesXApps]) Then
       begin
        SetActions([], True, FrmApplications, t_form_objects);
        SetActions([actApplyUpdates, actCancel], False, FrmApplications, t_form_objects);
        tbtnRefresh.Click;
        dbIssuers.Enabled := True;
        dbApp.Enabled := True;
        DmSys.cdsOrigAppLook.Close;
        DmSys.cdsOrigAppLook.Open;
        DmSys.cdsApplicationsLook.Close;
        DmSys.cdsApplicationsLook.Open;
        DmSys.cdsApplicationStrings.Close;
        DmSys.cdsApplicationStrings.Open;
        ChangeCdsOrigAppLook( False );
        SetOrigApp;
       end;
    END;
  actLog.Enabled := True;

end;

procedure TFrmApplications.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     DmSys.cdsApplications.Cancel;
     DmSys.cdsSubApplications.Cancel;
     DmSys.cdsApplicationStrings.Cancel;
     DmSys.cdsAppsXValVisualActions.Cancel;
     DmSys.cdsAppsXValidatorActions.Cancel;
     DmSys.cdsAppsXValidatorConditions.Cancel;
     DmSys.cdsValidatorStatesXApps.Cancel;
     DmSys1.cdsCardDesignxApps.Cancel;
     DmSys1.cdsCardTemplatesxApps.Cancel;
     DmSys1.cdsCardTypesXApps.Cancel;
     DmSys1.cdsTPXApps.Cancel;
     DmSys1.cdsUserTypesXApps.Cancel;
     DmSys1.cdsApplicationsXLineMT.Cancel;
     DmSys.cdsVehTypXApp.Cancel;
     DmSys.cdsTransprovXVehTypesXApps.Cancel;

     DmSys.cdsSubApplications.CancelUpdates;
     DmSys.cdsApplicationStrings.CancelUpdates;
     DmSys.cdsAppsXValVisualActions.CancelUpdates;
     DmSys.cdsAppsXValidatorActions.CancelUpdates;
     DmSys.cdsAppsXValidatorConditions.CancelUpdates;
     DmSys.cdsValidatorStatesXApps.CancelUpdates;
     DmSys1.cdsApplicationVersions.CancelUpdates;
     DmSys1.cdsCardDesignxApps.CancelUpdates;
     DmSys1.cdsCardTemplatesxApps.CancelUpdates;
     DmSys1.cdsCardTypesXApps.CancelUpdates;
     DmSys1.cdsTPXApps.CancelUpdates;
     DmSys1.cdsUserTypesXApps.CancelUpdates;
     DmSys1.cdsApplicationsXLineMT.CancelUpdates;
     DmSys.cdsVehTypXApp.CancelUpdates;
     DmSys.cdsTransprovXVehTypesXApps.CancelUpdates;

     DmSys.cdsValidatorStatesXApps.Close;
     DmSys.cdsValidatorStatesXApps.Open;

     SetActions([], True, FrmApplications, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmApplications, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     dbIssuers.Enabled := True;
     dbApp.Enabled := True;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     ChangeCdsOrigAppLook( False );
    end;
  actLog.Enabled := DmSys.cdsApplications.RecordCount > 0;

end;

procedure TFrmApplications.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     with DmSys do
        Begin
         cdsApplications.Edit;
         cdsApplications.FieldByName('APP_STATUS').AsString := 'I';
         cdsApplications.Post;
         cdsApplications.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsApplications.RecordCount > 0;

end;

procedure TFrmApplications.dbLkApplicationsCloseUp(Sender: TObject);
begin
  inherited;
//   edApp.SetFocus;
   IF Trim(dbLkApplications.Text) <> '' Then
      Begin
{         edApp.Text := dmSys.cdsApplicationsLook.FieldByName('APP_DESCSHORT').AsString +
                       '        -        '+
                       dmSys.cdsApplicationsLook.FieldByName('ISS_DESCLONG').AsString;
}
      End;

//  dmSys.cdsSubApplications.FieldByName('App_id').AsInteger :=
//    dmSys.cdsApplications.FieldByName('App_id').AsInteger;
end;

procedure TFrmApplications.SetApp;
Var Str : String;
Begin
   DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([dmSys.cdsSubApplications.FieldByName('SUB_APPID').AsInteger,
                                                                 dmSys.cdsSubApplications.FieldByName('SUB_ISSID').AsInteger]), [] );

   dbLkApplications.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger;

   Str :=  dmSys.cdsSubApplications.FieldByName('APP_DESCSHORT').AsString +
           '        -        '+
           dmSys.cdsSubApplications.FieldByName('ISS_DESCLONG').AsString;
   If Trim(Str) = '-' Then
      Str := '';
//    edApp.Text := Str;
End;

procedure TFrmApplications.SetOrigApp;
Var Str : String;
Begin
  iF  DmSys.cdsOrigAppLook.Locate('APP_ID;ISS_ID', VarArrayOf([dmSys.cdsApplications.FieldByName('APP_ID_ORIG').AsInteger,
                                                            dmSys.cdsApplications.FieldByName('ISS_ID_ORIG').AsInteger]), [] ) Then


  begin
   dbLkApplicationsOrigem.KeyValue := DmSys.cdsOrigAppLook.fieldByname('APP_ISS_ID').AsInteger;
   Str :=  dmSys.cdsOrigAppLook.FieldByName('APP_DESCSHORT').AsString +
           '  -  '+
           dmSys.cdsOrigAppLook.FieldByName('ISS_DESCLONG').AsString
  end
   Else
   Str := '';
//    edAppOrigem.Text := Str;
End;


procedure TFrmApplications.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
    IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
    Begin
      SetSubApp;
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmCardTemplates, t_form_objects);
      DmSys.cdsApplications.AfterScroll(dmSys.cdsApplications);
      ListaCardDesign;
      ListaTranspProv;
      ListaUserTypes;
    End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True,  FrmCardTemplates, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;


procedure TFrmApplications.SetStatusPanels(status: Boolean);
begin
  gbApp.Enabled := Status;
End;

procedure TFrmApplications.actFilterExecute(Sender: TObject);
//Var
  //strWhere  : String; //cidel-

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(eApp.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' APP.APP_ID LIKE ' + QuotedStr(eApp.Text + '%') + ' AND ';
       end;


    If Trim(dblkIssuer.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' APP.ISS_ID = ' + QuotedStr(InttoStr(dblkIssuer.KeyValue)) + ' AND ';
       End;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' APP_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' APP_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsApplications.Close;
      cdsApplications.CommandText := 'SELECT '+ ccardApplications + ' FROM APPLICATIONS APP ' +
                                     'INNER JOIN ISSUERS ISS ON (APP.ISS_ID = ISS.ISS_ID) '+
                                     'LEFT  JOIN STATISTICALFAMILIES SF  ON (SF.SF_ID = APP.SF_ID) '+
                                     'LEFT  JOIN MASTERAPPLICATIONS MA   ON (MA.MA_ID = APP.MA_ID) '+
                                     'LEFT  JOIN APPLICATIONFUNCTIONS AF ON (AF.AF_ID = APP.AF_ID) '+
                                     'LEFT  JOIN VALIDATORDISPLAYSMT VDM ON (VDM.VDM_CODE = APP.VDM_CODE) '+
                                     'LEFT  JOIN KEYTYPES KT ON (KT.KT_CODE = APP.KT_CODE) '+
                                      strWhere + StrOrder; //' ORDER BY APP.APP_ID';
      cdsApplications.Open;

      //FrmSparksysMain.stMain.Panels[3].Text := intToStr( cdsApplications.RecordCount) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsApplications.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
      
      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := DmSys.cdsApplications.RecordCount > 0;

end;

procedure TFrmApplications.pcSubApplicationsChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
//   AllowChange :=  (actInsertSubApp.Enabled) OR (pcSubApplications.ActivePageIndex = 5);
end;

procedure TFrmApplications.lbDisponiveisDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbSelecionadasDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbSelecionadasDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
   btnAddAllLineMt.Click;
end;

procedure TFrmApplications.lbDisponiveisDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  btnDelAllLineMt.Click; 
end;

procedure TFrmApplications.lbDisponiveisConditionsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbSelecionadasConditionsDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbDispActionsDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbSelActionsDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
    Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbDispStatesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbSelStatesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmApplications.lbDisponiveisConditionsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
   btDelCondictions.Click;
end;

procedure TFrmApplications.lbSelecionadasConditionsDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btAddCondictions.Click;
end;

procedure TFrmApplications.lbDispActionsDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
   btDelVisualActions.Click;
end;

procedure TFrmApplications.lbSelActionsDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
btAddVisualActions.Click;
end;

procedure TFrmApplications.lbDispStatesDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
btDelStates.Click;
end;

procedure TFrmApplications.lbSelStatesDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
btAddStates.Click;
end;

procedure TFrmApplications.pcSubApplicationsChange(Sender: TObject);
begin
  inherited;
 If Status <> stConsult Then
 case pcSubApplications.ActivePageIndex of
    0 : Begin
           SetActions([actInsertSubApp], True, Self, t_form_objects);
           SetActions([actEditSubApp, actDeleteSubApp], (DmSys.cdsSubApplications.RecordCount > 0), Self, t_form_objects);
        End;

    1 : Begin
          SetActions([actInsertSubApp, actEditSubApp, actDeleteSubApp ], True, Self, t_form_objects);
          SetActions([actDeleteSubApp ], False, Self, t_form_objects);
        End;

    2 : Begin
          SetActions([actInsertSubApp, actEditSubApp, actDeleteSubApp ], True, Self, t_form_objects);
          SetActions([actDeleteSubApp ], False, Self, t_form_objects);
        End;

    3 : Begin
          SetActions([actInsertSubApp, actEditSubApp, actDeleteSubApp ], True, Self, t_form_objects);
          SetActions([actDeleteSubApp ], False, Self, t_form_objects);
        End;

    4 : Begin
          SetActions([actInsertSubApp, actEditSubApp, actDeleteSubApp ], True, Self, t_form_objects);
          SetActions([actDeleteSubApp ], False, Self, t_form_objects);
        End;

    5 : Begin
          SetActions([actInsertSubApp ], True, Self, t_form_objects);
          if dmSys.cdsApplicationStrings.RecordCount = 0 then
            SetActions([actDeleteSubApp, actEditSubApp ], False, Self, t_form_objects)
          else
            SetActions([actDeleteSubApp, actEditSubApp ], True, Self, t_form_objects);
        end;

    6..11 : begin
              SetActions([actInsertSubApp, actEditSubApp, actDeleteSubApp ], True, Self, t_form_objects);
            end;

    13: begin
          SetActions([actInsertSubApp ], True, Self, t_form_objects);
          SetActions([actEditSubApp ], False, Self, t_form_objects);

          if dmSys.cdsTransprovXVehTypesXApps.RecordCount = 0 then
            SetActions([actDeleteSubApp], False, Self, t_form_objects)
          else
            SetActions([actDeleteSubApp], True, Self, t_form_objects);
        end;

 End;// Case..

end;

procedure TFrmApplications.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetSubApp;
  SetStatusPanels(False);
end;

procedure TFrmApplications.dbLkApplicationsOrigemCloseUp(Sender: TObject);
begin
  inherited;
//   edAppOrigem.SetFocus;
   IF Trim(dbLkApplicationsOrigem.Text) <> '' Then
      Begin
{         edAppOrigem.Text := dmSys.cdsOrigAppLook.FieldByName('APP_DESCSHORT').AsString +
                       '  -  '+
                       dmSys.cdsOrigAppLook.FieldByName('ISS_DESCLONG').AsString;
}
      End;
end;

procedure TFrmApplications.edtFareGracePeriodChange(Sender: TObject);
begin
  inherited;
  If (edtFareGracePeriod.Text <> '') Then
  If  (StrtoInt(edtFareGracePeriod.Text) > 255) OR
      (StrtoInt(edtFareGracePeriod.Text) < 0) Then
     Begin
       DisplayMsg(t_form_objects, '%T %S', [1534], ['0 - 255'], mtInformation, [mbOK]);
       edtFareGracePeriod.Text := '0';
       edtFareGracePeriod.SetFocus;
     End;
end;

procedure TFrmApplications.actOKVSExecute(Sender: TObject);
begin
 inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
   dbgValidatorStatesXApps.Visible := True;

end;

procedure TFrmApplications.actCancelVSExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

   dbgValidatorStatesXApps.Visible := True;
   dmSys.cdsValidatorStatesXApps.Cancel;
end;

procedure TFrmApplications.actVSAddAllExecute(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  For I := 0 to lbDispStates.Count - 1 do
     Begin
       dmSys.cdsValidatorStatesXApps.Append;
       dmSys.cdsValidatorStatesXApps.FieldByName('VS_ID').AsInteger       := Integer(lbDispStates.items.Objects[I]);
       dmSys.cdsValidatorStatesXApps.FieldByName('VS_LONGDESC').AsString  := lbDispStates.Items.Strings[I];
       dmSys.cdsValidatorStatesXApps.FieldByName('VSAPP_STATUS').AsString := 'A';
       dmSys.cdsValidatorStatesXApps.FieldByName('STATUS_ID').AsString    := 'Ativo';
       dmSys.cdsValidatorStatesXApps.Post;

       lbSelStates.Items.AddObject(lbDispStates.Items.Strings[I],
                                    lbDispStates.items.Objects[I]);
//      lbDispStates.MoveSelection(lbSelStates);
     End;

    lbDispStates.SelectAll;
    lbDispStates.DeleteSelected;

//    lbDispStates.Items.Delete(lbDispStates.ItemIndex);

end;

procedure TFrmApplications.actVSAddExecute(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  For I := 0 to lbDispStates.Count - 1 do
      IF lbDispStates.Selected[I] Then
         Begin
            dmSys.cdsValidatorStatesXApps.Append;
            dmSys.cdsValidatorStatesXApps.FieldByName('VS_ID').AsInteger       := Integer(lbDispStates.items.Objects[I]);
            dmSys.cdsValidatorStatesXApps.FieldByName('VS_LONGDESC').AsString  := lbDispStates.Items.Strings[I];
            dmSys.cdsValidatorStatesXApps.FieldByName('VSAPP_STATUS').AsString := 'A';
            dmSys.cdsValidatorStatesXApps.FieldByName('STATUS_ID').AsString    := 'Ativo';
            dmSys.cdsValidatorStatesXApps.Post;
         End;

  lbDispStates.MoveSelection(lbSelStates);

end;

procedure TFrmApplications.actVSDelExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
  For I := 0 to lbSelStates.Count - 1 do
      IF lbSelStates.Selected[I] Then
         Begin
           IF dmSys.cdsValidatorStatesXApps.Locate('APP_ID;ISS_ID;VS_ID',VarArrayOf([
              dmSys.cdsApplications.FieldByName('APP_ID').AsString,
              dmSys.cdsApplications.FieldByName('ISS_ID').AsString,
              InttoStr(Integer(lbSelStates.items.Objects[I])) ]), [])
           Then
              dmSys.cdsValidatorStatesXApps.Delete;
         End;

 lbSelStates.MoveSelection(lbDispStates);

end;

procedure TFrmApplications.actVSDelAllExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
//  lbSelStates.SelectAll;
//  lbSelStates.MoveSelection(lbDispStates);

  For I := 0 to lbSelStates.Count - 1 do
     Begin
       IF dmSys.cdsValidatorStatesXApps.Locate('APP_ID;ISS_ID;VS_ID',VarArrayOf([
          dmSys.cdsApplications.FieldByName('APP_ID').AsString,
          dmSys.cdsApplications.FieldByName('ISS_ID').AsString,
          InttoStr(Integer(lbSelStates.items.Objects[I])) ]), [])
       Then
          dmSys.cdsValidatorStatesXApps.Delete;

       lbDispStates.Items.AddObject(lbSelStates.Items.Strings[I],
                                    lbSelStates.items.Objects[I]);
//      lbDispStates.MoveSelection(lbSelStates);
     End;

    lbSelStates.SelectAll;
    lbSelStates.DeleteSelected;

//    lbDispStates.Items.Delete(lbDispStates.ItemIndex);


end;

procedure TFrmApplications.actVVAAddAllExecute(Sender: TObject);
begin
  inherited;
  lbDispActions.SelectAll;
  lbDispActions.MoveSelection(lbSelActions);
end;

procedure TFrmApplications.actVVAAddExecute(Sender: TObject);
begin
  inherited;
  lbDispActions.MoveSelection(lbSelActions);
end;

procedure TFrmApplications.actVVADelExecute(Sender: TObject);
begin
 inherited;
 lbSelActions.MoveSelection(lbDispActions);
end;

procedure TFrmApplications.actVVADelAllExecute(Sender: TObject);
begin
  inherited;
  lbSelActions.SelectAll;
  lbSelActions.MoveSelection(lbDispActions);
end;

procedure TFrmApplications.actVVAOKExecute(Sender: TObject);
Var I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}
   dmSys.cdsAppsXValVisualActions.First;

   While NOT dmSys.cdsAppsXValVisualActions.Eof do
      Begin
        dmSys.cdsAppsXValVisualActions.Delete;
      End;

   For I := 0 to lbSelActions.Count - 1 do
      Begin
         dmSys.cdsAppsXValVisualActions.Append;
         dmSys.cdsAppsXValVisualActions.FieldByName('VVA_ID').AsInteger  := Integer(lbSelActions.items.Objects[I]);
         dmSys.cdsAppsXValVisualActions.FieldByName('VVA_DESC').AsString := lbSelActions.Items.Strings[I];
         dmSys.cdsAppsXValVisualActions.Post;
      End;

   dbgVisualActions.Visible := True;
end;

procedure TFrmApplications.actVVACancelExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}
   dbgVisualActions.Visible := True;
   dmSys.cdsAppsXValVisualActions.Cancel;
end;

procedure TFrmApplications.actVCOKExecute(Sender: TObject);
 var I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}
   dmSys.cdsAppsXValidatorConditions.First;

   While NOT dmSys.cdsAppsXValidatorConditions.Eof do
      Begin
        dmSys.cdsAppsXValidatorConditions.Delete;
      End;

   For I := 0 to lbSelecionadasConditions.Count - 1 do
      Begin
         dmSys.cdsAppsXValidatorConditions.Append;
         dmSys.cdsAppsXValidatorConditions.FieldByName('VC_ID').AsInteger  := Integer(lbSelecionadasConditions.items.Objects[I]);
         dmSys.cdsAppsXValidatorConditions.FieldByName('VC_DESC').AsString := lbSelecionadasConditions.Items.Strings[I];
         dmSys.cdsAppsXValidatorConditions.Post;
      End;

   gdbValidatorConditions.Visible := True;

end;

procedure TFrmApplications.actVCCancelExecute(Sender: TObject);
begin
  inherited;
{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
 }

   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

   gdbValidatorConditions.Visible := True;
   dmSys.cdsAppsXValidatorConditions.Cancel;
end;

procedure TFrmApplications.actVCAddAllExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveisConditions.SelectAll;
  lbDisponiveisConditions.MoveSelection(lbSelecionadasConditions);
end;

procedure TFrmApplications.actVCAddExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveisConditions.MoveSelection(lbSelecionadasConditions);
end;

procedure TFrmApplications.actVCDelExecute(Sender: TObject);
begin
  inherited;
lbSelecionadasConditions.MoveSelection(lbDisponiveisConditions);
end;

procedure TFrmApplications.actVCDelAllExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadasConditions.SelectAll;
  lbSelecionadasConditions.MoveSelection(lbDisponiveisConditions);
end;

procedure TFrmApplications.actVAOKExecute(Sender: TObject);
 Var I : Integer;
begin
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}

   dmSys.cdsAppsXValidatorActions.First;

   While NOT dmSys.cdsAppsXValidatorActions.Eof do
      Begin
        dmSys.cdsAppsXValidatorActions.Delete;
      End;

   For I := 0 to lbSelecionadas.Count - 1 do
      Begin
         dmSys.cdsAppsXValidatorActions.Append;
         dmSys.cdsAppsXValidatorActions.FieldByName('VA_ID').AsInteger  := Integer(lbSelecionadas.items.Objects[I]);
         dmSys.cdsAppsXValidatorActions.FieldByName('VA_DESC').AsString := lbSelecionadas.Items.Strings[I];
         dmSys.cdsAppsXValidatorActions.Post;
      End;

   dbgAppsXValidatorActions.Visible := True;

end;

procedure TFrmApplications.actVACancelExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
 }
   dbgAppsXValidatorActions.Visible := True;
   dmSys.cdsAppsXValidatorActions.Cancel;
end;

procedure TFrmApplications.actVAAddAllExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmApplications.actVAAddExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmApplications.actVADelExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmApplications.actVADelAllExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmApplications.actSubAppOKExecute(Sender: TObject);
begin
  inherited;
  If dbLkApplications.KeyValue = Null Then
    DisplayMsg(t_form_objects, '%T', [3006], [], mtError, [mbOK])
  Else
  Begin
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{  tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}
  With DmSys do
    Begin

         cdsSubApplications.FieldByName('SUB_APPID').AsString :=  cdsApplicationsLook.fieldByName('APP_ID').AsString;
         cdsSubApplications.FieldByName('SUB_ISSID').AsString :=  cdsApplicationsLook.fieldByName('ISS_ID').AsString;
         cdsSubApplications.FieldByName('APP_DESCSHORT').AsString :=  cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
         cdsGeral.Close;
         cdsGeral.CommandText := 'SELECT MAX(SA_SEQNBR) FROM SUBAPPLICATIONS '+
                                 'WHERE  APP_ID = :APP_ID AND ISS_ID = :ISS_ID AND '+
                                 'SUB_APPID = :SUB_APPID  AND SUB_ISSID = :SUB_ISSID';
         cdsGeral.Params.ParamByName('APP_ID').AsString    := cdsApplications.fieldByName('APP_ID').AsString;
         cdsGeral.Params.ParamByName('ISS_ID').AsString    := cdsApplications.fieldByName('ISS_ID').AsString;
         cdsGeral.Params.ParamByName('SUB_APPID').AsString := cdsApplicationsLook.fieldByName('APP_ID').AsString;
         cdsGeral.Params.ParamByName('SUB_ISSID').AsString := cdsApplicationsLook.fieldByName('ISS_ID').AsString;
         cdsGeral.Open;

         if cdsGeral.Fields.Fields[0].Value = null Then
            cdsSubApplications.FieldByName('SA_SEQNBR').AsString := '1'
         Else
            cdsSubApplications.FieldByName('SA_SEQNBR').AsString := InttoStr(cdsGeral.Fields.Fields[0].AsInteger + 1);

         cdsSubApplications.FieldByName('ISS_DESCLONG').AsString := cdsApplicationsLook.fieldByName('ISS_DESCLONG').AsString;
         cdsSubApplications.Post;
         dbgSubApplications.Visible := True;
         cdsGeral.Close;
    end;
  End;
end;

procedure TFrmApplications.actSupAppCancelExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}
   DmSys.cdsSubApplications.Cancel;
   dbgSubApplications.Visible := True;
end;

procedure TFrmApplications.actInsertSubAppExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp, actDeleteSubApp ], False, Self, t_form_objects);

{   tbtnApply.Enabled  := False;
   tbtnCancel.Enabled := False;
   tbtnNewCardApp.Enabled  := False;
   tbtnEditCardApp.Enabled := False;
}
   Case pcSubApplications.ActivePageIndex of
       0 : Begin
//             edApp.Text := '';
             dbLkApplications.KeyValue := -1;
             dbgSubApplications.Visible := False;
             ActionInsertSys(dmSys.cdsSubApplications);
           End;

       1 : Begin
             dbgAppsXValidatorActions.Visible := False;
//             ActionInsertSys(dmSys.cdsAppsXValidatorActions);
             dmSys.cdsAppsXValidatorActions.Edit;
             ListaValidatorActions;
           End;

       2 : Begin
             gdbValidatorConditions.Visible := False;
//             ActionInsertSys(dmSys.cdsAppsXValidatorConditions);
             dmSys.cdsAppsXValidatorConditions.Edit;
             ListaValidatorConditions;
           End;

       3 : Begin
             dbgVisualActions.Visible := False;
//             ActionInsertSys(dmSys.cdsAppsXValVisualActions);
             dmSys.cdsAppsXValVisualActions.Edit;
             ListaVisualActions;
           End;

       4 : Begin
             dbgValidatorStatesXApps.Visible := False;
//             ActionInsertSys(dmSys.cdsValidatorStatesXApps);
             dmSys.cdsValidatorStatesXApps.Edit;
             ListaValStates;
           End;

       5 : Begin
             dbgStrings.Visible := False;
//             ActionInsertSys(dmSys.cdsValidatorStatesXApps);
             dmSys.cdsApplicationStrings.Append;
             RxDBComboBox2.ItemIndex := 0;
//             ListaAppStrings;
           End;

       6 : Begin
             if (dmsys.cdsApplications.fieldByName('APP_ID').IsNull) or
                (dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
             begin
               SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
               exit;
             end;
             dbgVersions.Visible := False;
             dmSys1.cdsApplicationVersions.Append;
             dbedtVersionValidity.Date := Date;
             dbedtVersionStatus.ItemIndex := 0;
             spnedtVersion.ReadOnly := False;
             spnedtVersion.Value := 1;
           End;

       7 : Begin
             if (dmsys.cdsApplications.fieldByName('APP_ID').IsNull) or
                (dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
             begin
               SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
               exit;
             end;
             dbgCardDesign.Visible := False;
             dmSys1.cdsCardDesignxApps.Edit;
             ListaCardDesign;
           End;

       8 : Begin
             if (dmsys.cdsApplications.fieldByName('APP_ID').IsNull) or
                (dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
             begin
               SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
               exit;
             end;
             dbgCardTemplatesXApps.Visible := False;
             dmSys1.cdsCardTemplatesxApps.Append;
//             ListaCardTemplate;
           End;

       9 : Begin
             if (dmsys.cdsApplications.fieldByName('APP_ID').IsNull) or
                (dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
             begin
               SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
               exit;
             end;

             ListaCardTypes;
             dmSys1.cdsCardTypesXApps.Insert;
             cmbCardTypesXApps.ItemIndex := 0;
             dbgCardTypesxApps.Visible := False;

           End;
       10 : Begin
              if (dmsys.cdsApplications.fieldByName('APP_ID').IsNull) or
                 (dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
              begin
                SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
                exit;
              end;
              dbgTPXApps.Visible := False;
              dmSys1.cdsTPXApps.Edit;
              ListaTranspProv;
            End;
       11 : Begin
              if (dmsys.cdsApplications.fieldByName('APP_ID').IsNull) or
                 (dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
              begin
                SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
                exit;
              end;
              dbgUTXApps.Visible := False;
              dmSys1.cdsUserTypesXApps.Edit;
              ListaUserTypes;
            End;
       12 : Begin
              if (dmsys.cdsApplications.fieldByName('APP_ID').IsNull) or
                 (dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
              begin
                SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
                exit;
              end;
             dbgAppsxLineMt.Visible := False;
             ListaAppsXLineMt;
            End;
       13 : begin
              if (DmSys.cdsApplications.FieldByName('APP_ID').IsNull) or
                 (DmSys.cdsApplications.FieldByName('ISS_ID').IsNull) then
              begin
                SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
                DisplayMsg(t_form_objects, '%T', [3319], [], mtInformation, [mbOK]);
                exit;
              end;
              Insere_TransprovXVehTypesXApps;
            end;
   End;
end;

procedure TFrmApplications.actEditSubAppExecute(Sender: TObject);
var
  i : integer;
begin
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp, actDeleteSubApp ], False, Self, t_form_objects);

   Case pcSubApplications.ActivePageIndex of
       0 : Begin
            dbgSubApplications.Visible := False;
            DmSys.cdsSubApplications.Edit;
            SetApp;
           End;

       1 : Begin
            dbgAppsXValidatorActions.Visible := False;
            DmSys.cdsAppsXValidatorActions.Edit;
            ListaValidatorActions;
           End;

       2 : Begin
            gdbValidatorConditions.Visible := False;
            DmSys.cdsValidatorConditions.Edit;
            ListaValidatorConditions;
           End;

       3 : Begin
            dbgVisualActions.Visible := False;
            DmSys.cdsAppsXValVisualActions.Edit;
            ListaVisualActions;
           End;

       4 : Begin
            dbgValidatorStatesXApps.Visible := False;
            DmSys.cdsValidatorStatesXApps.Edit;
            ListaValStates;
           End;

       5 : Begin
             dbgStrings.Visible := False;
             dmSys.cdsApplicationStrings.Edit;
//             ListaAppStrings;
           End;

       6 : Begin
            if DmSys1.cdsApplicationVersions.RecordCount < 1 then
            begin
              SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
              exit;
            end;
            dbgVersions.Visible := False;
            DmSys1.cdsApplicationVersions.Edit;
            spnedtVersion.ReadOnly := True;
            spnedtVersion.Value := DmSys1.cdsApplicationVersions.FieldByName('APPVER_VERSIONNBR').AsInteger;
           End;

       7 : Begin
            if DmSys1.cdsCardDesignxApps.RecordCount < 1 then
            begin
              SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
              exit;
            end;
            dbgCardDesign.Visible := False;
            DmSys1.cdsCardDesignxApps.Edit;
            ListaCardDesign;
           End;

       8 : Begin
            if DmSys1.cdsCardTemplatesxApps.RecordCount < 1 then
            begin
              SetActions([actApplyUpdates, actCancel, actInsertSubApp ], True, Self, t_form_objects);
              exit;
            end;
            dbgCardTemplatesXApps.Visible := False;
            DmSys1.cdsCardTemplatesxApps.Edit;
//            ListaCardTemplate;
           End;

       9 : Begin
            if DmSys1.cdsCardTypesXApps.RecordCount < 1 then
            begin
              SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
              exit;
            end;
            ListaCardTypes;
            DmSys1.cdsCardTypesXApps.Edit;
            for i := 0 to (cmbCardTypesXApps.Items.Count - 1) do
            begin
              if dmSys1.cdsCardTypesXApps.FieldByName('CTY_ID').AsInteger = Integer(cmbCardTypesXApps.items.Objects[i]) then
                cmbCardTypesXApps.ItemIndex := i;
            end;
            dbgCardTypesxApps.Visible := False;
           End;

       10 : Begin
             if DmSys1.cdsTPXApps.RecordCount < 1 then
             begin
               SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
               exit;
             end;
             dbgTPXApps.Visible := False;
             DmSys1.cdsTPXApps.Edit;
             ListaTranspProv;
            End;

       11 : Begin
             if DmSys1.cdsUserTypesXApps.RecordCount < 1 then
             begin
               SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
               exit;
             end;
             dbgUTXApps.Visible := False;
             DmSys1.cdsUserTypesXApps.Edit;
             ListaUserTypes;
            End;
       12 : Begin
            if DmSys1.cdsApplicationsXLineMT.RecordCount < 1 then
            begin
              SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
              exit;
            end;
            dbgAppsxLineMt.Visible := False;
            ListaAppsXLineMt;
            End;
       13 : Begin
            if DmSys.cdsVehTypXApp.RecordCount < 1 then
            begin
              SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
              exit;
            end;
            End;
   End;


end;

procedure TFrmApplications.actDeleteSubAppExecute(Sender: TObject);
begin
   Case pcSubApplications.ActivePageIndex of
       0 : Begin
              DmSys.cdsSubApplications.Edit;
              DmSys.cdsSubApplications.FieldByName('SA_STATUS').AsString := 'I';
              DmSys.cdsSubApplications.FieldByName('STATUS_ID').AsString := 'I';
              DmSys.cdsSubApplications.Post;
           End;

       1 : Begin
              DmSys.cdsAppsXValidatorActions.Delete;
           End;

       2 : Begin
              DmSys.cdsValidatorConditions.Delete;
           End;

       3 : Begin
              DmSys.cdsAppsXValVisualActions.Delete;
           End;

       4 : Begin
              DmSys.cdsValidatorStatesXApps.Edit;
              DmSys.cdsValidatorStatesXApps.FieldByName('VSAPP_STATUS').AsString := 'I';
              DmSys.cdsValidatorStatesXApps.FieldByName('VSAPP_STATUS').AsString := 'I';
              DmSys.cdsValidatorStatesXApps.Post;
           End;

       5 : Begin
              DmSys.cdsApplicationStrings.Edit;
              DmSys.cdsApplicationStrings.FieldByName('APPSTR_STATUS').AsString := 'I';
              DmSys.cdsApplicationStrings.FieldByName('STATUS_ID').AsString     := 'I';
              DmSys.cdsApplicationStrings.Post;
              //dbgStrings.Refresh;
           End;

       6 : Begin
              if DmSys1.cdsApplicationVersions.RecordCount < 1 then
              begin
                exit;
              end;
              DmSys1.cdsApplicationVersions.Edit;
              DmSys1.cdsApplicationVersions.FieldByName('APPVER_STATUS').AsString := 'I';
              DmSys1.cdsApplicationVersions.FieldByName('APPVER_STATUS').AsString := 'I';
              DmSys1.cdsApplicationVersions.Post;
           End;

       7 : Begin
              if DmSys1.cdsCardDesignxApps.RecordCount < 1 then
              begin
                exit;
              end;
              DmSys1.cdsCardDesignxApps.Edit;
              DmSys1.cdsCardDesignxApps.FieldByName('CDAPP_STATUS').AsString := 'I';
              DmSys1.cdsCardDesignxApps.Post;
           End;

       8 : Begin
              if DmSys1.cdsCardTemplatesxApps.RecordCount < 1 then
              begin
                exit;
              end;
              DmSys1.cdsCardTemplatesxApps.Delete;
           End;

       9 : Begin
              if DmSys1.cdsCardTypesXApps.RecordCount < 1 then
              begin
                exit;
              end;
              DmSys1.cdsCardTypesXApps.Delete;
           End;

       10 : Begin
              if DmSys1.cdsTPXApps.RecordCount < 1 then
              begin
                exit;
              end;
              DmSys1.cdsTPXApps.Edit;
              DmSys1.cdsTPXApps.FieldByName('TPAPP_STATUS').AsString := 'I';
              DmSys1.cdsTPXApps.Post;
           End;

       11 : Begin
              if DmSys1.cdsUserTypesXApps.RecordCount < 1 then
              begin
                exit;
              end;
              DmSys1.cdsUserTypesXApps.Delete;
           End;
       12 : Begin
              if DmSys1.cdsApplicationsXLineMT.RecordCount < 1 then
              begin
                exit;
              end;
              DmSys1.cdsApplicationsXLineMT.Delete;
           End;
       13 : begin
              if DmSys.cdsTransprovXVehTypesXApps.RecordCount < 1 then
                exit
              else
                DmSys.cdsTransprovXVehTypesXApps.Delete;
            end;

   End;
end;

procedure TFrmApplications.dbAppChange(Sender: TObject);
begin
  If Status <> stConsult Then
  if (Not dmsys.cdsApplications.fieldByName('APP_ID').IsNull) And
     (Not dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
     SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp], true, FrmApplications, t_form_objects);
end;

procedure TFrmApplications.dbIssuersChange(Sender: TObject);
begin
  If Status <> stConsult Then
  if (Not dmsys.cdsApplications.fieldByName('APP_ID').IsNull) And
     (Not dmsys.cdsApplications.fieldByName('ISS_ID').IsNull) Then
     SetActions([actApplyUpdates, actCancel, actInsertSubApp], true, FrmApplications, t_form_objects);

end;

procedure TFrmApplications.FormCreate(Sender: TObject);
begin
  inherited;
  TabSheet1.TabVisible := False;
  dtsMaster.DataSet := DmSys.cdsApplications;

  ChangeCdsOrigAppLook( False );

end;

procedure TFrmApplications.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '2';
  FrmSystemLog.pSLG_ID := DmSys.cdsApplications.FieldByName('APP_ID').AsString + '|' +
                          DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TFrmApplications.actOkVersionExecute(Sender: TObject);
begin
  inherited;

  if DmSys1.cdsApplicationVersions.State = dsInsert then
  begin
    DmSys1.cdsApplicationVersionSeq.Params.ParamByName('version').AsString := spnedtVersion.Text;
    DmSys1.cdsApplicationVersionSeq.Params.ParamByName('iss').AsString     := DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
    DmSys1.cdsApplicationVersionSeq.Params.ParamByName('app').AsString     := DmSys.cdsApplications.FieldByName('APP_ID').AsString;
    DmSys1.cdsApplicationVersionSeq.Open;
    if not DmSys1.cdsApplicationVersionSeq.Eof then
    begin
      DisplayMsg(t_form_objects, '%T', [3259], [], mtInformation, [mbOK]);
      DmSys1.cdsApplicationVersionSeq.Close;
      exit;
    end;
    DmSys1.cdsApplicationVersionSeq.Close;
    DmSys1.cdsApplicationVersions.FieldByName('APPVER_VERSIONNBR').AsInteger := spnedtVersion.AsInteger;
  end;

  SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
  dbgVersions.Visible := True;
  dmSys1.cdsApplicationVersions.Post;

end;

procedure TFrmApplications.actCancelVersionExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
  dbgVersions.Visible := True;
  dmSys1.cdsApplicationVersions.Cancel;
end;

procedure TFrmApplications.ListaCardDesign;
begin
  With dmSys do
    Begin
     lstSelecCardDesign.Clear;
     lstDispCardDesign.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT CD_ID, CD_DESC FROM CARDDESIGN  ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF DmSys1.cdsCardDesignXApps.Locate('CD_ID', cdsGeral.fieldByName('CD_ID').AsString, [] )
               Then lstSelecCardDesign.Items.AddObject(cdsGeral.fieldByName('CD_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('CD_ID').AsInteger))
               Else lstDispCardDesign.Items.AddObject(cdsGeral.fieldByName('CD_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('CD_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
end;

procedure TFrmApplications.actAddAllCardDesignExecute(Sender: TObject);
begin
  inherited;
  lstDispCardDesign.SelectAll;
  lstDispCardDesign.MoveSelection(lstSelecCardDesign);
end;

procedure TFrmApplications.actAddOneCardDesignExecute(Sender: TObject);
begin
  inherited;
  lstDispCardDesign.MoveSelection(lstSelecCardDesign);
end;

procedure TFrmApplications.actDelAllCardDesignExecute(Sender: TObject);
begin
  inherited;
  lstSelecCardDesign.SelectAll;
  lstSelecCardDesign.MoveSelection(lstDispCardDesign);
end;

procedure TFrmApplications.actDelOneCardDesignExecute(Sender: TObject);
begin
  inherited;
  lstSelecCardDesign.MoveSelection(lstDispCardDesign);
end;

procedure TFrmApplications.actCardDesignOKExecute(Sender: TObject);
var
  I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}

   dmSys1.cdsCardDesignxApps.First;

   While NOT dmSys1.cdsCardDesignxApps.Eof do
      Begin
        dmSys1.cdsCardDesignxApps.Delete;
      End;

   For I := 0 to lstSelecCardDesign.Count - 1 do
      Begin
         dmSys1.cdsCardDesignxApps.Append;
         dmSys1.cdsCardDesignxApps.FieldByName('CD_ID').AsInteger  := Integer(lstSelecCardDesign.items.Objects[I]);
         dmSys1.cdsCardDesignxApps.FieldByName('APP_ID').AsInteger := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
         dmSys1.cdsCardDesignxApps.FieldByName('ISS_ID').AsInteger := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
         dmSys1.cdsCardDesignxApps.FieldByName('CD_DESC').AsString := lstSelecCardDesign.Items.Strings[I];
         dmSys1.cdsCardDesignxApps.Post;
      End;

   dbgCardDesign.Visible := True;

end;

procedure TFrmApplications.actCardDesignCancelExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

   dbgCardDesign.Visible := True;
   dmSys1.cdsCardDesignxApps.Cancel;
end;

procedure TFrmApplications.actCTXApplicationsOKExecute(Sender: TObject);
begin
  inherited;
   if RxDBLookupCombo2.Text = '' then
   begin
      DisplayMsg(t_form_objects, 'É necessário selecionar um Template de Cartão!   ', [], []);
      RxDBLookupCombo2.SetFocus;
      exit;
   end;
   if rdbDateStatus.Text = '' then
   begin
      DisplayMsg(t_form_objects, 'É necessário selecionar uma opção!   ', [], []);
      rdbDateStatus.SetFocus;
      exit;
   end;

   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp, actDeleteSubApp ], True, Self, t_form_objects);
   dmSys1.cdsCardTemplatesxApps.FieldByName('ISS_ID').AsString := DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
   dmSys1.cdsCardTemplatesxApps.FieldByName('APP_ID').AsString := DmSys.cdsApplications.FieldByName('APP_ID').AsString;
//   dmSys1.cdsCardTemplatesxApps.FieldByName('ISS_DESCLONG').AsString := DmSys.cdsApplications.FieldByName('APP_ID').AsString;
//   dmSys1.cdsCardTemplatesxApps.FieldByName('APP_DESCSHORT').AsString := [];

   dmSys1.cdsCardTemplatesxApps.FieldByName('LM_DESC').AsString  := '';
   dmSys1.cdsCardTemplatesxApps.FieldByName('TG_DESC').AsString  := '';
   dmSys1.cdsCardTemplatesxApps.FieldByName('LG_DESC').AsString  := '';
   dmSys1.cdsCardTemplatesxApps.FieldByName('PUT_DESC').AsString := '';
   dmSys1.cdsCardTemplatesxApps.FieldByName('VP_DESC').AsString  := '';
   dmSys1.cdsCardTemplatesxApps.FieldByName('VT_DESC').AsString  := '';


   dmSys1.cdsCardTemplatesxApps.FieldByName('CTE_DESC').AsString := DmSys.cdsCardTemplates.FieldByName('CTE_DESC').AsString;
   if dmSys1.cdsCardTemplatesxApps.FieldByName('LM_ID').AsString <> '' then
     dmSys1.cdsCardTemplatesxApps.FieldByName('LM_DESC').AsString  := DmSys.cdsLineMT.FieldByName('LM_DESC').AsString;
   if dmSys1.cdsCardTemplatesxApps.FieldByName('TG_ID').AsString <> '' then
     dmSys1.cdsCardTemplatesxApps.FieldByName('TG_DESC').AsString  := DmSys.cdsTimeGroups.FieldByName('TG_DESC').AsString;
   if dmSys1.cdsCardTemplatesxApps.FieldByName('LG_ID').AsString <> '' then
     dmSys1.cdsCardTemplatesxApps.FieldByName('LG_DESC').AsString  := DmSys.cdsLineGroups.FieldByName('LG_DESC').AsString;
   if dmSys1.cdsCardTemplatesxApps.FieldByName('PUT_ID').AsString <> '' then
     dmSys1.cdsCardTemplatesxApps.FieldByName('PUT_DESC').AsString := DmSys1.cdsPeriodUseTypesLk.FieldByName('PUT_DESC').AsString;
   if dmSys1.cdsCardTemplatesxApps.FieldByName('VP_ID').AsString <> '' then
     dmSys1.cdsCardTemplatesxApps.FieldByName('VP_DESC').AsString  := DmSys1.cdsValidationPeriods.FieldByName('VP_DESC').AsString;
   if dmSys1.cdsCardTemplatesxApps.FieldByName('VT_ID').AsString <> '' then
     dmSys1.cdsCardTemplatesxApps.FieldByName('VT_DESC').AsString  := DmSys1.cdsValidityTypes.FieldByName('VT_DESC').AsString;
   dmSys1.cdsCardTemplatesxApps.FieldByName('DS_DESC').AsString  := DmSys1.cdsDateStatus.FieldByName('DS_DESC').AsString;

   dmSys1.cdsCardTemplatesxApps.Post;
   dbgCardTemplatesXApps.Visible := True;
   dbgCardTemplatesXApps.Refresh;

end;

procedure TFrmApplications.actCTXApplicationsCancelExecute(
  Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
   if dmSys1.cdsCardTemplatesxApps.RecordCount > 0 then
     SetActions([actDeleteSubApp, actEditSubApp ], True, Self, t_form_objects);

   dmSys1.cdsCardTemplatesxApps.Cancel;
   dbgCardTemplatesXApps.Visible := True;
   dbgCardTemplatesXApps.Refresh;
end;


procedure TFrmApplications.actOkCardTypesXAppsExecute(Sender: TObject);
begin
  inherited;
  With DmSys, DmSys1 do
   Begin
     If Trim(dbMastersecidmin.Text) = '' Then
        Begin
          DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
          dbMastersecidmin.SetFocus;
          Exit;
        End
     Else
     If Trim(dbMastersecidmax.Text) = '' Then
        Begin
          DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
          dbMastersecidmax.SetFocus;
          Exit;
        End
     Else
     If Trim(db_CTYAPP_REPEATQTY.Text) = '' Then
        Begin
          DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
          db_CTYAPP_REPEATQTY.SetFocus;
          Exit;
        End;

     if cdsCardTypesXApps.State <> dsEdit then
     begin
       cdsGeral.Close;
       cdsGeral.CommandText := 'SELECT CTY_ID FROM CARDTYPESXAPPLICATIONS WHERE CTY_ID = '+IntToStr(Integer(cmbCardTypesXApps.items.Objects[cmbCardTypesXApps.ItemIndex]))+' AND APP_ID = '+dmSys.cdsApplications.FieldByName('APP_ID').AsString+' AND ISS_ID = '+dmSYs.cdsApplications.FieldByName('ISS_ID').AsString;
       cdsGeral.Open;
       if not cdsGeral.Eof then
       begin
         DisplayMsg(t_form_objects, '%T', [3320], []);
         Exit;
       end;
     end;

     SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp, actDeleteSubApp], True, Self, t_form_objects);
     SetCategories([Applications], True, Self, t_form_objects);

     cdsCardTypesXApps.FieldByName('APP_ID').AsString   := cdsApplications.fieldByName('APP_ID').AsString;
     cdsCardTypesXApps.FieldByName('ISS_ID').AsString   := cdsApplications.fieldByName('ISS_ID').AsString;
     cdsCardTypesXApps.FieldByName('CTY_ID').AsInteger  := Integer(cmbCardTypesXApps.items.Objects[cmbCardTypesXApps.ItemIndex]);
     cdsCardTypesXApps.FieldByName('CTY_DESC').AsString := cmbCardTypesXApps.Text;


     cdsCardTypesXApps.Post;
     dbgCardTypesxApps.Visible   := True;
  End;
end;

procedure TFrmApplications.actCancelCardTypesxAppsExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
  DmSys1.cdsCardTypesXApps.Cancel;
  dbgCardTypesxApps.Visible := True;

end;

procedure TFrmApplications.ListaCardTypes;
begin
  With dmSys do
    Begin
      cmbCardTypesXApps.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT CTY_ID, CTY_DESC FROM CARDTYPES ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              cmbCardTypesXApps.Items.AddObject(cdsGeral.fieldByName('CTY_DESC').AsString,
                                        TObject(cdsGeral.fieldByName('CTY_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
end;

procedure TFrmApplications.OpenChildrens;
begin
    dmSys1.cdsCardDesignxApps.Close;
    dmSys1.cdsCardDesignxApps.CommandText := 'SELECT CD.CD_DESC, CDXA.* FROM CARDDESIGNXAPPLICATIONS CDXA LEFT JOIN CARDDESIGN CD ON CD.CD_ID = CDXA.CD_ID WHERE CDXA.APP_ID = '+DmSys.cdsApplications.FieldByName('APP_ID').AsString+' AND CDXA.ISS_ID = '+DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
    dmSys1.cdsCardDesignxApps.Open;

    dmSys1.cdsCardTemplatesxApps.Close;
    dmSys1.cdsCardTemplatesxApps.CommandText := 'SELECT CTE.CTE_DESC, PUT.PUT_DESC, TG.TG_DESC, VP.VP_DESC, LG.LG_DESC, LM.LM_DESC, VT.VT_DESC, DS.DS_DESC, CTA.CTA_VALDATEQTY, CTA.ISS_ID, CTA.APP_ID, CTA.CTE_ID, CTA.PUT_ID, CTA.TG_ID, CTA.VP_ID, CTA.LG_ID, CTA.LM_ID, CTA.VT_ID, CTA.DS_ID ';
    dmSys1.cdsCardTemplatesxApps.CommandText := dmSys1.cdsCardTemplatesxApps.CommandText + 'FROM CARDTEMPLATESXAPPLICATIONS CTA LEFT JOIN CARDTEMPLATES CTE    ON CTE.CTE_ID = CTA.CTE_ID LEFT JOIN PERIODUSETYPES PUT   ON PUT.PUT_ID = CTA.PUT_ID LEFT JOIN TIMEGROUPS TG        ON TG.TG_ID ';
    dmSys1.cdsCardTemplatesxApps.CommandText := dmSys1.cdsCardTemplatesxApps.CommandText + ' = CTA.TG_ID LEFT JOIN VALIDATIONPERIODS VP ON VP.VP_ID   = CTA.VP_ID LEFT JOIN LINEGROUPS LG        ON LG.LG_ID   = CTA.LG_ID LEFT JOIN LINEMT LM            ON LM.LM_ID   = CTA.LM_ID LEFT JOIN ';
    dmSys1.cdsCardTemplatesxApps.CommandText := dmSys1.cdsCardTemplatesxApps.CommandText + 'VALIDITYTYPES VT     ON VT.VT_ID   = CTA.VT_ID LEFT JOIN DATESTATUS DS        ON DS.DS_ID   = CTA.DS_ID WHERE CTA.APP_ID = ' + DmSys.cdsApplications.FieldByName('APP_ID').AsString+' AND CTA.ISS_ID = '+DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
    dmSys1.cdsCardTemplatesxApps.Open;

    dmSys1.cdsCardTypesXApps.Close;
    dmSys1.cdsCardTypesXApps.CommandText := 'SELECT CTY.CTY_DESC,CTYAPP.* FROM CARDTYPESXAPPLICATIONS CTYAPP LEFT JOIN CARDTYPES CTY ON CTY.CTY_ID = CTYAPP.CTY_ID WHERE CTYAPP.APP_ID = '+DmSys.cdsApplications.FieldByName('APP_ID').AsString+' AND CTYAPP.ISS_ID = '+DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
    dmSys1.cdsCardTypesXApps.Open;

    dmSys1.cdsTPXApps.Close;
    dmSys1.cdsTPXApps.CommandText := 'SELECT TP.TP_DESC, TPA.* FROM TRANSPORTPROVIDERSXAPPS TPA LEFT JOIN TRANSPORTPROVIDERS TP ON TP.TP_ID = TPA.TP_ID WHERE TPA.APP_ID = '+DmSys.cdsApplications.FieldByName('APP_ID').AsString+' AND TPA.ISS_ID = '+DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
    dmSys1.cdsTPXApps.Open;

    dmSys1.cdsUserTypesXApps.Close;
    dmSys1.cdsUserTypesXApps.CommandText := 'SELECT UT.UT_DESC, UTA.* FROM USERTYPESXAPPLICATIONS UTA LEFT JOIN USERTYPES UT ON UT.UT_ID = UTA.UT_ID WHERE UTA.APP_ID = '+DmSys.cdsApplications.FieldByName('APP_ID').AsString+' AND UTA.ISS_ID = '+DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
    dmSys1.cdsUserTypesXApps.Open;
end;

procedure TFrmApplications.dbAppExit(Sender: TObject);
begin
  inherited;
  if (DmSys.cdsApplications.State = dsInsert) and (DmSys.cdsApplications.FieldByName('APP_ID').AsString <> '') and (DmSys.cdsApplications.FieldByName('ISS_ID').AsString <> '') then
    OpenChildrens;
end;

procedure TFrmApplications.actAddAllTPXAppsExecute(Sender: TObject);
begin
  inherited;
  lstDispTPXApps.SelectAll;
  lstDispTPXApps.MoveSelection(lstSelecTPXApps);

end;

procedure TFrmApplications.actAddOneTPXAppsExecute(Sender: TObject);
begin
  inherited;
  lstDispTPXApps.MoveSelection(lstSelecTPXApps);
end;

procedure TFrmApplications.actDelAllTPXAppsExecute(Sender: TObject);
begin
  inherited;
  lstSelecTPXApps.SelectAll;
  lstSelecTPXApps.MoveSelection(lstDispTPXApps);
end;

procedure TFrmApplications.actDelOneTPXAppsExecute(Sender: TObject);
begin
  inherited;
  lstSelecTPXApps.MoveSelection(lstDispTPXApps);
end;

procedure TFrmApplications.actTPXAppsOkExecute(Sender: TObject);
var
  I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}

   dmSys1.cdsTPXApps.First;

   While NOT dmSys1.cdsTPXApps.Eof do
      Begin
        dmSys1.cdsTPXApps.Delete;
      End;

   For I := 0 to lstSelecTPXApps.Count - 1 do
      Begin
         dmSys1.cdsTPXApps.Append;
         dmSys1.cdsTPXApps.FieldByName('TP_ID').AsInteger  := Integer(lstSelecTPXApps.items.Objects[I]);
         dmSys1.cdsTPXApps.FieldByName('APP_ID').AsInteger  := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
         dmSys1.cdsTPXApps.FieldByName('ISS_ID').AsInteger  := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
         dmSys1.cdsTPXApps.FieldByName('TP_DESC').AsString := lstSelecTPXApps.Items.Strings[I];
         dmSys1.cdsTPXApps.Post;
      End;

   dbgTPXApps.Visible := True;


end;

procedure TFrmApplications.ListaTranspProv;
begin
  With dmSys do
    Begin
     lstSelecTPXApps.Clear;
     lstDispTPXApps.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT TP_ID, TP_DESC FROM TRANSPORTPROVIDERS  ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF DmSys1.cdsTPXApps.Locate('TP_ID', cdsGeral.fieldByName('TP_ID').AsString, [] )
               Then lstSelecTPXApps.Items.AddObject(cdsGeral.fieldByName('TP_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('TP_ID').AsInteger))
               Else lstDispTPXApps.Items.AddObject(cdsGeral.fieldByName('TP_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('TP_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
end;

procedure TFrmApplications.actTPXAppsCancelExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

  dbgTPXApps.Visible := True;
  dmSys1.cdsTPXApps.Cancel;
end;

procedure TFrmApplications.actAddAllUTXAppsExecute(Sender: TObject);
begin
  inherited;
  lstDispUTXApps.SelectAll;
  lstDispUTXApps.MoveSelection(lstSelecUTXApps);
end;

procedure TFrmApplications.actAddOneUTXAppsExecute(Sender: TObject);
begin
  inherited;
  lstDispUTXApps.MoveSelection(lstSelecUTXApps);
end;

procedure TFrmApplications.actDelAllUTXAppsExecute(Sender: TObject);
begin
  inherited;
  lstSelecUTXApps.SelectAll;
  lstSelecUTXApps.MoveSelection(lstDispUTXApps);
end;

procedure TFrmApplications.actDelOneUTXAppsExecute(Sender: TObject);
begin
  inherited;
  lstSelecUTXApps.MoveSelection(lstDispUTXApps);
end;

procedure TFrmApplications.actUTXAppsOKExecute(Sender: TObject);
var
  I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

{   tbtnApply.Enabled  := True;
   tbtnCancel.Enabled := True;
   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
}

   dmSys1.cdsUserTypesXApps.First;

   While NOT dmSys1.cdsUserTypesXApps.Eof do
      Begin
        dmSys1.cdsUserTypesXApps.Delete;
      End;

   For I := 0 to lstSelecUTXApps.Count - 1 do
      Begin
         dmSys1.cdsUserTypesXApps.Append;
         dmSys1.cdsUserTypesXApps.FieldByName('UT_ID').AsInteger  := Integer(lstSelecUTXApps.items.Objects[I]);
         dmSys1.cdsUserTypesXApps.FieldByName('APP_ID').AsInteger  := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
         dmSys1.cdsUserTypesXApps.FieldByName('ISS_ID').AsInteger  := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
         dmSys1.cdsUserTypesXApps.FieldByName('UT_DESC').AsString := lstSelecUTXApps.Items.Strings[I];
         dmSys1.cdsUserTypesXApps.Post;
      End;

   dbgUTXApps.Visible := True;
end;

procedure TFrmApplications.actUTXAppsCancelExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

  dbgUTXApps.Visible := True;
  dmSys1.cdsUserTypesXApps.Cancel;
end;

procedure TFrmApplications.ListaUserTypes;
begin
  With dmSys do
    Begin
     lstSelecUTXApps.Clear;
     lstDispUTXApps.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT UT_ID, UT_DESC FROM USERTYPES  ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF DmSys1.cdsUserTypesXApps.Locate('UT_ID', cdsGeral.fieldByName('UT_ID').AsString, [] )
               Then lstSelecUTXApps.Items.AddObject(cdsGeral.fieldByName('UT_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('UT_ID').AsInteger))
               Else lstDispUTXApps.Items.AddObject(cdsGeral.fieldByName('UT_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('UT_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;

end;

procedure TFrmApplications.ListaVehicleTypes;
begin
{ Igor With dmSys do
  Begin
   lstSeleVehTypXApp.Clear;
   lstDisVehTypXApp.Clear;

   cdsGeral.Close;
   cdsGeral.CommandText := 'SELECT VEHT_ID, VEHT_DESC FROM VEHICLETYPES  ';
   cdsGeral.Open;
   While NOT cdsGeral.Eof do
   Begin
    IF DmSys.cdsVehicleTypes.Locate('VEHT_ID', cdsGeral.FieldByName('VEHT_ID').AsString, []) Then
    begin
      lstSeleVehTypXApp.Items.AddObject(cdsGeral.fieldByName('VEHT_DESC').AsString,
              TObject(cdsGeral.fieldByName('VEHT_ID').AsInteger));
    end
    else
    begin
      lstDisVehTypXApp.Items.AddObject(cdsGeral.fieldByName('VEHT_DESC').AsString,
              TObject(cdsGeral.fieldByName('VEHT_ID').AsInteger));
      cdsGeral.Next;
    end;
   End;
  End;}
end;

procedure TFrmApplications.actOKStringsExecute(Sender: TObject);
var
  sSEQ_NBR : String;
begin
  inherited;
  with dmSys do
  begin
    if Length(DBEdit4.Text) <> 32 then
    begin
      DisplayMsg(t_form_objects, 'String inválida! O comprimento deve ser 32 caracteres!   ', [], []);
      DBEdit4.SetFocus;
      exit;
    end;
    if Length(DBEdit5.Text) < 1 then
    begin
      DisplayMsg(t_form_objects, 'Prioridade inválida!   ', [], []);
      DBEdit5.SetFocus;
      exit;
    end;

    if cdsApplicationStrings.State = dsInsert then
    begin
      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT MAX(APPSTR_SEQNBR)+1 AS NOV_COD FROM APPLICATIONSTRINGS WHERE ISS_ID = '+DmSys.cdsApplications.FieldByName('ISS_ID').AsString+' AND APP_ID = '+DmSys.cdsApplications.FieldByName('APP_ID').AsString;
      cdsGeral.Open;
      if not (cdsGeral.FieldByName('NOV_COD').AsString = '') then
        sSEQ_NBR := cdsGeral.FieldByName('NOV_COD').AsString
      else
        sSEQ_NBR := '1';

      cdsGeral.Close;
      cdsApplicationStrings.FieldByName('APPSTR_SEQNBR').AsString := sSEQ_NBR;
      cdsApplicationStrings.FieldByName('ISS_ID').AsString := DmSys.cdsApplications.FieldByName('ISS_ID').AsString;
      cdsApplicationStrings.FieldByName('APP_ID').AsString := DmSys.cdsApplications.FieldByName('APP_ID').AsString;
    end;
    cdsApplicationStrings.FieldByName('APPSTR_REGDATE').AsDateTime := Date;
    cdsApplicationStrings.FieldByName('APPSTR_REGUSER').AsString := FrmSparkSysMain.stMain.Panels[4].Text;
    cdsApplicationStrings.FieldByName('STATUS_ID').AsString := RxDBComboBox2.Text;
     if cdsApplicationStrings.FieldByName('APPSTR_STATUS').AsString = '' then
      cdsApplicationStrings.FieldByName('APPSTR_STATUS').AsString := 'A';
    if cdsApplicationStrings.FieldByName('APPSTR_PRIORITY').AsString = '' then
      cdsApplicationStrings.FieldByName('APPSTR_PRIORITY').AsString := DBEdit5.Text;

    if dtsMaster.DataSet.State in [dsInsert, dsEdit] then
       dtsMaster.DataSet.FieldByName('APP_STRING').AsString := DBEdit4.Text;
    cdsApplicationStrings.Post;
    SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
    if DmSys.cdsApplicationStrings.RecordCount > 0 then
       SetActions([actDeleteSubApp, actEditSubApp ], True, Self, t_form_objects);

    dbgStrings.Visible := True;
    dbgStrings.Refresh;
  end;
end;

procedure TFrmApplications.actCancelStringsExecute(Sender: TObject);
begin
  inherited;
  dmSys.cdsApplicationStrings.Cancel;
  SetActions([actApplyUpdates, actCancel, actInsertSubApp], True, Self, t_form_objects);
  if DmSys.cdsApplicationStrings.RecordCount > 0 then
     SetActions([actDeleteSubApp, actEditSubApp ], True, Self, t_form_objects);

  dbgStrings.Visible := True;
  dbgStrings.Refresh;
end;

procedure TFrmApplications.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in [#8,'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','a','b','c','d','e','f']) then
    Key := #0;

end;

procedure TFrmApplications.edtFareGracePeriodKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not (Key in [#8,'0','1','2','3','4','5','6','7','8','9']) then
    Key := #0;
end;

procedure TFrmApplications.actAppxLineMTOkExecute(Sender: TObject);
var
  I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

   dmSys1.cdsApplicationsXLineMT.First;

   While NOT dmSys1.cdsApplicationsXLineMT.Eof do
      Begin
        dmSys1.cdsApplicationsXLineMT.Delete;
      End;

   For I := 0 to lstSelecAppxLineMT.Count - 1 do
      Begin
         dmSys1.cdsApplicationsXLineMT.Append;
         dmSys1.cdsApplicationsXLineMT.FieldByName('LM_ID').AsInteger  := Integer(lstSelecAppxLineMT.items.Objects[I]);
         dmSys1.cdsApplicationsXLineMT.FieldByName('APP_ID').AsInteger := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
         dmSys1.cdsApplicationsXLineMT.FieldByName('ISS_ID').AsInteger := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
         dmSys1.cdsApplicationsXLineMT.FieldByName('LM_DESC').AsString := lstSelecAppxLineMT.Items.Strings[I];
         dmSys1.cdsApplicationsXLineMT.Post;
      End;

   dbgAppsxLineMt.Visible := True;

end;

procedure TFrmApplications.actAppxLineMTCancelExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);

   dbgAppsxLineMt.Visible := True;
   dmSys1.cdsApplicationsXLineMT.Cancel;
end;

procedure TFrmApplications.ListaAppsXLineMt;
begin
  With dmSys do
    Begin
     lstSelecAppxLineMT.Clear;
     lstDispAppxLineMT.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT LM_ID, LM_DESC FROM LINEMT  ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF DmSys1.cdsApplicationsXLineMT.Locate('LM_ID', cdsGeral.fieldByName('LM_ID').AsString, [] )
               Then lstSelecAppxLineMT.Items.AddObject(cdsGeral.fieldByName('LM_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('LM_ID').AsInteger))
               Else lstDispAppxLineMT.Items.AddObject(cdsGeral.fieldByName('LM_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('LM_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
end;

procedure TFrmApplications.actAddAllAppxLineMTExecute(Sender: TObject);
begin
  inherited;
  lstDispAppxLineMT.SelectAll;
  lstDispAppxLineMT.MoveSelection(lstSelecAppxLineMT);
end;

procedure TFrmApplications.actAddOneAppxLineMTExecute(Sender: TObject);
begin
  inherited;
  lstDispAppxLineMT.MoveSelection(lstSelecAppxLineMT);
end;

procedure TFrmApplications.actDelAllAppxLineMTExecute(Sender: TObject);
begin
  inherited;
  lstSelecAppxLineMT.SelectAll;
  lstSelecAppxLineMT.MoveSelection(lstDispAppxLineMT);
end;

procedure TFrmApplications.actDelOneAppxLineMTExecute(Sender: TObject);
begin
  inherited;
  lstSelecAppxLineMT.MoveSelection(lstDispAppxLineMT);
end;

procedure TFrmApplications.ChangeCdsOrigAppLook(OnlyActive: Boolean);
// Procedure criada para alterar o CdsOrigAppLook.
// Em status de visualização todas as aplicações devem aparecer para serem encontradas no lookup.
// Em Inserção/Edição apenas as aplicações ativas devem aparecer para serem selecionadas.
Var
   sSQLOrigAppLook: String;
begin

  if dmConexao.tipo_servidor = 'SQLServer' then
    sSQLOrigAppLook := 'select convert(int,convert(varchar,APP.APP_ID) + convert(varchar,APP.ISS_ID)) as APP_ISS_ID,' + #13
                      +'    APP.*,' + #13
                      +'    ISS.ISS_DESCLONG,' + #13
                      +'    ISS.ISS_DESCSHORT' + #13
                      +'from APPLICATIONS APP' + #13
                      +'left join ISSUERS ISS on (ISS.ISS_ID =  APP.ISS_ID)' + #13
                      +'where APP_STATUS '
  else
    sSQLOrigAppLook := 'select to_number(to_char(APP.APP_ID)||to_char(APP.ISS_ID)) as APP_ISS_ID,' + #13
                      +'    APP.*,' + #13
                      +'    ISS.ISS_DESCLONG,' + #13
                      +'    ISS.ISS_DESCSHORT' + #13
                      +'from APPLICATIONS APP' + #13
                      +'left join ISSUERS ISS on (ISS.ISS_ID =  APP.ISS_ID)' + #13
                      +'where APP_STATUS ';

   DmSys.cdsOrigAppLook.Close;

   If OnlyActive Then
      DmSys.cdsOrigAppLook.CommandText := sSQLOrigAppLook + ' = ''A'' '
   Else
      DmSys.cdsOrigAppLook.CommandText := sSQLOrigAppLook + ' IN ( ''A'', ''I'' )';

   DmSys.cdsOrigAppLook.Open;
end;

procedure TFrmApplications.sbtnFareRuleBottomClick(Sender: TObject);
begin
  inherited;
  if dbedtFareRule.Text = '34' then
    dbedtFareRule.Text := '33'
  else if dbedtFareRule.Text = '33' then
    dbedtFareRule.Text := '32'
  else if dbedtFareRule.Text = '32' then
    dbedtFareRule.Text := '18'
  else if dbedtFareRule.Text = '18' then
    dbedtFareRule.Text := '17'
  else if dbedtFareRule.Text = '17' then
    dbedtFareRule.Text := '16'
  else if dbedtFareRule.Text = '16' then
    dbedtFareRule.Text := '2'
  else if dbedtFareRule.Text = '2' then
    dbedtFareRule.Text := '1'
  else if dbedtFareRule.Text = '1' then
    dbedtFareRule.Text := '0';
end;

procedure TFrmApplications.sbtnFareRuleTopClick(Sender: TObject);
begin
  inherited;
  if dbedtFareRule.Text = '33' then
    dbedtFareRule.Text := '34'
  else if dbedtFareRule.Text = '32' then
    dbedtFareRule.Text := '33'
  else if dbedtFareRule.Text = '18' then
    dbedtFareRule.Text := '32'
  else if dbedtFareRule.Text = '17' then
    dbedtFareRule.Text := '18'
  else if dbedtFareRule.Text = '16' then
    dbedtFareRule.Text := '17'
  else if dbedtFareRule.Text = '2' then
    dbedtFareRule.Text := '16'
  else if dbedtFareRule.Text = '1' then
    dbedtFareRule.Text := '2'
  else if dbedtFareRule.Text = '0' then
    dbedtFareRule.Text := '1';
end;

procedure TFrmApplications.Insere_TransprovXVehTypesXApps;
var
  dlg_Ins_TransprovXVehTypesXApps: Tdlg_Ins_TransprovXVehTypesXApps;
  VEHT_ID, TP_ID: Integer;
  VEHT_DESC, TP_DESC: string;
begin
  dlg_Ins_TransprovXVehTypesXApps := Tdlg_Ins_TransprovXVehTypesXApps.Create(Self);
  dlg_Ins_TransprovXVehTypesXApps.ShowModal;
  if dlg_Ins_TransprovXVehTypesXApps.ModalResult = mrOk then
  begin
    SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
    VEHT_ID   := Integer(dlg_Ins_TransprovXVehTypesXApps.cb_tipos_veiculos.Items.Objects[dlg_Ins_TransprovXVehTypesXApps.cb_tipos_veiculos.ItemIndex]);
    TP_ID     := Integer(dlg_Ins_TransprovXVehTypesXApps.cb_empresas.Items.Objects[dlg_Ins_TransprovXVehTypesXApps.cb_empresas.ItemIndex]);
    VEHT_DESC := dlg_Ins_TransprovXVehTypesXApps.cb_tipos_veiculos.Items.Strings[dlg_Ins_TransprovXVehTypesXApps.cb_tipos_veiculos.ItemIndex];
    TP_DESC   := dlg_Ins_TransprovXVehTypesXApps.cb_empresas.Items.Strings[dlg_Ins_TransprovXVehTypesXApps.cb_empresas.ItemIndex];
    with DmSys do
    begin
      DmSys.cdsVehTypXApp.First;
      if not DmSys.cdsVehTypXApp.Locate('APP_ID;ISS_ID;VEHT_ID',VarArrayOf([
              dmSys.cdsApplications.FieldByName('APP_ID').AsString,
              dmSys.cdsApplications.FieldByName('ISS_ID').AsString,
              IntToStr(VEHT_ID)]), []) then
      begin
        cdsVehTypXApp.Insert;
        cdsVehTypXApp.FieldByName('VEHT_ID').AsInteger := VEHT_ID;
        cdsVehTypXApp.FieldByName('APP_ID').AsInteger  := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
        cdsVehTypXApp.FieldByName('ISS_ID').AsInteger  := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
        cdsVehTypXApp.Post;
      end;
      cdsTransprovXVehTypesXApps.Insert;
      cdsTransprovXVehTypesXApps.FieldByName('VEHT_ID').AsInteger  := VEHT_ID;
      cdsTransprovXVehTypesXApps.FieldByName('TP_ID').AsInteger    := TP_ID;
      cdsTransprovXVehTypesXApps.FieldByName('APP_ID').AsInteger   := DmSys.cdsApplications.FieldByName('APP_ID').AsInteger;
      cdsTransprovXVehTypesXApps.FieldByName('ISS_ID').AsInteger   := DmSys.cdsApplications.FieldByName('ISS_ID').AsInteger;
      cdsTransprovXVehTypesXApps.FieldByName('VEHT_DESC').AsString := VEHT_DESC;
      cdsTransprovXVehTypesXApps.FieldByName('TP_DESC').AsString   := TP_DESC;
      cdsTransprovXVehTypesXApps.Post;
    end;
  end
  else
    SetActions([actApplyUpdates, actCancel, actInsertSubApp, actEditSubApp ], True, Self, t_form_objects);
  dlg_Ins_TransprovXVehTypesXApps.Free;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmApplications.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmApplications.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmApplications.Entra(Sender: TObject);
begin FM_Entra(Sender); end;
procedure TFrmApplications.Sai(Sender: TObject);
begin FM_Sai(Sender); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmApplications.SpeedButton22Click(Sender: TObject);
begin dblkIssuer.ClearValue; dblkIssuer.Repaint; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmApplications.lbFiltradoClick(Sender: TObject);
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
procedure TFrmApplications.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
