unit uFrmEmailTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmEmailTypes = class(TFrmBaseSys)
    edEmtDesc: TEdit;
    Label1: TLabel;
    dbEmtDesc: TDBEdit;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure SetCtr;
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
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
  FrmEmailTypes: TFrmEmailTypes;

implementation

uses uDmSys1, uGeralFunctions, uConst, AppSparkSysMain;

{$R *.dfm}

procedure TFrmEmailTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsEmailTypes]);
  FrmEmailTypes := nil;
end;

procedure TFrmEmailTypes.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsEmailTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsEmailTypes.RecordCount ) + ' Registro(s)';
end;

procedure TFrmEmailTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsEmailTypes);
  SetActions([], False, FrmEmailTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmEmailTypes, t_form_objects);
  SetCtr;
  dbEmtDesc.SetFocus;
end;

procedure TFrmEmailTypes.SetCtr;
begin
  dbEmtDesc.Enabled := (Status = stInsert);
end;

procedure TFrmEmailTypes.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys([dbEmtDesc], [dmSys1.cdsEmailTypes]) then
       Begin
         SetActions([], True, FrmEmailTypes, t_form_objects);
         SetActions([actApplyUpdates, actCancel], False, FrmEmailTypes, t_form_objects);
         tbtnRefresh.Click;
       end;
  end;
end;

procedure TFrmEmailTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmEmailTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmEmailTypes, t_form_objects);
  dbEmtDesc.SetFocus;
end;

procedure TFrmEmailTypes.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsEmailTypes.Cancel;
    SetActions([], True, FrmEmailTypes, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmEmailTypes, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;
end;

procedure TFrmEmailTypes.actDeleteExecute(Sender: TObject);
begin
  //inherited;

  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dmSys1.cdsEmailTypes.Delete;
      dmSys1.cdsEmailTypes.ApplyUpdates(-1);
    end;

end;

procedure TFrmEmailTypes.actFilterExecute(Sender: TObject);
var
  strWhere:string;
begin
  inherited;
  strWhere:='';

  If Trim(edEmtDesc.Text) <> '' then
  Begin
    strwhere:=' where';
    strWhere := strWhere + ' emailtypes.emt_desc LIKE ' + QuotedStr(Trim(edEmtDesc.Text) + '%');
  end;

  With dmSys1 do
  Begin
    cdsEmailTypes.Close;
    cdsEmailTypes.CommandText:='select * from Emailtypes' + strwhere + ' order by Emailtypes.emt_id';
    cdsEmailTypes.Open;
  end;

  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsEmailTypes.RecordCount ) + ' Registro(s)';
end;

procedure TFrmEmailTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsEmailTypes;
end;

end.
