unit ufrmBanks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, DBClient,
  Buttons;

type
  TfrmBanks = class(TFrmBaseSys)
    edtPesqDesc: TEdit;
    Label3: TLabel;
    cbxProcura: TComboBox;
    Label4: TLabel;
    pnlBottom: TPanel;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewChildren: TToolButton;
    tbtnEditChildren: TToolButton;
    tbtnDeleteChildren: TToolButton;
    pcSubBanks: TPageControl;
    TabSheet1: TTabSheet;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    dbgNossoNumero: TDBGrid;
    TabSheet2: TTabSheet;
    dbeNN_SEQINI: TDBEdit;
    dbeNN_SEQFIM: TDBEdit;
    dbcNN_STATUS: TRxDBComboBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbeNN_SEQVALUE: TDBEdit;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlTop: TPanel;
    Label1: TLabel;
    dbeBK_DESC: TDBEdit;
    Label2: TLabel;
    dbeBK_DESCSHORT: TDBEdit;
    dbcBK_STATUS: TRxDBComboBox;
    Label5: TLabel;
    dbgCedente: TDBGrid;
    PageControl1: TPageControl;
    tabGeral: TTabSheet;
    tabObs: TTabSheet;
    tabInstrucoes: TTabSheet;
    dbeCED_DESC: TDBEdit;
    dbeCED_DESCSHORT: TDBEdit;
    dbeCED_AGENCY: TDBEdit;
    dbeCED_CODCEDENTE: TDBEdit;
    dbeCED_ESPECIE: TDBEdit;
    dbeCED_LOCALPGTO: TDBEdit;
    dbeCED_ACEITE: TDBEdit;
    dbeCED_USOBANCO: TDBEdit;
    dbeCED_CARTEIRA: TDBEdit;
    dbCDE_QTDE: TDBEdit;
    dbcCED_STATUS: TRxDBComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    dbeCED_OBS01: TDBEdit;
    dbeCED_OBS02: TDBEdit;
    dbeCED_OBS03: TDBEdit;
    dbeCED_OBS04: TDBEdit;
    dbeCED_OBS05: TDBEdit;
    Label21: TLabel;
    dbeCED_INSTRUCT1: TDBEdit;
    dbeCED_INSTRUCT2: TDBEdit;
    Label22: TLabel;
    btnSalvarCed: TBitBtn;
    btnCancelarCed: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure tbtnNewChildrenClick(Sender: TObject);
    procedure dbeNN_SEQINIKeyPress(Sender: TObject; var Key: Char);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbeNN_SEQINIExit(Sender: TObject);
    procedure tbtnEditChildrenClick(Sender: TObject);
    procedure tbtnDeleteChildrenClick(Sender: TObject);
    procedure btnSalvarCedClick(Sender: TObject);
    procedure btnCancelarCedClick(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBanks: TfrmBanks;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, uConst, uGeralFunctions, uDmSys,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TfrmBanks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //inherited;
  CloseTablesSys([(dtsMaster.DataSet as TClientDataSet), dmSys1.cdsNossoNumero, dmSys1.cdsCedente]);
  FrmSparkSysMain.stMain.Panels[3].Text := '';
  (dtsMaster.DataSet as TClientDataSet).CommandText := '';
  frmBanks := Nil;
  Action := caFree;
end;

procedure TfrmBanks.FormCreate(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  SetCCAActions([actFilter, actDelete, actRefresh], True, Self);
end;

procedure TfrmBanks.FormShow(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsBanks;
  OpenTablesSys([(dtsMaster.DataSet as TClientDataSet), dmSys1.cdsNossoNumero, dmSys1.cdsCedente]);
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('BK_ID', 'FROM BANKS', 'False', '') ) + ' Registro(s)';
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
  pcBaseCadastroChange(Self);
end;

procedure TfrmBanks.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetCCAActions([], True, Self);
      SetCCAActions([actFilter, actDelete, actRefresh], False, Self);
      if not (dtsMaster.DataSet.State in [dsEdit, dsInsert]) then
      begin
        SetCCAActions([actApplyUpdates, actCancel], False, Self);
      end;
     End
  Else
    Begin
      SetCCAActions([], False, Self);
      SetCCAActions([actInsert, actFilter, actDelete, actRefresh, actExit], True, Self);
      if dtsMaster.DataSet.RecordCount > 0 then
        SetCCAActions([actEdit], True, Self);
    End;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TfrmBanks.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys((dtsMaster.DataSet as TClientDataSet));
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeBK_DESC.SetFocus;
end;

procedure TfrmBanks.actEditExecute(Sender: TObject);
begin
  inherited;
  SetCCAActions([], False, Self);
  actLog.Enabled := False;
  SetCCAActions([actApplyUpdates, actCancel], true, Self);
  dbeBK_DESC.SetFocus;
end;

procedure TfrmBanks.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;

  IF Trim(dbeBK_DESC.Text) = '' Then
    Begin
     DisplayMsg(t_form_objects, 'É obrigatório o preenchimento do campo "Descrição"   ', [], []);
     dbeBK_DESC.SetFocus;
    End
  Else
  If DisplayMsg(t_form_objects, 'Confirma a gravação do registro?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Try
       dmConexao.ConnBrkMaster.AppServer.StartTransaction;

       (dtsMaster.DataSet as TClientDataSet).ApplyUpdates(-1);
       dmSys1.cdsNossoNumero.ApplyUpdates(-1);
       dmSys1.cdsCedente.ApplyUpdates(-1);

       SetCCAActions([], True, Self);
       SetCCAActions([actApplyUpdates, actCancel], False, Self);
       actRefresh.Execute;

       status := stConsult;
       FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);

       dmConexao.ConnBrkMaster.AppServer.Commit;
     Except
       dmConexao.ConnBrkMaster.AppServer.RollBack;
     End;
     pcBaseCadastro.ActivePageIndex := 0;
   End;
   actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmBanks.actCancelExecute(Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, 'Confirma o cancelamento da edição do registro?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     Status := stConsult;
     dtsMaster.DataSet.Cancel;
     dmSys1.cdsNossoNumero.Cancel;
     dmSys1.cdsCedente.Cancel;

     (dtsMaster.DataSet as TClientDataSet).CancelUpdates;
     dmSys1.cdsNossoNumero.CancelUpdates;
     dmSys1.cdsCedente.CancelUpdates;

     SetCCAActions([], True, Self);
     SetCCAActions([actApplyUpdates, actCancel], False, Self);
     pcBaseCadastro.ActivePageIndex := 0;
     actRefresh.Execute;
     FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmBanks.actDeleteExecute(Sender: TObject);
begin
// inherited;
  if dtsMaster.DataSet.FieldByName('BK_STATUS').AsString = 'A' then
  begin
    If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dtsMaster.DataSet.Edit;
      dtsMaster.DataSet.FieldByName('BK_STATUS').AsString := 'I';
      dtsMaster.DataSet.Post;
      FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
    end; //With...
  end
  else
    DisplayMsg(t_form_objects, 'ATENÇÃO: Esse registro já está desativado!   ', [], [], mtConfirmation, [mbOk]);

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0
end;

procedure TfrmBanks.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edtPesqDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' BK_DESC LIKE ' + QuotedStr(edtPesqDesc.Text + '%') + ' AND ';
       end;

     Case cbxProcura.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' BK_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' BK_STATUS = ' + QuotedStr('I') + ' AND ';
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

  dtsMaster.DataSet.Close;
  (dtsMaster.DataSet as TClientDataSet).CommandText := 'SELECT * FROM BANKS ' + strWhere + ' ORDER BY BK_ID';
  dtsMaster.DataSet.Open;
  FrmSparkSysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('BK_ID', 'FROM BANKS', 'True', strWhere) ) + ' Registro(s)';

  actLog.Enabled := dtsMaster.DataSet.RecordCount > 0;
end;

procedure TfrmBanks.tbtnNewChildrenClick(Sender: TObject);
begin
  inherited;
  if dtsMaster.DataSet.FieldByName('BK_ID').IsNull then
  begin
    DisplayMsg(t_form_objects, 'ATENÇÃO: É necessário incluir o registro antes de editar o Nosso Número e o Cedente!   ', [], [], mtConfirmation, [mbOk]);
    exit;
  end;

  SetActions([actApplyUpdates, actcancel], False, Self, t_form_objects);
  Case pcSubBanks.ActivePageIndex of
    0 : Begin
          pnlTop.Enabled := False;
          dbgNossoNumero.Visible := False;
          dbeNN_SEQINI.SetFocus;
          dmSys1.cdsNossoNumero.Append;
          dbeNN_SEQVALUE.Text := '0';
          dbcNN_STATUS.ItemIndex := 0;
        end;

    1 : Begin
          pnlTop.Enabled := False;
          dbgCedente.Visible := False;
          dbeCED_DESC.SetFocus;
          dmSys1.cdsCedente.Append;
          dbcCED_STATUS.ItemIndex := 0;
        end;
  end;
end;

procedure TfrmBanks.dbeNN_SEQINIKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0','1','2','3','4','5','6','7','8','9', #8]) then
    Key := #0;
end;

procedure TfrmBanks.btnSalvarClick(Sender: TObject);
var
  iID : integer;
begin
  inherited;
  try
    dmSys1.cdsNossoNumero.Post;
    iID := dmSys1.cdsNossoNumero.FieldByName('NN_ID').AsInteger;
    dmSys1.cdsNossoNumero.First;
    while not dmSys1.cdsNossoNumero.Eof do
    begin
      if dmSys1.cdsNossoNumero.FieldByName('NN_ID').AsInteger <> iID then
      begin
        dmSys1.cdsNossoNumero.Edit;
        dmSys1.cdsNossoNumero.FieldByName('NN_STATUS').AsString := 'I';
        dmSys1.cdsNossoNumero.Post;
      end;
      dmSys1.cdsNossoNumero.Next;
    end;
    dbgNossoNumero.Visible := True;
    pnlTop.Enabled := True;
    SetActions([actApplyUpdates, actcancel], True, Self, t_form_objects);
  except

  end
end;

procedure TfrmBanks.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dmSys1.cdsNossoNumero.Cancel;
  dbgNossoNumero.Visible := True;
  pnlTop.Enabled := True;
  SetActions([actApplyUpdates, actcancel], True, Self, t_form_objects);
end;

procedure TfrmBanks.dbeNN_SEQINIExit(Sender: TObject);
begin
  inherited;
  if dmSys1.cdsNossoNumero.State = dsInsert then
    dmSys1.cdsNossoNumero.FieldByName('NN_SEQVALUE').AsInteger := dmSys1.cdsNossoNumero.FieldByName('NN_SEQINI').AsInteger;
end;

procedure TfrmBanks.tbtnEditChildrenClick(Sender: TObject);
var
  iSeqIni,iSeqFim,iSeqValue, iCarteira,
  iQtde : Integer;
  sDesc, sDescShort, sAgency, sCodCedente,
  sEspecie, sObs01, sObs02, sObs03, sObs04,
  sObs05, sLocalPgto, sAceite, sUsoBanco,
  sInstruct1, sInstruct2 : String;
begin
  inherited;
  if dtsMaster.DataSet.FieldByName('BK_ID').IsNull then
  begin
    DisplayMsg(t_form_objects, 'ATENÇÃO: É necessário incluir o registro antes de editar o Nosso Número e o Cedente!   ', [], [], mtConfirmation, [mbOk]);
    exit;
  end;

  SetActions([actApplyUpdates, actcancel], False, Self, t_form_objects);
  Case pcSubBanks.ActivePageIndex of
    0 : Begin
          if dmSys1.cdsNossoNumero.FieldByName('NN_STATUS').AsString = 'I' then
          begin
            DisplayMsg(t_form_objects, 'Registro desativado! Não é possível editar este registro.   ', [], [], mtWarning, [mbOK]);
            exit;
          end;

          pnlTop.Enabled := False;
          iSeqValue := dmSys1.cdsNossoNumero.FieldByName('NN_SEQVALUE').AsInteger;
          iSeqIni   := dmSys1.cdsNossoNumero.FieldByName('NN_SEQINI').AsInteger;
          iSeqFim   := dmSys1.cdsNossoNumero.FieldByName('NN_SEQEND').AsInteger;
          dmSys1.cdsNossoNumero.Append;
          dmSys1.cdsNossoNumero.FieldByName('NN_SEQVALUE').AsInteger := iSeqValue;
          dmSys1.cdsNossoNumero.FieldByName('NN_SEQINI').AsInteger   := iSeqIni;
          dmSys1.cdsNossoNumero.FieldByName('NN_SEQEND').AsInteger   := iSeqFim;
          dbgNossoNumero.Visible := False;
          dbcNN_STATUS.ItemIndex := 0;
          dbeNN_SEQINI.SetFocus;
        end;

    1 : Begin
          if dmSys1.cdsCedente.FieldByName('CED_STATUS').AsString = 'I' then
          begin
            DisplayMsg(t_form_objects, 'Registro desativado! Não é possível editar este registro.   ', [], [], mtWarning, [mbOK]);
            exit;
          end;

          pnlTop.Enabled := False;
          iCarteira := dmSys1.cdsCedente.FieldByName('CED_CARTEIRA').AsInteger;
          iQtde := dmSys1.cdsCedente.FieldByName('CED_QTDE').AsInteger;
          sDesc := dmSys1.cdsCedente.FieldByName('CED_DESC').AsString;
          sDescShort := dmSys1.cdsCedente.FieldByName('CED_DESCSHORT').AsString;
          sAgency := dmSys1.cdsCedente.FieldByName('CED_AGENCY').AsString;
          sCodCedente := dmSys1.cdsCedente.FieldByName('CED_CODCEDENTE').AsString;
          sEspecie := dmSys1.cdsCedente.FieldByName('CED_ESPECIE').AsString;
          sObs01 := dmSys1.cdsCedente.FieldByName('CED_OBS01').AsString;
          sObs02 := dmSys1.cdsCedente.FieldByName('CED_OBS02').AsString;
          sObs03 := dmSys1.cdsCedente.FieldByName('CED_OBS03').AsString;
          sObs04 := dmSys1.cdsCedente.FieldByName('CED_OBS04').AsString;
          sObs05 := dmSys1.cdsCedente.FieldByName('CED_OBS05').AsString;
          sLocalPgto := dmSys1.cdsCedente.FieldByName('CED_LOCALPGTO').AsString;
          sAceite := dmSys1.cdsCedente.FieldByName('CED_ACEITE').AsString;
          sUsoBanco := dmSys1.cdsCedente.FieldByName('CED_USOBANCO').AsString;
          sInstruct1 := dmSys1.cdsCedente.FieldByName('CED_INSTRUCT1').AsString;
          sInstruct2 := dmSys1.cdsCedente.FieldByName('CED_INSTRUCT2').AsString;

          dmSys1.cdsCedente.Append;

          dmSys1.cdsCedente.FieldByName('CED_CARTEIRA').AsInteger := iCarteira;
          dmSys1.cdsCedente.FieldByName('CED_QTDE').AsInteger := iQtde;
          dmSys1.cdsCedente.FieldByName('CED_DESC').AsString := sDesc;
          dmSys1.cdsCedente.FieldByName('CED_DESCSHORT').AsString := sDescShort;
          dmSys1.cdsCedente.FieldByName('CED_AGENCY').AsString := sAgency;
          dmSys1.cdsCedente.FieldByName('CED_CODCEDENTE').AsString := sCodCedente;
          dmSys1.cdsCedente.FieldByName('CED_ESPECIE').AsString := sEspecie;
          dmSys1.cdsCedente.FieldByName('CED_OBS01').AsString := sObs01;
          dmSys1.cdsCedente.FieldByName('CED_OBS02').AsString := sObs02;
          dmSys1.cdsCedente.FieldByName('CED_OBS03').AsString := sObs03;
          dmSys1.cdsCedente.FieldByName('CED_OBS04').AsString := sObs04;
          dmSys1.cdsCedente.FieldByName('CED_OBS05').AsString := sObs05;
          dmSys1.cdsCedente.FieldByName('CED_LOCALPGTO').AsString := sLocalPgto;
          dmSys1.cdsCedente.FieldByName('CED_ACEITE').AsString := sAceite;
          dmSys1.cdsCedente.FieldByName('CED_USOBANCO').AsString := sUsoBanco;
          dmSys1.cdsCedente.FieldByName('CED_INSTRUCT1').AsString := sInstruct1;
          dmSys1.cdsCedente.FieldByName('CED_INSTRUCT2').AsString := sInstruct2;

          dbgCedente.Visible := False;
          dbcCED_STATUS.ItemIndex := 0;
          dbeCED_DESC.SetFocus;
        end;
  end;
end;

procedure TfrmBanks.tbtnDeleteChildrenClick(Sender: TObject);
begin
  inherited;
  if dtsMaster.DataSet.FieldByName('BK_ID').IsNull then
  begin
    DisplayMsg(t_form_objects, 'ATENÇÃO: É necessário incluir o registro antes de excluir o Nosso Número e o Cedente!   ', [], [], mtConfirmation, [mbOk]);
    exit;
  end;

  Case pcSubBanks.ActivePageIndex of
    0 : Begin
          if dmSys1.cdsNossoNumero.FieldByName('NN_STATUS').AsString = 'A' then
          begin
            If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
            begin
              dmSys1.cdsNossoNumero.Edit;
              dmSys1.cdsNossoNumero.FieldByName('NN_STATUS').AsString := 'I';
              dmSys1.cdsNossoNumero.Post;
            end; //With...
          end
          else
            DisplayMsg(t_form_objects, 'ATENÇÃO: Esse registro já está desativado!   ', [], [], mtConfirmation, [mbOk]);
      end;
    1 : Begin
          if dmSys1.cdsCedente.FieldByName('CED_STATUS').AsString = 'A' then
          begin
            If DisplayMsg(t_form_objects, 'Confirma a desativação do registro atual?   ', [], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
            begin
              dmSys1.cdsCedente.Edit;
              dmSys1.cdsCedente.FieldByName('CED_STATUS').AsString := 'I';
              dmSys1.cdsCedente.Post;
            end; //With...
          end
          else
            DisplayMsg(t_form_objects, 'ATENÇÃO: Esse registro já está desativado!   ', [], [], mtConfirmation, [mbOk]);
        end;
  end;

end;

procedure TfrmBanks.btnSalvarCedClick(Sender: TObject);
var
  iID : integer;
begin
  inherited;
  try
    dmSys1.cdsCedente.Post;
    iID := dmSys1.cdsCedente.FieldByName('CED_ID').AsInteger;
    dmSys1.cdsCedente.First;
    while not dmSys1.cdsCedente.Eof do
    begin
      if dmSys1.cdsCedente.FieldByName('CED_ID').AsInteger <> iID then
      begin
        dmSys1.cdsCedente.Edit;
        dmSys1.cdsCedente.FieldByName('CED_STATUS').AsString := 'I';
        dmSys1.cdsCedente.Post;
      end;
      dmSys1.cdsCedente.Next;
    end;
    dbgCedente.Visible := True;
    pnlTop.Enabled := True;
    SetActions([actApplyUpdates, actcancel], True, Self, t_form_objects);
  except

  end

end;

procedure TfrmBanks.btnCancelarCedClick(Sender: TObject);
begin
  inherited;
  dmSys1.cdsCedente.Cancel;
  dbgCedente.Visible := True;
  pnlTop.Enabled := True;
  SetActions([actApplyUpdates, actcancel], True, Self, t_form_objects);
end;

procedure TfrmBanks.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  pcBaseCadastroChange(Self);
end;

end.
