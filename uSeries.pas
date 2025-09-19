unit uSeries;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb;

type
  TFrmSeries = class(TFrmBaseSys)
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label6: TLabel;
    dbVal: TDBEdit;
    dbCardUsersStatus: TRxDBComboBox;
    Label1: TLabel;
    edDesc: TEdit;
    Label3: TLabel;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    dbCodigo: TDBEdit;
    Label4: TLabel;
    edCodigo: TEdit;
    Label5: TLabel;
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSeries: TFrmSeries;

implementation

uses uDmSys, AppSparkSysMain, uSystemParameters, uConst, uGeralFunctions,
  uDmConexao, uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmSeries.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsSeries);
  SetActions([], False, FrmSeries, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmSeries, t_form_objects);
  dbCodigo.Enabled := True;
  dbCodigo.SetFocus;
end;

procedure TFrmSeries.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmSeries, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmSeries, t_form_objects);
  dbDesc.SetFocus;
  dbCodigo.Enabled := False;
end;

procedure TFrmSeries.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbCodigo, dbDesc], [DmSys.cdsSeries]) Then
         begin
            SetActions([], True, FrmSeries, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmSeries, t_form_objects);
            tbtnRefresh.Click;
            dbCodigo.Enabled := False;
         end;
    END;
end;

procedure TFrmSeries.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmSys.cdsSeries.Cancel;
     SetActions([], True, FrmSeries, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmSeries, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     dbCodigo.Enabled := False;
    end;
end;

procedure TFrmSeries.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     with DmSys do
        Begin
         cdsSeries.Edit;
         cdsSeries.FieldByName('SE_STATUS').AsString := 'I';
         cdsSeries.Post;
         cdsSeries.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmSeries.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsSeries]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SE_ID', 'FROM SERIES', 'True', ' WHERE SE_STATUS = ''A'' ' ) ) + ' Registro(s)';
end;

procedure TFrmSeries.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsSeries]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsSeries.CommandText := 'SELECT '+ ccardSeries +' From SERIES where SE_STATUS = ''A'' ORDER BY SE_ID';
    FrmSeries := Nil;
end;

procedure TFrmSeries.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' SE_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;


     If Trim(edCodigo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' SE_ID = ' + QuotedStr(edCodigo.Text) + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SE_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SE_STATUS = ' + QuotedStr('I') + ' AND ';
           End;
      End; //Case...

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
  with DmSys do
    begin
      cdsSeries.Close;
      cdsSeries.CommandText := 'SELECT '+ ccardSeries +' From SERIES ' + strWhere + 'ORDER BY SE_ID';
      cdsSeries.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SE_ID', 'FROM SERIES', 'True', strWhere) ) + ' Registro(s)';
    end
end;

procedure TFrmSeries.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
   IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      dbCodigo.Enabled := False;
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmSeries, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmSeries, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmSeries.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
 dbCodigo.Enabled := False;
end;

procedure TFrmSeries.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsSeries;
end;

end.
