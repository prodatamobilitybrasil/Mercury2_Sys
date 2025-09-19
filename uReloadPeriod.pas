unit uReloadPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, ToolEdit, RXDBCtrl, RxDBComb,
  DBCtrls, Buttons, RxLookup, Spin, CurrEdit, RXSpin;



type
  TFrmReloadPeriod = class(TFrmBaseSys)
    gbReload: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    pgcDetail: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label6: TLabel;
    btDisplayOK: TSpeedButton;
    btDisplayCancel: TSpeedButton;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    DBEdit2: TDBEdit;
    dbgDetalhes: TDBGrid;
    dbLkApplications: TRxDBLookupCombo;
    Label5: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    Label8: TLabel;
    Label7: TLabel;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    edAno: TSpinEdit;
    dbDTSstart: TDBDateEdit;
    dbDTSEnd: TDBDateEdit;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actDelDetail: TAction;
    actOkDet: TAction;
    actCancelDet: TAction;
    edDtInicial: TDateEdit;
    edDtFinal: TDateEdit;
    Label1: TLabel;
    Label9: TLabel;
    db_RPD_MAXRELOADS: TRxDBCalcEdit;
    db_Year: TDBEdit;
    sbYear: TSpinButton;
    Label10: TLabel;
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure dbLkApplicationsCloseUp(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure edAppKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actFilterExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure actDelDetailExecute(Sender: TObject);
    procedure actOkDetExecute(Sender: TObject);
    procedure actCancelDetExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbYearDownClick(Sender: TObject);
    procedure sbYearUpClick(Sender: TObject);
  private
    procedure SetDetail;
    procedure SetApp;
    function Mes(Mes:word):string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReloadPeriod: TFrmReloadPeriod;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmReloadPeriod.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsReloadPeriodMT);
  SetActions([], False, FrmReloadPeriod, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmReloadPeriod, t_form_objects);
  SetDetail;
  DmSys.cdsReloadPeriodDT.Close;
  DmSys.cdsReloadPeriodDT.Open;
  db_Year.Enabled := True;
  sbYear.Enabled  := True;
end;

procedure TFrmReloadPeriod.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmReloadPeriod, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmReloadPeriod, t_form_objects);
  SetDetail;
  dbDTSstart.SetFocus;
  db_Year.Enabled := False;
  sbYear.Enabled := False;
end;

procedure TFrmReloadPeriod.actApplyUpdatesExecute(Sender: TObject);
var
 mes1, mes2 : String;
begin
  mes1:=Trim(copy(dbDTSstart.text,4,2));
  mes2:=Trim(copy(dbDTSEnd.text,4,2));

{  If (Length(mes1) > 0) and (Length(mes2) > 0) Then
  if Mes(StrtoInt(mes1)) <> Mes(StrtoInt(mes2)) then
  Begin
    DisplayMsg(t_form_objects, '%T', [3115], []);
    dbDTSstart.SetFocus;
    Exit;
  end;}

  IF dbDTSstart.Date > dbDTSEnd.Date Then
    Begin
     DisplayMsg(t_form_objects, '%T', [1530], []);
     dbDTSEnd.SetFocus;
     Exit;
    End;

  If (dbDTSstart.Date < 0) Then
    Begin
     DisplayMsg(t_form_objects, '%T %T', [1077, 1505], []);
     dbDTSstart.SetFocus;
     Exit;
    End;

  If (dbDTSEnd.Date < 0) Then
    Begin
     DisplayMsg(t_form_objects, '%T %T', [1077, 1505], []);
     dbDTSEnd.SetFocus;
     Exit;
    End;
{
  dmConexao.cdsGeral.Close;
  dmConexao.cdsGeral.CommandText := 'SELECT RPM_YEAR FROM RELOADPERIODMT WHERE RPM_YEAR = :RPM_YEAR '+
                                    'AND RPM_PERIOD = :RPM_PERIOD AND RPM_STATUS = ''I'' ';
  dmConexao.cdsGeral.Params.ParamByName('RPM_YEAR').AsString   := dtsMaster.DataSet.fieldByName('RPM_YEAR').AsString;
  dmConexao.cdsGeral.Params.ParamByName('RPM_PERIOD').AsString := dtsMaster.DataSet.fieldByName('RPM_PERIOD').AsString;
  dmConexao.cdsGeral.Open;

  If dmConexao.cdsGeral.Fields.Fields[0].Value <> null then
     Begin
       DisplayMsg(FrmReloadPeriod.t_form_objects, '%T %T %T %T', [2818, 1502, 1045, 3160], [], mtInformation);
///       dblkPeriod.SetFocus;
       Exit;
     End;
  dmConexao.cdsGeral.Close;
}
   inherited;
    If  status = stConsult Then
      BEGIN
       DmSys.cdsReloadPeriodMT.Post;
{       If DmSys.cdsReloadPeriodMT.FieldByName('RPM_PERIOD').AsInteger > 63 Then
          Begin
            DisplayMsg(FrmReloadPeriod.t_form_objects, '%T %T %T', [3180,3181,3182], [], mtInformation);
            Exit;
          End;
}
       If ApplyTablesSys([], [DmSys.cdsReloadPeriodMT,
                              Dmsys.cdsReloadPeriodDT]) Then
           begin
            SetActions([], True, FrmReloadPeriod, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmReloadPeriod, t_form_objects);
            SetDetail;
            tbtnRefresh.Click;
           end;
      END;
end;

procedure TFrmReloadPeriod.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsReloadPeriodMT, DmSys.cdsReloadPeriodDT,
                   DmSys.cdsApplicationsLook]);
    edAno.Text := FormatDateTime('yyyy',      dmConexao.ConnBrkMaster.AppServer.GetCurrentDateTime );
    SetDetail;

//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('RPM_PERIOD', 'FROM RELOADPERIODMT', 'True', ' WHERE RPM_STATUS = ''A'' ') ) + ' Registro(s)';
end;

procedure TFrmReloadPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsReloadPeriodMT, DmSys.cdsReloadPeriodDT]);
    DmSys.cdsReloadPeriodMT.CommandText := 'SELECT '+ ccardReloadPeriod +' From RELOADPERIODMT where RPM_STATUS = ''A'' ORDER BY RPM_YEAR, RPM_PERIOD';
    FrmReloadPeriod := nil;
end;

procedure TFrmReloadPeriod.SetDetail;
Begin
   If Status = stInsert Then
      Begin
///       dblkPeriod.Enabled  := True;
       gbReload.Enabled    := True;
//       pgcDetail.Enabled   := False;
      End
   Else
      Begin
///       dblkPeriod.Enabled := True;
//       pgcDetail.Enabled  := False;
       gbReload.Enabled   := False;
         IF Status = stEdit Then
            Begin
             pgcDetail.Enabled := True;
             gbReload.Enabled  := True;
            End;
      End;

  SetActions([actEditDetail, actDelDetail], NOT (DmSys.cdsReloadPeriodDT.RecordCount = 0), Self, t_form_objects);
End;

procedure TFrmReloadPeriod.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsReloadPeriodMT.Edit;
         cdsReloadPeriodMT.FieldByName('RPM_STATUS').AsString := 'I';
         cdsReloadPeriodMT.Post;
         cdsReloadPeriodMT.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

end;

procedure TFrmReloadPeriod.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsReloadPeriodMT.Cancel;
     DmSys.cdsReloadPeriodDT.CancelUpdates;
     SetActions([], True, FrmReloadPeriod, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmReloadPeriod, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmReloadPeriod.dbLkApplicationsCloseUp(Sender: TObject);
begin
  inherited;
   IF Trim(dbLkApplications.Text) <> '' Then
      Begin
//       DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([DmSys.cdsReloadPeriodDT.fieldByName('APP_ID').AsInteger,
//                                                         DmSys.cdsReloadPeriodDT.fieldByName('ISS_ID').AsInteger]), [] );




(*        edApp.Text := dmSys.cdsApplicationsLook.FieldByName('APP_DESCSHORT').AsString +
                       '        -        '+
                       dmSys.cdsApplicationsLook.FieldByName('ISS_DESCLONG').AsString;
*)
      End;
end;

procedure TFrmReloadPeriod.SetApp;
Var Str : String;
Begin
   DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([DmSys.cdsReloadPeriodDT.fieldByName('APP_ID').AsInteger,
                                                                 DmSys.cdsReloadPeriodDT.fieldByName('ISS_ID').AsInteger]), [] );

   dbLkApplications.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger;
//   ('ISS_ID', DmSys.cdsApplicationsLook.fieldByname('APP_ID').AsString ,TRUE);

//   dbLkApplications.DisplayValue := dmSys.cdsReloadPeriodDT.FieldByName('APP_DESCSHORT').AsString +
//                                  dmSys.cdsReloadPeriodDT.FieldByName('ISS_DESCLONG').AsString;

(* Str :=  dmSys.cdsReloadPeriodDT.FieldByName('APP_DESCSHORT').AsString +
           '        -        '+
           dmSys.cdsReloadPeriodDT.FieldByName('ISS_DESCLONG').AsString;
   If Trim(Str) = '-' Then
      Str := '';
    edApp.Text := Str;
*)
End;


procedure TFrmReloadPeriod.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmReloadPeriod, t_form_objects);
      SetDetail;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmReloadPeriod, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmReloadPeriod.actFirstExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmReloadPeriod.actPriorExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmReloadPeriod.actNextExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmReloadPeriod.actLastExecute(Sender: TObject);
begin
  inherited;
SetDetail
end;

procedure TFrmReloadPeriod.edAppKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF (key = 40) OR
     (key = 38) Then
     Begin
      dbLkApplications.DropDown;
      dbLkApplications.SetFocus
     End
end;

procedure TFrmReloadPeriod.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If edAno.Value > 0  Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' RPM_YEAR = ' + edAno.Text + ' AND ';
       end;


    If Trim(edDtInicial.text) <> '/  /' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' RPM_START = ' + QuotedStr(FormatDateTime('dd-mmm-yyyy',edDtInicial.Date)) + ' AND ';
       end;

     If Trim(edDtFinal.text) <> '/  /' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' RPM_END = ' + QuotedStr(FormatDateTime('dd-mmm-yyyy',edDtFinal.Date)) + ' AND ';
       end;


{     If Trim(edPeriodo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' RPM_PERIOD = ' + InttoStr(edPeriodo.ItemIndex + 1) + ' AND ';
       end;
}
     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' RPM_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' RPM_STATUS = ' + QuotedStr('I') + ' AND ';
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
      //passar para uConst
      cdsReloadPeriodMT.Close;
      cdsReloadPeriodMT.CommandText := 'SELECT '+ ccardReloadPeriod +' From RELOADPERIODMT ' + strWhere + 'ORDER BY RPM_YEAR, RPM_PERIOD';
      cdsReloadPeriodMT.Open;
//      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('RPM_YEAR', 'FROM RELOADPERIODMT', 'True', strWhere) ) + ' Registro(s)';
    end;
end;

procedure TFrmReloadPeriod.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
    SetStatusPanels(False);
    SetDetail;
end;

procedure TFrmReloadPeriod.actNewDetailExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);

//  edApp.Text := '';
  dbLkApplications.KeyValue := -1;
  dbgDetalhes.Visible := False;
  ActionInsertSys(DmSys.cdsReloadPeriodDT);
end;

procedure TFrmReloadPeriod.actEditDetailExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetApp;
  dbgDetalhes.Visible := False;
  DmSys.cdsReloadPeriodDT.Edit;
end;

procedure TFrmReloadPeriod.actDelDetailExecute(Sender: TObject);
begin
  inherited;
  DmSys.cdsReloadPeriodDT.Edit;
  DmSys.cdsReloadPeriodDT.FieldByName('RPD_STATUS').AsString := 'I';
  DmSys.cdsReloadPeriodDT.FieldByName('STATUS_ID').AsString := 'I';
  DmSys.cdsReloadPeriodDT.Post;
end;

procedure TFrmReloadPeriod.actOkDetExecute(Sender: TObject);
begin
  inherited;
  If dbLkApplications.KeyValue = null Then
     displayMsg(t_form_objects, '%T %T %T', [1601, 1522, 1500], [], mtError, [mbOK])
  Else
  If ( db_RPD_MAXRELOADS.Value < 0 ) OR
     ( db_RPD_MAXRELOADS.Value > 63) Then
     Begin
     displayMsg(t_form_objects, '%T %S', [1534], ['0 - 63'], mtError, [mbOK]);
     db_RPD_MAXRELOADS.SetFocus;
     End
  Else
  Begin
    SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
    DmSys.cdsReloadPeriodDT.FieldByName('APP_ID').AsInteger := dmSys.cdsApplicationsLook.FieldByName('APP_ID').AsInteger;
    DmSys.cdsReloadPeriodDT.FieldByName('ISS_ID').AsInteger := dmSys.cdsApplicationsLook.FieldByName('ISS_ID').AsInteger;
    DmSys.cdsReloadPeriodDT.FieldByName('APP_DESCSHORT').AsString := dmSys.cdsApplicationsLook.FieldByName('APP_DESCSHORT').AsString;
    DmSys.cdsReloadPeriodDT.FieldByName('ISS_DESCLONG').AsString  := dmSys.cdsApplicationsLook.FieldByName('ISS_DESCLONG').AsString;
    DmSys.cdsReloadPeriodDT.Post;

    dbgDetalhes.Visible := True;
    SetDetail;
  End;
end;

procedure TFrmReloadPeriod.actCancelDetExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
  dbgDetalhes.Visible := True;
  DmSys.cdsReloadPeriodDT.Cancel;
  SetDetail;
end;

procedure TFrmReloadPeriod.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsReloadPeriodMT;
end;

function TFrmReloadPeriod.Mes(Mes: word): string; const meses : array[0..11] of PChar = ('Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro','Outubro', 'Novembro', 'Dezembro');
begin
  result:=meses[mes-1];
end;

procedure TFrmReloadPeriod.sbYearDownClick(Sender: TObject);
begin
  inherited;
  If StrtoInt(db_Year.EditText) > 0 Then
  Begin
    db_Year.EditText := InttoStr(StrtoInt(db_Year.EditText)-1);
    dtsMaster.DataSet.FieldByName('RPM_YEAR').AsInteger := StrtoInt(db_Year.EditText);
  End;
end;

procedure TFrmReloadPeriod.sbYearUpClick(Sender: TObject);
begin
  inherited;
  db_Year.EditText := InttoStr(StrtoInt(db_Year.EditText)+1);
  dtsMaster.DataSet.FieldByName('RPM_YEAR').AsInteger := StrtoInt(db_Year.EditText);

end;

end.



