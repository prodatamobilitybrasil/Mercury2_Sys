
IF gbFiltro.Controls[i] is TEdit
THEN BEGIN Inc(j); TEdit(gbFiltro.Controls[i]).Clear; END;
IF gbFiltro.Controls[i] is TComboBox
THEN BEGIN Inc(j); TComboBox(gbFiltro.Controls[i]).ItemIndex:=-1; END;
{
   IF gbFiltro.Controls[i] is TRxDBLookupCombo
   THEN BEGIN
        Inc(j);
        TRxDBLookupCombo(gbFiltro.Controls[i]).ClearValue;
        TRxDBLookupCombo(gbFiltro.Controls[i]).Repaint;
        END;
}
IF gbFiltro.Controls[i] is TPanel THEN Inc(j);
IF gbFiltro.Controls[i] is TLabel THEN Inc(j);
IF gbFiltro.Controls[i] is TSpeedButton THEN Inc(j);

