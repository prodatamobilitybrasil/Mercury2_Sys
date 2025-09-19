unit uHotlistReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, ToolEdit;

type
  TFrmHotlistReason = class(TFrmBaseSys)
    dbDesc: TDBEdit;
    dbType: TRxDBComboBox;
    dbAction: TRxDBComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDesc: TEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHotlistReason: TFrmHotlistReason;

implementation

uses AppSparkSysMain, uConst, uDmConexao, uDmSys, uGeralFunctions,
  uFrmBaseCadastro, uFrmSystemLog;

{$R *.dfm}

procedure TFrmHotlistReason.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys.cdsHotListReason]);
//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('HLR_ID', 'FROM HOTLISTREASON', 'True', '') ) + ' Registro(s)';
//    actLog.Enabled := DmSys.cdsHotListReason.RecordCount > 0
  tbtnFiltrar.Click;
end;

procedure TFrmHotlistReason.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsHotListReason]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
//    DmSys.cdsIssuers.CommandText := 'SELECT '+ ccardIssuers +' From ISSUERS WHERE ISS_STATUS = ''A'' ORDER BY ISS_ID';
    FrmHotlistReason := Nil;

end;

procedure TFrmHotlistReason.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsHotListReason);
  SetActions([], False, FrmHotlistReason, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmHotlistReason, t_form_objects);
  dbDesc.SetFocus;

end;

procedure TFrmHotlistReason.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmHotlistReason, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmHotlistReason, t_form_objects);
  dbDesc.SetFocus;

end;

procedure TFrmHotlistReason.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';
  strWhere := ' WHERE HLR_ID < 99 AND HLR_STATUS  = ' + QuotedStr('A');

  If Trim(edDesc.Text) <> '' then
    strWhere := ' WHERE HLR_ID < 99 AND HLR_STATUS  = ' + QuotedStr('A') + ' AND HLR_DESC LIKE ' + QuotedStr(edDesc.Text + '%');

  with DmSys do
    begin
      cdsHotListReason.Close;
      cdsHotListReason.CommandText := 'SELECT HLR.*, HLR_STATUS AS STATUS_ID, HLR_TYPE AS TYPE_DESC, HLR_ACTION AS ACTION_DESC FROM HOTLISTREASON HLR ' + strWhere + ' ORDER BY HLR_DESC';
      cdsHotListReason.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('HLR_ID', 'FROM HOTLISTREASON', 'True', strWhere) ) + ' Registro(s)';
    end;
  actLog.Enabled := DmSys.cdsHotListReason.RecordCount > 0
end;

procedure TFrmHotlistReason.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc, dbType, dbAction], [DmSys.cdsHotListReason]) Then
         begin
          SetActions([], True, FrmHotlistReason, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmHotlistReason, t_form_objects);
          actRefreshExecute(nil);
         end;
    END;
  actLog.Enabled := DmSys.cdsHotListReason.RecordCount > 0
end;

procedure TFrmHotlistReason.actCancelExecute(Sender: TObject);
begin
  inherited;
  if status = stConsult then
    begin
     dmSys.cdsHotListReason.Cancel;
     SetActions([], True, FrmHotlistReason, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmHotlistReason, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsHotListReason.RecordCount > 0
end;

procedure TFrmHotlistReason.actDeleteExecute(Sender: TObject);
begin
//  inherited;
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
    dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys do
        Begin
         cdsHotListReason.Edit;
         cdsHotListReason.FieldByName('HLR_STATUS').AsString := 'I';
         cdsHotListReason.Post;
         cdsHotListReason.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
 actLog.Enabled := DmSys.cdsHotListReason.RecordCount > 0
end;

procedure TFrmHotlistReason.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmHotlistReason, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmHotlistReason, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmHotlistReason.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '19';
  FrmSystemLog.pSLG_ID := DmSys.cdsHotListReason.FieldByName('HLR_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

end.
