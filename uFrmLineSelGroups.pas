unit uFrmLineSelGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb, RxRichEd,
  RXCtrls, Buttons;

type
  TFrmLineSelGroups = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    dbDesc: TDBEdit;
    Label1: TLabel;
    edGrupo: TEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    lbDisponiveis: TListBox;
    GroupBox4: TGroupBox;
    lbSelecionadas: TListBox;
    Panel1: TPanel;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    btnAddAllLines: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    actAddLine: TAction;
    actAddAllLines: TAction;
    actDelLine: TAction;
    actDelAllLines: TAction;
    lbFiltrado: TLabel;
    Panel2: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure actEditExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure lbDisponiveisMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actAddAllLinesExecute(Sender: TObject);
    procedure actAddLineExecute(Sender: TObject);
    procedure actDelLineExecute(Sender: TObject);
    procedure actDelAllLinesExecute(Sender: TObject);
    procedure dtsMasterDataChange(Sender: TObject; Field: TField);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure ActiveLines(Status : Boolean);
    {
    }
    procedure BeforePost;
    { Apaga os relacionamentos com a LineMT.
    }
  public
    procedure SetLines;
    { Preenche os ListBoxes.
    }
    procedure SetStatusPanels(Status : Boolean); override;
    { Habilita/Desabilita componentes de edição.
    }
  end;

var
  FrmLineSelGroups: TFrmLineSelGroups;

implementation

uses uDmSys, uConst, uGeralFunctions, uDmBase, AppSparkSysMain, Math,
  uDmConexao, uDmSys1, uFrmBaseCadastro, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineSelGroups.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineSelGroups.FormShow(Sender: TObject);
begin
  inherited;
    ct:='SELECT '+ ccardLineSelGroupsSelect +' FROM LINESELECTGROUPS LSG %where% %order% ';
    defOrder:=' ORDER BY LSG_DESC ';
    strOrder:=defOrder;
    
    frmLineSelGroups := Self;
    OpenTablesSys([DmSys.cdsLineMt,dmSys1.cdsLineSelGroups]);
    dtsMaster.DataSet := dmSys1.cdsLineSelGroups;

//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LSG_ID', 'FROM LINESELECTGROUPS', 'True','') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys1.cdsLineSelGroups.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    grdResultado.Columns[0].Title.Caption:='Código';
    grdResultado.Columns[1].Title.Caption:='Descrição';
end;

procedure TFrmLineSelGroups.BeforePost;
var
 I : Integer;
 vLG_ID : integer;
begin
  if (dtsMaster.DataSet.State = dsEdit) then
  begin
    while dmSys.cdsLineMt.Locate('LSG_ID', dmSys1.cdsLineSelGroups.FieldByName('LSG_ID').AsString,[]) do
    begin
      dmSys.cdsLineMt.Edit;
      dmSys.cdsLineMt.FieldByName('LSG_ID').Clear;
      dmSys.cdsLineMt.Post;
      dmSys.cdsLineMt.First;
    end;
  end;

  for i :=  0 to lbSelecionadas.Items.Count - 1  do
  begin
    dmSys.cdsLineMt.First;
    if dmSys.cdsLineMt.Locate('LM_ID',IntToStr(Integer(lbSelecionadas.Items.Objects[i])),[]) then
    begin
      dmSys.cdsLineMt.Edit;
      dmSys.cdsLineMT.FieldByName('LSG_ID').AsInteger := dmSys1.cdsLineSelGroups.FieldByName('LSG_ID').AsInteger;
      dmSys.cdsLineMT.Post;
    end;
  end;

end;

procedure TFrmLineSelGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys.cdsLineGroups, DmSys1.cdsLineGroupsXLineMT,
                  DmSys.cdsLineMt]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  DmSys.cdsLineGroups.CommandText := 'SELECT '+ ccardLineGroupsSelect +' From LINESELECTGROUPS LSG ORDER BY LG_DESC';
  frmLineSelGroups := Nil;
end;

procedure TFrmLineSelGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsLineSelGroups);
  SetActions([], False, frmLineSelGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineSelGroups, t_form_objects);
  ActiveLines(True);
  dbDesc.SetFocus;
  SetLines;
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

procedure TFrmLineSelGroups.SetLines;
begin
  with  dmSys, dmSys1 do
  begin
    if frmLineSelGroups <> nil then
    begin
      lbDisponiveis.DragMode  := dmManual;
      lbSelecionadas.DragMode := dmManual;
      cdsLineMt.First;
      frmLineSelGroups.lbSelecionadas.clear;
      frmLineSelGroups.lbDisponiveis.Clear;

      while not cdsLineMt.eof do
      begin
        if cdsLineMt.FieldByName('LSG_ID').AsInteger = cdsLineSelGroups.FieldByName('LSG_ID').AsInteger then
          lbSelecionadas.Items.AddObject(cdsLineMt.fieldByName('LM_ID').AsString+#9+cdsLineMt.fieldByName('LM_DESCSHORT').AsString,
                                         TObject(cdsLineMt.fieldByName('LM_ID').AsInteger))
        else lbDisponiveis.Items.AddObject(cdsLineMt.fieldByName('LM_ID').AsString+#9+cdsLineMt.fieldByName('LM_DESCSHORT').AsString,
                                           TObject(cdsLineMt.fieldByName('LM_ID').AsInteger));
        cdsLineMt.Next;
      end;

    end;
  end; //With...
end;

procedure TFrmLineSelGroups.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  if status = stConsult Then
  begin
    BeforePost;
    if ApplyTablesSys([dbDesc], [dmSys1.cdsLineSelGroups, DmSys.cdsLineMt]) then
    begin
      SetActions([], True, frmLineSelGroups, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, frmLineSelGroups, t_form_objects);
      ActiveLines(False);
      actRefresh.Execute;
    end;
  end;
end;

procedure TFrmLineSelGroups.ActiveLines(Status : Boolean);
begin
  cbLineMt.Enabled           := Status;
end;

procedure TFrmLineSelGroups.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetLines;
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, frmLineSelGroups, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, frmLineSelGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmLineSelGroups.SetStatusPanels(Status : Boolean);
begin
  dbDesc.Enabled := Status;
  cbLineMt.Enabled  := Status;
end;

procedure TFrmLineSelGroups.lbSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmLineSelGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmLineSelGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineSelGroups, t_form_objects);
  ActiveLines(True);
  dbDesc.SetFocus;
  lbDisponiveis.DragMode  := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

procedure TFrmLineSelGroups.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     DmSys.cdsLineMt.Cancel;
     DmSys1.cdsLineSelGroups.Cancel;
     lbDisponiveis.Clear;
     SetActions([], True, frmLineSelGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, frmLineSelGroups, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     ActiveLines(False);
     SetLines;
    end;
end;

procedure TFrmLineSelGroups.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
     qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edGrupo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LSG_DESC LIKE ' + QuotedStr(edGrupo.Text + '%') + ' AND ';
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

    cdsLineSelGroups.Close;
    cdsLineSelGroups.CommandText := 'SELECT '+ ccardLineSelGroupsSelect +' From LINESELECTGROUPS LSG ' + strWhere + strOrder; //'ORDER BY LSG_DESC';
    cdsLineSelGroups.Open;

//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LSG_ID', 'FROM LINESELECTGROUPS', 'True', strWhere) ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys1.cdsLineSelGroups.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
    lbFiltrado.Visible:=strWhere <> '';
  end;

end;

procedure TFrmLineSelGroups.actDeleteExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  begin
    dmSys.cdsGeral.CommandText := 'update linemt set LSG_ID = NULL where LSG_ID = ' + dmSys1.cdsLineSelGroups.FieldByName('LSG_ID').AsString;
    dmSys.cdsGeral.Execute;
    dmSys1.cdsLineSelGroups.Delete;
    dmSys1.cdsLineSelGroups.ApplyUpdates(-1);
    tbtnRefresh.Click;
  end;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmLineSelGroups.lbDisponiveisMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Sender = lbSelecionadas) and (Button = mbLeft) then
    lbSelecionadas.BeginDrag(False); // inicia a operação
end;

procedure TFrmLineSelGroups.lbDisponiveisDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  btnDelAllLineMt.Click;
end;

procedure TFrmLineSelGroups.lbDisponiveisDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmLineSelGroups.lbSelecionadasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Sender = lbDisponiveis) and (Button = mbLeft) then
    lbDisponiveis.BeginDrag(False); // inicia a operação
end;

procedure TFrmLineSelGroups.lbSelecionadasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnAddAllLineMt.Click;
End;

procedure TFrmLineSelGroups.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
  SetLines;
end;

procedure TFrmLineSelGroups.actAddAllLinesExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmLineSelGroups.actAddLineExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmLineSelGroups.actDelLineExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmLineSelGroups.actDelAllLinesExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmLineSelGroups.dtsMasterDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dtsMaster.DataSet.State = dsBrowse Then
    SetLines;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineSelGroups.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmLineSelGroups.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmLineSelGroups.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineSelGroups.lbFiltradoClick(Sender: TObject);
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
procedure TFrmLineSelGroups.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
