procedure TFrmAutoTarifas.GravaBanco_02;
begin

TRY

IF Debug THEN
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='delete from linezoneprices '+
       Format('where LD_ID = %s and LZP_DATE = to_date(''%s'', ''dd/mm/yyyy'') and LZP_SECTION = %s',
                  [COD_DETALHADA, DATA_DO_REAJUSTE, SECAO_DE_ORIGEM_NOVA]);
   cdsGeral.Execute;
   END;

WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='insert into linezoneprices ('+
              'LD_ID, LZP_DATE, LZP_SECTION, LZP_SEQNBR, '+
              LZP_SCT_CAMPOS+
              'LZP_STATUS, LZP_REGDATE, LZP_REGUSER) '+

      Format('values (%s, to_date(''%s'', ''dd/mm/yyyy''), %s, ',[COD_DETALHADA,DATA_DO_REAJUSTE,SECAO_DE_ORIGEM_NOVA])+
             '(select max(LZP_SEQNBR)+1 from linezoneprices where LD_ID = '+COD_DETALHADA+'), '+
              LZP_SCT_VALORES+' ,''A'', SYSDATE, ''PRODATA'')';
   //ShowMessage(cdsGeral.CommandText);
   cdsGeral.Execute;
   END;

IF SECAO_DE_ORIGEM_NOVA = '1' THEN
IF Debug THEN
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='delete from lineprices '+
       Format('where LD_ID = %s AND LP_DATE = to_date(''%s'', ''dd/mm/yyyy'')',[COD_DETALHADA,DATA_DO_REAJUSTE]);
//   ShowMessage(cdsGeral.CommandText);
   cdsGeral.Execute;
   END;

IF SECAO_DE_ORIGEM_NOVA = '1' THEN
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='insert into lineprices ('+
      'LD_ID, LP_DATE, LP_SEQNBR, LP_STATUS, LP_REGDATE, LP_REGUSER, '+LP_SCT_CAMPOS+') '+
      Format('values (%s, to_date(''%s'', ''dd/mm/yyyy''), 1, ''A'', SYSDATE, ''PRODATA'', %s)',
          [COD_DETALHADA,DATA_DO_REAJUSTE,LP_SCT_VALORES]);
// ShowMessage(cdsGeral.CommandText);
   cdsGeral.Execute;
   END;

Log('Inserido');

EXCEPT
on E: Exception
do begin Log('ERRO: ' + E.Message); Inc(contErro); end;
end;

end;
