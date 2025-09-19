unit uFrmBaseSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseCadastro, Menus, DB, ActnList, ImgList, StdCtrls,
  ExtCtrls, Grids, DBGrids, ComCtrls, DBClient, ToolWin, uConst;

type
  TFrmBaseSys = class(TFrmBaseCadastro)
    actLog: TAction;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure pcBaseCadastroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure actInsertExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Function StatusTable(StateDB : TDataSetState) : t_Status;
  public
    Function  CardConsists(aField : array of TComponent) : TComponent;
    Function  ApplyTablesSys(appField : array of TComponent; appTable : array of TClientDataSet) : Boolean;
    Procedure ApplyTables(appField : array of TComponent; appTable : TClientDataSet); reintroduce;
    procedure SetStatusPanels(status: Boolean); Virtual;
    procedure CloseTablesSys(aTables : Array of TClientDataSet); Virtual;
    procedure OpenTablesSys(aTables : Array of TClientDataSet );  Virtual;
    Procedure ActionInsertSys(aTable : TClientDataSet);
    Procedure ActionEditSys(aTable : TClientDataSet);

    { Public declarations }
  end;

var
  FrmBaseSys: TFrmBaseSys;

implementation

uses uDmSys, AppSparkSysMain, uGeralFunctions, uFrmLineGroups,
  uDmSys1, uDmConexao, uFrmBase;

{$R *.dfm}


procedure TFrmBaseSys.SetStatusPanels(status: Boolean);
begin
  tsBaseCadastroConsulta.Enabled := Status;
End;


procedure TFrmBaseSys.OpenTablesSys(aTables : Array of TClientDataSet);
Var I : Integer;
Begin
  For I:= 0 to Length(aTables) - 1
  do BEGIN
     //IF aTables[I].Name = 'cdsFarelevelsLinePrices'    //cidel debug
     //THEN ShowMessage(aTables[I].Name);
     //ShowMessage('Vou abrir '+aTables[I].Name);
     Try aTables[I].Open;  //cidel+ colocação do try
     Except
       On E:Exception
          do begin
             ShowMessage('ERRO: Abertura da tabela: '+aTables[I].Name+#13#13+
                         'Unspected Error = ' + e.Message);
             end;
     end;
     END;
End;

procedure TFrmBaseSys.CloseTablesSys(aTables : Array of TClientDataSet);
Var I : Integer;
Begin
  For I:= 0 to Length(aTables) - 1 do
      aTables[I].Close;
End;

Procedure TFrmBaseSys.ActionEditSys(aTable : TClientDataSet);
Begin
  aTable.Edit;
End;

Procedure TFrmBaseSys.ActionInsertSys(aTable : TClientDataSet);
Begin
 With DmSys, DmSys1 do
  Begin

    aTable.Append; {Adiciona um registro em branco}

    If aTable = cdsLineMt Then
      Begin
       aTable.FieldBYName('LM_ID').AsInteger         := -1;
       aTable.FieldByName('LM_STATUS').AsString      := 'A';
       aTable.FieldByName('STATUS_ID').AsString      := 'A';
      End
    Else
   IF aTable = cdsLineDT Then
      Begin
       aTable.FieldByName('LM_ID').AsInteger        := Dmsys.cdsLineMt.fieldByname('LM_ID').AsInteger;
       aTable.FieldByName('LDT_STATUS').AsString    := 'A';
       aTable.FieldByName('STATUS_ID').AsString     := 'A';
      End
   Else
   IF aTable = cdsLineDetails Then
      Begin
       aTable.FieldByName('LM_ID').AsInteger       := Dmsys.cdsLineMt.fieldByname('LM_ID').AsInteger;
       aTable.FieldByName('LD_STATUS').AsString    := 'A';
       aTable.FieldByName('STATUS_ID').AsString    := 'A';
      End
   Else
   IF aTable = cdsLineSectionsXFarelevels Then
      Begin
       aTable.FieldByName('LD_ID').AsInteger       := Dmsys.cdsLineDetails.fieldByname('LD_ID').AsInteger;
       aTable.FieldByName('LSFL_STATUS').AsString  := 'A';
       aTable.FieldByName('STATUS_ID').AsString    := 'A';
      End
   Else
    IF aTable = cdsLineSections Then
      Begin
       aTable.FieldByName('LD_ID').AsInteger       := Dmsys.cdsLineDetails.fieldByname('LD_ID').AsInteger;
       aTable.FieldByName('LS_STATUS').AsString    := 'A';
       aTable.FieldByName('STATUS_ID').AsString    := 'A';
      End
    Else
    IF aTable = cdsLinePrices Then
      Begin
//       aTable.FieldByName('LD_ID').AsInteger       := Dmsys.cdsLineDetails.fieldByname('LD_ID').AsInteger;
//       aTable.FieldByName('LS_ID').AsInteger       := Dmsys.cdsLineDetails.fieldByname('LS_ID').AsInteger;
       aTable.FieldByName('LP_STATUS').AsString    := 'A';
       aTable.FieldByName('STATUS_ID').AsString    := 'A';
      End
    Else
    IF aTable = cdsLineGroups Then
      Begin
       aTable.FieldByName('LG_STATUS').AsString      := 'A';
      End
    Else
    if aTable = cdsLineSelGroups then // LINE SELECT GROUPS
    begin
      aTable.FieldByName('LSG_ID').AsString      :=  DmConexao.ConnBrkMaster.AppServer.AutoIncremento('LINESELECTGROUPS', 'LSG_ID', 'False', '' );
      aTable.FieldByName('LSG_DESC').AsString    := '';
    end
    Else
    IF aTable = cdsPersonnelTypes Then
      Begin
       aTable.FieldByName('PRST_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsValidatorMessages Then
      Begin
//       aTable.FieldByName('MSG_ID').AsInteger      := -1;
       aTable.FieldByName('MSG_KIND').Value        := 1;
       aTable.FieldByName('MSG_COLOR').Value       := 0;
       aTable.FieldByName('MSG_BLINKYELLOW').Value := 0;
       aTable.FieldByName('MSG_BLINKRED').Value    := 0;
       aTable.FieldByName('MSG_SHORTBEEP').Value   := 0;
       aTable.FieldByName('MSG_RED').Value         := 0;
       aTable.FieldByName('MSG_YELLOW').Value      := 0;
       aTable.FieldByName('MSG_GREEN').Value       := 0;
       aTable.FieldByName('MSG_LONGBEEP').Value    := 0;
       aTable.FieldByName('MSG_SETLEDS').Value     := 0;
       aTable.FieldByName('MSG_ORLEDS').Value      := 0;
       aTable.FieldByName('MSG_BLINKGREEN').Value  := 0;
       aTable.FieldByName('MSG_STATUS').AsString      := 'A';
      End
    Else
    IF aTable = cdsDiscountTypes Then
      Begin
       aTable.FieldByName('DT_ID').AsInteger := -1;
      End
    Else
    IF aTable = cdsValidatorDisplaysMT Then
      Begin
//       aTable.FieldByName('VDM_CODE').AsInteger  := 0;
       aTable.FieldByName('VDM_STATUS').AsString := 'A';
       aTable.FieldByName('STATUS_ID').AsString  := 'A';
      End
    Else
    IF aTable = cdsValidatorDisplaysDT Then
      Begin
//       aTable.FieldByName('VDD_LINE').AsInteger   := 0;
//       aTable.FieldByName('VDD_COLUMN').AsInteger := 0;
       aTable.FieldByName('VDD_STATUS').AsString  := 'A';
       aTable.FieldByName('STATUS_ID').AsString   := 'A';
      End
    Else
    IF aTable = cdsTimeLimits Then
      Begin
       aTable.FieldByName('TL_MONDAY').Value    := 0;
       aTable.FieldByName('TL_TUESDAY').Value   := 0;
       aTable.FieldByName('TL_WEDNESDAY').Value := 0;
       aTable.FieldByName('TL_THURSDAY').Value  := 0;
       aTable.FieldByName('TL_FRIDAY').Value    := 0;
       aTable.FieldByName('TL_SATURDAY').Value  := 0;
       aTable.FieldByName('TL_SUNDAY').Value    := 0;
       aTable.FieldByName('TL_SCHOOLHOLIDAY').Value  := 0;
       aTable.FieldByName('TL_OFFHOLIDAY').Value  := 0;
       aTable.FieldByName('TL_STATUS').AsString       := 'A';
       aTable.FieldByName('STATUS_ID').AsString       := 'A';
      End
    Else
    IF aTable = cdsTimeGroups Then
      Begin
         aTable.FieldByName('TG_ID').AsInteger      := -1;
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('TG_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsLineDiscounts Then
      Begin
         aTable.FieldByName('LDI_ID').AsInteger     := -1;
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('LDI_STATUS').AsString  := 'A';
      End
    Else
    IF aTable = cdsMasterApp Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('MA_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsIssuers Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('ISS_STATUS').AsString  := 'A';
      End
    Else
    IF aTable = cdsSystemParameters Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('SP_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsStatisticalFamilies Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('SF_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsUserTypesCad Then
      Begin
         aTable.FieldByName('UT_ID').AsInteger      := -1;
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('UT_STATUS').AsString   := 'A';
      End

    Else
    IF aTable = cdsUseRestrictionGroups Then
      Begin
         aTable.FieldByName('URG_ID').AsInteger      := -1;
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('URG_STATUS').AsString   := 'A';
      End

   Else
    IF aTable = cdsCarddesignCad Then
      Begin
         aTable.FieldByName('CD_ID').AsInteger      := -1;
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('CD_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsCardTemplates Then
      Begin
         aTable.FieldByName('CTE_ID').AsInteger      := -1;
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('CTE_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsReloadPeriodMT Then
      Begin
         aTable.FieldByName('RPM_YEAR').AsInteger    := StrtoInt(FormatDateTime('yyyy', dmConexao.ConnBrkMaster.AppServer.GetCurrentDateTime));
         aTable.FieldByName('RPM_PERIOD').AsInteger  := -1;
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('RPM_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsReloadPeriodDT Then
      Begin
         aTable.FieldByName('RPM_YEAR').AsInteger    := cdsReloadPeriodMT.fieldByname('RPM_YEAR').AsInteger;
         aTable.FieldByName('RPM_PERIOD').AsInteger  := cdsReloadPeriodMT.fieldByname('RPM_PERIOD').AsInteger;
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('RPD_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsHolidays Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString     := 'A';
         aTable.FieldByName('HOL_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsTransportProviders Then
      Begin
         aTable.FieldByName('TP_ID').AsInteger       := -1;
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('TP_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsApplications Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString     := 'A';
         aTable.FieldByName('APP_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsSubApplications Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString       := 'A';
         aTable.FieldByName('SA_STATUS').AsString       := 'A';
         aTable.FieldByName('SA_CERTIFICATE').AsInteger := 0;
      End
    Else
    IF aTable = cdsValidatorStatesXApps Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString       := 'A';
         aTable.FieldByName('VSAPP_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsProviders Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString     := 'A';
         aTable.FieldByName('PRV_STATUS').AsString    := 'A';
         aTable.FieldByName('PRV_ID').AsInteger       := -1;
      End
    Else
    IF aTable = cdsProviderTypes Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString      := 'A';
         aTable.FieldByName('PRVT_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsSeries Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString  := 'A';
         aTable.FieldByName('SE_STATUS').AsString  := 'A';
      End
    Else
    IF aTable = cdsCollectors Then
      Begin
         aTable.FieldByName('COL_ID').AsInteger       := -1;
         aTable.FieldByName('STATUS_ID').AsString     := 'A';
         aTable.FieldByName('COL_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsStatisticalGroups Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('SG_STATUS').AsString    := 'A';
         aTable.FieldByName('SG_ID').AsInteger       := -1;
      End
    Else
    IF aTable = cdsExportLocations Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('EL_STATUS').AsString    := 'A';
      End
    Else
    IF aTable = cdsFTPExportLocations Then
      Begin
         cdsGeral.Close;
         cdsGeral.CommandText := 'SELECT MAX(NVL(FTPS_CODE,0))+1 FTPS_CODE FROM FTPSERVER';
         cdsGeral.Open;
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('FTPS_STATUS').AsString  := 'A';
         aTable.FieldByName('FTPS_CODE').AsInteger   := cdsGeral.fieldbyname('FTPS_CODE').AsInteger;
         cdsGeral.Close;
      End
    Else
    IF aTable = cdsInfoParameters Then
      Begin
         cdsGeral.Close;
         cdsGeral.CommandText := 'SELECT NVL(MAX(IP_ID),0)+1 IP_ID FROM INFOPARAMETERS';
         cdsGeral.Open;
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('IP_STATUS').AsString    := 'A';
         aTable.FieldByName('IP_ID').AsInteger       := cdsGeral.fieldbyname('IP_ID').AsInteger;
         cdsGeral.Close;
      End
    Else        
    IF aTable = cdsTransportProvidersXInfoParameters Then
      Begin
         cdsGeral.Close;
         cdsGeral.CommandText := 'SELECT NVL(MAX(TPXIP_ID),0)+1 TPXIP_ID FROM TRANSPORTPROVIDERSXINFOPARAM';
         cdsGeral.Open;
         aTable.FieldByName('STATUS_ID').AsString       := 'A';
         aTable.FieldByName('TPXIP_STATUS').AsString    := 'A';
         aTable.FieldByName('TPXIP_ID').AsInteger       := cdsGeral.fieldbyname('TPXIP_ID').AsInteger;
         cdsGeral.Close;
      End
    Else
    IF aTable = cdsCardTypes Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString    := 'A';
         aTable.FieldByName('CTY_STATUS').AsString   := 'A';
         aTable.FieldByName('CTY_ID').AsInteger      := -1;
      End
    Else
    IF aTable = cdsProvidersxProviderTypes Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString        := 'A';
         aTable.FieldByName('PRVPRVT_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsLineIntegration Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('LI_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsLineSectionsXLineDiscounts Then
      Begin
         aTable.FieldByName('STATUS_ID').AsString     := 'A';
         aTable.FieldByName('LSLD_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsHandicapTypes Then
      Begin
         aTable.FieldByName('HT_ID').AsInteger     := -1;
      End
    Else
    IF aTable = cdsDepots Then
      Begin
         aTable.FieldByName('DP_ID').AsInteger   := -1;
//         aTable.FieldByName('STATUS_ID').AsString   := 'A';
         aTable.FieldByName('DP_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsSoftwareTypes Then
      Begin
         aTable.FieldByName('SFT_ID').AsInteger   := -1;
         aTable.FieldByName('SFT_STATUS').AsString   := 'A';
      End
    Else
    IF aTable = cdsAddressTypes Then
      Begin
         aTable.FieldByName('AT_ID').AsInteger   := -1;
      End
    else
    IF aTable = cdsEmailTypes Then
      Begin
         aTable.FieldByName('EMT_ID').AsInteger   := -1;
      End
    else
    IF aTable = cdsTelephoneTypes Then
      Begin
         aTable.FieldByName('TT_ID').AsInteger   := -1;
      End
    ELSE
    IF aTable = cdsTransportProvidersGroups Then
      Begin
         aTable.FieldByName('TPG_ID').AsInteger    := -1;
         aTable.FieldByName('TPG_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString  := 'A';         
      End
    ELSE
    IF aTable = cdsDocumentTypes Then
      Begin
         aTable.FieldByName('DT_ID').AsInteger    := -1;
         aTable.FieldByName('DT_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString := 'A';         
      End
    ELSE
    IF aTable = cdsSoftwareVersions Then
      Begin
//         aTable.FieldByName('DT_ID').AsInteger    := -1;
         aTable.FieldByName('SFV_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString := 'A';
      End
      Else
      IF aTable = cdsRemotePrinters Then
      Begin
         aTable.FieldByName('RP_ID').AsInteger    := -1;
         aTable.FieldByName('RP_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString := 'A';
      End
      Else
      IF aTable = cdsPersonnalFunctions Then
      Begin
         aTable.FieldByName('PF_ID').AsInteger    := -1;
         aTable.FieldByName('PF_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString := 'A';
      End
      else
      IF aTable = cdsPeriodUseTypes Then
      Begin
         aTable.FieldByName('PUT_ID').AsInteger    := -1;
         aTable.FieldByName('PUT_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString := 'A';         
      End
      else
      IF aTable = cdsZoneLocations Then
      Begin
         aTable.FieldByName('ZNL_ID').AsInteger    := -1;
         aTable.FieldByName('ZNL_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString  := 'A';
      End
      else
      IF aTable = cdsZones Then
      Begin
         aTable.FieldByName('ZN_ID').AsInteger    := -1;
         aTable.FieldByName('ZN_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString := 'A';
      End
      else
      IF aTable = cdsReceiptMt Then
      Begin
         aTable.FieldByName('RCPTMT_ID').AsInteger    := -1;
         aTable.FieldByName('RCPTMT_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString  := 'A';
      End
      else
      IF aTable = cdsReceiptDt Then
      Begin
         aTable.FieldByName('RCPTMT_ID').AsInteger    := -1;
         aTable.FieldByName('RCPTDT_ID').AsInteger    := -1;
         aTable.FieldByName('RCPTDT_STATUS').AsString := 'A';
         aTable.FieldByName('STATUS_ID').AsString  := 'A';
      End;
  End; //With...

  FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
  SetStatusPanels(True);
  pcBaseCadastro.ActivePageIndex := 1;
End;

Procedure TFrmBaseSys.ApplyTables(appField : array of TComponent;
appTable : TClientDataSet);
Var
  Res : Tcomponent;
Begin
  Res := (CardConsists(appField));
  IF  (Res = Nil) Then
   Begin
     If appTable.State in ([dsEdit, dsInsert]) Then
        appTable.Post;
        appTable.ApplyUpdates(-1);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
   End
  Else
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     Tedit(Res).SetFocus;
   End;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
End;

Function TFrmBaseSys.StatusTable(StateDB : TDataSetState) : t_Status;
Begin
  Case StateDB of
     dsEdit   : Result := stEdit;
     dsInsert : Result := stInsert;
     dsBrowse : Result := stConsult;
  END;

End;

function TFrmBaseSys.ApplyTablesSys(appField : array of TComponent; appTable : array of TClientDataSet): Boolean;
var
  Res : Tcomponent;
  I   : Integer;
begin
  Res := (CardConsists(appField));
  if  (Res = Nil) then
   begin
     try
       dmConexao.ConnBrkMaster.AppServer.StartTransaction;
//     ShowMessage(appTable[0].FieldByName('ZNL_REGUSER').AsString);
//     ShowMessage(appTable[0].FieldByName('ZNL_STATUS').AsString);
//     If appTable[0].State in ([dsEdit, dsInsert]) Then
//        appTable[0].Post;

       //Confirmo a gravação em todas as tabelas
       For I := 0 to High(appTable) do
       If appTable[I].ApplyUpdates(-1) > 1 Then
          raise exception.Create('Error update record');

       //Atualizo as tabelas details
       For I := 1 to High(appTable) do
          Begin
           appTable[I].Close;
           appTable[I].Open;
          End;

       pcBaseCadastro.ActivePageIndex := 0;
       dmConexao.ConnBrkMaster.AppServer.Commit;
       Result := True;
     except
       dmConexao.ConnBrkMaster.AppServer.Rollback;
     end;
   end
  else
   begin
     DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
     Status := StatusTable(appTable[0].State);
     Result := False;
     Tedit(Res).SetFocus;
   end;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
End;

Function  TFrmBaseSys.CardConsists(aField : array of TComponent) : TComponent;
Var I : Integer;
Begin
  result := Nil;
  for I := 0 to Length(aField) - 1 do
    begin
      if Trim(TEdit(aField[i]).Text) = ''  Then
         Result := aField[i];
    end;
End;

procedure TFrmBaseSys.FormShow(Sender: TObject);
begin
  inherited;
    tbtnFiltrar.Enabled      := True;
    actApplyUpdates.Enabled  := False;
    actCancel.Enabled        := False;
    tbtnNew1.Visible         := True;
    IF pcBaseCadastro.ActivePageIndex = 0 THEN grdResultado.SetFocus;
end;

procedure TFrmBaseSys.actEditExecute(Sender: TObject);
begin
  inherited;
  FrmSparkSysMain.stMain.Panels[2].Text := GetState(Status);
  SetStatusPanels(True);
  dtsMaster.DataSet.Edit;
end;

procedure TFrmBaseSys.pcBaseCadastroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if (status = stInsert) or (Status = stEdit)  then
     AllowChange :=  False;
end;

procedure TFrmBaseSys.actInsertExecute(Sender: TObject);
begin
  inherited;
  Status := stInsert;
end;

procedure TFrmBaseSys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  inherited;

  IF  NOT tbtnExit.Enabled Then
     Begin
//      Action := caNone;
      actApplyUpDates.OnExecute(nil);
      If Status <> stConsult then
       begin
         Action := caFree;
         //Abort;
       end;
{      For I := 0 To TForm(Sender).ComponentCount - 1 do
          IF TForm(Sender).Components[I].Name = 'tbtnExit' then
             TButton(TForm(Sender).Components[I]).Click;
      abort;
}
     End;
     FrmSparkSysMain.stMain.Panels[2].Text := '';
     FrmSparkSysMain.stMain.Panels[3].Text := '';
     Action := caFree;

end;

procedure TFrmBaseSys.FormActivate(Sender: TObject);
Var
  I : Integer;
begin
  inherited;

  For I := 0 To TForm(Sender).ComponentCount - 1 do
    IF TForm(Sender).Components[I].Name = 'dtsMaster' then
      Begin
        Case TDataSource(TForm(Sender).Components[I]).State OF
             dsInsert :  FrmSparkSysMain.stMain.Panels[2].Text := GetState(stInsert);
             dsEdit   :  FrmSparkSysMain.stMain.Panels[2].Text := GetState(stEdit);
             dsBrowse :  FrmSparkSysMain.stMain.Panels[2].Text := GetState(stConsult);
        End; //Case...
        FrmSparkSysMain.stMain.Repaint;
        Abort;
      End;

end;

procedure TFrmBaseSys.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  pcBaseCadastro.ActivePageIndex := 1;
end;

procedure TFrmBaseSys.FormCreate(Sender: TObject);
begin
  inherited;
 pcBaseCadastro.ActivePageIndex := 0;
end;

procedure TFrmBaseSys.actApplyUpdatesExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmBaseSys.actLogExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmBaseSys.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
IF pcBaseCadastro.ActivePageIndex = 0 THEN grdResultado.SetFocus;
end;

procedure TFrmBaseSys.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
IF Key = #27 THEN Close; Key:=#0;
end;

end.
