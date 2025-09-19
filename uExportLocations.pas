unit uExportLocations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, RxLookup,
  Buttons, IniFiles;


Const Path = 'C:\PRODATA\PRJ_%i\EOD\DEPOT_%g\CPY_%c\EOD_%e';

type
  TFrmExportLocations = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    pcSubApplications: TPageControl;
    dbEmpresa: TRxDBLookupCombo;
    Label3: TLabel;
    dbGaragem: TRxDBLookupCombo;
    Label2: TLabel;
    Label1: TLabel;
    gbDetail: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    rdbGaragemF: TRxDBLookupCombo;
    Label10: TLabel;
    rdbEmpresaF: TRxDBLookupCombo;
    cbCodigoF: TComboBox;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbPhone: TDBEdit;
    dbPath: TDBEdit;
    dbCardUsersStatus: TRxDBComboBox;
    dbLogon: TDBEdit;
    dbPass: TDBEdit;
    cbCodigo: TRxDBComboBox;
    procedure FormShow(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGaragemCloseUp(Sender: TObject);
    procedure dbEmpresaCloseUp(Sender: TObject);
    procedure RxDBComboBox1Change(Sender: TObject);
    procedure RxDBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure cbCodigoCloseUp(Sender: TObject);
    procedure cbCodigoFKeyPress(Sender: TObject; var Key: Char);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
     Spark_Conf : TIniFile;
     PathExportLocations  : String;
     ccardExportLocations : String;
     Prj_Nbr : String;
    procedure PreparaEdicao;
    Procedure BeforePost;
    function ReplaceStr (Text,oldstring,newstring:string):string;
    { Private declarations }
  public
    Procedure CarregaCombo(Garagem, Empresa : Integer);
    { Public declarations }
  end;

var
  FrmExportLocations: TFrmExportLocations;

implementation

 Uses uDmSys1, uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uDmConexao,
  uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmExportLocations.FormShow(Sender: TObject);
begin
  inherited;
//Colocar no uConst...
(*ccardExportLocations := 'EL.*, EL_STATUS AS STATUS_ID, TP.TP_DESC, DP.DP_DESC '+
                        'FROM EXPORTLOCATIONS EL '+
                        'INNER JOIN TRANSPORTPROVIDERS TP ON (TP.TP_ID = EL.TP_ID) '+
                        'INNER JOIN DEPOTS DP ON (DP.DP_ID = EL.DP_ID) '+
                        'WHERE EL_STATUS  = ''A''  AND TP.TP_STATUS = ''A'' AND '+
                        'DP.DP_STATUS  =  ''A'' ORDER BY EL_CODE ';*)


ccardExportLocations := 'EL.*, EL_STATUS AS STATUS_ID '+
                        'FROM EXPORTLOCATIONS EL '+
                        'WHERE EL_STATUS  = ''A'' ORDER BY EL_CODE ';

    //OpenTablesSys([dmSys1.cdsExportLocations, dmSys1.cdsDepots, DmSys.cdsTransportProviders]);
    OpenTablesSys([dmSys1.cdsExportLocations]);

    (*dmSys1.cdsDepotsXTransportProviders.Close;
    dmSys1.cdsDepotsXTransportProviders.Params.ParamByName('DP_ID').AsString := DmSys1.cdsExportLocations.fieldByName('DP_ID').AsString;
    dmSys1.cdsDepotsXTransportProviders.Open;
    CarregaCombo(dmSys1.cdsExportLocations.FieldByName('DP_ID').AsInteger,
                 dmSys1.cdsExportLocations.FieldByName('TP_ID').AsInteger);*)

//   FrmSparksysMain.stMain.Panels[3].Text := intToStr(dmSys.cdsPersonneltypesXValidatorfcts.RecordCount) + ' Registro(s)';
   
end;

Procedure TFrmExportLocations.CarregaCombo(Garagem, Empresa : Integer);
Begin
//dbGaragem.KeyValue := Garagem;
//dbEmpresa.KeyValue := Empresa;

cbCodigo.Enabled  := False;
//dbGaragem.Enabled := False;
//dbEmpresa.Enabled := False;
End;

procedure TFrmExportLocations.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
(*CarregaCombo(dmSys1.cdsExportLocations.FieldByName('DP_ID').AsInteger,
             dmSys1.cdsExportLocations.FieldByName('TP_ID').AsInteger);
gbDetail.Enabled := False;*)
end;

procedure TFrmExportLocations.PreparaEdicao;
Begin
  IF (cbCodigo.Text  <> '') (* and
     (dbGaragem.Text <> '') and
     (dbEmpresa.Text <> '')*) Then
     Begin
       dmSys.cdsGeral.Close;
       dmSys.cdsGeral.CommandText := 'SELECT * FROM EXPORTLOCATIONS WHERE EL_CODE = '+QuotedStr(cbCodigo.Text) (*+
                                     ' AND TP_ID = '+ InttoStr(dbEmpresa.KeyValue) +
                                     ' And DP_ID = '+ InttoStr(dbGaragem.KeyValue)*);

       dmSys.cdsGeral.Open;

      If dmSys.cdsGeral.RecordCount > 0 Then
         Begin
          dmSys1.cdsExportLocations.Cancel;
          //dmSys1.cdsExportLocations.Locate('EL_CODE;TP_ID;DP_ID', VarArrayOf([
          //cbCodigo.Text, dbEmpresa.KeyValue, dbGaragem.KeyValue]), [] );
          dmSys1.cdsExportLocations.Locate('EL_CODE', VarArrayOf([
          cbCodigo.Text, dbEmpresa.KeyValue, dbGaragem.KeyValue]), [] );
          dmSys1.cdsExportLocations.Edit;
         End
      Else
        Begin
          PathExportLocations := Spark_Conf.ReadString('SYS','PathExportLocations', '');
          PathExportLocations := ReplaceStr(PathExportLocations, '%i', Prj_Nbr);
          PathExportLocations := ReplaceStr(PathExportLocations, '%g', FormatFloat('000',dbGaragem.KeyValue));
          PathExportLocations := ReplaceStr(PathExportLocations, '%c', FormatFloat('000',dbEmpresa.KeyValue));
//          dbPath.Text := PathExportLocations;
          dmSys1.cdsExportLocations.FieldByName('EL_PATH').AsString := PathExportLocations;
        End;

       gbDetail.Enabled := True;
       dbPhone.SetFocus;
       cbCodigo.Enabled  := False;
       dbGaragem.Enabled := False;
       dbEmpresa.Enabled := False;
//       'C:\PRODATA\PRJ_%i\EOD\DEPOT_%g\CPY_%c\EOD_%e'

//       move(
     End;
End;

function TFrmExportLocations.ReplaceStr (Text,oldstring,newstring:string):string;
var atual, strtofind, originalstr:pchar;
NewText:string;
lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
  NewText:=Text;
  originalstr:=pchar(Text);
  strtofind:=pchar(oldstring);
  lenoldstring:=length(oldstring);
  lennewstring:=length(newstring);
  Atual:=StrPos(OriginalStr,StrtoFind);
  index:=0;
  while Atual<>nil do
  begin //Atual<>nil
  m:=Atual - OriginalStr - index + 1;
  Delete(NewText,m,lenoldstring);
  Insert(newstring,NewText,m);
  inc(index,lenoldstring-lennewstring);
  Atual:=StrPos(Atual+lenoldstring,StrtoFind);
  end; //Atual<>nil
  Result:=NewText;
end; //ReplaceStr

procedure TFrmExportLocations.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys1.cdsExportLocations);
  SetActions([], False, FrmExportLocations, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmExportLocations, t_form_objects);

  cbCodigo.ItemIndex := -1;
  //dbGaragem.KeyValue := -1;
  //dbEmpresa.KeyValue := -1;
  
  cbCodigo.Enabled  := True;
  //dbGaragem.Enabled := True;
  //dbEmpresa.Enabled := True;

  cbCodigo.SetFocus;
  gbDetail.Enabled := False;
end;

procedure TFrmExportLocations.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmExportLocations, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmExportLocations, t_form_objects);
  gbDetail.Enabled := True;
  dbPhone.SetFocus;
end;

Procedure TFrmExportLocations.BeforePost;
Begin
 (*  DmSys1.cdsExportLocations.FieldByName('TP_ID').AsInteger  := dbEmpresa.KeyValue;
   DmSys1.cdsExportLocations.FieldByName('DP_ID').AsInteger  := dbGaragem.KeyValue;
   DmSys1.cdsExportLocations.FieldByName('TP_DESC').AsString := dbEmpresa.Text;
   DmSys1.cdsExportLocations.FieldByName('DP_DESC').AsString := dbGaragem.Text; *)
End;

procedure TFrmExportLocations.actApplyUpdatesExecute(Sender: TObject);
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
      if (dmsys1.cdsExportLocations.State = dsInsert) then
      Begin
        if (cbCodigo.Text <> '') then
        Begin
          dmSys.cdsGeral.Close;
          dmSys.cdsGeral.CommandText:='Select * from ExportLocations where EL_Code = ' + Quotedstr(cbCodigo.Text);
          DmSys.cdsGeral.Open;

          if (DmSys.cdsGeral.RecordCount > 0) then
          Begin
            DisplayMsg(FrmExportLocations.t_form_objects, '%T', [3168], [#13], mtInformation, [mbOK]);
            exit;
          end;
        end;
      end;


     If ApplyTablesSys([cbCodigo, dbPath], [DmSys1.cdsExportLocations]) Then
     begin
       SetActions([], True, FrmExportLocations, t_form_objects);
       SetActions([actApplyUpdates, actCancel], False, FrmExportLocations, t_form_objects);
       actRefresh.Execute;
     end;
    END;
end;

procedure TFrmExportLocations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([dmSys1.cdsExportLocations, dmSys1.cdsDepots, DmSys.cdsTransportProviders,
                  dmSys1.cdsDepotsXTransportProviders]);
  FrmSparksysMain.stMain.Panels[3].Text := '';
  DmSys.cdsLineMT.CommandText := 'SELECT '+ ccardExportLocations;
  FrmExportLocations := Nil;
end;

procedure TFrmExportLocations.dbGaragemCloseUp(Sender: TObject);
begin
  inherited;
  PreparaEdicao;
  If dbGaragem.KeyValue <> NULL Then
     Begin
       dmSys1.cdsDepotsXTransportProviders.Close;
       dmSys1.cdsDepotsXTransportProviders.Params.ParamByName('DP_ID').AsString := dbGaragem.KeyValue;
       dmSys1.cdsDepotsXTransportProviders.Open;
//       dbEmpresa.Enabled := True;
     End;
end;

procedure TFrmExportLocations.dbEmpresaCloseUp(Sender: TObject);
begin
  inherited;
  PreparaEdicao;
end;

procedure TFrmExportLocations.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys1.cdsExportLocations.Cancel;
     SetActions([], True, FrmExportLocations, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmExportLocations, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     dmSys1.cdsDepotsXTransportProviders.Close;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

end;

procedure TFrmExportLocations.RxDBComboBox1Change(Sender: TObject);
begin
  inherited;
  PreparaEdicao;
end;

procedure TFrmExportLocations.RxDBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   abort;
end;

procedure TFrmExportLocations.cbCodigoCloseUp(Sender: TObject);
begin
  inherited;
  PreparaEdicao;
end;

procedure TFrmExportLocations.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys1 do
        Begin
         cdsExportLocations.Edit;
         cdsExportLocations.FieldByName('EL_STATUS').AsString := 'I';
         cdsExportLocations.Post;
         cdsExportLocations.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
end;

procedure TFrmExportLocations.cbCodigoFKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  abort;
end;

procedure TFrmExportLocations.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(cbCodigoF.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' EL_CODE LIKE ' + QuotedStr(cbCodigoF.Text + '%') + ' AND ';
       end;

    (* If Trim(rdbGaragemF.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' DP.DP_ID = ' + InttoStr(rdbGaragemF.KeyValue) + ' AND ';
       end;


     If Trim(rdbEmpresaF.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' TP.TP_ID = ' + InttoStr(rdbEmpresaF.KeyValue) + ' AND ';
       end; *)


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' EL_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' EL_STATUS = ' + QuotedStr('I') + ' AND ';
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
  with DmSys1 do
    begin
      cdsExportLocations.Close;
     (* cdsExportLocations.CommandText := 'SELECT '+ 'EL.*, EL_STATUS AS STATUS_ID, TP.TP_DESC, DP.DP_DESC '+
                        'FROM EXPORTLOCATIONS EL '+
                        'INNER JOIN TRANSPORTPROVIDERS TP ON (TP.TP_ID = EL.TP_ID) '+
                        'INNER JOIN DEPOTS DP ON (DP.DP_ID = EL.DP_ID) '+ strWhere + ' ORDER BY EL_CODE ';  *)

      cdsExportLocations.CommandText := 'SELECT '+ 'EL.*, EL_STATUS AS STATUS_ID '+
                        'FROM EXPORTLOCATIONS EL '+ strWhere + ' ORDER BY EL_CODE ';
      cdsExportLocations.Open;
      
      FrmSparksysMain.stMain.Panels[3].Text := intToStr(cdsExportLocations.RecordCount) + ' Registro(s)';
    end

end;

procedure TFrmExportLocations.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmExportLocations, t_form_objects);
      gbDetail.Enabled := False;
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmExportLocations, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmExportLocations.FormCreate(Sender: TObject);
  Function GetValueSP(str : String) : String;
     Var NewValue : String; I : Integer;
    Begin
       I := Pos('$',Str);
       NewValue := Copy(Str, I+1, Length(Str)-I);
       Result := NewValue;
    End;

Var
 systemDir  : String;
 buffer      : array[0..144] of Char;
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsExportLocations;
  GetSystemDirectory(Buffer,144);
  systemDir := StrPas(Buffer);

  Spark_Conf := TIniFile.Create(systemDir+'\Spark_Conf.ini');

  PathExportLocations := Spark_Conf.ReadString('SYS','PathExportLocations', '');

  IF PathExportLocations = '' Then
     Begin
       Spark_Conf.WriteString('SYS','PathExportLocations', 'C:\PRODATA\PRJ_%i\EOD\DEPOT_%g\CPY_%c\EOD_%e');
       PathExportLocations := 'C:\PRODATA\PRJ_%i\EOD\DEPOT_%g\CPY_%c\EOD_%e';
     End;

  DmSys.cdsGeral.Close;
  DmSys.cdsGeral.CommandText := 'Select SP_VALUE From SystemParameters Where SP_CODE = ''APPCODE'' ';
  DmSys.cdsGeral.Open;

  If DmSys.cdsGeral.Fields.Fields[0].Value = Null
     Then Prj_Nbr := '000'
     Else Prj_Nbr := GetValueSP(DmSys.cdsGeral.Fields.Fields[0].Value);
end;

end.

