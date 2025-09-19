unit uFrmTransportProvidersXInfoParameters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxLookup, Mask, DBCtrls, IniFiles;

type
  TFrmTransportProvidersXInfoParameters = class(TFrmBaseSys)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtConCodigo: TEdit;
    edtConStatus: TEdit;
    edtConTransportProviders: TEdit;
    edtConParameters: TEdit;
    gbManutencaoHeader: TGroupBox;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    dbEdEmpresas: TRxDBLookupCombo;
    dbEdParameters: TRxDBLookupCombo;
    dbEdCodigo: TDBEdit;
    dbEdStatus: TDBEdit;
    gbManutencaoFooter: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    Spark_Conf : TIniFile;
    Prj_Nbr : String;
  public
    { Public declarations }
  end;

var
  FrmTransportProvidersXInfoParameters: TFrmTransportProvidersXInfoParameters;

implementation

uses uDmSys1, uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmBaseCadastro, uFrmBase0;
{$R *.dfm}

procedure TFrmTransportProvidersXInfoParameters.FormCreate(Sender: TObject);
  function GetValueSP(str : String) : String;
     Var NewValue : String; I : Integer;
    Begin
       I := Pos('$',Str);
       NewValue := Copy(Str, I+1, Length(Str)-I);
       Result := NewValue;
    End;

var
 systemDir  : String;
 buffer     : array[0..144] of Char;
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsTransportProvidersXInfoParameters;
  GetSystemDirectory(Buffer,144);
  systemDir  := StrPas(Buffer);
  Spark_Conf := TIniFile.Create(systemDir+'\Spark_Conf.ini');

  DmSys.cdsGeral.Close;
  DmSys.cdsGeral.CommandText := 'Select SP_VALUE From SystemParameters Where SP_CODE = ''APPCODE'' ';
  DmSys.cdsGeral.Open;

  if DmSys.cdsGeral.Fields.Fields[0].Value = Null
    then Prj_Nbr := '000'
    else Prj_Nbr := GetValueSP(DmSys.cdsGeral.Fields.Fields[0].Value);

end;

procedure TFrmTransportProvidersXInfoParameters.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys1.cdsTransportProvidersXInfoParameters, DmSys.cdsTransportProviders, DmSys1.cdsInfoParameters]);
end;

procedure TFrmTransportProvidersXInfoParameters.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys1.cdsTransportProvidersXInfoParameters]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmTransportProvidersXInfoParameters := Nil;
end;

procedure TFrmTransportProvidersXInfoParameters.pcBaseCadastroChange(
  Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmTransportProvidersXInfoParameters, t_form_objects);
      gbManutencaoHeader.Enabled := False;
     End
  Else
    Begin
      SetStatusPanels(True);
      SetActions([actFilter, actDelete, actRefresh], True, FrmTransportProvidersXInfoParameters, t_form_objects);
      gbManutencaoHeader.Enabled := True;
    End;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmTransportProvidersXInfoParameters.actEditExecute(
  Sender: TObject);
begin
  inherited;
  ActionEditSys(DmSys1.cdsTransportProvidersXInfoParameters);
  SetActions([], False, FrmTransportProvidersXInfoParameters, t_form_objects);
  SetActions([actApplyUpdates, actCancel], True, FrmTransportProvidersXInfoParameters, t_form_objects);
  gbManutencaoHeader.Enabled := True;
  dbEdCodigo.SetFocus;
end;

procedure TFrmTransportProvidersXInfoParameters.actInsertExecute(
  Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsTransportProvidersXInfoParameters);
  SetActions([], False, FrmTransportProvidersXInfoParameters, t_form_objects);
  SetActions([actApplyUpdates, actCancel], True, FrmTransportProvidersXInfoParameters, t_form_objects);
  gbManutencaoHeader.Enabled := True;
  dbEdCodigo.SetFocus;
end;

procedure TFrmTransportProvidersXInfoParameters.actDeleteExecute(
  Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
      with DmSys1 do
        Begin
         cdsTransportProvidersXInfoParameters.Edit;
         cdsTransportProvidersXInfoParameters.FieldByName('TPXIP_STATUS').AsString := 'I';
         cdsTransportProvidersXInfoParameters.Post;
         cdsTransportProvidersXInfoParameters.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
      FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmTransportProvidersXInfoParameters.actApplyUpdatesExecute(
  Sender: TObject);
var
  StrSQL : String;
begin
  inherited;
  StrSQL := '';
  if  Status = stConsult then
    begin

      if (DmSys1.cdsTransportProvidersXInfoParameters.State = dsInsert) then
      begin

        if (dbEdEmpresas.KeyValue = Null) or (dbEdParameters.KeyValue = Null) then begin

          DmSys1.cdsTransportProvidersXInfoParameters.Cancel;
          SetActions([], True, FrmTransportProvidersXInfoParameters, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmTransportProvidersXInfoParameters, t_form_objects);
          actRefresh.Execute;
          pcBaseCadastro.ActivePageIndex := 0;
          FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
          Exit;

        end;

        StrSQL := 'SELECT * FROM TRANSPORTPROVIDERSXINFOPARAM WHERE TP_ID = :TP_ID AND IP_ID = :IP_ID ORDER BY TP_ID, TPXIP_ID';
        DmSys.cdsGeral.Close;
        DmSys.cdsGeral.CommandText                          := StrSQL;
        DmSys.cdsGeral.Params.ParamByName('TP_ID').AsString := Trim(dbEdEmpresas.KeyValue);
        DmSys.cdsGeral.Params.ParamByName('IP_ID').AsString := Trim(dbEdParameters.KeyValue);
        DmSys.cdsGeral.Open;

        if DmSys.cdsGeral.RecordCount = 0 then begin

          with DmSys1, DmSys do begin
            StrSQL := 'SELECT * FROM TRANSPORTPROVIDERSXINFOPARAM WHERE TP_ID = -1 ORDER BY TP_ID, TPXIP_ID';
            cdsGeral.Close;
            cdsGeral.CommandText := StrSQL;
            cdsGeral.Open;
            cdsGeral.Append;
            cdsGeral.FieldByName('TPXIP_ID').AsInteger       := StrToInt(dbEdCodigo.Text);
            cdsGeral.FieldByName('TP_ID').AsInteger          := dbEdEmpresas.KeyValue;
            cdsGeral.FieldByName('IP_ID').AsInteger          := dbEdParameters.KeyValue;
            cdsGeral.FieldByName('TPXIP_STATUS').AsString    := 'A';
            cdsGeral.FieldByName('TPXIP_REGDATE').AsDateTime := Now;
            cdsGeral.FieldByName('TPXIP_REGUSER').AsString   := dmConexao.SystemUser_Str;
            cdsGeral.Post;
            cdsGeral.ApplyUpdates(-1);
            cdsTransportProvidersXInfoParameters.Cancel;
            SetActions([], True, FrmTransportProvidersXInfoParameters, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmTransportProvidersXInfoParameters, t_form_objects);
            actRefresh.Execute;
            pcBaseCadastro.ActivePageIndex := 0;
            FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
          end;
        end
        else begin

          DmSys1.cdsTransportProvidersXInfoParameters.Cancel;
          SetActions([], True, FrmTransportProvidersXInfoParameters, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmTransportProvidersXInfoParameters, t_form_objects);
          actRefresh.Execute;
          pcBaseCadastro.ActivePageIndex := 0;
          FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
          Exit;

        end;
      end;
    end;

    if DmSys1.cdsTransportProvidersXInfoParameters.State = dsEdit then
    begin
      if ApplyTablesSys([dbEdCodigo, dbEdStatus, dbEdEmpresas, dbEdParameters], [DmSys1.cdsTransportProvidersXInfoParameters]) then
      begin
        SetActions([], True, FrmTransportProvidersXInfoParameters, t_form_objects);
        SetActions([actApplyUpdates, actCancel], False, FrmTransportProvidersXInfoParameters, t_form_objects);
        actRefresh.Execute;
      end;
    end;
end;

procedure TFrmTransportProvidersXInfoParameters.actCancelExecute(
  Sender: TObject);
begin
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
      DmSys1.cdsTransportProvidersXInfoParameters.Cancel;
      SetActions([], True, FrmTransportProvidersXInfoParameters, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, FrmTransportProvidersXInfoParameters, t_form_objects);
      pcBaseCadastro.ActivePageIndex := 0;
      Status := stConsult;
      FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmTransportProvidersXInfoParameters.actFilterExecute(
  Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere   := '';

     If Trim(edtConCodigo.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TPXIP_ID LIKE ' + QuotedStr(Trim(edtConCodigo.Text)) + ' AND ';
       end;

     If Trim(edtConStatus.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TPXIP_STATUS LIKE ' + QuotedStr('%'+Trim(edtConStatus.Text)+'%') + ' AND ';
       end;


     If Trim(edtConTransportProviders.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TP_DESC LIKE ' + QuotedStr('%'+Trim(edtConTransportProviders.Text)+'%') + ' AND ';
       end;

     If Trim(edtConParameters.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' IP_DESC LIKE ' + QuotedStr('%'+Trim(edtConParameters.Text)+'%') + ' AND ';
       end;

    {Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' EL_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' EL_STATUS = ' + QuotedStr('I') + ' AND ';
           End;
      End;} //Case...

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
      cdsTransportProvidersXInfoParameters.Close;
      cdsTransportProvidersXInfoParameters.CommandText :=
      ' SELECT TPXIP.*, IP.IP_DESC, TP.TP_DESC, TPXIP.TPXIP_STATUS AS STATUS_ID '+
      '   FROM TRANSPORTPROVIDERSXINFOPARAM TPXIP                               '+
      '  INNER JOIN TRANSPORTPROVIDERS TP ON (TP.TP_ID = TPXIP.TP_ID)           '+
      '  INNER JOIN INFOPARAMETERS IP ON (IP.IP_ID = TPXIP.IP_ID) '+ strWhere    +
      '  ORDER BY TP_DESC, TPXIP_ID';
      cdsTransportProvidersXInfoParameters.Open;
      FrmSparksysMain.stMain.Panels[3].Text := IntToStr(cdsTransportProvidersXInfoParameters.RecordCount) + ' Registro(s)';
    end;
end;

procedure TFrmTransportProvidersXInfoParameters.actRefreshExecute(
  Sender: TObject);
begin
  inherited;
  with DmSys1 do
    begin
      cdsTransportProvidersXInfoParameters.Close;
      cdsTransportProvidersXInfoParameters.CommandText :=
      ' SELECT TPXIP.*, IP.IP_DESC, TP.TP_DESC, TPXIP.TPXIP_STATUS AS STATUS_ID '+
      '   FROM TRANSPORTPROVIDERSXINFOPARAM TPXIP                               '+
      '  INNER JOIN TRANSPORTPROVIDERS TP ON (TP.TP_ID = TPXIP.TP_ID)           '+
      '  INNER JOIN INFOPARAMETERS IP ON (IP.IP_ID = TPXIP.IP_ID)               '+
      '  ORDER BY TP_DESC, TPXIP_ID';
      cdsTransportProvidersXInfoParameters.Open;
      FrmSparksysMain.stMain.Panels[3].Text := IntToStr(cdsTransportProvidersXInfoParameters.RecordCount) + ' Registro(s)';
    end;
end;

end.

