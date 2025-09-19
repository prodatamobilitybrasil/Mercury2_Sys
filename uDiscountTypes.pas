unit uDiscountTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls;

type
  TFrmDiscountTypes = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDescricao: TDBEdit;
    Label1: TLabel;
    edDescricao: TEdit;
    procedure actInsertExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDiscountTypes: TFrmDiscountTypes;

implementation

uses uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao;

{$R *.dfm}

procedure TFrmDiscountTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsDiscountTypes);
  SetActions([], False, FrmDiscountTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmDiscountTypes, t_form_objects);
end;

procedure TFrmDiscountTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmDiscountTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmDiscountTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmDiscountTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmDiscountTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmDiscountTypes, t_form_objects);
end;

procedure TFrmDiscountTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
      If ApplyTablesSys([dbDescricao], DmSys.cdsDiscountTypes) Then
         begin
          SetActions([], True, FrmDiscountTypes, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmDiscountTypes, t_form_objects);
          actRefresh.Execute;
         end;
end;

procedure TFrmDiscountTypes.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmSys.cdsDiscountTypes.Cancel;
     SetActions([], True, FrmDiscountTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmDiscountTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
End;

procedure TFrmDiscountTypes.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     with DmSys do
        Begin
         cdsDiscountTypes.Delete;
         cdsDiscountTypes.ApplyUpdates(-1);
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmDiscountTypes.actRefreshExecute(Sender: TObject);
var BookMark : TBookmark;
begin
  BookMark := dtsMaster.DataSet.GetBookmark;
  dtsMaster.DataSet.Close;
  dtsMaster.DataSet.Open;

  dtsMaster.DataSet.GotoBookmark(BookMark);
  dtsMaster.DataSet.FreeBookmark(BookMark);
end;

procedure TFrmDiscountTypes.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edDescricao.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' DT_DESC LIKE ' + QuotedStr(edDescricao.Text + '%') + ' AND ';
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
  with DmSys do
    begin
      cdsDiscountTypes.Close;
      cdsDiscountTypes.CommandText := 'SELECT '+ ccardDiscountTypes +' From DISCOUNTTYPES ' + strWhere + 'ORDER BY DT_ID';
      cdsDiscountTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('DT_ID', 'FROM DISCOUNTTYPES', 'True', strWhere) ) + ' Registro(s)';
    end
end;

procedure TFrmDiscountTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsDiscountTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('DT_ID', 'FROM DISCOUNTTYPES', 'True', ' ') ) + ' Registro(s)';
end;

procedure TFrmDiscountTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsDiscountTypes]);
    DmSys.cdsDiscountTypes.CommandText := 'SELECT '+ ccardDiscountTypes +' From DISCOUNTTYPES ORDER BY DT_ID';
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmDiscountTypes := Nil;
end;

procedure TFrmDiscountTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsDiscountTypes;
end;

end.
