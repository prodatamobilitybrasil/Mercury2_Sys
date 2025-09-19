unit uStatisticalGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, RxDBComb, RxLookup, Buttons, Mask,
  DBCtrls;

type
  TFrmStatisticalGroups = class(TFrmBaseSys)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbDesc: TDBEdit;
    Label3: TLabel;
    dbDescCurto: TDBEdit;
    cbStaGroups: TCoolBar;
    tbCardsApps: TToolBar;
    tbtnNewCardApp: TToolButton;
    tbtnEditCardApp: TToolButton;
    pcDetalhes: TPageControl;
    TabSheet1: TTabSheet;
    dbgStaGroupsXConditions: TDBGrid;
    TabSheet2: TTabSheet;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label28: TLabel;
    lbDisponiveisTP: TListBox;
    lbSelecionadasTP: TListBox;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    dbgTPxStatGroups: TDBGrid;
    Label1: TLabel;
    lbDisponiveis: TListBox;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnAddAllLineMtC: TToolButton;
    btnDelAllLineMtC: TToolButton;
    ToolButton4: TToolButton;
    lbSelecionadas: TListBox;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    lbDesc: TLabel;
    eDesc: TEdit;
    lkFilterStatus: TComboBox;
    Label27: TLabel;
    dbOrdem: TDBEdit;
    Label5: TLabel;
    actNewDetail: TAction;
    actEditDetail: TAction;
    actDeleteDetail: TAction;
    actAddCond: TAction;
    actAddAllCond: TAction;
    actDelCond: TAction;
    actDelAllCond: TAction;
    actOkCond: TAction;
    actCancelCond: TAction;
    actAddEmpr: TAction;
    actAddAllEmpr: TAction;
    actDelEmpr: TAction;
    actDelAllEmpr: TAction;
    actOkEmpr: TAction;
    actCancelEmpr: TAction;
    tbtnDeletePeriod: TToolButton;
    dbrdStatus: TDBRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnDelAllLineMtCClick(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure pcDetalhesChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pcDetalhesChange(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbDisponiveisTPDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasTPDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbDisponiveisTPDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasTPDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure actNewDetailExecute(Sender: TObject);
    procedure actAddAllCondExecute(Sender: TObject);
    procedure actAddCondExecute(Sender: TObject);
    procedure actDelCondExecute(Sender: TObject);
    procedure actDelAllCondExecute(Sender: TObject);
    procedure actOkCondExecute(Sender: TObject);
    procedure actCancelCondExecute(Sender: TObject);
    procedure actAddAllEmprExecute(Sender: TObject);
    procedure actAddEmprExecute(Sender: TObject);
    procedure actDelEmprExecute(Sender: TObject);
    procedure actDelAllEmprExecute(Sender: TObject);
    procedure actOkEmprExecute(Sender: TObject);
    procedure actCancelEmprExecute(Sender: TObject);
    procedure actEditDetailExecute(Sender: TObject);
    procedure actDeleteDetailExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
  private
//     Procedure SetLines;
     procedure BeforePost;
     Procedure ListaStatisticalGroups;
     Procedure ListaTPStatGroups;
     Procedure SetDetalhes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStatisticalGroups: TFrmStatisticalGroups;

implementation

uses uDmSys, AppSparkSysMain, uDmConexao, uFrmLineGroups, uConst, uGeralFunctions ,
  uFrmBaseCadastro, uFrmSystemLog;

{$R *.dfm}


procedure TFrmStatisticalGroups.FormShow(Sender: TObject);
begin
  inherited;
  FrmStatisticalGroups := Self;
  OpenTablesSys([DmSys.cdsStatisticalGroups, DmSys.cdsStatGroupsXConditions,
                 DmSys.cdsTransportProvidersXStatGroups]);
  FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('SG_ID', 'FROM STATISTICALGROUPS', 'True', ' WHERE SG_STATUS = ''A'' ') ) + ' Registro(s)';
  actLog.Enabled := DmSys.cdsStatisticalGroups.RecordCount > 0;

end;

procedure TFrmStatisticalGroups.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys.cdsStatisticalGroups, DmSys.cdsStatGroupsXConditions,
                  DmSys.cdsTransportProvidersXStatGroups]);
  DmSys.cdsStatisticalGroups.CommandText := 'SELECT SG.*, SG.SG_STATUS AS STATUS_ID FROM STATISTICALGROUPS SG WHERE SG_STATUS = ''A'' ORDER BY SG.SG_DESC';
  FrmSparksysMain.stMain.Panels[3].Text := '';
  FrmStatisticalGroups := Nil;
end;

procedure TFrmStatisticalGroups.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(DmSys.cdsStatisticalGroups);
  SetActions([], False, FrmStatisticalGroups, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmStatisticalGroups, t_form_objects);
  dbDesc.SetFocus;
  SetDetalhes;
end;
(*
Procedure TFrmStatisticalGroups.SetLines;
Begin
 With dmSys do
   Begin
    cdsStatGroupsXConditions.First;
    cdsStatGroupsConditions.First;
    lbSelecionadas.Clear;
    lbDisponiveis.Clear;

    While not cdsStatGroupsConditions.eof do
     Begin
         lbDisponiveis.Items.AddObject(cdsStatGroupsConditions.fieldByName('SGC_DESC').AsString,
                               TObject(cdsStatGroupsConditions.fieldByName('SGC_ID').AsInteger));
         cdsStatGroupsConditions.Next;
     End;
   End;
End;
*)

Procedure TFrmStatisticalGroups.SetDetalhes;
Begin
  cbStaGroups.Enabled := NOT (Status = stConsult);
  pcDetalhes.ActivePageIndex := 0;
end;

Procedure TFrmStatisticalGroups.ListaTPStatGroups;
Begin
  With dmSys do
    Begin
     lbSelecionadasTP.Clear;
     lbDisponiveisTP.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT TP_ID, TP_DESC FROM TRANSPORTPROVIDERS WHERE TP_STATUS = ''A'' '+
                              'ORDER BY TP_DESC';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF cdsTransportProvidersXStatGroups.Locate('TP_ID', cdsGeral.FieldByName('TP_ID').AsString, [])
                Then lbSelecionadasTP.Items.AddObject(cdsGeral.fieldByName('TP_DESC').AsString,
                                              TObject(cdsGeral.fieldByName('TP_ID').AsInteger))
                Else lbDisponiveisTP.Items.AddObject(cdsGeral.fieldByName('TP_DESC').AsString,
                                             TObject(cdsGeral.fieldByName('TP_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
End;

Procedure TFrmStatisticalGroups.ListaStatisticalGroups;
Begin
  With dmSys do
    Begin
     lbSelecionadas.Clear;
     lbDisponiveis.Clear;

      cdsGeral.Close;
      cdsGeral.CommandText := 'SELECT SGC_ID, SGC_DESC FROM STATGROUPSCONDITIONS WHERE SGC_STATUS = ''A'' ';
      cdsGeral.Open;

        While NOT cdsGeral.Eof do
           Begin
              IF cdsStatGroupsXConditions.Locate('SGC_ID', cdsGeral.FieldByName('SGC_ID').AsString, [])
                Then lbSelecionadas.Items.AddObject(cdsGeral.fieldByName('SGC_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('SGC_ID').AsInteger))
                Else lbDisponiveis.Items.AddObject(cdsGeral.fieldByName('SGC_DESC').AsString,
                                           TObject(cdsGeral.fieldByName('SGC_ID').AsInteger));
              cdsGeral.Next;
           end;
    End;
End;


procedure TFrmStatisticalGroups.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmStatisticalGroups, t_form_objects);
  actLog.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, FrmStatisticalGroups, t_form_objects);
  SetDetalhes;
end;

procedure TFrmStatisticalGroups.BeforePost;
Var
 vSG_ID : integer;
Begin
  With DmSys do
  Begin
    cdsTransportProvidersXStatGroups.First;
    vSG_ID  := DmConexao.ConnBrkMaster.AppServer.AutoIncremento('STATISTICALGROUPS', 'SG_ID', 'False', '' );
//  Else
//     vSG_ID  := DmSys.cdsStatisticalGroups.fieldByName('SG_ID').AsInteger;

  While NOT cdsStatGroupsXConditions.Eof do
       Begin
         cdsStatGroupsXConditions.Edit;
         cdsStatGroupsXConditions.FieldByName('SG_ID').AsInteger := vSG_ID;
         cdsStatGroupsXConditions.Post;
//         cdsStatGroupsXConditions.Next;
       End;

  While NOT cdsTransportProvidersXStatGroups.Eof do
       Begin
         cdsTransportProvidersXStatGroups.Edit;
         cdsTransportProvidersXStatGroups.FieldByName('SG_ID').AsInteger  := vSG_ID;
         cdsTransportProvidersXStatGroups.Post;
//         cdsTransportProvidersXStatGroups.Next;
       End;
  End;
End;

procedure TFrmStatisticalGroups.actApplyUpdatesExecute(Sender: TObject);
begin
 inherited;
  If  status = stConsult Then
    BEGIN
     IF (dtsMaster.DataSet.State = dsInsert) Then
       BeforePost;
     If ApplyTablesSys([dbDesc], [DmSys.cdsStatisticalGroups,
                                  DmSys.cdsStatGroupsXConditions,
                                  DmSys.cdsTransportProvidersXStatGroups]) Then
         begin
          SetActions([], True, FrmStatisticalGroups, t_form_objects);
          SetActions([actApplyUpdates, actCancel], False, FrmStatisticalGroups, t_form_objects);
          tbtnRefresh.Click;
         end;
    END;
  actLog.Enabled := True
end;

procedure TFrmStatisticalGroups.actCancelExecute(Sender: TObject);
begin
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     DmSys.cdsTransportProvidersXStatGroups.CancelUpdates;
     DmSys.cdsStatGroupsXConditions.CancelUpdates;
     DmSys.cdsStatisticalGroups.Cancel;

//     DmSys.cdsStatGroupsXConditions.Cancel;

     SetActions([], True, FrmStatisticalGroups, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmStatisticalGroups, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
  actLog.Enabled := DmSys.cdsStatisticalGroups.RecordCount > 0;

end;

procedure TFrmStatisticalGroups.actDeleteExecute(Sender: TObject);
begin
if DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
     dmConexao.ConnBrkMaster.AppServer.StartTransaction;
     with DmSys do
        Begin
         cdsStatisticalGroups.Edit;
         cdsStatisticalGroups.FieldByName('SG_STATUS').AsString := 'I';
         cdsStatisticalGroups.Post;
         cdsStatisticalGroups.ApplyUpdates(-1);
         dmConexao.ConnBrkMaster.AppServer.Commit;
         tbtnRefresh.Click;
        End;
    FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
   end; //With...
  actLog.Enabled := DmSys.cdsStatisticalGroups.RecordCount > 0;

end;

procedure TFrmStatisticalGroups.btnDelAllLineMtCClick(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmStatisticalGroups.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
    IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      SetDetalhes;
      SetActions([actFilter, actDelete, actRefresh], False, FrmStatisticalGroups, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True,  FrmStatisticalGroups, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);

end;

procedure TFrmStatisticalGroups.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  SetDetalhes;
end;

procedure TFrmStatisticalGroups.pcDetalhesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
   AllowChange :=  tbtnEditCardApp.Enabled;
end;

procedure TFrmStatisticalGroups.pcDetalhesChange(Sender: TObject);
begin
 inherited;
 case pcDetalhes.ActivePageIndex of
    0 : Begin
          tbtnNewCardApp.Hint   := 'Incluir Condições';
          tbtnEditCardApp.Hint  := 'Editar  Condições';
          tbtnDeletePeriod.Hint := '';
          SetActions([actDeleteDetail], False, Self, t_form_objects);
        End;

    1 : Begin
          tbtnNewCardApp.Hint   := 'Incluir Empresas';
          tbtnEditCardApp.Hint  := 'Editar  Empresas';
          tbtnDeletePeriod.Hint := '';
          SetActions([actDeleteDetail], False, Self, t_form_objects);
        End;
  End;// Case..

end;

procedure TFrmStatisticalGroups.actFilterExecute(Sender: TObject);
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
         strWhere := strWhere + ' SG.SG_DESC LIKE ' + QuotedStr(eDesc.Text + '%') + ' AND ';
       end;


     Case lkFilterStatus.ItemIndex Of
       0 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SG.SG_STATUS = ' + QuotedStr('A') + ' AND ';
           end;
       1 : Begin
            Inc(qtd_campos);
            strWhere := strWhere + ' SG.SG_STATUS = ' + QuotedStr('I') + ' AND ';
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
      cdsStatisticalGroups.Close;
      cdsStatisticalGroups.CommandText := 'SELECT SG.*, SG.SG_STATUS AS STATUS_ID '+
                                     'FROM STATISTICALGROUPS SG '+
                                     strWhere +
                                     ' ORDER BY SG.SG_DESC';
      cdsStatisticalGroups.Open;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( cdsStatisticalGroups.RecordCount) + ' Registro(s)';
    end;
  actLog.Enabled := DmSys.cdsStatisticalGroups.RecordCount > 0

end;

procedure TFrmStatisticalGroups.lbDisponiveisDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
  btnDelAllLineMtC.Click;
end;

procedure TFrmStatisticalGroups.lbSelecionadasDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
btnAddAllLineMtC.Click;
end;

procedure TFrmStatisticalGroups.lbSelecionadasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
   Accept := Source is TlistBox;
end;

procedure TFrmStatisticalGroups.lbDisponiveisDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmStatisticalGroups.lbDisponiveisTPDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmStatisticalGroups.lbSelecionadasTPDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TFrmStatisticalGroups.lbDisponiveisTPDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
 btnDelAllLineMt.Click;
end;

procedure TFrmStatisticalGroups.lbSelecionadasTPDragDrop(Sender,
  Source: TObject; X, Y: Integer);
begin
  inherited;
   btnAddAllLineMt.Click;
end;

procedure TFrmStatisticalGroups.actNewDetailExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], False, Self, t_form_objects);

   Case pcDetalhes.ActivePageIndex of
       0 : Begin
             dbgStaGroupsXConditions.Visible := False;
             ActionInsertSys(dmSys.cdsStatGroupsXConditions);
             ListaStatisticalGroups;
           End;

       1 : Begin
             dbgTPxStatGroups.Visible := False;
             ActionInsertSys(dmSys.cdsTransportProvidersXStatGroups);
             ListaTPStatGroups;
           End;

    eND;


end;

procedure TFrmStatisticalGroups.actAddAllCondExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);

end;

procedure TFrmStatisticalGroups.actAddCondExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveis.MoveSelection(lbSelecionadas);

end;

procedure TFrmStatisticalGroups.actDelCondExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.MoveSelection(lbDisponiveis);

end;

procedure TFrmStatisticalGroups.actDelAllCondExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);

end;

procedure TFrmStatisticalGroups.actOkCondExecute(Sender: TObject);
Var
 I : Integer;
begin
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], True, Self, t_form_objects);

   dmSys.cdsStatGroupsXConditions.First;

   While NOT dmSys.cdsStatGroupsXConditions.Eof do
      Begin
        dmSys.cdsStatGroupsXConditions.Delete;
      End;

   For I := 0 to lbSelecionadas.Count - 1 do
      Begin
         dmSys.cdsStatGroupsXConditions.Append;
         dmSys.cdsStatGroupsXConditions.FieldByName('SG_ID').AsInteger   := dmSys.cdsStatisticalGroups.fieldByName('SG_ID').AsInteger;
         dmSys.cdsStatGroupsXConditions.FieldByName('SGC_ID').AsInteger  := Integer(lbSelecionadas.items.Objects[I]);
         dmSys.cdsStatGroupsXConditions.FieldByName('SGC_DESC').AsString := lbSelecionadas.Items.Strings[I];
         dmSys.cdsStatGroupsXConditions.Post;
      End;

   dbgStaGroupsXConditions.Visible := True;


end;

procedure TFrmStatisticalGroups.actCancelCondExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], True, Self, t_form_objects);

   dbgStaGroupsXConditions.Visible := True;
   dmSys.cdsStatGroupsXConditions.Cancel;

end;

procedure TFrmStatisticalGroups.actAddAllEmprExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveisTP.SelectAll;
  lbDisponiveisTP.MoveSelection(lbSelecionadasTP);

end;

procedure TFrmStatisticalGroups.actAddEmprExecute(Sender: TObject);
begin
  inherited;
  lbDisponiveisTP.MoveSelection(lbSelecionadasTP);

end;

procedure TFrmStatisticalGroups.actDelEmprExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadasTP.MoveSelection(lbDisponiveisTP);
end;

procedure TFrmStatisticalGroups.actDelAllEmprExecute(Sender: TObject);
begin
  inherited;
  lbSelecionadasTP.SelectAll;
  lbSelecionadasTP.MoveSelection(lbDisponiveisTP);

end;

procedure TFrmStatisticalGroups.actOkEmprExecute(Sender: TObject);
Var
 I : Integer;
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], True, Self, t_form_objects);

   dmSys.cdsStatGroupsXConditions.First;

   While NOT dmSys.cdsTransportProvidersXStatGroups.Eof do
      Begin
        dmSys.cdsTransportProvidersXStatGroups.Delete;
      End;

   For I := 0 to lbSelecionadasTP.Count - 1 do
      Begin
         dmSys.cdsTransportProvidersXStatGroups.Append;
         dmSys.cdsTransportProvidersXStatGroups.FieldByName('SG_ID').AsInteger  := dmSys.cdsStatisticalGroups.fieldByName('SG_ID').AsInteger;
         dmSys.cdsTransportProvidersXStatGroups.FieldByName('TP_ID').AsInteger  := Integer(lbSelecionadasTP.items.Objects[I]);
         dmSys.cdsTransportProvidersXStatGroups.FieldByName('TP_DESC').AsString := lbSelecionadasTP.Items.Strings[I];
         dmSys.cdsTransportProvidersXStatGroups.Post;
      End;

   dbgTPxStatGroups.Visible := True;

end;

procedure TFrmStatisticalGroups.actCancelEmprExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], True, Self, t_form_objects);

   dbgTPxStatGroups.Visible := True;
   dmSys.cdsTransportProvidersXStatGroups.Cancel;

end;

procedure TFrmStatisticalGroups.actEditDetailExecute(Sender: TObject);
begin
  inherited;
   SetActions([actApplyUpdates, actCancel, actNewDetail, actEditDetail], False, Self, t_form_objects);

   Case pcDetalhes.ActivePageIndex of
       0 : Begin
             dbgStaGroupsXConditions.Visible := False;
             ActionInsertSys(dmSys.cdsStatGroupsXConditions);
             ListaStatisticalGroups;
           End;

       1 : Begin
             dbgTPxStatGroups.Visible := False;
             ActionInsertSys(dmSys.cdsTransportProvidersXStatGroups);
             ListaTPStatGroups;
           End;

    End;
end;

procedure TFrmStatisticalGroups.actDeleteDetailExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmStatisticalGroups.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsStatisticalGroups;
end;

procedure TFrmStatisticalGroups.actLogExecute(Sender: TObject);
begin
  inherited;
  FrmSystemLog         := TFrmSystemLog.create(Self);
  FrmSystemLog.pSLT_ID := '8';
  FrmSystemLog.pSLG_ID := DmSys.cdsStatisticalGroups.FieldByName('SG_ID').AsString;
  FrmSystemLog.ShowModal;
  FrmSystemLog.Free
end;

end.
