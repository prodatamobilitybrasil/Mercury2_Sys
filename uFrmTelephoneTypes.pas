unit uFrmTelephoneTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmTelephoneTypes = class(TFrmBaseSys)
    Label1: TLabel;
    edTTDesc: TEdit;
    Label2: TLabel;
    dbTTDesc: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure SetCtr;
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelephoneTypes: TFrmTelephoneTypes;

implementation

uses uDmSys1, AppSparkSysMain, uGeralFunctions, uConst;

{$R *.dfm}

procedure TFrmTelephoneTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsTelephoneTypes]);
  FrmTelephoneTypes := nil;
end;

procedure TFrmTelephoneTypes.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsTelephoneTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsTelephoneTypes.RecordCount ) + ' Registro(s)';
end;

procedure TFrmTelephoneTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsTelephoneTypes);
  SetActions([], False, FrmTelephoneTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmTelephoneTypes, t_form_objects);
  SetCtr;
  dbTTDesc.SetFocus;
end;

procedure TFrmTelephoneTypes.SetCtr;
begin
  dbTTDesc.Enabled := (Status = stInsert);
end;

procedure TFrmTelephoneTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmTelephoneTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmTelephoneTypes, t_form_objects);
  dbTTDesc.SetFocus;
end;

procedure TFrmTelephoneTypes.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys([dbTTDesc], [dmSys1.cdsTelephoneTypes]) then
       Begin
         SetActions([], True, FrmTelephoneTypes, t_form_objects);
         SetActions([actApplyUpdates, actCancel], False, FrmTelephoneTypes, t_form_objects);
         tbtnRefresh.Click;
       end;
  end;
end;

procedure TFrmTelephoneTypes.actCancelExecute(Sender: TObject);
begin
//  inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsTelephoneTypes.Cancel;
    SetActions([], True, FrmTelephoneTypes, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmTelephoneTypes, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;
end;

procedure TFrmTelephoneTypes.actDeleteExecute(Sender: TObject);
begin
 // inherited;
 If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dmSys1.cdsTelephoneTypes.Delete;
      dmSys1.cdsTelephoneTypes.ApplyUpdates(-1);
    end;
end;

procedure TFrmTelephoneTypes.actFilterExecute(Sender: TObject);
 var
  strWhere:string;
begin
  inherited;
  strWhere:='';

  If Trim(edTTDesc.Text) <> '' then
  Begin
    strwhere:=' where';
    strWhere := strWhere + ' telephonetypes.tt_desc LIKE ' + QuotedStr(Trim(edttDesc.Text) + '%');
  end;

  With dmSys1 do
  Begin
    cdsTelephoneTypes.Close;
    cdsTelephoneTypes.CommandText:='select * from Telephonetypes' + strwhere + ' order by Telephonetypes.tt_id';
    cdsTelephoneTypes.Open;
  end;

  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsTelephoneTypes.RecordCount ) + ' Registro(s)';
end;

procedure TFrmTelephoneTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsTelephoneTypes;
end;

end.
