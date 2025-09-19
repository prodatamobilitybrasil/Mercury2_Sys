unit uMasterApplications;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls;

type
  TFrmMasterApp = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    edCodigo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edDesc: TEdit;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    Label1: TLabel;
    dbCodigo: TDBEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    lblStatusCardUsers: TLabel;
    dbDesc: TDBEdit;
    dbCardUsersStatus: TRxDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
  private
     Procedure SetDetail;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMasterApp: TFrmMasterApp;

implementation

uses uDmSys, AppSparkSysMain, uConst, uGeralFunctions , uDmConexao,
  uFrmBaseCadastro, uFrmSystemLog;

{$R *.dfm}

procedure TFrmMasterApp.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsMasterApp]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('MA_ID', 'FROM MASTERAPPLICATIONS', 'True', ' WHERE MA_STATUS = ''A'' ') ) + ' Registro(s)';

    SetActions([actLog], DmSys.cdsMasterApp.RecordCount > 0, FrmMasterApp, t_form_objects)
end;

procedure TFrmMasterApp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsMasterApp]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsMasterApp.CommandText := 'SELECT '+ ccardMasterApp +' From MASTERAPPLICATIONS where MA_STATUS = ''A'' ORDER BY MA_ID';
    FrmMasterApp := Nil;
end;

procedure TFrmMasterApp.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsMasterApp);
  SetActions([], False, FrmMasterApp, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmMasterApp, t_form_objects);
  SetDetail;
  dbCodigo.SetFocus;
end;

procedure TFrmMasterApp.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmMasterApp, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmMasterApp, t_form_objects);
  SetDetail;
  dbDesc.SetFocus;  
end;

procedure TFrmMasterApp.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbCodigo, dbDesc], [DmSys.cdsMasterApp]) Then
         begin
          SetActions([], True, FrmMasterApp, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmMasterApp, t_form_objects);
          actRefresh.Execute;
         end;
    END;
  actLog.Enabled := True
end;

procedure TFrmMasterApp.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsMasterApp.Cancel;
     SetActions([], True, FrmMasterApp, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmMasterApp, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

  actLog.Enabled := DmSys.cdsMasterApp.RecordCount > 0
end;

procedure TFrmMasterApp.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsMasterApp.Edit;
         cdsMasterApp.FieldByName('MA_STATUS').AsString := 'I';
         cdsMasterApp.Post;
         cdsMasterApp.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

  actLog.Enabled := DmSys.cdsMasterApp.RecordCount > 0
end;

procedure TFrmMasterApp.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edCodigo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' MA_ID = ' + QuotedStr(edCodigo.Text) + ' AND ';
       end;

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' MA_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' MA_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' MA_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsMasterApp.Close;
      cdsMasterApp.CommandText := 'SELECT '+ ccardMasterApp +' From MASTERAPPLICATIONS ' + strWhere + 'ORDER BY MA_ID';
      cdsMasterApp.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('MA_ID', 'FROM MASTERAPPLICATIONS', 'True', strWhere) ) + ' Registro(s)';
    end;

  actLog.Enabled := DmSys.cdsMasterApp.RecordCount > 0
end;

procedure TFrmMasterApp.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmMasterApp, t_form_objects);
      SetDetail;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmMasterApp, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

Procedure TFrmMasterApp.SetDetail;
Begin
  dbCodigo.Enabled := (status = stInsert);
End;

procedure TFrmMasterApp.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsMasterApp;
end;

procedure TFrmMasterApp.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '4';
  FrmSystemLog.pSLG_ID := DmSys.cdsMasterApp.FieldByName('MA_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

end.
