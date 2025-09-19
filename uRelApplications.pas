unit uRelApplications;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ExtCtrls, DB, DBClient, ppBands, ppCache, ppPrnabl,
  ppCtrls, ppVar;

type
  TfrmRelApplications = class(TForm)
    grpApp_ID: TGroupBox;
    edtAPP_ID1: TEdit;
    edtAPP_ID2: TEdit;
    Label1: TLabel;
    grpIssuers: TGroupBox;
    lstIssuerDisp: TListBox;
    lstIssuerSel: TListBox;
    btnAddAll: TSpeedButton;
    btnAddOne: TSpeedButton;
    btnDelOne: TSpeedButton;
    btnDelAll: TSpeedButton;
    GroupBox1: TGroupBox;
    chkAcoesValidador: TCheckBox;
    chkCondValidador: TCheckBox;
    chkAcoesVisuaisVal: TCheckBox;
    chkEstadosVal: TCheckBox;
    chkStrings: TCheckBox;
    btnExibir: TBitBtn;
    btnCancelar: TBitBtn;
    chkVersoes: TCheckBox;
    chkExcessoesLinhas: TCheckBox;
    chkTiposUsuarios: TCheckBox;
    chkEmpresas: TCheckBox;
    chkTipoCart: TCheckBox;
    chkTemplatesCart: TCheckBox;
    chkDesenhosCart: TCheckBox;
    pipeApplications: TppDBPipeline;
    rptApplications: TppReport;
    grpOrdenacao: TGroupBox;
    btnOrdAddAll: TSpeedButton;
    btnOrdAddOne: TSpeedButton;
    btnOrdDelOne: TSpeedButton;
    btnOrdDelAll: TSpeedButton;
    lstOrdDisp: TListBox;
    lstOrdSel: TListBox;
    Bevel1: TBevel;
    btnTodos: TBitBtn;
    btnNenhum: TBitBtn;
    cdsOrdens: TClientDataSet;
    cdsOrdensTexto: TStringField;
    cdsOrdensCampo: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    replblApp_ID: TppLabel;
    rptlblIssuers: TppLabel;
    rptlblOrder: TppLabel;
    rptlblSubRels: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppLabel18: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText19: TppDBText;
    ppLabel22: TppLabel;
    rptlblFareRule: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable1: TppSystemVariable;
    ppLabel23: TppLabel;
    ppDBText20: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDBText21: TppDBText;
    ppLabel26: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppDBText24: TppDBText;
    ppLabel29: TppLabel;
    ppDBText25: TppDBText;
    ppLabel30: TppLabel;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    rptlblStatus: TppLabel;
    procedure ListaIssuers;
    procedure ListaOrdens;
    procedure btnAddAllClick(Sender: TObject);
    procedure btnAddOneClick(Sender: TObject);
    procedure btnDelOneClick(Sender: TObject);
    procedure btnDelAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure btnOrdAddAllClick(Sender: TObject);
    procedure btnOrdAddOneClick(Sender: TObject);
    procedure btnOrdDelOneClick(Sender: TObject);
    procedure btnOrdDelAllClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExibirClick(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelApplications: TfrmRelApplications;

implementation

uses uDmSys;

{$R *.dfm}

{ TfrmRelApplications }

procedure TfrmRelApplications.ListaIssuers;
begin
  with dmSys do
    begin
      lstIssuerDisp.Clear;
      lstIssuerSel.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT ISS_ID, ISS_DESCSHORT FROM ISSUERS  ';
      cdsGeral.Open;

      while NOT cdsGeral.Eof do
      begin
        lstIssuerDisp.Items.AddObject(cdsGeral.fieldByName('ISS_DESCSHORT').AsString,
                                      TObject(cdsGeral.fieldByName('ISS_ID').AsInteger));
        cdsGeral.Next;
      end;
    end;
end;

procedure TfrmRelApplications.btnAddAllClick(Sender: TObject);
begin
  lstIssuerDisp.SelectAll;
  lstIssuerDisp.MoveSelection(lstIssuerSel);
end;

procedure TfrmRelApplications.btnAddOneClick(Sender: TObject);
begin
  lstIssuerDisp.MoveSelection(lstIssuerSel);
end;

procedure TfrmRelApplications.btnDelOneClick(Sender: TObject);
begin
  lstIssuerSel.MoveSelection(lstIssuerDisp);
end;

procedure TfrmRelApplications.btnDelAllClick(Sender: TObject);
begin
  lstIssuerSel.SelectAll;
  lstIssuerSel.MoveSelection(lstIssuerDisp);
end;

procedure TfrmRelApplications.FormCreate(Sender: TObject);
begin
  ListaIssuers;

  cdsOrdens.Open;
  cdsOrdens.AppendRecord(['Código do Emissor','ISS_ID']);
  cdsOrdens.AppendRecord(['Código da Aplicação','APP_ID']);
  cdsOrdens.AppendRecord(['Descrição da Aplicação','APP_DESCSHORT']);
  cdsOrdens.AppendRecord(['Prioridade','APP_PRIORITY']);
  cdsOrdens.AppendRecord(['Data de Registro','APP_REGDATE']);
  cdsOrdens.AppendRecord(['Usuário','APP_REGUSER']);
  ListaOrdens;

end;

procedure TfrmRelApplications.btnTodosClick(Sender: TObject);
begin
  chkAcoesValidador.Checked  := True;
  chkCondValidador.Checked   := True;
  chkAcoesVisuaisVal.Checked := True;
  chkEstadosVal.Checked      := True;
  chkStrings.Checked         := True;
  chkVersoes.Checked         := True;
  chkExcessoesLinhas.Checked := True;
  chkTiposUsuarios.Checked   := True;
  chkEmpresas.Checked        := True;
  chkTipoCart.Checked        := True;
  chkTemplatesCart.Checked   := True;
  chkDesenhosCart.Checked    := True;
end;

procedure TfrmRelApplications.btnNenhumClick(Sender: TObject);
begin
  chkAcoesValidador.Checked  := False;
  chkCondValidador.Checked   := False;
  chkAcoesVisuaisVal.Checked := False;
  chkEstadosVal.Checked      := False;
  chkStrings.Checked         := False;
  chkVersoes.Checked         := False;
  chkExcessoesLinhas.Checked := False;
  chkTiposUsuarios.Checked   := False;
  chkEmpresas.Checked        := False;
  chkTipoCart.Checked        := False;
  chkTemplatesCart.Checked   := False;
  chkDesenhosCart.Checked    := False;
end;

procedure TfrmRelApplications.ListaOrdens;
begin
  lstOrdDisp.Clear;
  lstOrdSel.Clear;

  if not cdsOrdens.Active then
    cdsOrdens.Open;

  cdsOrdens.First;

  while not cdsOrdens.Eof do
  begin
    lstOrdDisp.Items.AddObject(cdsOrdensTexto.AsString, TObject(cdsOrdensCampo.AsString));
    cdsOrdens.Next;
  end;
end;

procedure TfrmRelApplications.btnOrdAddAllClick(Sender: TObject);
begin
  lstOrdDisp.SelectAll;
  lstOrdDisp.MoveSelection(lstOrdSel);
end;

procedure TfrmRelApplications.btnOrdAddOneClick(Sender: TObject);
begin
  lstOrdDisp.MoveSelection(lstOrdSel);
end;

procedure TfrmRelApplications.btnOrdDelOneClick(Sender: TObject);
begin
  lstOrdSel.MoveSelection(lstOrdDisp);
end;

procedure TfrmRelApplications.btnOrdDelAllClick(Sender: TObject);
begin
  lstOrdSel.SelectAll;
  lstOrdSel.MoveSelection(lstOrdDisp);
end;

procedure TfrmRelApplications.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmRelApplications := Nil;
end;

procedure TfrmRelApplications.btnExibirClick(Sender: TObject);
var
  i : integer;
begin
  DmSys.cdsApplications.Close;
  DmSys.cdsApplications.CommandText := '';

  DmSys.cdsApplications.CommandText :=                                     ' SELECT APP.*,';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '       APP.APP_STATUS  AS STATUS_ID,';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '       SF.SF_DESC,';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '       MA.MA_DESC,';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '       AF.AF_DESC,';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '       VDM.VDM_DESC,';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '       ISS.ISS_DESCLONG,';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '       KT.KT_DESC';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' FROM APPLICATIONS APP';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' LEFT JOIN  ISSUERS ISS ON (ISS.ISS_ID = APP.ISS_ID)';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' LEFT JOIN  STATISTICALFAMILIES SF  ON (SF.SF_ID = APP.SF_ID)';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' LEFT JOIN  MASTERAPPLICATIONS MA   ON (MA.MA_ID = APP.MA_ID)';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' LEFT JOIN  APPLICATIONFUNCTIONS AF ON (AF.AF_ID = APP.AF_ID)';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' LEFT JOIN  VALIDATORDISPLAYSMT VDM ON (VDM.VDM_CODE = APP.VDM_CODE)';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' LEFT JOIN KEYTYPES KT ON (KT.KT_CODE = APP.KT_CODE)';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' WHERE  APP.APP_STATUS = ''A''';
  DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' AND APP_ID BETWEEN '+edtAPP_ID1.Text+' AND '+edtAPP_ID2.Text;

  rptlblIssuers.Caption := 'Emissores: ';
  if lstIssuerSel.Count > 0 then
  begin
    DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' AND (';
    for i := 0 to (lstIssuerSel.Count - 1) do
    begin
      if i > 0 then
      begin
        DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' OR ';
      rptlblIssuers.Caption := rptlblIssuers.Caption + ', ';
      end;
      DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + '(APP.ISS_ID = ' + IntToStr(Integer(lstIssuerSel.Items.Objects[i])) + ')';
      rptlblIssuers.Caption := rptlblIssuers.Caption + lstIssuerSel.Items.Strings[i];
    end;
    DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ')';
  end
  else
    rptlblIssuers.Caption := 'Emissores: TODOS';

  rptlblOrder.Caption := 'Ordenação: ';
  if lstOrdSel.Count > 0 then
  begin
    DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' ORDER BY ';
    for i := 0 to (lstOrdSel.Count - 1) do
    begin
      if i > 0 then
        DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ', ';
      DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + String(lstOrdSel.Items.Objects[i]);
    end;
  end
  else
  begin
    DmSys.cdsApplications.CommandText := DmSys.cdsApplications.CommandText + ' ORDER BY APP.APP_ID, APP.ISS_ID';
    rptlblOrder.Caption := 'Ordenação: Código da Aplicação, Código do Emissor';
  end;
  DmSys.cdsApplications.Open;


  rptApplications.Print;
end;

procedure TfrmRelApplications.ppDetailBand1BeforePrint(Sender: TObject);
begin
  if pipeApplications.DataSource.DataSet.FieldByName('APP_FARERULE').AsInteger = 0 then
    rptlblFareRule.Caption := '0 - Tarifa da Data'
  else if pipeApplications.DataSource.DataSet.FieldByName('APP_FARERULE').AsInteger = 1 then
    rptlblFareRule.Caption := '1 - Tarifa Dentro do Período'
  else if pipeApplications.DataSource.DataSet.FieldByName('APP_FARERULE').AsInteger = 2 then
    rptlblFareRule.Caption := '2 - Tarifa Nova';

  if UpperCase(pipeApplications.DataSource.DataSet.FieldByName('APP_STATUS').AsString) = 'A' then
    rptlblStatus.Caption := 'Ativo'
  else
    rptlblStatus.Caption := 'Inativo';

end;

procedure TfrmRelApplications.btnCancelarClick(Sender: TObject);
begin
close;
end;

end.
