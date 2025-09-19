procedure Rotina_04;
Var L: Integer;
begin

cont:=0; contErro:=0;
Log('Rotina_04 Selecionada TIPO_DE_LINHA = '+TIPO_DE_LINHA);

TRY
IF Falta_Coluna('COD_DETALHADA, COD_TRECHO, DATA_DO_REAJUSTE, '+
                'NOVA_TARIFA, PRECO_PARTIDA_NOVA, PRECO_PEDAGIO_NOVO, '+
                'PRECO_SEGURO_NOVO, PRECO_DESCONTO_NOVO, PRECO_OUTROS_NOVO, PODER_DE_COMPRA')
THEN BEGIN
     Log('Planilha não Processada');
     Log('----------------------------------------------------------------');
     Workbook.Close(False); ExcelApp.Quit;
     Inc(contArqErro); Exit;
     END;
EXCEPT
  on E: Exception
  DO BEGIN
     Inc(contArqErro);
     FaltaCol('ERRO: ' + E.Message);
     Exit;
     END;
END;

WITH FormAguarde
DO BEGIN
   Gauge.Visible:=true;
   Gauge.MinValue:=0;
   Gauge.MaxValue:=Conta_Linha_Valida(1);
   //Worksheet.UsedRange.Rows.Count;
   //UltimaColuna := Worksheet.UsedRange.Columns.Count;
   Gauge.Progress:=0; lblObs.Show;
   lblPosi.Caption:='Carregando PLANILHA';
   Show; Application.ProcessMessages;
   END;

FOR L:=2 to Worksheet.UsedRange.Rows.Count
DO BEGIN

   linha:=' (linha '+IntToStr(L-1)+')';
   erro:=false;

   DATA_DO_REAJUSTE:=VarToStr(Worksheet.Cells[L,numCol('DATA_DO_REAJUSTE')].Value);

   IF isNull(DATA_DO_REAJUSTE) THEN Continue; //Assume linha em branco

   DATA_DO_REAJUSTE:=PegaValor(L,'DATA_DO_REAJUSTE',['0'..'9','/'],false);  //soData
   TRY StrToDateTime(DATA_DO_REAJUSTE);
   EXCEPT on E: Exception
             do begin
                Log('ERRO: DATA_DO_REAJUSTE "'+DATA_DO_REAJUSTE+'" Inválida'+linha); erro:=true;
                end;
   END;
   {
   COD_DETALHADA, COD_TRECHO, DATA_DO_REAJUSTE, NOVA_TARIFA,
   PRECO_PARTIDA_NOVA, PRECO_PEDAGIO_NOVO, PRECO_SEGURO_NOVO, PRECO_DESCONTO_NOVO, PRECO_OUTROS_NOVO,
   PODER_DE_COMPRA
   }
   COD_DETALHADA    :=PegaValor(L,'COD_DETALHADA',   ['0'..'9'],false);  // soNumero
   COD_TRECHO       :=PegaValor(L,'COD_TRECHO',      ['0'..'9'],false);
   NOVA_TARIFA      :=PegaValor(L,'NOVA_TARIFA',     ['0'..'9',',','.'],true);  // soDinheiro

   PRECO_PARTIDA_NOVA   :=PegaValor(L,'PRECO_PARTIDA_NOVA',     ['0'..'9',',','.'],true);  // soDinheiro
   PRECO_PEDAGIO_NOVO   :=PegaValor(L,'PRECO_PEDAGIO_NOVO',     ['0'..'9',',','.'],true);  // soDinheiro
   PRECO_SEGURO_NOVO    :=PegaValor(L,'PRECO_SEGURO_NOVO',      ['0'..'9',',','.'],true);  // soDinheiro
   PRECO_DESCONTO_NOVO  :=PegaValor(L,'PRECO_DESCONTO_NOVO',    ['0'..'9',',','.'],true);  // soDinheiro
   PRECO_OUTROS_NOVO    :=PegaValor(L,'PRECO_OUTROS_NOVO',      ['0'..'9',',','.'],true);  // soDinheiro

   PODER_DE_COMPRA  :=PegaValor(L,'PODER_DE_COMPRA', ['0'..'1'],false);

   IF erro THEN Continue;

   Log(Format('Inserindo | %s | %s | %s | %s |',
       [COD_DETALHADA, COD_TRECHO, DATA_DO_REAJUSTE, PODER_DE_COMPRA]));

   IF PODER_DE_COMPRA = '0' THEN Inativa_linedetailsxzones;  //Rotina_04

   GravaBanco_04;

   Inc(cont);
   FormAguarde.Gauge.Progress:=cont;
   FormAguarde.lblMeio.Caption:=IntToStr(FormAguarde.Gauge.Progress);
   Application.ProcessMessages;
   END;

Workbook.Close(False); ExcelApp.Quit;

FormAguarde.Hide; Application.ProcessMessages;
FormAguarde.Gauge.Hide; FormAguarde.lblObs.Hide;
Log('>>>>> RESUMO:');
Log('>>>>> Foram inseridos '+IntToStr(cont)+' novos preços');
Log('>>>>> Erros Encontrados: '+IntToStr(contErro));
Log('Fim da Carga da Planilha');
Log('----------------------------------------------------------------');
IF contErro > 0 THEN Inc(contArqErro);
IF contErro = 0 THEN Result:=true;

end; //Rotina_04
