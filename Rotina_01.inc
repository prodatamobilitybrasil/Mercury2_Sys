procedure Rotina_01;
Var L: Integer;
begin
  IF numCol('COD_DETALHADA') = 0
  THEN BEGIN Log('ERRO: Falta coluna COD_DETALHADA'); Workbook.Close(False); ExcelApp.Quit; Exit; END;

  IF numCol('NOVA TARIFA') = 0
  THEN BEGIN Log('ERRO: Falta coluna NOVA TARIFA'); Workbook.Close(False); ExcelApp.Quit; Exit; END;

  IF numCol('DATA DO REAJUSTE') = 0
  THEN BEGIN Log('ERRO: Falta coluna DATA DO REAJUSTE'); Workbook.Close(False); ExcelApp.Quit; Exit; END;

  IF numCol('PODER DE COMPRA') = 0
  THEN BEGIN Log('ERRO: Falta coluna PODER DE COMPRA'); Workbook.Close(False); ExcelApp.Quit; Exit; END;

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
     NOVA_TARIFA      :=VarToStr(Worksheet.Cells[L,numCol('NOVA TARIFA')].Value);
     NOVA_TARIFA      :=StringReplace(NOVA_TARIFA,',','.',[rfReplaceAll, rfIgnoreCase]);
     DATA_REAJUSTE    :=VarToStr(Worksheet.Cells[L,numCol('DATA DO REAJUSTE')].Value);
     PODER_DE_COMPRA  :=VarToStr(Worksheet.Cells[L,numCol('PODER DE COMPRA')].Value);

     IF NOVA_TARIFA+DATA_REAJUSTE+PODER_DE_COMPRA = '' THEN Continue; // Linha em branco

     IF COD_DETALHADA = ''
     THEN BEGIN Log('ERRO: Falta preencher COD_DETALHADA '+linha); erro:=true; END ELSE
     IF not SoNumero(COD_DETALHADA)
     THEN BEGIN Log('ERRO: COD_DETALHADA "'+COD_DETALHADA+'" Inválida'+linha); erro:=true; END;

     IF NOVA_TARIFA = ''
     THEN BEGIN Log('ERRO: Falta preencher NOVA_TARIFA '+linha); erro:=true; END ELSE
     IF not SoDinheiro(NOVA_TARIFA)
     THEN BEGIN Log('ERRO: NOVA TARIFA "'+NOVA_TARIFA+'" Inválida'+linha); erro:=true; END;

     IF DATA_REAJUSTE = ''
     THEN BEGIN Log('ERRO: Falta preencher DATA_REAJUSTE '+linha); erro:=true; END ELSE
     IF not SoData(DATA_REAJUSTE)
     THEN BEGIN Log('ERRO: DATA DO REAJUSTE "'+DATA_REAJUSTE+'" Inválida'+linha); erro:=true; END;
     TRY StrToDateTime(DATA_REAJUSTE);
     EXCEPT on E: Exception
               do begin
                  Log('ERRO: DATA DO REAJUSTE "'+DATA_REAJUSTE+'" Inválida'+linha); erro:=true;
                  end;
     END;

     IF PODER_DE_COMPRA = ''
     THEN BEGIN Log('ERRO: Falta preencher PODER DE COMPRA '+linha); erro:=true; END ELSE
     IF (PODER_DE_COMPRA <> '0')and(PODER_DE_COMPRA <> '1')
     THEN BEGIN Log('ERRO: PODER DE COMPRA "'+PODER_DE_COMPRA+'" Inválido'+linha); erro:=true; END;

     IF erro THEN Continue;

     Log(Format('Inserindo | %s | %s | %s | %s |',[COD_DETALHADA,NOVA_TARIFA,DATA_REAJUSTE,PODER_DE_COMPRA]));

     IF PODER_DE_COMPRA = '0' THEN Inativa('lineprices','lp_status');

     GravaBanco_01;  //--------------------------------------------

     Inc(cont);
     FormAguarde.Gauge.Progress:=cont;
     FormAguarde.lblMeio.Caption:=IntToStr(FormAguarde.Gauge.Progress);
     Application.ProcessMessages;
//   Sleep(500);
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
end; //Rotina_01
