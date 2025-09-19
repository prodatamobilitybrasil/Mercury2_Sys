procedure TFrmAutoTarifas.GravaBanco_01;
begin
// arquivo C:\oraclexe\app\oracle\product\10.2.0\server\NETWORK\ADMIN\sqlnet.ora
// Colocar a linha para não deixar dar timeout muda para 10 minutos
// SQLNET.EXPIRE_TIME = 10

TRY

{
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:=Format('select * from linedetails where ld_id = %s',[COD_DETALHADA]);
   cdsGeral.Open;
   IF cdsGeral.RecordCount = 0
   THEN BEGIN
        Log('ERRO: COD_DETALHADA Inexistente');
        Exit;
        END;
   END;
}
IF Debug THEN
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='delete from lineprices '+
       Format('where LD_ID = %s AND LP_DATE = to_date(''%s'', ''dd/mm/yyyy'')',[COD_DETALHADA,DATA_DO_REAJUSTE]);
   cdsGeral.Execute;
   END;

WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='insert into lineprices ('+
      'LD_ID, LP_DATE, LP_SEQNBR, LP_SCT1_IDA, LP_SCT1_VOLTA, LP_STATUS, LP_REGDATE, LP_REGUSER) '+
      Format('values (%s, to_date(''%s'', ''dd/mm/yyyy''), 1, %s, %s, ''A'', SYSDATE, ''PRODATA'')',
          [COD_DETALHADA,DATA_DO_REAJUSTE,NOVA_TARIFA,NOVA_TARIFA]);
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
