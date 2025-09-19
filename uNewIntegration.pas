unit uNewIntegration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, CurrEdit, RxLookup, Mask, ToolEdit,
  RXDBCtrl, Grids, DB, DBClient, uGeralFunctions, ActnList, DBCtrls,
  ComCtrls, ToolWin, DBGrids, uFrmBaseSys;

type
  TFrmNewIntegration = class(TForm)
    gbOrigem: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbTipo: TComboBox;
    db_Orig_Dir: TRxDBLookupCombo;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    db_Dest_Dir: TRxDBLookupCombo;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dbValor: TCurrencyEdit;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbLinhaInteg: TComboEdit;
    dbLines: TComboEdit;
    Label1: TLabel;
    edTempo: TCurrencyEdit;
    ActionList1: TActionList;
    actSaveIntegration: TAction;
    actCancelIntegration: TAction;
    Label5: TLabel;
    cbIntegType: TComboBox;
    cbDetails: TCoolBar;
    tbDetails: TToolBar;
    tbtnNewDetail: TToolButton;
    tbtnEditDetail: TToolButton;
    tbtnDeleteDetail: TToolButton;
    Label10: TLabel;
    edtLIDDate: TDBDateEdit;
    Label11: TLabel;
    btnLIDSaveDetail: TBitBtn;
    btnLIDCancelDetail: TBitBtn;
    edtLIDIntegValue: TRxDBCalcEdit;
    grdLineIntegrationDT: TDBGrid;
    lblLineIntegTimeGroup: TLabel;
    lkpLineIntegTimeGroup: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    btnLIDAPPSaveDetail: TBitBtn;
    btnLIDAPPCancelDetail: TBitBtn;
    edtLIDAPPIntegValue: TRxDBCalcEdit;
    grdLineIntegrationDTXApps: TDBGrid;
    lkpLineIntegTimeGroup2: TDBLookupComboBox;
    lkpIssuer: TDBLookupComboBox;
    Label15: TLabel;
    lkpApplication: TDBLookupComboBox;
    Label16: TLabel;
    procedure dbTipoChange(Sender: TObject);
    procedure dbLinhaIntegButtonClick(Sender: TObject);
    procedure dbLinesButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgClearingSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure dbLinhaIntegKeyPress(Sender: TObject; var Key: Char);
    procedure dbLinesKeyPress(Sender: TObject; var Key: Char);
    procedure dgClearingSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure db_Orig_DirChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveIntegrationExecute(Sender: TObject);
    procedure actCancelIntegrationExecute(Sender: TObject);
    procedure ButtonLineDetailClick(Sender: TObject);
    procedure ButtonLineDetailOkCancelClick(Sender: TObject);
    procedure ButtonLineDetailXAppsClick(Sender: TObject);
    procedure ButtonLineDetailXAppsOkCancelClick(Sender: TObject);
    procedure grdLineIntegrationDTCellClick(Column: TColumn);
  private
    { Private declarations }
    t_form_objects : t_Object_List;
    Procedure ValidaOrigem;
    procedure EnableLineIntegrationDT(bEnabled: Boolean);
    procedure EnableLineIntegrationDTXApps(bEnabled: Boolean);
    procedure RefreshLineIntegrationDTXApps;
  public
    v_newOrig_Line,
    v_newOrig_Integration,
    v_newDest_Line,
    v_newDest_Integration : Integer;
    vLI_ID : integer;
    vDependente : Boolean;
    { Public declarations }
  end;

var
  FrmNewIntegration: TFrmNewIntegration;

implementation

uses uLines_Integrations, uDmSys, uDmSys1, uDataBaseFunctions, uDmConexao, uLineIntegration,
  AppSparkSysMain, uConst;

{$R *.dfm}

Procedure TFrmNewIntegration.ValidaOrigem;
Begin
 If (dbTipo.ItemIndex >= 0)    And
    (dbLinhaInteg.Text <> '')  And
    (db_Orig_Dir.KeyValue <> Null) Then
    Begin
      dbTipo.Enabled       := False;
      dbLinhaInteg.Enabled := False;
      db_Orig_Dir.Enabled  := False;

      If NOT (vDependente) Then
        Begin
          dbLines.Enabled      := True;
          db_Dest_Dir.Enabled  := True;
        End;
      dbValor.Enabled      := True;
      edTempo.Enabled      := True;
    End;
End;

procedure TFrmNewIntegration.dbTipoChange(Sender: TObject);
begin
  dbLinhaInteg.enabled := Trim(dbTipo.Text) <> '';
  ValidaOrigem;
end;

procedure TFrmNewIntegration.dbLinhaIntegButtonClick(Sender: TObject);
begin
  Case dbTipo.ItemIndex of
   0 : Begin //Linha...
         FrmLinha_Integracao := TFrmLinha_Integracao.Create(Self);
         FrmLinha_Integracao.dbgLinesIntegration.Visible := True;
         FrmLinha_Integracao.btnOk.enabled :=  (FrmLinha_Integracao.dbgLinesIntegration.DataSource.DataSet.RecordCount > 0);

         FrmLinha_Integracao.showmodal;

         If (FrmLinha_Integracao.Result) Then
           Begin
             FrmNewIntegration.dbLinhaInteg.Text := Dmsys.cdsLineMt.fieldByName('LM_DESCSHORT').AsString;
             FrmNewIntegration.v_newOrig_Line    := Dmsys.cdsLineMt.fieldByName('LM_ID').AsInteger;
           End;
         FrmLinha_Integracao.Free;
       End;

   1 : Begin //Integração...
         FrmLinha_Integracao := TFrmLinha_Integracao.Create(Self);
         FrmLinha_Integracao.dbgIntegration.Visible := True;
         FrmLinha_Integracao.btnOk.enabled :=  (FrmLinha_Integracao.dbgIntegration.DataSource.DataSet.RecordCount > 0);
         Dmsys1.cdsLineIntegrationCons.Close;
         Dmsys1.cdsLineIntegrationCons.Open;
         FrmLinha_Integracao.showmodal;
         If (FrmLinha_Integracao.Result) Then
           Begin
             FrmNewIntegration.dbLinhaInteg.Text := Dmsys1.cdsLineIntegrationCons.fieldByName('LI_ID').AsString;
             FrmNewIntegration.v_newOrig_Line    := Dmsys1.cdsLineIntegrationCons.fieldByName('LI_ID').AsInteger;
           End;
         FrmLinha_Integracao.Free;
       End;
  end;
  ValidaOrigem;
end;

procedure TFrmNewIntegration.dbLinesButtonClick(Sender: TObject);
Var
//  I, vRow : Integer; cidel-
  vLinhaAtual : Integer;
begin
    vLinhaAtual := v_newDest_Line;
    FrmLinha_Integracao := TFrmLinha_Integracao.Create(Self);
    FrmLinha_Integracao.dbgLinesIntegration.Visible := True;
    FrmLinha_Integracao.showmodal;

    If (FrmLinha_Integracao.Result) Then
      Begin

        FrmNewIntegration.dbLines.Text    := Dmsys.cdsLineMt.fieldByName('LM_DESCSHORT').AsString;
        FrmNewIntegration.v_newDest_Line  := Dmsys.cdsLineMt.fieldByName('LM_ID').AsInteger;

    End;
  FrmLinha_Integracao.Free;
end;

procedure TFrmNewIntegration.FormShow(Sender: TObject);
var
//  I, vRow : Integer;  cidel-
  vLinhaAtual : Integer;
begin
  vLinhaAtual := v_newDest_Line;

  If (dmSys1.cdsLineIntegration.State = dsEdit) Then
  Begin
    Dmsys1.cdsLineIntegrationCons.Locate('LI_ID', FrmLineIntegration.sgIntegration.Cells[0,FrmLineIntegration.sgIntegration.row], []);

    Case dbTipo.ItemIndex of
      0:Begin
          DmSys.cdsLineMt.Locate('LM_ID', v_newOrig_Line, []);
          DmSys.cdsLineMt.Locate('LM_ID', vLinhaAtual, []);
        End;
    End;
  End;

  grdLineIntegrationDT.Columns.Items[ 2 ].Visible := FrmSparkSysMain.bUseIntegrationGroups;
  lblLineIntegTimeGroup.Visible := FrmSparkSysMain.bUseIntegrationGroups;
  lkpLineIntegTimeGroup.Visible := FrmSparkSysMain.bUseIntegrationGroups;

end;

procedure TFrmNewIntegration.dgClearingSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   If Acol <= 1 Then
   CanSelect := False;
end;

procedure TFrmNewIntegration.dbLinhaIntegKeyPress(Sender: TObject;
  var Key: Char);
begin
 Abort;
end;

procedure TFrmNewIntegration.dbLinesKeyPress(Sender: TObject;
  var Key: Char);
begin
 Abort;
end;

procedure TFrmNewIntegration.dgClearingSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
{  if (ACol = 2) then
      If Value <> '' Then
      dgClearing.Cells[ACol, ARow] := FormatFloat('#,##0.00', StrtoFloat(Value));
}      
end;

procedure TFrmNewIntegration.db_Orig_DirChange(Sender: TObject);
begin
ValidaOrigem;
end;

procedure TFrmNewIntegration.FormCreate(Sender: TObject);
begin
 vDependente := False;

  if not FillObjectsList(TForm(Sender).Tag, dmConexao.SystemUser_Id, dmConexao.cdsGeral, t_form_objects) then
    begin
      DisplayMsg(t_form_objects, '%T', [2828], []);
      TForm(Sender).Close;
    end;
  SetDisplayValues(t_form_objects,TForm(Sender));

  If dmSys1.cdsLineIntegTimeGroups.Active Then
    Close;
  dmSys1.cdsLineIntegTimeGroups.Open;

end;

procedure TFrmNewIntegration.actSaveIntegrationExecute(Sender: TObject);
Var
// I,j : Integer;   cidel-
// X, Y : Integer; cidel-
 rVal : Double;
 rTmp : Double;
begin
  rVal := 0;
{  for j := 1 to dgClearing.RowCount - 1 do
  begin
    if TryStrToFloat(dgClearing.Cells[2,j],rTmp) then
      rVal := rVal + StrtoFloat(dgClearing.Cells[2,j]);
  end;
}
{  if (dbValor.Text <> FloatToStr(rVal)) and (rVal <> 0) then
  begin
       DisplayMsg(t_form_objects, '%T', [3261], [], mtInformation, [mbOK]);
       dbValor.SetFocus;
       exit;
  end;
}
  If dbTipo.ItemIndex < 0 Then
     Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
       dbTipo.SetFocus;
     End
  Else
  If Trim(dbLinhaInteg.Text) = '' Then
    Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
       dbLinhaInteg.SetFocus;
    End
  Else
  If db_Orig_Dir.KeyValue = Null Then
    Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
       db_Orig_Dir.SetFocus;
    End
  Else
  If Trim(dbLines.Text) = '' Then
    Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
       dbLines.SetFocus;
    End
  Else
  If db_Dest_Dir.KeyValue = Null Then
    Begin
       DisplayMsg(t_form_objects, '%T %T', [1601, 1500], [], mtInformation, [mbOK]);
       db_Dest_Dir.SetFocus;
    End
  Else
{  If dbValor.Value <= 0 Then
    Begin
       DisplayMsg(t_form_objects, '%T', [2814], [], mtInformation, [mbOK]);
       dbValor.SetFocus;
    End
  Else
}
  If edTempo.Value <= 0 Then
    Begin
       DisplayMsg(t_form_objects, '%T', [2815], [], mtInformation, [mbOK]);
       edTempo.SetFocus;
    End
  Else
  If cbIntegType.ItemIndex < 0 Then
    Begin
       DisplayMsg(t_form_objects, '%T', [2815], [], mtInformation, [mbOK]);
       cbIntegType.SetFocus;
    End
  Else
  Begin
//     dmSys1.cdsLineIntegration.Insert;
     If dmSys1.cdsLineIntegration.State = dsInsert  Then
       Begin
        vLI_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento_Seq('LI_ID', 'False', '' );

        If vLI_ID = 0 Then
           Begin
             Application.MessageBox('Estouro de limite ou sequência inexistente'+#13+'Redefina a sequência para esta tabela.', 'Aviso ao usuário', MB_OK+MB_ICONWARNING);
             Exit;
           End;

        dmSys1.cdsLineIntegration.FieldByName('LI_ID').AsInteger  := vLI_ID;

//        dmSys1.cdsLineIntegration.Post;
//        dmSys1.cdsLineIntegration.Edit;

        dmSys1.cdsLineIntegrationDT.First;
        While Not dmSys1.cdsLineIntegrationDT.Eof Do Begin
          dmSys1.cdsLineIntegrationDT.Edit;
          dmSys1.cdsLineIntegrationDT.FieldByName( 'LI_ID'       ).Value := dmSys1.cdsLineIntegration.FieldByName('LI_ID').AsInteger;
          dmSys1.cdsLineIntegrationDT.FieldByName( 'LID_REGUSER' ).Value := 'ADMIN';
          dmSys1.cdsLineIntegrationDT.FieldByName( 'LID_REGDATE' ).Value := Now;
          dmSys1.cdsLineIntegrationDT.Post;
          dmSys1.cdsLineIntegrationDT.Next;
        End;
{
        DmSys1.cdsIntegrationClearing.Close;
        DmSys1.cdsIntegrationClearing.Params.ParamByName('LI_ID').AsString := InttoStr(vLI_ID);
        DmSys1.cdsIntegrationClearing.Open;
}
       End
     Else
    If dmSys1.cdsLineIntegration.State = dsEdit  Then
    Begin
     vLI_ID  := dmSys1.cdsLineIntegration.FieldByName('LI_ID').AsInteger;

     dmSys1.cdsLineIntegrationDT.First;
     While ( Not dmSys1.cdsLineIntegrationDT.Eof ) And ( dmSys1.cdsLineIntegrationDT.FieldByName( 'LI_ID' ).Value = -1 ) Do Begin
       dmSys1.cdsLineIntegrationDT.Edit;
       dmSys1.cdsLineIntegrationDT.FieldByName( 'LI_ID' ).Value := vLI_ID;
       dmSys1.cdsLineIntegrationDT.Post;
       dmSys1.cdsLineIntegrationDT.Next;
     End;
{     DmSys1.cdsIntegrationClearing.Close;
     DmSys1.cdsIntegrationClearing.Params.ParamByName('LI_ID').AsString := InttoStr(vLI_ID);
     DmSys1.cdsIntegrationClearing.Open;
     DmSys1.cdsIntegrationClearing.First;

     While Not DmSys1.cdsIntegrationClearing.Eof do
        Begin
          DmSys1.cdsIntegrationClearing.Delete;
        End;

        FrmLineIntegration.TAuxGrid.ColCount := dgClearing.ColCount;
        FrmLineIntegration.TAuxGrid.RowCount := dgClearing.RowCount;
        For Y := 0 to dgClearing.RowCount - 1 do
          For X := 0 to dgClearing.ColCount - 1 do
              FrmLineIntegration.TAuxGrid.Cells[x,y] := dgClearing.Cells[x,y];
}
     End;
     dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_TYPE').AsString   := Copy(dbTipo.Text,1,1);

     Case dbTipo.ItemIndex of
       0 : Begin
            dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LMID').Value     := v_newOrig_Line;
           End;
       1 : Begin
            dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_LIID').Value     := v_newOrig_Line;
           End;
     End;

     dmSys1.cdsLineIntegration.FieldByName('LI_ORIG_DIR').AsInteger   := db_Orig_Dir.KeyValue;
     dmSys1.cdsLineIntegration.FieldByName('LI_DEST_TYPE').AsString   := 'L';
     dmSys1.cdsLineIntegration.FieldByName('LI_DEST_LIID').Value      := NULL;
     dmSys1.cdsLineIntegration.FieldByName('LI_DEST_LMID').AsInteger  := v_newDest_Line;
     dmSys1.cdsLineIntegration.FieldByName('LI_DEST_DIR').AsInteger   := db_Dest_Dir.KeyValue;
     dmSys1.cdsLineIntegration.FieldByName('LI_INTEG_VALUE').AsFloat  := dbValor.Value; //IGOR - edtLIDIntegValue.Value;
     dmSys1.cdsLineIntegration.FieldByName('LI_INTEG_TIME').AsInteger := edTempo.AsInteger;
     dmSys1.cdsLineIntegration.FieldByName('LI_INTEG_TYPE').AsInteger := cbIntegType.ItemIndex;
//     dmSys1.cdsLineIntegration.FieldByName('LI_STATUS').AsString      := 'A';
//     dmSys1.cdsLineIntegration.FieldByName('STATUS_ID').AsString      := 'A';
     dmSys1.cdsLineIntegration.FieldByName('LM_DESCSHORT').AsString   := dbLinhaInteg.Text;
     dmSys1.cdsLineIntegration.FieldByName('IDR_DESC').AsString       := db_Orig_Dir.Text;
     dmSys1.cdsLineIntegration.FieldByName('LM_DESCSHORT_DEST').AsString := dbLines.Text;
     dmSys1.cdsLineIntegration.FieldByName('LDR_DESC_DEST').AsString  := db_Dest_Dir.Text;
     dmSys1.cdsLineIntegration.Post;

{
     For I := 1 to dgClearing.RowCount - 1 do
       Begin
         DmSys1.cdsIntegrationClearing.Insert;
         DmSys1.cdsIntegrationClearing.FieldByName('LI_ID').AsInteger  := vLI_ID;
         DmSys1.cdsIntegrationClearing.FieldByName('LM_ID').AsInteger  := StrtoInt(dgClearing.Cells[0,I]);
         DmSys1.cdsIntegrationClearing.FieldByName('LM_DESCSHORT').AsString := dgClearing.Cells[1,I];
         DmSys1.cdsIntegrationClearing.FieldByName('VT_ID').AsInteger  := 1; //Somente Valor Atualmente...
         Try
            If dgClearing.Cells[2,I] = '' Then
               DmSys1.cdsIntegrationClearing.FieldByName('IC_VALUE').AsFloat := 0
            Else
               DmSys1.cdsIntegrationClearing.FieldByName('IC_VALUE').AsFloat := StrtoFloat(dgClearing.Cells[2,I]);
         Except
         DmSys1.cdsIntegrationClearing.FieldByName('IC_VALUE').AsFloat := 0;
         End;
         DmSys1.cdsIntegrationClearing.Post;
       End;
}

     Close;
  End;

end;

procedure TFrmNewIntegration.actCancelIntegrationExecute(Sender: TObject);
begin
v_newOrig_Line         := -1;
v_newOrig_Integration  := -1;
v_newDest_Line         := -1;
v_newDest_Integration  := -1;
dmSys1.cdsLineIntegration.Cancel;
FrmLineIntegration.vLI_IDAtual := '';
Close;
end;

procedure TFrmNewIntegration.ButtonLineDetailClick(Sender: TObject);
begin
  Case ( Sender As TToolButton ).Tag Of
    // INCLUIR
    1: Begin
        dmSys1.cdsLineIntegrationDT.Insert;
        dmSys1.cdsLineIntegrationDT.FieldByName( 'LID_STATUS' ).AsString := 'A';
        dmSys1.cdsLineIntegrationDT.FieldByName( 'LITG_ID'    ).Value    := Null;
        EnableLineIntegrationDT( True );
        edtLIDDate.SetFocus;
       End;
    // EDITAR
    2: Begin
        EnableLineIntegrationDT( True );
        dmSys1.cdsLineIntegrationDT.Edit;
        edtLIDDate.Enabled := False;
        edtLIDIntegValue.SetFocus;
       End;
    // EXCLUIR
    3: Begin
        dmSys1.cdsLineIntegrationDT.Edit;
        dmSys1.cdsLineIntegrationDT.FieldByName( 'LID_STATUS' ).AsString := 'I';
        dmSys1.cdsLineIntegrationDT.Post;
       End;
  End;
end;

procedure TFrmNewIntegration.ButtonLineDetailOkCancelClick(Sender: TObject);
begin
  if (Sender As TBitBtn) = btnLIDSaveDetail then
  begin
        dmSys1.cdsLineIntegrationDT.Post;
        EnableLineIntegrationDT( False );
        grdLineIntegrationDT.SetFocus;
  end
  else
  if (Sender As TBitBtn) = btnLIDCancelDetail then
  begin
    dmSys1.cdsLineIntegrationDT.Cancel;
    EnableLineIntegrationDT( False );
    grdLineIntegrationDT.SetFocus;
  end;
end;

procedure TFrmNewIntegration.ButtonLineDetailXAppsClick(Sender: TObject);
begin
  with dmSys1 do
  begin
    case (Sender as TToolButton).Tag of
      // INCLUIR
      1: begin
          cdsLineIntegrationDTXApps.Insert;
          cdsLineIntegrationDTXApps.FieldByName('LIDAPP_ID').AsInteger := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('LINEINTEGRATIONDTXAPPS','LIDAPP_ID', 'False', '');
          cdsLineIntegrationDTXApps.FieldByName('LI_ID').AsInteger := cdsLineIntegrationDT.FieldByName('LI_ID').AsInteger;
          cdsLineIntegrationDTXApps.FieldByName('LID_DATE').AsDateTime := cdsLineIntegrationDT.FieldByName('LID_DATE').AsDateTime;

          dmSys1.cdsLineIntegrationDTXApps.FieldByName('LIDAPP_STATUS').AsString := 'A';
          dmSys1.cdsLineIntegrationDTXApps.FieldByName('LITG_ID').Value := Null;
          EnableLineIntegrationDTXApps(True);
          lkpIssuer.SetFocus;
         end;
      // EDITAR
      2: begin
          EnableLineIntegrationDTXApps(True);
          dmSys1.cdsLineIntegrationDTXApps.Edit;
          lkpIssuer.Enabled := False;
          lkpApplication.Enabled := False;
          edtLIDAPPIntegValue.SetFocus;
         end;
      // EXCLUIR
      3: Begin
          dmSys1.cdsLineIntegrationDTXApps.Edit;
          dmSys1.cdsLineIntegrationDTXApps.FieldByName('LIDAPP_STATUS').AsString := 'I';
          dmSys1.cdsLineIntegrationDT.Post;
         end;
    end;
  end;
end;

procedure TFrmNewIntegration.ButtonLineDetailXAppsOkCancelClick(
  Sender: TObject);
begin
  if (Sender As TBitBtn) = btnLIDAPPSaveDetail then
  begin
        dmSys1.cdsLineIntegrationDTXApps.Post;
        EnableLineIntegrationDTXApps(False);
        grdLineIntegrationDTXApps.SetFocus;
  end
  else
  if (Sender As TBitBtn) = btnLIDCancelDetail then
  begin
    dmSys1.cdsLineIntegrationDT.Cancel;
    EnableLineIntegrationDTXApps(False);
    grdLineIntegrationDTXApps.SetFocus;
  end;
end;

procedure TFrmNewIntegration.EnableLineIntegrationDT(bEnabled: Boolean);
begin
  edtLIDDate.Enabled            := bEnabled;
  edtLIDIntegValue.Enabled      := bEnabled;
  lkpLineIntegTimeGroup.Enabled := bEnabled;
  grdLineIntegrationDT.Enabled  := Not bEnabled;
  SetCCAActions([actSaveIntegration, actCancelIntegration], Not bEnabled, Self );
  btnLIDSaveDetail.Visible   := bEnabled;
  btnLIDCancelDetail.Visible := bEnabled;
  btnLIDSaveDetail.Enabled   := bEnabled;
  btnLIDCancelDetail.Enabled := bEnabled;
end;

procedure TFrmNewIntegration.grdLineIntegrationDTCellClick(
  Column: TColumn);
begin
  RefreshLineIntegrationDTXApps;
end;

procedure TFrmNewIntegration.EnableLineIntegrationDTXApps(
  bEnabled: Boolean);
begin
  edtLIDAPPIntegValue.Enabled       := bEnabled;
  lkpIssuer.Enabled                 := bEnabled;
  lkpApplication.Enabled            := bEnabled;
  lkpLineIntegTimeGroup2.Enabled    := bEnabled;
  grdLineIntegrationDTXApps.Enabled := Not bEnabled;
  SetCCAActions([actSaveIntegration, actCancelIntegration], Not bEnabled, Self );
  btnLIDAPPSaveDetail.Visible       := bEnabled;
  btnLIDAPPCancelDetail.Visible     := bEnabled;
  btnLIDAPPSaveDetail.Enabled       := bEnabled;
  btnLIDAPPCancelDetail.Enabled     := bEnabled;
end;

procedure TFrmNewIntegration.RefreshLineIntegrationDTXApps;
var
  LI_ID: String;
  LID_DATE: String;
begin
  with dmSys1 do
  begin
    LI_ID := cdsLineIntegrationDT.FieldByName('LI_ID').AsString;
    LID_DATE := cdsLineIntegrationDT.FieldByName('LID_DATE').AsString;

    cdsLineIntegrationDTXApps.Filtered := False;
    cdsLineIntegrationDTXApps.Filter := 'LI_ID = ' + LI_ID + ' AND LID_DATE = ' + QuotedStr(LID_DATE);
    cdsLineIntegrationDTXApps.Filtered := True;

//    cdsLineIntegrationDTXApps.First;
//    if not (cdsLineIntegrationDTXApps.Locate('LI_ID;LID_DATE', VarArrayOf([LI_ID,LID_DATE]), [])) then
//      cdsLineIntegrationDTXApps.RecNo
  end;
end;

end.

