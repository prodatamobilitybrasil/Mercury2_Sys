procedure TFrmAutoTarifas.GravaBanco_03;
Var SEQ: String;
begin
// arquivo C:\oraclexe\app\oracle\product\10.2.0\server\NETWORK\ADMIN\sqlnet.ora
// Colocar a linha para não deixar dar timeout muda para 10 minutos
// SQLNET.EXPIRE_TIME = 10

TRY
IF LP_BU_USEALTERNATEPRICE = '1' THEN SEQ:='1' ELSE
IF isNull(LP_BU_USEALTERNATEPRICE)  THEN SEQ:='2';


IF Debug THEN
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='delete from lineprices '+
       Format('where LP_DATE = to_date(''%s'', ''dd/mm/yyyy'') AND LD_ID = %s AND LP_SEQNBR = %s',[DATA_DO_REAJUSTE,COD_DETALHADA,SEQ]);
   //ShowMessage(cdsGeral.CommandText);
   cdsGeral.Execute;
   END;

WITH dmSys
DO BEGIN                      
   cdsGeral.Close;
   cdsGeral.CommandText:='insert into lineprices ('+
      'LD_ID, LP_DATE, LP_SEQNBR, LP_SCT1_IDA, LP_SCT1_VOLTA, LP_STATUS, LP_REGDATE, LP_REGUSER, LP_BU_USEALTERNATEPRICE) '+
      Format('values (%s, to_date(''%s'', ''dd/mm/yyyy''), %s, %s, %s, ''A'', SYSDATE, ''PRODATA'', %s)',
          [COD_DETALHADA,DATA_DO_REAJUSTE,SEQ,NOVA_TARIFA,NOVA_TARIFA,LP_BU_USEALTERNATEPRICE]);
   //ShowMessage(cdsGeral.CommandText);
   cdsGeral.Execute;
   Log('Inserido');
   END;

EXCEPT
on E: Exception
do begin
   Log('ERRO: ' + E.Message); Inc(contErro);
   end;
end;

end;
