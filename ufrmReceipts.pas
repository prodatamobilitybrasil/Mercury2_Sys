unit ufrmReceipts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Buttons, Mask, DBCtrls, RxLookup,
  RxDBComb;

type
  TfrmReceipts = class(TFrmBaseSys)
    ed_codigo_empresa: TEdit;
    lb_codigo_empresa: TLabel;
    lkFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    lb_linhas: TLabel;
    lb_colunas: TLabel;
    lb_empresa: TLabel;
    gb_detalhe: TGroupBox;
    CoolBar2: TCoolBar;
    ToolBar5: TToolBar;
    tb_inserir_detalhe: TToolButton;
    tb_editar_detalhe: TToolButton;
    tb_excluir_detalhe: TToolButton;
    pn_bottom_detalhe: TPanel;
    pn_detalhe: TPanel;
    dbg_detalhe: TDBGrid;
    ed_linhas: TDBEdit;
    ed_colunas: TDBEdit;
    cb_empresa: TRxDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cb_linha: TRxDBLookupCombo;
    cb_trecho: TRxDBLookupCombo;
    ed_no_linha: TDBEdit;
    ed_no_coluna: TDBEdit;
    ed_valor: TDBEdit;
    Label6: TLabel;
    ed_formato: TDBEdit;
    Label7: TLabel;
    ed_tamanho: TDBEdit;
    Label8: TLabel;
    cb_campo_recibo: TRxDBLookupCombo;
    Label9: TLabel;
    Panel1: TPanel;
    bt_ok_detalhe: TBitBtn;
    btnCancelTrechos: TBitBtn;
    RxDBComboBox1: TRxDBComboBox;
    Label10: TLabel;
    cb_status: TRxDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure tb_inserir_detalheClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tb_editar_detalheClick(Sender: TObject);
    procedure tb_excluir_detalheClick(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure bt_ok_detalheClick(Sender: TObject);
    procedure btnCancelTrechosClick(Sender: TObject);
    procedure dtsMasterStateChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure cb_campo_reciboCloseUp(Sender: TObject);
  private
    { Private declarations }
    RCPTDT_ID: integer;
    {
    }
    function Max_RCPTDT_ID: integer;
    {
    }
    function Verifica_Campos: boolean;
    {
    }
    function Verifica_Campos_Detalhe: boolean;
    {
    }
    procedure BeforePost;
    {
    }
    procedure Set_Detalhe(enabled: boolean);
    {
    }
  public
    { Public declarations }
  end;

var
  frmReceipts: TfrmReceipts;

implementation

uses uDmSys, AppSparkSysMain, uDmConexao, uConst, uGeralFunctions,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TfrmReceipts.FormShow(Sender: TObject);
begin
  frmReceipts := Self;

  OpenTablesSys([dmSys.cdsReceiptMt, dmSys.cdsReceiptDt, dmSys.cdsTransportProviders,
                 dmSys.cdsLineDetailsAux, dmSys.cdsZones, dmSys.cdsReceiptFields]);
  dmSys.cdsReceiptFields.FieldByName('RF_DESC').DisplayWidth := 15;
  dtsMaster.DataSet := dmSys.cdsReceiptMt;
  inherited;
  FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('RCPTMT_ID', 'FROM RECEIPTMT', 'True','') ) + ' Registro(s)';
  Set_Detalhe(False);
end;

procedure TfrmReceipts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtsMaster.State in [dsInsert, dsEdit] then
  begin
    MessageDlg('Em edição. Salve ou cancele antes de sair.', mtWarning, [mbOk], 0);
    Exit;
  end;
  inherited;
  with DmSys do
  begin
    CloseTablesSys([DmSys.cdsReceiptMt]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    cdsZones.CommandText := 'SELECT '+ cCardReceipts; // + 'ORDER BY ZN_ZNLID_ORIG, ZN_ZNLID_DEST';
  end;
  Action := caFree;
end;

procedure TfrmReceipts.actFilterExecute(Sender: TObject);
var
  strWhere: string;

  procedure BuiltStrWhere;
  var
    qtd_campos, i : integer;

  begin
    qtd_campos := 0;
    strWhere  := '';

    if Trim(ed_codigo_empresa.Text) <> '' then
    begin
      Inc(qtd_campos);
      strWhere := strWhere + ' RMT.TP_ID = ' + ed_codigo_empresa.Text + ' AND ';
    end;

    case lkFilterStatus.ItemIndex Of
      0:
      begin
        Inc(qtd_campos);
        strWhere := strWhere + ' RCPTMT_STATUS = ' + QuotedStr('A') + ' AND ';
      end;
      1:
      begin
        Inc(qtd_campos);
        strWhere := strWhere + ' RCPTMT_STATUS = ' + QuotedStr('I') + ' AND ';
      end;
    end; //Case...

    // Verifica se é necessário tirar o AND

    if qtd_campos > 0 then
    begin
      i := Length(strWhere) - 4;
      strWhere := ' WHERE ' + Copy(strWhere,1,i);
    end;
  end;

begin
  inherited;
  strWhere  := '';
  BuiltStrWhere;

  with DmSys do
  begin
    cdsReceiptMt.Close;
    cdsReceiptMt.CommandText := 'SELECT '+ cCardReceipts + strWhere +
      ' GROUP BY '+
      ' RMT.RCPTMT_ID, '+
      ' RMT.TP_ID, '+
      ' RMT.RCPTMT_TOTALROWS, '+
      ' RCPTMT_TOTALCOLUMNS, '+
      ' TP.TP_DESC, '+
      ' RDT.ZN_ID, '+
      ' ZNL_ORIG.ZNL_DESCSHORT, '+
      ' ZNL_DEST.ZNL_DESCSHORT, '+
      ' RMT.RCPTMT_STATUS, '+
      ' RMT.RCPTMT_REGDATE, '+
      ' RMT.RCPTMT_REGUSER '+
      ' ORDER BY TP.TP_DESC, RMT.RCPTMT_ID, RDT.ZN_ID';
    cdsReceiptMt.Open;
    FrmSparksysMain.stMain.Panels[3].Text := IntToStr(DmSys.cdsReceiptMt.RecordCount) + ' Registro(s)';
  end;
end;

procedure TfrmReceipts.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  if pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
  begin
//      Set_Detalhe(False);
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, frmReceipts, t_form_objects);
  end
  else
  begin
    SetActions([actFilter, actDelete, actRefresh], True, frmReceipts, t_form_objects);
  end;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TfrmReceipts.tb_inserir_detalheClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled  := False;
  tbtnCancel.Enabled := False;
  pn_detalhe.Visible := False;
  ActionInsertSys(DmSys.cdsReceiptDt);
  DmSys.cdsReceiptDt.FieldByName('RCPTMT_ID').AsString := DmSys.cdsReceiptMt.FieldByName('RCPTMT_ID').AsString;
 // RCPTDT_ID:=Max_RCPTDT_ID ;
  Inc(RCPTDT_ID);
  DmSys.cdsReceiptDt.FieldByName('RCPTDT_ID').AsInteger := RCPTDT_ID;
  pn_bottom_detalhe.Visible := True;
end;

procedure TfrmReceipts.actInsertExecute(Sender: TObject);
begin
  ActionInsertSys(DmSys.cdsReceiptMt);
  SetActions([], False, frmReceipts, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, frmReceipts, t_form_objects);
  RCPTDT_ID := Max_RCPTDT_ID;
end;

procedure TfrmReceipts.actCancelExecute(Sender: TObject);
begin
//  inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  begin
    dmSys.cdsReceiptMt.Cancel;
    dmSys.cdsReceiptDt.Cancel;

    dmSys.cdsReceiptMt.CancelUpdates;
    dmSys.cdsReceiptDt.CancelUpdates;

    SetActions([], True, frmReceipts, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, frmReceipts, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    actRefresh.Execute;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end;
  actLog.Enabled := DmSys.cdsReceiptMt.RecordCount > 0;
end;

procedure TfrmReceipts.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmReceipts, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmReceipts, t_form_objects);
  DmSys.cdsReceiptDt.Edit;
  Set_Detalhe(True);
  RCPTDT_ID := Max_RCPTDT_ID;
end;

procedure TfrmReceipts.tb_editar_detalheClick(Sender: TObject);
begin
  inherited;
  tbtnApply.Enabled  := False;
  tbtnCancel.Enabled := False;
  pn_detalhe.Visible := False;
  DmSys.cdsReceiptDt.Edit;
  pn_bottom_detalhe.Visible := True;
  cb_linha.SetFocus;
end;

procedure TfrmReceipts.tb_excluir_detalheClick(Sender: TObject);
begin
  inherited;
  DmSys.cdsReceiptDt.Edit;
  DmSys.cdsReceiptDt.FieldByName('RCPTDT_STATUS').AsString := 'I';
  DmSys.cdsReceiptDt.FieldByName('STATUS_ID').AsString := 'I';
  DmSys.cdsReceiptDt.Post;
end;

procedure TfrmReceipts.BeforePost;
var
  RCPTMT_ID: integer;

begin
  with DmSys do
  begin

    RCPTMT_ID := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('RECEIPTMT', 'RCPTMT_ID', 'False', '' );
  {  while cdsReceiptDt.RecordCount > 0 do
    begin
      cdsReceiptDt.First;
      cdsReceiptDt.Edit;
      cdsReceiptDt.FieldByName('RCPTMT_ID').AsInteger := RCPTMT_ID;
      Inc(RCPTDT_ID);
      cdsReceiptDt.FieldByName('RCPTDT_ID').AsInteger := RCPTDT_ID;
    end; }

    while not cdsReceiptDt.eof  do    //rotina alterada pq estava gravando uma linha na tabela em branco
    begin
      cdsReceiptDt.First;
      cdsReceiptDt.Edit;
      cdsReceiptDt.FieldByName('RCPTMT_ID').AsInteger := RCPTMT_ID;
      Inc(RCPTDT_ID);
      cdsReceiptDt.FieldByName('RCPTDT_ID').AsInteger := RCPTDT_ID;

      cdsReceiptDt.Post;    //21/06/2011
      cdsReceiptDt.Next;   //21/06/2011
    end;


   //  cdsReceiptDt.Post;

     cdsReceiptMt.Edit;
     cdsReceiptMt.FieldByName('RCPTMT_ID').AsInteger := RCPTMT_ID;
     cdsReceiptMt.Post;

  end;
end;

procedure TfrmReceipts.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  if not Verifica_Campos then
    Exit;

  if status = stConsult Then
  begin

    if dtsMaster.DataSet.State = dsInsert then
      BeforePost;

    if ApplyTablesSys([], [dmSys.cdsReceiptMt, dmSys.cdsReceiptDt]) then
    begin
      SetActions([], True, frmReceipts, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, frmReceipts, t_form_objects);
      actRefresh.Execute;
    end;

  end;
end;

procedure TfrmReceipts.bt_ok_detalheClick(Sender: TObject);
begin
  inherited;

  if not Verifica_Campos_Detalhe then
    Exit;

  if cb_linha.KeyValue = NULL then
  begin
    DmSys.cdsReceiptDt.FieldByName('LD_ID').Value  := NULL;
    DmSys.cdsReceiptDt.FieldByName('LD_DESC').Value  := NULL;
  end
  else
  begin
    DmSys.cdsReceiptDt.FieldByName('LD_ID').AsString := DmSys.cdsLineDetailsAux.FieldByName('LD_ID').AsString;
    DmSys.cdsReceiptDt.FieldByName('LD_DESCSHORT').AsString := DmSys.cdsLineDetailsAux.FieldByName('LD_DESCSHORT').AsString;
  end;

  DmSys.cdsReceiptDt.FieldByName('ZNL_DESCSHORT_ORIG').AsString := DmSys.cdsZones.FieldByName('ZNL_DESCSHORT_ORIG').AsString;
  DmSys.cdsReceiptDt.FieldByName('ZNL_DESCSHORT_DEST').AsString := DmSys.cdsZones.FieldByName('ZNL_DESCSHORT_DEST').AsString;
  DmSys.cdsReceiptDt.FieldByName('RF_DESC').AsString := DmSys.cdsReceiptFields.FieldByName('RF_DESC').AsString;

  DmSys.cdsReceiptDt.Post;

  pn_detalhe.Visible := True;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  pn_bottom_detalhe.Visible := False;
end;

procedure TfrmReceipts.btnCancelTrechosClick(Sender: TObject);
begin
  inherited;
  dmSys.cdsReceiptDt.Cancel;
  pn_detalhe.Visible := True;
  tbtnApply.Enabled := True;
  tbtnCancel.Enabled := True;
  pn_bottom_detalhe.Visible := False;
end;

function TfrmReceipts.Max_RCPTDT_ID: integer;
begin
  with DmSys do
  begin
    if cdsReceiptDt.RecordCount = 0 then
//    if cdsReceiptMt.RecordCount = 0 then
      result := 1
    else
    begin
      cdsGeral.Close;
      cdsGeral.CommandText := 'select max(rcptdt_id) as RCPTDT_ID from receiptdt where rcptmt_id = ' + cdsReceiptMt.FieldByName('RCPTMT_ID').AsString;
      cdsGeral.Open;
      result := cdsGeral.FieldByName('RCPTDT_ID').AsInteger;
    end;
  end;
end;

procedure TfrmReceipts.dtsMasterStateChange(Sender: TObject);
begin
  inherited;
  if dtsMaster.State in [dsInsert, dsEdit] then
    Set_Detalhe(True)
  else
    Set_Detalhe(False);
end;

procedure TfrmReceipts.Set_Detalhe(enabled: boolean);
begin
  tb_inserir_detalhe.Enabled := enabled;
  if DmSys.cdsReceiptDt.RecordCount > 0 then
  begin
    tb_editar_detalhe.Enabled  := enabled;
    tb_excluir_detalhe.Enabled := enabled;
  end
  else
  begin
    tb_editar_detalhe.Enabled  := False;
    tb_excluir_detalhe.Enabled := False;
  end;
end;

procedure TfrmReceipts.actDeleteExecute(Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
  begin
    with DmSys do
    begin
      cdsReceiptMt.Edit;
      cdsReceiptMt.FieldByName('RCPTMT_STATUS').AsString := 'I';
      cdsReceiptMt.Post;
      cdsReceiptMt.ApplyUpdates(-1);
      tbtnRefresh.Click;
    end;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end;
  actLog.Enabled := DmSys.cdsReceiptMt.RecordCount > 0;
end;

procedure TfrmReceipts.cb_campo_reciboCloseUp(Sender: TObject);
begin
  inherited;
  with DmSys do
  begin
    if cdsReceiptFields.FieldByName('RF_TAG').AsString <> '' then
    begin
      cdsReceiptDt.FieldByName('RCPTDT_VALUE').AsString := cdsReceiptFields.FieldByName('RF_TAG').AsString;
      ed_valor.ReadOnly := True;
      cdsReceiptDt.FieldByName('RCPTDT_FORMAT').AsString := cdsReceiptFields.FieldByName('RF_DISPLAYFORMAT').AsString;
    end
    else
    begin
      ed_valor.ReadOnly := False;
      cdsReceiptDt.FieldByName('RCPTDT_VALUE').AsString := '';
      cdsReceiptDt.FieldByName('RCPTDT_FORMAT').AsString := cdsReceiptFields.FieldByName('RF_DISPLAYFORMAT').AsString;
    end;
  end;
end;

function TfrmReceipts.Verifica_Campos_Detalhe: boolean;
begin
  Result := True;
  if cb_linha.KeyValue = null then
  begin
    MessageDlg('Você deve escolher uma linha.', mtWarning, [mbOk], 0);
    cb_linha.SetFocus;
    Result := False;
  end
  else
  if cb_trecho.KeyValue = null then
  begin
    MessageDlg('Você deve escolher um trecho.', mtWarning, [mbOk], 0);
    cb_trecho.SetFocus;
    Result := False;
  end
  else
  if cb_campo_recibo.KeyValue = null then
  begin
    MessageDlg('Você deve escolher um campo.', mtWarning, [mbOk], 0);
    cb_campo_recibo.SetFocus;
    Result := False;
  end
  else
  if ed_no_linha.Text = '' then
  begin
    MessageDlg('Você deve preencher o número da linha.', mtWarning, [mbOk], 0);
    ed_no_linha.SetFocus;
    Result := False;
  end
  else
  if ed_no_coluna.Text = '' then
  begin
    MessageDlg('Você deve preencher o número da coluna.', mtWarning, [mbOk], 0);
    ed_no_coluna.SetFocus;
    Result := False;
  end
  else
  if ed_tamanho.Text = '' then
  begin
    MessageDlg('Você deve preencher o tamanho.', mtWarning, [mbOk], 0);
    ed_tamanho.SetFocus;
    Result := False;
  end
  else
  if StrToInt(ed_tamanho.Text) > 99 then
  begin
    MessageDlg('O tamanho não pode ultrapassar 99.', mtWarning, [mbOk], 0);
    ed_tamanho.SetFocus;
    Result := False;
  end;
end;

function TfrmReceipts.Verifica_Campos: boolean;
begin
  Result := True;

 if pcBaseCadastro.ActivePage=tsBaseCadastroConsulta then
 begin
  if cb_empresa.KeyValue = null then
  begin
    MessageDlg('Você deve escolher uma empresa.', mtWarning, [mbOk], 0);
    cb_empresa.SetFocus;
    Result := False;
  end
  else
  if ed_colunas.Text = '' then
  begin
    MessageDlg('Você deve preencher o no. de colunas.', mtWarning, [mbOk], 0);
    ed_colunas.SetFocus;
    Result := False;
  end
  else
  if ed_linhas.Text = '' then
  begin
    MessageDlg('Você deve preencher o no. de linhas.', mtWarning, [mbOk], 0);
    ed_linhas.SetFocus;
    Result := False;
  end;
 end;
end;

end.
