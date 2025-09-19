procedure TFrmAutoTarifas.GravaBanco_04;
begin
{
{
insert into linedetailsxzones
(LD_ID, ZN_ID, LDZN_DATE, LDZN_SEQNBR,
LDZN_PRICE, LDZN_DEPARTUREVALUE, LDZN_TOLLVALUE, LDZN_INSURANCEVALUE, LDZN_DISCOUNTVALUE, LDZN_OTHERVALUE,
LDZN_STATUS, LDZN_REGDATE, LDZN_REGUSER, PODER_COMPRA, COD_TRECHO)

values
(183 (COD_DETALHADA), 613 (COD_TRECHO), to_date('29-03-2025', 'dd-mm-yyyy') (DATA_DO_REAJUSTE), 1,

 5.10 (NOVA_TARIFA),       0.00 (PRECO_PARTIDA_NOVA),  0.55 (PRECO_PEDAGIO_NOVO),
 0.00 (PRECO_SEGURO_NOVO), 0.00 (PRECO_DESCONTO_NOVO), 0.00 (PRECO_OUTROS_NOVO),

 'A', SYSDATE, 'PRODATA', null (PODER_DE_COMPRA), 613 (COD_TRECHO) );

insert into linedetailsxzones
(LD_ID, ZN_ID, LDZN_DATE, LDZN_SEQNBR,
LDZN_PRICE, LDZN_DEPARTUREVALUE, LDZN_TOLLVALUE, LDZN_INSURANCEVALUE, LDZN_DISCOUNTVALUE, LDZN_OTHERVALUE,
LDZN_STATUS, LDZN_REGDATE, LDZN_REGUSER, PODER_COMPRA, COD_TRECHO)
}
TRY
IF Debug THEN
WITH dmSys
DO BEGIN
   cdsGeral.Close;
   cdsGeral.CommandText:='delete from linedetailsxzones '+
       Format('where LD_ID = %s AND LDZN_DATE = to_date(''%s'', ''dd/mm/yyyy'') AND COD_TRECHO = %s',
                      [COD_DETALHADA,DATA_DO_REAJUSTE,COD_TRECHO]);
   //ShowMessage(cdsGeral.CommandText);
   cdsGeral.Execute;
   END;
WITH dmSys
DO BEGIN
   cdsGeral.Close;

   cdsGeral.CommandText:='insert into linedetailsxzones '+
     '(LD_ID, ZN_ID, LDZN_DATE, LDZN_SEQNBR, '+
     'LDZN_PRICE, LDZN_DEPARTUREVALUE, LDZN_TOLLVALUE, LDZN_INSURANCEVALUE, LDZN_DISCOUNTVALUE, LDZN_OTHERVALUE, '+
     'LDZN_STATUS, LDZN_REGDATE, LDZN_REGUSER, COD_TRECHO) '+
      Format('values (%s, %s, to_date(''%s'', ''dd/mm/yyyy''), 1, '+
             '%s, %s, %s, %s, %s, %s, '+
             '''A'', SYSDATE, ''PRODATA'', %s)',
          [COD_DETALHADA, COD_TRECHO, DATA_DO_REAJUSTE,
           NOVA_TARIFA, PRECO_PARTIDA_NOVA, PRECO_PEDAGIO_NOVO,
           PRECO_SEGURO_NOVO, PRECO_DESCONTO_NOVO, PRECO_OUTROS_NOVO, COD_TRECHO]);

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
