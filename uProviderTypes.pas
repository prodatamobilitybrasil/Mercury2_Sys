unit uProviderTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls;

type
  TFrmProviderTypes = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    dbProviderTypesStatus: TRxDBComboBox;
    Label1: TLabel;
    edDesc: TEdit;
    Label3: TLabel;
    Label25: TLabel;
    eCodigo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbCodigo: TDBEdit;
    lkFilterStatus: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmProviderTypes: TFrmProviderTypes;

implementation

uses uDmSys, AppSparkSysMain, uGeralFunctions, uConst, uDiscountTypes,
  uDmConexao, uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmProviderTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsProviderTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('PRVT_CODE', 'FROM PROVIDERTYPES', 'True', ' WHERE PRVT_STATUS = ''A'' ') ) + ' Registro(s)';
end;

procedure TFrmProviderTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsProviderTypes]);
    DmSys.cdsProviderTypes.CommandText := 'SELECT '+ ccardProviderTypes +' FROM PROVIDERTYPES PRVT WHERE PRVT_STATUS = ''A'' ORDER BY PRVT_DESC';    
    FrmProviderTypes := Nil;
end;

procedure TFrmProviderTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsProviderTypes);
  SetActions([], False, FrmProviderTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmProviderTypes, t_form_objects);
  dbCodigo.Enabled := True;
  dbCodigo.SetFocus;
end;

procedure TFrmProviderTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmProviderTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmProviderTypes, t_form_objects);
  dbDesc.SetFocus;
  dbCodigo.Enabled := False;
end;

procedure TFrmProviderTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
      If ApplyTablesSys([dbCodigo, dbDesc], [DmSys.cdsProviderTypes]) Then
         begin
            SetActions([], True, FrmProviderTypes, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmProviderTypes, t_form_objects);
            tbtnRefresh.Click;
         end;
end;

procedure TFrmProviderTypes.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsProviderTypes.Cancel;
     SetActions([], True, FrmProviderTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmProviderTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

end;

procedure TFrmProviderTypes.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsProviderTypes.Edit;
         cdsProviderTypes.FieldByName('PRVT_STATUS').AsString := 'I';
         cdsProviderTypes.Post;
         cdsProviderTypes.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

end;

procedure TFrmProviderTypes.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(eCodigo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRVT_CODE LIKE' + QuotedStr(eCodigo.Text+'%') + ' AND ';
       end;

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRVT_DESC LIKE' + QuotedStr(edDesc.Text+'%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' PRVT_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' PRVT_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsProviderTypes.Close;
      cdsProviderTypes.CommandText := 'SELECT '+ ccardProviderTypes +' FROM PROVIDERTYPES PRVT ' + strWhere + 'ORDER BY PRVT_DESC';
      cdsProviderTypes.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('PRVT_CODE', 'FROM PROVIDERTYPES', 'True', strWhere) ) + ' Registro(s)';
    end

end;

procedure TFrmProviderTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmProviderTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmProviderTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmProviderTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsProviderTypes;
end;

end.
