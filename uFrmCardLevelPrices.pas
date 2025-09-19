unit uFrmCardLevelPrices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Buttons, DBCtrls, Mask, CurrEdit,
  RXDBCtrl, ToolEdit;

type
  TfrmCardLevelPrices = class(TFrmBaseSys)
    rdgFilterStatus: TRadioGroup;
    btnCardDesign: TBitBtn;
    Label1: TLabel;
    eDesc: TEdit;
    btnHotList: TBitBtn;
    pnlTop: TPanel;
    grpTop: TGroupBox;
    Label2: TLabel;
    dbedDescricao: TDBEdit;
    dbrdStatus: TDBRadioGroup;
    pnl: TPanel;
    nbSubGruposMT: TNotebook;
    grdCardLevelPrices: TDBGrid;
    btnSystemUsersOk: TBitBtn;
    btnSysUsersCancel: TBitBtn;
    dbrgStatus: TDBRadioGroup;
    dtsCardLevelPricesValidity: TDataSource;
    pnlCardDesign: TPanel;
    pnlHotListReason: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dbgCardDesign: TDBGrid;
    DBGrid2: TDBGrid;
    PageControl2: TPageControl;
    TabSheet2: TTabSheet;
    dbgHotListReason: TDBGrid;
    DBGrid4: TDBGrid;
    dtsCardLevelPricexCardDesign: TDataSource;
    dtsHotListReasonxCardLPrices: TDataSource;
    pnlBtCLPValidity: TPanel;
    tbSystemUsers: TToolBar;
    tbtnNewValidity: TToolButton;
    tbtnEditValidity: TToolButton;
    tbtnDeleteValidity: TToolButton;
    spbtIncAllCD: TSpeedButton;
    spbtIncOneCD: TSpeedButton;
    spbtDelOneCD: TSpeedButton;
    spbtDelAllCD: TSpeedButton;
    spbtIncAllHL: TSpeedButton;
    spbtIncOneHL: TSpeedButton;
    spbtDelOneHL: TSpeedButton;
    spbtDelAllHL: TSpeedButton;
    dtsHotListReason: TDataSource;
    dtsCardDesign: TDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbdtStartDate: TDBDateEdit;
    dbdtEndDate: TDBDateEdit;
    dbcePrice: TRxDBCalcEdit;
    procedure btnCardDesignClick(Sender: TObject);
    procedure tbtnFiltrarClick(Sender: TObject);
    procedure btnHotListClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure ActivateValidityButtons(Activate : Boolean);
    procedure ActivateCardDesignButtons(Activate : Boolean);
    procedure ActivateHotListReasonButtons(Activate : Boolean);
    procedure ActivateAllButtons(Activate : Boolean);
    procedure tbtnNewValidityClick(Sender: TObject);
    procedure btnSystemUsersOkClick(Sender: TObject);
    procedure btnSysUsersCancelClick(Sender: TObject);
    procedure tbtnEditValidityClick(Sender: TObject);
    procedure tbtnDeleteValidityClick(Sender: TObject);
    procedure IncludeOneCD;
    procedure IncludeAllCD;
    procedure ExcludeOneCD;
    procedure ExcludeAllCD;
    procedure IncludeOneHL;
    procedure IncludeAllHL;
    procedure ExcludeOneHL;
    procedure ExcludeAllHL;
    procedure spbtIncOneCDClick(Sender: TObject);
    procedure spbtIncOneHLClick(Sender: TObject);
    procedure spbtIncAllCDClick(Sender: TObject);
    procedure spbtIncAllHLClick(Sender: TObject);
    procedure spbtDelOneHLClick(Sender: TObject);
    procedure spbtDelAllHLClick(Sender: TObject);
    procedure spbtDelOneCDClick(Sender: TObject);
    procedure spbtDelAllCDClick(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure nbSubGruposMTPageChanged(Sender: TObject);
  private
    { Private declarations }
    sCardDesign    : Array[0..100] of String;
    sHotListReason : Array[0..100] of String;
  public
    { Public declarations }
    sCD_ID         : String;
    sHL_ID         : String;
  end;

var
  frmCardLevelPrices: TfrmCardLevelPrices;

implementation

uses ufrmSearchTable, uDmSys1, uDmSys, AppSparkSysMain, uDmConexao,
  uGeralFunctions, uConst;

{$R *.dfm}

procedure TfrmCardLevelPrices.btnCardDesignClick(Sender: TObject);
var
  fSearch : TfrmSearchTable;
begin
  inherited;
  fSearch := TfrmSearchTable.Create(Self);
  fSearch.DataSet := dmSys1.cdsCardDesign;
  fSearch.ExibField := 'CD_DESC';
  fSearch.KeyField := 'CD_ID';
  fSearch.LetsDoIt(sCardDesign);
  fSearch.Free;
end;

procedure TfrmCardLevelPrices.tbtnFiltrarClick(Sender: TObject);
Var
  strWhere    : String;
  bSub, bSubH : Boolean;

    procedure BuiltStrWhere;
    Var
     qtd_campos, i, cont : integer;
     sCards, sHot : string;
    Begin
     bSub  := False;
     bSubH := False;
     qtd_campos := 0;
     strWhere  := '';

     Inc(qtd_campos);
     strWhere := strWhere + ' CP.CLP_STATUS = ' + QuotedStr(Copy(rdgFilterStatus.Items.Strings[rdgFilterStatus.ItemIndex],1,1)) + ' AND ';

     if Trim(eDesc.Text) <> '' then
       strWhere := strWhere + ' CP.CLP_DESC LIKE ' + QuotedStr(eDesc.Text + '%') + ' AND ';

     //Adiciona o filtro de CardDesign
     cont := 0;
     sCards := '';
     while sCardDesign[cont] <> '' do
       begin
         Inc(qtd_campos);
         if cont > 0 then
           sCards := sCards + ',';
         sCards := sCards + sCardDesign[cont];
         Inc(cont);
       end;
      if sCards <> '' then
      begin
        strWhere := strWhere + ' CPCD.CLP_ID = CP.CLP_ID AND CPCD.CD_ID IN (SELECT C.CD_ID FROM CARDDESIGN C WHERE C.CD_ID IN ('+sCards+')) AND';
        bSub := True;
      end;

      //Adiciona o filtro de HotList
     cont := 0;
     sHot := '';
     while sHotListReason[cont] <> '' do
       begin
         Inc(qtd_campos);
         if cont > 0 then
           sHot := sHot + ',';
         sHot := sHot + sHotListReason[cont];
         Inc(cont);
       end;
      if sHot <> '' then
      begin
        strWhere := strWhere + ' HRCP.CLP_ID = CP.CLP_ID AND HRCP.HLR_ID IN (SELECT H.HLR_ID FROM HOTLISTREASON H WHERE H.HLR_ID IN ('+sHot+')) AND';
        bSubH := True;
      end;


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

  with dmSys1 do
    begin
      cdsCardLevelPrices.Close;
      if (bSub = True) and (bSubH = False) then
        strWhere :=  ', CARDLEVELPRICESXCARDDESIGN CPCD ' + strWhere
      else if (bSub = False) and (bSubH = True) then
        strWhere :=  ', HOTLISTREASONXCARDLPRICES HRCP ' + strWhere
      else if (bSub = True) and (bSubH = True) then
        strWhere :=  ', HOTLISTREASONXCARDLPRICES HRCP, CARDLEVELPRICESXCARDDESIGN CPCD ' + strWhere;

      cdsCardLevelPrices.CommandText := 'SELECT DISTINCT(CP.CLP_ID), CP.CLP_DESC, CP.CLP_STATUS, CLP_REGDATE, CLP_REGUSER FROM CARDLEVELPRICES CP' + strWhere + ' ORDER BY CP.CLP_ID';
      cdsCardLevelPrices.Open;
      RefreshHotListReason;
      RefreshCardDesign;
      FrmSparksysMain.stMain.Panels[3].Text := intToStr( dmConexao.ConnBrkMaster.AppServer.GetDBCount('CLP_ID', 'FROM CARDLEVELPRICES', 'False', '') ) + ' Registro(s)';
    end;
//  actLog.Enabled := DmSys1.cdsApplicationGroups.RecordCount > 0;
end;

procedure TfrmCardLevelPrices.btnHotListClick(Sender: TObject);
var
  fSearch : TfrmSearchTable;
begin
  inherited;
  fSearch := TfrmSearchTable.Create(Self);
  fSearch.DataSet := dmSys1.cdsHotListReasonList;
  fSearch.ExibField := 'HLR_DESC';
  fSearch.KeyField := 'HLR_ID';
  fSearch.LetsDoIt(sHotListReason);
  fSearch.Free;
end;

procedure TfrmCardLevelPrices.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CloseTablesSys([DmSys1.cdsCardLevelPrices, DmSys1.cdsCardLevelPricesValidity, DmSys1.cdsCardLevelPricesXCardDesign, DmSys1.cdsHotListReasonXCardLPrices, DmSys1.cdsCardDesign, DmSys1.cdsHotListReasonList]);
  Action := caFree;
end;

procedure TfrmCardLevelPrices.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := dmSys1.cdsCardLevelPrices;
  nbSubGruposMT.PageIndex := 0;
  sCD_ID := '';
  sHL_ID := '';
  ActivateAllButtons(False);
end;

procedure TfrmCardLevelPrices.FormDestroy(Sender: TObject);
begin
  inherited;
  frmCardLevelPrices := Nil;
end;

procedure TfrmCardLevelPrices.FormShow(Sender: TObject);
begin
  inherited;
  OpenTablesSys([DmSys1.cdsCardLevelPrices, DmSys1.cdsCardLevelPricesValidity, DmSys1.cdsCardLevelPricesXCardDesign, DmSys1.cdsHotListReasonXCardLPrices, DmSys1.cdsCardDesign, DmSys1.cdsHotListReasonList, DmSys.cdsCarddesignCad, DmSys.cdsHotListReason]);
  dmSys1.RefreshHotListReason;
  dmSys1.RefreshCardDesign;
  tbtnFiltrar.Click;
  actLog.Visible := False;
end;

procedure TfrmCardLevelPrices.actInsertExecute(Sender: TObject);
begin
  inherited;
  ActionInsertSys(dmSys1.cdsCardLevelPrices);
  SetActions([], False, self, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, Self, t_form_objects);
  ActivateAllButtons(False);
  dbedDescricao.SetFocus;
end;

procedure TfrmCardLevelPrices.actEditExecute(Sender: TObject);
begin
  inherited;
  SetActions([], False, Self, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, Self, t_form_objects);
  ActivateAllButtons(True);
  dbedDescricao.SetFocus;
end;

procedure TfrmCardLevelPrices.actApplyUpdatesExecute(Sender: TObject);
begin
//  inherited;
  If (Status = stInsert) or (Status = stEdit) then
  Begin
    ActivateAllButtons(False);
    if ApplyTablesSys([dbedDescricao], [dmSys1.cdsCardLevelPrices]) then
       Begin
         try
           dmConexao.ConnBrkMaster.AppServer.StartTransaction;
           dmSys1.cdsCardLevelPricesValidity.ApplyUpdates(-1);
           dmSys1.cdsCardLevelPricesXCardDesign.ApplyUpdates(-1);
           dmSys1.cdsHotListReasonXCardLPrices.ApplyUpdates(-1);
           dmConexao.ConnBrkMaster.AppServer.Commit;
         except
           dmConexao.ConnBrkMaster.AppServer.RollBack;
         end;
         SetActions([], True, Self, t_form_objects);
         SetActions([actApplyUpdates, actCancel, actLog], False, Self, t_form_objects);
         tbtnRefresh.Click;
         dmSys1.RefreshHotListReason;
         dmSys1.RefreshCardDesign;
         sCD_ID := '';
         sHL_ID := '';
       end;
  end;

end;

procedure TfrmCardLevelPrices.actCancelExecute(Sender: TObject);
begin
//  inherited;
  if DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes then
  Begin
    dmSys1.cdsCardLevelPrices.Cancel;
    dmSys1.cdsCardLevelPricesValidity.CancelUpdates;
    dmSys1.cdsCardLevelPricesXCardDesign.CancelUpdates;
    dmSys1.cdsHotListReasonXCardLPrices.CancelUpdates;
    SetActions([], True, Self, t_form_objects);
    SetActions([actApplyUpdates, actCancel, actLog], False, Self, t_form_objects);
    dmSys1.RefreshHotListReason;
    dmSys1.RefreshCardDesign;
    ActivateAllButtons(False);
    pcBaseCadastro.ActivePageIndex := 0;
    Status := stConsult;
    FrmSparkSysMain.stMain.Panels[2].Text :=GetState(status);
    sCD_ID := '';
    sHL_ID := '';
  end;
end;

procedure TfrmCardLevelPrices.actDeleteExecute(Sender: TObject);
begin
//  inherited;
  with dmSys1 do
  begin
    if cdsCardLevelPricesValidity.RecordCount > 0 then
    begin
      DisplayMsg(t_form_objects, '%T', [3222], [], mtInformation, [mbOk]);
      exit;
    end;
    if cdsCardLevelPricesXCardDesign.RecordCount > 0 then
    begin
      DisplayMsg(t_form_objects, '%T', [3222], [], mtInformation, [mbOk]);
      exit;
    end;
    if cdsHotListReasonXCardLPrices.RecordCount > 0 then
    begin
      DisplayMsg(t_form_objects, '%T', [3222], [], mtInformation, [mbOk]);
      exit;
    end;
  end;

  If DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
      dmSys1.cdsCardLevelPrices.Delete;
      dmSys1.cdsCardLevelPrices.ApplyUpdates(-1);
    end;

end;

procedure TfrmCardLevelPrices.ActivateValidityButtons(Activate: Boolean);
begin
  tbtnNewValidity.Enabled    := Activate;
  tbtnEditValidity.Enabled   := Activate;
  tbtnDeleteValidity.Enabled := Activate;
end;

procedure TfrmCardLevelPrices.ActivateCardDesignButtons(Activate: Boolean);
begin
  spbtIncAllCD.Enabled       := Activate;
  spbtIncOneCD.Enabled       := Activate;
  spbtDelAllCD.Enabled       := Activate;
  spbtDelOneCD.Enabled       := Activate;
end;

procedure TfrmCardLevelPrices.ActivateHotListReasonButtons(
  Activate: Boolean);
begin
  spbtIncAllHL.Enabled       := Activate;
  spbtIncOneHL.Enabled       := Activate;
  spbtDelAllHL.Enabled       := Activate;
  spbtDelOneHL.Enabled       := Activate;
end;

procedure TfrmCardLevelPrices.ActivateAllButtons(Activate: Boolean);
begin
  ActivateValidityButtons(Activate);
  ActivateCardDesignButtons(Activate);
  ActivateHotListReasonButtons(Activate);
end;

procedure TfrmCardLevelPrices.tbtnNewValidityClick(Sender: TObject);
begin
  inherited;
  with dmSys1 do
    begin
      cdsCardLevelPricesValidity.Append;
      cdsCardLevelPricesValidity.FieldByName('CLPVAL_SEQNBR').AsInteger := cdsCardLevelPricesValidity.RecordCount + 1;
      cdsCardLevelPricesValidity.FieldBYName('CLP_ID').AsInteger        := cdsCardLevelPrices.FieldByName('CLP_ID').AsInteger;
      cdsCardLevelPricesValidity.FieldByName('CLPVAL_STATUS').AsString  := 'A';
    end;

  grpTop.Enabled := False;
  ActivateValidityButtons(False);
  ActivateCardDesignButtons(False);
  ActivateHotListReasonButtons(False);
  btnSystemUsersOk.Enabled := True;
  btnSysUsersCancel.Enabled := True;
  nbSubGruposMT.PageIndex := 1; // Cadastro

  dbdtStartDate.SetFocus;
  dbrgStatus.ItemIndex := 0;

  SetActions([], False, Self, t_form_objects);

end;

procedure TfrmCardLevelPrices.btnSystemUsersOkClick(Sender: TObject);
begin
  inherited;
  dmSys1.cdsCardLevelPricesValidity.Post;

  nbSubGruposMT.PageIndex := 0;
  grpTop.Enabled := True;
  ActivateValidityButtons(True);
  ActivateCardDesignButtons(True);
  ActivateHotListReasonButtons(True);
  btnSystemUsersOk.Enabled := False;
  btnSysUsersCancel.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, Self, t_form_objects);
end;

procedure TfrmCardLevelPrices.btnSysUsersCancelClick(Sender: TObject);
begin
  inherited;
  dmSys1.cdsCardLevelPricesValidity.Cancel;

  nbSubGruposMT.PageIndex := 0;
  grpTop.Enabled := True;
  ActivateValidityButtons(True);
  ActivateCardDesignButtons(True);
  ActivateHotListReasonButtons(True);
  btnSystemUsersOk.Enabled := False;
  btnSysUsersCancel.Enabled := False;
  SetActions([actApplyUpdates, actCancel], true, self, t_form_objects);
end;

procedure TfrmCardLevelPrices.tbtnEditValidityClick(Sender: TObject);
begin
  inherited;
  if DmSys1.cdsCardLevelPrices.RecordCount > 0 then
    begin
      grpTop.Enabled := False;
      ActivateValidityButtons(False);
      ActivateCardDesignButtons(False);
      ActivateHotListReasonButtons(False);
      btnSystemUsersOk.Enabled := True;
      btnSysUsersCancel.Enabled := True;
      nbSubGruposMT.PageIndex := 1; // Cadastro

      DmSys1.cdsCardLevelPricesValidity.Edit;

      dbdtStartDate.SetFocus;

      SetActions([], False, Self, t_form_objects);
    end;

end;

procedure TfrmCardLevelPrices.tbtnDeleteValidityClick(Sender: TObject);
begin
  inherited;
  if dmSys1.cdsCardLevelPricesValidity.RecordCount > 0 then
  begin
    dmSys1.cdsCardLevelPricesValidity.Edit;
    dmSys1.cdsCardLevelPricesValidity.FieldByName('CLPVAL_STATUS').AsString := 'I';
    dmSys1.cdsCardLevelPricesValidity.Post;
  end;

end;

procedure TfrmCardLevelPrices.IncludeOneCD;
begin
  with DmSys1 do
  begin
    cdsCardLevelPricesXCardDesign.Append;
    cdsCardLevelPricesXCardDesign.FieldBYName('CLP_ID').AsInteger           := cdsCardLevelPrices.FieldByName('CLP_ID').AsInteger;
    cdsCardLevelPricesXCardDesign.FieldBYName('CD_ID').AsInteger            := DmSys.cdsCarddesignCad.FieldByName('CD_ID').AsInteger;
    cdsCardLevelPricesXCardDesign.FieldByName('CLPCD_STATUS').AsString      := 'A';
    cdsCardLevelPricesXCardDesign.FieldBYName('CLPCD_NEWCARD').AsString     := '';
    cdsCardLevelPricesXCardDesign.FieldBYName('CD_DESC').AsString           := DmSys.cdsCarddesignCad.FieldByName('CD_DESC').AsString;
    cdsCardLevelPricesXCardDesign.Post;
    sCD_ID := sCD_ID + DmSys.cdsCarddesignCad.FieldByName('CD_ID').AsString + ',';
  end;
  dmSys1.RefreshCardDesign;

end;

procedure TfrmCardLevelPrices.IncludeOneHL;
begin
  with DmSys1 do
  begin
    cdsHotListReasonXCardLPrices.Append;
    cdsHotListReasonXCardLPrices.FieldBYName('CLP_ID').AsInteger            := cdsCardLevelPrices.FieldByName('CLP_ID').AsInteger;
    cdsHotListReasonXCardLPrices.FieldBYName('HLR_ID').AsInteger            := DmSys.cdsHotListReason.FieldByName('HLR_ID').AsInteger;
    cdsHotListReasonXCardLPrices.FieldByName('HLRCLP_STATUS').AsString      := 'A';
    cdsHotListReasonXCardLPrices.FieldBYName('HLR_DESC').AsString           := DmSys.cdsHotListReason.FieldByName('HLR_DESC').AsString;
    cdsHotListReasonXCardLPrices.Post;
    sHL_ID := sHL_ID + DmSys.cdsHotListReason.FieldByName('HLR_ID').AsString + ',';
  end;
  dmSys1.RefreshHotListReason;

end;

procedure TfrmCardLevelPrices.spbtIncOneCDClick(Sender: TObject);
begin
  inherited;
  if DmSys.cdsCarddesignCad.RecordCount = 0 then
    exit;
  IncludeOneCD;
end;

procedure TfrmCardLevelPrices.spbtIncOneHLClick(Sender: TObject);
begin
  inherited;
  if DmSys.cdsHotListReason.RecordCount = 0 then
    exit;
  IncludeOneHL;
end;

procedure TfrmCardLevelPrices.IncludeAllCD;
begin
  DmSys.cdsCarddesignCad.First;
  while not DmSys.cdsCarddesignCad.Eof do
  begin
    with DmSys1 do
    begin
      cdsCardLevelPricesXCardDesign.Append;
      cdsCardLevelPricesXCardDesign.FieldBYName('CLP_ID').AsInteger           := cdsCardLevelPrices.FieldByName('CLP_ID').AsInteger;
      cdsCardLevelPricesXCardDesign.FieldBYName('CD_ID').AsInteger            := DmSys.cdsCarddesignCad.FieldByName('CD_ID').AsInteger;
      cdsCardLevelPricesXCardDesign.FieldByName('CLPCD_STATUS').AsString      := 'A';
      cdsCardLevelPricesXCardDesign.FieldBYName('CLPCD_NEWCARD').AsString     := '';
      cdsCardLevelPricesXCardDesign.FieldBYName('CD_DESC').AsString           := DmSys.cdsCarddesignCad.FieldByName('CD_DESC').AsString;
      cdsCardLevelPricesXCardDesign.Post;
      sCD_ID := sCD_ID + DmSys.cdsCarddesignCad.FieldByName('CD_ID').AsString + ',';
    end;
    DmSys.cdsCarddesignCad.Next;
  end;
  dmSys1.RefreshCardDesign;
end;

procedure TfrmCardLevelPrices.IncludeAllHL;
begin
  DmSys.cdsCarddesignCad.First;
  while not DmSys.cdsHotListReason.Eof do
  begin
    with DmSys1 do
    begin
      cdsHotListReasonXCardLPrices.Append;
      cdsHotListReasonXCardLPrices.FieldBYName('CLP_ID').AsInteger            := cdsCardLevelPrices.FieldByName('CLP_ID').AsInteger;
      cdsHotListReasonXCardLPrices.FieldBYName('HLR_ID').AsInteger            := DmSys.cdsHotListReason.FieldByName('HLR_ID').AsInteger;
      cdsHotListReasonXCardLPrices.FieldByName('HLRCLP_STATUS').AsString      := 'A';
      cdsHotListReasonXCardLPrices.FieldBYName('HLR_DESC').AsString           := DmSys.cdsHotListReason.FieldByName('HLR_DESC').AsString;
      cdsHotListReasonXCardLPrices.Post;
      sHL_ID := sHL_ID + DmSys.cdsHotListReason.FieldByName('HLR_ID').AsString + ',';
    end;
    DmSys.cdsHotListReason.Next;
  end;
  dmSys1.RefreshHotListReason;
end;

procedure TfrmCardLevelPrices.spbtIncAllCDClick(Sender: TObject);
begin
  inherited;
  if DmSys.cdsCarddesignCad.RecordCount = 0 then
    exit;
  IncludeAllCD;
end;

procedure TfrmCardLevelPrices.spbtIncAllHLClick(Sender: TObject);
begin
  inherited;
  if DmSys.cdsHotListReason.RecordCount = 0 then
    exit;
  IncludeAllHL;
end;

procedure TfrmCardLevelPrices.ExcludeOneCD;
begin
  with DmSys1 do
  begin
    cdsCardLevelPricesXCardDesign.Delete;
  end;
  dmSys1.RefreshCardDesign;
end;

procedure TfrmCardLevelPrices.ExcludeAllCD;
begin
  with DmSys1 do
  begin
    cdsCardLevelPricesXCardDesign.First;
    while not cdsCardLevelPricesXCardDesign.Eof do
    begin
      cdsCardLevelPricesXCardDesign.Delete;
    end;
    cdsCardLevelPricesXCardDesign.Next;
  end;
  dmSys1.RefreshCardDesign;
end;

procedure TfrmCardLevelPrices.ExcludeOneHL;
begin
  with DmSys1 do
  begin
    cdsHotListReasonXCardLPrices.Delete;
  end;
  dmSys1.RefreshHotListReason;
end;

procedure TfrmCardLevelPrices.ExcludeAllHL;
begin
  with DmSys1 do
  begin
    cdsHotListReasonXCardLPrices.First;
    while not cdsHotListReasonXCardLPrices.Eof do
    begin
      cdsHotListReasonXCardLPrices.Delete;
    end;
    cdsHotListReasonXCardLPrices.Next;
  end;
  dmSys1.RefreshHotListReason;
end;

procedure TfrmCardLevelPrices.spbtDelOneHLClick(Sender: TObject);
begin
  inherited;
  if DmSys1.cdsHotListReasonXCardLPrices.RecordCount = 0 then
    exit;
  ExcludeOneHL;
end;

procedure TfrmCardLevelPrices.spbtDelAllHLClick(Sender: TObject);
begin
  inherited;
  if DmSys1.cdsHotListReasonXCardLPrices.RecordCount = 0 then
    exit;
  sHL_ID := '';
  ExcludeAllHL;
end;

procedure TfrmCardLevelPrices.spbtDelOneCDClick(Sender: TObject);
begin
  inherited;
  if DmSys1.cdsCardLevelPricesXCardDesign.RecordCount = 0 then
    exit;
  ExcludeOneCD;
end;

procedure TfrmCardLevelPrices.spbtDelAllCDClick(Sender: TObject);
begin
  inherited;
  if DmSys1.cdsCardLevelPricesXCardDesign.RecordCount = 0 then
    exit;
  sCD_ID := '';
  ExcludeAllCD;
end;

procedure TfrmCardLevelPrices.pcBaseCadastroChange(Sender: TObject);
begin
  inherited;
  dmSys1.RefreshHotListReason;
  dmSys1.RefreshCardDesign;

end;

procedure TfrmCardLevelPrices.grdResultadoDblClick(Sender: TObject);
begin
  inherited;
  dmSys1.RefreshHotListReason;
  dmSys1.RefreshCardDesign;
end;

procedure TfrmCardLevelPrices.nbSubGruposMTPageChanged(Sender: TObject);
begin
  inherited;
  RepaintComponents( Self );
end;

end.
