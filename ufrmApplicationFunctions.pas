unit ufrmApplicationFunctions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Buttons, Mask, DBCtrls, RxDBComb,
  ToolEdit, RXDBCtrl, RXSpin, UConst;

type
  TfrmApplicationFunction = class(TFrmBaseSys)
    Label1: TLabel;
    edDesc: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    pcDetail: TPageControl;
    TabSheet1: TTabSheet;
    grdObjects: TDBGrid;
    cbDetail: TCoolBar;
    tbDetail: TToolBar;
    tbtnEditDetail: TToolButton;
    tbtnNewDetail: TToolButton;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actDeletDetail: TAction;
    Label15: TLabel;
    Label33: TLabel;
    dbedtVersionValidity: TDBDateEdit;
    Label45: TLabel;
    dbedtVersionStatus: TRxDBComboBox;
    btnOkVersion: TSpeedButton;
    SpeedButton12: TSpeedButton;
    actNewVersionOk: TAction;
    ToolButton1: TToolButton;
    DBEdit1: TDBEdit;
    actCancelBtn: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actNewVersionOkExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actDeletDetailExecute(Sender: TObject);
    procedure actCancelBtnExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    Status         : t_Status;
  public
    { Public declarations }
  end;

var
  frmApplicationFunction: TfrmApplicationFunction;

implementation
Uses
  uDmSys, AppSparkSysMain, uDmConexao, uGeralFunctions, uFrmBaseCadastro,
  DBClient;

{$R *.dfm}


procedure TfrmApplicationFunction.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys ([dmSys.cdsApplicationFunctions, DmSys.cdsApplicationFunctionVersions]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( DmSys.cdsApplicationFunctions.RecordCount) + ' Registro(s)';
  actLog.Enabled := DmSys.cdsApplicationFunctions.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;

procedure TfrmApplicationFunction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys ([dmSys.cdsApplicationFunctions, DmSys.cdsApplicationFunctionVersions]);
  //FrmApplicationFunction := Nil;

 // CloseTablesSys([(dtsMaster.DataSet as TClientDataSet)]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  FrmApplicationFunction := Nil;
  Action := caFree;


end;

procedure TfrmApplicationFunction.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsApplicationFunctions;
//  SetCCAActions([], False, Self);
//  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);

end;

procedure TfrmApplicationFunction.actFilterExecute(Sender: TObject);
var
  strWhere : string;
begin
  inherited;
  strWhere  := '';

  If Trim(edDesc.Text) <> '' then
    strWhere := '  WHERE AF_STATUS = ' + QuotedStr('A') + ' AND AF_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
  Else
    strWhere := '  WHERE AF_STATUS = ' + QuotedStr('A');

  with DmSys do
    begin
      cdsApplicationFunctions.Close;
      cdsApplicationFunctions.CommandText := 'SELECT *  FROM APPLICATIONFUNCTIONS '  + strWhere +  '   ORDER BY AF_DESC';
      cdsApplicationFunctions.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('AF_ID', 'FROM APPLICATIONFUNCTIONS', 'True', strWhere) ) + ' Registro(s)';
    end
end;

procedure TfrmApplicationFunction.actNewDetailExecute(Sender: TObject);
begin
  inherited;
  if DmSys.cdsApplicationFunctionVersions.RecordCount < 16 then
  DmSys.cdsApplicationFunctionVersions.append
  else exit;

  DmSys.cdsApplicationFunctionVersions.FieldByName('AFV_VERSIONNBR').Value :=
      dmConexao.ConnBrkMaster.AppServer.AutoIncremento('APPLICATIONFUNCTIONVERSIONS','AFV_VERSIONNBR', 'True', ' AF_ID =' + DmSys.cdsApplicationFunctionS.fieldByName('AF_ID').AsString);

  DmSys.cdsApplicationFunctionVersions.FieldByName('AFV_STATUS').Value := 'A';

  If pcDetail.ActivePageIndex = 0 then
   begin
     grdObjects.Visible := False;
//     FillObjectLists;
   end;
  actNewDetail.Enabled := False;
  acteditDetail.Enabled := False;
  actApplyUpdates.Enabled := true;
  actCancel.Enabled := False;
end;

procedure TfrmApplicationFunction.actNewVersionOkExecute(Sender: TObject);
begin
  DmSys.cdsApplicationFunctionVersions.Post;
  actNewDetail.Enabled := true;
  acteditDetail.Enabled := true;
  actCancel.Enabled := False;
  grdObjects.Visible := true;
  if not actApplyUpdates.Enabled then actApplyUpdates.Enabled:= true;
end;

procedure TfrmApplicationFunction.actApplyUpdatesExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1511], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     Try
       dmConexao.ConnBrkMaster.AppServer.StartTransaction;

       DmSys.cdsApplicationFunctionVersions.ApplyUpdates(0);
       actApplyUpdates.Enabled := false;
       status := stConsult;
       FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);

       dmConexao.ConnBrkMaster.AppServer.Commit;
     Except
       dmConexao.ConnBrkMaster.AppServer.RollBack;
     End;
//     pcBaseCadastro.ActivePageIndex := 0;
   End;
   DmSys.cdsApplicationFunctionVersions.Close;
   DmSys.cdsApplicationFunctionVersions.Open;
   actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
   pcBaseCadastroChange(pcBaseCadastro);
end;

procedure TfrmApplicationFunction.actDeletDetailExecute(Sender: TObject);
begin
  with DmSys.cdsApplicationFunctionVersions do
  if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  begin
    edit;
    FieldByName('AFV_STATUS').asString := 'I';
    post;
//    ApplyUpdates(0);
    if not actApplyUpdates.Enabled then actApplyUpdates.Enabled:= true;
//    close;
//    Open;
  end;
end;

procedure TfrmApplicationFunction.actCancelBtnExecute(Sender: TObject);
begin
  DmSys.cdsApplicationFunctionVersions.cancel;
  actNewDetail.Enabled := true;
  acteditDetail.Enabled := true;
  actCancel.Enabled := False;
  grdObjects.Visible := true;
  if not actApplyUpdates.Enabled then actApplyUpdates.Enabled:= true;
end;

procedure TfrmApplicationFunction.actEditDetailExecute(Sender: TObject);
begin
  If pcDetail.ActivePageIndex = 0 then
  begin
     grdObjects.Visible := False;
//     FillObjectLists;
  end;
  actNewDetail.Enabled := False;
  acteditDetail.Enabled := False;
  actCancel.Enabled := False;
end;

procedure TfrmApplicationFunction.pcBaseCadastroChange(Sender: TObject);
begin
  SetCCAActions([actInsert, actDelete, actEdit], False, Self);

  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetCCAActions([actFilter, actRefresh], False, Self);
       SetCCAActions([actExit, actEdit], true, Self);
      if not (dmSys.cdsApplicationFunctionVersions.State in [dsEdit, dsInsert]) then
      begin
        SetCCAActions([actApplyUpdates, actCancel], False, Self);
      end;
     End
  Else
    Begin
      SetCCAActions([actFilter, actRefresh, actExit], True, Self);
    End;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TfrmApplicationFunction.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbDesc.setfocus;
end;

procedure TfrmApplicationFunction.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys((dtsMaster.DataSet as TClientDataSet));
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbDesc.SetFocus;

end;

procedure TfrmApplicationFunction.actCancelExecute(Sender: TObject);
begin
 // inherited;
  If DisplayMsg(t_form_objects, 'Confirma o cancelamento da edição do registro?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Status := stConsult;
     dtsMaster.DataSet.Cancel;
     (dtsMaster.DataSet as TClientDataSet).CancelUpdates;
     SetCCAActions([], True, Self);
     SetCCAActions([actApplyUpdates, actCancel], False, Self);
     pcBaseCadastro.ActivePageIndex := 0;
     actRefresh.Execute;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0

end;

procedure TfrmApplicationFunction.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if dtsMaster.DataSet.FieldByName('AF_STATUS').AsString = 'A' then
  begin
    If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dtsMaster.DataSet.Edit;
      dtsMaster.DataSet.FieldByName('AF_STATUS').AsString := 'I';
      dtsMaster.DataSet.Post;
      (dtsMaster.DataSet as TClientDataSet).ApplyUpdates(-1);
      tbtnRefresh.Click;
      FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end; //With...
  end
  else
    DisplayMsg(t_form_objects, 'ATENÇÃO: Esse registro já está desativado!   ', [], [], mtConfirmation, [mbOk]);

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0

end;

end.




