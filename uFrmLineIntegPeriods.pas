unit uFrmLineIntegPeriods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, StdCtrls, Menus, DB, ActnList, ImgList, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, uGeralFunctions, uConst, Mask, DBCtrls,
  RxDBComb, Buttons, ToolEdit, CurrEdit, RXDBCtrl;

type
  TFrmLineIntegPeriods = class(TFrmBaseSys)
    edtFilterDescricao: TEdit;
    Label1: TLabel;
    cboFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    cboStatus: TRxDBComboBox;
    lblStatus: TLabel;
    GroupBox1: TGroupBox;
    cbTimeLimits: TCoolBar;
    tbForms: TToolBar;
    tbTimeLimitEdit: TToolButton;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    btnTimeLimitOk: TBitBtn;
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
    actTimeLimitEdit: TAction;
    actTimeLimitAdd: TAction;
    actTimeLimitAddAll: TAction;
    actTimeLimitDel: TAction;
    actTimeLimitDelAll: TAction;
    btnTimeLimitCancel: TBitBtn;
    actTimeLimitOk: TAction;
    actTimeLimitCancel: TAction;
    edtLipIntegValue: TRxDBCalcEdit;
    Label2: TLabel;
    edtLipStartTime: TDateTimePicker;
    edtLipEndTime: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
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
    Procedure AddTimeLimit( LitID: Integer );
    Procedure RemTimeLimit( LitID: Integer );
    Procedure EnableTimeLimitsEdit( bEnabled: Boolean );
    Procedure SaveTimeLimits;
    Procedure RefreshPeriodsxTimeLimits;
    Procedure FillLipTimes;
  public
    { Public declarations }
  end;

var
  FrmLineIntegPeriods: TFrmLineIntegPeriods;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, DBClient;

{$R *.dfm}

procedure TFrmLineIntegPeriods.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  CloseTablesSys( [ dmSys1.cdsLineIntegPeriods ] );
  frmLineIntegPeriods := Nil;
  Action := caFree;
end;

procedure TFrmLineIntegPeriods.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys1.cdsLineIntegPeriods;
end;

procedure TFrmLineIntegPeriods.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys( [ dmSys1.cdsLineIntegPeriods ] );
  TDateTimeField( dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_STARTTIME' ) ).DisplayFormat := 'HH:mm';
  TDateTimeField( dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_ENDTIME'   ) ).DisplayFormat := 'HH:mm';
  FrmSparksysMain.stMain.Panels[3].Text := IntToStr(dmSys1.cdsLineIntegPeriods.RecordCount ) + ' Registro(s)';
  SetCCAActions( [actTimeLimitAdd, actTimeLimitAddAll, actTimeLimitDel, actTimeLimitDelAll], False, frmLineIntegPeriods );
  SetCCAActions( [actTimeLimitOk, actTimeLimitCancel], False, frmLineIntegPeriods );
end;

procedure TFrmLineIntegPeriods.actFilterExecute(Sender: TObject);
var
  strWhere:string;
begin
  inherited;
  strwhere:='';

  strWhere := strWhere + ' LIP_DESC LIKE ''' + edtFilterDescricao.Text + '%'' AND ';

  If cboFilterStatus.ItemIndex <> 2 Then
    strWhere := strWhere + ' LIP_STATUS = ''' + cboFilterStatus.Text[1] + ''' AND ';

  strWhere := Copy( strWhere, 0, Length( strWhere ) - 4 );

  with dmSys1 do
  Begin
    cdsLineIntegPeriods.Close;
    cdsLineIntegPeriods.CommandText := 'SELECT * FROM LINEINTEGPERIODS WHERE ' + strWhere;
    cdsLineIntegPeriods.Open;
  end;

   FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmSys1.cdsLineIntegPeriods.RecordCount ) + ' Registro(s)';
end;

procedure TFrmLineIntegPeriods.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsLineIntegPeriods);
  SetActions([], False, frmLineIntegPeriods, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineIntegPeriods, t_form_objects);
  tbTimeLimitEdit.Enabled := True;
  edtDescricao.SetFocus;
  edtLipStartTime.DateTime := StrToDateTime( '01/01/2003 00:00:00' );
  edtLipEndTime.DateTime   := StrToDateTime( '01/01/2003 23:59:59' );
end;

procedure TFrmLineIntegPeriods.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmLineIntegPeriods, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineIntegPeriods, t_form_objects);
  tbTimeLimitEdit.Enabled := True;
  edtDescricao.SetFocus;
end;

procedure TFrmLineIntegPeriods.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_STARTTIME' ).Value := edtLipStartTime.DateTime;
    dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_ENDTIME'   ).Value := StrToDateTime( FormatDateTime( 'dd/mm/yyyy hh:mi', edtLipEndTime.DateTime ) ) + ( StrToDateTime( '01/01/2003 00:00:59' ) - StrToDateTime( '01/01/2003 00:00:00' ) );
    if ApplyTablesSys( [ edtDescricao ], [ dmSys1.cdsLineIntegPeriods, dmSys1.cdsLineIntegPeriodsxTimeLimits ] ) then
       Begin
         SetActions( [], True, frmLineIntegPeriods, t_form_objects);
         SetActions( [ actApplyUpdates, actCancel ], False, frmLineIntegPeriods, t_form_objects);
         tbtnRefresh.Click;
         tbTimeLimitEdit.Enabled := False;
       end;
  end;
end;

procedure TFrmLineIntegPeriods.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsLineIntegPeriods.Cancel;
    SetActions([], True, frmLineIntegPeriods, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, frmLineIntegPeriods, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text := GetState(status);
    tbTimeLimitEdit.Enabled := False;
  end;
end;

procedure TFrmLineIntegPeriods.actDeleteExecute(Sender: TObject);
begin
  //inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsLineIntegPeriods.Edit;
         cdsLineIntegPeriods.FieldByName('LIT_STATUS').AsString := 'I';
         cdsLineIntegPeriods.Post;
         cdsLineIntegPeriods.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmLineIntegPeriods.FillLists;
begin
  With dmConexao.cdsGeral Do Begin
    If Active Then
      Close;

    CommandText := 'SELECT LIT_ID, LIT_DESC FROM LINEINTEGTIMELIMITS WHERE LIT_STATUS = ''A''';

    lsbSel.Clear;
    lsbDisp.Clear;

    Open;
    While Not Eof Do Begin
      If dmSys1.cdsLineIntegPeriodsxTimeLimits.Locate( 'LIT_ID', FieldByName( 'LIT_ID' ).AsString, [loCaseInsensitive] ) Then
        lsbSel.Items.AddObject( FieldByName( 'LIT_DESC' ).AsString, TObject( FieldByName( 'LIT_ID' ).AsInteger ) )
      Else
        lsbDisp.Items.AddObject( FieldByName( 'LIT_DESC' ).AsString, TObject( FieldByName( 'LIT_ID' ).AsInteger ) );

      Next;
    End;
    Close;
  End;
end;

procedure TFrmLineIntegPeriods.actNextExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
  FillLipTimes;
end;

procedure TFrmLineIntegPeriods.actPriorExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
  FillLipTimes;
end;

procedure TFrmLineIntegPeriods.actFirstExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
  FillLipTimes;
end;

procedure TFrmLineIntegPeriods.actLastExecute(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
  FillLipTimes;
end;

procedure TFrmLineIntegPeriods.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  RefreshPeriodsxTimeLimits;
  FillLists;
  FillLipTimes;
end;

procedure TFrmLineIntegPeriods.ButtonAddDelClick(Sender: TObject);
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

procedure TFrmLineIntegPeriods.AddTimeLimit(LitID: Integer);
begin
  dmSys1.cdsLineIntegPeriodsxTimeLimits.Insert;
  dmSys1.cdsLineIntegPeriodsxTimeLimits.FieldByName( 'LIP_ID' ).Value := dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_ID' ).AsInteger;
  dmSys1.cdsLineIntegPeriodsxTimeLimits.FieldByName( 'LIT_ID' ).Value := LitID;
  dmSys1.cdsLineIntegPeriodsxTimeLimits.Post;
end;

procedure TFrmLineIntegPeriods.RemTimeLimit(LitID: Integer);
begin
  If dmSys1.cdsLineIntegPeriodsxTimeLimits.Locate( 'LIT_ID', LitID, [loCaseInsensitive] ) Then
    dmSys1.cdsLineIntegPeriodsxTimeLimits.Delete;
end;

procedure TFrmLineIntegPeriods.actTimeLimitEditExecute(Sender: TObject);
begin
  inherited;
  EnableTimeLimitsEdit( True );
  lsbDisp.SetFocus;
end;

procedure TFrmLineIntegPeriods.EnableTimeLimitsEdit(bEnabled: Boolean);
begin
  tbTimeLimitEdit.Enabled    := Not bEnabled;
  btnAdd.Enabled             := bEnabled;
  btnAddAll.Enabled          := bEnabled;
  btnDel.Enabled             := bEnabled;
  btnDelAll.Enabled          := bEnabled;
  btnTimeLimitOk.Visible     := bEnabled;
  btnTimeLimitCancel.Visible := bEnabled;
  If bEnabled Then
    SetActions( [], False, Self, t_form_objects )
  Else
    SetActions( [actApplyUpdates, actCancel], True, Self, t_form_objects );
end;

procedure TFrmLineIntegPeriods.ButtonTimeLimitsOkCancelClick(Sender: TObject);
begin
//  inherited;
  Case ( Sender As TBitBtn ).Tag Of
    // Ok
    3470: Begin
        SaveTimeLimits;
        EnableTimeLimitsEdit( False );
       End;
    // Cancel
    3471: Begin
        FillLists;
        EnableTimeLimitsEdit( False );
       End
  End;
end;

procedure TFrmLineIntegPeriods.SaveTimeLimits;
Var
  i: Integer;
begin

  While Not dmSys1.cdsLineIntegPeriodsxTimeLimits.Eof Do
    RemTimeLimit( dmSys1.cdsLineIntegPeriodsxTimeLimits.FieldByName( 'LIT_ID' ).AsInteger );

  For i := 0 To lsbSel.Count - 1 Do Begin
    AddTimeLimit( Integer( lsbSel.Items.Objects[ i ] ) );
  End;

  FillLists;
end;

procedure TFrmLineIntegPeriods.RefreshPeriodsxTimeLimits;
begin
  If dmSys1.cdsLineIntegPeriodsxTimeLimits.Active Then
    dmSys1.cdsLineIntegPeriodsxTimeLimits.Close;

  dmSys1.cdsLineIntegPeriodsxTimeLimits.Params.ParamByName( 'LIP_ID' ).AsString := dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_ID' ).AsString;
  dmSys1.cdsLineIntegPeriodsxTimeLimits.Open;
end;

procedure TFrmLineIntegPeriods.FillLipTimes;
begin
  edtLipStartTime.DateTime := dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_STARTTIME' ).AsDateTime;
  edtLipEndTime.DateTime   := dmSys1.cdsLineIntegPeriods.FieldByName( 'LIP_ENDTIME'   ).AsDateTime;
end;

procedure TFrmLineIntegPeriods.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  pcBaseCadastroChange( Nil );
end;

end.
