unit uLineDiscounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb, CurrEdit,
  ToolEdit, RXDBCtrl, RxLookup, Buttons;

type
  TFrmLineDiscounts = class(TFrmBaseSys)
    gbDescontos: TGroupBox;
    Label2: TLabel;
    dblkDiscountTypes: TRxDBLookupCombo;
    edDiscountTypes: TRxDBLookupCombo;
    Label5: TLabel;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    edDtInicial: TDateEdit;
    edDtFinal: TDateEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label7: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    Label8: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    edHHini: TCurrencyEdit;
    Label10: TLabel;
    edHMIni: TCurrencyEdit;
    Label4: TLabel;
    edHMFim: TCurrencyEdit;
    edHHFim: TCurrencyEdit;
    Label11: TLabel;
    Label12: TLabel;
    dbDataI: TDBDateEdit;
    dbDataF: TDBDateEdit;
    dbValue: TRxDBCalcEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure edHHiniChange(Sender: TObject);
    procedure edHMIniChange(Sender: TObject);
    procedure edHHFimChange(Sender: TObject);
    procedure edHMFimChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
  private
    Procedure SetChk;
    Procedure SetDetail;
    Function BeforeApply : Boolean;
    Procedure SetStatusPanels(Status : Boolean); override;
    { Private declarations }
  public
    Procedure GetDateTime;  
    { Public declarations }
  end;

var
  FrmLineDiscounts: TFrmLineDiscounts;

implementation

Uses uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmBaseCadastro, uFrmSystemLog;

{$R *.dfm}

procedure TFrmLineDiscounts.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsLineDiscounts, DmSys.cdsDiscountTypes ]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LDI.LDI_ID', 'FROM LINEDISCOUNTS LDI', 'True', ' Where LDI_STATUS = ''A'' ') ) + ' Registro(s)';
    actLog.Enabled := DmSys.cdsLineDiscounts.RecordCount > 0
end;

procedure TFrmLineDiscounts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsDiscountTypes, DmSys.cdsLineDiscounts]);

    FrmLineDiscounts := Nil;
end;

Procedure TFrmLineDiscounts.SetStatusPanels(Status : Boolean);
Begin
  gbDescontos.enabled := Status;
End;


(*
Procedure TFrmLineMT.GetDateTimeDiscounts;
 Var TimeSta, TimeEnd, DateSta, DateEnd  : TDateTime;
     Hour, Min, Sec, MSec: Word;
Begin
  TimeSta := dmsys.cdsLineDiscounts.FieldByName('LD_TIMESTART').AsDateTime;
  TimeEnd := dmsys.cdsLineDiscounts.FieldByName('LD_TIMEEND').AsDateTime;
//  DateSta := dmsys.cdsLineDiscounts.FieldByName('LD_DATESTART').AsDateTime;
//  DateEnd := dmsys.cdsLineDiscounts.FieldByName('LD_DATEEND').AsDateTime;

  DecodeTime(TimeSta, Hour, Min, Sec, MSec);
  edHHIni.Value := Hour;
  edHMIni.Value := Min;

  DecodeTime(TimeEnd, Hour, Min, Sec, MSec);
  edHHFim.Value := Hour;
  edHMFim.Value := Min;

//  dbDataIni.Date := DateSta;
//  dbDataFim.Date := DateEnd;

End;
*)
Procedure TFrmLineDiscounts.GetDateTime;
 Var TimeSta, TimeEnd : TDateTime;  // , DateSta, DateEnd  cidel-
     Hour, Min, Sec, MSec: Word;
Begin
  TimeSta := dmsys.cdsLineDiscounts.FieldByName('LDI_TIMESTART').AsDateTime;
  TimeEnd := dmsys.cdsLineDiscounts.FieldByName('LDI_TIMEEND').AsDateTime;
//  DateSta := dmsys.cdsLineDiscounts.FieldByName('LDI_DATESTART').AsDateTime;
//  DateEnd := dmsys.cdsLineDiscounts.FieldByName('LDI_DATEEND').AsDateTime;

  DecodeTime(TimeSta, Hour, Min, Sec, MSec);
  edHHIni.Value := Hour;
  edHMIni.Value := Min;

  DecodeTime(TimeEnd, Hour, Min, Sec, MSec);
  edHHFim.Value := Hour;
  edHMFim.Value := Min;

//  dbDataIni.Date := DateSta;
//  dbDataFim.Date := DateEnd;

End;

procedure TFrmLineDiscounts.pcBaseCadastroChange(Sender: TObject);
begin
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmLineDiscounts, t_form_objects);
      GetDateTime;
      SetDetail;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmLineDiscounts, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;


Function TFrmLineDiscounts.BeforeApply : Boolean ;
 Var TimeSta, TimeEnd  : TDateTime;
Begin
  Result := True;
  TimeSta := StrtoTime(FloattoStr(edHHini.Value)+':'+FloattoStr(edHMini.Value));
  TimeEnd := StrtoTime(FloattoStr(edHHFim.Value)+':'+FloattoStr(edHMFim.Value));

  dmSys.cdsLineDiscounts.Edit;
  dmSys.cdsLineDiscounts.FieldByname('LDI_TIMESTART').AsDateTime := StrtoDate('01/01/2003') + TimeSta;
  dmSys.cdsLineDiscounts.FieldByname('LDI_TIMEEND').AsDateTime   := StrtoDate('01/01/2003') + TimeEnd;

(*
  //Verifica se este período já está cadastrado...

  dmSys.cdsGeral.Close;
  dmSys.cdsGeral.CommandText := 'SELECT * FROM  LINEDISCOUNTS WHERE LDT_ID = :LDT_ID AND '+
                                '( (LD_DATESTART BETWEEN :LD_DATESTART AND :LD_DATEEND OR '+
                                'LD_DATEEND BETWEEN :LD_DATESTART AND :LD_DATEEND ) OR LD_DATESTART < :LD_DATESTART AND LD_DATEEND > :LD_DATEEND ) AND '+
                                '( (LD_TIMESTART > :LD_TIMESTART AND '+
                                'LD_TIMESTART < :LD_TIMEEND ) OR     '+
                                '(LD_TIMEEND  > :LD_TIMESTART AND    '+
                                'LD_TIMEEND   < :LD_TIMEEND ) OR     '+
                                'LD_TIMESTART <= :LD_TIMESTART AND LD_TIMEEND >= :LD_TIMEEND )';
  dmSys.cdsGeral.Params.ParamByName('LD_DATESTART').AsString := InttoStr(DateTimeToJulian(dbDataIni.Date));
  dmSys.cdsGeral.Params.ParamByName('LD_DATEEND').AsString   := InttoStr(DateTimeToJulian(dbDataFim.Date));
  dmSys.cdsGeral.Params.ParamByName('LD_TIMESTART').AsString := InttoStr(TimeToNbrOfMinutes(TimeSta));
  dmSys.cdsGeral.Params.ParamByName('LD_TIMEEND').AsString   := InttoStr(TimeToNbrOfMinutes(TimeEnd));
  dmSys.cdsGeral.Params.ParamByName('LDT_ID').AsString       := dbLkLinha.KeyValue;
  dmSys.cdsGeral.Open;

  IF dmSys.cdsGeral.RecordCount > 0 Then
     Result := False
  Else
    Begin
      dmSys.cdsLineDiscounts.Edit;
      dmSys.cdsLineDiscounts.FieldByname('LD_DATESTART').AsInteger := DateTimeToJulian(dbDataIni.Date);
      dmSys.cdsLineDiscounts.FieldByname('LD_DATEEND').AsInteger   := DateTimeToJulian(dbDataFim.Date);
      dmSys.cdsLineDiscounts.FieldByname('LD_TIMESTART').AsInteger := TimeToNbrOfMinutes(TimeSta);
      dmSys.cdsLineDiscounts.FieldByname('LD_TIMEEND').AsInteger   := TimeToNbrOfMinutes(TimeEnd);
    End;
  dmSys.cdsGeral.Close;
*)
End;

procedure TFrmLineDiscounts.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsLineDiscounts);
  SetActions([], False, FrmLineDiscounts, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmLineDiscounts, t_form_objects);
  SetChk;
  SetDetail;
  dblkDiscountTypes.SetFocus;
end;

Procedure TFrmLineDiscounts.SetChk;
Begin
  edHHini.Value := 00;
  edHMIni.Value := 00;
  edHHFim.Value := 00;
  edHMFim.Value := 00;
  dblkDiscountTypes.KeyValue := -1;
End;

procedure TFrmLineDiscounts.actEditExecute(Sender: TObject);
begin
  inherited;
  GetDateTime;
  SetActions([], False, FrmLineDiscounts, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmLineDiscounts, t_form_objects);
  SetDetail;
  dblkDiscountTypes.SetFocus;
end;

Procedure TFrmLineDiscounts.SetDetail;
Begin
//  IF Status = stInsert
//    Then dbLkLinha.Enabled := True
//    Else dbLkLinha.Enabled := False;
End;

procedure TFrmLineDiscounts.actApplyUpdatesExecute(Sender: TObject);
begin
  IF (Trim(dbDataI.text) = '/  /') Then
    Begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbDataI.SetFocus;
    End
  Else
  IF (Trim(dbDataF.text) = '/  /') Then
    Begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     dbDataF.SetFocus;
    End
  Else
  If (dbDataI.Date < 0) Then
    Begin
     DisplayMsg(t_form_objects, '%T %T', [1077, 1505], []);
     dbDataI.SetFocus;
    End
  Else
  If (dbDataF.Date < 0) Then
    Begin
     DisplayMsg(t_form_objects, '%T %T', [1077, 1505], []);
     dbDataF.SetFocus;
    End
  Else
  IF dbDataI.Date > dbDataF.Date Then
    Begin
     DisplayMsg(t_form_objects, '%T', [1530], []);
     dbDataF.SetFocus;
    End
  Else
  Begin
     inherited;
      If  status = stConsult Then
        BEGIN
        BeforeApply;
         If ApplyTablesSys([dblkDiscountTypes, dbValue], [DmSys.cdsLineDiscounts]) Then
             begin
              SetActions([], True, FrmLineDiscounts, t_form_objects);
              SetActions([actApplyUpdates, actCancel], False, FrmLineDiscounts, t_form_objects);
              tbtnRefresh.Click;
             end;
        END;
  End;
  actLog.Enabled := DmSys.cdsLineDiscounts.RecordCount > 0
end;

procedure TFrmLineDiscounts.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmSys.cdsLineDiscounts.Cancel;
     SetActions([], True, FrmLineDiscounts, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmLineDiscounts, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsLineDiscounts.RecordCount > 0
end;

procedure TFrmLineDiscounts.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     with DmSys do
        Begin
         cdsLineDiscounts.Edit;
         cdsLineDiscounts.FieldByName('LDI_STATUS').AsString := 'I';
         cdsLineDiscounts.FieldByName('STATUS_ID').AsString := 'I';
         cdsLineDiscounts.Post;
         cdsLineDiscounts.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
 actLog.Enabled := DmSys.cdsLineDiscounts.RecordCount > 0
end;

Procedure TFrmLineDiscounts.actFirstExecute(Sender: TObject);
begin
  inherited;
  GetDateTime
end;

procedure TFrmLineDiscounts.actPriorExecute(Sender: TObject);
begin
  inherited;
  GetDateTime
end;

procedure TFrmLineDiscounts.actNextExecute(Sender: TObject);
begin
  inherited;
  GetDateTime
end;

procedure TFrmLineDiscounts.actLastExecute(Sender: TObject);
begin
  inherited;
  GetDateTime
end;

procedure TFrmLineDiscounts.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;
  ccardLineDiscounts : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';


     If Trim(edDiscountTypes.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LDI.DT_ID = ' + QuotedStr(edDiscountTypes.KeyValue) + ' AND ';
       end;

     If Trim(edDtInicial.text) <> '/  /' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LDI.LDI_DATESTART = ' + QuotedStr(FormatDateTime('dd-mmm-yyyy',edDtInicial.Date)) + ' AND ';
       end;

     If Trim(edDtFinal.text) <> '/  /' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LDI.LDI_DATEEND = ' + QuotedStr(FormatDateTime('dd-mmm-yyyy',edDtFinal.Date)) + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LDI.LDI_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LDI.LDI_STATUS = ' + QuotedStr('I') + ' AND ';
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
      ccardLineDiscounts := ' LDI.*, LDI.LDI_STATUS AS STATUS_ID, DT.DT_DESC';

      cdsLineDiscounts.Close;
      cdsLineDiscounts.CommandText := 'SELECT '+ ccardLineDiscounts +' FROM LINEDISCOUNTS LDI ' +
      'LEFT JOIN DISCOUNTTYPES DT ON (DT.DT_ID = LDI.DT_ID) '+
      strWhere+
      ' ORDER BY LDI_DATESTART, LDI_TIMESTART,  LDI_DATEEND, LDI_TIMEEND';
      cdsLineDiscounts.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LDI.LDI_ID', 'FROM LINEDISCOUNTS LDI', 'True', strWhere) ) + ' Registro(s)';
    end;
  actLog.Enabled := DmSys.cdsLineDiscounts.RecordCount > 0
end;

procedure TFrmLineDiscounts.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
end;

procedure TFrmLineDiscounts.edHHiniChange(Sender: TObject);
begin
  inherited;
 If Length(edHHini.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);
end;

procedure TFrmLineDiscounts.edHMIniChange(Sender: TObject);
begin
  inherited;
 If Length(edHMIni.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);
end;

procedure TFrmLineDiscounts.edHHFimChange(Sender: TObject);
begin
  inherited;
 If Length(edHHFim.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);
end;

procedure TFrmLineDiscounts.edHMFimChange(Sender: TObject);
begin
  inherited;
 If Length(edHMFim.Text) >= 2 Then
    SendMessage(Handle,WM_NEXTDLGCTL,0,0);
end;

procedure TFrmLineDiscounts.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsLineDiscounts;
end;

procedure TFrmLineDiscounts.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '20';
  FrmSystemLog.pSLG_ID := DmSys.cdsLineDiscounts.FieldByName('LDI_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

end.
