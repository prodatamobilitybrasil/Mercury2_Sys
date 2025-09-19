unit uStatisticalFamilies;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxLookup, Buttons,
  RXCtrls;

type
  TFrmStatisticalFamilies = class(TFrmBaseSys)
    GroupBox2: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label3: TLabel;
    dbSortOrder: TDBEdit;
    edCodigo: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edDesc: TEdit;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    GroupBox3: TGroupBox;
    GroupBox1: TGroupBox;
    lbDisponiveis: TListBox;
    GroupBox4: TGroupBox;
    lbSelecionadas: TListBox;
    Panel1: TPanel;
    cbConditions: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    dbGrupo: TRxDBLookupCombo;
    Label1: TLabel;
    actAddLineMt: TAction;
    actAddAllLineMt: TAction;
    actDelLineMt: TAction;
    actDelAllLineMt: TAction;
    dbrdStatus: TDBRadioGroup;
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
    procedure actAddAllLineMtExecute(Sender: TObject);
    procedure actAddLineMtExecute(Sender: TObject);
    procedure actDelLineMtExecute(Sender: TObject);
    procedure actDelAllLineMtExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure actLogExecute(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure lbFiltradoClick(Sender: TObject);
  private
     ct,strOrder,defOrder,strWhere: String;
     procedure BeforePost;
     procedure SetStatus(Status : Boolean);
     procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    { Private declarations }
  public
     Procedure ListConditions;
    { Public declarations }
  end;

var
  FrmStatisticalFamilies: TFrmStatisticalFamilies;

implementation

Uses uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmSystemLog, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmStatisticalFamilies.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmStatisticalFamilies.SetStatus(Status : Boolean);
Begin
  cbConditions.enabled := Status;
End;

procedure TFrmStatisticalFamilies.BeforePost;
Var
 I : Integer;
 vSF_ID : integer;
Begin

  IF (dtsMaster.DataSet.State = dsEdit) Then
    Begin
      dmsys.cdsStatFamiliesXConditions.First;
      while not dmsys.cdsStatFamiliesXConditions.Eof do
                dmsys.cdsStatFamiliesXConditions.Delete;
     End;

  IF (dtsMaster.DataSet.State = dsInsert) Then
     vSF_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('STATISTICALFAMILIES', 'SF_ID', 'False', '' )
  Else
     vSF_ID  := DmSys.cdsStatisticalFamilies.fieldByName('SF_ID').AsInteger;

  For I := 0 to lbSelecionadas.Items.Count - 1 do
       Begin
         dmsys.cdsStatFamiliesXConditions.Insert;
         dmsys.cdsStatFamiliesXConditions.FieldByName('SF_ID').AsInteger  := vSF_ID;
         dmsys.cdsStatFamiliesXConditions.FieldByName('SFC_ID').AsInteger := Integer(lbSelecionadas.Items.Objects[I]);
         dmsys.cdsStatFamiliesXConditions.Post;
       End;
End;

procedure TFrmStatisticalFamilies.FormShow(Sender: TObject);
begin
  inherited;
    defOrder:=' ORDER BY SF.SF_ID ';
    strOrder:=defOrder;
    ct:= 'SELECT SF.*, SF.SF_STATUS AS STATUS_ID, SG.SG_DESC '#13+
         'FROM STATISTICALFAMILIES SF LEFT '#13+
         'OUTER JOIN STATISTICALGROUPS SG ON SG.SG_ID = SF.SG_ID %where% %order% ';

    OpenTablesSys([DmSys.cdsStatisticalFamilies, DmSys.cdsStatFamiliesXConditions, DmSys.cdsStatisticalGroups]);

    //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SF_ID', 'FROM STATISTICALFAMILIES', 'True', ' WHERE SF_STATUS = ''A'' ') ) + ' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsStatisticalFamilies.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    ListConditions;
    actLog.Enabled := DmSys.cdsStatisticalFamilies.RecordCount > 0;

end;

procedure TFrmStatisticalFamilies.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsStatisticalFamilies, DmSys.cdsStatFamiliesXConditions, DmSys.cdsStatisticalGroups]);
    DmSys.cdsStatisticalFamilies.CommandText := 'SELECT SF.*, SF.SF_STATUS AS STATUS_ID, SG.SG_DESC From STATISTICALFAMILIES SF LEFT OUTER JOIN STATISTICALGROUPS SG  ON SG.SG_ID = SF.SG_ID WHERE SF_STATUS = ''A'' ORDER BY SF.SF_ID';
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmStatisticalFamilies := Nil;
end;

Procedure TFrmStatisticalFamilies.ListConditions;
Begin
  With dmSys do
    Begin
     lbDisponiveis.DragMode  := dmManual;
     lbSelecionadas.DragMode := dmManual;
     lbSelecionadas.Clear;
     lbDisponiveis.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT SFC_ID, SFC_DESC FROM STATFAMILIESCONDITIONS WHERE SFC_STATUS = ''A'' ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF cdsStatFamiliesXConditions.Locate('SFC_ID', cdsGeral.fieldByName('SFC_ID').AsString, [] )
               Then lbSelecionadas.Items.AddObject(cdsGeral.fieldByName('SFC_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('SFC_ID').AsInteger))
               Else lbDisponiveis.Items.AddObject(cdsGeral.fieldByName('SFC_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('SFC_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
End;

procedure TFrmStatisticalFamilies.actInsertExecute(Sender: TObject);
begin
  inherited;
  dbDesc.SetFocus;
  ActionInsertSys(DmSys.cdsStatisticalFamilies);
  SetActions([], False, FrmStatisticalFamilies, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmStatisticalFamilies, t_form_objects);
  ListConditions;
  SetStatus(True);
  lbDisponiveis.DragMode  := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

procedure TFrmStatisticalFamilies.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmStatisticalFamilies, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmStatisticalFamilies, t_form_objects);
  ListConditions;
  dbDesc.SetFocus;
  SetStatus(True);
  lbDisponiveis.DragMode := dmAutomatic;
  lbSelecionadas.DragMode := dmAutomatic;
end;

procedure TFrmStatisticalFamilies.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    Begin
      BeforePost;
      DmSys.cdsStatisticalFamilies.FieldByName('SG_DESC').AsString := dbGrupo.Text;
      If ApplyTablesSys([dbDesc], [DmSys.cdsStatisticalFamilies,
                                   DmSys.cdsStatFamiliesXConditions]) Then
         begin
          SetActions([], True, FrmStatisticalFamilies, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmStatisticalFamilies, t_form_objects);
          SetStatus(False);
         end;
    End;
  actLog.Enabled := True;

end;

procedure TFrmStatisticalFamilies.actCancelExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmSys.cdsStatisticalFamilies.Cancel;
     dmsys.cdsStatFamiliesXConditions.CancelUpdates;
     SetActions([], True, FrmStatisticalFamilies, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmStatisticalFamilies, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     SetStatus(False);
    end;
  actLog.Enabled := DmSys.cdsStatisticalFamilies.RecordCount > 0;
  
end;

procedure TFrmStatisticalFamilies.actDeleteExecute(Sender: TObject);
begin
 if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys do
        Begin
         cdsStatisticalFamilies.Edit;
         cdsStatisticalFamilies.FieldByName('SF_STATUS').AsString := 'I';
         cdsStatisticalFamilies.Post;
         cdsStatisticalFamilies.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
 actLog.Enabled := DmSys.cdsStatisticalFamilies.RecordCount > 0;
 
end;

procedure TFrmStatisticalFamilies.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatus(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmStatisticalFamilies, t_form_objects);
      ListConditions;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmStatisticalFamilies, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmStatisticalFamilies.actFilterExecute(Sender: TObject);
//Var strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edCodigo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' SF.SF_ID = ' + QuotedStr(edCodigo.Text) + ' AND ';
       end;

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' SF.SF_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SF.SF_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SF.SF_STATUS = ' + QuotedStr('I') + ' AND ';
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
      FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
//    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
//    lbFiltrado.Visible:=strWhere <> '';
      cdsStatisticalFamilies.Close;
      cdsStatisticalFamilies.CommandText := 'SELECT SF.*, SF.SF_STATUS AS STATUS_ID, SG.SG_DESC '#13+
                                            'FROM STATISTICALFAMILIES SF LEFT '#13+
                                            'OUTER JOIN STATISTICALGROUPS SG ON SG.SG_ID = SF.SG_ID '+strWhere+strOrder; //' ORDER BY SF.SF_ID';
      cdsStatisticalFamilies.Open;

      //FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SF.SF_ID', 'FROM STATISTICALFAMILIES SF', 'True', strWhere) ) + ' Registro(s)';
      lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsStatisticalFamilies.RecordCount)+' registro(s)';
      FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

      FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
      lbFiltrado.Visible:=strWhere <> '';
    end;
  actLog.Enabled := DmSys.cdsStatisticalFamilies.RecordCount > 0;

end;

procedure TFrmStatisticalFamilies.lbDisponiveisDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btnDelAllLineMt.Click;
End;

procedure TFrmStatisticalFamilies.lbDisponiveisDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmStatisticalFamilies.lbSelecionadasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btnAddAllLineMt.Click;
end;

procedure TFrmStatisticalFamilies.lbSelecionadasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmStatisticalFamilies.actAddAllLineMtExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);

end;

procedure TFrmStatisticalFamilies.actAddLineMtExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);

end;

procedure TFrmStatisticalFamilies.actDelLineMtExecute(Sender: TObject);
begin
  inherited;
 lbSelecionadas.MoveSelection(lbDisponiveis);

end;

procedure TFrmStatisticalFamilies.actDelAllLineMtExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmStatisticalFamilies.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsStatisticalFamilies;
end;

procedure TFrmStatisticalFamilies.edCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If ((Ord(Key) < 48) OR
      (Ord(Key) > 57)) AND
     (Ord(Key) <> 8) Then
     abort;

end;

procedure TFrmStatisticalFamilies.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '9';
  FrmSystemLog.pSLG_ID := DmSys.cdsStatisticalFamilies.FieldByName('SF_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmStatisticalFamilies.FormKeyPress(Sender: TObject;
  var Key: Char); begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmStatisticalFamilies.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
procedure TFrmStatisticalFamilies.Entra(Sender: TObject);
begin FM_Entra(Sender); end;
procedure TFrmStatisticalFamilies.Sai(Sender: TObject);
begin FM_Sai(Sender); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmStatisticalFamilies.lbFiltradoClick(Sender: TObject);
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
procedure TFrmStatisticalFamilies.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
