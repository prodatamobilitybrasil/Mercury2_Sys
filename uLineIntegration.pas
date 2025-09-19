unit uLineIntegration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxLookup, DBClient, Buttons;


type
  TFrmLineIntegration = class(TFrmBaseSys)
    Panel1: TPanel;
    dbLineMT: TRxDBLookupCombo;
    Label1: TLabel;
    sgIntegration: TStringGrid;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Splitter1: TSplitter;
    dbkLineMT: TRxDBLookupCombo;
    Label2: TLabel;
    grdLineIntegrationDT: TDBGrid;
    btnDeleteIntegration: TBitBtn;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure dbLineMTCloseUp(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure sgIntegrationSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure actEditExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteIntegrationClick(Sender: TObject);
    procedure grdLineIntegrationDTCellClick(Column: TColumn);
  private
   { Private declarations }
    Procedure ProcessaIntegracao(xLM_ID, xLI_ID, xLI_IDATUAL : Integer);
    procedure CalculaClearing(vRow : Integer);
    Function ListaIntegracao(vLI_ID : Integer; Var aRows : Integer) : Integer;
    Procedure PreparaEdicao;
    Procedure RefreshLineIntegrationDT( vRow: Integer );
  public
    { Public declarations }
    TAuxGrid : TStringGrid;
    vLI_IDAtual  : String;
    Procedure BeforePost;
  end;

var
  FrmLineIntegration: TFrmLineIntegration;

implementation

uses uDmSys1, uDmSys, AppSparkSysMain, uDmConexao, uNewIntegration,
  uIssuers, uConst, uGeralFunctions, uFrmBaseCadastro, uFrmBase0;

{$R *.dfm}

procedure TFrmLineIntegration.FormShow(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsIntegrationList;
    OpenTablesSys([DmSys1.cdsLineIntegration, dmSys1.cdsIntegrationList,
//                   DmSys1.cdsIntegrationClearing,
                   dmSys1.cdsLineIntegrationDT,
                   dmSys1.cdsLineIntegrationDTXApps,
                   DmSys.cdsLineMt,
//                   DmSys1.cdsLineDirections,
                   DmSys1.cdsIntegrationDirections,
                   DmSys1.cdsLineIntegrationCons,
                   dmSys1.cdsIntegrationSeek,
                   dmSys.cdsIssuers,
                   dmSys.cdsApplications]);
    FrmSparksysMain.stMain.Panels[3].Text := InttoStr(dmsys1.cdsIntegrationList.RecordCount) + ' Registro(s)';
    sgIntegration.Cells[0,0] := GetDisplayValues(t_form_objects, 2115).OBJ_CAPTION;
    sgIntegration.Cells[1,0] := GetDisplayValues(t_form_objects, 2117).OBJ_CAPTION;
    sgIntegration.Cells[2,0] := GetDisplayValues(t_form_objects, 2122).OBJ_CAPTION;
    sgIntegration.Cells[3,0] := GetDisplayValues(t_form_objects, 2118).OBJ_CAPTION;
    sgIntegration.Cells[4,0] := GetDisplayValues(t_form_objects, 2117).OBJ_CAPTION;
    sgIntegration.Cells[5,0] := GetDisplayValues(t_form_objects, 2121).OBJ_CAPTION;
    sgIntegration.Cells[6,0] := GetDisplayValues(t_form_objects, 2118).OBJ_CAPTION;
    sgIntegration.Cells[7,0] := GetDisplayValues(t_form_objects, 2119).OBJ_CAPTION;
    sgIntegration.Cells[8,0] := GetDisplayValues(t_form_objects, 2120).OBJ_CAPTION;
    sgIntegration.Cells[9,0] := 'Tipo'; //Preciso alterar para objects...
    sgIntegration.Cells[10,0] := 'Registro'; //Preciso alterar para objects...
    sgIntegration.Cells[11,0] := 'Usuário'; //Preciso alterar para objects...
    sgIntegration.ColWidths[0]  := 60;
    sgIntegration.ColWidths[1]  := 60;
    sgIntegration.ColWidths[2]  := 210;
    sgIntegration.ColWidths[3]  := 100;
    sgIntegration.ColWidths[4]  := -1;
    sgIntegration.ColWidths[5]  := 210;
    sgIntegration.ColWidths[6]  := 100;
    sgIntegration.ColWidths[7]  := 60;
    sgIntegration.ColWidths[8]  := 60;
    sgIntegration.ColWidths[9]  := 100;
    sgIntegration.ColWidths[10] := 100;
    sgIntegration.ColWidths[11] := 100;

    TAuxGrid := TStringGrid.Create(Self);
    If dmSys1.cdsIntegrationList.RecordCount <= 0 Then
      actEdit.Enabled := False
    Else
      RefreshLineIntegrationDT( 1 );

    grdLineIntegrationDT.Columns.Items[ 2 ].Visible := FrmSparkSysMain.bUseIntegrationGroups;

end;

Function TFrmLineIntegration.ListaIntegracao(vLI_ID : Integer; Var aRows : Integer) : Integer;
Var
 TLista_LIID : TStringList;
 TTemp : TStringList;
 I, aLI_ID : Integer;
 Stop : Boolean;
Begin
  Stop := False;
  Result := aRows;
  TTemp := TStringList.Create;
  TLista_LIID := TStringList.Create;
  TTemp.Add(inttoStr(vLI_ID));


 While Not Stop do
  Begin
  TLista_LIID.Clear;
  TLista_LIID.Text := TTemp.Text;
  TTemp.Clear;
  For I := 0 To TLista_LIID.Count - 1 do
    Begin
      aLI_ID := StrtoiNT(TLista_LIID.Strings[I]);
      dmSys.cdsGeral.Close;
      dmSys.cdsGeral.CommandText := 'SELECT LI.*, LM.LM_DESCSHORT, IDR.IDR_DESC, LMD.LM_DESCSHORT AS LM_DESCSHORT_DEST, IDRD.IDR_DESC AS LDR_DESC_DEST '+
      'FROM LINEINTEGRATION LI '+
      'LEFT JOIN LINEMT LM ON (LM.LM_ID = LI.LI_ORIG_LMID) '+
      'LEFT JOIN INTEGRATIONDIRECTIONS IDR ON (IDR.IDR_ID = LI.LI_ORIG_DIR) '+
      'LEFT JOIN LINEMT LMD ON (LMD.LM_ID = LI.LI_DEST_LMID) '+
      'LEFT JOIN INTEGRATIONDIRECTIONS IDRD ON (IDRD.IDR_ID = LI.LI_ORIG_DIR) '+
      'WHERE LI.LI_STATUS  = ''A'' AND LI_ORIG_LIID = :LI_ID ';
      dmSys.cdsGeral.Params.ParamByName('LI_ID').AsString :=  InttoStr(aLI_ID);
      dmSys.cdsGeral.Open;

      While Not dmSys.cdsGeral.Eof do
        Begin
          TTemp.Add(dmSys.cdsGeral.fieldByName('LI_ID').AsString);
          dmSys1.cdsLineIntegration.Filter := dmSys1.cdsLineIntegration.Filter + ' OR LI_ORIG_LIID = '+ TLista_LIID.Strings[I] ;

          sgIntegration.RowCount := sgIntegration.RowCount + 1;
          sgIntegration.Cells[0,aRows] := dmSys.cdsGeral.fieldByName('LI_ID').AsString;
          If dmSys.cdsGeral.fieldByName('LI_ORIG_TYPE').AsString = 'L' Then
             sgIntegration.Cells[1,aRows] := 'Linha'
          Else
             sgIntegration.Cells[1,aRows] := 'Integração';

          sgIntegration.Cells[2,aRows] := dmSys.cdsGeral.fieldByName('LI_ORIG_LIID').AsString;
          sgIntegration.Cells[3,aRows] := dmSys.cdsGeral.fieldByName('IDR_DESC').AsString;
          sgIntegration.Cells[4,aRows] := dmSys.cdsGeral.fieldByName('LI_DEST_TYPE').AsString;
          sgIntegration.Cells[5,aRows] := dmSys.cdsGeral.fieldByName('LM_DESCSHORT_DEST').AsString;
          sgIntegration.Cells[6,aRows] := dmSys.cdsGeral.fieldByName('LDR_DESC_DEST').AsString;
          sgIntegration.Cells[7,aRows] := Formatfloat('#,##0.00',dmSys.cdsGeral.fieldByName('LI_INTEG_VALUE').AsFloat);
          sgIntegration.Cells[8,aRows] := dmSys.cdsGeral.fieldByName('LI_INTEG_TIME').AsString;
          If dmSys.cdsGeral.fieldByName('LI_INTEG_TYPE').Value = 0 Then
              sgIntegration.Cells[9,aRows] := 'Integração'
          Else
              sgIntegration.Cells[9,aRows] := 'Transferência';

          sgIntegration.Cells[10,aRows] := dmSys.cdsGeral.fieldByName('LI_REGDATE').AsString;
          sgIntegration.Cells[11,aRows] := dmSys.cdsGeral.fieldByName('LI_REGUSER').AsString;

          dmSys.cdsGeral.Next;
          Inc(aRows);
          Result := aRows;
        End; // While...
    End; // For...

   If (TTemp.Count = 0) Or (TLista_LIID.Strings[I - 1] = TTemp.Strings[0]) Then
      Stop := True;
  End;
End;

Procedure TFrmLineIntegration.ProcessaIntegracao(xLM_ID, xLI_ID, xLI_IDATUAL : Integer);
Var
 TIntegracao : TstringList;
 Rows, I     : Integer;

Begin
  TIntegracao := TstringList.Create;
  TIntegracao.Clear;

  sgIntegration.Cells[0,1] := '';
  sgIntegration.Cells[1,1] := '';
  sgIntegration.Cells[2,1] := '';
  sgIntegration.Cells[3,1] := '';
  sgIntegration.Cells[4,1] := '';
  sgIntegration.Cells[5,1] := '';
  sgIntegration.Cells[6,1] := '';
  sgIntegration.Cells[7,1] := '';
  sgIntegration.Cells[8,1] := '';
  sgIntegration.Cells[9,1] := '';
  sgIntegration.Cells[10,1] := '';
  sgIntegration.Cells[11,1] := '';
  Rows := 1;
  sgIntegration.RowCount := 2;

//  dmSys1.cdsLineIntegration.Close;
{    dmSys1.cdsLineIntegration.Filter := 'LI_ORIG_LMID = '+ dbLineMT.KeyValue; }

//    dmSys1.cdsLineIntegration.Filter := 'LI_ORIG_LMID = '+  dmsys1.cdsLineIntegration.fieldByName('LI_ORIG_LMID').AsString;
    If dbLineMT.KeyValue <> NULL Then
      dmSys1.cdsLineIntegration.Filter := 'LI_ORIG_LMID = '+    dbLineMT.KeyValue
    else
      dmSys1.cdsLineIntegration.Filter := '';

(*    If status = stInsert Then
       if xLI_ID > 0 Then
          dmSys1.cdsLineIntegration.Filter := dmSys1.cdsLineIntegration.Filter + ' OR LI_ORIG_LIID = '+ InttoStr(xLI_ID)
       Else
       If xLM_ID > 0 Then
          dmSys1.cdsLineIntegration.Filter := dmSys1.cdsLineIntegration.Filter + ' OR LI_ORIG_LMID = '+ InttoStr(xLM_ID);
-- REVISAR -- *)

    If (status = stInsert) Then
    begin
      if dbLineMT.KeyValue <> NULL then
        dmSys1.cdsLineIntegration.Filter := dmSys1.cdsLineIntegration.Filter + ' OR LI_ID = '+ InttoStr(xLI_IDATUAL)
      else
        dmSys1.cdsLineIntegration.Filter := dmSys1.cdsLineIntegration.Filter + ' LI_ID = '+ InttoStr(xLI_IDATUAL);
    end;

//  dmSys1.cdsLineIntegration.Params.ParamByName('LM_ID').Value := dbLineMT.KeyValue;
//  dmSys1.cdsLineIntegration.Open;

  dmSys1.cdsLineIntegration.First;

  While NOt dmSys1.cdsLineIntegration.Eof do
    Begin
      TIntegracao.Add(dmSys1.cdsLineIntegration.fieldByName('LI_ID').AsString);
      sgIntegration.RowCount := sgIntegration.RowCount + 1;
      sgIntegration.Cells[0,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_ID').AsString;
      If dmSys1.cdsLineIntegration.fieldByName('LI_ORIG_TYPE').AsString = 'L' Then
         sgIntegration.Cells[1,Rows] := 'Linha'
      Else
         sgIntegration.Cells[1,Rows] := 'Integração';

      sgIntegration.Cells[2,Rows] := dmSys1.cdsLineIntegration.fieldByName('LM_DESCSHORT').AsString;
      sgIntegration.Cells[3,Rows] := dmSys1.cdsLineIntegration.fieldByName('IDR_DESC').AsString;
      sgIntegration.Cells[4,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_DEST_TYPE').AsString;
      sgIntegration.Cells[5,Rows] := dmSys1.cdsLineIntegration.fieldByName('LM_DESCSHORT_DEST').AsString;
      sgIntegration.Cells[6,Rows] := dmSys1.cdsLineIntegration.fieldByName('LDR_DESC_DEST').AsString;
      sgIntegration.Cells[7,Rows] := Formatfloat('#,##0.00',dmSys1.cdsLineIntegration.fieldByName('LI_INTEG_VALUE').AsFloat);
      sgIntegration.Cells[8,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_INTEG_TIME').AsString;

      If dmSys1.cdsLineIntegration.fieldByName('LI_INTEG_TYPE').Value  = 0 Then
         sgIntegration.Cells[9,Rows] := 'Integração'
      Else
        sgIntegration.Cells[9,Rows] := 'Transferência';
      sgIntegration.Cells[10,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_REGDATE').AsString;
      sgIntegration.Cells[11,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_REGUSER').AsString;

      dmSys1.cdsLineIntegration.Next;
      Inc(Rows);
    End;

   For I := 0 to TIntegracao.Count - 1  do
       Rows := ListaIntegracao(StrtoInt(TIntegracao.Strings[I]), Rows);

   If sgIntegration.RowCount > 2 Then
   sgIntegration.RowCount := sgIntegration.RowCount - 1;

//   CalculaClearing(1);
  RefreshLineIntegrationDT(1);

End;

Procedure TFrmLineIntegration.BeforePost;
Var
 vLI_ID : integer;
Begin
  vLI_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('LINEINTEGRATION', 'LI_ID', 'False', '' );

  DmSys1.cdsLineIntegrationDT.First;

  While Not DmSys1.cdsLineIntegrationDT.Eof do
    Begin
      DmSys1.cdsLineIntegrationDT.Edit;
      DmSys1.cdsLineIntegrationDT.FieldByName('LI_ID').AsInteger := vLI_ID;
      DmSys1.cdsLineIntegrationDT.Post;
      DmSys1.cdsLineIntegrationDT.Next;
    End;
{
  DmSys1.cdsIntegrationClearing.First;

  While Not DmSys1.cdsIntegrationClearing.Eof do
    Begin
      DmSys1.cdsIntegrationClearing.Edit;
      DmSys1.cdsIntegrationClearing.FieldByName('LI_ID').AsInteger := vLI_ID;
      DmSys1.cdsIntegrationClearing.Post;
      DmSys1.cdsIntegrationClearing.Next;
    End;
}

End;


procedure TFrmLineIntegration.dbLineMTCloseUp(Sender: TObject);
begin
  inherited;
  If dbLineMT.Text <> '' Then
     Begin
       ProcessaIntegracao(0,0,0);
     End;
end;

procedure TFrmLineIntegration.actInsertExecute(Sender: TObject);
Var
  vLM_ID, vLI_ID : Integer;
begin
//  inherited;
  If dbLineMT.KeyValue = null Then
    Begin
      dbLineMT.KeyValue := dmsys1.cdsLineIntegration.fieldByName('LI_ORIG_LMID').AsInteger;
      dbLineMTCloseUp(Self);
    End;
  status := stInsert;
  ActionInsertSys(DmSys1.cdsLineIntegration);
  SetActions([], False, FrmLineIntegration, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmLineIntegration, t_form_objects);
  vLM_ID := 0;
  vLI_ID := 0;

  FrmNewIntegration := TFrmNewIntegration.Create(Self);
  FrmNewIntegration.Showmodal;
  If FrmNewIntegration.v_newOrig_Line >= 0 Then
     Begin
       If FrmNewIntegration.dbTipo.itemindex = 0 Then
          vLM_ID := FrmNewIntegration.v_newOrig_Line
       Else
          vLI_ID := FrmNewIntegration.v_newOrig_Line;
     End;


  If dbLineMT.KeyValue = null
     Then dbLineMT.KeyValue := FrmNewIntegration.v_newOrig_Line;
  FrmNewIntegration.Free;
  ProcessaIntegracao(vLM_ID, vLI_ID, FrmNewIntegration.vLI_ID);

  if dmSys1.cdsLineIntegration.RecordCount < 1 then
  begin
       SetActions([], True, FrmLineIntegration, t_form_objects);
       SetActions([actApplyUpdates, actCancel], False, FrmLineIntegration, t_form_objects);
       pcBaseCadastro.ActivePageIndex := 0;
       Status := stConsult;
       FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
  end;

end;

procedure TFrmLineIntegration.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([], [DmSys1.cdsLineIntegration,
                            DmSys1.cdsLineIntegrationDT,
                            DmSys1.cdsLineIntegrationDTXApps
//                            ,DmSys1.cdsIntegrationClearing
                            ]) Then
         begin
           SetActions([], True, FrmLineIntegration, t_form_objects);
           SetActions([actApplyUpdates, actCancel], False, FrmLineIntegration, t_form_objects);
           actRefresh.Execute;
         end;
    END;

end;

procedure TFrmLineIntegration.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
//  dmSys1.cdsLineIntegration.Close;
//  dmsys1.cdsLineIntegration.Params.ParamByName('LI_ORIG_LMID').Value :=
//  dmSys1.cdsIntegrationList.fieldByname('LI_ORIG_LMID').Value;
//  dmSys1.cdsLineIntegration.Open;
  dbLineMT.KeyValue := dmsys1.cdsLineIntegration.fieldByName('LI_ORIG_LMID').AsInteger;
  dbLineMTCloseUp(Self);

end;

procedure TFrmLineIntegration.CalculaClearing(vRow : Integer);
//Var
// Count : Integer; cidel-
// cdsCalcClearing : TClientDataSet;   cidel-
// X, Y : Integer;  cidel-
Begin
{  cdsCalcClearing := TClientDataSet.Create(Self);
  cdsCalcClearing.ConnectionBroker := dmSys1.cdsIntegrationClearing.ConnectionBroker;
  cdsCalcClearing.ProviderName := dmSys1.cdsIntegrationClearing.ProviderName;
  cdsCalcClearing.CommandText  := 'SELECT IC.*, LM.LM_DESCSHORT FROM INTEGRATIONCLEARING IC '+
                                  'INNER JOIN  LINEMT LM ON (LM.LM_ID = IC.LM_ID) WHERE LI_ID = :LI_ID ';
  Count := 1;

  IF (vRow > 0) and
     (sgIntegration.Cells[0,vRow] <> '') Then
  Begin
//  dmSys1.cdsLineIntegration.Locate('LI_ID', sgIntegration.Cells[0,vRow], []);

  cdsCalcClearing.Close;
  cdsCalcClearing.Params.ParamByName('LI_ID').Value := sgIntegration.Cells[0,vRow];
  cdsCalcClearing.Open;

(*  dmSys1.cdsIntegrationClearing.Close;
   dmSys1.cdsIntegrationClearing.Params.ParamByName('LI_ID').Value := sgIntegration.Cells[0,vRow];
  dmSys1.cdsIntegrationClearing.Open;
*)

 If (Status = stEdit) and
    (sgIntegration.Cells[0,vRow] = vLI_IDAtual ) Then
     Begin
     End
 Else
 Begin
  If ( cdsCalcClearing.RecordCount = 0 ) and
     ( dmSys1.cdsIntegrationClearing.fieldByName('Li_ID').AsString = sgIntegration.Cells[0,vRow] ) Then
    Begin
      dmSys1.cdsIntegrationClearing.First;
      while not dmSys1.cdsIntegrationClearing.Eof do
         Begin
            sgClearing.Cells[0,Count] := dmSys1.cdsIntegrationClearing.fieldByName('LM_ID').AsString;
            sgClearing.Cells[1,Count] := dmSys1.cdsIntegrationClearing.fieldByName('LM_DESCSHORT').AsString;
            sgClearing.Cells[2,Count] := Formatfloat('#,##0.00',dmSys1.cdsIntegrationClearing.fieldByName('IC_VALUE').AsFloat);
            Inc(Count);
            sgClearing.RowCount := sgClearing.RowCount + 1;
            dmSys1.cdsIntegrationClearing.Next;
         End;
    End
  Else
  While Not cdsCalcClearing.Eof do
    Begin
      sgClearing.Cells[0,Count] := cdsCalcClearing.fieldByName('LM_ID').AsString;
      sgClearing.Cells[1,Count] := cdsCalcClearing.fieldByName('LM_DESCSHORT').AsString;
      sgClearing.Cells[2,Count] := Formatfloat('#,##0.00',cdsCalcClearing.fieldByName('IC_VALUE').AsFloat);
      Inc(Count);
      sgClearing.RowCount := sgClearing.RowCount + 1;
      cdsCalcClearing.Next;
    End;
  End;
 End;
//  If sgClearing.RowCount > 2 Then
//  sgClearing.RowCount :=   sgClearing.RowCount - 1;

  cdsCalcClearing.Free;
}
End;

procedure TFrmLineIntegration.sgIntegrationSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
//  CalculaClearing(ARow);
  RefreshLineIntegrationDT( ARow );
end;


(*
Procedure TFrmLineIntegration.PreparaEdicao;
Var
 I : integer;
Begin
  With FrmNewIntegration do
  Begin
  dmSys1.cdsLineIntegration.Locate('LI_ID',sgIntegration.Cells[0,sgIntegration.row], [] );

  If dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_TYPE').AsString = 'L' Then
    Begin
     dbLinhaInteg.Text    := dmSys1.cdsLineIntegration.FieldByName('LM_DESCSHORT').AsString;
     dbTipo.ItemIndex := 0
    End
  Else
    Begin
     dbLinhaInteg.Text    := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LIID').AsString;
     dbTipo.ItemIndex := 1;
    End;

     db_Orig_Dir.KeyValue := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_DIR').AsInteger;

     dbLines.Text         := dmSys1.cdsLineIntegration.FieldByName('LM_DESCSHORT_DEST').AsString;
     db_Dest_Dir.KeyValue := dmSys1.cdsLineIntegration.FieldByName('LI_DEST_DIR').AsInteger;
     dbValor.Value        := dmSys1.cdsLineIntegration.FieldByName('LI_INTEG_VALUE').AsFloat;
     edTempo.Value        := dmSys1.cdsLineIntegration.FieldByName('LI_INTEG_TIME').AsInteger;
     If dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_TYPE').AsString = 'L' Then
        v_newOrig_Line       := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LMID').AsInteger
     Else
          v_newOrig_Line     := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LIID').AsInteger;
     v_newDest_Line       := dmSys1.cdsLineIntegration.FieldByName('LI_DEST_LMID').AsInteger;
     vLI_IDAtual          := dmSys1.cdsLineIntegration.FieldByName('LI_ID').AsString;

     For I := 1 to dgClearing.RowCount -1 do
        Begin
           dgClearing.Cells[0,I] := '';
           dgClearing.Cells[1,I] := '';
           dgClearing.Cells[2,I] := '';
        End;

     dgClearing.RowCount := sgClearing.RowCount;

     For I := 0 to sgClearing.RowCount - 1 do
       Begin
           dgClearing.Cells[0,I] := sgClearing.Cells[0,I];
           dgClearing.Cells[1,I] := sgClearing.Cells[1,I];
           dgClearing.Cells[2,I] := sgClearing.Cells[2,I];
       End;
  End;
dmSys1.cdsLineIntegration.Edit;
End;
*)

Procedure TFrmLineIntegration.PreparaEdicao;
//Var   cidel-
// I : integer; cidel-
Begin
  With FrmNewIntegration do
  Begin
  dmSys1.cdsLineIntegration.Locate('LI_ID',sgIntegration.Cells[0,sgIntegration.row], [] );

  If dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_TYPE').AsString = 'L' Then
    Begin
     dbLinhaInteg.Text    := dmSys1.cdsLineIntegration.FieldByName('LM_DESCSHORT').AsString;
     dbTipo.ItemIndex := 0
    End
  Else
    Begin
     dbLinhaInteg.Text    := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LIID').AsString;
     dbTipo.ItemIndex := 1;
    End;

     db_Orig_Dir.KeyValue := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_DIR').AsInteger;

     dbLines.Text         := dmSys1.cdsLineIntegration.FieldByName('LM_DESCSHORT_DEST').AsString;
     db_Dest_Dir.KeyValue := dmSys1.cdsLineIntegration.FieldByName('LI_DEST_DIR').AsInteger;
     dbValor.Value        := dmSys1.cdsLineIntegration.FieldByName('LI_INTEG_VALUE').AsFloat;
     edTempo.Value        := dmSys1.cdsLineIntegration.FieldByName('LI_INTEG_TIME').AsInteger;
     If dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_TYPE').AsString = 'L' Then
       v_newOrig_Line     := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LMID').AsInteger
     Else
       v_newOrig_Line     := dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LIID').AsInteger;
     v_newDest_Line       := dmSys1.cdsLineIntegration.FieldByName('LI_DEST_LMID').AsInteger;
     vLI_IDAtual          := dmSys1.cdsLineIntegration.FieldByName('LI_ID').AsString;

  End;
dmSys1.cdsLineIntegration.Edit;
End;

procedure TFrmLineIntegration.actEditExecute(Sender: TObject);
Var
  Rows : Integer;
begin
  if dmSys1.cdsLineIntegration.RecordCount < 1 then
    exit;
    
  Status := stEdit;

  SetActions([], False, FrmLineIntegration, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmLineIntegration, t_form_objects);

  If pcBaseCadastro.ActivePageIndex = 0 Then
     Begin
      pcBaseCadastro.ActivePageIndex := 1;
      pcBaseCadastro.OnChange(SELF);
     End;


  FrmNewIntegration := TFrmNewIntegration.Create(Self);

  //Verifico se existe outra integração dependente desta que será editada...
  If dmConexao.ConnBrkMaster.AppServer.GetDBCount('LI_ID', 'FROM LINEINTEGRATION', 'True', ' WHERE LI_ORIG_LIID = '+ sgIntegration.Cells[0,sgIntegration.row]) > 0 Then
    Begin
     DisplayMsg(t_form_objects, '%T %S%T', [2811, 2812], [#13], mtInformation, [mbOK]);
     FrmNewIntegration.dbLines.Enabled := False;
     FrmNewIntegration.db_Dest_Dir.Enabled := False;
     FrmNewIntegration.vDependente := True;
    End;


  PreparaEdicao;

  dmSys1.cdsLineIntegrationDT.Close;
  dmSys1.cdsLineIntegrationDT.Params.ParamByName( 'LI_ID' ).AsString := vLI_IDAtual;
  dmSys1.cdsLineIntegrationDT.Open;

  FrmNewIntegration.Showmodal;
  FrmNewIntegration.Free;
  sgIntegration.RowCount := 2;

  Rows := 1;
  dmSys1.cdsLineIntegration.First;
  While NOt dmSys1.cdsLineIntegration.Eof do
    Begin
//      TIntegracao.Add(dmSys1.cdsLineIntegration.fieldByName('LI_ID').AsString);
      sgIntegration.RowCount := sgIntegration.RowCount + 1;
      sgIntegration.Cells[0,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_ID').AsString;
      If dmSys1.cdsLineIntegration.fieldByName('LI_ORIG_TYPE').AsString = 'L' Then
         sgIntegration.Cells[1,Rows] := 'Linha'
      Else
         sgIntegration.Cells[1,Rows] := 'Integração';

      If dmSys1.cdsLineIntegration.fieldByName('LI_ORIG_LMID').Value = null Then
         sgIntegration.Cells[2,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_ORIG_LIID').AsString
      Else
         sgIntegration.Cells[2,Rows] := dmSys1.cdsLineIntegration.fieldByName('LM_DESCSHORT').AsString;

      sgIntegration.Cells[3,Rows] := dmSys1.cdsLineIntegration.fieldByName('IDR_DESC').AsString;
      sgIntegration.Cells[4,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_DEST_TYPE').AsString;
      sgIntegration.Cells[5,Rows] := dmSys1.cdsLineIntegration.fieldByName('LM_DESCSHORT_DEST').AsString;
      sgIntegration.Cells[6,Rows] := dmSys1.cdsLineIntegration.fieldByName('LDR_DESC_DEST').AsString;
      sgIntegration.Cells[7,Rows] := Formatfloat('#,##0.00',dmSys1.cdsLineIntegration.fieldByName('LI_INTEG_VALUE').AsFloat);
      sgIntegration.Cells[8,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_INTEG_TIME').AsString;
      If dmSys1.cdsLineIntegration.fieldByName('LI_INTEG_TYPE').Value = 0 Then
         sgIntegration.Cells[9,Rows] := 'Integração'
      Else
         sgIntegration.Cells[9,Rows] := 'Transferência';

      sgIntegration.Cells[10,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_REGDATE').AsString;
      sgIntegration.Cells[11,Rows] := dmSys1.cdsLineIntegration.fieldByName('LI_REGUSER').AsString;

      dmSys1.cdsLineIntegration.Next;
      Inc(Rows);
    End;

   If sgIntegration.RowCount > 2 Then
   sgIntegration.RowCount := sgIntegration.RowCount - 1;

   CalculaClearing(1);

end;

procedure TFrmLineIntegration.actCancelExecute(Sender: TObject);
begin
  inherited;
//  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    If Status = StConsult Then
    begin
     DmSys1.cdsLineIntegration.Cancel;
//     DmSys1.cdsIntegrationClearing.Cancel;
     DmSys1.cdsLineIntegrationDT.Cancel;
     DmSys1.cdsLineIntegrationDTXApps.Cancel;

     DmSys1.cdsLineIntegration.CancelUpdates;
//     DmSys1.cdsIntegrationClearing.CancelUpdates;
     DmSys1.cdsLineIntegrationDT.CancelUpdates;
     DmSys1.cdsLineIntegrationDTXApps.CancelUpdates;

//     DmSys1.cdsIntegrationClearing.Close;
//     DmSys1.cdsIntegrationClearing.Open;

     DmSys1.cdsLineIntegrationDT.Close;
     DmSys1.cdsLineIntegrationDT.Open;
     DmSys1.RefreshLineIntegrationDTXApps;

     SetActions([], True, FrmLineIntegration, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmLineIntegration, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmLineIntegration.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      // Bruno - 10/11/2006 - Liberação de exclusão de integação
      // SetActions([actFilter, actDelete, actRefresh], False, FrmLineIntegration, t_form_objects);
      SetActions([actFilter, actRefresh], False, FrmLineIntegration, t_form_objects);
      SetActions([actDelete], True, FrmLineIntegration, t_form_objects);
      dbLineMT.KeyValue := dmsys1.cdsLineIntegration.fieldByName('LI_ORIG_LMID').AsInteger;
      dbLineMTCloseUp(Self);
      btnDeleteIntegration.Enabled := (sgIntegration.RowCount > 0);
     End
  Else
    Begin
      SetActions([actFilter, actRefresh], True, FrmLineIntegration, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmLineIntegration.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(dbkLineMT.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LI_ORIG_LMID = ' + InttoStr(dbkLineMT.KeyValue) + ' AND ';
       end;

      // Verifica se é necessário tirar o AND
      if qtd_campos > 0 then
         begin
           i := Length(strWhere) - 4;
           strWhere := ' WHERE ' + Copy(strWhere,1,i);
         end;

    End;
begin
  inherited;
  strWhere  := '';
  BuiltStrWhere;
  with DmSys1 do
    begin
      cdsIntegrationList.Close;
      cdsIntegrationList.CommandText := 'SELECT '+ 'DISTINCT LI.LI_ORIG_LMID, LM.LM_DESCSHORT' +' FROM LINEINTEGRATION LI ' +
      'INNER JOIN LINEMT LM ON (LM.LM_ID = LI.LI_ORIG_LMID) '+
       strWhere + ' ORDER BY LM.LM_DESCSHORT';
      cdsIntegrationList.Open;
      FrmSparksysMain.stMain.Panels[3].Text := InttoStr(cdsIntegrationList.RecordCount) + ' Registro(s)';
    end


end;

procedure TFrmLineIntegration.pcBaseCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  If DMSYS1.cdsIntegrationList.RecordCount = 0 Then
     AllowChange := False;

end;

procedure TFrmLineIntegration.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys1.cdsLineIntegration, dmSys.cdsIssuers, dmSys.cdsApplications]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmLineIntegration := Nil;
end;

procedure TFrmLineIntegration.actDeleteExecute(Sender: TObject);
begin
  //Verifico se existe outra integração dependente desta que será editada...
  If dmConexao.ConnBrkMaster.AppServer.GetDBCount('LI_ID', 'FROM LINEINTEGRATION', 'True', ' WHERE LI_ORIG_LIID = '+ sgIntegration.Cells[0,sgIntegration.row]) > 0 Then
       DisplayMsg(t_form_objects, '%T %S%T', [2811, 2813], [#13], mtInformation, [mbOK])
  Else
    Begin
//
    End;

end;

procedure TFrmLineIntegration.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsIntegrationList;
end;

procedure TFrmLineIntegration.RefreshLineIntegrationDT(vRow: Integer);
begin
  if ( Status = stConsult ) and ( sgIntegration.Cells[ 0, vRow ] <> '' ) then
  begin
{    dmSys1.cdsLineIntegrationDT.Close;
    dmSys1.cdsLineIntegrationDT.Params.ParamByName( 'LI_ID' ).AsString := sgIntegration.Cells[ 0, vRow ];
    dmSys1.cdsLineIntegrationDT.Open;}
    dmSys1.cdsLineIntegration.First;
    dmSys1.cdsLineIntegration.Locate('LI_ID',sgIntegration.Cells[ 0, vRow ],[]);
    dmSys1.RefreshLineIntegrationDTXApps;
  end;
end;

procedure TFrmLineIntegration.btnDeleteIntegrationClick(Sender: TObject);
Var
  iLI_ORIG_LMID: Integer;
begin
  //Verifico se existe outra integração dependente desta que será editada...
  If dmConexao.ConnBrkMaster.AppServer.GetDBCount('LI_ID', 'FROM LINEINTEGRATION', 'True', ' WHERE LI_ORIG_LIID = '+ sgIntegration.Cells[0,sgIntegration.row]) > 0 Then
       DisplayMsg(t_form_objects, '%T %S%T', [2811, 2813], [#13], mtInformation, [mbOK])
  Else Begin
    If DisplayMsg( t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo] ) = mrYes Then Begin
      Try
        // Inativa os detalhes da integração
        DmSys.cdsGeral.CommandText := 'UPDATE LINEINTEGRATIONDT SET LID_STATUS = ''I'' WHERE LI_ID = ' + sgIntegration.Cells[0,sgIntegration.row];
        DmSys.cdsGeral.Execute;
        // Inativa a integração
        DmSys.cdsGeral.CommandText := 'UPDATE LINEINTEGRATION SET LI_STATUS = ''I'' WHERE LI_ID = ' + sgIntegration.Cells[0,sgIntegration.row];
        DmSys.cdsGeral.Execute;

        iLI_ORIG_LMID := dmSys1.cdsIntegrationList.FieldByName( 'LI_ORIG_LMID' ).AsInteger;

        dmSys1.cdsIntegrationList.Close;
        dmSys1.cdsIntegrationList.Open;

        dmSys1.cdsIntegrationList.Locate( 'LI_ORIG_LMID', iLI_ORIG_LMID, [loCaseInsensitive] );

        dmSys1.cdsLineIntegration.Close;
        dmSys1.cdsLineIntegration.Open;
        dbLineMTCloseUp( Nil );

        sgIntegration.SetFocus;

        btnDeleteIntegration.Enabled := (sgIntegration.RowCount > 0);
      Except
        On E: Exception Do Begin
          DisplayMsg( t_form_objects, '%T %S', [2833], [#13#10 + E.Message], mtError, [mbOk] );
        End;
      End;
    End;
  End;
end;

procedure TFrmLineIntegration.grdLineIntegrationDTCellClick(
  Column: TColumn);
begin
  inherited;
  dmSys1.RefreshLineIntegrationDTXApps;
end;

end.
