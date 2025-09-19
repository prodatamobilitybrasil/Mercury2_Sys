unit uFrmLineIntegTimeGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, StdCtrls, Menus, DB, ActnList, ImgList, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, uGeralFunctions, uConst, Mask, DBCtrls,
  RxDBComb, Buttons;

type
  TFrmLineIntegTimeGroups = class(TFrmBaseSys)
    edtFilterDescricao: TEdit;
    Label1: TLabel;
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
    Label15: TLabel;
    lsbDisp: TListBox;
    Panel11: TPanel;
    Panel12: TPanel;
    Label16: TLabel;
    lsbSel: TListBox;
    btnPeriodsCancel: TBitBtn;
    cboStatus: TRxDBComboBox;
    lblStatus: TLabel;
    cboFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
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
    Procedure AddPeriod( LipID: Integer );
    Procedure RemPeriod( LipID: Integer );
    Procedure EnablePeriodsEdit( bEnabled: Boolean );
    Procedure SavePeriods;
    Procedure RefreshPeriodsxTimeLimits;
  public
    { Public declarations }
  end;

var
  FrmLineIntegTimeGroups: TFrmLineIntegTimeGroups;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, DBClient;

{$R *.dfm}

procedure TFrmLineIntegTimeGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  CloseTablesSys( [ dmSys1.cdsLineIntegTimeGroups ] );
  frmLineIntegTimeGroups := Nil;
  Action := caFree;
end;

procedure TFrmLineIntegTimeGroups.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys1.cdsLineIntegTimeGroups;
end;

procedure TFrmLineIntegTimeGroups.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys( [ dmSys1.cdsLineIntegTimeGroups ] );
  FrmSparksysMain.stMain.Panels[3].Text := IntToStr(dmSys1.cdsLineIntegTimeGroups.RecordCount ) + ' Registro(s)';
end;

procedure TFrmLineIntegTimeGroups.actFilterExecute(Sender: TObject);
var
  strWhere:string;
begin
  inherited;
  strwhere:='';

  strWhere := strWhere + ' LITG_DESC LIKE ''' + edtFilterDescricao.Text + '%'' AND ';

  If cboFilterStatus.ItemIndex <> 2 Then
    strWhere := strWhere + ' LITG_STATUS = ''' + cboFilterStatus.Text[1] + ''' AND ';

  strWhere := Copy( strWhere, 0, Length( strWhere ) - 4 );

  with dmSys1 do
  Begin
    cdsLineIntegTimeGroups.Close;
    cdsLineIntegTimeGroups.CommandText := 'SELECT * FROM LINEINTEGTIMEGROUPS WHERE ' + strWhere;
    cdsLineIntegTimeGroups.Open;
  end;

   FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmSys1.cdsLineIntegTimeGroups.RecordCount ) + ' Registro(s)';
end;

procedure TFrmLineIntegTimeGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsLineIntegTimeGroups);
  SetActions([], False, frmLineIntegTimeGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineIntegTimeGroups, t_form_objects);
  tbPeriodsEdit.Enabled := True;
  edtDescricao.SetFocus;
end;

procedure TFrmLineIntegTimeGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmLineIntegTimeGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineIntegTimeGroups, t_form_objects);
  tbPeriodsEdit.Enabled := True;
  edtDescricao.SetFocus;
end;

procedure TFrmLineIntegTimeGroups.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys( [ edtDescricao ], [ dmSys1.cdsLineIntegTimeGroups, dmSys1.cdsLineIntegTimeGroupsxPeriods ] ) then
       Begin
         SetActions( [], True, frmLineIntegTimeGroups, t_form_objects);
         SetActions( [ actApplyUpdates, actCancel ], False, frmLineIntegTimeGroups, t_form_objects);
         tbtnRefresh.Click;
         tbPeriodsEdit.Enabled := False;
       end;
  end;
end;

procedure TFrmLineIntegTimeGroups.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsLineIntegTimeGroups.Cancel;
    SetActions([], True, frmLineIntegTimeGroups, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, frmLineIntegTimeGroups, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text := GetState(status);
    tbPeriodsEdit.Enabled := False;
  end;
end;

procedure TFrmLineIntegTimeGroups.actDeleteExecute(Sender: TObject);
begin
  //inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsLineIntegTimeGroups.Edit;
         cdsLineIntegTimeGroups.FieldByName('LIT_STATUS').AsString := 'I';
         cdsLineIntegTimeGroups.Post;
         cdsLineIntegTimeGroups.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmLineIntegTimeGroups.FillLists;
begin
  With dmConexao.cdsGeral Do Begin
    If Active Then
      Close;

    CommandText := 'SELECT LIP_ID, LIP_DESC FROM LINEINTEGPERIODS WHERE LIP_STATUS = ''A''';

    lsbSel.Clear;
    lsbDisp.Clear;
    
    Open;
    While Not Eof Do Begin
      If dmSys1.cdsLineIntegTimeGroupsxPeriods.Locate( 'LIP_ID', FieldByName( 'LIP_ID' ).AsString, [loCaseInsensitive] ) Then
        lsbSel.Items.AddObject( FieldByName( 'LIP_DESC' ).AsString, TObject( FieldByName( 'LIP_ID' ).AsInteger ) )
      Else
        lsbDisp.Items.AddObject( FieldByName( 'LIP_DESC' ).AsString, TObject( FieldByName( 'LIP_ID' ).AsInteger ) );

      Next;
    End;
    Close;
  End;
end;

procedure TFrmLineIntegTimeGroups.actNextExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmLineIntegTimeGroups.actPriorExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmLineIntegTimeGroups.actFirstExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmLineIntegTimeGroups.actLastExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmLineIntegTimeGroups.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
end;

procedure TFrmLineIntegTimeGroups.ButtonAddDelClick(Sender: TObject);
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

procedure TFrmLineIntegTimeGroups.AddPeriod(LipID: Integer);
begin
  dmSys1.cdsLineIntegTimeGroupsxPeriods.Insert;
  dmSys1.cdsLineIntegTimeGroupsxPeriods.FieldByName( 'LITG_ID' ).Value := dmSys1.cdsLineIntegTimeGroups.FieldByName( 'LITG_ID' ).AsInteger;
  dmSys1.cdsLineIntegTimeGroupsxPeriods.FieldByName( 'LIP_ID' ).Value := LipID;
  dmSys1.cdsLineIntegTimeGroupsxPeriods.Post;
end;

procedure TFrmLineIntegTimeGroups.RemPeriod(LipID: Integer);
begin
  If dmSys1.cdsLineIntegTimeGroupsxPeriods.Locate( 'LIP_ID', LipID, [loCaseInsensitive] ) Then
    dmSys1.cdsLineIntegTimeGroupsxPeriods.Delete;
end;

procedure TFrmLineIntegTimeGroups.actTimeLimitEditExecute(Sender: TObject);
begin
  inherited;
  EnablePeriodsEdit( True );
  lsbDisp.SetFocus;
end;

procedure TFrmLineIntegTimeGroups.EnablePeriodsEdit(bEnabled: Boolean);
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

procedure TFrmLineIntegTimeGroups.ButtonTimeLimitsOkCancelClick(Sender: TObject);
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

procedure TFrmLineIntegTimeGroups.SavePeriods;
Var
  i: Integer;
begin

  While Not dmSys1.cdsLineIntegTimeGroupsxPeriods.Eof Do
    RemPeriod( dmSys1.cdsLineIntegTimeGroupsxPeriods.FieldByName( 'LIP_ID' ).AsInteger );

  For i := 0 To lsbSel.Count - 1 Do Begin
    AddPeriod( Integer( lsbSel.Items.Objects[ i ] ) );
  End;

  FillLists;
end;

procedure TFrmLineIntegTimeGroups.RefreshPeriodsxTimeLimits;
begin
  If dmSys1.cdsLineIntegTimeGroupsxPeriods.Active Then
    dmSys1.cdsLineIntegTimeGroupsxPeriods.Close;

  dmSys1.cdsLineIntegTimeGroupsxPeriods.Params.ParamByName( 'LITG_ID' ).AsString := dmSys1.cdsLineIntegTimeGroups.FieldByName( 'LITG_ID' ).AsString;
  dmSys1.cdsLineIntegTimeGroupsxPeriods.Open;
end;

procedure TFrmLineIntegTimeGroups.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  pcBaseCadastroChange( Nil );
end;

end.
