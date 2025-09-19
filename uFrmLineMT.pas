unit uFrmLineMT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxLookup, DBClient, RxDBComb, Mask, DBCtrls,
  Buttons, ToolEdit, CurrEdit, RXDBCtrl, RXCtrls;

const
  NSecao : Integer = 30;

type
  RegLineDiscounts = record
    v_TimeSta : Integer;
    v_TimeEnd : Integer;
    v_DateSta : Integer;
    v_DateEnd : Integer;
    v_LDT_ID  : Integer;
End;

type
  TFrmLineMT = class(TFrmBaseSys)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblStatusCardUsers: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbLinhaDesc: TDBEdit;
    dbDescShort: TDBEdit;
    dbLM_VIADESC: TDBEdit;
    dbLineMtStatus: TRxDBComboBox;
    dbLT_CODE: TRxDBLookupCombo;
    dbLOC_CODE: TRxDBLookupCombo;
    Label1: TLabel;
    edtLinha: TEdit;
    lkFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    gbLines: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    edDesc: TEdit;
    Label36: TLabel;
    GroupBox1: TGroupBox;
    DBLookupListBox1: TDBLookupListBox;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actDeleteDetail: TAction;
    actOkDetail: TAction;
    actCancelDetail: TAction;
    actOkSections: TAction;
    actCancelSections: TAction;
    actNewPrice: TAction;
    actEditPrice: TAction;
    actDeletePrice: TAction;
    actOkPrice: TAction;
    actCancelPrice: TAction;
    actOkDiscount: TAction;
    actCancelDiscount: TAction;
    actNewDiscounts: TAction;
    Action2: TAction;
    Action3: TAction;
    actNewSection: TAction;
    actEditSection: TAction;
    actDeleteSection: TAction;
    GroupBox3: TGroupBox;
    nbDetalhes: TNotebook;
    DBGrid2: TDBGrid;
    cbDetails: TCoolBar;
    ToolBar1: TToolBar;
    tbNewDetalhes: TToolButton;
    tbEditDetalhes: TToolButton;
    tbDelDetalhes: TToolButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label39: TLabel;
    dbLinha: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit1: TDBEdit;
    dbTipo: TRxDBLookupCombo;
    dbStatusDetalhes: TRxDBComboBox;
    pcSecoes: TPageControl;
    TabSheet2: TTabSheet;
    cbPrices: TCoolBar;
    ToolBar3: TToolBar;
    tbnewprices: TToolButton;
    tbEditPrices: TToolButton;
    tbDeletePrices: TToolButton;
    TabSheet3: TTabSheet;
    dbDiscounts: TCoolBar;
    ToolBar4: TToolBar;
    tbNewDescontos: TToolButton;
    tbEditDescontos: TToolButton;
    tbDeleteDescontos: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    dbDate: TDBDateEdit;
    dbLkApplications: TRxDBLookupCombo;
    Label19: TLabel;
    Label9: TLabel;
    dbStatusPrice: TRxDBComboBox;
    PageControl1: TPageControl;
    plPriceOK: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    TabSheet1: TTabSheet;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    gbSec01: TGroupBox;
    dbeSecID01: TDBEdit;
    dbeSecVT01: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    gbSec02: TGroupBox;
    Label8: TLabel;
    Label11: TLabel;
    dbeSecID02: TDBEdit;
    dbeSecVT02: TDBEdit;
    gbSec03: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbeSecID03: TDBEdit;
    dbeSecVT03: TDBEdit;
    gbSec04: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    dbeSecID04: TDBEdit;
    dbeSecVT04: TDBEdit;
    gbSec05: TGroupBox;
    Label18: TLabel;
    Label20: TLabel;
    dbeSecID05: TDBEdit;
    dbeSecVT05: TDBEdit;
    gbSec06: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    dbeSecID06: TDBEdit;
    dbeSecVT06: TDBEdit;
    gbSec07: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    dbeSecID07: TDBEdit;
    dbeSecVT07: TDBEdit;
    gbSec08: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    dbeSecID08: TDBEdit;
    dbeSecVT08: TDBEdit;
    gbSec09: TGroupBox;
    Label35: TLabel;
    Label37: TLabel;
    dbeSecID09: TDBEdit;
    dbeSecVT09: TDBEdit;
    gbSec10: TGroupBox;
    Label38: TLabel;
    Label42: TLabel;
    dbeSecID10: TDBEdit;
    dbeSecVT10: TDBEdit;
    TabSheet5: TTabSheet;
    gbSec11: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    dbeSecID11: TDBEdit;
    dbeSecVT11: TDBEdit;
    gbSec12: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    dbeSecID12: TDBEdit;
    dbeSecVT12: TDBEdit;
    gbSec13: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    dbeSecID13: TDBEdit;
    dbeSecVT13: TDBEdit;
    gbSec14: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    dbeSecID14: TDBEdit;
    dbeSecVT14: TDBEdit;
    gbSec15: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    dbeSecID15: TDBEdit;
    dbeSecVT15: TDBEdit;
    gbSec20: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    dbeSecID20: TDBEdit;
    dbeSecVT20: TDBEdit;
    gbSec19: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    dbeSecID19: TDBEdit;
    dbeSecVT19: TDBEdit;
    gbSec18: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    dbeSecID18: TDBEdit;
    dbeSecVT18: TDBEdit;
    gbSec17: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    dbeSecID17: TDBEdit;
    dbeSecVT17: TDBEdit;
    gbSec16: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    dbeSecID16: TDBEdit;
    dbeSecVT16: TDBEdit;
    gbSec21: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    dbeSecID21: TDBEdit;
    dbeSecVT21: TDBEdit;
    gbSec22: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    dbeSecID22: TDBEdit;
    dbeSecVT22: TDBEdit;
    gbSec23: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    dbeSecID23: TDBEdit;
    dbeSecVT23: TDBEdit;
    gbSec24: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    dbeSecID24: TDBEdit;
    dbeSecVT24: TDBEdit;
    gbSec25: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    dbeSecID25: TDBEdit;
    dbeSecVT25: TDBEdit;
    gbSec29: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    dbeSecID29: TDBEdit;
    dbeSecVT29: TDBEdit;
    gbSec28: TGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    dbeSecID28: TDBEdit;
    dbeSecVT28: TDBEdit;
    gbSec27: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    dbeSecID27: TDBEdit;
    dbeSecVT27: TDBEdit;
    gbSec26: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    dbeSecID26: TDBEdit;
    dbeSecVT26: TDBEdit;
    gbSec30: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    dbeSecID30: TDBEdit;
    dbeSecVT30: TDBEdit;
    Panel3: TPanel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    DBDateEdit1: TDBDateEdit;
    dbLkApplicationsDiscounts: TRxDBLookupCombo;
    RxDBComboBox1: TRxDBComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label41: TLabel;
    edHHini: TCurrencyEdit;
    edHMIni: TCurrencyEdit;
    Label28: TLabel;
    Label40: TLabel;
    dbDataF: TDBDateEdit;
    Label86: TLabel;
    edHHFim: TCurrencyEdit;
    edHMFim: TCurrencyEdit;
    Label87: TLabel;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    gbDec01: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    gbDec02: TGroupBox;
    Label90: TLabel;
    Label91: TLabel;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    gbDec03: TGroupBox;
    Label92: TLabel;
    Label93: TLabel;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    gbDec04: TGroupBox;
    Label94: TLabel;
    Label95: TLabel;
    DBEdit18: TDBEdit;
    DBEdit20: TDBEdit;
    gbDec05: TGroupBox;
    Label96: TLabel;
    Label97: TLabel;
    DBEdit22: TDBEdit;
    DBEdit24: TDBEdit;
    gbDec06: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    DBEdit26: TDBEdit;
    DBEdit28: TDBEdit;
    gbDec07: TGroupBox;
    Label100: TLabel;
    Label101: TLabel;
    DBEdit30: TDBEdit;
    DBEdit32: TDBEdit;
    gbDec08: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    DBEdit34: TDBEdit;
    DBEdit36: TDBEdit;
    gbDec09: TGroupBox;
    Label104: TLabel;
    Label105: TLabel;
    DBEdit38: TDBEdit;
    DBEdit40: TDBEdit;
    gbDec10: TGroupBox;
    Label106: TLabel;
    Label107: TLabel;
    DBEdit42: TDBEdit;
    DBEdit44: TDBEdit;
    TabSheet7: TTabSheet;
    gbDec11: TGroupBox;
    Label108: TLabel;
    Label109: TLabel;
    DBEdit46: TDBEdit;
    DBEdit48: TDBEdit;
    gbDec12: TGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    DBEdit50: TDBEdit;
    DBEdit52: TDBEdit;
    gbDec13: TGroupBox;
    Label112: TLabel;
    Label113: TLabel;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    gbDec14: TGroupBox;
    Label114: TLabel;
    Label115: TLabel;
    DBEdit56: TDBEdit;
    DBEdit58: TDBEdit;
    gbDec15: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    DBEdit60: TDBEdit;
    DBEdit62: TDBEdit;
    gbDec20: TGroupBox;
    Label118: TLabel;
    Label119: TLabel;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    gbDec19: TGroupBox;
    Label120: TLabel;
    Label121: TLabel;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    gbDec18: TGroupBox;
    Label122: TLabel;
    Label123: TLabel;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    gbDec17: TGroupBox;
    Label124: TLabel;
    Label125: TLabel;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    gbDec16: TGroupBox;
    Label126: TLabel;
    Label127: TLabel;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    TabSheet8: TTabSheet;
    gbDec21: TGroupBox;
    Label128: TLabel;
    Label129: TLabel;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    gbDec22: TGroupBox;
    Label130: TLabel;
    Label131: TLabel;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    gbDec23: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    gbDec24: TGroupBox;
    Label134: TLabel;
    Label135: TLabel;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    gbDec25: TGroupBox;
    Label136: TLabel;
    Label137: TLabel;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    gbDec29: TGroupBox;
    Label138: TLabel;
    Label139: TLabel;
    DBEdit84: TDBEdit;
    DBEdit85: TDBEdit;
    gbDec28: TGroupBox;
    Label140: TLabel;
    Label141: TLabel;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    gbDec27: TGroupBox;
    Label142: TLabel;
    Label143: TLabel;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    gbDec26: TGroupBox;
    Label144: TLabel;
    Label145: TLabel;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    gbDec30: TGroupBox;
    Label146: TLabel;
    Label147: TLabel;
    DBEdit92: TDBEdit;
    DBEdit93: TDBEdit;
    plDiscountsOK: TPanel;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    Label148: TLabel;
    tabZones: TTabSheet;
    Panel4: TPanel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    dbdZoneDate: TDBDateEdit;
    dblZoneApplication: TRxDBLookupCombo;
    dbcZoneStatus: TRxDBComboBox;
    PageControl3: TPageControl;
    TabSheet9: TTabSheet;
    gbZon1: TGroupBox;
    Label152: TLabel;
    Label153: TLabel;
    dbeZoneSec1Go: TDBEdit;
    dbeZoneSec1Back: TDBEdit;
    gbZon2: TGroupBox;
    Label154: TLabel;
    Label155: TLabel;
    dbeZoneSec2Go: TDBEdit;
    dbeZoneSec2Back: TDBEdit;
    gbZon3: TGroupBox;
    Label156: TLabel;
    Label157: TLabel;
    dbeZoneSec3Go: TDBEdit;
    dbeZoneSec3Back: TDBEdit;
    gbZon4: TGroupBox;
    Label158: TLabel;
    Label159: TLabel;
    dbeZoneSec4Go: TDBEdit;
    dbeZoneSec4Back: TDBEdit;
    gbZon5: TGroupBox;
    Label160: TLabel;
    Label161: TLabel;
    dbeZoneSec5Go: TDBEdit;
    dbeZoneSec5Back: TDBEdit;
    gbZon6: TGroupBox;
    Label162: TLabel;
    Label163: TLabel;
    dbeZoneSec6Go: TDBEdit;
    dbeZoneSec6Back: TDBEdit;
    gbZon7: TGroupBox;
    Label164: TLabel;
    Label165: TLabel;
    dbeZoneSec7Go: TDBEdit;
    dbeZoneSec7Back: TDBEdit;
    gbZon8: TGroupBox;
    Label166: TLabel;
    Label167: TLabel;
    dbeZoneSec8Go: TDBEdit;
    dbeZoneSec8Back: TDBEdit;
    gbZon9: TGroupBox;
    Label168: TLabel;
    Label169: TLabel;
    dbeZoneSec9Go: TDBEdit;
    dbeZoneSec9Back: TDBEdit;
    gbZon10: TGroupBox;
    Label170: TLabel;
    Label171: TLabel;
    dbeZoneSec10Go: TDBEdit;
    dbeZoneSec10Back: TDBEdit;
    TabSheet10: TTabSheet;
    gbZon11: TGroupBox;
    Label172: TLabel;
    Label173: TLabel;
    dbeZoneSec11Go: TDBEdit;
    dbeZoneSec11Back: TDBEdit;
    gbZon12: TGroupBox;
    Label174: TLabel;
    Label175: TLabel;
    dbeZoneSec12Go: TDBEdit;
    dbeZoneSec12Back: TDBEdit;
    gbZon13: TGroupBox;
    Label176: TLabel;
    Label177: TLabel;
    dbeZoneSec13Go: TDBEdit;
    dbeZoneSec13Back: TDBEdit;
    gbZon14: TGroupBox;
    Label178: TLabel;
    Label179: TLabel;
    dbeZoneSec14Go: TDBEdit;
    dbeZoneSec14Back: TDBEdit;
    gbZon15: TGroupBox;
    Label180: TLabel;
    Label181: TLabel;
    dbeZoneSec15Go: TDBEdit;
    dbeZoneSec15Back: TDBEdit;
    gbZon20: TGroupBox;
    Label182: TLabel;
    Label183: TLabel;
    dbeZoneSec20Go: TDBEdit;
    dbeZoneSec20Back: TDBEdit;
    gbZon19: TGroupBox;
    Label184: TLabel;
    Label185: TLabel;
    dbeZoneSec19Go: TDBEdit;
    dbeZoneSec19Back: TDBEdit;
    gbZon18: TGroupBox;
    Label186: TLabel;
    Label187: TLabel;
    dbeZoneSec18Go: TDBEdit;
    dbeZoneSec18Back: TDBEdit;
    gbZon17: TGroupBox;
    Label188: TLabel;
    Label189: TLabel;
    dbeZoneSec17Go: TDBEdit;
    dbeZoneSec17Back: TDBEdit;
    gbZon16: TGroupBox;
    Label190: TLabel;
    Label191: TLabel;
    dbeZoneSec16Go: TDBEdit;
    dbeZoneSec16Back: TDBEdit;
    TabSheet11: TTabSheet;
    gbZon21: TGroupBox;
    Label192: TLabel;
    Label193: TLabel;
    dbeZoneSec21Go: TDBEdit;
    dbeZoneSec21Back: TDBEdit;
    gbZon22: TGroupBox;
    Label194: TLabel;
    Label195: TLabel;
    dbeZoneSec22Go: TDBEdit;
    dbeZoneSec22Back: TDBEdit;
    gbZon23: TGroupBox;
    Label196: TLabel;
    Label197: TLabel;
    dbeZoneSec23Go: TDBEdit;
    dbeZoneSec23Back: TDBEdit;
    gbZon24: TGroupBox;
    Label198: TLabel;
    Label199: TLabel;
    dbeZoneSec24Go: TDBEdit;
    dbeZoneSec24Back: TDBEdit;
    gbZon25: TGroupBox;
    Label200: TLabel;
    Label201: TLabel;
    dbeZoneSec25Go: TDBEdit;
    dbeZoneSec25Back: TDBEdit;
    gbZon29: TGroupBox;
    Label202: TLabel;
    Label203: TLabel;
    dbeZoneSec29Go: TDBEdit;
    dbeZoneSec29Back: TDBEdit;
    gbZon28: TGroupBox;
    Label204: TLabel;
    Label205: TLabel;
    dbeZoneSec28Go: TDBEdit;
    dbeZoneSec28Back: TDBEdit;
    gbZon27: TGroupBox;
    Label206: TLabel;
    Label207: TLabel;
    dbeZoneSec27Go: TDBEdit;
    dbeZoneSec27Back: TDBEdit;
    gbZon26: TGroupBox;
    Label208: TLabel;
    Label209: TLabel;
    dbeZoneSec26Go: TDBEdit;
    dbeZoneSec26Back: TDBEdit;
    gbZon30: TGroupBox;
    Label210: TLabel;
    Label211: TLabel;
    dbeZoneSec30Go: TDBEdit;
    dbeZoneSec30Back: TDBEdit;
    dbeSections: TDBEdit;
    Label212: TLabel;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    tbtnAddZone: TToolButton;
    tbtnModZone: TToolButton;
    tbtnDelZone: TToolButton;
    actOkZone: TAction;
    pnlBottomZone: TPanel;
    btnCancelZone: TBitBtn;
    btnOkZone: TBitBtn;
    actCancelZone: TAction;
    pnlZone: TPanel;
    pnlZoneLeft: TPanel;
    dbgZone: TDBGrid;
    pnlZoneRight: TPanel;
    DBGrid1: TDBGrid;
    pnlPrice: TPanel;
    pnlPriceLeft: TPanel;
    dbgLinePrices: TDBGrid;
    pnlPriceRight: TPanel;
    DBGrid3: TDBGrid;
    pnlDiscount: TPanel;
    pnlDiscountLeft: TPanel;
    dbgLineDiscounts: TDBGrid;
    pnlDiscountRight: TPanel;
    DBGrid4: TDBGrid;
    Label213: TLabel;
    dbLM_SECTION: TRxDBComboBox;
    dbISS_ID: TRxDBLookupCombo;
    Label214: TLabel;
    dbLR_ID: TRxDBLookupCombo;
    Label215: TLabel;
    DBEdit3: TDBEdit;
    Label216: TLabel;
    Label217: TLabel;
    dbPassback: TDBEdit;
    tabTrechos: TTabSheet;
    CoolBar2: TCoolBar;
    ToolBar5: TToolBar;
    tb_inserir_trecho: TToolButton;
    tb_editar_trecho: TToolButton;
    tb_excluir_trecho: TToolButton;
    lb_trecho: TLabel;
    cb_trecho: TRxDBLookupCombo;
    Label218: TLabel;
    dbed_preco: TDBEdit;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    dbed_partida: TDBEdit;
    dbed_desconto: TDBEdit;
    dbed_pedagio: TDBEdit;
    dbed_seguro: TDBEdit;
    dbed_outro: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    Label224: TLabel;
    pn_trechos: TPanel;
    dbg_trechos: TDBGrid;
    ActOkTrechos: TAction;
    actCancelTrechos: TAction;
    Label225: TLabel;
    cb_aplicacao_trecho: TRxDBLookupCombo;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label226: TLabel;
    dbcbLpBUUseAlternatePrice: TDBCheckBox;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    Label227: TLabel;
    Label228: TLabel;
    DBEdit4: TDBEdit;
    Label229: TLabel;
    DBDateEdit5: TDBDateEdit;
    Label230: TLabel;
    DBDateEdit6: TDBDateEdit;
    Label231: TLabel;
    DBEdit5: TDBEdit;
    Label232: TLabel;
    DBDateEdit7: TDBDateEdit;
    Label233: TLabel;
    Label234: TLabel;
    DBDateEdit8: TDBDateEdit;
    Label235: TLabel;
    DBEdit9: TDBEdit;
    btnSelectAplicacao: TSpeedButton;
    EditGroupInte: TEdit;
    btnGrupoIntegracoes: TSpeedButton;
    Label236: TLabel;
    pn_bottom_trechos: TPanel;
    btnCancelTrechos: TBitBtn;
    btnOkTrechos: TBitBtn;
    Button1: TButton;
    DBEdit11: TDBEdit;
    lbFiltrado: TLabel;
    btnLimpaStatus: TSpeedButton;
    Panel5: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure dbDescontoKeyPress(Sender: TObject; var Key: Char);
    procedure pcSecoesChanging(Sender: TObject; var AllowChange: Boolean);
    procedure actOkDetailExecute(Sender: TObject);
    procedure actCancelDetailExecute(Sender: TObject);
    procedure actOkSectionsExecute(Sender: TObject);
    procedure actCancelSectionsExecute(Sender: TObject);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure actDeleteDetailExecute(Sender: TObject);
    procedure actNewPriceExecute(Sender: TObject);
    procedure actEditPriceExecute(Sender: TObject);
    procedure actDeletePriceExecute(Sender: TObject);
    procedure actOkPriceExecute(Sender: TObject);
    procedure actCancelPriceExecute(Sender: TObject);
    procedure actOkDiscountExecute(Sender: TObject);
    procedure actCancelDiscountExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actNewSectionExecute(Sender: TObject);
    procedure actEditSectionExecute(Sender: TObject);
    procedure actDeleteSectionExecute(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure edHHiniChange(Sender: TObject);
    procedure edHMIniChange(Sender: TObject);
    procedure edHHFimChange(Sender: TObject);
    procedure edHMFimChange(Sender: TObject);
    procedure actOkZoneExecute(Sender: TObject);
    procedure actCancelZoneExecute(Sender: TObject);
    procedure nbDetalhesPageChanged(Sender: TObject);
    procedure ActOkTrechosExecute(Sender: TObject);
    procedure actCancelTrechosExecute(Sender: TObject);
    procedure dbcbLpBUUseAlternatePriceClick(Sender: TObject);
    procedure dbgDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btnSelectAplicacaoClick(Sender: TObject);
    procedure btnGrupoIntegracoesClick(Sender: TObject);
    procedure EditGroupInteKeyPress(Sender: TObject; var Key: Char);
    procedure EditGroupInteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_trechosDblClick(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
  private
     vLDI_ID : Integer;
     vLDI_DATESTART, vLDI_DATEEND,
     vLDI_TIMESTART, vLDI_TIMEEND : TDateTime;
     vLDI_VALUE : Real;
     vQtdeSecao : Integer;
     ChkIda, ChkVolta : Char; //C - Completo / I - Incompleto / V - Vazio / E - Erro
     salvaCodTrecho: String; //cidel+
     dbMemoria: TStringList; //cidel+
     ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
     procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
     procedure montaDBMemoria;
     Function  CheckPrices(pIda, pVolta : Char) : Boolean;
     Procedure SetChk;
     Procedure SetLineDT(Status : Boolean);
     Function BeforePost : Boolean;
     Procedure HabilitaSecoes(Secoes : Integer);
     Procedure AtualizaSecao(Qtde_Secao : Integer);
     Procedure InativaPrecos;
     Procedure SetApp;
     Procedure GetDateTime;
     Function  ConfirmaPreco : Boolean;
     function  temCodTrecho: Boolean;
    { Private declarations }
  public
    ContrLDT_ID : Integer;
    ContrSeqPrices : Integer;
    ContrSeqDiscounts : Integer;
    vSEQNBR : Integer;
    { Public declarations }
  end;

var
  FrmLineMT: TFrmLineMT;
  vLineDiscount : Array of RegLinediscounts;

implementation

uses uDmSys, uDmSys1, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uLineDiscounts, uTransportProviders, uFrmBaseCadastro,
  uFrmSystemLog, uDmBase, SelectAplicacao, Aguarde;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineMT.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineMT.FormShow(Sender: TObject);
begin
  inherited;
//  DmSys.cdsLineMT.Close;
//  DmSys.cdsLineMT.CommandText := 'SELECT '+ ccardLineMTSelect +' From lineMT ORDER BY LM_DESC';

    defOrder:=' ORDER BY LM_DESC ';
    strOrder:=defOrder;
    ct:='SELECT '+ ccardLineMTSelect +' FROM lineMT LM %where% %order%';

    dmSys1.cdsLineZonePrices.MasterSource := dmsys.dtsLineDetails;
    dmsys1.cdsLineZonePrices.MasterFields := 'LD_ID';
    dmSys1.cdsLineZonePrices.CommandText := 'SELECT LZP.*, APP.APP_DESCSHORT, ISS.ISS_DESCSHORT FROM LINEZONEPRICES LZP LEFT JOIN APPLICATIONS APP ON APP.APP_ID = LZP.APP_ID AND APP.ISS_ID = LZP.ISS_ID '+
                                            '  LEFT JOIN ISSUERS ISS ON ISS.ISS_ID = LZP.ISS_ID WHERE LZP.LZP_STATUS = ''A'' AND LD_ID = :id ORDER BY LZP_SEQNBR';

    OpenTablesSys([DmSys.cdsLineMt, DmSys1.cdsLineDirections, DmSys.cdsLineDetails, DmSys.cdsLineDetailTypes,
                   DmSys1.cdsLinePrices, DmSys.cdsFarelevels, DmSys.cdsLineDiscounts,
                   DmSys1.cdsLineSectionsXFarelevels, dmSys1.cdsLineRange,
                   //DmSys.cdsFarelevelsLinePrices, //cidel-
                   DmSys.cdsLineTypes, DmSys.cdsLocations, DmSys.cdsDiscountTypes,
                   //DmSys.cdsLineDiscounts, DmSys1.cdsLineSectionsXLineDiscounts,
                   DmSys1.cdsTPxLM,   DmSys.cdsApplicationsLook, dmSys1.cdsLineZonePrices, dmSys1.cdsLineZonePricesIndividual,
                   DmSys1.cdsLinePricesIndividual, DmSys1.cdsLineDiscountsIndividual, DmSys.cdsIssuers, DmSys.cdsLineDetailsXZones,
                   DmSys.cdsZones,DmSys.cdsLineGroups]);

//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LM_ID', 'FROM LINEMT', 'True', ' WHERE LM_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsLineMT.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    SetLineDT(False);
    actLog.Enabled := DmSys.cdsLineMt.RecordCount > 0;
end;

Procedure TFrmLineMT.AtualizaSecao(Qtde_Secao : Integer);
Var
  I : Integer;
Begin
  dmSys1.cdsLinePrices.First;

  While NOT dmSys1.cdsLinePrices.Eof do
    Begin
      If dmSys1.cdsLinePrices.FieldByName('LP_STATUS').AsString = 'A' Then
      For I := (Qtde_Secao + 1) to Nsecao do
          Begin
            dmSys1.cdsLinePrices.Edit;
            dmSys1.cdsLinePrices.FieldByName('LP_SCT'+InttoStr(I)+'_IDA').Value   := NULL;
            dmSys1.cdsLinePrices.FieldByName('LP_SCT'+InttoStr(I)+'_VOLTA').Value := NULL;
            dmSys1.cdsLinePrices.Post;
          End;
      dmSys1.cdsLinePrices.Next;
    End;

End;

Procedure TFrmLineMT.InativaPrecos;
Begin
  With dmSys1 do
    Begin
      cdsLinePrices.DisableControls;
      dmsys.cdsLineDiscounts.DisableControls;
      cdsLinePrices.First;
      dmsys.cdsLineDiscounts.First;

      While Not cdsLinePrices.Eof do
         Begin
            dmSys1.cdsLinePrices.Edit;
            dmSys1.cdsLinePrices.FieldByName('LP_STATUS').AsString := 'I';
            dmSys1.cdsLinePrices.FieldByName('STATUS_ID').AsString := 'I';
//            dmSys1.cdsLinePrices.Post;
            cdsLinePrices.Next;
         End;

      While Not dmsys.cdsLineDiscounts.Eof do
         Begin
            dmsys.cdsLineDiscounts.Edit;
            dmsys.cdsLineDiscounts.FieldByName('LDI_STATUS').AsString := 'I';
            dmsys.cdsLineDiscounts.FieldByName('STATUS_ID').AsString  := 'I';
//            dmSys1.cdsLinePrices.Post;
            dmsys.cdsLineDiscounts.Next;
         End;


//     dmSys1.cdsLinePrices.Refresh;
//     dmSys1.cdsLinePrices.Open;

      dmsys.cdsLineDiscounts.Filter := 'LDI_STATUS = ''A'' ';
      dmSys1.cdsLinePrices.Filter   := 'LP_STATUS = ''A'' ';

      cdsLinePrices.Enablecontrols;
      dmsys.cdsLineDiscounts.EnableControls;
    End;
End;

Procedure TFrmLineMT.HabilitaSecoes(Secoes : Integer);
 Var
   I : Integer;
Begin
   For I := 0 to ComponentCount - 1 do
      Begin
        If Components[i].ClassType = TGroupBox Then
          Begin
          If ( (Copy(TGroupBox(Components[i]).Name,1,5) = 'gbSec') OR (Copy(TGroupBox(Components[i]).Name,1,5) = 'gbDec') OR (Copy(TGroupBox(Components[i]).Name,1,5) = 'gbZon') ) AND
              (StrtoInt(Copy(TGroupBox(Components[i]).Name,6,2)) > Secoes)  Then
              Begin
              TGroupBox(Components[i]).Enabled := False;
              TGroupBox(Components[i]).Font.Color := clGray;
              End
           Else
              Begin
               TGroupBox(Components[i]).Enabled := True;
               TGroupBox(Components[i]).Font.Color := clBlack;
              End;
          End;
      End;
End;

procedure TFrmLineMT.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsLineMt);
  SetActions([], False, FrmLineMT, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmLineMT, t_form_objects);
  ContrLDT_ID := 0;
  vSEQNBR     := 0;
  ContrSeqPrices := 0;
  ContrSeqDiscounts := 0;
  SetLineDT(True);
  dbDescShort.SetFocus;
end;

procedure TFrmLineMT.actEditExecute(Sender: TObject);
begin
  inherited;
//  ActionEditSys(DmSys.cdsLineMt);
  SetActions([], False, FrmLineMT, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmLineMT, t_form_objects);
  ContrLDT_ID := 0;
  ContrSeqPrices := 0;
  ContrSeqDiscounts := 0;
  SetLineDT(True);
end;

Procedure TFrmLineMT.SetChk;
Begin
  edHHini.Value := 00;
  edHMIni.Value := 00;
  edHHFim.Value := 00;
  edHMFim.Value := 00;
  RxDBLookupCombo1.KeyValue := -1;
End;

procedure TFrmLineMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys.cdsLineMt,    DmSys.cdsFarelevels, DmSys1.cdsTPxLM, dmSys1.cdsLineZonePrices,
                  DmSys.cdsLineTypes, DmSys.cdsLocations, DmSys.cdsLineDiscounts, DmSys1.cdsLineSectionsXLineDiscounts,
                  dmSys1.cdsLineZonePricesIndividual, DmSys1.cdsLinePricesIndividual, DmSys1.cdsLineDiscountsIndividual, DmSys.cdsIssuers,
                  dmSys1.cdsLineRange, dmSys.cdsLineDetailsXZones, dmSys.cdsZones,DmSys.cdsLineGroups]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  DmSys.cdsLineMT.CommandText := 'SELECT '+ ccardLineMTSelect +' From lineMT LM where LM_STATUS = ''A'' ORDER BY LM_DESC';
  FrmLineMT := Nil;
end;

Function TFrmLineMT.BeforePost : Boolean;
Var
 vLineMT : Integer;
 vLineDetails : Integer;
 vLineDetailsAtual : Integer;
Begin
Result := True;

  vLineMT      := DmConexao.ConnBrkMaster.AppServer.AutoIncremento_Seq('LM_ID', 'False', '' );

  If vLineMT = 0 Then
     Begin
     Result := False;
     Exit;
     End;

  vLineDetails := DmSys.cdsLineDetails.FieldByName('LD_ID').AsInteger;

  DmSys.cdsLineDetails.First;
  dmSys1.cdsLinePrices.First;
  DmSys.cdsLineDiscounts.First;
  DmSys.cdsLineDetailsXZones.First;

  if not DmSys1.cdsLineZonePrices.Active then
    DmSys1.cdsLineZonePrices.Open;
  DmSys1.cdsLineZonePrices.First;

  While NOT DmSys.cdsLineDetails.Eof do
     Begin
//      vLineDetailsAtual := DmSys.cdsLineDetails.FieldByName('LD_ID').AsInteger;
      vLineDetails := DmSys.cdsLineDetails.FieldByName('LD_ID').AsInteger;
      While NOt dmSys1.cdsLinePrices.Eof do
      Begin
        DmSys1.cdsLinePrices.Edit;
        DmSys1.cdsLinePrices.FieldByName('LD_ID').AsInteger := vLineDetails;
        DmSys1.cdsLinePrices.Post;
        DmSys1.cdsLinePrices.Next;
      End;

      While NOt DmSys.cdsLineDiscounts.Eof do
      Begin
         DmSys.cdsLineDiscounts.Edit;
         DmSys.cdsLineDiscounts.FieldByName('LD_ID').AsInteger := vLineDetails;
         DmSys.cdsLineDiscounts.Post;
         DmSys.cdsLineDiscounts.Next;
      End;

      While NOt DmSys1.cdsLineZonePrices.Eof do
      Begin
         DmSys1.cdsLineZonePrices.Edit;
         DmSys1.cdsLineZonePrices.FieldByName('LD_ID').AsInteger := vLineDetails;
         DmSys1.cdsLineZonePrices.Post;
         DmSys1.cdsLineZonePrices.Next;
      End;

      while not DmSys.cdsLineDetailsXZones.Eof do
      begin
         DmSys.cdsLineDetailsXZones.Edit;
         DmSys.cdsLineDetailsXZones.FieldByName('LD_ID').AsInteger := vLineDetails;
         DmSys.cdsLineDetailsXZones.Post;
         DmSys.cdsLineDetailsXZones.Next;
      end;

       DmSys.cdsLineDetails.Edit;
       DmSys.cdsLineDetails.FieldByName('LM_ID').AsInteger := vLineMT;
//       DmSys.cdsLineDetails.FieldByName('LD_ID').AsInteger := vLineDetails;
       DmSys.cdsLineDetails.Post;
//       DmSys.cdsLineDetails.Next;
       Inc(vLineDetails);
     End;

     DmSys.cdsLineMt.Edit;
     DmSys.cdsLineMt.FieldByName('LM_ID').AsInteger := vLineMT;
     DmSys.cdsLineMt.Post;
End;

Function TFrmLineMT.ConfirmaPreco : Boolean;
Var
  Valida : Boolean;
  bkDetails, bkPrices, bkDiscounts : TBookmark;
Begin
//  bkPrices  := DmSys1.cdsLinePrices.GetBookMark;
  bkDetails := DmSys.cdsLineDetails.GetBookMark;

  DmSys.cdsLineDetails.First;

  While Not DmSys.cdsLineDetails.Eof do
     Begin
        Valida := False;
        If Dmsys1.cdsLinePrices.RecordCount = 0 Then
           DmSys.cdsLineDetails.Last
        Else
         While Not Dmsys1.cdsLinePrices.Eof do
            Begin
               If Dmsys1.cdsLinePrices.FieldByName('LP_STATUS').AsString = 'A' Then
               Valida := True;
               Dmsys1.cdsLinePrices.Next;
            End;
         DmSys.cdsLineDetails.Next;
     End;


 DmSys.cdsLineDetails.GotoBookMark(bkDetails);
// DmSys1.cdsLinePrices.GotoBookMark(bkPrices);

 DmSys.cdsLineDetails.FreeBookMark(bkDetails);
// DmSys.cdsLinePrices.FreeBookMark(bkPrices);


Result := Valida;
End;

procedure TFrmLineMT.actApplyUpdatesExecute(Sender: TObject);
Begin
  If Trim(dbLinhaDesc.Text) = '' Then
     Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
       dbLinhaDesc.SetFocus;
     End
  Else
  If Trim(dbDescShort.text) = '' Then
     Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
       dbDescShort.SetFocus;
     End
//  Else
//  If Not ConfirmaPreco Then
//    Application.MessageBox('Preço da Linha obrigatório','Aviso ao usuário', mb_OK+mb_ICONINFORMATION)
  Else
  Begin
     inherited;
      If  status = stConsult Then
        BEGIN
         If dtsMaster.DataSet.State = dsInsert Then
            IF NOT BeforePost Then
               Begin
                 Application.MessageBox('Estouro de limite ou sequência inexistente'+#13+'Redefina a sequência para esta tabela.', 'Aviso ao usuário', MB_OK+MB_ICONWARNING);
                 SetActions([actEdit, actInsert], False, FrmLineMT, t_form_objects);
                 Exit;
               End;

         dmsys.cdsLineDiscounts.Filter := '';
         dmSys1.cdsLinePrices.Filter   := '';

         If ApplyTablesSys([dbLinhaDesc, dbDescShort], [
                                                        DmSys.cdsLineMt,
//                                                        dmSys1.cdsLineZonePrices,
                                                        DmSys.cdsLineDetails,
//                                                        dmSys1.cdsLineSections,
                                                        dmSys1.cdsLinePrices,
                                                        dmSys.cdsLineDiscounts,
                                                        dmSys.cdsLineDetailsXZones]) Then
//                                                        dmSys1.cdsLineSectionsXLineDiscounts]) Then
             begin
              if dmSys1.cdsLineZonePrices.Active then
                ApplyTablesSys([],[dmSys1.cdsLineZonePrices]);
              vSEQNBR := 0;
              SetActions([], True, FrmLineMT, t_form_objects);
              SetActions([actApplyUpdates, actCancel], False, FrmLineMT, t_form_objects);
              actRefresh.Execute;
              SetLineDT(False);
             end;
        END;
   End;
  actLog.Enabled := DmSys.cdsLineMt.RecordCount > 0;

end;

procedure TFrmLineMT.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmsys.cdsLineDiscounts.Filter := '';
     dmSys1.cdsLinePrices.Filter   := '';

     dmSys1.cdsLinePrices.Cancel;
     dmSys1.cdsLineZonePrices.Cancel;
     dmSys.cdsLineDiscounts.Cancel;
     dmSys.cdsLineDetails.Cancel;
     dmSys.cdsLineMt.Cancel;
     dmSys.cdsLineDetailsXZones.Cancel;

     dmSys1.cdsLinePrices.CancelUpdates;
     dmSys1.cdsLineZonePrices.CancelUpdates;
     dmSys.cdsLineDiscounts.CancelUpdates;
     dmSys.cdsLineDetails.CancelUpdates;
     dmSys.cdsLineMt.CancelUpdates;
     dmSys.cdsLineDetailsXZones.CancelUpdates;

     SetActions([], True, FrmLineMT, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmLineMT, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     vSEQNBR := 0;
     Status := stConsult;
     SetLineDT(False);
     actRefresh.Execute;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsLineMt.RecordCount > 0;
end;

procedure TFrmLineMT.actFilterExecute(Sender: TObject);
//Var strWhere : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edtLinha.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LM_DESCSHORT LIKE ' + QuotedStr(edtLinha.Text + '%') + ' AND ';
       end;

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LM_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LM_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LM_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsLineMT.Close;
      cdsLineMT.CommandText := 'SELECT '+ ccardLineMTSelect +' From lineMT LM ' + strWhere + strOrder; //'ORDER BY LM_DESC';
      cdsLineMT.Open;

//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LM_ID', 'FROM LINEMT', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsLineMT.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := DmSys.cdsLineMt.RecordCount > 0;

end;

procedure TFrmLineMT.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  EditGroupInte.Clear;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetLineDT(False);
//      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmLineMT, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmLineMT, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmLineMT.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsLineMt.Edit;
         cdsLineMt.FieldByName('LM_STATUS').AsString := 'I';
         cdsLineMt.Post;
         cdsLineMt.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsLineMt.RecordCount > 0;

end;

Procedure TFrmLineMT.SetLineDT(Status : Boolean);
Begin
   cbDetails.Enabled    := Status;
   cbPrices.Enabled     := Status;
   dbDiscounts.Enabled     := Status;
//   tbtnEditCardApp.Enabled  := Status;
//   tbtnDeletePeriod.Enabled := Status;
///   tbSections.Enabled     := Status;
   gbLines.Enabled        := Status;


  If dtsMaster.DataSet.State in [dsInsert, dsEdit] Then
     tbNewDetalhes.Enabled := True
  Else
     tbNewDetalhes.Enabled := False;

  If DmSys.cdsLineDetails.RecordCount > 0 Then
     Begin
      tbEditDetalhes.Enabled := Status;
      tbDelDetalhes.Enabled  := Status;
     End;


  IF dmSys.cdsLineDetails.RecordCount > 0 Then
     Begin
       tbNewPrices.Enabled       := Status;
       tbNewDescontos.Enabled    := Status;
       tbtnAddZone.Enabled       := Status;
       tb_inserir_trecho.Enabled := Status;
     End;

{  If dmSys1.cdsLineSections.RecordCount > 0 Then
     Begin
//      tbEditDetails.Enabled  := Status;
//      tbDelDetails.Enabled   := Status;
     End;

}
  If (dmSys1.cdsLinePrices.RecordCount > 0) Then
     Begin
      tbEditPrices.Enabled      := Status;
      tbDeletePrices.Enabled    := Status;
     End
  Else
     Begin
      tbEditPrices.Enabled      := False;
      tbDeletePrices.Enabled    := False;
     End;


  If (dmSys.cdsLineDiscounts.RecordCount > 0) Then
     Begin
      tbEditDescontos.Enabled   := Status;
      tbDeleteDescontos.Enabled := Status;
     End
  Else
     Begin
      tbEditDescontos.Enabled   := False;
      tbDeleteDescontos.Enabled := False;
     End;


  if (dmSys1.cdsLineZonePrices.Active = True) then
  begin
    If (dmSys1.cdsLineZonePrices.RecordCount > 0) Then
       Begin
        tbtnModZone.Enabled := Status;
        tbtnDelZone.Enabled := Status;
       End
    Else
       Begin
        tbtnModZone.Enabled := False;
        tbtnDelZone.Enabled := False;
       End;
  end
  else
  Begin
    tbtnModZone.Enabled := False;
    tbtnDelZone.Enabled := False;
  End;

  if dmSys.cdsLineDetailsXZones.RecordCount > 0 then
  begin
    tb_editar_trecho.Enabled  := Status;
    tb_excluir_trecho.Enabled := Status;
  end
  else
  begin
    tb_editar_trecho.Enabled  := False;
    tb_excluir_trecho.Enabled := False;
  end;

End;

procedure TFrmLineMT.actRefreshExecute(Sender: TObject);
begin
  inherited;
      DmSys.cdsLineDetails.close;
      DmSys.cdsLineDetails.Open;

end;

procedure TFrmLineMT.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DMSYS1.cdsLineSectionsXFarelevels.Cancel;
  SetLineDT(True);
end;

procedure TFrmLineMT.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetLineDT(False);

  pcBaseCadastroChange(Self);
end;

procedure TFrmLineMT.dbDescontoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 Abort;
end;

procedure TFrmLineMT.pcSecoesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
   AllowChange :=  (tbNewPrices.Enabled) OR (Status = stConsult);
end;

procedure TFrmLineMT.actOkDetailExecute(Sender: TObject);
begin
  inherited;
  If dbTipo.KeyValue = NULL Then
  Begin
     DisplayMsg(t_form_objects, '%T %T', [2795, 1500], []);
     dbTipo.SetFocus;
  End
  Else
// Corrigido por Daniel - 22/06/2005
//  If DmSys.cdsLineDetails.FieldByName('Ld_SectionsQty').AsInteger <= 0 Then
  If Trim(DBEdit8.Text) = '' then
    DBEdit8.Text := '0';

  If StrToInt(DBEdit8.Text) <= 0 Then
  Begin
     DisplayMsg(t_form_objects, '%T', [3260], []);
     DBEdit8.SetFocus;
  End
  Else
  Begin
    tbtnApply.Enabled := True;
    tbtnCancel.Enabled := True;
    DMSYS.cdsLineDetails.FieldByName('STATUS_ID').AsString := dbStatusDetalhes.Values.Strings[dbStatusDetalhes.itemindex];
    DMSYS.cdsLineDetails.FieldByName('LDT_DESC').AsString  := dbTipo.Text;
    DMSYS.cdsLineDetails.Post;
//    AtualizaSecao(DMSYS.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
    IF DMSYS.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger < vQtdeSecao Then
       Begin
         InativaPrecos;
         Application.MessageBox('A quantidade de seção foi alterada. Os preços e os descontos atuais foram inativados.'+#13'Você precisará recadastrar os novos preços e descontos desta linha.', 'Aviso ao usuário', MB_OK+MB_ICONWARNING);
       End;

    nbDetalhes.PageIndex := 0;
    SetLineDT(True);
  end;
end;

procedure TFrmLineMT.actCancelDetailExecute(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DMSYS.cdsLineDetails.Cancel;
  nbDetalhes.PageIndex := 0;
  SetLineDT(True);
end;

procedure TFrmLineMT.actOkSectionsExecute(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
//  DMSYS1.cdsLineSections.FieldByName('STATUS_ID').AsString :=  dbStatus.Values.Strings[dbStatus.ItemIndex];
//  DMSYS1.cdsLineSections.Post;
//  nbSection.PageIndex := 0;
///  pnSecao.Visible := True;
  SetLineDT(True);
end;

procedure TFrmLineMT.actCancelSectionsExecute(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  DMSYS1.cdsLineSections.Cancel;
//  nbSection.PageIndex := 0;
///  pnSecao.Visible := True;
  SetLineDT(True);
end;

procedure TFrmLineMT.actNewDetailExecute(Sender: TObject);
Var
  Pos : Integer;
begin
  inherited;
  if dbDescShort.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [2796, 1501], []);
    dbDescShort.SetFocus;
    Exit;
  end;
  if dbLinhaDesc.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [2796, 1501], []);
    dbLinhaDesc.SetFocus;
    Exit;
  end;
  SetLineDT(False);

  tbtnApply.Enabled := False;
  tbtnCancel.Enabled := False;
  nbDetalhes.PageIndex := 1;
  ActionInsertSys(DmSys.cdsLineDetails);
  dbLinha.SetFocus;
end;

procedure TFrmLineMT.actEditDetailExecute(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  vQtdeSecao := DmSys.cdsLineDetails.fieldByName('LD_SECTIONSQTY').AsInteger;

  if dbDescShort.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [2796, 1501], []);
    dbDescShort.SetFocus;
    Exit;
  end;
  if dbLinhaDesc.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [2796, 1501], []);
    dbLinhaDesc.SetFocus;
    Exit;
  end;
  SetLineDT(False);

  nbDetalhes.PageIndex := 1;    
  tbtnApply.Enabled := False;
  tbtnCancel.Enabled := False;
  DmSys.cdsLineDetails.Edit;
  dbLinha.SetFocus;

end;

procedure TFrmLineMT.actDeleteDetailExecute(Sender: TObject);
begin
  inherited;
  DMSYS.cdsLineDetails.Edit;
  DMSYS.cdsLineDetails.FieldByName('LD_STATUS').AsString  := 'I';
  DMSYS.cdsLineDetails.FieldByName('STATUS_ID').AsString  := 'I';
end;

procedure TFrmLineMT.actNewPriceExecute(Sender: TObject);
begin
  inherited;
  if DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger = 0 then
  begin
    Application.MessageBox('Não é possível incluir preços, pois o número de seções dessa linha é zero','Atenção',MB_OK);
    exit;
  end;

  Case pcSecoes.ActivePageIndex of
     0 : Begin //Preços...
          tbtnApply.Enabled := False;
          tbtnCancel.Enabled := False;
          pnlPrice.Visible := False;
          ActionInsertSys(DmSys1.cdsLinePrices);
          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          plPriceOK.Visible := True;
          dbLkApplications.KeyValue := '';
          dbDate.SetFocus;
          dbLkApplications.Enabled := True;

          SetLineDT(False);
         End;

     1 : Begin // Descontos...
          tbtnApply.Enabled := False;
          tbtnCancel.Enabled := False;
          pnlDiscount.Visible := False;
          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          ActionInsertSys(DmSys.cdsLineDiscounts);
          dbLkApplicationsDiscounts.ClearValue;
          SetChk;
          plDiscountsOK.Visible := True;
          vLDI_ID := 0;
          vLDI_DATESTART := 0;
          vLDI_DATEEND   := 0;
          vLDI_TIMESTART := 0;
          vLDI_TIMEEND   := 0;
          vLDI_VALUE     := 0;
          SetLineDT(False);
         End;
     2 : Begin //Zonas...
          tbtnApply.Enabled := False;
          tbtnCancel.Enabled := False;
          pnlZone.Visible := False;
          if not DmSys1.cdsLineZonePrices.Active then
            DmSys1.cdsLineZonePrices.Open;
          ActionInsertSys(DmSys1.cdsLineZonePrices);
          DmSys1.cdsLineZonePrices.FieldByName('LD_ID').AsString := DmSys.cdsLineDetails.FieldByName('LD_ID').AsString;
          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          pnlBottomZone.Visible := True;
          dblZoneApplication.KeyValue := '';
          dbdZoneDate.SetFocus;
          SetLineDT(False);
         End;

     3 : Begin //Trechos...
          tbtnApply.Enabled  := False;
          tbtnCancel.Enabled := False;
          pn_trechos.Visible := False;
          cb_aplicacao_trecho.KeyValue := '';
          salvaCodTrecho:='';  //cidel+
          if not DmSys.cdsLineDetailsXZones.Active then
            DmSys.cdsLineDetailsXZones.Open;
          montaDBMemoria; //cidel+
          ActionInsertSys(DmSys.cdsLineDetailsXZones);
          DmSys.cdsLineDetailsXZones.FieldByName('LD_ID').AsString := DmSys.cdsLineDetails.FieldByName('LD_ID').AsString;
//          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          pn_bottom_trechos.Visible := True;
//          dblZoneApplication.KeyValue := '';
          cb_trecho.SetFocus;
          SetLineDT(False);
         End;
  End;
end;

procedure TFrmLineMT.SetApp;
Var Str : String;
Begin
   Case pcSecoes.ActivePageIndex of
     // Alterado por Daniel - 07/06/2005
     // Faltava um IF no Locate, pois se não tivesse nenhuma Aplicação cadastrada, ela pegava a primeira da tabela.
     0 : Begin
           if DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([dmSys1.cdsLinePrices.FieldByName('APP_ID').AsInteger,
                                                                            dmSys1.cdsLinePrices.FieldByName('ISS_ID').AsInteger]), [] ) then
             dbLkApplications.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger
           else
             dbLkApplications.ClearValue;
         End;
     1 : Begin
           if DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([dmSys.cdsLineDiscounts.FieldByName('APP_ID').AsInteger, dmSys.cdsLineDiscounts.FieldByName('ISS_ID').AsInteger]), [] ) then
             dbLkApplicationsDiscounts.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger
           else
             dbLkApplicationsDiscounts.ClearValue;
         End;
     2 : Begin
           if DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([dmSys1.cdsLineZonePrices.FieldByName('APP_ID').AsInteger, dmSys1.cdsLineZonePrices.FieldByName('ISS_ID').AsInteger]), [] ) then
             dblZoneApplication.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger
           else
             dblZoneApplication.ClearValue;
         End;

     3 : Begin
           if DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([dmSys.cdsLineDetailsXZones.FieldByName('APP_ID').AsInteger, dmSys.cdsLineDetailsXZones.FieldByName('ISS_ID').AsInteger]), [] ) then
             cb_aplicacao_trecho.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger
           else
             cb_aplicacao_trecho.ClearValue;
         End;

     // Fim da alteração
   End;
End;


procedure TFrmLineMT.actEditPriceExecute(Sender: TObject);
begin
  inherited;
  Case pcSecoes.ActivePageIndex of
     0 : Begin //Preços...
          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          SetApp;
//          dbDate.Text := FormatDatetime('dd/mm/yyyy',JulianToDateTime(dmSys1.cdsLineSectionsxLinePrices.fieldByName('LP_DATE').AsInteger));
          tbtnApply.Enabled        := False;
          tbtnCancel.Enabled       := False;
          pnlPrice.Visible := False;
          SetLineDT(False);
          DmSys1.cdsLinePrices.Edit;
          plPriceOK.Visible := True;
          dbLkApplications.Enabled := False;
          dbDate.SetFocus;
          if dbcbLpBUUseAlternatePrice.Checked then
          begin
            dbLkApplications.Value := '';
            dbLkApplications.Enabled := False;
            DmSys1.cdsLinePrices.FieldByName('ISS_ID').Value := null;
            DmSys1.cdsLinePrices.FieldByName('APP_ID').Value := null;
          end
          else
          begin
            dbLkApplications.Enabled := True;
          end;
         End;

     1 : Begin //Descontos...
{          vLDI_ID        := DmSys1.cdsLineSectionsXLineDiscounts.fieldByName('LDI_ID').AsInteger;
          vLDI_DATESTART := DmSys1.cdsLineSectionsXLineDiscounts.fieldByName('LDI_DATESTART').AsDateTime;
          vLDI_DATEEND   := DmSys1.cdsLineSectionsXLineDiscounts.fieldByName('LDI_DATEEND').AsDateTime;
          vLDI_TIMESTART := DmSys1.cdsLineSectionsXLineDiscounts.fieldByName('LDI_TIMESTART').AsDateTime;
          vLDI_TIMEEND   := DmSys1.cdsLineSectionsXLineDiscounts.fieldByName('LDI_TIMEEND').AsDateTime;
          vLDI_VALUE     := DmSys1.cdsLineSectionsXLineDiscounts.fieldByName('LDI_VALUE').AsFloat;
}
          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          GetDateTime;
          SetLineDT(False);
          SetApp;
          plDiscountsOK.Visible := True;
          tbtnApply.Enabled        := False;
          tbtnCancel.Enabled       := False;
          pnlDiscount.Visible      := False;
          DmSys.cdsLineDiscounts.Edit;
         End;

     2 : Begin //Zonas...
          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          SetApp;
//          dbDate.Text := FormatDatetime('dd/mm/yyyy',JulianToDateTime(dmSys1.cdsLineSectionsxLinePrices.fieldByName('LP_DATE').AsInteger));
          tbtnApply.Enabled        := False;
          tbtnCancel.Enabled       := False;
          pnlZone.Visible := False;
          SetLineDT(False);
          DmSys1.cdsLineZonePrices.Edit;
          pnlBottomZone.Visible := True;
          dbdZoneDate.SetFocus;
         End;

     3 : Begin //Trechos...
//          HabilitaSecoes(DmSys.cdsLineDetails.FieldByName('LD_SECTIONSQTY').AsInteger);
          SetApp;
//          dbDate.Text := FormatDatetime('dd/mm/yyyy',JulianToDateTime(dmSys1.cdsLineSectionsxLinePrices.fieldByName('LP_DATE').AsInteger));
          tbtnApply.Enabled        := False;
          tbtnCancel.Enabled       := False;
          pn_trechos.Visible := False;
          SetLineDT(False);
          montaDBMemoria;
          DmSys.cdsLineDetailsXZones.Edit;
          salvaCodTrecho:=DmSys.cdsLineDetailsXZones.FieldByName('COD_TRECHO').AsString;  //cidel+
          pn_bottom_trechos.Visible := True;
          cb_trecho.SetFocus;
         End;

  End;
end;

Procedure TFrmLineMT.GetDateTime;
 Var TimeSta, TimeEnd, DateSta, DateEnd  : TDateTime;
     Hour, Min, Sec, MSec: Word;
Begin
  TimeSta := DmSys.cdsLineDiscounts.FieldByName('LDI_TIMESTART').AsDateTime;
  TimeEnd := dmsys.cdsLineDiscounts.FieldByName('LDI_TIMEEND').AsDateTime;
//  DateSta := dmsys.cdsLineDiscounts.FieldByName('LDI_DATESTART').AsDateTime;
//  DateEnd := dmsys.cdsLineDiscounts.FieldByName('LDI_DATEEND').AsDateTime;

  DecodeTime(TimeSta, Hour, Min, Sec, MSec);
  edHHIni.Value := Hour;
  edHMIni.Value := Min;

  DecodeTime(TimeEnd, Hour, Min, Sec, MSec);
  edHHFim.Value := Hour;
  edHMFim.Value := Min;

//  dbDataIni.Date := DateSta;
//  dbDataFim.Date := DateEnd;

End;

procedure TFrmLineMT.actDeletePriceExecute(Sender: TObject);
begin
  inherited;
  Case pcSecoes.ActivePageIndex of
      0 : Begin
            DMSYS1.cdsLinePrices.Edit;
            DMSYS1.cdsLinePrices.FieldByName('LP_STATUS').AsString := 'I';
            DMSYS1.cdsLinePrices.FieldByName('STATUS_ID').AsString := 'I';
          End;

      1 : Begin
            DmSys.cdsLineDiscounts.Edit;
            DmSys.cdsLineDiscounts.FieldByName('LDI_STATUS').AsString := 'I';
            DmSys.cdsLineDiscounts.FieldByName('STATUS_ID').AsString  := 'I';
          End;

      2 : Begin
            DmSys1.cdsLineZonePrices.Edit;
            DmSys1.cdsLineZonePrices.FieldByName('LZP_STATUS').AsString := 'I';
          End;

      3 : begin
            DmSys.cdsLineDetailsXZones.Edit;
            DmSys.cdsLineDetailsXZones.FieldByName('LDZN_STATUS').AsString := 'I';
            DmSys.cdsLineDetailsXZones.FieldByName('STATUS_ID').AsString := 'I';
            DmSys.cdsLineDetailsXZones.Post;
          end;
  End;
end;

Function TFrmLineMT.CheckPrices(pIda, pVolta : Char) : Boolean;
Begin
Result := False;
  If (pIda = 'C') or (pVolta = 'C') Then
     If ( (pIda = 'I') or (pVolta = 'I') ) Or
        ( (pIda = 'C') and (pVolta = 'C')) Then
         Result := True
End;


procedure TFrmLineMT.actOkPriceExecute(Sender: TObject);
Var
  Lp_date : TDateTime;
  vISS_ID, vAPP_ID : Variant;
  I : Integer;
begin
  inherited;
   If dmSys1.cdsLinePrices.FieldByName('LP_DATE').IsNull Then
      begin
        DisplayMsg(t_form_objects, '%T %T', [1567, 1501], []);
        dbDate.setfocus;
      End
   Else
   Begin

   if Trim(dbLkApplications.Text) <> '' then
   begin
     DmSys.cdsGeral.Close;
     DmSys.cdsGeral.CommandText := 'SELECT * FROM LINEPRICES WHERE LD_ID = '+dmSys1.cdsLinePrices.FieldByName('LD_ID').AsString+
                                   'AND LP_DATE <= '+Quotedstr(FormatDateTime('dd-mmm-yyyy',dbDate.Date))+' AND ISS_ID IS NULL AND APP_ID IS NULL';

     if dmSys1.cdsLinePrices.State = dsEdit then
       DmSys.cdsGeral.CommandText := DmSys.cdsGeral.CommandText + ' AND (LP_SEQNBR <> '+dmSys1.cdsLinePrices.FieldByName('LP_SEQNBR').AsString+' AND LP_DATE = '+Quotedstr(FormatDateTime('dd-mmm-yyyy',dbDate.Date))+')';

     DmSys.cdsGeral.Open;
     if DmSys.cdsGeral.Eof then
     begin
        DisplayMsg(t_form_objects, 'É necessário incluir um preço para todas as aplicações antes'+#13+
                                   ' de incluir um preço para uma aplicação específica   ', [], []);
        dbDate.setfocus;
        exit;
     end;
   end;


      if (Not dbLkApplications.Enabled)  then
   begin
     DmSys.cdsGeral.Close;
     DmSys.cdsGeral.CommandText := 'SELECT LP_SEQNBR FROM LINEPRICES WHERE LD_ID = '+dmSys1.cdsLinePrices.FieldByName('LD_ID').AsString+
                                   'AND LP_DATE = '+Quotedstr(FormatDateTime('dd-mmm-yyyy',dbDate.Date))+' AND ISS_ID IS NULL AND APP_ID IS NULL AND LP_BU_USEALTERNATEPRICE=1';
     DmSys.cdsGeral.Open;

     if not dmSys.cdsGeral.IsEmpty then
       dmSys1.cdsLinePrices.FieldByName('LP_SEQNBR').Value := dmSys.cdsGeral.FieldByName('LP_SEQNBR').AsInteger
     else
     begin
       dmSys1.cdsLinePrices.FieldByName('LP_SEQNBR').Value  := DmBase.ConnBrkBase.AppServer.SeqNbr_Prices(
                                                         dmSys1.cdsLinePrices.FieldByName('LD_ID').AsInteger,
                                                         FormatDateTime('DD-MMM-YYYY',dmSys1.cdsLinePrices.FieldByName('LP_DATE').AsDateTime))+ContrSeqPrices;
       ContrSeqPrices := ContrSeqPrices+1;
     end;

   end;
   if (dbLkApplications.Enabled) then
   begin
     DmSys.cdsGeral.Close;
     if Trim(dbLkApplications.Text) <> '' then
         DmSys.cdsGeral.CommandText := 'SELECT LP_SEQNBR FROM LINEPRICES WHERE LD_ID = '+dmSys1.cdsLinePrices.FieldByName('LD_ID').AsString+
                                       'AND LP_DATE = '+Quotedstr(FormatDateTime('dd-mmm-yyyy',dbDate.Date))+' AND ISS_ID IS NULL AND APP_ID IS NULL AND (LP_BU_USEALTERNATEPRICE=0 or LP_BU_USEALTERNATEPRICE is null)'

     else
         DmSys.cdsGeral.CommandText := 'SELECT LP_SEQNBR FROM LINEPRICES WHERE LD_ID = '+dmSys1.cdsLinePrices.FieldByName('LD_ID').AsString+
                                       'AND LP_DATE = '+Quotedstr(FormatDateTime('dd-mmm-yyyy',dbDate.Date))+' AND ISS_ID='+DmSys.cdsApplicationsLook.fieldByName('ISS_ID').AsString+'  AND APP_ID='+DmSys.cdsApplicationsLook.fieldByName('APP_ID').AsString+' AND (LP_BU_USEALTERNATEPRICE=0 or LP_BU_USEALTERNATEPRICE is null)';
     DmSys.cdsGeral.Open;

     if not dmSys.cdsGeral.IsEmpty then
       dmSys1.cdsLinePrices.FieldByName('LP_SEQNBR').Value := dmSys.cdsGeral.FieldByName('LP_SEQNBR').AsInteger
     else
     begin
        dmSys1.cdsLinePrices.FieldByName('LP_SEQNBR').Value  := DmBase.ConnBrkBase.AppServer.SeqNbr_Prices(
                                                          dmSys1.cdsLinePrices.FieldByName('LD_ID').AsInteger,
                                                          FormatDateTime('DD-MMM-YYYY',dmSys1.cdsLinePrices.FieldByName('LP_DATE').AsDateTime))+ContrSeqPrices;
        ContrSeqPrices := ContrSeqPrices+1;
     end;

   end;

   ChkIda   := 'V';
   ChkVolta := 'V';

   {Verifica a regra das seções disponíves. Pelo menos todas as seções Ida ou Volta devem estar preenchidas}
   For I := 0 to FrmLineMT.ComponentCount - 1 do
      Begin
         If Components[i].ClassType = TdbEdit Then
          Begin
              If Copy(components[i].Name,1,8) = 'dbeSecID' then
               If ( components[i].Name = 'dbeSecID01' ) And
                  ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text = '') Then
                  ChkIda := 'E'
               Else
               If ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text <> '') And
                  (ChkIda = 'V') Then
                  ChkIda := 'C'
               Else
               If ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text = '') And
                  (ChkIda <> 'E') Then
                  ChkIda := 'I'
               Else
               If ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text <> '') And
                  (ChkIda = 'I') Then
                  ChkIda := 'E';

            If Copy(components[i].Name,1,8) = 'dbeSecVT' then
               If ( components[i].Name = 'dbeSecVT01' ) And
                  ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text = '') Then
                  ChkVolta := 'E'
               Else
               If ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text <> '') And
                  (ChkVolta = 'V') Then
                  ChkVolta := 'C'
               Else
               If ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text = '') And
                  (ChkVolta <> 'E') Then
                  ChkVolta := 'I'
               Else
               If ( (components[i] as TdbEdit).Parent.Enabled = True) And
                  ( (components[i] as TdbEdit).Text <> '') And
                  (ChkVolta = 'I') Then
                  ChkVolta := 'E';
          End;
      End;

     {If Not CheckPrices(ChkIda, ChkVolta) Then
         Application.MessageBox('Os preços das seções disponíveis estão incompletos.','Erro', MB_OK+MB_ICONERROR)
      Else
      Begin}
         If dbLkApplications.KeyValue = NULL Then
         Begin
            dmSys1.cdsLinePrices.FieldByName('APP_ID').Value        := NULL;
            dmSys1.cdsLinePrices.FieldByName('ISS_ID').Value        := NULL;
            dmSys1.cdsLinePrices.FieldByName('APP_DESCSHORT').Value := NULL;
            dmSys1.cdsLinePrices.FieldByName('ISS_DESCSHORT').Value := NULL;
         End
         Else
         Begin
            dmSys1.cdsLinePrices.FieldByName('APP_ID').AsString        := DmSys.cdsApplicationsLook.fieldByName('APP_ID').AsString;
            dmSys1.cdsLinePrices.FieldByName('ISS_ID').AsString        := DmSys.cdsApplicationsLook.fieldByName('ISS_ID').AsString;
            dmSys1.cdsLinePrices.FieldByName('APP_DESCSHORT').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
            dmSys1.cdsLinePrices.FieldByName('ISS_DESCSHORT').AsString := DmSys.cdsApplicationsLook.fieldByName('ISS_DESCSHORT').AsString;
         End;

         dmSys1.cdsLinePrices.Post;
         pnlPrice.Visible   := True;
         tbtnApply.Enabled  := True;
         tbtnCancel.Enabled := True;
         SetLineDT(True);
         dmSys1.CreateLinePricesIndividual;
         plPriceOK.Visible  := False;
     {End;}
   End;
end;

procedure TFrmLineMT.actCancelPriceExecute(Sender: TObject);
begin
  inherited;
   dmSys1.cdsLinePrices.Cancel;
   plPriceOK.Visible     := False;
   pnlPrice.Visible := True;
   tbtnApply.Enabled     := True;
   tbtnCancel.Enabled    := True;
   SetLineDT(True);
end;

procedure TFrmLineMT.actOkDiscountExecute(Sender: TObject);
 Var TimeSta, TimeEnd  : TDateTime;
     I : Integer;
     Existe : Boolean;
begin
    if Trim(RxDBLookupCombo1.Text) = '' then
    begin
      Application.MessageBox('Tipo de desconto obrigatório','Aviso ao usuário', mb_OK+mb_ICONINFORMATION);
      exit;
    end;

    TimeSta := StrtoTime(FloattoStr(edHHini.Value)+':'+FloattoStr(edHMini.Value));
    TimeEnd := StrtoTime(FloattoStr(edHHFim.Value)+':'+FloattoStr(edHMFim.Value));


    dmSys.cdsLineDiscounts.FieldByname('LDI_TIMESTART').AsDateTime := StrtoDate('01/01/2003') + TimeSta;
    dmSys.cdsLineDiscounts.FieldByname('LDI_TIMEEND').AsDateTime   := StrtoDate('01/01/2003') + TimeEnd;


    If dbLkApplicationsDiscounts.KeyValue = NULL Then
    Begin
       DmSys.cdsLineDiscounts.FieldByName('APP_ID').Value  := NULL;
       dmSys.cdsLineDiscounts.FieldByName('ISS_ID').Value  := NULL;
       dmSys.cdsLineDiscounts.FieldByName('APP_DESCSHORT').Value := NULL;
       dmSys.cdsLineDiscounts.FieldByName('ISS_DESCSHORT').Value := NULL;
    End
    Else
    Begin
       dmSys.cdsLineDiscounts.FieldByName('APP_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_ID').AsString;
       dmSys.cdsLineDiscounts.FieldByName('ISS_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('ISS_ID').AsString;
       dmSys.cdsLineDiscounts.FieldByName('APP_DESCSHORT').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
       dmSys.cdsLineDiscounts.FieldByName('ISS_DESCSHORT').AsString := DmSys.cdsApplicationsLook.fieldByName('ISS_DESCSHORT').AsString;
    End;

  dmSys.cdsLineDiscounts.Post;
  pnlDiscount.Visible := True;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  SetLineDT(True);
  dmSys1.CreateLineDiscountsIndividual;
  plDiscountsOK.Visible := False;
end;

procedure TFrmLineMT.actCancelDiscountExecute(Sender: TObject);
begin
  inherited;
  dmSys.cdsLineDiscounts.Cancel;
  pnlDiscount.Visible := True;
  tbtnApply.Enabled   := True;
  tbtnCancel.Enabled  := True;
  SetLineDT(True);
  plDiscountsOK.Visible := False;
end;

procedure TFrmLineMT.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsLineMt;
  dbMemoria:=TStringList.Create;
end;

procedure TFrmLineMT.actNewSectionExecute(Sender: TObject);
begin
  SetLineDT(False);
//  nbSection.PageIndex := 1;
  tbtnApply.Enabled := False;
  tbtnCancel.Enabled := False;
  ActionInsertSys(DmSys1.cdsLineSections);
//  dbDescSec.SetFocus;
end;

procedure TFrmLineMT.actEditSectionExecute(Sender: TObject);
begin
  inherited;
  SetLineDT(False);
//  nbSection.PageIndex   := 1;
  tbtnApply.Enabled     := False;
  tbtnCancel.Enabled    := False;
  DmSys1.cdsLineSections.Edit;
//  dbDescSec.SetFocus;

end;

procedure TFrmLineMT.actDeleteSectionExecute(Sender: TObject);
begin
  inherited;
  DmSys1.cdsLineSections.Edit;
  DmSys1.cdsLineSections.FieldByName('LS_STATUS').AsString  := 'I';
  DmSys1.cdsLineSections.FieldByName('STATUS_ID').AsString  := 'I';
  DmSys1.cdsLineSections.Post;
end;

procedure TFrmLineMT.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '22';
  FrmSystemLog.pSLG_ID := DmSys.cdsLineMt.FieldByName('LM_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TFrmLineMT.edHHiniChange(Sender: TObject);
begin
  inherited;
 If Length(edHHini.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);

end;

procedure TFrmLineMT.edHMIniChange(Sender: TObject);
begin
  inherited;
 If Length(edHMIni.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);

end;

procedure TFrmLineMT.edHHFimChange(Sender: TObject);
begin
  inherited;
 If Length(edHHFim.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);

end;

procedure TFrmLineMT.edHMFimChange(Sender: TObject);
begin
  inherited;
 If Length(edHMFim.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);

end;

procedure TFrmLineMT.actOkZoneExecute(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if dbdZoneDate.Date = 0 then
  begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
       dbdZoneDate.SetFocus;
       exit;
  end;
  if not TryStrToInt(dbeSections.Text, i) then
  begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
       dbeSections.SetFocus;
       exit;
  end;

  If dblZoneApplication.KeyValue = NULL Then
  Begin
    dmSys1.cdsLineZonePrices.FieldByName('APP_ID').Value  := NULL;
    dmSys1.cdsLineZonePrices.FieldByName('ISS_ID').Value  := NULL;
    dmSys1.cdsLineZonePrices.FieldByName('APP_DESCSHORT').Value := NULL;
  End
  Else
  Begin
    dmSys1.cdsLineZonePrices.FieldByName('APP_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_ID').AsString;
    dmSys1.cdsLineZonePrices.FieldByName('ISS_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('ISS_ID').AsString;
    dmSys1.cdsLineZonePrices.FieldByName('APP_DESCSHORT').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
  End;
  dmSys1.cdsLineZonePrices.Post;
  pnlZone.Visible := True;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  SetLineDT(True);
  dmSys1.CreateLineZonePricesIndividual;
  pnlBottomZone.Visible := False;

end;

procedure TFrmLineMT.actCancelZoneExecute(Sender: TObject);
begin
  inherited;
  dmSys1.cdsLineZonePrices.Cancel;
  pnlZone.Visible := True;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  SetLineDT(True);
  pnlBottomZone.Visible := False;
end;

procedure TFrmLineMT.nbDetalhesPageChanged(Sender: TObject);
begin
  inherited;
  RepaintComponents( Self );
end;

procedure TFrmLineMT.actCancelTrechosExecute(Sender: TObject);
begin
  inherited;
  dmSys.cdsLineDetailsXZones.Cancel;
  pn_trechos.Visible := True;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  SetLineDT(True);
  pn_bottom_trechos.Visible := False;
end;

procedure TFrmLineMT.dbcbLpBUUseAlternatePriceClick(Sender: TObject);
begin
  inherited;
  if ((Sender as TDBCheckBox).Checked) then
  begin
    dbLkApplications.Value := '';
    dbLkApplications.Enabled := False;
    if dmSys1.dtsLinePrices.State in [dsEdit, dsInsert] then
    begin
      dmSys1.cdsLinePrices.FieldByName('ISS_ID').Value := null;
      dmSys1.cdsLinePrices.FieldByName('APP_ID').Value := null;
    end;
  end
  else
  begin
    dbLkApplications.Enabled := True;
  end;
end;

procedure TFrmLineMT.dbgDrawColumnCell(Sender: TObject;  //cidel+
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
IF Column.FieldName = 'DT_INICIO_VALID'
THEN (sender as TDBGrid).Columns[Column.Index].Title.Caption:='Validade Início';
IF Column.FieldName = 'DT_FIM_VALID'
THEN (sender as TDBGrid).Columns[Column.Index].Title.Caption:='Validade Fim';
IF Column.FieldName = 'PODER_COMPRA'
THEN (sender as TDBGrid).Columns[Column.Index].Title.Caption:='Poder de Compra';
IF Column.FieldName = 'COD_TRECHO'
THEN (sender as TDBGrid).Columns[Column.Index].Title.Caption:='Cod do Trecho';
end;

//APP_ID; APP_DESCSHORT;
//ISS_DESCLONG from issuers


procedure TFrmLineMT.btnSelectAplicacaoClick(Sender: TObject); //cidel+
begin
inherited;
IF FormSelectAplicacao.ShowModal = mrCancel THEN Exit;
{
DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([StrToInt(FormSelectAplicacao.EditAPP.Text),
                                                              StrToInt(FormSelectAplicacao.EditISS.Text)]),[]);

//dbLkApplications.KeyValue := StrToInt( DmSys.cdsApplicationsLook.fieldByname('APP_ID').AsString +
  //                                     DmSys.cdsApplicationsLook.fieldByname('ISS_ID').AsString );
dbLkApplications.KeyValue := StrToInt( FormSelectAplicacao.EditAPP.Text +
                                       DmSys.cdsApplicationsLook.fieldByname('ISS_ID').AsString );
}
if DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([StrToInt(FormSelectAplicacao.strAPP),
                                                                 StrToInt(FormSelectAplicacao.strISS)]), [])
then dbLkApplications.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger
else dbLkApplications.ClearValue;

end;

procedure TFrmLineMT.btnGrupoIntegracoesClick(Sender: TObject);
begin
  inherited;
IF EditGroupInte.Text = '' THEN Exit;
RxDBLookupCombo2.KeyValue := StrToInt(EditGroupInte.Text);
RxDBLookupCombo2.SetFocus;
end;

procedure TFrmLineMT.EditGroupInteKeyPress(Sender: TObject; var Key: Char); //cidel+
begin
inherited;
IF not(Key in ['0'..'9',#8,#22,#3,#24]) THEN BEGIN Key:=#0; Beep; END;
end;

procedure TFrmLineMT.EditGroupInteKeyDown(Sender: TObject; var Key: Word;  //cidel+
  Shift: TShiftState);
begin
inherited;
IF EditGroupInte.Text = '' THEN Exit;
IF key = VK_RETURN THEN btnGrupoIntegracoes.Click;
end;

procedure TFrmLineMT.dbg_trechosDblClick(Sender: TObject);
begin
  inherited;
IF tb_editar_trecho.Enabled THEN tb_editar_trecho.Click;
end;

procedure Cor(Sender: TObject; cor: TColor);
begin
IF Sender is TRxDBLookupCombo THEN (Sender as TRxDBLookupCombo).Color:=cor;
IF Sender is TDBDateEdit THEN (Sender as TDBDateEdit).Color:=cor;
IF Sender is TDBEdit THEN (Sender as TDBEdit).Color:=cor;
end;

{procedure TFrmLineMT.pcSecoesDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  inherited;
IF Active THEN Control.Canvas.Brush.Color:=clYellow
          ELSE Control.Canvas.Brush.Color:=clWindow;
Control.Canvas.FillRect(Rect);
end;  }
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function TFrmLineMT.temCodTrecho: Boolean;
Var filtro,S: String;
begin
inherited;
Result:=false; Exit;
// Filter = ldzn_status = 'A'
WITH DmSys.cdsLineDetailsXZones
DO BEGIN
   S:= QuotedStr(FieldByName('LDZN_DATE').AsString);
   filtro:='LD_ID = '+FieldByName('LD_ID').AsString+' and '+
           'LDZN_DATE = '+S+' and '+
           'COD_TRECHO = '+FieldByName('COD_TRECHO').AsString;

   S:=FieldByName('ISS_ID').AsString;
   IF S <> '' THEN filtro:=filtro+'and '+S;

   S:=FieldByName('APP_ID').AsString;
   IF S <> '' THEN filtro:=filtro+'and '+S;
   END;

WITH DmSys.ClientDataSet1
DO BEGIN
   CommandText:='SELECT * FROM LineDetailsXZones WHERE '+filtro;
   InputBox('SQL','SQL',CommandText);
   Open;
   temCodTrecho:=RecordCount > 0;
   Close;
   END;
{
DmSys.ClientDataSet1.CommandText:='SELECT * FROM LineDetailsXZones WHERE '+filtro;
//ShowMessage(filtro);
//DmSys.ClientDataSet1.Filter:=filtro;
DmSys.ClientDataSet1.Open;
temCodTrecho:=DmSys.ClientDataSet1.RecordCount > 0;
DmSys.ClientDataSet1.Close;
}
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineMT.ActOkTrechosExecute(Sender: TObject);
Var I: Integer;
begin
  inherited;
  if cb_aplicacao_trecho.KeyValue = NULL then
  begin
    DmSys.cdsLineDetailsXZones.FieldByName('APP_ID').Value  := NULL;
    DmSys.cdsLineDetailsXZones.FieldByName('ISS_ID').Value  := NULL;
  end
  else
  begin
    DmSys.cdsLineDetailsXZones.FieldByName('APP_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('APP_ID').AsString;
    DmSys.cdsLineDetailsXZones.FieldByName('ISS_ID').AsString := DmSys.cdsApplicationsLook.fieldByName('ISS_ID').AsString;
  end;

  DmSys.cdsLineDetailsXZones.FieldByName('ZNL_DESCSHORT_ORIG').AsString := DmSys.cdsZones.FieldByName('ZNL_DESCSHORT_ORIG').AsString;
  DmSys.cdsLineDetailsXZones.FieldByName('ZNL_DESCSHORT_DEST').AsString := DmSys.cdsZones.FieldByName('ZNL_DESCSHORT_DEST').AsString;

  // Verificação de duplicidade cidel
  //ShowMessage('salva = '+salvaCodTrecho+#13+
    //          'banco = '+DmSys.cdsLineDetailsXZones.FieldByName('COD_TRECHO').AsString);

  IF DmSys.cdsLineDetailsXZones.FieldByName('COD_TRECHO').AsString <> salvaCodTrecho THEN
  IF dbMemoria.IndexOf(DmSys.cdsLineDetailsXZones.FieldByName('LDZN_DATE').AsString+';'+
                       DmSys.cdsLineDetailsXZones.FieldByName('COD_TRECHO').AsString) > -1
  THEN BEGIN
       ShowMessage('ERRO: Código de Trecho já usado');
       Exit;
       END;
  DmSys.cdsLineDetailsXZones.Post;

  salvaCodTrecho:=DmSys.cdsLineDetailsXZones.FieldByName('COD_TRECHO').AsString; //ancora
  pn_trechos.Visible := True;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  SetLineDT(True);
//IGOR  dmSys1.CreateLineZonePricesIndividual;
  pn_bottom_trechos.Visible := False;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineMT.montaDBMemoria;
Var I: Integer;
begin
WITH DmSys.cdsLineDetailsXZones
DO BEGIN
   I:=RecNo;
   First;
   dbMemoria.Clear;
   WHILE not EOF
   DO BEGIN
      dbMemoria.Add( FieldByName('LDZN_DATE').AsString+';'+
                     FieldByName('COD_TRECHO').AsString);
      Next;
      END;
   RecNo:=I;
   END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineMT.lbFiltradoClick(Sender: TObject);
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
procedure TFrmLineMT.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmLineMT.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmLineMT.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmLineMT.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineMT.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.

