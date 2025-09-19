unit uFrmObjectTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmObjectTypes = class(TFrmBaseSys)
    edDesc: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    procedure FormCreate(Sender: TObject);
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
  FrmObjectTypes: TFrmObjectTypes;

implementation

uses uConst, uDataBaseFunctions, uDmSys1, uGeralFunctions,
  uFrmBaseCadastro, AppSparkSysMain, uDmConexao;

{$R *.dfm}

procedure TFrmObjectTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsObjectTypes;
end;

procedure TFrmObjectTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys1.cdsObjectTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('OT_ID', 'FROM OBJECTTYPES', 'False', '') ) + ' Registro(s)';
end;

procedure TFrmObjectTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys1.cdsObjectTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmObjectTypes := Nil;
end;

procedure TFrmObjectTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsObjectTypes);
  SetActions([], False, FrmObjectTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmObjectTypes, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmObjectTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmObjectTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmObjectTypes, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmObjectTypes.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  If Trim(edDesc.Text) <> '' then
    strWhere := '  WHERE OT_STATUS = ' + QuotedStr('A') + ' AND OT_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
  Else
    strWhere := '  WHERE OT_STATUS = ' + QuotedStr('A');

  with DmSys1 do
    begin
      cdsObjectTypes.Close;
      cdsObjectTypes.CommandText := 'SELECT *  FROM OBJECTTYPES '  + strWhere +  '   ORDER BY OT_DESC';
      cdsObjectTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('OT_ID', 'FROM OBJECTTYPES', 'True', strWhere) ) + ' Registro(s)';
    end
end;

procedure TFrmObjectTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys1.cdsObjectTypes]) Then
         begin
          SetActions([], True, FrmObjectTypes, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmObjectTypes, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmObjectTypes.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsObjectTypes.Cancel;
     SetActions([], True, FrmObjectTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmObjectTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmObjectTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsObjectTypes.Edit;
         cdsObjectTypes.FieldByName('OT_STATUS').AsString := 'I';
         cdsObjectTypes.Post;
         cdsObjectTypes.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmObjectTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmObjectTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmObjectTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

end.
