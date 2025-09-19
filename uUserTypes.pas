unit uUserTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxLookup, Mask, DBCtrls, RxDBComb,
  Buttons;

type
  TFrmUserTypes = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    lbDescricao: TLabel;
    dbDesc: TDBEdit;
    dblkCardTypes: TRxDBLookupCombo;
    lbCardTpes: TLabel;
    dbtype: TRxDBLookupCombo;
    lbTipo: TLabel;
    dbCardUsersStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    edDesc: TEdit;
    Label1: TLabel;
    lStatus: TLabel;
    lkFilterStatus: TComboBox;
    edCardTypes: TRxDBLookupCombo;
    Label2: TLabel;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    tbtnDeletePeriod: TToolButton;
    pcSubApplications: TPageControl;
    TabSheet1: TTabSheet;
    btDisplayCancel: TSpeedButton;
    btDisplayOK: TSpeedButton;
    dbLkApplications: TRxDBLookupCombo;
    actNewApp: TAction;
    actEditApp: TAction;
    actDeleteApp: TAction;
    actOkApp: TAction;
    actCancelApp: TAction;
    Label3: TLabel;
    dbgSubApplications: TDBGrid;
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
    procedure tbtnNewCardAppClick(Sender: TObject);
    procedure tbtnDeletePeriodClick(Sender: TObject);
    procedure tbtnEditCardAppClick(Sender: TObject);
    procedure actNewAppExecute(Sender: TObject);
    procedure actEditAppExecute(Sender: TObject);
    procedure actDeleteAppExecute(Sender: TObject);
    procedure actOkAppExecute(Sender: TObject);
    procedure actCancelAppExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetApp;
    Procedure BeforePost;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUserTypes: TFrmUserTypes;

implementation

Uses uDmSys, uConst, uGeralFunctions, AppSparkSysMain, uDmConexao,
  uCardTemplates, uFrmBaseCadastro;

{$R *.dfm}

procedure TFrmUserTypes.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsUserTypesCad, DmSys.cdsUserTypes,
                   DmSys.cdsCardTypes, DmSys.cdsUserTypesXApplicationsCad,
                   DmSys.cdsApplicationsLook]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('UT.UT_ID', 'FROM USERTYPES UT ', 'True', ' WHERE UT_STATUS = ''A'' ') ) + ' Registro(s)';
end;

procedure TFrmUserTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    if FrmCardTemplates = Nil then
    CloseTablesSys([DmSys.cdsUserTypesCad, DmSys.cdsUserTypes,
                    DmSys.cdsCardTypes, DmSys.cdsUserTypesXApplicationsCad,
                    DmSys.cdsApplicationsLook]);
    DmSys.cdsUserTypesCad.CommandText := 'SELECT '+ ccardUserTypes +' FROM USERTYPES UT '+
                                     'LEFT JOIN CARDTYPES CTY ON ( CTY.CTY_ID = UT.CTY_ID  ) '+
                                     'LEFT JOIN USERTYPES UTT ON ( UTT.UT_ID  = UT.UT_TYPE ) '+
                                     'Where UT.UT_STATUS = ''A'' ORDER BY UT.UT_DESC ';
    FrmSparksysMain.stMain.Panels[3].Text := '';
    FrmUserTypes := Nil;
end;

procedure TFrmUserTypes.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsUserTypesCad );
  SetActions([], False, FrmUserTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmUserTypes, t_form_objects);
  dblkCardTypes.SetFocus;

  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsUserTypesXApplicationsCad.IsEmpty ), FrmUserTypes, t_form_objects);

end;

procedure TFrmUserTypes.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmUserTypes, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmUserTypes, t_form_objects);
  dblkCardTypes.SetFocus;

  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsUserTypesXApplicationsCad.IsEmpty ), FrmUserTypes, t_form_objects);
end;

Procedure TFrmUserTypes.BeforePost;
Var
 vUT_ID : Integer;
Begin
  vUT_ID := dmConexao.ConnBrkMaster.AppServer.AutoIncremento('USERTYPES','UT_ID', 'False', '');

  DmSys.cdsUserTypesXApplicationsCad.First;

  While Not DmSys.cdsUserTypesXApplicationsCad.Eof do
     Begin
        DmSys.cdsUserTypesXApplicationsCad.Edit;
        DmSys.cdsUserTypesXApplicationsCad.FieldByName('UT_ID').AsInteger := vUT_ID;
        DmSys.cdsUserTypesXApplicationsCad.Post;
     End;

//  DmSys.cdsUserTypesCad.Edit;
  DmSys.cdsUserTypesCad.FieldByName('UT_ID').AsInteger := vUT_ID;
//  If Trim(dbDesc.Text) <> '' Then
//     DmSys.cdsUserTypesCad.Post;
End;


procedure TFrmUserTypes.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If dtsMaster.DataSet.State = dsInsert Then
        BeforePost;
     If ApplyTablesSys([dbDesc], [DmSys.cdsUserTypesCad,
                                  DmSys.cdsUserTypesXApplicationsCad]) Then
         begin
            SetActions([], True, FrmUserTypes, t_form_objects);
            SetActions([actApplyUpdates, actCancel], False, FrmUserTypes, t_form_objects);
            tbtnRefresh.Click;
         end;
    END;

end;

procedure TFrmUserTypes.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsUserTypesCad.Cancel;
     DmSys.cdsUserTypesXApplicationsCad.CancelUpdates;
     SetActions([], True, FrmUserTypes, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmUserTypes, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TFrmUserTypes.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin

     with DmSys do
        Begin
         cdsUserTypesCad.Edit;
         cdsUserTypesCad.FieldByName('UT_STATUS').AsString := 'I';
         cdsUserTypesCad.Post;
         cdsUserTypesCad.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...


end;

procedure TFrmUserTypes.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmUserTypes, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmUserTypes, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmUserTypes.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' UT.UT_DESC LIKE ' + QuotedStr(edDesc.Text + '%') + ' AND ';
       end;

     If Trim(edCardTypes.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' UT.CTY_ID = ' + edCardTypes.KeyValue + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' UT.UT_STATUS  = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' UT.UT_STATUS  = ' + QuotedStr('I') + ' AND ';
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
      cdsUserTypesCad.Close;
      cdsUserTypesCad.CommandText := 'SELECT '+ ccardUserTypes +' FROM USERTYPES UT '+
                                     'LEFT JOIN CARDTYPES CTY ON ( CTY.CTY_ID = UT.CTY_ID  ) '+
                                     'LEFT JOIN USERTYPES UTT ON ( UTT.UT_ID  = UT.UT_TYPE ) '+
      strWhere +
      ' ORDER BY UT.UT_DESC ';
      cdsUserTypesCad.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('UT.UT_ID', 'FROM USERTYPES UT ', 'True', strWhere) ) + ' Registro(s)';
    end;
end;

procedure TFrmUserTypes.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
end;

procedure TFrmUserTypes.tbtnNewCardAppClick(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);

  dbgSubApplications.Visible := False;
  DmSys.cdsUserTypesXApplicationsCad.Insert;
  dbgSubApplications.Visible   := False;
end;

procedure TFrmUserTypes.SetApp;
//Var Str : String;
Begin
   DmSys.cdsApplicationsLook.Locate('APP_ID;ISS_ID', VarArrayOf([DmSys.cdsUserTypesXApplicationsCad.FieldByName('APP_ID').AsInteger,
                                                                 DmSys.cdsUserTypesXApplicationsCad.FieldByName('ISS_ID').AsInteger]), [] );

   dbLkApplications.KeyValue := DmSys.cdsApplicationsLook.fieldByname('APP_ISS_ID').AsInteger;
End;


procedure TFrmUserTypes.tbtnDeletePeriodClick(Sender: TObject);
begin
  inherited;
   DmSys.cdsUserTypesXApplicationsCad.Delete;
end;

procedure TFrmUserTypes.tbtnEditCardAppClick(Sender: TObject);
begin
  inherited;
  dbgSubApplications.Visible := False;
  SetApp;
  DmSys.cdsUserTypesXApplicationsCad.Edit;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
end;

procedure TFrmUserTypes.actNewAppExecute(Sender: TObject);
begin
  inherited;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
  dbgSubApplications.Visible := False;
  DmSys.cdsUserTypesXApplicationsCad.Insert;
  dbLkApplications.ClearValue;
  dbgSubApplications.Visible   := False;
end;

procedure TFrmUserTypes.actEditAppExecute(Sender: TObject);
begin
  inherited;
  dbgSubApplications.Visible := False;
  SetApp;
  DmSys.cdsUserTypesXApplicationsCad.Edit;
  SetActions([actApplyUpdates, actCancel], False, Self, t_form_objects);
  SetCategories([Applications], False, Self, t_form_objects);
end;

procedure TFrmUserTypes.actDeleteAppExecute(Sender: TObject);
begin
  inherited;
  DmSys.cdsUserTypesXApplicationsCad.Delete;
  SetActions([actEditApp, actDeleteApp], not ( DmSys.cdsUserTypesXApplicationsCad.IsEmpty ), FrmUserTypes, t_form_objects);
end;

procedure TFrmUserTypes.actOkAppExecute(Sender: TObject);
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

     cdsUserTypesXApplicationsCad.FieldByName('APP_ID').AsString := cdsApplicationsLook.fieldByName('APP_ID').AsString;
     cdsUserTypesXApplicationsCad.FieldByName('ISS_ID').AsString := cdsApplicationsLook.fieldByName('ISS_ID').AsString;
     cdsUserTypesXApplicationsCad.FieldByName('APP_DESCSHORT').AsString := cdsApplicationsLook.fieldByName('APP_DESCSHORT').AsString;
     cdsUserTypesXApplicationsCad.FieldByName('ISS_DESCSHORT').AsString := cdsApplicationsLook.fieldByName('ISS_DESCSHORT').AsString;

     cdsUserTypesXApplicationsCad.Post;
     dbgSubApplications.Visible := True;
    End;
  End;
end;

procedure TFrmUserTypes.actCancelAppExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewApp, actEditApp], True, Self, t_form_objects);
   SetActions([actDeleteApp], NOT (dmSys.cdsUserTypesXApplicationsCad.RecordCount = 0), Self, t_form_objects);
   DmSys.cdsUserTypesXApplicationsCad.Cancel;
   dbgSubApplications.Visible := True;
end;

procedure TFrmUserTypes.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsUserTypesCad;
end;

end.
