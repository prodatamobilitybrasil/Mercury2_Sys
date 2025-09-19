unit uFrmDataTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmDataTypes = class(TFrmBaseSys)
    edDtDesc: TEdit;
    Label1: TLabel;
    dbDesc: TDBEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDataTypes: TFrmDataTypes;

implementation

uses AppSparkSysMain, uConst, uDmConexao, uGeralFunctions, uDmSys1;

{$R *.dfm}

procedure TFrmDataTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys1.cdsDataTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('DT_ID', 'FROM DATATYPES', 'True', '') ) + ' Registro(s)';

end;

procedure TFrmDataTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys1.cdsDataTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmDataTypes := Nil;

end;

procedure TFrmDataTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsDataTypes);
  SetActions([], False, FrmDataTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmDataTypes, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmDataTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmDataTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmDataTypes, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmDataTypes.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  If Trim(edDtDesc.Text) <> '' then
    strWhere := '  WHERE DT_STATUS = ' + QuotedStr('A') + ' AND DT_DESC LIKE ' + QuotedStr(edDtDesc.Text + '%')
  Else
    strWhere := '  WHERE DT_STATUS = ' + QuotedStr('A');

  with DmSys1 do
    begin
      cdsDataTypes.Close;
      cdsDataTypes.CommandText := 'SELECT *  FROM DATATYPES '  + strWhere +  '   ORDER BY DT_DESC';
      cdsDataTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('DT_ID', 'FROM DATATYPES', 'True', strWhere) ) + ' Registro(s)';
    end
end;

procedure TFrmDataTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys1.cdsDataTypes]) Then
         begin
          SetActions([], True, FrmDataTypes, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmDataTypes, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmDataTypes.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsDataTypes.Cancel;
     SetActions([], True, FrmDataTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmDataTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmDataTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsDataTypes.Edit;
         cdsDataTypes.FieldByName('DT_STATUS').AsString := 'I';
         cdsDataTypes.Post;
         cdsDataTypes.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmDataTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmDataTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmDataTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

end;

end.
