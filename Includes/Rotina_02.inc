procedure Rotina_02;
Var i,L: Integer;
    S,QUANTIDADE_DE_SECAO: String;
begin

Log('Rotina_02 Selecionada TIPO_DE_LINHA = '+TIPO_DE_LINHA);

TRY
S:='COD_DETALHADA';        IF numCol(S) = 0 THEN BEGIN FaltaCol('ERRO: Falta coluna '+S); Exit; END;
S:='DATA_DO_REAJUSTE';     IF numCol(S) = 0 THEN BEGIN FaltaCol('ERRO: Falta coluna '+S); Exit; END;
S:='SECAO_DE_ORIGEM_NOVA'; IF numCol(S) = 0 THEN BEGIN FaltaCol('ERRO: Falta coluna '+S); Exit; END;
S:='PODER_DE_COMPRA';      IF numCol(S) = 0 THEN BEGIN FaltaCol('ERRO: Falta coluna '+S); Exit; END;
S:='QUANTIDADE_DE_SECAO';  IF numCol(S) = 0 THEN BEGIN FaltaCol('ERRO: Falta coluna '+S); Exit; END;

EXCEPT
  on E: Exception
  DO BEGIN
     Inc(contArqErro);
     FaltaCol('ERRO: ' + E.Message);
     Exit;
     END
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

cont:=0; contErro:=0;

FOR L:=2 to Worksheet.UsedRange.Rows.Count
DO BEGIN

   linha:=' (linha '+IntToStr(L-1)+')';
   erro:=false;

   COD_DETALHADA    :=VarToStr(Worksheet.Cells[L,numCol('COD_DETALHADA')].Value);
   IF COD_DETALHADA = ''
   THEN BEGIN Log('ERRO: Falta valor COD_DETALHADA '+linha); erro:=true; END ELSE
   IF not SoNumero(COD_DETALHADA)
   THEN BEGIN Log('ERRO: COD_DETALHADA "'+COD_DETALHADA+'" Inválida'+linha); erro:=true; END;

   DATA_DO_REAJUSTE    :=VarToStr(Worksheet.Cells[L,numCol('DATA_DO_REAJUSTE')].Value);

   IF isNull(DATA_DO_REAJUSTE) THEN Continue; //Assume linha em branco

   IF not SoData(DATA_DO_REAJUSTE)
   THEN BEGIN Log('ERRO: DATA_DO_REAJUSTE "'+DATA_DO_REAJUSTE+'" Inválida'+linha); erro:=true; END;
   TRY StrToDateTime(DATA_DO_REAJUSTE);
   EXCEPT on E: Exception
             do begin
                Log('ERRO: DATA_DO_REAJUSTE "'+DATA_DO_REAJUSTE+'" Inválida'+linha); erro:=true;
                end;
   END;

   PODER_DE_COMPRA  :=VarToStr(Worksheet.Cells[L,numCol('PODER_DE_COMPRA')].Value);
   IF PODER_DE_COMPRA = ''
   THEN BEGIN Log('ERRO: Falta valor PODER_DE_COMPRA '+linha); erro:=true; END ELSE
   IF not(PODER_DE_COMPRA[1] in ['0','1'])
   THEN BEGIN Log('ERRO: PODER_DE_COMPRA "'+PODER_DE_COMPRA+'" Inválida'+linha); erro:=true; END;

   SECAO_DE_ORIGEM_NOVA:=VarToStr(Worksheet.Cells[L,numCol('SECAO_DE_ORIGEM_NOVA')].Value);
   IF PODER_DE_COMPRA = ''
   THEN BEGIN Log('ERRO: Falta valor SECAO_DE_ORIGEM_NOVA '+linha); erro:=true; END ELSE
   IF not SoNumero(SECAO_DE_ORIGEM_NOVA)
   THEN BEGIN Log('ERRO: SECAO_DE_ORIGEM_NOVA "'+PODER_DE_COMPRA+'" Inválida'+linha); erro:=true; END;

   QUANTIDADE_DE_SECAO:=VarToStr(Worksheet.Cells[L,numCol('QUANTIDADE_DE_SECAO')].Value);
   LZP_SCT_CAMPOS:=''; LP_SCT_CAMPOS:='';
   FOR i:=1 to StrToInt(QUANTIDADE_DE_SECAO)
   DO BEGIN
      // LZP_SCT2_IDA, LZP_SCT2_VOLTA,
      LZP_SCT_CAMPOS:=LZP_SCT_CAMPOS+', LZP_SCT'+IntToStr(i)+'_IDA, LZP_SCT'+IntToStr(i)+'_VOLTA';
      LP_SCT_CAMPOS:=LP_SCT_CAMPOS+', LP_SCT'+IntToStr(i)+'_IDA, LP_SCT'+IntToStr(i)+'_VOLTA';
      S:='TARIFA_NOVA_SECAO_'+IntToStr(i);
      IF numCol(S) = 0 THEN BEGIN Log('ERRO: Falta coluna '+S); erro:=true; Break; END;
      END;
   IF erro THEN Continue;
   Delete(LZP_SCT_CAMPOS,1,2); LZP_SCT_CAMPOS:=LZP_SCT_CAMPOS+', ';
   Delete(LP_SCT_CAMPOS,1,2);

   LZP_SCT_VALORES:=''; LP_SCT_VALORES:='';
   FOR i:=1 to StrToInt(QUANTIDADE_DE_SECAO)
   DO BEGIN
      S:='TARIFA_NOVA_SECAO_'+IntToStr(i);
      NOVA_TARIFA:=VarToStr(Worksheet.Cells[L,numCol(S)].Value);
      NOVA_TARIFA:=StringReplace(NOVA_TARIFA,',','.',[rfReplaceAll, rfIgnoreCase]);
      IF NOVA_TARIFA = ''
      THEN BEGIN Log('ERRO: Falta valor '+S+linha); erro:=true; END ELSE
      IF not SoDinheiro(NOVA_TARIFA)
      THEN BEGIN Log('ERRO: '+S+' "'+NOVA_TARIFA+'" InvÃ¡lida'+linha); erro:=true; END;
      LZP_SCT_VALORES:=LZP_SCT_VALORES+' ,'+NOVA_TARIFA+' ,'+NOVA_TARIFA;
      LP_SCT_VALORES:=LP_SCT_VALORES+' ,'+NOVA_TARIFA+' ,'+NOVA_TARIFA;
      END;
   Delete(LZP_SCT_VALORES,1,2);
   Delete(LP_SCT_VALORES,1,2);

   IF erro THEN Continue;

   Log(Format('Inserindo | %s | %s | %s | %s | %s |',
       [COD_DETALHADA,DATA_DO_REAJUSTE,QUANTIDADE_DE_SECAO,
           LZP_SCT_VALORES,PODER_DE_COMPRA]));

   IF PODER_DE_COMPRA = '0' THEN Inativa_Linezoneprices;

   GravaBanco_02;  //--------------------------------------------

   Inc(cont);
   FormAguarde.Gauge.Progress:=cont;
   FormAguarde.lblMeio.Caption:=IntToStr(FormAguarde.Gauge.Progress);
   Application.ProcessMessages;
   END;

Workbook.Close(False); ExcelApp.Quit;

FormAguarde.Hide; Application.ProcessMessages;
FormAguarde.Gauge.Hide; FormAguarde.lblObs.Hide;
Log('>>>>> RESUMO:');
Log('>>>>> Foram inseridos '+IntToStr(cont)+' novos preÃ§os');
Log('>>>>> Erros Encontrados: '+IntToStr(contErro));
Log('Fim da Carga da Planilha');
Log('----------------------------------------------------------------');
IF contErro > 0 THEN Inc(contArqErro);
IF contErro = 0 THEN Result:=true;

end; //Rotina_02
