unit uDepot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, Buttons,
  RXCtrls;

type
  TFrmDepots = class(TFrmBaseSys)
    gbDepot: TGroupBox;
    Label1: TLabel;
    dbDesc: TDBEdit;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewTP: TToolButton;
    tbtnEditTP: TToolButton;
    tbtnDeleteTP: TToolButton;
    pgcTransportProviders: TPageControl;
    TabSheet1: TTabSheet;
    edDesc: TEdit;
    Label2: TLabel;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actDelDetail: TAction;
    actOkEmpr: TAction;
    actCancelEmpr: TAction;
    actAddAllLineMt: TAction;
    actAddLineMt: TAction;
    actDelLineMt: TAction;
    actDelAllLineMt: TAction;
    Panel5: TPanel;
    Panel1: TPanel;
    Label9: TLabel;
    lbDisponiveis: TListBox;
    Panel2: TPanel;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    Panel3: TPanel;
    Label10: TLabel;
    lbSelecionadas: TListBox;
    Panel4: TPanel;
    btDisplayCancel: TSpeedButton;
    btnDisplayOK: TBitBtn;
    dbgTransportProviders: TDBGrid;
    lbFiltrado: TLabel;
    Panel6: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure edSearchTPChange(Sender: TObject);
    procedure dbgAddTPDblClick(Sender: TObject);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure actDelDetailExecute(Sender: TObject);
    procedure actOkEmprExecute(Sender: TObject);
    procedure actCancelEmprExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddAllLineMtExecute(Sender: TObject);
    procedure actAddLineMtExecute(Sender: TObject);
    procedure actDelLineMtExecute(Sender: TObject);
    procedure actDelAllLineMtExecute(Sender: TObject);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure lbFiltradoClick(Sender: TObject);
  private
    ct,strOrder,defOrder,strWhere,defWhere: String;
    procedure SetDetail;
    Procedure BeforePost;
    Procedure ListaEmpresas;
    Function  FormatString(Str : String) : String;
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
  public
    { Public declarations }
  end;

var
  FrmDepots: TFrmDepots;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, uConst, uGeralFunctions, uDmSys,
  uFrmBase, uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmDepots.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmDepots.FormShow(Sender: TObject);
begin
  inherited;
    ct:='SELECT * FROM DEPOTS %where% %order% ';
    defOrder:=' ORDER BY DP_DESC ';
    strOrder:=defOrder;
    defWhere:=' DP_STATUS = ' + QuotedStr('A')+' ';

    DmSys1.cdsDepots.CommandText:='SELECT * FROM DEPOTS WHERE ' + defWhere + defOrder;
    OpenTablesSys([DmSys1.cdsDepots, dmSys1.cdsDepotsXTransportProviders, DmSys.cdsTransportProviders]);

    //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('DP_ID', 'FROM DEPOTS', 'True', '') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys1.cdsDepots.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    dbgTransportProviders.Align := alClient;
    actLog.Enabled:=DmSys1.cdsDepots.RecordCount > 0;
    SetDetail;
end;

procedure TFrmDepots.SetDetail;
Begin
  SetCategories([Detail], not (Status = stConsult), Self, t_form_objects);
  pgcTransportProviders.Enabled := not (Status = stConsult);
End;

procedure TFrmDepots.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys1.cdsDepots, dmSys1.cdsDepotsXTransportProviders, DmSys.cdsTransportProviders]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmDepots := Nil;

end;

procedure TFrmDepots.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsDepots);
  SetDetail;
  SetActions([], False, FrmDepots, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmDepots, t_form_objects);

  SetActions([actEditDetail], not (dmSys1.cdsDepotsXTransportProviders.IsEmpty), FrmDepots, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmDepots.actEditExecute(Sender: TObject);
begin
  inherited;
  SetDetail;
  SetActions([], False, FrmDepots, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmDepots, t_form_objects);

  SetActions([actEditDetail], not (dmSys1.cdsDepotsXTransportProviders.IsEmpty), FrmDepots, t_form_objects);
  dbDesc.SetFocus;
end;

procedure TFrmDepots.actFilterExecute(Sender: TObject);
//var strWhere : String;
Var filtrado: Boolean;
begin
  inherited;
  strWhere  := '';

  filtrado:=false;
  If Trim(edDesc.Text) <> '' then
  begin
    filtrado:=true;
    strWhere := ' WHERE ' + defWhere +  ' AND DP_DESC LIKE ' + QuotedStr(edDesc.Text + '%');
  end
  Else
    strWhere := ' WHERE ' + defWhere;

  with DmSys1 do
    begin
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
      cdsDepots.Close;
      cdsDepots.CommandText := 'SELECT * FROM DEPOTS ' + strWhere + strOrder; //' ORDER BY DP_DESC';
      cdsDepots.Open;
//    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('DP_ID', 'FROM DEPOTS', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',cdsDepots.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=filtrado;
    end;

  SetDetail;
  actLog.Enabled := DmSys1.cdsDepots.RecordCount > 0;
  
end;

procedure TFrmDepots.BeforePost;
Var
 NewDpId : integer;
Begin
  With DmSys1 do
  Begin
    cdsDepotsXTransportProviders.First;

    NewDpId  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('DEPOTS','DP_ID', 'False', '');

    While NOT cdsDepotsXTransportProviders.Eof do
       Begin
         cdsDepotsXTransportProviders.Edit;
         cdsDepotsXTransportProviders.FieldByName('DP_ID').AsInteger  := NewDpId;
         cdsDepotsXTransportProviders.Post;
       End;

   dmSys1.cdsDepots.FieldByName('DP_ID').AsInteger := NewDpId;
  End;
End;

procedure TFrmDepots.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If dtsMaster.DataSet.State = dsInsert then
        BeforePost;
     If ApplyTablesSys([dbDesc], [DmSys1.cdsDepots,
                                  DmSys1.cdsDepotsXTransportProviders]) Then
         begin
            SetActions([], True, FrmDepots, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmDepots, t_form_objects);
            tbtnRefresh.Click;
         end;
    END;
  actLog.Enabled := True

end;

procedure TFrmDepots.actCancelExecute(Sender: TObject);
begin
  inherited;
  if Status = stConsult then
    begin
     dmSys1.cdsDepots.Cancel;
     SetActions([], True, FrmDepots, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmDepots, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     SetDetail;
     dmSys1.cdsDepotsXTransportProviders.Close;
     dmSys1.cdsDepotsXTransportProviders.Open;
    end;
  actLog.Enabled := DmSys1.cdsDepots.RecordCount > 0;
  
end;

procedure TFrmDepots.actDeleteExecute(Sender: TObject);
begin
//  inherited;
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin

     with DmSys1 do
        Begin
         cdsDepots.Edit;
         cdsDepots.FieldByName('DP_STATUS').AsString := 'I';
         cdsDepots.Post;
         dmConexao.ConnBrkMaster.AppServer.StartTransaction;
         cdsDepots.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  SetDetail;
  actLog.Enabled := DmSys1.cdsDepots.RecordCount > 0;

end;

procedure TFrmDepots.edSearchTPChange(Sender: TObject);
begin
  inherited;
//  DmSys.cdsTransportProviders.Locate('TP_DESC', edSearchTP.Text, [loPartialKey]);
end;

procedure TFrmDepots.dbgAddTPDblClick(Sender: TObject);
begin
  //inherited;
  actOkEmprExecute(Self);
end;


Procedure TFrmDepots.ListaEmpresas;
Begin
  With dmSys do
    Begin
//     lbDisponiveis.DragMode  := dmManual;
//     lbSelecionadas.DragMode := dmManual;
     lbSelecionadas.Clear;
     lbDisponiveis.Clear;

     cdsGeral.Close;
     cdsGeral.CommandText := 'SELECT TP_ID, TP_DESC FROM TRANSPORTPROVIDERS WHERE TP_STATUS = ''A'' ORDER BY TP_ID';
     cdsGeral.Open;

       While NOT cdsGeral.Eof do
          Begin
             IF DmSys1.cdsDepotsXTransportProviders.Locate('TP_ID', cdsGeral.fieldByName('TP_ID').AsString, [] )
              Then lbSelecionadas.Items.AddObject(cdsGeral.fieldByName('TP_ID').AsString + #9+
                                                  cdsGeral.fieldByName('TP_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('TP_ID').AsInteger))
              Else lbDisponiveis.Items.AddObject(cdsGeral.fieldByName('TP_ID').AsString + #9+
                                                 cdsGeral.fieldByName('TP_DESC').AsString,
                                         TObject(cdsGeral.fieldByName('TP_ID').AsInteger));
             cdsGeral.Next;
          end;
   End;
End;

procedure TFrmDepots.actNewDetailExecute(Sender: TObject);
begin
  inherited;
  SetCategories([Detail], False, Self, t_form_objects);
  dbgTransportProviders.Visible := False;
  dmSys1.cdsDepotsXTransportProviders.Edit;
  ListaEmpresas
end;

procedure TFrmDepots.actEditDetailExecute(Sender: TObject);
begin
  inherited;
  SetCategories([Detail], False, Self, t_form_objects);
  dbgTransportProviders.Visible := False;
  dmSys1.cdsDepotsXTransportProviders.Edit;
  ListaEmpresas
end;

procedure TFrmDepots.actDelDetailExecute(Sender: TObject);
begin
  inherited;
  If dmSys1.cdsDepotsXTransportProviders.IsEmpty then
    Exit;

  if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
   begin
     dmSys1.cdsDepotsXTransportProviders.Delete;
   end;
  SetActions([actEditDetail], not (dmSys1.cdsDepotsXTransportProviders.IsEmpty), FrmDepots, t_form_objects);
end;

Function TFrmDepots.FormatString(Str : String) : String;
Var
 I : Integer;
Begin
  I := Pos(#9, Str);
  delete(Str, 1, I);
Result := Str;
End;

procedure TFrmDepots.actOkEmprExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], True, Self, t_form_objects);

   DmSys1.cdsDepotsXTransportProviders.First;

   While NOT DmSys1.cdsDepotsXTransportProviders.Eof do
      Begin
        DmSys1.cdsDepotsXTransportProviders.Delete;
      End;

   For I := 0 to lbSelecionadas.Count - 1 do
      Begin
         dmSys1.cdsDepotsXTransportProviders.Append;
         dmSys1.cdsDepotsXTransportProviders.FieldByName('DP_ID').AsInteger  := DmSys1.cdsDepots.fieldByName('DP_ID').AsInteger;
         dmSys1.cdsDepotsXTransportProviders.FieldByName('TP_ID').AsInteger  := Integer(lbSelecionadas.items.Objects[I]);
         dmSys1.cdsDepotsXTransportProviders.FieldByName('TP_DESC').AsString := FormatString(lbSelecionadas.Items.Strings[I]);
         dmSys1.cdsDepotsXTransportProviders.Post;
      End;

   dbgTransportProviders.Visible := True;

end;

procedure TFrmDepots.actCancelEmprExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], True, Self, t_form_objects);

   dbgTransportProviders.Visible := True;
   dmSys1.cdsDepotsXTransportProviders.Cancel;
end;

procedure TFrmDepots.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsDepots;
end;

procedure TFrmDepots.actAddAllLineMtExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmDepots.actAddLineMtExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmDepots.actDelLineMtExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmDepots.actDelAllLineMtExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmDepots.lbDisponiveisDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
 btnDelAllLineMt.Click;
end;

procedure TFrmDepots.lbDisponiveisDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmDepots.lbSelecionadasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
   btnAddAllLineMt.Click;
end;

procedure TFrmDepots.lbSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmDepots.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmDepots, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmDepots, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  SetDetail;

end;

procedure TFrmDepots.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '11';
  FrmSystemLog.pSLG_ID := DmSys1.cdsDepots.FieldByName('DP_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmDepots.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmDepots.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmDepots.Sai(Sender: TObject); begin FM_Sai(Sender); end;
procedure TFrmDepots.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmDepots.lbFiltradoClick(Sender: TObject);
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
