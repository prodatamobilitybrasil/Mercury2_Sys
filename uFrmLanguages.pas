unit uFrmLanguages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmLanguages = class(TFrmBaseSys)
    dbDesc: TDBEdit;
    Label2: TLabel;
    edDesc: TEdit;
    Label1: TLabel;
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
  FrmLanguages: TFrmLanguages;

implementation

uses AppSparkSysMain, uConst, uDmConexao, uDmSys1, uGeralFunctions;

{$R *.dfm}

procedure TFrmLanguages.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys1.cdsLanguages]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LNG_ID', 'FROM LANGUAGES', 'True', '') ) + ' Registro(s)';
end;

procedure TFrmLanguages.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys1.cdsLanguages]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmLanguages := Nil;
end;

procedure TFrmLanguages.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsLanguages);
  SetActions([actInsert, actEdit, actDelete, actExit, actRefresh, actFilter], False, FrmLanguages, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmLanguages, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmLanguages.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([actInsert, actEdit, actDelete, actExit, actRefresh, actFilter], False, FrmLanguages, t_form_objects);
  SetActions([actApplyUpdates, actCancel], True, FrmLanguages, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmLanguages.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  If Trim(edDesc.Text) <> '' then
    strWhere := '  WHERE LNG_STATUS = ' + QuotedStr('A') + ' AND LNG_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
  Else
    strWhere := '  WHERE LNG_STATUS = ' + QuotedStr('A');

  with DmSys1 do
    begin
      cdsLanguages.Close;
      cdsLanguages.CommandText := 'SELECT *  From LANGUAGES '  + strWhere +  '   ORDER BY LNG_DESC';
      cdsLanguages.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LNG_ID', 'FROM LANGUAGES', 'True', strWhere) ) + ' Registro(s)';
    end;
end;

procedure TFrmLanguages.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys1.cdsLanguages]) Then
         begin
            SetActions([actInsert, actEdit, actDelete, actExit, actRefresh, actFilter], True, FrmLanguages, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmLanguages, t_form_objects);
            tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmLanguages.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsLanguages.Cancel;
     SetActions([actInsert, actEdit, actDelete, actExit, actRefresh, actFilter], True, FrmLanguages, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmLanguages, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmLanguages.actDeleteExecute(Sender: TObject);
begin
//  inherited;
 If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsLanguages.Edit;
         cdsLanguages.FieldByName('LNG_STATUS').AsString := 'I';
         cdsLanguages.Post;
         cdsLanguages.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;

end;

procedure TFrmLanguages.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmLanguages, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmLanguages, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

end.
