unit uSoftwares;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Buttons, RxLookup, Mask, DBCtrls,
  ToolEdit, RXDBCtrl, RXSpin;

type
  TFrmSoftwares = class(TFrmBaseSys)
    dlgOpenFile: TOpenDialog;
    gbSoftware: TGroupBox;
    dbCod: TDBEdit;
    dbDesc: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbTipo: TRxDBLookupCombo;
    Label3: TLabel;
    dbPath: TDBEdit;
    Label4: TLabel;
    btnOpenFile: TSpeedButton;
    pgcVersions: TPageControl;
    cbDetails: TCoolBar;
    tbDetails: TToolBar;
    tbtnNewVersion: TToolButton;
    tbtnEditVersion: TToolButton;
    tbtnDeleteVersion: TToolButton;
    TabSheet1: TTabSheet;
    btDisplayOK: TSpeedButton;
    btDisplayCancel: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbVersionDesc: TDBEdit;
    dbVersionEndDate: TDBDateEdit;
    dbVersionStartdate: TDBDateEdit;
    dbVersionPath: TDBEdit;
    dbgVersions: TDBGrid;
    dbMajorVersion: TDBEdit;
    dbMinorVersion: TDBEdit;
    dbRelease: TDBEdit;
    dbBuild: TDBEdit;
    edCod: TEdit;
    Sigla: TLabel;
    Label5: TLabel;
    edDesc: TEdit;
    actNewVersion: TAction;
    actEditVersion: TAction;
    actDeleteVersion: TAction;
    actOpenFile: TAction;
    actOkVersion: TAction;
    actCancelVersion: TAction;
    procedure FormShow(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure tbtnNewVersionClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btDisplayCancelClick(Sender: TObject);
    procedure btDisplayOKClick(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure tbtnDeleteVersionClick(Sender: TObject);
    procedure tbtnEditVersionClick(Sender: TObject);
    procedure actNewVersionExecute(Sender: TObject);
    procedure actEditVersionExecute(Sender: TObject);
    procedure actDeleteVersionExecute(Sender: TObject);
    procedure actOpenFileExecute(Sender: TObject);
    procedure actOkVersionExecute(Sender: TObject);
    procedure actCancelVersionExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
     procedure SetDetail;
     Procedure BeforePost;
  public
    { Public declarations }
  end;

var
  FrmSoftwares: TFrmSoftwares;

implementation

uses uDmConexao, uDmSys1, AppSparkSysMain, uConst, uGeralFunctions,
  uFrmSystemLog, Aguarde;

{$R *.dfm}

procedure TFrmSoftwares.SetDetail;
Begin
   If Status = stInsert Then
      Begin
       gbSoftware.Enabled    := True;
       pgcVersions.Enabled   := False;
       tbDetails.Enabled := False;
      End
   Else
      Begin
       pgcVersions.Enabled  := False;
       gbSoftware.Enabled   := False;
       tbDetails.Enabled := False;
         IF Status = stEdit Then
            Begin
             pgcVersions.Enabled := True;
             gbSoftware.Enabled  := True;
             tbDetails.Enabled := True;
            End;
      End;

   SetActions([actEditVersion, actDeleteVersion], NOT (DmSys1.cdsSoftwareVersions.RecordCount = 0), Self, t_form_objects);

End;


procedure TFrmSoftwares.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys1.cdsSoftwares]);
    OpenTablesSys([DmSys1.cdsSoftwareTypes, DmSys1.cdsSoftwareVersions]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SF_ID', 'FROM SOFTWARES', 'True', '') ) + ' Registro(s)';
    Status := stConsult;
    SetDetail;
    dbgVersions.Align := alClient;
    actLog.Enabled := dmSys1.cdsSoftwares.RecordCount > 0
end;

procedure TFrmSoftwares.btnOpenFileClick(Sender: TObject);
begin
  inherited;
  If dlgOpenFile.Execute then
   begin
     dbPath.Text := dlgOpenFile.FileName;
   end;
end;

procedure TFrmSoftwares.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys1.cdsSoftwares, DmSys1.cdsSoftwareVersions]);
    FrmSoftwares := Nil;

end;

procedure TFrmSoftwares.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsSoftwares);
  SetActions([], False, FrmSoftwares, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmSoftwares, t_form_objects);
  SetDetail;
  dbCod.SetFocus;

end;

procedure TFrmSoftwares.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmSoftwares, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmSoftwares, t_form_objects);
  SetDetail;
  dbCod.SetFocus;
end;

Procedure TFrmSoftwares.BeforePost;
Begin
  If not Dmsys1.cdsSoftwareVersions.IsEmpty then
   begin
     Dmsys1.cdsSoftwareVersions.First;

     While not Dmsys1.cdsSoftwareVersions.Eof do
      begin
        If Dmsys1.cdsSoftwareVersions.FieldByName('SF_ID').AsInteger <> Dmsys1.cdsSoftwares.FieldByName('SF_ID').AsInteger then
         begin
           Dmsys1.cdsSoftwareVersions.Edit;
           Dmsys1.cdsSoftwareVersions.FieldByName('SF_ID').AsInteger := Dmsys1.cdsSoftwares.FieldByName('SF_ID').AsInteger;
           Dmsys1.cdsSoftwareVersions.Post;
         end;
        Dmsys1.cdsSoftwareVersions.Next;
      end;
   end;

End;


procedure TFrmSoftwares.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
      BeforePost;
      If ApplyTablesSys([dbCod, dbDesc, dbTipo, dbPath], [DmSys1.cdsSoftwares,
                                                          Dmsys1.cdsSoftwareVersions]) Then
         begin
          SetActions([], True, FrmSoftwares, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmSoftwares, t_form_objects);
          SetDetail;
          tbtnRefresh.Click;
         end;
    END;
  actLog.Enabled := dmSys1.cdsSoftwares.RecordCount > 0
end;

procedure TFrmSoftwares.actDeleteExecute(Sender: TObject);
begin
 If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsSoftwares.Edit;
         cdsSoftwares.FieldByName('SF_STATUS').AsString := 'I';
         cdsSoftwares.Post;
         cdsSoftwares.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
 actLog.Enabled := dmSys1.cdsSoftwares.RecordCount > 0;
 {}
end;

procedure TFrmSoftwares.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsSoftwares.Cancel;
     dmSys1.cdsSoftwareVersions.Close;
     dmSys1.cdsSoftwareVersions.Open;
     SetActions([], True, FrmSoftwares, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmSoftwares, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := dmSys1.cdsSoftwares.RecordCount > 0;
  
end;

procedure TFrmSoftwares.tbtnNewVersionClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  dbgVersions.Visible := False;
  ActionInsertSys(DmSys1.cdsSoftwareVersions);
  dbMajorVersion.SetFocus; {}

end;

procedure TFrmSoftwares.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  If dlgOpenFile.Execute then
   begin
     dbVersionPath.Text := dlgOpenFile.FileName;
   end;

end;

procedure TFrmSoftwares.btDisplayCancelClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  dbgVersions.Visible := True;
  DmSys1.cdsSoftwareVersions.Cancel;
  SetDetail;

end;

procedure TFrmSoftwares.btDisplayOKClick(Sender: TObject);
begin
  inherited;

  If dbMajorVersion.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbMajorVersion.SetFocus;
     Exit
   end;

  If dbMinorVersion.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbMinorVersion.SetFocus;
     Exit
   end;

  If dbVersionDesc.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbVersionDesc.SetFocus;
     Exit
   end;

  If dmSys1.cdsSoftwareVersions.FieldByName('SFV_STARTDATE').IsNull then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbVersionStartdate.SetFocus;
     Exit
   end;

   If not dmSys1.cdsSoftwareVersions.FieldByName('SFV_ENDDATE').IsNull then
     If dmSys1.cdsSoftwareVersions.FieldByName('SFV_ENDDATE').AsDateTime < dmSys1.cdsSoftwareVersions.FieldByName('SFV_STARTDATE').AsDateTime then
      begin
        DisplayMsg(t_form_objects, '%T', [1530], []);
        dbVersionStartdate.SetFocus;
        Exit
      end;

  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);

//  dmSys1.cdsSoftwareVersions.FieldByName('SFV_STATUS').AsString := 'A';
  dmSys1.cdsSoftwareVersions.Post;
  dbgVersions.Visible := True;
  SetDetail;
end;

procedure TFrmSoftwares.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmSoftwares, t_form_objects);
      SetDetail;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmSoftwares, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

end;

procedure TFrmSoftwares.actFirstExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
end;

procedure TFrmSoftwares.actPriorExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
end;

procedure TFrmSoftwares.actNextExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
end;

procedure TFrmSoftwares.actLastExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
end;

procedure TFrmSoftwares.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  strWhere := ' WHERE SF_STATUS  = ' + QuotedStr('A');

  If Trim(edCod.Text) <> '' then
    strWhere := ' WHERE SF_STATUS  = ' + QuotedStr('A') + ' AND SF_COD LIKE ' + QuotedStr(edCod.Text + '%');

  If Trim(edDesc.Text) <> '' then
   begin
     If strWhere = '' then
       strWhere := ' WHERE SF_STATUS  = ' + QuotedStr('A') + ' AND SF_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
     Else
       strWhere := strWhere + ' AND SF_DESC LIKE ' + QuotedStr(edDesc.Text + '%');
   end;

  with DmSys1 do
    begin
      cdsSoftwares.Close;
      cdsSoftwares.CommandText := 'SELECT SF.*,SF.SF_STATUS AS STATUS_ID , SFT.SFT_DESC FROM SOFTWARES SF INNER JOIN SOFTWARETYPES SFT ON SFT.SFT_ID = SF.SFT_ID ' + strWhere + ' ORDER BY SF_COD';
      cdsSoftwares.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount(' SF_ID ', ' FROM SOFTWARES SF INNER JOIN SOFTWARETYPES SFT ON SFT.SFT_ID = SF.SFT_ID ', 'True', strWhere) ) + ' Registro(s)';
    end;
  actLog.Enabled := dmSys1.cdsSoftwares.RecordCount > 0
end;

procedure TFrmSoftwares.tbtnDeleteVersionClick(Sender: TObject);
begin
  inherited;
  DmSys1.cdsSoftwareVersions.Edit;
  DmSys1.cdsSoftwareVersions.FieldByName('SFV_STATUS').AsString := 'I';
  DmSys1.cdsSoftwareVersions.Post;

end;

procedure TFrmSoftwares.tbtnEditVersionClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  dbgVersions.Visible := False;
  DmSys1.cdsSoftwareVersions.Edit;
  dbMajorVersion.SetFocus;
end;

procedure TFrmSoftwares.actNewVersionExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  dbgVersions.Visible := False;
  ActionInsertSys(DmSys1.cdsSoftwareVersions);
  dmSys1.cdsSoftwareVersions.FieldByName('SFV_ID').AsInteger :=  (-1) - (dmSys1.cdsSoftwareVersions.RecordCount);
  dbMajorVersion.SetFocus; {}
end;

procedure TFrmSoftwares.actEditVersionExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  dbgVersions.Visible := False;
  DmSys1.cdsSoftwareVersions.Edit;
  dbMajorVersion.SetFocus;
end;

procedure TFrmSoftwares.actDeleteVersionExecute(Sender: TObject);
begin
  inherited;

  DmSys1.cdsSoftwareVersions.Edit;
  DmSys1.cdsSoftwareVersions.FieldByName('SFV_STATUS').AsString := 'I';
  DmSys1.cdsSoftwareVersions.FieldByName('STATUS_ID').AsString  := 'I';
  DmSys1.cdsSoftwareVersions.Post;
end;

procedure TFrmSoftwares.actOpenFileExecute(Sender: TObject);
begin
  inherited;
  If dlgOpenFile.Execute then
   begin
     dbVersionPath.Text := dlgOpenFile.FileName;
   end;
end;

procedure TFrmSoftwares.actOkVersionExecute(Sender: TObject);
Var i: Integer; S: String;
begin
  inherited;

  IF dbMajorVersion.Focused THEN dbMinorVersion.SetFocus
  ELSE dbMajorVersion.SetFocus;

  If dbMajorVersion.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbMajorVersion.SetFocus;
     Exit
   end;

  If dbMinorVersion.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbMinorVersion.SetFocus;
     Exit
   end;

  If dbVersionDesc.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbVersionDesc.SetFocus;
     Exit
   end;

  If dmSys1.cdsSoftwareVersions.FieldByName('SFV_STARTDATE').IsNull then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbVersionStartdate.SetFocus;
     Exit
   end;

   If not dmSys1.cdsSoftwareVersions.FieldByName('SFV_ENDDATE').IsNull then
     If dmSys1.cdsSoftwareVersions.FieldByName('SFV_ENDDATE').AsDateTime < dmSys1.cdsSoftwareVersions.FieldByName('SFV_STARTDATE').AsDateTime then
      begin
        DisplayMsg(t_form_objects, '%T', [1530], []);
        dbVersionStartdate.SetFocus;
        Exit
      end;

  If dbVersionPath.Text = '' then
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbVersionPath.SetFocus;
     Exit
   end;

  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);

  dmSys1.cdsSoftwareVersions.FieldByName('SFV_REGUSER').AsString:='ADMIN';

  dmSys1.cdsSoftwareVersions.Post;
  dbgVersions.Visible := True;
  SetDetail;
end;

procedure TFrmSoftwares.actCancelVersionExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  dbgVersions.Visible := True;
  DmSys1.cdsSoftwareVersions.Cancel;
  SetDetail;
end;

procedure TFrmSoftwares.actPrimeiroExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
end;

procedure TFrmSoftwares.actAnteriorExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
end;

procedure TFrmSoftwares.actProximoExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
end;

procedure TFrmSoftwares.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet :=  DmSys1.cdsSoftwares;
end;

procedure TFrmSoftwares.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '21';
  FrmSystemLog.pSLG_ID := dmSys1.cdsSoftwares.FieldByName('SF_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TFrmSoftwares.FormActivate(Sender: TObject);
begin
  inherited;
FormAguarde.Hide; Application.ProcessMessages;
end;

end.
