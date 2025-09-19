unit uLinePrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, RxLookup, ToolEdit,
  RXDBCtrl, Mask, DBCtrls;

type
  TFrmLinePrices = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    dbLkLinha: TRxDBLookupCombo;
    dbCardUsersStatus: TRxDBComboBox;
    edFare: TEdit;
    Label5: TLabel;
    lkFilterStatus: TComboBox;
    Label10: TLabel;
    edLinha: TRxDBLookupCombo;
    Label6: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label7: TLabel;
    dbDate: TDateEdit;
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
    Procedure BeforeApply;
    { Private declarations }
  public
    Procedure GetDateTime;  
    { Public declarations }
  end;

var
  FrmLinePrices: TFrmLinePrices;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, Julian, uDmConexao,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmLinePrices.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsLinePrices, Dmsys.cdsFarelevels]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LDT_ID', 'FROM LINEPRICES', 'True', ' WHERE LP_STATUS = ''A'' ') ) + ' Registro(s)';
end;

Procedure TFrmLinePrices.BeforeApply;
Begin
  dmSys.cdsLinePrices.Edit;
  dmSys.cdsLinePrices.FieldByname('LP_DATE').AsInteger := DateTimeToJulian(dbDate.Date);
End;

Procedure TFrmLinePrices.GetDateTime;
Begin
  dbDate.Date := JulianToDateTime(dmsys.cdsLinePrices.FieldByName('LP_DATE').AsInteger);
End;

procedure TFrmLinePrices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   CloseTablesSys([DmSys.cdsLinePrices, Dmsys.cdsFarelevels]);
   FrmSparksysMain.stMain.Panels[3].Text := '';
   FrmLinePrices := Nil;
end;

procedure TFrmLinePrices.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsLinePrices);
  SetActions([], False, FrmLinePrices, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmLinePrices, t_form_objects);
  dbLkLinha.SetFocus;
end;

procedure TFrmLinePrices.actEditExecute(Sender: TObject);
begin
  inherited;
  GetDateTime;
  SetActions([], False, FrmLinePrices, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmLinePrices, t_form_objects);
  dbLkLinha.SetFocus;
end;

procedure TFrmLinePrices.actApplyUpdatesExecute(Sender: TObject);
begin
  IF Trim(dbDate.text) = '/  /' Then
    Begin
    DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbDate.SetFocus;
    End
  Else
  Begin
   inherited;
    If  status = stConsult Then
      BEGIN
      BeforeApply;
       If ApplyTablesSys([dbLkLinha, dbDate], [DmSys.cdsLinePrices]) Then
          begin
            SetActions([], True, FrmLinePrices, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmLinePrices, t_form_objects);
            actRefresh.Execute;
          end;
      END;
  End;

end;

procedure TFrmLinePrices.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsLinePrices.Cancel;
     SetActions([], True, FrmLinePrices, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmLinePrices, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

end;

procedure TFrmLinePrices.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     with DmSys do
        Begin
         cdsLinePrices.Edit;
         cdsLinePrices.FieldByName('LP_STATUS').AsString := 'I';
         cdsLinePrices.FieldByName('STATUS_ID').AsString := 'I';
         cdsLinePrices.Post;
         cdsLinePrices.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmLinePrices.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;
  ccardLinePrices : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edLinha.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LP.LDT_ID = ' + QuotedStr(edLinha.KeyValue) + ' AND ';
       end;


     If Trim(edFare.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LP.LP_FARE = ' + QuotedStr(edFare.Text) + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LP.LP_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LP.LP_STATUS = ' + QuotedStr('I') + ' AND ';
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
      //Passar para uConst...
      ccardLinePrices := 'LP.*, LP.LP_STATUS AS STATUS_ID, '+
                         'FL.FL_DESC, LDT.LDT_DESC';
      cdsLinePrices.Close;
      cdsLinePrices.CommandText := 'SELECT '+ ccardLinePrices +' From LINEPRICES LP ' +
      'LEFT JOIN FARELEVELS FL ON (FL.FL_ID   = LP.FL_ID) '+
      'INNER JOIN LINEDT LDT   ON (LDT.LDT_ID = LP.LDT_ID  ) '+
      strWhere +
      ' ORDER BY LDT.LDT_ID';
      cdsLinePrices.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LP.LDT_ID', 'FROM LINEPRICES LP', 'True', strWhere) ) + ' Registro(s)';
    end
end;

procedure TFrmLinePrices.pcBaseCadastroChange(Sender: TObject);
begin
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmLinePrices, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmLinePrices, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmLinePrices.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsLinePrices;
end;

end.
