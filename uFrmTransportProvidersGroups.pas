unit uFrmTransportProvidersGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, Buttons,
  RXCtrls;

type
  TfrmTransportProvidersGroups = class(TFrmBaseSys)
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    lbDisponiveis: TListBox;
    lbSelecionadas: TListBox;
    cbTransportproviders: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    Label2: TLabel;
    eDesc: TEdit;
    Label1: TLabel;
    actNewLineMt: TAction;
    actNewAllLineMt: TAction;
    actDelLineMt: TAction;
    actDeAlllLineMt: TAction;
    dbedDesc: TDBLookupComboBox;
    Panel1: TPanel;
    lbFiltrado: TLabel;
    Panel2: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewAllLineMtExecute(Sender: TObject);
    procedure actNewLineMtExecute(Sender: TObject);
    procedure actDelLineMtExecute(Sender: TObject);
    procedure actDeAlllLineMtExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dtsMasterDataChange(Sender: TObject; Field: TField);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedDescClick(Sender: TObject);
    procedure MudaSourceCombo(Todos : Boolean);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String;
    Procedure BeforePost;
    Procedure ActiveLines(Status : Boolean);
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
  public
    Procedure SetLines;
    { Public declarations }
  end;

var
  frmTransportProvidersGroups: TfrmTransportProvidersGroups;

implementation

uses uDmSys, uFrmBaseCadastro, AppSparkSysMain, uGeralFunctions, uDmBase,
  uDmSys1, uConst, uDmConexao, uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmTransportProvidersGroups.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmTransportProvidersGroups.FormShow(Sender: TObject);
begin
  inherited;
  ct:='SELECT DISTINCT(ATP.TP_ID), TP1.TP_DESC '+
      'FROM ACCEPTEDTRANSPORTPROVIDERS ATP '+
      'LEFT JOIN TRANSPORTPROVIDERS TP1 ON TP1.TP_ID = ATP.TP_ID '+
      '%where% %order% ';
  defOrder:=' ORDER BY ATP.TP_ID ';
  strOrder:=defOrder;
  OpenTablesSys([DmSYs.cdsTransportProviders, DmSys1.cdsTransportProvidersGroups, DmSys1.cdsAcceptedTransportProviders, DmSys1.cdsLKTransportProviders, dmsys1.cdsLisTransportProviders]);

  lblContador.Caption:=FormatFloat('#,##0',DmSys1.cdsTransportProvidersGroups.RecordCount)+' registro(s)';
  FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

  actLog.Enabled := DmSys1.cdsTransportProvidersGroups.RecordCount > 0;
end;

procedure TfrmTransportProvidersGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   CloseTablesSys([DmSYs.cdsTransportProviders, DmSys1.cdsAcceptedTransportProviders, DmSys1.cdsTransportProvidersGroups, DmSys1.cdsLKTransportProviders, dmsys1.cdsLisTransportProviders]);
   FrmSparksysMain.stMain.Panels[3].Text := '';
   FrmTransportProvidersGroups := Nil;
end;

procedure TfrmTransportProvidersGroups.actNewAllLineMtExecute(
  Sender: TObject);
begin
  inherited;
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TfrmTransportProvidersGroups.actNewLineMtExecute(
  Sender: TObject);
begin
  inherited;
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TfrmTransportProvidersGroups.actDelLineMtExecute(
  Sender: TObject);
begin
  inherited;
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TfrmTransportProvidersGroups.actDeAlllLineMtExecute(
  Sender: TObject);
begin
  inherited;
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

Procedure TfrmTransportProvidersGroups.SetLines;
Begin
  With DmSys1 do
     Begin
        lbDisponiveis.DragMode  := dmManual;
        lbSelecionadas.DragMode := dmManual;
        if cdsAcceptedTransportProviders.State <> dsInsert then
          cdsAcceptedTransportProviders.First;
        cdsLisTransportProviders.First;
        lbSelecionadas.Items.Clear;
        lbDisponiveis.Items.Clear;

        if cdsAcceptedTransportProviders.State <> dsInsert then
        begin
          While not cdsAcceptedTransportProviders.eof do
          Begin
            lbSelecionadas.Items.AddObject(cdsAcceptedTransportProviders.fieldByName('ACTP_TPID').AsString + #9+
                                           cdsAcceptedTransportProviders.fieldByName('TP_DEST').AsString,
                                           TObject(cdsAcceptedTransportProviders.fieldByName('ACTP_TPID').AsInteger));
            cdsAcceptedTransportProviders.Next;
          End;

          While not cdsLisTransportProviders.eof do
          Begin
            cdsAcceptedTransportProviders.First;
            if not cdsAcceptedTransportProviders.Locate('ACTP_TPID', cdsLisTransportProviders.FieldByName('TP_ID').AsString, []) then
              lbDisponiveis.Items.AddObject(cdsLisTransportProviders.fieldByName('TP_ID').AsString + #9+
                                            cdsLisTransportProviders.fieldByName('TP_DESC').AsString,
                                            TObject(cdsLisTransportProviders.fieldByName('TP_ID').AsInteger));
              cdsLisTransportProviders.Next;
          End;
        end
        else
        begin
          dmSys.cdsTransportProviders.First;
          While not dmSys.cdsTransportProviders.eof do
          Begin
//              if dmSys.cdsTransportProviders.fieldByName('TP_ID').AsInteger <> cdsAcceptedTransportProviders.FieldByName('TP_ID').AsInteger then
                lbDisponiveis.Items.AddObject(dmSys.cdsTransportProviders.fieldByName('TP_ID').AsString + #9+
                                              dmSys.cdsTransportProviders.fieldByName('TP_DESC').AsString,
                                              TObject(dmSys.cdsTransportProviders.fieldByName('TP_ID').AsInteger));
              dmSys.cdsTransportProviders.Next;
          End;
          dmSys.cdsTransportProviders.First;
        end;
     End;
End;


Procedure TfrmTransportProvidersGroups.ActiveLines(Status : Boolean);
Begin
  cbTransportproviders.Enabled  := Status;
End;


procedure TfrmTransportProvidersGroups.actInsertExecute(Sender: TObject);
begin
  if dmSys1.cdsLKTransportProviders.RecordCount < 1 then
  begin
    DisplayMsg(t_form_objects, 'Não há nenhuma empresa disponível para relacionamento.  ', [], [], mtInformation, [mbYes]);
    exit;
  end;

  MudaSourceCombo(False);

  inherited;
  ActionInsertSys(DmSys1.cdsAcceptedTransportProviders);
  SetActions([], False, FrmTransportProvidersGroups, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel, actNewLineMt, actNewAllLineMt, actDelLineMt, actDeAlllLineMt], true, FrmTransportProvidersGroups, t_form_objects);
  ActiveLines(True);
  dbedDesc.Enabled := True;
//  dbedDesc.SetFocus;
  if (dmSys1.cdsAcceptedTransportProviders.Active) and (dmSys1.cdsLisTransportProviders.Active) then
    SetLines;
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;


procedure TfrmTransportProvidersGroups.pcBaseCadastroChange(
  Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      if (dmSys1.cdsAcceptedTransportProviders.Active) and (dmSys1.cdsLisTransportProviders.Active) then
        SetLines;
//      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmTransportProvidersGroups, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmTransportProvidersGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TfrmTransportProvidersGroups.grdResultadoDblClick(
  Sender: TObject);
begin
  inherited;
  if (dmSys1.cdsAcceptedTransportProviders.Active) and (dmSys1.cdsLisTransportProviders.Active) then
    SetLines;
end;

procedure TfrmTransportProvidersGroups.actEditExecute(Sender: TObject);
begin
  inherited;

  SetActions([], False, FrmTransportProvidersGroups, t_form_objects);
  actLog.Enabled := False;
//  SetActions([actApplyUpdates, actCancel], True, FrmTransportProvidersGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewLineMt, actNewAllLineMt, actDelLineMt, actDeAlllLineMt], True, FrmTransportProvidersGroups, t_form_objects);
  ActiveLines(True);
  dbedDesc.Enabled := False;

  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

Procedure TfrmTransportProvidersGroups.BeforePost;
Var
 vTPG_ID : Integer;
 I, iId : Integer;
Begin
  iId := Dmsys1.cdsAcceptedTransportProviders.FieldByName('TP_ID').AsInteger;

  if Dmsys1.cdsAcceptedTransportProviders.State = dsInsert then
    Dmsys1.cdsAcceptedTransportProviders.Cancel;

  Dmsys1.cdsAcceptedTransportProviders.First;
  while not Dmsys1.cdsAcceptedTransportProviders.Eof do
  begin
    if iId = Dmsys1.cdsAcceptedTransportProviders.FieldByName('TP_ID').AsInteger then
      Dmsys1.cdsAcceptedTransportProviders.Delete
    else
      Dmsys1.cdsAcceptedTransportProviders.Next;
  end;



  For I :=  0 TO lbSelecionadas.Items.Count - 1  do
       Begin
         Dmsys1.cdsAcceptedTransportProviders.Append;
//         Dmsys1.cdsAcceptedTransportProviders.FieldByName('TP_ID').AsInteger     := DmSys1.cdsTransportProvidersGroups.FieldByName('TP_ID').AsInteger;
         Dmsys1.cdsAcceptedTransportProviders.FieldByName('TP_ID').AsInteger     := iId;
         Dmsys1.cdsAcceptedTransportProviders.FieldByName('ACTP_TPID').AsInteger := Integer(lbSelecionadas.Items.Objects[I]);
         Dmsys1.cdsAcceptedTransportProviders.Post;
       End;
End;


procedure TfrmTransportProvidersGroups.actApplyUpdatesExecute(
  Sender: TObject);
begin
  if Trim(dbedDesc.Text) = '' then
  begin
    DisplayMsg(t_form_objects, 'Campo obrigatório.  ', [], [], mtInformation, [mbYes]);
    dbedDesc.SetFocus;
    exit;
  end;

  if lbSelecionadas.Items.Count < 1 then
  begin
    DisplayMsg(t_form_objects, 'É necessário no mínimo um relacionamento.  ', [], [], mtInformation, [mbYes]);
    exit;
  end;


  inherited;
      If  status = stConsult Then
        BEGIN
         BeforePost;
         If ApplyTablesSys([], [DmSys1.cdsAcceptedTransportProviders])
          Then
             begin
              CloseTablesSys([DmSYs.cdsTransportProviders, DmSys1.cdsAcceptedTransportProviders, DmSys1.cdsTransportProvidersGroups, DmSys1.cdsLKTransportProviders, dmsys1.cdsLisTransportProviders]);
              OpenTablesSys([DmSYs.cdsTransportProviders, DmSys1.cdsTransportProvidersGroups, DmSys1.cdsAcceptedTransportProviders, DmSys1.cdsLKTransportProviders, dmsys1.cdsLisTransportProviders]);
              MudaSourceCombo(True);
              dbedDesc.Enabled := False;
              SetActions([], True, FrmTransportProvidersGroups, t_form_objects);
//              SetActions([actApplyUpdates, actCancel], False, FrmTransportProvidersGroups, t_form_objects);
              SetActions([actApplyUpdates, actCancel, actNewLineMt, actNewAllLineMt, actDelLineMt, actDeAlllLineMt], False, FrmTransportProvidersGroups, t_form_objects);
              tbtnRefresh.Click;
              ActiveLines(False);
             end;
        END;
  actLog.Enabled := DmSys1.cdsTransportProvidersGroups.RecordCount > 0
end;

procedure TfrmTransportProvidersGroups.lbDisponiveisDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btnDelAllLineMt.Click;
end;

procedure TfrmTransportProvidersGroups.lbDisponiveisDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TfrmTransportProvidersGroups.lbSelecionadasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btnAddAllLineMt.Click;
end;

procedure TfrmTransportProvidersGroups.lbSelecionadasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TfrmTransportProvidersGroups.dtsMasterDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  If (dtsMaster.DataSet.State = dsBrowse) and (dmSys1.cdsAcceptedTransportProviders.Active) and (dmSys1.cdsLisTransportProviders.Active) then
    SetLines;
end;

procedure TfrmTransportProvidersGroups.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     DmSys1.cdsAcceptedTransportProviders.Cancel;
     DmSys1.cdsAcceptedTransportProviders.CancelUpdates;
     DmSys1.cdsAcceptedTransportProviders.First;
     dbedDesc.Enabled := False;
     MudaSourceCombo(True);
     SetActions([], True, FrmTransportProvidersGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel, actNewLineMt, actNewAllLineMt, actDelLineMt, actDeAlllLineMt], False, FrmTransportProvidersGroups, t_form_objects);
//     SetActions([actApplyUpdates, actCancel], False, FrmTransportProvidersGroups, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     ActiveLines(False);
     actRefresh.Execute;
    end;
  actLog.Enabled := DmSys1.cdsTransportProvidersGroups.RecordCount > 0;

end;

procedure TfrmTransportProvidersGroups.actDeleteExecute(Sender: TObject);
var
  iId : Integer;
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     iId := DmSys1.cdsAcceptedTransportProviders.FieldByName('TP_ID').AsInteger;
     with DmSys1 do
        Begin
          cdsAcceptedTransportProviders.First;
          while not cdsAcceptedTransportProviders.Eof do
          begin
            if cdsAcceptedTransportProviders.FieldByName('TP_ID').AsInteger = iId then
              cdsAcceptedTransportProviders.Delete
            else
              cdsAcceptedTransportProviders.Next;
          end;

        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    dmSYs1.cdsAcceptedTransportProviders.ApplyUpdates(0);
    CloseTablesSys([DmSYs.cdsTransportProviders, DmSys1.cdsAcceptedTransportProviders, DmSys1.cdsTransportProvidersGroups, DmSys1.cdsLKTransportProviders, dmsys1.cdsLisTransportProviders]);
    OpenTablesSys([DmSYs.cdsTransportProviders, DmSys1.cdsTransportProvidersGroups, DmSys1.cdsAcceptedTransportProviders, DmSys1.cdsLKTransportProviders, dmsys1.cdsLisTransportProviders]);
   end; //With...
  actLog.Enabled := DmSys1.cdsTransportProvidersGroups.RecordCount > 0;

end;

procedure TfrmTransportProvidersGroups.actFilterExecute(Sender: TObject);
// Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
     qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(eDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TP1.TP_DESC LIKE ' + QuotedStr(eDesc.Text + '%') + ' AND ';
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

  with DmSys1 do
    begin
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
//    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
//    lbFiltrado.Visible:=strWhere <> '';
      cdsTransportProvidersGroups.Close;
      cdsTransportProvidersGroups.CommandText := 'SELECT DISTINCT(ATP.TP_ID), TP1.TP_DESC  FROM ACCEPTEDTRANSPORTPROVIDERS ATP LEFT JOIN TRANSPORTPROVIDERS TP1 ON TP1.TP_ID = ATP.TP_ID ' +
                                                 strWhere + strOrder; // + ' ORDER BY ATP.TP_ID';
      cdsTransportProvidersGroups.Open;
//      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('TP_ID', 'FROM ACCEPTEDTRANSPORTPROVIDERS', 'True', strWhere) ) + ' Registro(s)';

      //FrmSparksysMain.stMain.Panels[3].Text := intToStr(cdsTransportProvidersGroups.RecordCount) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys1.cdsTransportProvidersGroups.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := DmSys1.cdsTransportProvidersGroups.RecordCount > 0;

end;

procedure TfrmTransportProvidersGroups.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '14';
  FrmSystemLog.pSLG_ID := DmSys1.cdsAcceptedTransportProviders.FieldByName('TP_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

procedure TfrmTransportProvidersGroups.FormCreate(Sender: TObject);
begin
  inherited;
  SetActions([], True, FrmTransportProvidersGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel, actNewLineMt, actNewAllLineMt, actDelLineMt, actDeAlllLineMt], False, FrmTransportProvidersGroups, t_form_objects);

end;

procedure TfrmTransportProvidersGroups.dbedDescClick(Sender: TObject);
begin
  inherited;
  SetLines;
end;

procedure TfrmTransportProvidersGroups.MudaSourceCombo(Todos: Boolean);
begin
  with dbedDesc do
  begin
    if Todos = True then
    begin
      ListSource := DmSys.dtsTransportProviders;
    end
    else
    begin
      ListSource := DmSys1.dtsLKTransportProviders;
    end;
  end;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmTransportProvidersGroups.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmTransportProvidersGroups.FormKeyPress(Sender: TObject;
  var Key: Char); begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TfrmTransportProvidersGroups.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TfrmTransportProvidersGroups.Sai(Sender: TObject); begin FM_Sai(Sender); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmTransportProvidersGroups.lbFiltradoClick(Sender: TObject);
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
end.
