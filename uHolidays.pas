unit uHolidays;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, DBCtrls, Mask, ToolEdit, RXDBCtrl,
  RxDBComb;

Const Mes: array[1..12] of String = ('JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC');

type
  TFrmHolidays = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbDate: TDBDateEdit;
    Label2: TLabel;
    dbDesc: TDBEdit;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    edData: TDateEdit;
    edFeriado: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    lStatus: TLabel;
    lkFilterStatus: TComboBox;
    RxDBComboBox1: TRxDBComboBox;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Function GetMount(xDate : TDateTime) : String ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHolidays: TFrmHolidays;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmHolidays.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsHolidays]);
end;

procedure TFrmHolidays.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsHolidays]);
    DmSys.cdsHolidays.CommandText := 'SELECT '+ ccardHolidays +' From HOLIDAYS HOL WHERE HOL_STATUS = ''A'' ORDER BY HOL_DATE';
    FrmHolidays := Nil;
end;

procedure TFrmHolidays.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsHolidays);
  SetActions([], False, FrmHolidays, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmHolidays, t_form_objects);
end;

procedure TFrmHolidays.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmHolidays, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmHolidays, t_form_objects);
end;

procedure TFrmHolidays.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmSys.cdsHolidays.Cancel;
     SetActions([], True, FrmHolidays, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmHolidays, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmHolidays.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If  ApplyTablesSys([dbDate, dbDesc], [DmSys.cdsHolidays]) Then
         begin
          SetActions([], True, FrmHolidays, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmHolidays, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
end;

procedure TFrmHolidays.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
      with DmSys do
        Begin
         cdsHolidays.Edit;
         cdsHolidays.FieldByName('HOL_STATUS').AsString := 'I';
         cdsHolidays.Post;
         cdsHolidays.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

Function TFrmHolidays.GetMount(xDate : TDateTime) : String;
Var
 Y, M, D : Word;
Begin
  DecodeDate(xDate, Y, M, D);
  Result := InttoStr(D)+'-'+Mes[M]+'-'+InttoStr(Y)
End;

procedure TFrmHolidays.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edData.Text) <> '/  /'  Then
       begin
         Inc(qtd_campos);

         strWhere := strWhere + ' HOL_DATE = ' + QuotedStr(GetMount(edData.Date)) + ' AND ';
       end;

     If Trim(edFeriado.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' HOL_DESC LIKE ' + QuotedStr(edFeriado.Text + '%')  + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' HOL_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' HOL_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsHolidays.Close;
      cdsHolidays.CommandText := 'SELECT '+ ccardHolidays +' From HOLIDAYS HOL ' + strWhere + 'ORDER BY HOL_DATE';
      cdsHolidays.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('HOL_ID', 'FROM HOLIDAYS', 'True', strWhere) ) + ' Registro(s)';
    end;
end;

procedure TFrmHolidays.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmHolidays, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmHolidays, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmHolidays.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsHolidays;
end;

end.
