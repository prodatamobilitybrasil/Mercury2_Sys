unit uFrrmTarifas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls, Buttons;

type
  TFrmTarifas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pnEmpresas: TPanel;
    Splitter1: TSplitter;
    pnNomeEmp: TPanel;
    Panel5: TPanel;
    pnLinhas: TPanel;
    pnNomeLinha: TPanel;
    cbLinhas: TCheckListBox;
    Panel7: TPanel;
    Button3: TButton;
    Button4: TButton;
    cbEmp: TCheckListBox;
    Label1: TLabel;
    rbLinhasSelec: TRadioButton;
    rbLinhasNaoSelec: TRadioButton;
    rbLinhasTodas: TRadioButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbEmpClickCheck(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbEmpClick(Sender: TObject);
    procedure cbLinhasClick(Sender: TObject);
    procedure cbLinhasClickCheck(Sender: TObject);
    procedure cbSelecionadasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    linhas,Empresas: TStringList;
    function Pega(Quem: String): Integer;
    function ContaSelEmp: Integer;
    function ContaSelLinhas: Integer;
    procedure Mostra_Linhas;
  public
    { Public declarations }
  end;

var
  FrmTarifas: TFrmTarifas;

implementation

Uses uDmSys, Aguarde, uFrmMemo;

{$R *.dfm}
{
select * from linemt where lm_id=4123
/
-- tabela com código master e detalhado
select * from linedetails where lm_id=4123
/
-- tabela de preços
select * from lineprices where ld_id=148 and lp_status='A'
/
-- linhas por empresa
select * from transportprovidersxlinemt where tp_id=10
/
-- nome empresa
select * from transportproviders where tp_id=10


select transportproviders.tp_id, tp_desc, linedetails.ld_descshort, transportprovidersxlinemt.lm_id, linedetails.ld_id, lineprices.lp_sct1_ida, lineprices.lp_date from transportproviders
inner join transportprovidersxlinemt on transportproviders.tp_id = transportprovidersxlinemt.tp_id
inner join linedetails on transportprovidersxlinemt.lm_id = linedetails.lm_id  
inner join lineprices on lineprices.ld_id = linedetails.ld_id where lp_status='A' and transportproviders.tp_id=10 and ld_status='A'
order by 4, 7

ld_descshort
lm_id
lp_date
lp_sct1_ida

}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.FormCreate(Sender: TObject);
begin
Empresas:=TStringList.Create;
linhas:=TStringList.Create;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Empresas.Free;
linhas.Free;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function TFrmTarifas.ContaSelEmp: Integer;
Var i: Integer;
begin
Result:=0;
FOR i:=0 to cbEmp.Items.Count-1
DO IF cbEmp.Checked[i] THEN Inc(Result);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.FormShow(Sender: TObject);
Var cont: Integer;
begin
//select * from transportproviders
cont:=0; cbEmp.Clear;
WITH dmSys, cdsGeral
DO BEGIN
   Close;
   CommandText := 'SELECT TP_ID, TP_DESC FROM TRANSPORTPROVIDERS '+
                  'WHERE TP_STATUS = ''A'' ORDER BY TP_DESC';
   Open;
   WHILE not Eof
   DO BEGIN
      cbEmp.Items.Add(Fields[1].AsString); Inc(Cont);
      Empresas.Add(Fields[1].AsString+'|'+Fields[0].AsString);
      cdsGeral.Next;
      END;
   END;
pnNomeEmp.Caption:=IntToStr(cont)+' Empresa(s), '+IntToStr(ContaSelEmp)+' selecionadas';
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.cbEmpClickCheck(Sender: TObject);
begin cbEmp.Checked[cbEmp.ItemIndex]:=not cbEmp.Checked[cbEmp.ItemIndex]; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function TFrmTarifas.Pega(Quem: String): Integer;
Var I: Integer;
begin
Result:=-1;
FOR i:=0 to Empresas.Count-1
DO BEGIN
   GetItem('|',Empresas[i]);
   IF GS[1] = Quem THEN BEGIN Result:=i; Break; END;
   END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.cbEmpClick(Sender: TObject);
Var ind: Integer; S: String;
begin
Linhas.Clear;
WITH dmSys, cdsGeral
DO BEGIN
   Close;
   ind:=Pega(cbEmp.Items[cbEmp.ItemIndex]);
   Label1.Caption:=Empresas[ind];
   CommandText:='select * from transportprovidersxlinemt where tp_id = '+GS[2]+
                ' order by LM_ID';
   Open;
   WHILE not Eof
   DO BEGIN
      S:=FieldByName('LM_ID').AsString;
      IF Pos(Format(',%s,',[FieldByName('LM_ID').AsString]),GS[3]) > 0
      THEN S:='x'+S ELSE S:=' '+S;
      Linhas.Add(S);

      cdsGeral.Next;
      END;
   END;

pnNomeLinha.Caption:=IntToStr(Linhas.Count)+' Linha(s), '+
       IntToStr(ContaSelLinhas)+' selecionada(s)';
rbLinhasTodas.Checked:=true;

Mostra_Linhas;

end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.Mostra_Linhas;
Var i: Integer; S: String; ligado: Boolean;
begin
cbLinhas.Clear;
FOR i:=0 to Linhas.Count-1
DO BEGIN
   S:=Linhas[i]; Ligado:=S[1] = 'x'; Delete(S,1,1);
   cbLinhas.Items.Add(S);
   cbLinhas.Checked[cbLinhas.Items.Count-1]:=ligado;
   END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
function TFrmTarifas.ContaSelLinhas: Integer;
Var i: Integer;
begin
Result:=0;
FOR i:=0 to Linhas.Count-1
DO IF Linhas[i][1] = 'x' THEN Inc(Result);
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.cbLinhasClick(Sender: TObject);
Var i,cont,ind: Integer; S: String;
begin
IF cbLinhas.ItemIndex = -1 THEN Exit;

cbLinhas.Checked[cbLinhas.ItemIndex]:=not cbLinhas.Checked[cbLinhas.ItemIndex];

FOR i:=0 to Linhas.Count-1
DO BEGIN
   S:=Linhas[i]; Delete(S,1,1);
   IF cbLinhas.Items[cbLinhas.ItemIndex] = S
   THEN BEGIN
        IF cbLinhas.Checked[cbLinhas.ItemIndex]
        THEN S:='x'+S ELSE S:=' '+S;
        Linhas[i]:=S;
        END;
   END;

cont:=ContaSelLinhas;

S:='';
FOR i:=0 to Linhas.Count-1
DO IF Linhas[i][1] = 'x' THEN S:=S+cbLinhas.Items[i]+',';
IF S <> '' THEN S:=','+S;

ind:=Pega(cbEmp.Items[cbEmp.ItemIndex]);
Empresas[ind]:=GS[1]+'|'+GS[2]+'|'+S;
Label1.Caption:=Empresas[ind];

pnNomeLinha.Caption:=IntToStr(cbLinhas.Count)+' Linha(s), '+
       IntToStr(cont)+' selecionada(s)';
cbEmp.Checked[cbEmp.ItemIndex]:=cont > 0;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.cbLinhasClickCheck(Sender: TObject);
begin
IF cbLinhas.ItemIndex = -1 THEN Exit;
cbLinhas.Checked[cbLinhas.ItemIndex]:=not cbLinhas.Checked[cbLinhas.ItemIndex];
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.cbSelecionadasClick(Sender: TObject);
begin
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TFrmTarifas.Button1Click(Sender: TObject);
Var i: Integer;
begin
WITH frmMemo
DO BEGIN
   memo.Clear;
   FOR i:=0 to Empresas.Count-1
   DO IF Pos('|,',Empresas[i]) > 0
      THEN BEGIN
           GetItem('|',Empresas[i]);
           Delete(GS[3],Length(GS[3]),1);
           memo.Lines.Add(GS[1]+GS[3]);
           END;
   ShowModal;
   END;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
