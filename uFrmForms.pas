unit uFrmForms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, Buttons;

type
  TFrmForms = class(TFrmBaseSys)
    edDesc: TEdit;
    Label1: TLabel;
    grbForm: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmForms: TFrmForms;

implementation

uses AppSparkSysMain, uConst, uDmSys1, uGeralFunctions, uDmConexao;

{$R *.dfm}

procedure TFrmForms.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys1.cdsForms]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('DT_ID', 'FROM DATATYPES', 'True', '') ) + ' Registro(s)';
end;

procedure TFrmForms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
//  CloseTablesSys([DmSys1.cdsForms]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmForms := Nil;
end;

procedure TFrmForms.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsForms);
  SetActions([], False, FrmForms, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmForms, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmForms.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmForms, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmForms, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmForms.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys1.cdsForms]) Then
         begin
           SetActions([], True, FrmForms, t_form_objects);
           SetActions([actApplyUpdates, actCancel], False, FrmForms, t_form_objects);
           tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmForms.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
   begin
     dmSys1.cdsForms.Cancel;
     SetActions([], True, FrmForms, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmForms, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmForms.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsForms.Edit;
         cdsForms.FieldByName('FRM_STATUS').AsString := 'I';
         cdsForms.Post;
         cdsForms.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmForms.actFilterExecute(Sender: TObject);
var
  strWhere : String;
begin
  inherited;
  strWhere  := '';

  If Trim(edDesc.Text) <> '' then
    strWhere := '  WHERE FRM_STATUS = ' + QuotedStr('A') + ' AND FRM_DESC LIKE ' + QuotedStr(edDesc.Text + '%')
  Else
    strWhere := '  WHERE FRM_STATUS = ' + QuotedStr('A');

  with DmSys1 do
    begin
      cdsForms.Close;   //SELECT * FROM FORMS ORDER BY FRM_DESC
      cdsForms.CommandText := 'SELECT *  From FORMS '  + strWhere +  '   ORDER BY FRM_DESC';
      cdsForms.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('FRM_ID', 'FROM FORMS', 'True', strWhere) ) + ' Registro(s)';
    end;

end;

procedure TFrmForms.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;

  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmForms, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmForms, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

end.
