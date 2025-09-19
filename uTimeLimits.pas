unit uTimeLimits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, DBCtrls, Mask, CurrEdit, ToolEdit,
  RxDBComb, Buttons, RXCtrls;

type
  TFrmTimeLimits = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbDesc: TDBEdit;
    GroupBox2: TGroupBox;
    dbchkSegunda: TDBCheckBox;
    dbchkTerca: TDBCheckBox;
    dbchkQuarta: TDBCheckBox;
    dbchkQuinta: TDBCheckBox;
    dbchkSexta: TDBCheckBox;
    dbchkSabado: TDBCheckBox;
    dbchkDomingo: TDBCheckBox;
    dbchkFeriadoEsc: TDBCheckBox;
    dbchkFeriadoNac: TDBCheckBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    edHHini: TCurrencyEdit;
    Label4: TLabel;
    edHMIni: TCurrencyEdit;
    edHHFim: TCurrencyEdit;
    Label3: TLabel;
    Label5: TLabel;
    edHMFim: TCurrencyEdit;
    edDesc: TEdit;
    lkFilterStatus: TComboBox;
    Label10: TLabel;
    Label6: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    Label8: TLabel;
    lbFiltrado: TLabel;
    btnLimpaStatus: TSpeedButton;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
     Procedure SetChk(Status : Boolean);
     Procedure GetTime;
     Function ActionBeforeApply : Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTimeLimits: TFrmTimeLimits;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uFrmBaseCadastro, uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeLimits.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeLimits.FormShow(Sender: TObject);
begin
  inherited;
//    ccardTimeLimits =  'TL_ID, TL_DESC, TL_STATIME, TL_ENDTIME, TL_MONDAY, TL_TUESDAY, TL_WEDNESDAY, TL_THURSDAY, TL_FRIDAY, TL_SATURDAY,'+
//                       'TL_SUNDAY, TL_SCHOOLHOLIDAY, TL_OFFHOLIDAY, TL_STATUS, TL_STATUS AS STATUS_ID, TL_REGDATE, TL_REGUSER';
//    cdsTimeLimits.CommandText := 'SELECT '+ ccardTimeLimits +' From TIMELIMITS ' + strWhere + ' ORDER BY TL_DESC';
    defOrder:=' ORDER BY TL_DESC ';
    strOrder:=defOrder;
    ct:='SELECT '+ ccardTimeLimits +' FROM TIMELIMITS %where% %order%';
    DmSys.cdsTimeLimits.CommandText := 'SELECT '+ ccardTimeLimits +' From TIMELIMITS ORDER BY TL_DESC';
    OpenTablesSys([DmSys.cdsTimeLimits]);

//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('TL_ID', 'FROM TIMELIMITS', 'True', ' WHERE TL_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsTimeLimits.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    actLog.Enabled := DmSys.cdsTimeLimits.RecordCount > 0
end;

Procedure TFrmTimeLimits.GetTime;
 Var TimeSta, TimeEnd  : TDateTime;
     Hour, Min, Sec, MSec: Word;
Begin
  TimeSta := dmsys.cdsTimeLimits.FieldByName('TL_STATIME').AsDateTime;
  TimeEnd := dmsys.cdsTimeLimits.FieldByName('TL_ENDTIME').AsDateTime;

  DecodeTime(TimeSta, Hour, Min, Sec, MSec);
  edHHIni.Value := Hour;
  edHMIni.Value := Min;

  DecodeTime(TimeEnd, Hour, Min, Sec, MSec);
  edHHFim.Value := Hour;
  edHMFim.Value := Min;

End;

procedure TFrmTimeLimits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys.cdsTimeLimits]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  DmSys.cdsTimeLimits.CommandText := 'SELECT '+ ccardTimeLimits +' From TIMELIMITS where TL_STATUS = ''A'' ORDER BY TL_DESC';  
  FrmTimeLimits := Nil;
end;



procedure TFrmTimeLimits.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsTimeLimits);
  SetActions([], False, FrmTimeLimits, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmTimeLimits, t_form_objects);
  SetChk(False);
  dbDesc.SetFocus;
end;

Procedure TFrmTimeLimits.SetChk(Status : Boolean);
Begin
  edHHini.Value := 00;
  edHMIni.Value := 00;
  edHHFim.Value := 00;
  edHMFim.Value := 00;
  dbchkSegunda.Checked  := Status;
  dbchkTerca.Checked    := Status;
  dbchkQuarta.Checked   := Status;
  dbchkQuinta.Checked   := Status;
  dbchkSexta.Checked    := Status;
  dbchkSabado.Checked   := Status;
  dbchkDomingo.Checked  := Status;
  dbchkFeriadoEsc.Checked := Status;
  dbchkFeriadoNac.Checked := Status;
End;


procedure TFrmTimeLimits.actEditExecute(Sender: TObject);
begin
  inherited;
  GetTime;
  SetActions([], False, FrmTimeLimits, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmTimeLimits, t_form_objects);
  dbDesc.SetFocus;
end;

Function TFrmTimeLimits.ActionBeforeApply : Boolean;
 Var TimeSta, TimeEnd  : TDateTime;
Begin
  Result := True;
  TimeSta := StrtoDate('01/01/2003') + StrtoTime(FloattoStr(edHHini.Value)+':'+FloattoStr(edHMini.Value));
  TimeEnd := StrtoDate('01/01/2003') + StrtoTime(FloattoStr(edHHFim.Value)+':'+FloattoStr(edHMFim.Value));

  dmSys.cdsTimeLimits.Edit;
  dmSys.cdsTimeLimits.FieldByname('TL_STATIME').AsDateTime := TimeSta;
  dmSys.cdsTimeLimits.FieldByname('TL_ENDTIME').AsDateTime := TimeEnd;

  If TimeSta > TimeEnd Then
     Result := False;
End;


procedure TFrmTimeLimits.actApplyUpdatesExecute(Sender: TObject);
begin
 If NOT (ActionBeforeApply) Then
    Begin
      DisplayMsg(t_form_objects, '%T', [2801], [], mtError, [mbOK]);
      edHHini.SetFocus;
      Exit;
    End;

  inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys.cdsTimeLimits]) Then
         begin
          SetActions([], True, FrmTimeLimits, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmTimeLimits, t_form_objects);
          actRefresh.Execute;
         end;
    END;
  actLog.Enabled := DmSys.cdsTimeLimits.RecordCount > 0;
end;


procedure TFrmTimeLimits.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmSys.cdsTimeLimits.Cancel;
     SetActions([], True, FrmTimeLimits, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmTimeLimits, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsTimeLimits.RecordCount > 0
end;

procedure TFrmTimeLimits.pcBaseCadastroChange(Sender: TObject);
begin
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmTimeLimits, t_form_objects);
      GetTime;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmTimeLimits, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmTimeLimits.actFirstExecute(Sender: TObject);
begin
  inherited;
GetTime
end;

procedure TFrmTimeLimits.actPriorExecute(Sender: TObject);
begin
  inherited;
GetTime
end;

procedure TFrmTimeLimits.actNextExecute(Sender: TObject);
begin
  inherited;
GetTime
end;

procedure TFrmTimeLimits.actLastExecute(Sender: TObject);
begin
  inherited;
GetTime
end;

procedure TFrmTimeLimits.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     with DmSys do
        Begin
         cdsTimelimits.Edit;
         cdsTimelimits.FieldByName('TL_STATUS').AsString := 'I';
         cdsTimelimits.FieldByName('STATUS_ID').AsString := 'I';
         cdsTimelimits.Post;
         cdsTimelimits.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
   actLog.Enabled := DmSys.cdsTimeLimits.RecordCount > 0
end;

procedure TFrmTimeLimits.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TL_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' TL_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' TL_STATUS = ' + QuotedStr('I') + ' AND ';
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
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
      cdsTimeLimits.Close;
      cdsTimeLimits.CommandText := 'SELECT '+ ccardTimeLimits +' From TIMELIMITS ' + strWhere + strOrder; //' ORDER BY TL_DESC';
      cdsTimeLimits.Open;

//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('TL_ID', 'FROM TIMELIMITS', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsTimeLimits.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := DmSys.cdsTimeLimits.RecordCount > 0
end;

procedure TFrmTimeLimits.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
  GetTime;
end;

procedure TFrmTimeLimits.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsTimeLimits;
end;

procedure TFrmTimeLimits.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '17';
  FrmSystemLog.pSLG_ID := DmSys.cdsTimeLimits.FieldByName('TL_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeLimits.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmTimeLimits.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmTimeLimits.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmTimeLimits.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeLimits.lbFiltradoClick(Sender: TObject);
Var i,j: Integer;
begin
j:=0;
FOR i := 0 to gbFiltro.ControlCount - 1
DO BEGIN {$include Limpa_Filtro.pas} END;
IF j <> gbFiltro.ControlCount
THEN BEGIN
     ShowMessage('ERRO DO SISTEMA:'#13#10'Falta componente(s) na Limpa Filtro');
     END
ELSE tbtnFiltrar.Click;
grdResultado.SetFocus;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeLimits.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
