unit uFrmBioFacial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, Buttons, RXCtrls;

type
  TRecCampos = record
    Tipo: string;
    Campo: String;
    SQL: String;
    Alias: String;
  end;
  TRecCamposObj = class
    Dados: TRecCampos;
  end;

  TRecConector = record
    Conector: String;
  end;
  TRecConectorObj = class
    Dados: TRecConector;
  end;

  TFrmBioFacial = class(TFrmBaseSys)
    lbFiltrado: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    lbCampos: TListBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    editFiltro: TEdit;
    Splitter1: TSplitter;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    lbConector: TListBox;
    Splitter2: TSplitter;
    Panel11: TPanel;
    editValor: TEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    ListBox3: TListBox;
    Label2: TLabel;
    pnIncluindo: TPanel;
    pnEditando: TPanel;
    Label3: TLabel;
    cbEmpresas: TComboBox;
    Panel14: TPanel;
    Splitter3: TSplitter;
    Panel15: TPanel;
    DBGrid1: TDBGrid;
    dsApp: TDataSource;
    EditIss: TEdit;
    EditApp: TEdit;
    EditDesc: TEdit;
    Label4: TLabel;
    EditISS_ID: TEdit;
    Label5: TLabel;
    EditAPP_ID: TEdit;
    Label6: TLabel;
    EditAplicativo: TEdit;
    Label7: TLabel;
    EditBIAC_ID: TEdit;
    lblID: TLabel;
    EditID: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label8: TLabel;
    Panel16: TPanel;
    rbIncAtivo: TRadioButton;
    rbIncInativo: TRadioButton;
    cbTodas: TCheckBox;
    lkFilterStatus: TComboBox;
    btnLimpaStatus: TSpeedButton;
    lbStatus: TLabel;
    cbEmp: TComboBox;
    btnLimpaEmpresa: TSpeedButton;
    lbEmpresa: TLabel;
    Panel1: TPanel;
    lblContador: TRxLabel;
    procedure FormShow(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure btnLimpaFiltroClick(Sender: TObject);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure lblBackClick(Sender: TObject);
    procedure lblAdvancedSearchClick(Sender: TObject);
    procedure grdResultadoCellClick(Column: TColumn);
    procedure lbCamposClick(Sender: TObject);
    procedure lbConectorClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure tsBaseCadastroConsultaShow(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure tsBaseCadastroFiltroShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure EditChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SoNumero(Sender: TObject; var Key: Char);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure tbtnApplyClick(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCancelExecute(Sender: TObject);
    procedure tbtnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaStatusClick(Sender: TObject);
    procedure btnLimpaEmpresaClick(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
  private
    stApp,ct,defOrder,strOrder,strWhere: String;
    O: TRecCamposObj;
    OC: TRecConectorObj;
    bolFiltroAvancado: Boolean;
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    function acertaSQL(Const stWhere, stOrder: String): String;
    procedure FiltroAvancado;
    function PegaTipo(const nome: String): TFieldType;
  public
    { Public declarations }
  end;

var
  FrmBioFacial: TFrmBioFacial;

implementation

uses Aguarde,
     uDmSys, AppSparkSysMain, uDmConexao, uConst, uGeralFunctions,
     uFrmBaseCadastro, uProviderTypes, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.FormShow(Sender: TObject);
Var i: Integer;
    R: TRecCampos;
    RC: TRecConector;
begin
inherited;
gbFiltro.BringToFront; bolFiltroAvancado:=false; pnfiltro.Height:=80;
lblBackClick(Sender);
// DmSys.cdsBioFacial => dataset do dts Master
grdResultado.Columns[0].Title.Caption:='ID';
grdResultado.Columns[1].Title.Caption:='Empresa';
grdResultado.Columns[2].Title.Caption:='ISS_ID';
grdResultado.Columns[3].Title.Caption:='APP_ID';
grdResultado.Columns[4].Title.Caption:='Aplicação';
grdResultado.Columns[5].Title.Caption:='BIAC_ID';
grdResultado.Columns[6].Title.Caption:='Situação';
grdResultado.Columns[7].Title.Caption:='Gravação';
grdResultado.Columns[8].Title.Caption:='Usuário';

defOrder:=' ORDER BY bio.BIDC_ID desc ';
strOrder:=defOrder;
ct:='SELECT bio.*, app.App_Desclong, img.bidl_desc, '+#13+
    'CASE bio.bidc_status WHEN ''A'' THEN ''Ativo'' WHEN ''I'' THEN ''Inativo'' ELSE ''Desconhecido'' END AS status_desc '+#13+
    'FROM BIOIMAGEDEVICECONFIG bio '+#13+
    'INNER JOIN applications app ON app.APP_ID = bio.APP_ID AND app.iss_id = bio.iss_id '+#13+
    'INNER JOIN BIOIMAGEDEVICELAYOUT img ON img.bidl_id = bio.bidl_id '+#13+
    ' %where% '+#13+' %order% ';

DmSys.cdsBioFacial.CommandText:=acertaSQL('',defOrder);
//ShowMessage(DmSys.cdsBioFacial.CommandText);
OpenTablesSys([DmSys.cdsBioFacial]);

//FrmSparksysMain.stMain.Panels[3].Text:=IntToStr(DmSys.cdsBioFacial.RecordCount)+' Registro(s)';
lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsBioFacial.RecordCount)+' registro(s)';
FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='select * from BIOIMAGEDEVICELAYOUT ORDER BY BIDL_DESC';
   cdsGeral.Open;
   WHILE not cdsGeral.EOF
   DO BEGIN
      cbEmp.Items.AddObject(cdsGeral.fieldByName('BIDL_DESC').AsString,
                            TObject(cdsGeral.fieldByName('BIDL_ID').AsInteger));
      cbEmpresas.Items.AddObject(cdsGeral.fieldByName('BIDL_DESC').AsString,
                            TObject(cdsGeral.fieldByName('BIDL_ID').AsInteger));
      cdsGeral.Next;
      END;
   cdsGeral.Close;
   END;

FOR i:=0 to grdResultado.Columns.Count-1
DO BEGIN
{  Tipo: string;
   Campo: String;
   SQL: String;  }
   IF grdResultado.Columns[i].DisplayName = 'BIDC_REGDATE' THEN Continue;
   R.Tipo:='string';
   IF PegaTipo(grdResultado.Columns[i].DisplayName) = ftInteger THEN R.Tipo := 'integer';
   R.Campo:=grdResultado.Columns[i].DisplayName;

   R.Alias:='';
   IF R.Campo = 'ISS_ID' THEN R.Alias:='bio.';
   IF R.Campo = 'APP_ID' THEN R.Alias:='bio.';
   IF i = 6
   THEN BEGIN
        R.Campo:='BIDC_STATUS';
        R.Alias:='bio.';
        END;

   R.SQL:='';
   O:=TRecCamposObj.Create; O.Dados:=R;

   lbCampos.AddItem(grdResultado.Columns[i].Title.Caption,O);

   //grdResultado.Columns[i].Title.Color:=clBtnFace;
   END;

O:=TRecCamposObj(lbCampos.Items.Objects[3]);
//O.Dados.Campo:='BIDC_STATUS';

RC.Conector:='='; OC:=TRecConectorObj.Create; OC.Dados:=RC;
lbConector.AddItem('Igual',OC);
RC.Conector:='<>'; OC:=TRecConectorObj.Create; OC.Dados:=RC;
lbConector.AddItem('Diferente',OC);
RC.Conector:='>'; OC:=TRecConectorObj.Create; OC.Dados:=RC;
lbConector.AddItem('Maior',OC);
RC.Conector:='<'; OC:=TRecConectorObj.Create; OC.Dados:=RC;
lbConector.AddItem('Menor',OC);

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function TFrmBioFacial.acertaSQL(Const stWhere, stOrder: String): String;
Var S: String;
begin
S:=StringReplace(ct, '%where%', stWhere, [rfReplaceAll, rfIgnoreCase]);
S:=StringReplace(S, '%order%', stOrder, [rfReplaceAll, rfIgnoreCase]);
Result:=S;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function TFrmBioFacial.PegaTipo(const nome: String): TFieldType;
Var i: Integer; S: String;
begin
Result:=ftInteger;
IF dtsMaster.DataSet = nil THEN dtsMaster.DataSet:=DmSys.cdsBioFacial;
FOR i:=0 to grdResultado.DataSource.DataSet.Fields.Count-1
DO BEGIN
   S:=FieldTypeNames[grdResultado.DataSource.DataSet.Fields[i].DataType];
   S:=UpperCase(S);
   IF grdResultado.DataSource.DataSet.Fields[i].FieldName = nome
   THEN IF S = 'STRING' THEN BEGIN Result:=ftString; Exit; END;
   END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.FiltroAvancado;
Var S: String;
begin
IF lbCampos.ItemIndex = -1
THEN BEGIN Dialogo('ERRO: Falta selecionar o CAMPO',mtError,[mbOK],0); Exit; END;
IF lbConector.ItemIndex = -1
THEN BEGIN Dialogo('ERRO: Falta selecionar o CONECTOR',mtError,[mbOK],0); Exit; END;

S:=' '+OC.Dados.Conector+' ';
IF O.Dados.Campo = 'BIDC_STATUS'
THEN editValor.Text:=Copy(editValor.Text,1,1);
IF O.Dados.Tipo = 'string'
THEN editFiltro.Text:=O.Dados.Campo+S+QuotedStr(editValor.Text)
ELSE editFiltro.Text:=O.Dados.Campo+S+editValor.Text;
IF O.Dados.Alias <> ''
THEN editFiltro.Text:=O.Dados.Alias+editFiltro.Text;
S:=' WHERE '+editFiltro.Text+' ';
lbFiltrado.Visible:=S <> '';

with DmSys do
  begin
    cdsBioFacial.Close;
    cdsBioFacial.CommandText:=acertaSQL(S,defOrder);
    //ShowMessage(cdsBioFacial.CommandText);
    FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O';
    FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    cdsBioFacial.Open;
    FrmSparksysMain.stMain.Panels[3].Text:=IntToStr(cdsBioFacial.RecordCount)+' Registro(s)';
    {intToStr(
      dmConexao.ConnBrkMaster.AppServer.GetDBCount
         ('BIDC_ID', 'FROM BIOIMAGEDEVICECONFIG bio', 'True',S))+' Registro(s)';  }
    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
  end;
grdResultado.SetFocus;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.actFilterExecute(Sender: TObject);
var S: String; i: Integer;
begin
S:='';
IF bolFiltroAvancado THEN BEGIN FiltroAvancado; Exit; END;
IF cbEmp.ItemIndex > -1
THEN BEGIN
     i:=Integer(cbEmp.Items.Objects[cbEmp.ItemIndex]);
     IF i > 0 THEN S:=S+' AND bio.BIDL_ID = '+IntToStr(i)+' ';
     END;
IF lkFilterStatus.Text = 'Ativo'   THEN S:=S+' AND BIDC_STATUS = ''A''';
IF lkFilterStatus.Text = 'Inativo' THEN S:=S+' AND BIDC_STATUS = ''I''';
IF S <> '' THEN BEGIN Delete(S,1,4); S:=' WHERE '+S+' '; END;
strWhere:=S;

with DmSys do
  begin
    cdsBioFacial.Close;
    cdsBioFacial.CommandText:=acertaSQL(strWhere,strOrder);
    //ShowMessage(cdsBioFacial.CommandText);
    FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O';
    FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
    cdsBioFacial.Open;

    //FrmSparksysMain.stMain.Panels[3].Text:=IntToStr(cdsBioFacial.RecordCount)+' Registro(s)';
    lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsBioFacial.RecordCount)+' registro(s)';
    FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
  end;
lbFiltrado.Visible:=S <> '';
grdResultado.SetFocus;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.btnLimpaFiltroClick(Sender: TObject);
begin
cbEmp.ItemIndex:=0;
lkFilterStatus.ItemIndex:=-1;
lbCampos.ItemIndex:=-1;
lbConector.ItemIndex:=-1;
editFiltro.Clear;
editValor.Clear;
actFilterExecute(Sender);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.lblBackClick(Sender: TObject);
begin
gbFiltro.BringToFront; bolFiltroAvancado:=false;
pnfiltro.Height:=80;
end;
procedure TFrmBioFacial.lblAdvancedSearchClick(Sender: TObject);
begin
gbFiltroAvansado.BringToFront; bolFiltroAvancado:=true;
pnfiltro.Height:=230;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.grdResultadoCellClick(Column: TColumn);
//Var
//i: Integer;
//S: String;
begin
{S:='';
FOR i:=0 to DmSys.cdsBioFacial.FieldCount-1
DO BEGIN
   S:=S+DmSys.cdsBioFacial.Fields[i].DisplayName+#13;
   END;
ShowMessage(S);
ShowMessage(O.Dados.Campo); }
IF (bolFiltroAvancado)AND(lbCampos.ItemIndex = -1)
THEN BEGIN Dialogo('ERRO: Falta selecionar o CAMPO',mtError,[mbOK],0); Exit; END;

editValor.Text:=DmSys.cdsBioFacial.FieldByName(O.Dados.Campo).AsString;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.lbCamposClick(Sender: TObject);
Var i: Integer;
begin
i:=lbCampos.ItemIndex;
btnLimpaFiltroClick(Sender);
lbCampos.ItemIndex:=i;
editValor.Clear;
O:=TRecCamposObj(lbCampos.Items.Objects[lbCampos.ItemIndex]);
IF UpperCase(O.Dados.Tipo) = 'INTEGER'
THEN editValor.OnKeyPress:=SoNumero
ELSE editValor.OnKeyPress:=nil;
lbConector.ItemIndex:=-1;
IF Debug THEN
{ShowMessage('Tipo: '  + O.Dados.Tipo+#13+
            'Campo: ' + O.Dados.Campo+#13+
            'SQL: '   + O.Dados.SQL+#13+
            'Alias: ' + O.Dados.Alias);  } 
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.lbConectorClick(Sender: TObject);
begin
OC:=TRecConectorObj(lbConector.Items.Objects[lbConector.ItemIndex]);
//ShowMessage('Conector: '  + OC.Dados.Conector);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.actDeleteExecute(Sender: TObject);
begin
IF DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrNo THEN Exit;
FormAguarde.lblPosi.Caption:='A T U A L I Z A N D O';
FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText := 'DELETE FROM BIOIMAGEDEVICECONFIG WHERE BIDC_ID = '+
                           cdsBioFacial.FieldByName('BIDC_ID').AsString;
   cdsGeral.Execute;
   cdsBioFacial.Close;
   cdsBioFacial.Open;
   END;
FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.actRefreshExecute(Sender: TObject);
begin
FormAguarde.lblPosi.Caption:='A T U A L I Z A N D O';
FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
dmSys.cdsBioFacial.Close;
dmSys.cdsBioFacial.Open;
FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.pcBaseCadastroChanging(Sender: TObject; var AllowChange: Boolean);
begin AllowChange:=False; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.tsBaseCadastroConsultaShow(Sender: TObject);
begin
cbTodas.Checked:=false;
Application.ProcessMessages;
//--------------- Entrou na Manutenção
pcBaseCadastro.OnChanging:=pcBaseCadastroChanging;
tbtnCancel.Enabled:=true;
tbtnApply.Enabled:=true;
tbtnEdit.Enabled:=false;
tbtnInsert.Enabled:=false;
stApp:='select iss_id, app_id, app_desclong '#13+
       'from applications '#13+
       'where app_status=''A'' %where% '#13+
       'order by 1,2';
dmSys.cdsGeral.CommandText:=
    StringReplace(stApp, '%where%', '', [rfReplaceAll, rfIgnoreCase]);
//ShowMessage(dmSys.cdsGeral.CommandText);
dmSys.cdsGeral.Open;

EditIss.Clear; EditApp.Clear; EditDesc.Clear;

IF (EditISS_ID.Text <> '')and(EditAPP_ID.Text<>'')
THEN dmSys.cdsGeral.Locate('iss_id;app_id',
        VarArrayOf([StrToInt(EditISS_ID.Text),
                    StrToInt(EditAPP_ID.Text)]), [] );
tbtnDelete.Enabled:=false;
tbtnRefresh.Enabled:=false;
tbtnFiltrar.Enabled:=false;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.EditChange(Sender: TObject);
Var S: String;
begin
S:='';
IF EditIss.Text <> '' THEN S:=S+ ' AND ISS_ID = '+EditIss.Text;
IF EditApp.Text <> '' THEN S:=S+ ' AND APP_ID >= '+EditApp.Text;
IF EditDesc.Text <> '' THEN S:=S+ ' AND APP_DESCLONG LIKE ''' +EditDesc.Text+'%''';
dmSys.cdsGeral.Close;
dmSys.cdsGeral.CommandText:=
    StringReplace(stApp, '%where%', S, [rfReplaceAll, rfIgnoreCase]);
//ShowMessage(dmSys.cdsGeral.CommandText);
dmSys.cdsGeral.Open;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.tsBaseCadastroFiltroShow(Sender: TObject);
begin
dmSys.cdsGeral.Close;
pcBaseCadastro.OnChanging:=pcBaseCadastroChanging;
tbtnCancel.Enabled:=false;
tbtnApply.Enabled:=false;
tbtnEdit.Enabled:=true;
tbtnInsert.Enabled:=true;

tbtnDelete.Enabled:=true;
tbtnRefresh.Enabled:=true;
tbtnFiltrar.Enabled:=true;

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.actEditExecute(Sender: TObject);  // Edição
begin
EditISS_ID.Text:=grdResultado.Fields[2].DisplayText;
EditAPP_ID.Text:=grdResultado.Fields[3].DisplayText;
EditAplicativo.Text:=grdResultado.Fields[4].DisplayText;
EditBIAC_ID.Text:=grdResultado.Fields[5].DisplayText;
rbIncInativo.Checked:=true;
rbIncAtivo.Checked:=grdResultado.Fields[6].DisplayText = 'Ativo';

pnIncluindo.Visible:=false; pnEditando.Visible:=true;
cbTodas.Visible:=false;

cbEmpresas.ItemIndex:=
   cbEmpresas.Items.IndexOf(grdResultado.Fields[1].DisplayText);

pcBaseCadastro.OnChanging:=nil; pcBaseCadastro.ActivePageIndex:=1;
Application.ProcessMessages;

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.actInsertExecute(Sender: TObject);  // Inserção
begin
EditISS_ID.Clear; EditAPP_ID.Clear; EditAplicativo.Clear; EditBIAC_ID.Clear; EditID.Clear;
pcBaseCadastro.OnChanging:=nil; pcBaseCadastro.ActivePageIndex:=1;
pnIncluindo.Visible:=true; pnEditando.Visible:=false;
cbTodas.Visible:=true;
cbEmpresas.ItemIndex:=-1;
rbIncAtivo.Checked:=true;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.DBGrid1CellClick(Column: TColumn);
begin
EditISS_ID.Text:=DBGrid1.Fields[0].DisplayText;
EditAPP_ID.Text:=DBGrid1.Fields[1].DisplayText;
EditAplicativo.Text:=DBGrid1.Fields[2].DisplayText;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.SoNumero(Sender: TObject; var Key: Char);
begin FM_SoNumero(Sender,Key); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.actApplyUpdatesExecute(Sender: TObject);
Var S,ct: String; i: Integer;
begin
IF (cbEmpresas.ItemIndex = -1)and(not cbTodas.Checked)
THEN BEGIN Dialogo('ERRO: Falta preencher Empresa',mtError,[mbOK],0); Exit; END;
IF EditAplicativo.Text = ''
THEN BEGIN Dialogo('ERRO: Falta selecionar Aplicação',mtError,[mbOK],0); Exit; END;
IF EditBIAC_ID.Text = ''
THEN BEGIN Dialogo('ERRO: Falta preencher BIAC_ID',mtError,[mbOK],0); Exit; END;

pcBaseCadastro.OnChanging:=nil; pcBaseCadastro.ActivePageIndex:=0;

IF rbIncAtivo.Checked THEN S:='A' ELSE S:='I';
IF pnEditando.Visible THEN BEGIN
WITH dmSys.cdsGeral
DO BEGIN // Editando
// lblID.Visible:=true; editID.Visible:=true;
   Close;
   CommandText:='UPDATE BIOIMAGEDEVICECONFIG SET '#13+

   'BIDL_ID = '+EditID.Text+', '#13+
   'ISS_ID = '+EditISS_ID.Text+', '#13+
   'APP_ID = '+EditAPP_ID.Text+', '#13+
   'BIAC_ID = '+EditBIAC_ID.Text+', '#13+
   'BIDC_STATUS = '''+S+''' '#13+

   'WHERE BIDC_ID = '+grdResultado.Fields[0].DisplayText;

   //ShowMessage(CommandText);
   Execute;
   END;
END ELSE BEGIN

WITH dmSys.cdsGeral
DO BEGIN // Inserindo
// lblID.Visible:=false; editID.Visible:=false;
   ct:='INSERT INTO BIOIMAGEDEVICECONFIG VALUES ('#13+
   '(select max(BIDC_ID)+1 from BIOIMAGEDEVICECONFIG),'#13+
   '%BIDL_ID% , '#13+           // 'BIDL_ID = '+
   EditISS_ID.Text+', '#13+     // 'ISS_ID = '+
   EditAPP_ID.Text+', '#13+     // 'APP_ID = '+
   EditBIAC_ID.Text+', '#13+    // 'BIAC_ID = '+
   ''''+S+''', '#13+             // Status
   'SYSDATE, '#13+
   ''''+UpperCase(DMConexao.SystemUser_Str)+''''#13+
   ')';
   IF not cbTodas.Checked
   THEN BEGIN
        Close;
        CommandText:=StringReplace
              (ct, '%BIDL_ID%', EditID.Text, [rfReplaceAll, rfIgnoreCase]);
        Execute;
        END
   ELSE IF Dialogo('Gravar um registro para cada Empresa ?',mtConfirmation,[mbYes,mbNo],0) = mrYes
        THEN FOR i:=0 to cbEmpresas.Items.Count-1
             DO BEGIN
                Close;
                CommandText:=StringReplace
                    (ct, '%BIDL_ID%',
                    IntToStr(Integer(cbEmpresas.Items.Objects[i])),
                    [rfReplaceAll, rfIgnoreCase]);
                Execute;
                END;
   END;
END;
actRefreshExecute(Sender);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.tbtnApplyClick(Sender: TObject);
begin actApplyUpdatesExecute(Sender); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.grdResultadoDblClick(Sender: TObject);
begin
//
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsBioFacial]);
    FrmBioFacial := Nil;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.actCancelExecute(Sender: TObject);
begin
pcBaseCadastro.OnChanging:=nil;
pcBaseCadastro.ActivePageIndex:=0;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.tbtnCancelClick(Sender: TObject);
begin actCancelExecute(Sender); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.FormKeyPress(Sender: TObject; var Key: Char);
begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
procedure TFrmBioFacial.btnLimpaStatusClick(Sender: TObject);
begin lkFilterStatus.ItemIndex:=-1; end;
procedure TFrmBioFacial.btnLimpaEmpresaClick(Sender: TObject);
begin cbEmp.ItemIndex:=-1; end;
procedure TFrmBioFacial.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TFrmBioFacial.Sai(Sender: TObject); begin FM_Sai(Sender); end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmBioFacial.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
