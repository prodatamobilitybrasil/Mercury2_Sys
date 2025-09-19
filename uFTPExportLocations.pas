unit uFTPExportLocations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, IniFiles, Mask, DBCtrls;

type
  TFrmFTPExportLocations = class(TFrmBaseSys)
    gbManutencaoHeader: TGroupBox;
    gbManutencaoFooter: TGroupBox;
    dbCodigo: TDBEdit;
    Label1: TLabel;
    dbEnderecoFTP: TDBEdit;
    Label2: TLabel;
    dbDiretorioFTP: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbLogin: TDBEdit;
    Label5: TLabel;
    dbSenha: TDBEdit;
    Label6: TLabel;
    dbPeriodo: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edConsulCodigo: TEdit;
    edConsulEndFTP: TEdit;
    edConsulDirFTP: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
  private
    Spark_Conf : TIniFile;
    PathExportLocations  : String;
    Prj_Nbr : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFTPExportLocations: TFrmFTPExportLocations;

implementation

 Uses uDmSys1, uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmFTPExportLocations.FormCreate(Sender: TObject);
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
  dtsMaster.DataSet := dmSys1.cdsFTPExportLocations;
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

procedure TFrmFTPExportLocations.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([dmSys1.cdsFTPExportLocations]);
end;

procedure TFrmFTPExportLocations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsFTPExportLocations]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmFTPExportLocations := Nil;
end;

procedure TFrmFTPExportLocations.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmFTPExportLocations, t_form_objects);
      gbManutencaoHeader.Enabled := False;
     End
  Else
    Begin
      SetStatusPanels(True);
      SetActions([actFilter, actDelete, actRefresh], True, FrmFTPExportLocations, t_form_objects);
      gbManutencaoHeader.Enabled := True;
    End;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmFTPExportLocations.actEditExecute(Sender: TObject);
begin
  inherited;
  ActionEditSys(dmSys1.cdsFTPExportLocations);
  SetActions([], False, FrmFTPExportLocations, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmFTPExportLocations, t_form_objects);
  gbManutencaoHeader.Enabled := True;
  dbCodigo.SetFocus;
end;

procedure TFrmFTPExportLocations.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsFTPExportLocations);
  SetActions([], False, FrmFTPExportLocations, t_form_objects);
  SetActions([actApplyUpdates, actCancel], True, FrmFTPExportLocations, t_form_objects);
  gbManutencaoHeader.Enabled := True;
  dbCodigo.SetFocus;
end;

procedure TFrmFTPExportLocations.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys1 do
        Begin
         cdsFTPExportLocations.Edit;
         cdsFTPExportLocations.FieldByName('FTPS_STATUS').AsString := 'I';
         cdsFTPExportLocations.Post;
         cdsFTPExportLocations.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmFTPExportLocations.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     (*IF (dtsMaster.DataSet.State = dsInsert) Then BeforePost;
     If ApplyTablesSys([cbCodigo, dbGaragem, dbEmpresa, dbPath], [DmSys1.cdsExportLocations]) Then
         begin
          SetActions([], True, FrmExportLocations, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmExportLocations, t_form_objects);
          actRefresh.Execute;
         end;*)

      {Verificando se Código está Cadastrado}
      if (dmsys1.cdsFTPExportLocations.State = dsInsert) then
      Begin
       {if (cbCodigo.Text <> '') then
        Begin
          dmSys.cdsGeral.Close;
          dmSys.cdsGeral.CommandText:='Select * from ExportLocations where EL_Code = ' + Quotedstr(cbCodigo.Text);
          DmSys.cdsGeral.Open;

          if (DmSys.cdsGeral.RecordCount > 0) then
          Begin
            DisplayMsg(FrmFTPExportLocations.t_form_objects, '%T', [3168], [#13], mtInformation, [mbOK]);
            exit;
          end;
        end;}
      end;


     If ApplyTablesSys([dbCodigo, dbEnderecoFTP], [DmSys1.cdsFTPExportLocations]) Then
     begin
       SetActions([], True, FrmFTPExportLocations, t_form_objects);
       SetActions([actApplyUpdates, actCancel], False, FrmFTPExportLocations, t_form_objects);
       actRefresh.Execute;
     end;
    END;
end;

procedure TFrmFTPExportLocations.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsFTPExportLocations.Cancel;
     SetActions([], True, FrmFTPExportLocations, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmFTPExportLocations, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     //dmSys1.cdsDepotsXTransportProviders.Close;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

end;

procedure TFrmFTPExportLocations.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edConsulCodigo.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' FTPS_CODE LIKE ' + QuotedStr(Trim(edConsulCodigo.Text)) + ' AND ';
       end;

     If Trim(edConsulEndFTP.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' FTPS_ADDRESS LIKE ' + QuotedStr('%'+Trim(edConsulEndFTP.Text)+'%') + ' AND ';
       end;


     If Trim(edConsulDirFTP.Text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' FTPS_DIR LIKE ' + QuotedStr('%'+Trim(edConsulDirFTP.Text)+'%') + ' AND ';
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
      cdsFTPExportLocations.Close;
      cdsFTPExportLocations.CommandText :=
                        'SELECT FTPS.*, FTPS_STATUS AS STATUS_ID '+
                        '  FROM FTPSERVER FTPS '+ strWhere +
                        ' ORDER BY FTPS_CODE ';
      cdsFTPExportLocations.Open;

      FrmSparksysMain.stMain.Panels[3].Text := intToStr(cdsFTPExportLocations.RecordCount) + ' Registro(s)';
    end
end;

end.

