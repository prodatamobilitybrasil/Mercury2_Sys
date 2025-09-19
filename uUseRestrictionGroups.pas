unit uUseRestrictionGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, Mask, DBCtrls, RxLookup,
  Buttons, DBClient;

type
  TFrmUseRestrictionGroups = class(TFrmBaseSys)
    gbRestricao: TGroupBox;
    lbDescricao: TLabel;
    dbDesc: TDBEdit;
    dbRestricaoStatus: TRxDBComboBox;
    lbl_Status: TLabel;
    lkFilterStatus: TComboBox;
    lStatus: TLabel;
    edDesc: TEdit;
    lbl_desc: TLabel;
    pcRestricoes: TPageControl;
    TabSheet1: TTabSheet;
    btDisplayCancel: TSpeedButton;
    btDisplayOK: TSpeedButton;
    actNewApp: TAction;
    actEditApp: TAction;
    actDeleteApp: TAction;
    actOkApp: TAction;
    actCancelApp: TAction;
    lbl_periodo: TLabel;
    dbLkApplications: TRxDBLookupCombo;
    lbl_limite: TLabel;
    dbe_limite: TDBEdit;
    dbgperiodos: TDBGrid;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    CdsGridPeriodo: TClientDataSet;
    CdsGridPeriodoURGPUT_ID: TIntegerField;
    CdsGridPeriodoURG_ID: TIntegerField;
    CdsGridPeriodoPUT_ID: TIntegerField;
    CdsGridPeriodoURGPUT_PERUSELIMIT: TIntegerField;
    CdsGridPeriodoURGPUT_STATUS: TStringField;
    CdsGridPeriodoURGPUT_REGDATE: TDateField;
    CdsGridPeriodoURGPUT_REGUSER: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure NewAppExecute(Sender: TObject);
    procedure actEditAppExecute(Sender: TObject);
    procedure actDeleteAppExecute(Sender: TObject);
    procedure actOkAppExecute(Sender: TObject);
    procedure actCancelAppExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    
  private
    procedure BeforePost;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUseRestrictionGroups: TFrmUseRestrictionGroups;

implementation

uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uFrmBaseCadastro, uFrmSystemLog;

{$R *.dfm}

procedure TFrmUseRestrictionGroups.FormShow(Sender: TObject);
begin
  inherited;

  tbtnFiltrar.Enabled      := True;
  actApplyUpdates.Enabled  := False;
  actCancel.Enabled        := False;
  tbtnNew1.Visible         := True;

  OpenTablesSys([DmSys.cdsUseRestrictionGroups, DmSys.cdsUseRestGroupsXPerUseTypes,DmSys.cdsPeriodUseTypes ]);
  FrmSparksysMain.stMain.Panels[3].Text := IntToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('URG_ID', 'FROM USERESTRICTIONGROUPS', 'True', ' WHERE URG_STATUS = ''A'' ') ) + ' Registro(s)';

  lbl_desc.Caption := 'Descrição';
  lStatus.Caption  := 'Status';
  grdResultado.Columns[1].Title.Caption := 'Descrição';
  grdResultado.Columns[4].Title.Caption := 'Status';

  dbgperiodos.Columns[0].Title.Caption := 'Tipo de Período';
  dbgperiodos.Columns[1].Title.Caption := 'Limite';
  dbgperiodos.Columns[2].Title.Caption := 'Status';
end;

procedure TFrmUseRestrictionGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsUseRestrictionGroups, DmSys.cdsUseRestGroupsXPerUseTypes,DmSys.cdsPeriodUseTypes]);
    FrmSparksysMain.stMain.Panels[3].Text := '';
    DmSys.cdsUseRestrictionGroups.CommandText := 'SELECT  URG_ID,URG_DESC,URG_STATUS,URG_STATUS as STATUS_ID,URG_REGDATE,URG_REGUSER FROM USERESTRICTIONGROUPS where URG_STATUS = ''A'' ORDER BY URG_DESC';
    FrmUseRestrictionGroups := Nil;
end;

procedure TFrmUseRestrictionGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsUseRestrictionGroups );
  SetActions([], False, FrmUseRestrictionGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmUseRestrictionGroups, t_form_objects);
  dbDesc.SetFocus;

  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsUseRestGroupsXPerUseTypes.IsEmpty ), FrmUseRestrictionGroups, t_form_objects);

   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
   tbtnDeletePeriod.Enabled := True;
   TabSheet1.Caption  :='Períodos';
   lbl_periodo.Caption:='Período';
   lbl_limite.Caption :='Limite';
   lbDescricao.Caption:='Descrição';
   lbl_Status.Caption :='Status';

end;

procedure TFrmUseRestrictionGroups.BeforePost;
Var
 URG_ID : Integer;
Begin
  URG_ID := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('USERESTRICTIONGROUPS','URG_ID', 'False', '');

  DmSys.cdsGridPeriodo.First;

  While Not DmSys.cdsGridPeriodo.Eof do
     Begin
        DmSys.cdsGridPeriodo.Edit;
        DmSys.cdsGridPeriodo.FieldByName('URG_ID').AsInteger := URG_ID;
        DmSys.cdsGridPeriodo.Post;
     End;

  DmSys.cdsUseRestrictionGroups.Edit;
  DmSys.cdsUseRestrictionGroups.FieldByName('URG_ID').AsInteger := URG_ID;
  DmSys.cdsUseRestrictionGroups.Post;

End;

procedure TFrmUseRestrictionGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmUseRestrictionGroups, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmUseRestrictionGroups, t_form_objects);
  dbDesc.SetFocus;

  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsUseRestGroupsXPerUseTypes.IsEmpty ), FrmUseRestrictionGroups, t_form_objects);

   tbtnNewCardApp.Enabled  := True;
   tbtnEditCardApp.Enabled := True;
   tbtnDeletePeriod.Enabled := True;
   TabSheet1.Caption  :='Períodos';
   lbl_periodo.Caption:='Período';
   lbl_limite.Caption :='Limite';
   lbDescricao.Caption:='Descrição';
   lbl_Status.Caption :='Status';
end;

procedure TFrmUseRestrictionGroups.actApplyUpdatesExecute(Sender: TObject);
begin
  If dbDesc.Text = '' then
  begin
    DisplayMsg(t_form_objects, '%T %T', [1601, 1500], []);
    dbDesc.SetFocus;
  end
  Else
  Begin
  inherited;
  If  status = stConsult Then
    BEGIN
    If dtsMaster.DataSet.State = dsInsert Then
       BeforePost;

      SetActions([], True, FrmUseRestrictionGroups, t_form_objects);
      SetActions([actApplyUpdates, actCancel], False, FrmUseRestrictionGroups, t_form_objects);
      tbtnRefresh.Click;
      DmSys.cdsGeral.Close;
      DmSys.cdsGeral.CommandText := ' DELETE FROM USERESTGROUPSXPERUSETYPES WHERE URG_ID= ' + INTTOSTR(DmSys.cdsUseRestrictionGroups.FieldByName('URG_ID').AsInteger);
      DmSys.cdsGeral.Execute;
      DmSys.cdsGridPeriodo.First;


      while not DmSys.cdsGridPeriodo.Eof do
      begin
        DmSys.cdsGeral.Close;
        DmSys.cdsGeral.CommandText := 'insert into USERESTGROUPSXPERUSETYPES ( ';
        if DmSys.cdsGridPeriodo.FieldByName('URGPUT_ID').AsInteger <> 0 then
           DmSys.cdsGeral.CommandText := DmSys.cdsGeral.CommandText+'       URGPUT_ID, ';
        DmSys.cdsGeral.CommandText := DmSys.cdsGeral.CommandText+
                                      '       URG_ID,                           '+
                                      '       PUT_ID,                           '+
                                      '       URGPUT_PERUSELIMIT,               '+
                                      '       URGPUT_STATUS,                    '+
                                      '       URGPUT_REGDATE,                   '+
                                      '       URGPUT_REGUSER)                   '+
                                      '  values (                               ';
        if DmSys.cdsGridPeriodo.FieldByName('URGPUT_ID').AsInteger <> 0 then
           DmSys.cdsGeral.CommandText := DmSys.cdsGeral.CommandText+DmSys.cdsGridPeriodo.FieldByName('URGPUT_ID').AsString+', ';
        DmSys.cdsGeral.CommandText := DmSys.cdsGeral.CommandText+DmSys.cdsGridPeriodo.FieldByName('URG_ID').AsString+', '+
                                      DmSys.cdsGridPeriodo.FieldByName('PUT_ID').AsString+', '+
                                      DmSys.cdsGridPeriodo.FieldByName('URGPUT_PERUSELIMIT').AsString+', '+
                                      QuotedStr(DmSys.cdsGridPeriodo.FieldByName('URGPUT_STATUS').AsString)+', '+
                                      ' to_date( '+QuotedStr(FormatDateTime('dd/mm/yyyy hh:nn', DmSys.cdsGridPeriodo.FieldByName('URGPUT_REGDATE').AsDateTime))+', '+QuotedStr('dd/mm/yyyy hh24:mi')+'), '+
                                      QuotedStr(DmSys.cdsGridPeriodo.FieldByName('URGPUT_REGUSER').AsString)  + ') ';

        DmSys.cdsGeral.Execute;

        DmSys.cdsGridPeriodo.Next;
      end;
    END;
  End;
end;


procedure TFrmUseRestrictionGroups.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsUseRestrictionGroups.Cancel;
     DmSys.cdsUseRestrictionGroups.Cancel;
     DmSys.cdsUseRestrictionGroups.CancelUpdates;
     SetActions([], True, FrmUseRestrictionGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmUseRestrictionGroups, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;

 // actLog.Enabled := DmSys.cdsUseRestrictionGroups.RecordCount > 0;

end;

procedure TFrmUseRestrictionGroups.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsUseRestrictionGroups.Edit;
         cdsUseRestrictionGroups.FieldByName('URG_STATUS').AsString := 'I';
         cdsUseRestrictionGroups.Post;
         cdsUseRestrictionGroups.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...

end;

procedure TFrmUseRestrictionGroups.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmUseRestrictionGroups, t_form_objects);
      TabSheet1.Caption  :='Períodos';
      lbl_periodo.Caption:='Período';
      lbl_limite.Caption :='Limite';
      lbDescricao.Caption:='Descrição';
      lbl_Status.Caption :='Status';
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmUseRestrictionGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
 
end;

procedure TFrmUseRestrictionGroups.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
    qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(edDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' URG_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' URG_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' URG_STATUS = ' + QuotedStr('I') + ' AND ';
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
  with DmSys do
    begin
      cdsUseRestrictionGroups.Close;
      cdsUseRestrictionGroups.CommandText := 'SELECT  URG_ID,URG_DESC,URG_STATUS,URG_STATUS as STATUS_ID,URG_REGDATE,URG_REGUSER FROM USERESTRICTIONGROUPS' + strWhere + ' ORDER BY URG_DESC';
      cdsUseRestrictionGroups.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('URG_ID', 'FROM USERESTRICTIONGROUPS', 'True', strWhere) ) + ' Registro(s)';
    end;

 
end;

procedure TFrmUseRestrictionGroups.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
end;

procedure TFrmUseRestrictionGroups.NewAppExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);

  dbgperiodos.Visible := False;
  DmSys.cdsUseRestGroupsXPerUseTypes.Insert;
  dbLkApplications.ClearValue;
  dbgperiodos.Visible   := False;

end;

procedure TFrmUseRestrictionGroups.actEditAppExecute(Sender: TObject);
begin
  inherited;

  dbgperiodos.Visible := False;
  DmSys.cdsUseRestGroupsXPerUseTypes.Edit;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);

end;

procedure TFrmUseRestrictionGroups.actDeleteAppExecute(Sender: TObject);
begin
  inherited;
   DmSys.cdsGridPeriodo.Edit;
   DmSys.cdsGridPeriodo.FieldByName('URGPUT_STATUS').AsString := 'I';
   DmSys.cdsGridPeriodo.Post;


 //  DmSys.cdsUseRestGroupsXPerUseTypes.Delete;

end;

procedure TFrmUseRestrictionGroups.actOkAppExecute(Sender: TObject);
begin
  inherited;
  With DmSys do
   Begin
    If dbLkApplications.KeyValue = Null Then
     DisplayMsg(t_form_objects, '%T', [3006], [], mtError, [mbOK])
    Else
    Begin
     SetActions([actApplyUpdates, actCancel], True, Self, t_form_objects);
     SetCategories([Applications], True, Self, t_form_objects);
     cdsGridPeriodo.Filtered:=false;
     cdsGridPeriodo.Filter:=' PUT_ID='+dbLkApplications.KeyValue;
     cdsGridPeriodo.Filtered := true;
     if cdsGridPeriodo.RecordCount=0 then
     begin
       cdsGridPeriodo.Filtered:=false;
       cdsGridPeriodo.Append;
       cdsGridPeriodo.FieldByName('URG_ID').AsInteger             := cdsUseRestrictionGroups.FieldByName('URG_ID').AsInteger;
       cdsGridPeriodo.FieldByName('PUT_ID').AsInteger             := dbLkApplications.KeyValue;
       cdsGridPeriodo.FieldByName('PUT_DESC').AsString            := cdsPeriodUseTypes.FieldByName('PUT_DESC').AsString;
       cdsGridPeriodo.FieldByName('URGPUT_PERUSELIMIT').AsInteger := strtoint(dbe_limite.Text);
       cdsGridPeriodo.FieldByName('URGPUT_STATUS').AsString       := 'A';
       cdsGridPeriodo.FieldByName('URGPUT_REGDATE').AsDateTime    := now;
       cdsGridPeriodo.FieldByName('URGPUT_REGUSER').AsString      := FrmSparkSysMain.stMain.Panels[4].Text;
       cdsGridPeriodo.Post;
     end
     else
     begin
       cdsGridPeriodo.Edit;
       cdsGridPeriodo.FieldByName('URGPUT_PERUSELIMIT').AsInteger := strtoint(dbe_limite.Text);
       cdsGridPeriodo.FieldByName('URGPUT_STATUS').AsString       := 'A';
       cdsGridPeriodo.FieldByName('URGPUT_REGDATE').AsDateTime    := now;
       cdsGridPeriodo.FieldByName('URGPUT_REGUSER').AsString      := FrmSparkSysMain.stMain.Panels[4].Text;
       cdsGridPeriodo.Post;
       cdsGridPeriodo.Filtered:=false;
     end;

     dbgperiodos.Visible := True;
    End;
  End;
end;

procedure TFrmUseRestrictionGroups.actCancelAppExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewApp, actEditApp], True, Self, t_form_objects);
   SetActions([actDeleteApp], NOT (dmSys.cdsUseRestGroupsXPerUseTypes.RecordCount = 0), Self, t_form_objects);
   DmSys.cdsUseRestGroupsXPerUseTypes.Cancel;
   dbgperiodos.Visible := True;

end;

procedure TFrmUseRestrictionGroups.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsUseRestrictionGroups;
  actFilter.Execute;
end;




procedure TFrmUseRestrictionGroups.Button1Click(Sender: TObject);
begin
  inherited;
actEditAppExecute(self);
end;

end.
