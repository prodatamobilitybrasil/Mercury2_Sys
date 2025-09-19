unit uFrmKeyTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmKeyTypes = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    dbCode: TDBEdit;
    dbDesc: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    edCode: TEdit;
    edDesc: TEdit;
    dbeEodCode: TDBEdit;
    Label5: TLabel;
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
  FrmKeyTypes: TFrmKeyTypes;

implementation

uses AppSparkSysMain, uConst, uDmConexao, uDmSys, uGeralFunctions;

{$R *.dfm}

procedure TFrmKeyTypes.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys.cdsKeyTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('KT_CODE', 'FROM KEYTYPES', 'True', '') ) + ' Registro(s)';
end;

procedure TFrmKeyTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys.cdsKeyTypes]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmKeyTypes := Nil;
end;

procedure TFrmKeyTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsKeyTypes);
  SetActions([], False, FrmKeyTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmKeyTypes, t_form_objects);
  dbCode.SetFocus;
end;

procedure TFrmKeyTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmKeyTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmKeyTypes, t_form_objects);
  dbCode.SetFocus;
end;

procedure TFrmKeyTypes.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere := '  WHERE KT.KT_STATUS = ' + QuotedStr('A');

  If Trim(edCode.Text) <> '' then
    strWhere := strWhere + '  AND KT.KT_CODE LIKE ' + QuotedStr(edCode.Text + '%');

  If Trim(edDesc.Text) <> '' then
    strWhere := strWhere + '  AND KT.KT_DESC LIKE ' + QuotedStr(edDesc.Text + '%');
  with DmSys do
    begin
      cdsKeyTypes.Close;
      cdsKeyTypes.CommandText := 'SELECT KT.*, KT.KT_STATUS AS STATUS_ID FROM KEYTYPES KT '  + strWhere +  '   ORDER BY KT.KT_CODE';
      cdsKeyTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount(' KT.KT_CODE ', ' FROM KEYTYPES KT ', 'True', strWhere) ) + ' Registro(s)';
    end;
end;

procedure TFrmKeyTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbCode, dbDesc], [DmSys.cdsKeyTypes]) Then
         begin
           SetActions([], True, FrmKeyTypes, t_form_objects);
           SetActions([actApplyUpdates, actCancel], False, FrmKeyTypes, t_form_objects);
           tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmKeyTypes.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
   begin
     dmSys.cdsKeyTypes.Cancel;
     SetActions([], True, FrmKeyTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmKeyTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmKeyTypes.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys do
        Begin
         cdsKeyTypes.Edit;
         cdsKeyTypes.FieldByName('KT_STATUS').AsString := 'I';
         cdsKeyTypes.Post;
         cdsKeyTypes.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmKeyTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmKeyTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmKeyTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

end;

end.
