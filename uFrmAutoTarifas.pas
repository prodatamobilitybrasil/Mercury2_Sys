unit uFrmAutoTarifas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, ToolEdit,
  iniFiles, ShellAPI;

type
  TFrmAutoTarifas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    OpenDialog: TOpenDialog;
    btnOpenPlanilha: TSpeedButton;
    EditNomePlanilha: TEdit;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Rotinas1: TMenuItem;
    menuProcessa: TMenuItem;
    PageControl: TPageControl;
    tabRelatorio: TTabSheet;
    pnRelatorio: TPanel;
    Panel5: TPanel;
    memoLog: TRichEdit;
    tabParametros: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel4: TPanel;
    editDirAprocessar: TDirectoryEdit;
    editDirProcessado: TDirectoryEdit;
    editDirErro: TDirectoryEdit;
    menuProcessaDiretorio: TMenuItem;
    btnProcessaDiretorio: TSpeedButton;
    btnExcell: TButton;
    Label5: TLabel;
    editDirRelatorio: TDirectoryEdit;
    procedure btnSelectClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btnOpenPlanilhaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure menuProcessaPlanilhaClick(Sender: TObject);
    procedure menuProcessaDiretorioClick(Sender: TObject);
    procedure btnExcellClick(Sender: TObject);
  private
    TIPO_DE_LINHA,COD_DETALHADA,DATA_DO_REAJUSTE,NOVA_TARIFA,PODER_DE_COMPRA :String;
    SECAO_DE_ORIGEM_NOVA,LZP_SCT_CAMPOS, LZP_SCT_VALORES,
    LP_SCT_CAMPOS, LP_SCT_VALORES,     // Variáveis da Rotina_02
    LP_BU_USEALTERNATEPRICE            // Variáveis da Rotina_03
    ,COD_TRECHO                        // Variáveis da Rotina_04
    ,PRECO_PARTIDA_NOVA, PRECO_PEDAGIO_NOVO, PRECO_SEGURO_NOVO
    ,PRECO_DESCONTO_NOVO, PRECO_OUTROS_NOVO
                     : String;
    contArqErro,contErro: Integer;
    Debug: Boolean;

    procedure Log(Const Msg: String);

    procedure GravaBanco_01;
    procedure GravaBanco_02;
    procedure GravaBanco_03;
    procedure GravaBanco_04;

    function Processa(Const arqNome: String): boolean;

    procedure Inativa_Lineprices;
    procedure Inativa_Linezoneprices;
    procedure Inativa_linedetailsxzones;  //Rotina_04

  public
    iniFile: TIniFile;
  end;

type
  TCharSet = set of Char;

var
  FrmAutoTarifas: TFrmAutoTarifas;

implementation

Uses uDmSys, ComObj, Aguarde;

{$R *.dfm}
{
insert into lineprices (
LD_ID, LP_DATE, LP_SEQNBR, LP_SCT1_IDA, LP_SCT1_VOLTA, LP_STATUS, LP_REGDATE, LP_REGUSER
)
values (
1209, to_date('01-08-2025', 'dd-mm-yyyy'), 1, 5.10, 5.10, 'A', SYSDATE, 'PRODATA'
)
}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function isNull(Const quem: String):Boolean;
Var S: String;
begin
S:=Trim(UpperCase(quem));
Result:=(S = 'NULL')or(S = '(NULL)')or(S = '');
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.Log(Const Msg: String);
Var S: String;
begin
S:=FormatDateTime('dd/mm/yy hh:mm:ss',Now)+': '+Msg;

IF Pos('ERRO:',UpperCase(S)) > 0
THEN WITH memoLog
     DO BEGIN
        SelStart:=Length(Text);
        SelLength:=Length(S);
        SelAttributes.Color:=clRed;
        END;
IF Pos('Planilha:',S) > 0
THEN WITH memoLog
     DO BEGIN
        SelStart:=Length(Text);
        SelLength:=Length(S);
        SelAttributes.Color:=clBlue;
        END;

memoLog.Lines.Add(S);
WITH memoLog DO BEGIN SelLength:=0; SelAttributes.Color:=clBlack; END;

//IF Pos('ERRO',Msg) > 0 THEN ShowMessage(hora+Msg);
IF Pos('ERRO:',UpperCase(Msg)) > 0 THEN Inc(contErro);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.btnSelectClick(Sender: TObject);
begin
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='select lp_date from lineprices where lp_date = to_date(''01-08-2025'', ''dd-mm-yyyy'')';
// ShowMessage(cdsGeral.CommandText);
   cdsGeral.Open;
   IF cdsGeral.RecordCount > 0
   THEN ShowMessage('Registro existe')
   ELSE ShowMessage('Registro NÃO existe');
   END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
{$I Includes\GravaBanco_01.inc}
{$I Includes\GravaBanco_02.inc}
{$I Includes\GravaBanco_03.inc}
{$I Includes\GravaBanco_04.inc}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.Inativa_Lineprices;
begin
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:=     //Inativa('lineprices','lp_status');
     Format('update lineprices set lp_status = ''I'' where ld_id = %s AND '+
            'LP_DATE <> to_date(''%s'', ''dd-mm-yyyy'')',
                      [COD_DETALHADA,DATA_DO_REAJUSTE]);
   cdsGeral.Execute;
   END;
Log(Format('Inativado COD_DETALHADA = %s, PODER_DE_COMPRA = %s',
           [COD_DETALHADA,PODER_DE_COMPRA]));
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.Inativa_Linezoneprices;
begin
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:=
           Format('update linezoneprices set LZP_STATUS = ''I'' where LD_ID = %s and '+
                  'LZP_DATE <> to_date(''%s'', ''dd-mm-yyyy'')',
                  [COD_DETALHADA,DATA_DO_REAJUSTE]);
   cdsGeral.Execute;
   END;
Log(Format('Inativado COD_DETALHADA = %s, PODER_DE_COMPRA = %s',
           [COD_DETALHADA,PODER_DE_COMPRA]));
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.Inativa_linedetailsxzones;  //Rotina_04
begin
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:=
           Format('update linedetailsxzones set LDZN_STATUS = ''I'' where LD_ID = %s and '+
                  'LDZN_DATE <> to_date(''%s'', ''dd-mm-yyyy'')',
                  [COD_DETALHADA,DATA_DO_REAJUSTE]);
   cdsGeral.Execute;
   END;
Log(Format('Inativado COD_DETALHADA = %s, PODER_DE_COMPRA = %s',
           [COD_DETALHADA,PODER_DE_COMPRA]));
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.btnDeleteClick(Sender: TObject);
begin
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='delete from lineprices '+
   Format('where LP_DATE = to_date(''%s'', ''dd-mm-yyyy'')',[DATA_DO_REAJUSTE]);

   ShowMessage(cdsGeral.CommandText);
   cdsGeral.Execute;
   ShowMessage('Delete');
   END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function TFrmAutoTarifas.Processa(Const arqNome: String): Boolean;
var
  ExcelApp, Workbook, Worksheet: OleVariant;
//ValorCelula: Variant;
  cont: Integer;
  erro: Boolean;
  linha: String;
{------------------------------------------------------------------------------}
function SoNumero(S: String): Boolean;
begin
Result:=false;
WHILE S[1] in ['0'..'9'] DO BEGIN Delete(S,1,1); IF Length(S) = 0 THEN Break; END;
IF Length(S) = 0 THEN Result:=true;
end;
{------------------------------------------------------------------------------}
function SoDinheiro(S: String): Boolean;
begin
Result:=false;
WHILE S[1] in ['0'..'9',',','.']
DO BEGIN Delete(S,1,1); IF Length(S) = 0 THEN Break; END;
IF Length(S) = 0 THEN Result:=true;
end;
{------------------------------------------------------------------------------}
function SoData(S: String): Boolean;
begin
Result:=false;
WHILE S[1] in ['0'..'9','/'] DO BEGIN Delete(S,1,1); IF Length(S) = 0 THEN Break; END;
IF Length(S) = 0 THEN Result:=true;
end;
{------------------------------------------------------------------------------}
function numCol(Const Quem: String): Integer;
Var c: Integer; S: String;
begin
Result:=0;
FOR c:=1 to Worksheet.UsedRange.Columns.Count
DO BEGIN
   S:=VarToStr(Worksheet.Cells[1,c].Value);
   IF Trim(S) = Trim(Quem) THEN BEGIN Result:=c; Break; END;
   END;
end;
{------------------------------------------------------------------------------}
function Conta_Linha_Valida(tipo: Integer): Integer;
Var cont,L: Integer;
begin
cont:=0;
FOR L:=2 to Worksheet.UsedRange.Rows.Count
DO BEGIN // 11,12,13
{  IF VarToStr(Worksheet.Cells[L,11].Value)+
      VarToStr(Worksheet.Cells[L,12].Value)+
      VarToStr(Worksheet.Cells[L,13].Value) = '' THEN Continue;   }
   IF VarToStr(Worksheet.Cells[L,numCol('DATA_DO_REAJUSTE')].Value) = ''
   THEN Continue;
   Inc(cont);
   END;
Result:=cont;
end;
{------------------------------------------------------------------------------}
procedure FaltaCol(Const msg: String);
begin Log(msg); Workbook.Close(False); ExcelApp.Quit; end;
{------------------------------------------------------------------------------}
function Falta_Coluna(Const colunas: String): Boolean;
Var S: String; i: Integer; falta: Boolean;
begin
falta:=false; GetItem(',',colunas);
FOR i:=1 to NI
DO BEGIN
   S:=GS[i];
   IF numCol(S) = 0
   THEN BEGIN Log('ERRO: Falta coluna '+S); falta:=true; END;
   END;
Result:=falta;
end;
{------------------------------------------------------------------------------}
function PegaValor(L: Integer; Const campo: String; tipo: TCharSet; Dinheiro: Boolean): String;
Var S: String;
begin
Result:=VarToStr(Worksheet.Cells[L,numCol(campo)].Value);
S:=Result;
IF isNull(S)
THEN BEGIN
     Log('ERRO: Falta valor '+campo+' '+linha);
     erro:=true; Result:=''; Exit;
     END;
WHILE S[1] in tipo DO BEGIN Delete(S,1,1); IF Length(S) = 0 THEN Break; END;
IF Length(S) > 0
THEN BEGIN
     Log('ERRO: '+campo+' "'+Result+'" Inválido'+linha); erro:=true;
     Result:='';
     END;
IF Dinheiro
THEN Result:=StringReplace(Result,',','.',[rfReplaceAll, rfIgnoreCase]);
end;
{------------------------------------------------------------------------------}
{$I Includes\Rotina_01.inc}
{$I Includes\Rotina_02.inc}
{$I Includes\Rotina_04.inc}
{------------------------------------------------------------------------------}
begin
  Result:=false;
  WITH memoLog DO BEGIN SelLength:=0; SelAttributes.Color:=clBlack; END;

  // Cria instância do Excel
  ExcelApp := CreateOleObject('Excel.Application');
  ExcelApp.Visible := False; // ou True para ver

  // Abre o arquivo
  Workbook := ExcelApp.Workbooks.Open(arqNome);
  Log('Planilha: '+arqNome);

  // Seleciona a primeira planilha
  Worksheet := Workbook.Worksheets[1];

  // PROC_01 -> BU, NORMAL, BUCSIM
  // PROC_02 -> ZONAL, SECC_GPS
  IF numCol('TIPO_DE_LINHA') = 0
  THEN BEGIN Log('ERRO: Falta coluna TIPO_DE_LINHA'); Exit; END;
  TIPO_DE_LINHA:=VarToStr(Worksheet.Cells[2,numCol('TIPO_DE_LINHA')].Value);

  IF numCol('LP_BU_USEALTERNATEPRICE') > 0 THEN Rotina_01 ELSE // rotina_03 iguel a rotina_01
  IF (TIPO_DE_LINHA = 'BU')or
     (TIPO_DE_LINHA = 'NORMAL')or
     (TIPO_DE_LINHA = 'TSMUN')or
     (TIPO_DE_LINHA = 'BUCSIM')   THEN Rotina_01 ELSE
  IF (TIPO_DE_LINHA = 'ZONAL')or
     (TIPO_DE_LINHA = 'SECC_GPS') THEN Rotina_02 ELSE
  IF (TIPO_DE_LINHA = 'TRECHO')or
     (TIPO_DE_LINHA = 'TRECHO (DK-600)')or
     (TIPO_DE_LINHA = 'BU/TRECHO') THEN Rotina_04 ELSE Log('ERRO: TIPO_DE_LINHA Inválido');

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.btnOpenPlanilhaClick(Sender: TObject);
begin
IF OpenDialog.Execute THEN EditNomePlanilha.Text:=OpenDialog.FileName;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.FormShow(Sender: TObject);
begin
memoLog.Clear;
PageControl.TabIndex:=0;
Debug:=FileExists('c:\users\public\cta.dll');

//dirAprocessar,dirProcessado,dirErro : String;

iniFile:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));

editDirAprocessar.Text:=iniFile.ReadString('Diretorio','Aprocessar','');
editDirProcessado.Text:=iniFile.ReadString('Diretorio','Processado','');
editDirErro.Text:=iniFile.ReadString('Diretorio','Erro','');
editDirRelatorio.Text:=iniFile.ReadString('Diretorio','Relatório','');
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var i: Integer; arq: TStringList;
begin
arq:=TStringList.Create;
IF (editDirRelatorio.Text <> '')and(memolog.Lines.Count > 0)
THEN TRY
     FOR i:=0 to memoLog.Lines.Count-1 DO Arq.Add(memoLog.Lines[i]);
     arq.SaveToFile(editDirRelatorio.Text+'\Relatorio '+
                    FormatDateTime('dd-mm-yy_hh-mm',Now)+'.txt');
     except
     on E: Exception do
        ShowMessage('Erro: ' + E.Message);
     end;
arq.Free;

iniFile.WriteString('Diretorio','Aprocessar',editDirAprocessar.Text);
iniFile.WriteString('Diretorio','Processado',editDirProcessado.Text);
iniFile.WriteString('Diretorio','Erro',editDirErro.Text);
iniFile.WriteString('Diretorio','Relatório',editDirRelatorio.Text);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function MoverArquivo(origem,destino: String): Boolean;
Var dest: String;
begin

Result:=true; Sleep(1000);

IF FrmAutoTarifas.Debug THEN Exit;

dest:=destino+'\'+ExtractFileName(origem);

IF FileExists(dest)
THEN if not DeleteFile(dest)
     THEN ShowMessage('Falha ao deletar arquivo:'+
                      #13'Arquivo: ' +dest+
                      #13'Erro: '    +SysErrorMessage(GetLastError));

Result:=MoveFile(PChar(origem), PChar(dest));
IF not Result
THEN ShowMessage('Falha ao mover arquivo:'+
                 #13'De: '     +origem+
                 #13'Para: '   +dest+
                 #13'Erro: '   +SysErrorMessage(GetLastError));
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.menuProcessaPlanilhaClick(Sender: TObject);
begin
PageControl.TabIndex:=0;
IF EditNomePlanilha.Text = ''
THEN BEGIN
     ShowMessage('ERRO: Falta informar nome da Planílha'); Exit;
     END;
IF not FileExists(EditNomePlanilha.Text)
THEN BEGIN
     ShowMessage('ERRO: Planilha inexistente'); Exit;
     END;

IF Processa(EditNomePlanilha.Text)
THEN MoverArquivo(EditNomePlanilha.Text,editDirProcessado.Text)
ELSE MoverArquivo(EditNomePlanilha.Text,editDirErro.Text);
EditNomePlanilha.Text:='';
ShowMessage('Processamento Finalizado');

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.menuProcessaDiretorioClick(Sender: TObject);
Var
  SR: TSearchRec;
  contPlanilha,Resultado: Integer;
  dir: String;
begin
IF not DirectoryExists(editDirAprocessar.Text)
THEN BEGIN ShowMessage('ERRO: Diretório Aprocessar: '+editDirAprocessar.Text+' inexistente'); Exit; END;

IF not DirectoryExists(editDirProcessado.Text)
THEN BEGIN ShowMessage('ERRO: Diretório Processado: '+editDirProcessado.Text+' inexistente'); Exit; END;

IF not DirectoryExists(editDirErro.Text)
THEN BEGIN ShowMessage('ERRO: Diretório Erro: '      +editDirErro.Text+' inexistente'); Exit; END;

IF not DirectoryExists(editDirRelatorio.Text)
THEN BEGIN ShowMessage('ERRO: Diretório Relatorio: ' +editDirRelatorio.Text+' inexistente'); Exit; END;

PageControl.TabIndex:=0;   // .xlsx
dir:=editDirAprocessar.Text;
contArqErro:=0; contPlanilha:=0;
Resultado:=FindFirst(dir+'\*.xlsx', faAnyFile, SR);
try
  while Resultado = 0 do
  begin
    if (SR.Attr and faDirectory) = 0 then
    begin
      // Aqui você pega o nome do arquivo
      IF Pos('~',SR.Name) = 0
      THEN BEGIN
           Inc(contPlanilha);
           IF Processa(dir+'\'+SR.Name)
           THEN MoverArquivo(dir+'\'+SR.Name,editDirProcessado.Text)
           ELSE MoverArquivo(dir+'\'+SR.Name,editDirErro.Text);
           END;
    end;
    Resultado := FindNext(SR);
  end;
finally
  FindClose(SR);
end;
IF contPlanilha = 0
THEN ShowMessage('ERRO: Nenhuma planilha encontrada em:'#13+dir+'\*.xlsx')
ELSE ShowMessage('Processamento Finalizado:'#13+IntToStr(contPlanilha)+' planilhas processadas, '+
                 IntToStr(contArqErro)+' com ERRO');
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.btnExcellClick(Sender: TObject);
Var L: Integer; S: String;
begin
L:=memoLog.CaretPos.Y; // Y é zero-based, então soma 1 para resultado humano
// 10:09:30: Planilha: C:\Spark\Mercury2_Sys\Aprocessar\LINHA NORMAL_EXEMPLO.xlsx
// 12345678901234567890
S:=memoLog.Lines[L]; IF Pos('Planilha: ',S) = 0 THEN Exit;
WHILE Copy(S,1,2)<>': ' DO Delete(S,1,1); Delete(S,1,12);
ShowMessage(S);
ShellExecute(Handle, 'open', PChar(S), nil, nil, SW_SHOWNORMAL);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmAutoTarifas.Sair1Click(Sender: TObject);
begin Close; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.

