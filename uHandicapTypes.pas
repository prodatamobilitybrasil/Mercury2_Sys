unit uHandicapTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RXCtrls;

type
  TFrmHandicapTypes = class(TFrmBaseSys)
    dbName: TDBEdit;
    dbDesc: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    edName: TEdit;
    Label3: TLabel;
    edDesc: TEdit;
    Label4: TLabel;
    DBINTCODE: TDBEdit;
    Label5: TLabel;
    DBVALIDITY: TDBEdit;
    Label6: TLabel;
    DBOBS: TDBMemo;
    CHKPERMITATTENDANT: TCheckBox;
    CHKAUTHORIZED: TCheckBox;
    Label7: TLabel;
    lbFiltrado: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure PreencheCheckBoxes;
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHandicapTypes: TFrmHandicapTypes;

implementation

uses uDmSys, AppSparkSysMain, uDmConexao, uConst, uGeralFunctions,
     uFrmBaseCadastro, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmHandicapTypes.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmHandicapTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsHandicapTypes]);
//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('HT_ID', 'FROM HANDICAPTYPES', 'True', '') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsHandicapTypes.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmHandicapTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsHandicapTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmHandicapTypes := Nil;

end;

procedure TFrmHandicapTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsHandicapTypes);
  SetActions([], False, FrmHandicapTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmHandicapTypes, t_form_objects);
  dbName.SetFocus;

end;



procedure TFrmHandicapTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmHandicapTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmHandicapTypes, t_form_objects);
  dbName.SetFocus;

end;

procedure TFrmHandicapTypes.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere := '';
  strWhere := ' WHERE HT_STATUS  = ' + QuotedStr('A');

  If Trim(edName.Text) <> '' then
    strWhere := ' WHERE HT_STATUS  = ' + QuotedStr('A') + ' AND HT_NAME LIKE ' + QuotedStr(edName.Text + '%');

  If Trim(edDesc.Text) <> '' then
   begin
     If strWhere = '' then
       strWhere := ' WHERE HT_STATUS  = ' + QuotedStr('A') + ' AND HT_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
     Else
       strWhere := strWhere + ' AND HT_DESC LIKE ' + QuotedStr(edDesc.Text + '%');
   end;
{  Else
   begin
     strWhere := ' WHERE HT_STATUS  = ' + QuotedStr('A');
   end; }

  with DmSys do
    begin
      cdsHandicapTypes.Close;
      cdsHandicapTypes.CommandText := 'SELECT * From HANDICAPTYPES ' + strWhere + 'ORDER BY HT_NAME';
      cdsHandicapTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr(dmConexao.ConnBrkMaster.AppServer.GetDBCount
                 ('HT_ID', 'FROM HANDICAPTYPES', 'True', strWhere)) +
                    ' Registro(s)';
    end

end;

procedure TFrmHandicapTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 if CHKPERMITATTENDANT.Checked then
   dtsMaster.DataSet.FieldByName('HT_PERMITATTENDANT').AsInteger := 1
 else
   dtsMaster.DataSet.FieldByName('HT_PERMITATTENDANT').AsInteger := 0;

 if CHKAUTHORIZED.Checked then
   dtsMaster.DataSet.FieldByName('HT_AUTHORIZED').AsInteger := 1
 else
   dtsMaster.DataSet.FieldByName('HT_AUTHORIZED').AsInteger := 0;

 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbName, dbDesc], [DmSys.cdsHandicapTypes]) Then
         begin
           SetActions([], True, FrmHandicapTypes, t_form_objects);
           SetActions([actApplyUpdates, actCancel], False, FrmHandicapTypes, t_form_objects);
           tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmHandicapTypes.actCancelExecute(Sender: TObject);
begin
  inherited;
  if Status = stConsult then
    begin
     dmSys.cdsHandicapTypes.Cancel;
     SetActions([], True, FrmHandicapTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmHandicapTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

end;

procedure TFrmHandicapTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
    dmConexao.ConnBrkMaster.AppServer.StartTransaction;
    with DmSys do
       Begin
        cdsHandicapTypes.Edit;
        cdsHandicapTypes.FieldByName('HT_STATUS').AsString := 'I';
        cdsHandicapTypes.Post;
        cdsHandicapTypes.ApplyUpdates(-1);
        dmConexao.ConnBrkMaster.AppServer.Commit;
        tbtnRefresh.Click;
       End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmHandicapTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsHandicapTypes;
end;

procedure TFrmHandicapTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      PreencheCheckBoxes;
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmHandicapTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmHandicapTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmHandicapTypes.PreencheCheckBoxes;
begin
      if (dtsMaster.DataSet.FieldByName('HT_PERMITATTENDANT').AsInteger = 1) then
        CHKPERMITATTENDANT.Checked := True
      else
        CHKPERMITATTENDANT.Checked := False;

      if (dtsMaster.DataSet.FieldByName('HT_AUTHORIZED').AsInteger = 1) then
        CHKAUTHORIZED.Checked := True
      else
        CHKAUTHORIZED.Checked := False;
end;

procedure TFrmHandicapTypes.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmHandicapTypes.Sai(Sender: TObject); begin FM_Sai(Sender); end;

end.
