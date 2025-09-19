unit ufrmApprovationtypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, uFrmBaseSys;

type
  TfrmApprovationTypes = class(TFrmBaseSys)
    Label1: TLabel;
    eDesc: TEdit;
    Label2: TLabel;
    dbedAPT_ID: TDBEdit;
    Label3: TLabel;
    dbedAPT_DESC: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmApprovationTypes: TfrmApprovationTypes;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, DateUtils, uDmSys,
  uGeralFunctions, uConst, uFrmBaseCadastro;

{$R *.dfm}
procedure TfrmApprovationTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmSys1.cdsApprovationTypes.Close;
  Action := caFree;
end;

procedure TfrmApprovationTypes.FormDestroy(Sender: TObject);
begin
  inherited;
  frmApprovationTypes := Nil;
end;

procedure TfrmApprovationTypes.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
     qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(eDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' APT_DESC LIKE ' + QuotedStr(eDesc.Text + '%') + ' AND ';
       end;

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

  with dmSys1 do
    begin
      cdsApprovationTypes.Close;
      cdsApprovationTypes.CommandText := 'SELECT APT_ID, APT_DESC FROM APPROVATIONTYPES ' + strWhere + ' ORDER BY APT_ID';
      cdsApprovationTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('APT_ID', 'FROM APPROVATIONTYPES', 'True', strWhere) ) + ' Registro(s)';
    end;
//  actLog.Enabled := DmSys1.cdsApplicationGroups.RecordCount > 0;


end;

procedure TfrmApprovationTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  dbedAPT_ID.ReadOnly := True;
  SetActions([], False, Self, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, Self, t_form_objects);
  dbedAPT_DESC.SetFocus;
end;

procedure TfrmApprovationTypes.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;
  If (Status = stInsert) or (Status = stEdit) then
  Begin
    if Length(dbedAPT_ID.Text) = 1 then
      dmSys1.cdsApprovationTypesID.Params.ParamByName('id').AsString := dbedAPT_ID.Text + ' '
    else
      dmSys1.cdsApprovationTypesID.Params.ParamByName('id').AsString := dbedAPT_ID.Text;

    if (Status = stInsert) then
    begin
      dmSys1.cdsApprovationTypesID.Open;
      if dmSys1.cdsApprovationTypesID.RecordCount > 0 then
      begin
        DisplayMsg(t_form_objects, '%T', [3238], [], mtError, [mbOK]);
        dmSys1.cdsApprovationTypesID.Close;
        exit;
      end;
      dmSys1.cdsApprovationTypesID.Close;
    end;

    if ApplyTablesSys([dbedAPT_ID,dbedAPT_DESC], [dmSys1.cdsApprovationTypes]) then
       Begin
         SetActions([], True, Self, t_form_objects);
         SetActions([actApplyUpdates, actCancel, actLog], False, Self, t_form_objects);
         tbtnRefresh.Click;
       end;
  end;
end;

procedure TfrmApprovationTypes.actCancelExecute(Sender: TObject);
begin
//  inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsApprovationTypes.Cancel;
    SetActions([], True, Self, t_form_objects);
    SetActions([actApplyUpdates, actCancel, actLog], False, Self, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;

end;

procedure TfrmApprovationTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dmSys1.cdsApprovationTypes.Delete;
      dmSys1.cdsApprovationTypes.ApplyUpdates(-1);
    end;

end;

procedure TfrmApprovationTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsApprovationTypes;
  OpenTablesSys([dmSys1.cdsApprovationTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsApprovationTypes.RecordCount ) + ' Registro(s)';

end;

procedure TfrmApprovationTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  dbedAPT_ID.ReadOnly := False;
  ActionInsertSys(dmSys1.cdsApprovationTypes);
  SetActions([], False, self, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, Self, t_form_objects);
  dbedAPT_ID.SetFocus;

end;

end.
 