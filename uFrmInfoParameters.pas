unit uFrmInfoParameters;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, IniFiles, RxDBComb;

type
  TFrmInfoParameters = class(TFrmBaseSys)
    edtConCodigo: TEdit;
    edtConBinary: TEdit;
    edtConDescricao: TEdit;
    edtConComment: TEdit;
    edtConStatus: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    gbManutencao: TGroupBox;
    dbEdCodigo: TDBEdit;
    dbEdCodigoBin: TDBEdit;
    dbEdDesc: TDBEdit;
    dbEdComent: TDBEdit;
    gbGridManutencao: TGroupBox;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    cbbStatus: TRxDBComboBox;
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
  private
    { Private declarations }
    Spark_Conf : TIniFile;
    Prj_Nbr : String;
  public
    { Public declarations }
  end;

var
  FrmInfoParameters: TFrmInfoParameters;

implementation

uses uDmSys1, uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmInfoParameters.FormCreate(Sender: TObject);
  Function GetValueSP(str : String) : String;
     Var NewValue : String; I : Integer;
    Begin
       I := Pos('$',Str);
       NewValue := Copy(Str, I+1, Length(Str)-I);
       Result := NewValue;
    End;

var
 systemDir  : String;
 buffer      : array[0..144] of Char;
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsInfoParameters;
  GetSystemDirectory(Buffer,144);
  systemDir := StrPas(Buffer);
  Spark_Conf := TIniFile.Create(systemDir+'\Spark_Conf.ini');

  DmSys.cdsGeral.Close;
  DmSys.cdsGeral.CommandText := 'Select SP_VALUE From SystemParameters Where SP_CODE = ''APPCODE'' ';
  DmSys.cdsGeral.Open;

  if DmSys.cdsGeral.Fields.Fields[0].Value = Null
    then Prj_Nbr := '000'
    else Prj_Nbr := GetValueSP(DmSys.cdsGeral.Fields.Fields[0].Value);

end;

procedure TFrmInfoParameters.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsInfoParameters]);
end;

procedure TFrmInfoParameters.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsInfoParameters]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmInfoParameters := Nil;
end;

procedure TFrmInfoParameters.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmInfoParameters, t_form_objects);
      gbManutencao.Enabled := False;
     End
  Else
    Begin
      SetStatusPanels(True);
      SetActions([actFilter, actDelete, actRefresh], True, FrmInfoParameters, t_form_objects);
      gbManutencao.Enabled := True;
    End;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmInfoParameters.actEditExecute(Sender: TObject);
begin
  inherited;
  ActionEditSys(dmSys1.cdsInfoParameters);
  SetActions([], False, FrmInfoParameters, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmInfoParameters, t_form_objects);
  gbManutencao.Enabled := True;
  dbEdCodigo.SetFocus;
end;

procedure TFrmInfoParameters.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsInfoParameters);
  SetActions([], False, FrmInfoParameters, t_form_objects);
  SetActions([actApplyUpdates, actCancel], True, FrmInfoParameters, t_form_objects);
  gbManutencao.Enabled := True;
  dbEdCodigo.SetFocus;
end;

procedure TFrmInfoParameters.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys1 do
        Begin
         cdsInfoParameters.Edit;
         cdsInfoParameters.FieldByName('IP_STATUS').AsString := 'I';
         cdsInfoParameters.Post;
         cdsInfoParameters.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end;
end;

procedure TFrmInfoParameters.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
  If  Status = stConsult Then
    BEGIN
      if (dmsys1.cdsInfoParameters.State = dsInsert) then
      Begin

      end;

      If ApplyTablesSys([dbEdCodigo, dbEdDesc, dbEdCodigoBin, dbEdComent, cbbStatus], [DmSys1.cdsInfoParameters]) Then
      begin
        SetActions([], True, FrmInfoParameters, t_form_objects);
        SetActions([actApplyUpdates, actCancel], False, FrmInfoParameters, t_form_objects);
        actRefresh.Execute;
      end;
    END;
end;

procedure TFrmInfoParameters.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsInfoParameters.Cancel;
     SetActions([], True, FrmInfoParameters, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmInfoParameters, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmInfoParameters.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' IP_ID LIKE ' + QuotedStr(Trim(edtConCodigo.Text)) + ' AND ';
       end;

     If Trim(edtConBinary.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' IP_BINID LIKE ' + QuotedStr('%'+Trim(edtConBinary.Text)+'%') + ' AND ';
       end;


     If Trim(edtConDescricao.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' IP_DESC LIKE ' + QuotedStr('%'+Trim(edtConDescricao.Text)+'%') + ' AND ';
       end;

     If Trim(edtConComment.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' IP_COMMENT LIKE ' + QuotedStr('%'+Trim(edtConComment.Text)+'%') + ' AND ';
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
      cdsInfoParameters.Close;
      cdsInfoParameters.CommandText := 'SELECT IP.*, IP.IP_STATUS AS STATUS_ID '+
                                       '  FROM INFOPARAMETERS IP '+ strWhere +
                                       ' ORDER BY IP_ID ';
      cdsInfoParameters.Open;

      FrmSparksysMain.stMain.Panels[3].Text := IntToStr(cdsInfoParameters.RecordCount) + ' Registro(s)';
    end
end;

end.

