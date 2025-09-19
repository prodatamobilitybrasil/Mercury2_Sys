unit uFrmLineGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb, RxRichEd,
  Buttons, RXCtrls;

type
  TFrmLineGroups = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    dbDesc: TDBEdit;
    Label1: TLabel;
    edGrupo: TEdit;
    lkFilterStatus: TComboBox;
    dbCardUsersStatus: TRxDBComboBox;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    GroupBox2: TGroupBox;
    lbDisponiveis: TListBox;
    GroupBox4: TGroupBox;
    lbSelecionadas: TListBox;
    Panel1: TPanel;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    actAddLine: TAction;
    actAddAllLines: TAction;
    actDelLine: TAction;
    actDelAllLines: TAction;
    lbFiltrado: TLabel;
    btnLimpaStatus: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
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
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    Procedure ActiveLines(Status : Boolean);
    Procedure BeforePost;
    { Private declarations }
  public
    Procedure SetLines;
    Procedure SetStatusPanels(Status : Boolean); override;
    { Public declarations }
  end;

var
  FrmLineGroups: TFrmLineGroups;

implementation

uses uDmSys, uConst, uGeralFunctions, uDmBase, AppSparkSysMain, Math,
  uDmConexao, uDmSys1, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineGroups.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineGroups.FormShow(Sender: TObject);
begin
  inherited;
//  ccardLineGroupsSelect = 'LG_ID, LG_DESC, ''X'' AS LG_STA, LG_STATUS, LG_STATUS AS STATUS_ID,'+
//                          'LG_REGDATE, LG_REGUSER';
    ct:='SELECT '+ ccardLineGroupsSelect +' FROM LINEGROUPS %where% %order% ';
    defOrder:=' ORDER BY LG_DESC ';
    strOrder:=defOrder;

    DmSys.cdsLineGroups.CommandText:='SELECT '+ccardLineGroupsSelect+' FROM LINEGROUPS '+defOrder;
    FrmLineGroups := Self;
    OpenTablesSys([DmSys.cdsLineMt, DmSys1.cdsLineGroupsXLineMT, DmSys.cdsLineGroups ]);

//  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LG_ID', 'FROM LINEGROUPS', 'True', ' WHERE LG_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsLineGroups.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineGroups.BeforePost;
Var
 I : Integer;
 vLG_ID : integer;
Begin
  IF (dtsMaster.DataSet.State = dsEdit) Then
    Begin

      dmsys1.cdsLineGroupsXLineMT.First;
       while not dmsys1.cdsLineGroupsXLineMT.Eof do
                 dmsys1.cdsLineGroupsXLineMT.Delete;


      For I :=  0 TO lbSelecionadas.Items.Count - 1  do
           Begin
             dmsys1.cdsLineGroupsXLineMT.Insert;
             dmsys1.cdsLineGroupsXLineMT.FieldByName('LM_ID').AsInteger := Integer(lbSelecionadas.Items.Objects[I]);
//             dmsys1.cdsLineGroupsXLineMT.FieldByName('LG_ID').AsInteger := 1;
             dmsys1.cdsLineGroupsXLineMT.Post;
           End;


     End;

  IF (dtsMaster.DataSet.State = dsInsert) Then
     Begin
     vLG_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('LINEGROUPS', 'LG_ID', 'False', '' );

      For I := 0 to lbSelecionadas.Items.Count - 1 do
           Begin
             dmsys1.cdsLineGroupsXLineMT.Insert;
             dmsys1.cdsLineGroupsXLineMT.FieldByName('LG_ID').AsInteger := vLG_ID;
             dmsys1.cdsLineGroupsXLineMT.FieldByName('LM_ID').AsInteger := Integer(lbSelecionadas.Items.Objects[I]);
             dmsys1.cdsLineGroupsXLineMT.Post;
           End;
     End;
End;

procedure TFrmLineGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys.cdsLineGroups, DmSys1.cdsLineGroupsXLineMT,
                  DmSys.cdsLineMt]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  DmSys.cdsLineGroups.CommandText := 'SELECT '+ ccardLineGroupsSelect +' From LINEGROUPS WHERE LG_STATUS = ''A'' ORDER BY LG_DESC';
  FrmLineGroups := Nil;
end;

procedure TFrmLineGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsLineGroups);
  SetActions([], False, FrmLineGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmLineGroups, t_form_objects);
  ActiveLines(True);
  dbDesc.SetFocus;
  SetLines;
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

Procedure TFrmLineGroups.SetLines;
Begin
With  dmSys, dmSys1  Do
  Begin
    IF FrmLineGroups <> NIL Then
       Begin
         lbDisponiveis.DragMode  := dmManual;
         lbSelecionadas.DragMode := dmManual;
         cdsLineGroupsXLineMT.First;
         cdsLineMt.First;
         FrmLineGroups.lbSelecionadas.clear;
         FrmLineGroups.lbDisponiveis.Clear;

         While not cdsLineMt.eof do
           Begin
              IF cdsLineGroupsXLineMT.Locate('LM_ID', cdsLineMt.FieldByName('LM_ID').AsString, [])
                Then lbSelecionadas.Items.AddObject(cdsLineMt.fieldByName('LM_ID').AsString+#9+cdsLineMt.fieldByName('LM_DESCSHORT').AsString+#9+cdsLineMt.fieldByName('LM_DESC').AsString,
                                           TObject(cdsLineMt.fieldByName('LM_ID').AsInteger))
                Else lbDisponiveis.Items.AddObject(cdsLineMt.fieldByName('LM_ID').AsString+#9+cdsLineMt.fieldByName('LM_DESCSHORT').AsString+#9+cdsLineMt.fieldByName('LM_DESC').AsString,
                                           TObject(cdsLineMt.fieldByName('LM_ID').AsInteger));
               cdsLineMt.Next;
           End;

       End;
  End; //With...
End;

procedure TFrmLineGroups.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
    BeforePost;
      If ApplyTablesSys([dbDesc], [DmSys.cdsLineGroups,
                                   DmSys1.cdsLineGroupsXLineMT]) Then
         begin
          SetActions([], True, FrmLineGroups, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmLineGroups, t_form_objects);
          ActiveLines(False);
          actRefresh.Execute;
         end;
    END;
end;

Procedure TFrmLineGroups.ActiveLines(Status : Boolean);
Begin
  cbLineMt.Enabled           := Status;
End;

procedure TFrmLineGroups.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetLines;
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmLineGroups, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmLineGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

Procedure TFrmLineGroups.SetStatusPanels(Status : Boolean);
Begin
dbDesc.Enabled := Status;
dbCardUsersStatus.Enabled := Status;
cbLineMt.Enabled  := Status;
End;

procedure TFrmLineGroups.lbSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmLineGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmLineGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmLineGroups, t_form_objects);
  ActiveLines(True);
  dbDesc.SetFocus;
  lbDisponiveis.DragMode  := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

procedure TFrmLineGroups.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     DmSys.cdsLineGroups.Cancel;
     DmSys1.cdsLineGroupsXLineMT.Cancel;
     lbDisponiveis.Clear;
     SetActions([], True, FrmLineGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmLineGroups, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     ActiveLines(False);
     DmSys1.cdsLineGroupsXLineMT.Close;
     DmSys1.cdsLineGroupsXLineMT.Open;     
//     DmSys.Selecionadisponiveis;
     SetLines;
    end;
end;

procedure TFrmLineGroups.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' LG_DESC LIKE ' + QuotedStr(edGrupo.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LG_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LG_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsLineGroups.Close;
      cdsLineGroups.CommandText := 'SELECT '+ ccardLineGroupsSelect +' FROM LINEGROUPS ' + strWhere + strOrder; //'ORDER BY LG_DESC';
      cdsLineGroups.Open;

//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('LG_ID', 'FROM LINEGROUPS', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsLineGroups.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;

end;

procedure TFrmLineGroups.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     with DmSys do
        Begin
         cdsLineGroups.Edit;
         cdsLineGroups.FieldByName('LG_STATUS').AsString := 'I';
         cdsLineGroups.Post;
         cdsLineGroups.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmLineGroups.lbDisponiveisMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Sender = lbSelecionadas) and (Button = mbLeft) then
    lbSelecionadas.BeginDrag(False); // inicia a operação
end;

procedure TFrmLineGroups.lbDisponiveisDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  btnDelAllLineMt.Click;
end;

procedure TFrmLineGroups.lbDisponiveisDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmLineGroups.lbSelecionadasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if (Sender = lbDisponiveis) and (Button = mbLeft) then
    lbDisponiveis.BeginDrag(False); // inicia a operação
end;

procedure TFrmLineGroups.lbSelecionadasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
btnAddAllLineMt.Click;
End;

procedure TFrmLineGroups.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
  SetLines;
end;

procedure TFrmLineGroups.actAddAllLinesExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);

end;

procedure TFrmLineGroups.actAddLineExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmLineGroups.actDelLineExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);

end;

procedure TFrmLineGroups.actDelAllLinesExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmLineGroups.dtsMasterDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  If dtsMaster.DataSet.State = dsBrowse Then
     SetLines;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineGroups.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmLineGroups.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmLineGroups.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmLineGroups.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmLineGroups.lbFiltradoClick(Sender: TObject);
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
procedure TFrmLineGroups.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
