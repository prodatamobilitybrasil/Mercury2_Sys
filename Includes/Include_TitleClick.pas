Var i,cd: Integer; S: String; tab: TClientDataSet;
{------------------------------------------------------------------------------}
function acertaSQL(Const stWhere, stOrder: String): String;
Var S: String;
begin
IF (Pos('%where%',ct) = 0)or(Pos('%order%',ct) = 0)
THEN ShowMessage('ERRO de Sistema: Falta %where% ou %order%');
S:=StringReplace(ct, '%where%', stWhere, [rfReplaceAll, rfIgnoreCase]);
S:=StringReplace(S, '%order%', stOrder, [rfReplaceAll, rfIgnoreCase]);
Result:=S; strOrder:=stOrder;
end;
{------------------------------------------------------------------------------}
begin
IF Column.Title.Color = clBtnFace
THEN FOR i:=0 to grdResultado.Columns.Count-1
     DO grdResultado.Columns[i].Title.Color:=clBtnFace;

WITH Column.Title
DO IF Color = clBtnFace THEN Color:=clYellow
   ELSE IF Color = clYellow THEN Color:=clLime
        ELSE Color:=clBtnFace;

tab:=(dtsMaster.DataSet as TClientDataSet);
//ShowMessage(tab.name);
cd:=grdResultado.Tag;

WITH DmSys
DO BEGIN
   tab.Close;
   S:=Column.FieldName;
   IF tab.Name = 'cdsBioFacial'
   THEN BEGIN
        IF S = 'ISS_ID' THEN S:='app.ISS_ID';
        IF S = 'APP_ID' THEN S:='bio.APP_ID';
        END;
   IF Column.Title.Color = clYellow
   THEN tab.CommandText:=acertaSQL(strWhere,' ORDER BY '+S) ELSE
   IF Column.Title.Color = clLime
   THEN tab.CommandText:=acertaSQL(strWhere,' ORDER BY '+S+ ' DESC ')
   ELSE IF cd > -1 THEN
        BEGIN
        tab.CommandText:=acertaSQL(strWhere,defOrder);
        IF Pos(' DESC',UpperCase(defOrder)) > 0
        THEN grdResultado.Columns[cd].Title.Color:=clLime
        ELSE grdResultado.Columns[cd].Title.Color:=clYellow;
        END;
   //ShowMessage(tab.CommandText);
   FormAguarde.lblPosi.Caption:='O R D E N A N D O';
   FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
   tab.Open;
   FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
   END;
end;
