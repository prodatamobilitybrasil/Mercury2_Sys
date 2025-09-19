unit uFrmObjectTranslation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxLookup, Buttons;

type
  TFrmObjectTranslation = class(TFrmBaseSys)
    edDesc: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    cbItems: TCoolBar;
    tbItems: TToolBar;
    tbtnNewDetail: TToolButton;
    tbtnEditDetail: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    Panel3: TPanel;
    grdItems: TDBGrid;
    grdLanguages: TDBGrid;
    actNewItem: TAction;
    actEditItem: TAction;
    actDeleteItem: TAction;
    actNewLanguage: TAction;
    actEditLanguage: TAction;
    actDeleteLanguage: TAction;
    Panel4: TPanel;
    Label3: TLabel;
    dbOtdDesc: TDBEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel7: TPanel;
    dblkLanguage: TRxDBLookupCombo;
    Label14: TLabel;
    dbOtdLngFieldDesc: TDBEdit;
    Label4: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    actItemOk: TAction;
    actItemCancel: TAction;
    actLanguageOk: TAction;
    actLanguageCancel: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actNewItemExecute(Sender: TObject);
    procedure actEditItemExecute(Sender: TObject);
    procedure actDeleteItemExecute(Sender: TObject);
    procedure actNewLanguageExecute(Sender: TObject);
    procedure actEditLanguageExecute(Sender: TObject);
    procedure actDeleteLanguageExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actItemOkExecute(Sender: TObject);
    procedure actItemCancelExecute(Sender: TObject);
    procedure actLanguageOkExecute(Sender: TObject);
    procedure actLanguageCancelExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmObjectTranslation: TFrmObjectTranslation;

implementation

uses AppSparkSysMain, uConst, uDataBaseFunctions, uDmConexao, uDmSys1,
  uGeralFunctions, uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmObjectTranslation.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsObjectTranslationMT;
end;

procedure TFrmObjectTranslation.actNewItemExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actEditItemExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actDeleteItemExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actNewLanguageExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actEditLanguageExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actDeleteLanguageExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsObjectTranslationMT]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('OTM_ID', 'FROM OBJECTTRANSLATIONMT', 'False', '') ) + ' Registro(s)';
  grdItems.Align := alClient;
  grdLanguages.Align := alClient;

  SetActions([actNewLanguage, actEditLanguage, actDeleteLanguage, actNewItem, actEditItem, actDeleteItem], False, FrmObjectTranslation,  t_form_objects);
end;

procedure TFrmObjectTranslation.actItemOkExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actItemCancelExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actLanguageOkExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.actLanguageCancelExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmObjectTranslation.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsObjectTranslationMT]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmObjectTranslation := Nil;

end;

procedure TFrmObjectTranslation.actInsertExecute(Sender: TObject);
begin
  inherited;
{  ActionInsertSys(DmSys1.cdsObjectTranslationMT);
  DmSys1.cdsObjects.FieldByName('OBJ_ID').AsInteger := -1;
  SetActions([actInsert, actEdit, actDelete, actRefresh, actFilter, actExit], False, FrmObjects, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewLanguage, actNewForm], true, FrmObjects, t_form_objects);

  SetActions([actEditForm], not ( dmSys1.cdsFormsXObjects.IsEmpty ), FrmObjects, t_form_objects);
  SetActions([actEditLanguage, actDelLanguage], not ( dmSys1.cdsObjectsXLanguages.IsEmpty ), FrmObjects, t_form_objects);
  dbName.SetFocus;  {}
end;

end.
