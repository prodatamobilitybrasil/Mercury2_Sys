unit uFrmPersonnelFunctionGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, StdCtrls, Menus, DB, ActnList, ImgList, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, uGeralFunctions, uConst, Mask, DBCtrls,
  RxDBComb, Buttons;

type
  TFrmPersonnelFunctionGroup = class(TFrmBaseSys)
    edtFilterDescricao: TEdit;
    lbl_decricao: TLabel;
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    GroupBox1: TGroupBox;
    cbPeriods: TCoolBar;
    tbPeriods: TToolBar;
    tbPeriodsEdit: TToolButton;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    btnPeriodsOk: TBitBtn;
    Panel8: TPanel;
    cbAddDel: TCoolBar;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnAddAll: TToolButton;
    btnDel: TToolButton;
    btnDelAll: TToolButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Lbl_disponivel: TLabel;
    lsbDisp: TListBox;
    Panel11: TPanel;
    Panel12: TPanel;
    lbl_selecionado: TLabel;
    lsbSel: TListBox;
    btnPeriodsCancel: TBitBtn;
    cboStatus: TRxDBComboBox;
    lblStatus: TLabel;
    cboFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure ButtonAddDelClick(Sender: TObject);
    procedure actTimeLimitEditExecute(Sender: TObject);
    procedure ButtonTimeLimitsOkCancelClick(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);

  private
    { Private declarations }
    Procedure FillLists;
    Procedure AddPeriod( PF_ID: Integer );
    Procedure RemPeriod( PFG_ID: Integer );
    Procedure EnablePeriodsEdit( bEnabled: Boolean );
    Procedure SavePeriods;
    Procedure RefreshPeriodsxTimeLimits;
    procedure BeforePost;
  public
    { Public declarations }
    status_oper: string;
    
  end;

var
  FrmPersonnelFunctionGroup: TFrmPersonnelFunctionGroup;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, DBClient, uDmSys;

{$R *.dfm}

procedure TFrmPersonnelFunctionGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  CloseTablesSys( [dmSys.cdsPersonnelFunctionsGroup,DmSys1.cdsPersonnalFunctions]);
  FrmPersonnelFunctionGroup := Nil;
  Action := caFree;
end;

procedure TFrmPersonnelFunctionGroup.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsPersonnelFunctionsGroup;
  lbl_selecionado.Caption:='Selecionados' ;
  Lbl_disponivel.Caption:='Disponíveis' ;
  status_oper:='';
  lbl_decricao.caption:='Descrição';
  lblFilterStatus.caption:='Status';
  lblDescricao.caption:='Descrição';
  lblStatus.caption:='Status';
  grdResultado.Columns[1].Title.Caption:='Descrição';
end;

procedure TFrmPersonnelFunctionGroup.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys( [ dmSys.cdsPersonnelFunctionsGroup,DmSys1.cdsPersonnalFunctions ] );
  FrmSparksysMain.stMain.Panels[3].Text := IntToStr(dmSys.cdsPersonnelFunctionsGroup.RecordCount ) + ' Registro(s)';
  lbl_selecionado.Caption:='Selecionados' ;
  Lbl_disponivel.Caption:='Disponíveis' ;
  status_oper:='';
  lbl_decricao.caption:='Descrição';
  lblFilterStatus.caption:='Status';
  lblDescricao.caption:='Descrição';
  lblStatus.caption:='Status';
  grdResultado.Columns[1].Title.Caption:='Descrição';
end;

procedure TFrmPersonnelFunctionGroup.actFilterExecute(Sender: TObject);
var
  strWhere:string;
begin
  inherited;
  strwhere:='';

  strWhere := strWhere + ' PFG_DESCRIPTION  LIKE ''' + edtFilterDescricao.Text + '%'' AND ';

  If cboFilterStatus.ItemIndex <> 2 Then
    strWhere := strWhere + ' PFG_STATUS = ''' + cboFilterStatus.Text[1] + ''' AND ';

  strWhere := Copy( strWhere, 0, Length( strWhere ) - 4 );

  with dmSys do
  Begin
    cdsPersonnelFunctionsGroup.Close;
    cdsPersonnelFunctionsGroup.CommandText := 'SELECT * FROM PERSONNELFUNCTIONGROUP WHERE ' + strWhere;
    cdsPersonnelFunctionsGroup.Open;
  end;

   FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmSys.cdsPersonnelFunctionsGroup.RecordCount ) + ' Registro(s)';
end;

procedure TFrmPersonnelFunctionGroup.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys.cdsPersonnelFunctionsGroup);
  SetActions([], False, FrmPersonnelFunctionGroup, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmPersonnelFunctionGroup, t_form_objects);
  tbPeriodsEdit.Enabled := True;
  edtDescricao.SetFocus;

   With dmSys do
    Begin
     lsbSel.Clear;
     lsbDisp.Clear;

     cdsGeral.Close;
     cdsGeral.CommandText := 'SELECT PFG_ID,PF_ID, PF_DESC FROM PERSONNELFUNCTIONS WHERE PF_STATUS = ''A''';
     cdsGeral.Open;


        While NOT cdsGeral.Eof do
           Begin

              lsbDisp.Items.AddObject(cdsGeral.fieldByName('PFG_ID').AsString+#9+cdsGeral.fieldByName('PF_ID').AsString+#9+cdsGeral.fieldByName('PF_DESC').AsString,
                                      TObject(cdsGeral.fieldByName('PF_ID').AsInteger)) ;


              cdsGeral.Next;
           end;
    end;

  tbPeriodsEdit.Enabled:=true;
  status_oper:='insert';

end;

procedure TFrmPersonnelFunctionGroup.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmPersonnelFunctionGroup, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmPersonnelFunctionGroup, t_form_objects);
  tbPeriodsEdit.Enabled := True;
  edtDescricao.Enabled:=true;
  edtDescricao.SetFocus;
  status_oper  :='edit';
  FillLists;
  DmSys.cdsPersonnelFunctionsGroup.Edit;
end;

procedure TFrmPersonnelFunctionGroup.actApplyUpdatesExecute(Sender: TObject);
begin
  If edtDescricao.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
    edtDescricao.SetFocus;
  end
  Else
  Begin
  inherited;
  If  status = stConsult Then
    BEGIN
  // If dtsMaster.DataSet.State = dsInsert Then
   //    BeforePost;
     If ApplyTablesSys([edtDescricao], [DmSys.cdsPersonnelFunctionsGroup,DmSys1.cdsPersonnalFunctions]) Then
         begin
          SetActions([], True, FrmPersonnelFunctionGroup, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmPersonnelFunctionGroup, t_form_objects);
         tbtnRefresh.Click;
         end;
    END;

  End;


end;

procedure TFrmPersonnelFunctionGroup.actCancelExecute(Sender: TObject);
begin
  {if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys.cdsPersonnelFunctionsGroup.Cancel;
    SetActions([], True, FrmPersonnelFunctionGroup, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmPersonnelFunctionGroup, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text := GetState(status);
    tbPeriodsEdit.Enabled := False;
  end;  }

  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsPersonnelFunctionsGroup.Cancel;
     DmSys1.cdsPersonnalFunctions.Cancel;
     DmSys.cdsPersonnelFunctionsGroup.CancelUpdates;
     DmSys1.cdsPersonnalFunctions.CancelUpdates;
     SetActions([], True, FrmPersonnelFunctionGroup, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmPersonnelFunctionGroup, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
     tbPeriodsEdit.Enabled := False;
    end;



end;

procedure TFrmPersonnelFunctionGroup.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsPersonnelFunctionsGroup.Edit;
         cdsPersonnelFunctionsGroup.FieldByName('PFG_STATUS').AsString := 'I';
         cdsPersonnelFunctionsGroup.Post;
         cdsPersonnelFunctionsGroup.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    tbPeriodsEdit.Enabled := False;
   end; //With...
end;


procedure TFrmPersonnelFunctionGroup.FillLists;
begin
  With dmSys do
    Begin
     lsbSel.Clear;
     lsbDisp.Clear;

     cdsGeral.Close;
     cdsGeral.CommandText := 'SELECT PFG_ID,PF_ID, PF_DESC FROM PERSONNELFUNCTIONS WHERE PF_STATUS = ''A'' and  PFG_ID=:PFG_ID';
     cdsGeral.Params.ParamByName('PFG_ID').Value :=dmSys.cdsPersonnelFunctionsGroup.fieldByName('PFG_ID').AsInteger;
     cdsGeral.Open;


        While NOT cdsGeral.Eof do
           Begin
             IF dmSys.cdsPersonnelFunctionsGroup.Locate('PFG_ID', VarArrayOf([cdsGeral.FieldByName('PFG_ID').AsInteger]), [] )
             Then lsbSel.Items.AddObject(cdsGeral.fieldByName('PFG_ID').AsString+#9+cdsGeral.fieldByName('PF_ID').AsString+#9+cdsGeral.fieldByName('PF_DESC').AsString,
                                      TObject(cdsGeral.fieldByName('PF_ID').AsInteger)) ;
                  cdsGeral.Next;
             end;


    End;

   With dmSys do
    Begin
     cdsGeral.Close;
     cdsGeral.CommandText := 'SELECT PFG_ID,PF_ID, PF_DESC FROM PERSONNELFUNCTIONS WHERE PF_STATUS = ''A'' and  PFG_ID not in(:PFG_ID) or PFG_ID is null';
     cdsGeral.Params.ParamByName('PFG_ID').Value :=dmSys.cdsPersonnelFunctionsGroup.fieldByName('PFG_ID').AsInteger;
     cdsGeral.Open;


        While NOT cdsGeral.Eof do
           Begin
               lsbDisp.Items.AddObject(cdsGeral.fieldByName('PFG_ID').AsString+#9+cdsGeral.fieldByName('PF_ID').AsString+#9+cdsGeral.fieldByName('PF_DESC').AsString,
                                      TObject(cdsGeral.fieldByName('PF_ID').AsInteger)) ;
               cdsGeral.Next;
            end;
   End;

end;

procedure TFrmPersonnelFunctionGroup.actNextExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmPersonnelFunctionGroup.actPriorExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmPersonnelFunctionGroup.actFirstExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmPersonnelFunctionGroup.actLastExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmPersonnelFunctionGroup.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmPersonnelFunctionGroup.ButtonAddDelClick(Sender: TObject);
Var
  i: Integer;
begin
//  inherited;
  Case ( Sender As TToolButton ).Tag Of
    // ADD
    3466: Begin
        lsbDisp.MoveSelection( lsbSel );
       End;
    // ADD ALL
    3467: Begin
        lsbDisp.SelectAll;
        lsbDisp.MoveSelection( lsbSel );
       End;
    // DEL
    3468: Begin
        lsbSel.MoveSelection( lsbDisp );
       End;
    // DEL ALL
    3469: Begin
        lsbSel.SelectAll;
        lsbSel.MoveSelection( lsbDisp );
       End;
  End;
end;

procedure TFrmPersonnelFunctionGroup.AddPeriod(PF_ID: Integer);
begin

  if dmSys1.cdsPersonnalFunctions.Locate('PF_ID', VarArrayOf([PF_ID]), [] ) then
  begin
   dmSys1.cdsPersonnalFunctions.EDIT;
   dmSys1.cdsPersonnalFunctions.FieldByName( 'PFG_ID' ).Value  := dmSys.cdsPersonnelFunctionsGroup.FieldByName('PFG_ID' ).AsInteger;
   dmSys1.cdsPersonnalFunctions.Post;
  end;

end;

procedure TFrmPersonnelFunctionGroup.RemPeriod(PFG_ID: Integer);
begin
  if dmSys1.cdsPersonnalFunctions.Locate('PFG_ID', VarArrayOf([dmSys.cdsPersonnelFunctionsGroup.FieldByName( 'PFG_ID' ).AsInteger]), [] ) then
  begin
    dmSys1.cdsPersonnalFunctions.EDIT;
     dmSys1.cdsPersonnalFunctions.FieldByName( 'PFG_ID' ).Value  := NULL;
    dmSys1.cdsPersonnalFunctions.Post;
  end;
end;

procedure TFrmPersonnelFunctionGroup.actTimeLimitEditExecute(Sender: TObject);
begin
  inherited;
  EnablePeriodsEdit( True );

  btnPeriodsOk.visible:=true;
  btnPeriodsCancel.visible:=true;
  btnPeriodsOk.Enabled:=true;
  btnPeriodsCancel.Enabled:=true;
  btnPeriodsOk.caption:='OK';
  btnPeriodsCancel.caption:='Cancelar';

end;

procedure TFrmPersonnelFunctionGroup.EnablePeriodsEdit(bEnabled: Boolean);
begin
  tbPeriodsEdit.Enabled    := Not bEnabled;
  btnAdd.Enabled             := bEnabled;
  btnAddAll.Enabled          := bEnabled;
  btnDel.Enabled             := bEnabled;
  btnDelAll.Enabled          := bEnabled;
  btnPeriodsOk.Visible       := bEnabled;
  btnPeriodsCancel.Visible   := bEnabled;
  If bEnabled Then
    SetActions( [], False, Self, t_form_objects )
  Else
    SetActions( [actApplyUpdates, actCancel], True, Self, t_form_objects );
end;

procedure TFrmPersonnelFunctionGroup.ButtonTimeLimitsOkCancelClick(Sender: TObject);
begin
//  inherited;
  Case ( Sender As TBitBtn ).Tag Of
    // Ok
    3470: Begin
        SavePeriods;
        EnablePeriodsEdit( False );
       End;
    // Cancel
    3471: Begin
        FillLists;
        EnablePeriodsEdit( False );
       End
  End;
end;

procedure TFrmPersonnelFunctionGroup.SavePeriods;
Var
  i: Integer;
begin

  if status_oper='edit' then
  begin
   While Not dmSys1.cdsPersonnalFunctions.Eof Do
    begin
      RemPeriod(dmSys.cdsPersonnelFunctionsGroup.FieldByName( 'PFG_ID' ).AsInteger );
      dmSys1.cdsPersonnalFunctions.Next;
    end;
  end;

   If dtsMaster.DataSet.State = dsInsert Then
    BeforePost;

  For i := 0 To lsbSel.Count - 1 Do Begin
    AddPeriod( Integer(lsbSel.Items.Objects[I]));//dmSys.cdsPersonnelFunctionsGroup.FieldByName( 'PFG_ID' ).AsInteger ) ;
  End;


end;

procedure TFrmPersonnelFunctionGroup.RefreshPeriodsxTimeLimits;
begin
  //If dmSys.cdsPersonnelFunctionsGroup.Active Then
   // dmSys.cdsPersonnelFunctionsGroup.Close;

  // dmSys.cdsPersonnelFunctionsGroup.Filter:= dmSys.cdsPersonnelFunctionsGroup.FieldByName( 'PFG_ID' ).asstring;;

 // Params.ParamByName( 'PFG_ID' ).asstring := dmSys.cdsPersonnelFunctionsGroup.FieldByName( 'PFG_ID' ).asstring;
  //dmSys.cdsPersonnelFunctionsGroup.Open;

end;

procedure TFrmPersonnelFunctionGroup.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  pcBaseCadastroChange( Nil );
end;



procedure TFrmPersonnelFunctionGroup.BeforePost;
Var
 PFG_ID,I : Integer;
Begin
  PFG_ID := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('PERSONNELFUNCTIONGROUP','PFG_ID', 'False', '');

  DmSys.cdsPersonnelFunctionsGroup.Edit;
  DmSys.cdsPersonnelFunctionsGroup.FieldByName('PFG_ID').AsInteger := PFG_ID;
  DmSys.cdsPersonnelFunctionsGroup.Post;


End;

end.


