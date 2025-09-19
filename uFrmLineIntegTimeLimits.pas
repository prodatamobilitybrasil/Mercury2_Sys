unit uFrmLineIntegTimeLimits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RXSpin, DBCtrls, Mask, RxDBComb, Math,
  uGeralFunctions, uConst;

type
  TfrmLineIntegTimeLimits = class(TFrmBaseSys)
    edtFilterDescricao: TEdit;
    lblFilterDescricao: TLabel;
    lblFilterBinId: TLabel;
    cboFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    edtDescricao: TDBEdit;
    edtBinId: TDBEdit;
    cboStatus: TRxDBComboBox;
    lblDescricao: TLabel;
    lblBinId: TLabel;
    lblStatus: TLabel;
    udBinId: TUpDown;
    edtFilterBinId: TEdit;
    udFilterBinId: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFilterExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure UpDownClick(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLineIntegTimeLimits: TfrmLineIntegTimeLimits;

implementation

uses uDmSys1, AppSparkSysMain, uDmConexao, uDmSys;

{$R *.dfm}

procedure TfrmLineIntegTimeLimits.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys1.cdsLineIntegTimeLimits;
end;

procedure TfrmLineIntegTimeLimits.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys( [ dmSys1.cdsLineIntegTimeLimits ] );
  FrmSparksysMain.stMain.Panels[3].Text := IntToStr(dmSys1.cdsLineIntegTimeLimits.RecordCount ) + ' Registro(s)';
end;

procedure TfrmLineIntegTimeLimits.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys( [ dmSys1.cdsLineIntegTimeLimits ] );
  frmLineIntegTimeLimits := nil;
  Action := caFree;
end;

procedure TfrmLineIntegTimeLimits.actFilterExecute(Sender: TObject);
var
  strWhere:string;
begin
  inherited;
  strwhere:='';

  strWhere := strWhere + ' LIT_DESC LIKE ''' + edtFilterDescricao.Text + '%'' AND ';

  If edtFilterBinId.Text <> '0' Then
    strWhere := strWhere + ' LIT_BINID = ' + edtFilterBinID.Text + ' AND ';

  If cboFilterStatus.ItemIndex <> 2 Then
    strWhere := strWhere + ' LIT_STATUS = ''' + cboFilterStatus.Text[1] + ''' AND ';

  strWhere := Copy( strWhere, 0, Length( strWhere ) - 4 );

  with dmSys1 do
  Begin
    cdsLineIntegTimeLimits.Close;
    cdsLineIntegTimeLimits.CommandText := 'SELECT * FROM LINEINTEGTIMELIMITS WHERE ' + strWhere;
    cdsLineIntegTimeLimits.Open;
  end;

   FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmSys1.cdsLineIntegTimeLimits.RecordCount ) + ' Registro(s)';
end;

procedure TfrmLineIntegTimeLimits.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsLineIntegTimeLimits);
  SetActions([], False, frmLineIntegTimeLimits, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineIntegTimeLimits, t_form_objects);

  edtDescricao.SetFocus;
end;

procedure TfrmLineIntegTimeLimits.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, frmLineIntegTimeLimits, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmLineIntegTimeLimits, t_form_objects);
  edtDescricao.SetFocus;
end;

procedure TfrmLineIntegTimeLimits.actApplyUpdatesExecute(Sender: TObject);
Var
  iLIT_ID: Integer;
begin
  inherited;
  If Status = stConsult then
  Begin

    If dmSys1.cdsLineIntegTimeLimits.State = dsInsert Then Begin
      DmSys.cdsGeral.CommandText := 'SELECT MAX( LIT_ID ) AS MAX FROM LINEINTEGTIMELIMITS';
      DmSys.cdsGeral.Open;

      If DmSys.cdsGeral.FieldByName( 'MAX' ).AsString <> '' Then
        iLIT_ID := ( DmSys.cdsGeral.FieldByName( 'MAX' ).AsInteger + 1 )
      Else
        iLIT_ID := 1;

      DmSys.cdsGeral.Close;

      dmSys1.cdsLineIntegTimeLimits.FieldByName( 'LIT_ID' ).Value := iLIT_ID;
    End;

    if ApplyTablesSys( [ edtDescricao ], [ dmSys1.cdsLineIntegTimeLimits ] ) then
       Begin
         SetActions( [], True, frmLineIntegTimeLimits, t_form_objects);
         SetActions( [ actApplyUpdates, actCancel ], False, frmLineIntegTimeLimits, t_form_objects);
         tbtnRefresh.Click;
       end;
  end;
end;

procedure TfrmLineIntegTimeLimits.actCancelExecute(Sender: TObject);
begin
  //inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsLineIntegTimeLimits.Cancel;
    SetActions([], True, frmLineIntegTimeLimits, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, frmLineIntegTimeLimits, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text := GetState(status);
  end;

end;

procedure TfrmLineIntegTimeLimits.actDeleteExecute(Sender: TObject);
begin
  //inherited;
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsLineIntegTimeLimits.Edit;
         cdsLineIntegTimeLimits.FieldByName('LIT_STATUS').AsString := 'I';
         cdsLineIntegTimeLimits.Post;
         cdsLineIntegTimeLimits.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TfrmLineIntegTimeLimits.UpDownClick(Sender: TObject;
  Button: TUDBtnType);
Var
  EdtValue: Integer;
begin
  If Sender = udBinId Then
    EdtValue := StrToInt( edtBinId.Text )
  Else If Sender = udFilterBinId Then
    EdtValue := StrToInt( edtFilterBinId.Text );

  Case Button Of
    btNext: Begin
        If EdtValue = 0 Then
          EdtValue := 1
        Else
          EdtValue := EdtValue * 2;
      End;
    btPrev: Begin
        If EdtValue <= 1 Then
          EdtValue := 0
        Else
          EdtValue := EdtValue div 2;
      End;
  End;

  If Sender = udBinId Then Begin
    If ( dtsMaster.DataSet.State In [dsInsert, dsEdit] ) Then
      edtBinId.Text := IntToStr( EdtValue );
  End Else If Sender = udFilterBinId Then
    edtFilterBinId.Text := IntToStr( EdtValue );
end;

end.
