unit uFrmSparkSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseCadastro, Menus, DB, ActnList, ImgList, StdCtrls,
  ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, RxDBComb,
  RxLookup;

type
  TFrmSys = class(TFrmBaseCadastro)
    Label1: TLabel;
    edtLinha: TEdit;
    Label4: TLabel;
    dbLinhaDesc: TDBEdit;
    Label5: TLabel;
    dbDescShort: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Fl_Code: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    Label3: TLabel;
    lkFilterStatus: TComboBox;
    lblFilterStatus: TLabel;
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure pcBaseCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure actFilterExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
  private
    function  CardLineMtConsists: Boolean;
    procedure ActionInsert;
    procedure SetActions(act: array of TAction;Enabled: Boolean);
    procedure SetStatusPanels(status: Boolean);
    { Private declarations }
  public
    procedure CloseTables; override;
    { Public declarations }
  end;

var
  FrmSys: TFrmSys;

implementation

uses uDmSys, AppSparkSysMain, uGeralFunctions, uConst, uDmBase;

{$R *.dfm}

procedure TFrmSys.FormShow(Sender: TObject);
begin
  inherited;
  With DmSys do
   begin
    cdsLineMt.Open;
    cdsFarelevels.Open;
    cdsLineTypes.Open;
    cdsLocations.Open;
   end;
  tbtnFiltrar.Enabled      := True;
  actApplyUpdates.Enabled  := False;
  actCancel.Enabled        := False;
end;

procedure TFrmSys.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsert;
  FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
  SetStatusPanels(True);
  SetActions([], False);  
  SetActions([actApplyUpdates, actCancel], true);
end;

procedure TFrmSys.ActionInsert;
Begin
  SetActions([actFirst, actPrior, actNext, actLast], False);

  With DmSys do
    Begin
      cdsLineMt.Append;
      cdsLineMt.FieldBYName('LM_STOPQTY').AsInteger    := 0;
      cdsLineMt.FieldBYName('LM_VEHUSED').AsInteger    := 0;
      cdsLineMt.FieldBYName('LM_ZONALFLAG').AsInteger  := 0;
      cdsLineMt.FieldByName('LOC_CODE').AsString       := '';
      cdsLineMt.FieldByName('LM_STATUS').AsString      := 'I';
    End;
  pcBaseCadastro.ActivePageIndex := 1;
End;

procedure TFrmSys.SetActions(act: array of TAction;Enabled: Boolean);
var i,j : Integer;
begin
  if FrmSys <> nil then
    begin
      if High(act) = -1 then
        begin
          for i := 0 to FrmSys.ComponentCount - 1  do
            if TAction(FrmSys.Components[i]).Tag = 10 then
               TAction(FrmSys.Components[i]).Enabled := Enabled;
          exit;
        end;
      i := 0;
      while i <= FrmSys.ComponentCount - 1  do
        begin
           j := 0;
           while j <= High(act) do
             begin
               if TAction(FrmSys.Components[i]) = act[j] then
                  TAction(FrmSys.Components[i]).Enabled := Enabled;
                inc(j);
             end;
           inc(i);
        end;
    end;
end;


procedure TFrmSys.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;
  if MessageDlg(cSave, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      IF NOT (CardLineMtConsists) Then
        Begin
          dmSys.cdsLineMt.ApplyUpdates(-1);
          pcBaseCadastro.ActivePageIndex := 0;
        End
      Else
        begin
          messageDlg('Campo obrigatório', mtError, [mbOk],0);
          dbLinhaDesc.setFocus;
        End;
        Status := Consult;
        SetActions([], True);
        SetActions([actApplyUpdates, actCancel], False);
        FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);        
    End;
end;

function TFrmSys.CardLineMtConsists: Boolean;
begin
  with DmSys, cdsLineMt  do
    begin
      Result := (FieldByName('LM_DESCSHORT').IsNull) OR
                (FieldByName('LM_DESCSHORT').IsNull);
    end;
end;

procedure TFrmSys.actEditExecute(Sender: TObject);
begin
  inherited;
  FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
  SetStatusPanels(True);
  SetActions([], False);
  SetActions([actApplyUpdates, actCancel], true);
end;

procedure TFrmSys.FormCreate(Sender: TObject);
begin
  inherited;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmSys.actDeleteExecute(Sender: TObject);
begin
//  inherited;
 if MessageDlg(cDelete, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

     with DmSys do
        Begin
         cdsLineMt.Edit;
         cdsLineMt.FieldByName('LM_STATUS').AsString := 'I';
         cdsLineMt.Post;
         cdsLineMt.ApplyUpdates(-1);
         cdsLineMt.Close;
         cdsLineMt.Open;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmSys.actCancelExecute(Sender: TObject);
begin
//  inherited;
  if MessageDlg(cCancel, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
     dmSys.cdsLineMt.Cancel;
     SetActions([], True);
     SetActions([actApplyUpdates, actCancel], False);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := Consult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

end;

procedure TFrmSys.pcBaseCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if (status = Insert) or (Status = Edit)  then
     AllowChange :=  False;
end;

procedure TFrmSys.actFilterExecute(Sender: TObject);
var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    strUt_Id : String;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edtLinha.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' LM_DESC LIKE ' + QuotedStr(edtLinha.Text + '%') + ' AND ';
       end;

     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LM_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' LM_STATUS = ' + QuotedStr('I') + ' AND ';
           End;
      End; //Case...

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
  if strWhere <> '' then
  with DmSys do
    begin
      cdsLineMT.Close;
      cdsLineMT.CommandText := 'SELECT '+ ccardLineMTSelect +' From lineMT ' + strWhere + 'ORDER BY LM_DESC';
      cdsLineMT.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( ConnBrkMaster.AppServer.Spark_Base.GetDBCount('LM_ID', 'FROM LINEMT', 'True', strWhere) ) + ' Registros';
    end
  else
    MessageDlg(cInformarMaisCampos, mtInformation, [mbOk], 0);

end;

procedure TFrmSys.SetStatusPanels(status: Boolean);
begin
tsBaseCadastroConsulta.Enabled := Status;
End;


procedure TFrmSys.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True);
    End;
end;

procedure TFrmSys.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  tbtnEdit.Click;
//  SetStatusPanels(true);
//  FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
//  Status := Edit;

end;

procedure TFrmSys.CloseTables;
Begin
 With DmSys do
  Begin
   cdsLineMt.Close;
   cdsFarelevels.Close;
   cdsLineTypes.Close;
   cdsLocations.Close;
  End;
End;

end.
