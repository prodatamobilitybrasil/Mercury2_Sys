unit uFrmCollectors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Buttons, RxDBComb, Mask, DBCtrls,
  RXDBCtrl;

type
  TFrmCollectors = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    dbCollectsStatus: TRxDBComboBox;
    lblStatusCardUsers: TLabel;
    pcSubApplications: TPageControl;
    TabSheet2: TTabSheet;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label28: TLabel;
    lbDisponiveis: TListBox;
    lbSelecionadas: TListBox;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    dbgCollectorsXTP: TDBGrid;
    cbCardApps: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewTP: TToolButton;
    tbtnEditTP: TToolButton;
    tbtnDeletePeriod: TToolButton;
    eDesc: TEdit;
    Label1: TLabel;
    lkFilterStatus: TComboBox;
    Label27: TLabel;
    Label3: TLabel;
    dbVersion: TDBEdit;
    Label4: TLabel;
    eVersao: TEdit;
    actNewTProv: TAction;
    actEditTProv: TAction;
    actDeleteTProv: TAction;
    actOkTProv: TAction;
    actCancelTProv: TAction;
    actAddAllTProv: TAction;
    actAddTProv: TAction;
    actDelTProv: TAction;
    actDelAllTProv: TAction;
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure actFilterExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewTProvExecute(Sender: TObject);
    procedure actEditTProvExecute(Sender: TObject);
    procedure actDeleteTProvExecute(Sender: TObject);
    procedure actOkTProvExecute(Sender: TObject);
    procedure actCancelTProvExecute(Sender: TObject);
    procedure actAddAllTProvExecute(Sender: TObject);
    procedure actAddTProvExecute(Sender: TObject);
    procedure actDelTProvExecute(Sender: TObject);
    procedure actDelAllTProvExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
  private
   Procedure BeforePost;
   procedure SetPanels(Status : Boolean);
    { Private declarations }
  public
     Procedure ListaEmpresas;
    { Public declarations }
  end;

var
  FrmCollectors: TFrmCollectors;

implementation

uses uDmSys, AppSparkSysMain, uConst, uGeralFunctions, uFrmLineGroups,
  uDmConexao, uFrmBaseCadastro, uFrmSystemLog;

{$R *.dfm}

Procedure TFrmCollectors.ListaEmpresas;
Begin
  With dmSys do
    Begin
     FrmCollectors.lbSelecionadas.Clear;
     FrmCollectors.lbDisponiveis.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT TP_ID, TP_DESC FROM TRANSPORTPROVIDERS WHERE TP_STATUS = ''A'' ORDER BY TP_DESC';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF cdsCollectorsXTransportProviders.Locate('TP_ID', cdsGeral.fieldByName('TP_ID').AsString, [] )
               Then lbSelecionadas.Items.AddObject(cdsGeral.fieldByName('TP_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('TP_ID').AsInteger))
               Else lbDisponiveis.Items.AddObject(cdsGeral.fieldByName('TP_DESC').AsString,
                                          TObject(cdsGeral.fieldByName('TP_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
End;

procedure TFrmCollectors.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsCollectors);
  dbDesc.SetFocus;
  SetActions([], False, FrmCollectors, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCollectors, t_form_objects);
  SetPanels(False);

  SetActions([actEditTProv, actDeleteTProv], not(DmSys.cdsCollectorsXTransportProviders.IsEmpty), FrmCollectors, t_form_objects);
end;

procedure TFrmCollectors.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmCollectors, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmCollectors, t_form_objects);
  SetPanels(True);

  SetActions([actEditTProv, actDeleteTProv], not(DmSys.cdsCollectorsXTransportProviders.IsEmpty), FrmCollectors, t_form_objects);
end;
        
Procedure TFrmCollectors.BeforePost;
Var
  I : Integer;
Begin
  DmSys.cdsCollectorsXTransportProviders.First;


  While not DmSys.cdsCollectorsXTransportProviders.Eof do
     DmSys.cdsCollectorsXTransportProviders.Delete;

  For I := 0 to lbSelecionadas.Items.Count - 1 do
     begin
       DmSys.cdsCollectorsXTransportProviders.Insert;
       DmSys.cdsCollectorsXTransportProviders.FieldByName('COL_ID').AsInteger := DmSys.cdsCollectors.fieldByName('COL_ID').AsInteger;
       DmSys.cdsCollectorsXTransportProviders.FieldByName('TP_ID').AsInteger  := Integer(lbSelecionadas.Items.Objects[I]);
       DmSys.cdsCollectorsXTransportProviders.FieldByName('TP_DESC').AsString := lbSelecionadas.Items.Strings[I];
       DmSys.cdsCollectorsXTransportProviders.Post;
     end;
End;

procedure TFrmCollectors.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     If ApplyTablesSys([dbDesc], [DmSys.cdsCollectors,
                                  DmSys.cdsCollectorsXTransportProviders]) Then
         begin
           SetActions([], True, FrmCollectors, t_form_objects);
           SetActions([actApplyUpdates, actCancel], False, FrmCollectors, t_form_objects);
           tbtnRefresh.Click;
         end;
    END;
  actLog.Enabled := True;

end;

procedure TFrmCollectors.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     DmSys.cdsCollectors.Cancel;
     DmSys.cdsCollectorsXTransportProviders.Cancel;
     DmSys.cdsCollectorsXTransportProviders.Close;
     DmSys.cdsCollectorsXTransportProviders.Open;
     SetActions([], True, FrmCollectors, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmCollectors, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsCollectors.RecordCount > 0;
  
end;

procedure TFrmCollectors.actDeleteExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     with DmSys do
        Begin
         cdsCollectors.Edit;
         cdsCollectors.FieldByName('COL_STATUS').AsString := 'I';
         cdsCollectors.Post;
         cdsCollectors.ApplyUpdates(-1);
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsCollectors.RecordCount > 0;

end;

procedure TFrmCollectors.FormShow(Sender: TObject);
begin
  inherited;
    OpenTablesSys([DmSys.cdsCollectors, DmSys.cdsCollectorsXTransportProviders ]);
    FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('COL_ID', 'FROM COLLECTORS', 'True', ' WHERE COL_STATUS = ''A'' ') ) + ' Registro(s)';
    actLog.Enabled := DmSys.cdsCollectors.RecordCount > 0;

end;

procedure TFrmCollectors.SetPanels(Status : Boolean);
Begin
  cbCardApps.Enabled := Status;
End;


procedure TFrmCollectors.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmCollectors, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmCollectors, t_form_objects); 
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TFrmCollectors.lbDisponiveisDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  btnDelAllLineMt.Click;
end;

procedure TFrmCollectors.lbDisponiveisDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmCollectors.lbSelecionadasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
btnAddAllLineMt.Click;
end;

procedure TFrmCollectors.lbSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmCollectors.actFilterExecute(Sender: TObject);
Var
  strWhere  : String;

    procedure BuiltStrWhere;
    Var
     qtd_campos, i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(eDesc.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' COL_DESC LIKE ' + QuotedStr(eDesc.Text + '%') + ' AND ';
       end;

     If Trim(eVersao.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' COL_VERSION LIKE ' + QuotedStr(eVersao.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' COL_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' COL_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsCollectors.Close;
      cdsCollectors.CommandText := 'SELECT '+ ccardCollectors +' From COLLECTORS COL ' +
      strWhere + 'ORDER BY COL.COL_DESC';
      cdsCollectors.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('COL_ID', 'FROM COLLECTORS', 'True', strWhere) ) + ' Registro(s)';
    end;
  actLog.Enabled := DmSys.cdsCollectors.RecordCount > 0;

end;

procedure TFrmCollectors.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
end;

procedure TFrmCollectors.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CloseTablesSys([DmSys.cdsCollectors, DmSys.cdsCollectorsXTransportProviders ]);
    DmSys.cdsCollectors.CommandText := 'SELECT '+ ccardCollectors +' From COLLECTORS COL Where COL.COL_STATUS = ''A'' ORDER BY COL.COL_DESC';
    FrmCollectors := Nil;
end;

procedure TFrmCollectors.actNewTProvExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actcancel, actNewTProv, actEditTprov], False, Self, t_form_objects);
   dbgCollectorsXTP.Visible := False;
   ListaEmpresas;
end;

procedure TFrmCollectors.actEditTProvExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actcancel, actNewTProv, actEditTprov], False, Self, t_form_objects);
   dbgCollectorsXTP.Visible := False;
   dmSys.cdsCollectorsXTransportProviders.Edit;
   ListaEmpresas;
end;

procedure TFrmCollectors.actDeleteTProvExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TFrmCollectors.actOkTProvExecute(Sender: TObject);
begin
  inherited;
   BeforePost;
   SetActions([actApplyUpdates, actcancel, actNewTProv, actEditTprov], True, Self, t_form_objects);
   dbgCollectorsXTP.Visible := True;
end;

procedure TFrmCollectors.actCancelTProvExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actcancel, actNewTProv, actEditTprov], True, Self, t_form_objects);
   dbgCollectorsXTP.Visible := True;
end;

procedure TFrmCollectors.actAddAllTProvExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmCollectors.actAddTProvExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmCollectors.actDelTProvExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmCollectors.actDelAllTProvExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmCollectors.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsCollectors;
end;

procedure TFrmCollectors.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '12';
  FrmSystemLog.pSLG_ID := DmSys.cdsCollectors.FieldByName('COL_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

end.

