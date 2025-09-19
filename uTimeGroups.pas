unit uTimeGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb, Buttons,
  RXCtrls;

type
  TFrmTimeGroups = class(TFrmBaseSys)
    Label2: TLabel;
    edDesc: TEdit;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dbDesc: TDBEdit;
    Label5: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    lbDisponiveis: TListBox;
    GroupBox5: TGroupBox;
    lbSelecionadas: TListBox;
    Panel1: TPanel;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    actAddTime: TAction;
    actAddAllTimes: TAction;
    actDelTime: TAction;
    actDelAllTimes: TAction;
    btnLimpaStatus: TSpeedButton;
    lbFiltrado: TLabel;
    Panel2: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure actAddAllTimesExecute(Sender: TObject);
    procedure actAddTimeExecute(Sender: TObject);
    procedure actDelTimeExecute(Sender: TObject);
    procedure actDelAllTimesExecute(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure BeforePost;
  public
    Procedure ListaTimeLimits;
    Procedure SetStatusPanels(Status : Boolean); Override;
    { Public declarations }
  end;

var
  FrmTimeGroups: TFrmTimeGroups;

implementation

uses uDmSys, AppSparkSysMain,  uConst, uGeralFunctions, uDmConexao,
  uFrmBaseCadastro, uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeGroups.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeGroups.FormShow(Sender: TObject);
begin
  inherited;
   defOrder:=' ORDER BY TG_ID ';
   strOrder:=defOrder;
   ct:='SELECT '+ ccardTimeGroups +' FROM TIMEGROUPS %where% %order%';

   DmSys.cdsTimeGroups.CommandText:='SELECT '+ ccardTimeGroups +' FROM TIMEGROUPS ORDER BY TG_ID';
   OpenTablesSys([DmSys.cdsTimeGroups, DmSys.cdsTimeGroupsXTimeLimits]);

// FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('TG_ID', 'FROM TIMEGROUPS', 'True', ' WHERE TG_STATUS = ''A'' ') ) + ' Registro(s)';
   lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsTimeGroups.RecordCount)+' registro(s)';
   FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

   ListaTimeLimits;
   actLog.Enabled := DmSys.cdsTimeGroups.RecordCount > 0
end;

Procedure TFrmTimeGroups.SetStatusPanels(Status : Boolean);
Begin
  cbLineMt.Enabled := Status;
End;

procedure TFrmTimeGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   CloseTablesSys([DmSys.cdsTimeGroups, DmSys.cdsTimeGroupsXTimeLimits]);
   FrmSparksysMain.stMain.Panels[3].Text := '';
   DmSys.cdsTimeGroups.CommandText := 'SELECT '+ ccardTimeGroups +' From TIMEGROUPS where TG_STATUS = ''A'' ORDER BY TG_ID';
   FrmTimeGroups := Nil;
end;

procedure TFrmTimeGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsTimeGroups);
  ListaTimeLimits;
  SetActions([], False, FrmTimeGroups, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmTimeGroups, t_form_objects);
  dbDesc.SetFocus;
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

procedure TFrmTimeGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmTimeGroups, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmTimeGroups, t_form_objects);
//  ListaTimeLimits;
  dbDesc.SetFocus;
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;


procedure TFrmTimeGroups.BeforePost;
Var
 vTG_ID : Integer;
Begin
  vTG_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('TIMEGROUPS', 'TG_ID', 'False', '' );

  DmSys.cdsTimeGroupsXTimeLimits.First;
  While NOT DmSys.cdsTimeGroupsXTimeLimits.Eof do
     Begin
       DmSys.cdsTimeGroupsXTimeLimits.Edit;
       DmSys.cdsTimeGroupsXTimeLimits.FieldByName('TG_ID').AsInteger := vTG_ID;
       DmSys.cdsTimeGroupsXTimeLimits.Post;
     End;
End;

procedure TFrmTimeGroups.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     IF (dtsMaster.DataSet.State = dsInsert) Then
       BeforePost;
     If ApplyTablesSys([dbDesc], [DmSys.cdsTimeGroups,
                                  DmSys.cdsTimeGroupsXTimeLimits]) Then
         begin
          SetActions([], True, FrmTimeGroups, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmTimeGroups, t_form_objects);
          actRefresh.Execute;
          SetStatusPanels(False);
         end;
    END;
  actLog.Enabled := DmSys.cdsTimeGroups.RecordCount > 0;
  
end;

procedure TFrmTimeGroups.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmSys.cdsTimeGroups.Cancel;
     DmSys.cdsTimeGroupsXTimeLimits.Cancel;
     DmSys.cdsTimeGroupsXTimeLimits.Close;
     DmSys.cdsTimeGroupsXTimeLimits.Open;
     SetActions([], True, FrmTimeGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmTimeGroups, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     SetStatusPanels(False);
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsTimeGroups.RecordCount > 0
end;

procedure TFrmTimeGroups.actDeleteExecute(Sender: TObject);
begin
//  inherited;
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin

     with DmSys do
        Begin
         cdsTimeGroups.Edit;
         cdsTimeGroups.FieldByName('TG_STATUS').AsString := 'I';
         cdsTimeGroups.FieldByName('STATUS_ID').AsString := 'I';
         cdsTimeGroups.Post;
         cdsTimeGroups.ApplyUpdates(-1);
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsTimeGroups.RecordCount > 0
  
end;

procedure TFrmTimeGroups.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetActions([actFilter, actDelete, actRefresh], False, FrmTimeGroups, t_form_objects);
      ListaTimeLimits;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmTimeGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmTimeGroups.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' TG_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' TG_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' TG_STATUS = ' + QuotedStr('I') + ' AND ';
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
      // colocar em uConst
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
      cdsTimeGroups.Close;
      cdsTimeGroups.CommandText := 'SELECT '+ ccardTimeGroups +' From TIMEGROUPS ' + strWhere + strOrder; //'ORDER BY TG_ID';
      cdsTimeGroups.Open;

//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('TG_ID', 'FROM TIMEGROUPS', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsTimeGroups.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := DmSys.cdsTimeGroups.RecordCount > 0

end;

Procedure TFrmTimeGroups.ListaTimeLimits;
Begin
  With dmSys do
    Begin
     lbDisponiveis.DragMode := dmManual;
     lbSelecionadas.DragMode := dmManual;
     lbSelecionadas.Clear;
     lbDisponiveis.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT TL_ID, TL_DESC FROM TIMELIMITS WHERE TL_STATUS = ''A'' ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF cdsTimeGroupsXTimeLimits.Locate('TL_ID', cdsGeral.fieldByName('TL_ID').AsString, [] )
               Then lbSelecionadas.Items.AddObject(cdsGeral.fieldByName('TL_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('TL_ID').AsInteger))
               Else lbDisponiveis.Items.AddObject(cdsGeral.fieldByName('TL_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('TL_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
End;

procedure TFrmTimeGroups.lbDisponiveisDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnDelAllLineMt.Click; 
end;

procedure TFrmTimeGroups.lbDisponiveisDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmTimeGroups.lbSelecionadasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
   btnAddAllLineMt.Click;
end;

procedure TFrmTimeGroups.lbSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmTimeGroups.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsTimeGroups;
  SetStatusPanels(False);
end;

procedure TFrmTimeGroups.actAddAllTimesExecute(Sender: TObject);
Var
 I : Integer;
begin
  For I := 0 to lbDisponiveis.Count - 1 do
     Begin
       dmSys.cdsTimeGroupsXTimeLimits.Append;
       dmSys.cdsTimeGroupsXTimeLimits.FieldByName('TG_ID').AsInteger      := DmSys.cdsTimeGroups.fieldByName('TG_ID').AsInteger;
       dmSys.cdsTimeGroupsXTimeLimits.FieldByName('TL_ID').AsInteger      := Integer(lbDisponiveis.items.Objects[I]);
       dmSys.cdsTimeGroupsXTimeLimits.FieldByName('TGTL_STATUS').AsString := 'A';
       dmSys.cdsTimeGroupsXTimeLimits.FieldByName('STATUS_ID').AsString   := 'Ativo';
       dmSys.cdsTimeGroupsXTimeLimits.Post;

       lbSelecionadas.Items.AddObject(lbDisponiveis.Items.Strings[I],
                                      lbDisponiveis.items.Objects[I]);
//      lbDispStates.MoveSelection(lbSelStates);
     End;

    lbDisponiveis.SelectAll;
    lbDisponiveis.DeleteSelected;

end;

procedure TFrmTimeGroups.actAddTimeExecute(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  For I := 0 to lbDisponiveis.Count - 1 do
      IF lbDisponiveis.Selected[I] Then
         Begin
            dmSys.cdsTimeGroupsXTimeLimits.Append;
            dmSys.cdsTimeGroupsXTimeLimits.FieldByName('TG_ID').AsInteger      := DmSys.cdsTimeGroups.fieldByName('TG_ID').AsInteger;
            dmSys.cdsTimeGroupsXTimeLimits.FieldByName('TL_ID').AsInteger      := Integer(lbDisponiveis.items.Objects[I]);
            dmSys.cdsTimeGroupsXTimeLimits.FieldByName('TGTL_STATUS').AsString := 'A';
            dmSys.cdsTimeGroupsXTimeLimits.FieldByName('STATUS_ID').AsString   := 'Ativo';
            dmSys.cdsTimeGroupsXTimeLimits.Post;
         End;

  lbDisponiveis.MoveSelection(lbSelecionadas);

end;

procedure TFrmTimeGroups.actDelTimeExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
  For I := 0 to lbSelecionadas.Count - 1 do
      IF lbSelecionadas.Selected[I] Then
         Begin
           IF dmSys.cdsTimeGroupsXTimeLimits.Locate('TG_ID;TL_ID',VarArrayOf([
              dmSys.cdsTimeGroups.FieldByName('TG_ID').AsString,
              InttoStr(Integer(lbSelecionadas.items.Objects[I])) ]), [])
           Then
              dmSys.cdsTimeGroupsXTimeLimits.Delete;
         End;

  lbSelecionadas.MoveSelection(lbDisponiveis);

end;

procedure TFrmTimeGroups.actDelAllTimesExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
  For I := 0 to lbSelecionadas.Count - 1 do
     Begin
       IF dmSys.cdsTimeGroupsXTimeLimits.Locate('TG_ID;TL_ID',VarArrayOf([
          dmSys.cdsTimeGroups.FieldByName('TG_ID').AsString,
          InttoStr(Integer(lbSelecionadas.items.Objects[I])) ]), [])
       Then
          dmSys.cdsTimeGroupsXTimeLimits.Delete;

       lbDisponiveis.Items.AddObject(lbSelecionadas.Items.Strings[I],
                                     lbSelecionadas.items.Objects[I]);
//      lbDispStates.MoveSelection(lbSelStates);
     End;

    lbSelecionadas.SelectAll;
    lbSelecionadas.DeleteSelected;
end;

procedure TFrmTimeGroups.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '18';
  FrmSystemLog.pSLG_ID := DmSys.cdsTimeGroups.FieldByName('TG_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeGroups.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmTimeGroups.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmTimeGroups.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmTimeGroups.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeGroups.lbFiltradoClick(Sender: TObject);
Var i,j: Integer;
begin
j:=0;
FOR i := 0 to gbFiltro.ControlCount - 1
DO BEGIN
{$include Limpa_Filtro.pas}
   END;
IF j <> gbFiltro.ControlCount
THEN BEGIN
     ShowMessage('ERRO DO SISTEMA:'#13#10'Falta componente(s) na Limpa Filtro');
     END
ELSE tbtnFiltrar.Click;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTimeGroups.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
