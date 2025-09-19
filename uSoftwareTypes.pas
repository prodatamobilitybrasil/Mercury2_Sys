unit uSoftwareTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmSoftwareTypes = class(TFrmBaseSys)
    dbDesc: TDBEdit;
    Label1: TLabel;
    edDesc: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSoftwareTypes: TFrmSoftwareTypes;

implementation

uses uConst, uDmSys1, uGeralFunctions, AppSparkSysMain, uDmConexao;

{$R *.dfm}

procedure TFrmSoftwareTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys1.cdsSoftwareTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SFT_ID', 'FROM SOFTWARETYPES', 'True', '') ) + ' Registro(s)';

end;

procedure TFrmSoftwareTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys1.cdsSoftwareTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
//    DmSys.cdsIssuers.CommandText := 'SELECT '+ ccardIssuers +' From ISSUERS WHERE ISS_STATUS = ''A'' ORDER BY ISS_ID';
    FrmSoftwareTypes := Nil;

end;

procedure TFrmSoftwareTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsSoftwareTypes);
  SetActions([], False, FrmSoftwareTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmSoftwareTypes, t_form_objects);
  dbDesc.SetFocus;

end;

procedure TFrmSoftwareTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmSoftwareTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmSoftwareTypes, t_form_objects);
  dbDesc.SetFocus;

end;

procedure TFrmSoftwareTypes.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  If Trim(edDesc.Text) <> '' then
    strWhere := '  WHERE SFT_STATUS = ' + QuotedStr('A') + ' AND SFT_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
  Else
    strWhere := '  WHERE SFT_STATUS = ' + QuotedStr('A');

  with DmSys1 do
    begin
      cdsSoftwareTypes.Close;
      cdsSoftwareTypes.CommandText := 'SELECT *  From SOFTWARETYPES '  + strWhere +  '   ORDER BY SFT_DESC';
      cdsSoftwareTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SFT_ID', 'FROM SOFTWARETYPES', 'True', strWhere) ) + ' Registro(s)';
    end

end;

procedure TFrmSoftwareTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys1.cdsSoftwareTypes]) Then
         begin
          SetActions([], True, FrmSoftwareTypes, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmSoftwareTypes, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmSoftwareTypes.actCancelExecute(Sender: TObject);
begin
//  inherited;
   If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsSoftwareTypes.Cancel;
     SetActions([], True, FrmSoftwareTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmSoftwareTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

end;

procedure TFrmSoftwareTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsSoftwareTypes.Edit;
         cdsSoftwareTypes.FieldByName('SFT_STATUS').AsString := 'I';
         cdsSoftwareTypes.Post;
         cdsSoftwareTypes.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmSoftwareTypes.pcBaseCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 0 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmSoftwareTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmSoftwareTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

end;

end.
