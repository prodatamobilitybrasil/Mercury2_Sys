unit uFrmRemotePrinters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb;

type
  TFrmRemotePrinters = class(TFrmBaseSys)
    edtRPDescShort: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbRPDescShort: TDBEdit;
    dbRPDescLong: TDBEdit;
    edtRPDescLong: TEdit;
    cmbStatus: TRxDBComboBox;
    LStatus: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetCtr;
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRemotePrinters: TFrmRemotePrinters;

implementation

uses uDmSys1, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao;

{$R *.dfm}

procedure TFrmRemotePrinters.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsRemotePrinters]);
  FrmRemotePrinters := nil;
end;

procedure TFrmRemotePrinters.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsRemotePrinters);
  SetActions([], False, FrmRemotePrinters, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmRemotePrinters, t_form_objects);
  SetCtr;
  dbRPDescShort.SetFocus;
end;

procedure TFrmRemotePrinters.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsRemotePrinters]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsRemotePrinters.RecordCount ) + ' Registro(s)';
end;

procedure TFrmRemotePrinters.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsRemotePrinters;
end;

procedure TFrmRemotePrinters.SetCtr;
begin
  dbRPDescShort.Enabled := (Status = stInsert);
end;

procedure TFrmRemotePrinters.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmRemotePrinters, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmRemotePrinters, t_form_objects);
  dbRPDescShort.SetFocus;
end;

procedure TFrmRemotePrinters.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If Status = stConsult then
  Begin
    if ApplyTablesSys([dbRPDescShort, dbRPDescLong, cmbStatus], [dmSys1.cdsRemotePrinters]) then
       Begin
         SetActions([], True, FrmRemotePrinters, t_form_objects);
         SetActions([actApplyUpdates, actCancel], False, FrmRemotePrinters, t_form_objects);
         tbtnRefresh.Click;
       end;
  end;


end;

procedure TFrmRemotePrinters.actCancelExecute(Sender: TObject);
begin
//  inherited;

  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsRemotePrinters.Cancel;
    SetActions([], True, FrmRemotePrinters, t_form_objects);
    SetActions([actApplyUpdates, actCancel], False, FrmRemotePrinters, t_form_objects);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
  end;

end;

procedure TFrmRemotePrinters.actDeleteExecute(Sender: TObject);
begin
 // inherited;
 If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys1 do
        Begin
         cdsRemotePrinters.Edit;
         cdsRemotePrinters.FieldByName('RP_STATUS').AsString := 'I';
         cdsRemotePrinters.Post;
         cdsRemotePrinters.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;
procedure TFrmRemotePrinters.actFilterExecute(Sender: TObject);
var
strwhere:string;
begin
  inherited;
  strwhere:='';

  if Trim(edtRPDescShort.Text) <> '' then
     if strwhere = '' then strwhere:=' where RP_DescShort LIKE ' + QuotedStr(Trim(edtRPDescShort.Text) + '%');

  if Trim(edtRPDescLong.Text) <> '' then
     if strwhere = '' then strwhere:=' where RP_DescLong LIKE ' + QuotedStr(Trim(edtRPDescLong.Text) + '%')
     else
     strwhere:= strwhere + ' and RP_DescLong LIKE ' + QuotedStr(Trim(edtRPDescLong.Text) + '%');

  With dmSys1 do
  Begin
    cdsRemotePrinters.Close;
    cdsRemotePrinters.CommandText:='SELECT RP.*, RP.RP_STATUS AS STATUS_ID FROM REMOTEPRINTERS RP' + strwhere + ' ORDER BY RP_DESCLONG';
    cdsRemotePrinters.Open;
  end;

  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmSys1.cdsRemotePrinters.RecordCount ) + ' Registro(s)';
end;

end.
