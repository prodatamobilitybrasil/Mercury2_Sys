//**********************************
// Orderm da Grid de Funções
//  0 = VF_ID      1 = VF_DESC
//  2 = ACT_CODE   3 = ORDEM
//**********************************

unit uPersonnelTypesXValidatorFcts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmBaseSys, Menus, DB, ActnList, ImgList, StdCtrls, ExtCtrls,
  Grids, DBGrids, ComCtrls, ToolWin, Buttons, DBCtrls, RxLookup, Gauges,
  RXCtrls;

Type
 RecStatus = Record
   VF_ID    : Integer;
   VF_DESC  : String;
   ACT_CODE : Integer;
   PTVF_Sortorder : Integer;
 End;

type
  TfrmPersonnelTypesXValidatorFcts = class(TFrmBaseSys)
    imglstGrid: TImageList;
    pcValidador: TPageControl;
    tsEstado: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    sgFunctions: TStringGrid;
    gbPersonnel: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btnFuncoes: TBitBtn;
    Label11: TLabel;
    pmState: TPopupMenu;
    Normal1: TMenuItem;
    Forado1: TMenuItem;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbVehicleTypes: TRxDBLookupCombo;
    dbPersonnelTypes: TRxDBLookupCombo;
    dbTransportProviders: TRxDBLookupCombo;
    dbLookEmpresa: TRxDBLookupCombo;
    dbLookCargo: TRxDBLookupCombo;
    dbVeiculo: TRxDBLookupCombo;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    sgFuncLiberado: TStringGrid;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Label6: TLabel;
    Panel6: TPanel;
    Label7: TLabel;
    sgFuncOcioso: TStringGrid;
    sgFuncPlaca: TStringGrid;
    sgFuncComercial: TStringGrid;
    pnMove: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    btnCopiaFcts: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    lbOrigem: TListBox;
    lbDestino: TListBox;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    gProgress: TGauge;
    actFuncoesValidador: TAction;
    actCopiaFuncoes: TAction;
    Action1: TAction;
    lbFiltrado: TLabel;
    btnLimpaEmpresa: TSpeedButton;
    btnLimpaCargo: TSpeedButton;
    btnLimpaVeiculo: TSpeedButton;
    Panel7: TPanel;
    lblContador: TRxLabel;
    procedure sgFunctionsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure sfCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actApplyUpdatesExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCancelExecute(Sender: TObject);
    procedure sgFunctionsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Normal1Click(Sender: TObject);
    procedure Forado1Click(Sender: TObject);
    procedure dtsMasterDataChange(Sender: TObject; Field: TField);
    procedure actFilterExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure dbVehicleTypesCloseUp(Sender: TObject);
    procedure dbPersonnelTypesCloseUp(Sender: TObject);
    procedure dbTransportProvidersCloseUp(Sender: TObject);
    procedure pcBaseCadastroChange(Sender: TObject);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure sgFunctionsDblClick(Sender: TObject);
    procedure pcValidadorChange(Sender: TObject);
    procedure sgFuncLiberadoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgFuncOciosoDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgFuncPlacaDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgFuncComercialDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure grdResultadoDblClick(Sender: TObject);
    procedure actFuncoesValidadorExecute(Sender: TObject);
    procedure actCopiaFuncoesExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Entra(Sender: TObject);
    procedure Sai(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure grdResultadoTitleClick(Column: TColumn);
    procedure lbFiltradoClick(Sender: TObject);
    procedure btnLimpaEmpresaClick(Sender: TObject);
    procedure btnLimpaCargoClick(Sender: TObject);
    procedure btnLimpaVeiculoClick(Sender: TObject);
  private
    state : Char;
    Act_code : Integer;
    ct,strOrder,defOrder,strWhere: String; // não esquecer de tirar a variavel local
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    Function  Fim(id:integer) : Integer;
    Function  GetVF_ID(Index, ID : Integer) : String;
    Function  GetVF_DESC(Index, ID : Integer) : String;
    Function  VerificaFuncoes(VF : Integer) : Boolean;
    Function  AddFunction(sGrid : TStringGrid; Line : Integer; VF_ID, VF_DESC, N_F : String) : Boolean;
    Procedure OrderFunctions(sGrid : TStringGrid);
    Procedure ClearGrid(SGrid : TStringGrid);
    Procedure SetVetor;
    Procedure AtualizaVetores;
    procedure SetFunctions(int : Integer);
    Procedure SelStatus(sGrid : TStringGrid; ID : Integer);
    procedure AddFunctions;
    { Private declarations }
  public
    vFechado   : Array of RecStatus;
    vLiberado  : Array of RecStatus;
    vOcioso    : Array of RecStatus;
    vPlaca     : Array of RecStatus;
    vcomercial : Array of RecStatus;
    Procedure SetStatusPanels(Status : Boolean); override;
    { Public declarations }
  end;

var
   frmPersonnelTypesXValidatorFcts: TfrmPersonnelTypesXValidatorFcts;

implementation

uses uDmSys, uValidatorDisplaysMT, AppSparkSysMain, UConst, uGeralFunctions,
  uFuncoes, uDmConexao, uFrmBaseCadastro, Aguarde, dbClient;

{$R *.dfm}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmPersonnelTypesXValidatorFcts.WMMDIActivate(var Msg: TWMMDIActivate);
begin FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmPersonnelTypesXValidatorFcts.FormShow(Sender: TObject);
begin
  inherited;
//    ccardPrsxValidatorFcts = 'DISTINCT PRST.TP_ID, PRST.PRST_ID, PRST.VEHT_ID, '+
  //                              'TP.TP_DESC, PT.PRST_DESC, VEHT.VEHT_DESC';

   defOrder:=' ORDER BY TP.TP_DESC, PT.PRST_DESC, VEHT.VEHT_DESC ';
   strOrder:=defOrder;
   ct:='SELECT '+ ccardPrsxValidatorFcts +
       ' FROM PERSONNELTYPESXVALIDATORFCTS PRST ' +
       'LEFT JOIN TRANSPORTPROVIDERS TP ON ( PRST.TP_ID   = TP.TP_ID ) '+
       'LEFT JOIN VEHICLETYPES     VEHT ON ( PRST.VEHT_ID = VEHT.VEHT_ID ) '+
       'INNER JOIN PERSONNELTYPES    PT ON ( PRST.PRST_ID = PT.PRST_ID ) '+
       '%where% %order%';
   strWhere:=' WHERE TP.TP_STATUS = ''A'' AND PT.PRST_STATUS = ''A'' AND VEHT.VEHT_STATUS = ''A'' ';

   DmSys.cdsPersonneltypesXValidatorfcts.CommandText:='SELECT '+ ccardPrsxValidatorFcts +
       ' FROM PERSONNELTYPESXVALIDATORFCTS PRST ' +
       'LEFT JOIN TRANSPORTPROVIDERS TP ON ( PRST.TP_ID   = TP.TP_ID ) '+
       'LEFT JOIN VEHICLETYPES     VEHT ON ( PRST.VEHT_ID = VEHT.VEHT_ID ) '+
       'INNER JOIN PERSONNELTYPES    PT ON ( PRST.PRST_ID = PT.PRST_ID ) '+  strWhere + defOrder;

   OpenTablesSys([DmSys.cdsPersonnelTypes, DmSys.cdsVehicleTypes,
                  DmSys.cdsTransportProviders, DmSys.cdsValidatorFunctions,
                  DmSys.cdsPersonneltypesXValidatorfcts]);
// FrmSparksysMain.stMain.Panels[3].Text := IntToStr(dmSys.cdsPersonneltypesXValidatorfcts.RecordCount) + ' Registro(s)';
   lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsPersonneltypesXValidatorfcts.RecordCount)+' registro(s)';
   FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

end;

procedure TfrmPersonnelTypesXValidatorFcts.sgFunctionsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  with Sender as TStringGrid do
    begin
       IF sgFunctions.Cells[Acol,ARow] = '.' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,0)
       Else IF sgFunctions.Cells[Acol,ARow] = ',' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,1)
    end;
end;

procedure TfrmPersonnelTypesXValidatorFcts.FormCreate(Sender: TObject);
begin
  inherited;
  dtsMaster.DataSet := DmSys.cdsPersonneltypesXValidatorfcts;

 sgFunctions.ColWidths[0] := 0;
 sgFunctions.ColWidths[1] := 300;
 sgFunctions.ColWidths[2] := 55;
 sgFunctions.ColWidths[3] := 40;

 sgFuncLiberado.ColWidths[0] := 0;
 sgFuncLiberado.ColWidths[1] := 300;
 sgFuncLiberado.ColWidths[2] := 55;
 sgFuncLiberado.ColWidths[3] := 40;

 sgFuncOcioso.ColWidths[0] := 0;
 sgFuncOcioso.ColWidths[1] := 300;
 sgFuncOcioso.ColWidths[2] := 55;
 sgFuncOcioso.ColWidths[3] := 40;

 sgFuncPlaca.ColWidths[0] := 0;
 sgFuncPlaca.ColWidths[1] := 300;
 sgFuncPlaca.ColWidths[2] := 55;
 sgFuncPlaca.ColWidths[3] := 40;

 sgFuncComercial.ColWidths[0] := 0;
 sgFuncComercial.ColWidths[1] := 300;
 sgFuncComercial.ColWidths[2] := 55;
 sgFuncComercial.ColWidths[3] := 40;

end;

procedure TfrmPersonnelTypesXValidatorFcts.sfCloseUp(Sender: TObject);
begin
  inherited;
  IF (dbTransportProviders.Text <> '') and
     (dbPersonnelTypes.Text <> '')     and
     (dbVehicleTypes.Text <> '')       Then
     SetFunctions(pcValidador.ActivePageIndex);
end;

Procedure TfrmPersonnelTypesXValidatorFcts.ClearGrid(SGrid : TStringGrid);
Var
  Pos : Integer;
Begin
  For Pos := 0 to SGrid.RowCount - 1 do
     Begin
       SGrid.Rows[Pos].Clear;
     End;
  SGrid.RowCount := 0;     
End;

Function TfrmPersonnelTypesXValidatorFcts.AddFunction(sGrid : TStringGrid; Line : Integer;
VF_ID, VF_DESC, N_F : String) : Boolean;
Begin
Result := False;
  IF StrtoInt(VF_ID) > -1 Then
    Begin
      sGrid.RowCount := Line + 1;
      sGrid.Cells[0,Line] := VF_ID;
      sGrid.Cells[1,Line] := VF_DESC;
      sGrid.Cells[2,Line] := N_F;
      sGrid.Cells[3,Line] := InttoStr(Line+1);
      Result := True;
    End;
End;

Function TfrmPersonnelTypesXValidatorFcts.Fim(id:integer): Integer;
Var
  ValResult : Integer;
Begin
  ValResult := 0;
  Case id of
     0 : ValResult := High(vFechado);
     1 : ValResult := High(vLiberado);
     2 : ValResult := High(vOcioso);
     3 : ValResult := High(vPlaca);
     4 : ValResult := High(vComercial);
  End;
Result := ValResult;
End;

Function TfrmPersonnelTypesXValidatorFcts.GetVF_ID(Index, ID : Integer) : String;
Var
  ValVF_ID : Integer;
Begin
  ValVF_ID := 0;
  Case Index of
     0 : ValVF_ID := vFechado[ID].VF_ID;
     1 : ValVF_ID := vLiberado[ID].VF_ID;
     2 : ValVF_ID := vOcioso[ID].VF_ID;
     3 : ValVF_ID := vPlaca[ID].VF_ID;
     4 : ValVF_ID := vComercial[ID].VF_ID;
  End;
Result := InttoStr(ValVF_ID);
End;

Function TfrmPersonnelTypesXValidatorFcts.GetVF_DESC(Index, ID : Integer) : String;
Var
 ValVF_DESC : String;
Begin
  Case Index of
     0 : ValVF_DESC := vFechado[ID].VF_DESC;
     1 : ValVF_DESC := vLiberado[ID].VF_DESC;
     2 : ValVF_DESC := vOcioso[ID].VF_DESC;
     3 : ValVF_DESC := vPlaca[ID].VF_DESC;
     4 : ValVF_DESC := vComercial[ID].VF_DESC;
  End;
Result := ValVF_DESC;
End;

procedure TfrmPersonnelTypesXValidatorFcts.SetFunctions(int : integer);
Var I, Pos : Integer;
    N_F : String;
Begin
   With DmSys do
     Begin
      state := 'I';
      dbTransportProviders.Enabled := False;
      dbPersonnelTypes.Enabled := False;
      dbVehicleTypes.Enabled := False;
      btnFuncoes.Enabled := True;

      Case int of
        0 : ClearGrid(sgFunctions);
        1 : ClearGrid(sgFuncLiberado);
        2 : ClearGrid(sgFuncOcioso);
        3 : ClearGrid(sgFuncPlaca);
        4 : ClearGrid(sgFuncComercial);
      End;

      Pos := 0;

        For I := 0 to Fim(Int) do
           Begin

                Case int of
                  0 : Begin
                      IF vFechado[I].ACT_CODE = 0
                         Then N_F := '.'
                         Else N_F := ',';
                       If AddFunction(sgFunctions,   Pos, GetVF_ID(int, I), GetVF_DESC(int, I), N_F) Then
                          Inc(Pos);
                      End;

                  1 : Begin
                      IF vLiberado[I].ACT_CODE = 0
                         Then N_F := '.'
                         Else N_F := ',';
                       IF AddFunction(sgFuncLiberado,  Pos, GetVF_ID(int, I), GetVF_DESC(int, I), N_F) Then
                          Inc(Pos);
                      End;

                  2 : Begin
                        IF vOcioso[I].ACT_CODE = 0
                           Then N_F := '.'
                           Else N_F := ',';
                        If AddFunction(sgFuncOcioso,    Pos, GetVF_ID(int, I), GetVF_DESC(int, I), N_F) Then
                           Inc(Pos);
                      End;

                  3 : Begin
                        IF vPlaca[I].ACT_CODE = 0
                           Then N_F := '.'
                           Else N_F := ',';
                        If AddFunction(sgFuncPlaca,     Pos, GetVF_ID(int, I), GetVF_DESC(int, I), N_F) Then
                           Inc(Pos);
                      End;

                  4 : Begin
                        IF vComercial[I].ACT_CODE = 0
                           Then N_F := '.'
                           Else N_F := ',';
                        If AddFunction(sgFuncComercial, Pos, GetVF_ID(int, I), GetVF_DESC(int, I), N_F) Then
                           Inc(Pos);
                      End;
                End;

             cdsValidatorFunctions.Next;
           End;
     End;
End;

Function TfrmPersonnelTypesXValidatorFcts.VerificaFuncoes(VF : Integer) : Boolean;
Var
  I : Integer;
Begin
Result := False;
  Case pcValidador.activePageIndex of
     0 : Begin
           For I := 0 to High(vFechado) do
             IF VF = vFechado[I].VF_ID Then
                Begin
                  Result := True;
                  Break;
                End;
         End;

     1 : Begin
           For I := 0 to High(vLiberado) do
             IF VF = vLiberado[I].VF_ID Then
                Begin
                  Result := True;
                  Break;
                End;
         End;

     2 : Begin
           For I := 0 to High(vOcioso) do
             IF VF = vOcioso[I].VF_ID Then
                Begin
                  Result := True;
                  Break;
                End;
         End;


     3 : Begin
           For I := 0 to High(vPlaca) do
             IF VF = vPlaca[I].VF_ID Then
                Begin
                  Result := True;
                  Break;
                End;
         End;

     4 : Begin
           For I := 0 to High(vComercial) do
             IF VF = vComercial[I].VF_ID Then
                Begin
                  Result := True;
                  Break;
                End;
         End;

  End;

End;

Procedure TfrmPersonnelTypesXValidatorFcts.OrderFunctions(sGrid : TStringGrid);
Var
  I, J, Pos : Integer;
Begin
  Pos := 0;
  For I := 0 to sGrid.RowCount -1 do
     For J := 0 to FrmFuncoes.lbSelecionadas.Count -1 do
         IF inttoStr(Integer(FrmFuncoes.lbSelecionadas.items.Objects[J])) = sGrid.Cells[0,I] Then
            Begin
              FrmFuncoes.lbSelecionadas.Items.Move(J, Pos);
              Inc(Pos);
              Break;
            End;
end;

Procedure TfrmPersonnelTypesXValidatorFcts.AtualizaVetores;
 Var
  I : Integer;
   Function TrataAct_code(ActCode : String) : Integer;
      Begin
         Result := 0;
           Case ActCode[1] of
             '.' : Result := 0;
             ',' : Result := 1;
           End;
      End;

Begin
  Case pcValidador.ActivePageIndex of
     0 : Begin
           SetLength(vFechado, 0);
           SetLength(vFechado, sgFunctions.RowCount );
           For I := 0 To sgFunctions.RowCount -1 do
              IF sgFunctions.cells[0,0] <> '' then
              Begin

                vFechado[I].VF_ID    := StrtoInt(sgFunctions.cells[0,I]);
                vFechado[I].VF_DESC  := sgFunctions.cells[1,I];
                vFechado[I].ACT_CODE := TrataAct_code(sgFunctions.cells[2,I]);
                vFechado[I].PTVF_Sortorder := StrtoInt(sgFunctions.cells[3,I]);
              End;
         End;

     1 : Begin
           SetLength(vLiberado, 0);
           SetLength(vLiberado, sgFuncLiberado.RowCount);
           For I := 0 To sgFuncLiberado.RowCount -1 do
             IF sgFuncLiberado.cells[0,0] <> '' then
              Begin
                vLiberado[I].VF_ID    := StrtoInt(sgFuncLiberado.cells[0,I]);
                vLiberado[I].VF_DESC  := sgFuncLiberado.cells[1,I];
                vLiberado[I].ACT_CODE := TrataAct_code(sgFuncLiberado.cells[2,I]);
                vLiberado[I].PTVF_Sortorder := StrtoInt(sgFuncLiberado.cells[3,I]);
              End;
         End;

     2: Begin
           SetLength(vOcioso, 0);
           SetLength(vOcioso, sgFuncOcioso.RowCount);
           For I := 0 To sgFuncOcioso.RowCount -1 do
             IF sgFuncOcioso.cells[0,0] <> '' then
              Begin
                vOcioso[I].VF_ID    := StrtoInt(sgFuncOcioso.cells[0,I]);
                vOcioso[I].VF_DESC  := sgFuncOcioso.cells[1,I];
                vOcioso[I].ACT_CODE := TrataAct_code(sgFuncOcioso.cells[2,I]);
                vOcioso[I].PTVF_Sortorder := StrtoInt(sgFuncOcioso.cells[3,I]);
              End;
        End;

     3 : Begin
           SetLength(vPlaca, 0);
           SetLength(vPlaca, sgFuncPlaca.RowCount);
           For I := 0 To sgFuncPlaca.RowCount -1 do
             IF sgFuncPlaca.cells[0,0] <> '' then
              Begin
                vPlaca[I].VF_ID    := StrtoInt(sgFuncPlaca.cells[0,I]);
                vPlaca[I].VF_DESC  := sgFuncPlaca.cells[1,I];
                vPlaca[I].ACT_CODE := TrataAct_code(sgFuncPlaca.cells[2,I]);
                vPlaca[I].PTVF_Sortorder := StrtoInt(sgFuncPlaca.cells[3,I]);
              End;
        End;

     4 : Begin
           SetLength(vComercial, 0);
           SetLength(vComercial, sgFuncComercial.RowCount);
           For I := 0 To sgFuncComercial.RowCount -1 do
             IF sgFuncComercial.cells[0,0] <> '' then
              Begin
                vComercial[I].VF_ID    := StrtoInt(sgFuncComercial.cells[0,I]);
                vComercial[I].VF_DESC  := sgFuncComercial.cells[1,I];
                vComercial[I].ACT_CODE := TrataAct_code(sgFuncComercial.cells[2,I]);
                vComercial[I].PTVF_Sortorder := StrtoInt(sgFuncComercial.cells[3,I]);
              End;
        End;
  End;
End;


Procedure TfrmPersonnelTypesXValidatorFcts.AddFunctions;
 Var I : integer;
Begin
  Act_code := -1;
  with sgFunctions do
   Begin
     For I := 0 to RowCount - 1 do
       Begin
            IF Cells[2,I] = '.' Then //Normal...
               Act_code := 0
            Else
            IF Cells[2,I] = ',' Then //Forçado...
               Act_code := 1
            Else Act_code := -1;

            IF Act_code >= 0 Then
               Begin
                  dmSys.cdsValidatorFunctions.Insert;
                  dmSys.cdsValidatorFunctions.FieldByName('PRST_ID').AsString  := dbPersonnelTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsString    := Cells[0,I];
                  dmSys.cdsValidatorFunctions.FieldByName('VS_ID').AsInteger   := 1;
                  dmSys.cdsValidatorFunctions.FieldByName('VEHT_ID').AsString  := dbVehicleTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('TP_ID').AsString    := dbTransportProviders.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('ACT_CODE').AsString := InttoStr(Act_code);
                  dmSys.cdsValidatorFunctions.FieldByName('PTVF_SORTORDER').AsInteger := StrtoInt(Cells[3,I]);
                  dmSys.cdsValidatorFunctions.Post;
               End;
       End;
   End;

  with sgFuncLiberado do
   Begin
     For I := 0 to RowCount - 1 do
        Begin
            IF Cells[2,I] = '.' Then //Normal...
               Act_code := 0
            Else
            IF Cells[2,I] = ',' Then //Forçado...
               Act_code := 1
            Else Act_code := -1;

            IF Act_code >= 0 Then
               Begin
                  dmSys.cdsValidatorFunctions.Insert;
                  dmSys.cdsValidatorFunctions.FieldByName('PRST_ID').AsString  := dbPersonnelTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsString    := Cells[0,I];
                  dmSys.cdsValidatorFunctions.FieldByName('VS_ID').AsInteger   := 2;
                  dmSys.cdsValidatorFunctions.FieldByName('VEHT_ID').AsString  := dbVehicleTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('TP_ID').AsString    := dbTransportProviders.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('ACT_CODE').AsString := InttoStr(Act_code);
                  dmSys.cdsValidatorFunctions.FieldByName('PTVF_SORTORDER').AsInteger := StrtoInt(Cells[3,I]);
                  dmSys.cdsValidatorFunctions.Post;
               End;
        End;
   End;

  with sgFuncOcioso do
   Begin
     For I := 0 to RowCount - 1 do
        Begin
            IF Cells[2,I] = '.' Then //Normal...
               Act_code := 0
            Else
            IF Cells[2,I] = ',' Then //Forçado...
               Act_code := 1
            Else Act_code := -1;

            IF Act_code >= 0 Then
               Begin
                  dmSys.cdsValidatorFunctions.Insert;
                  dmSys.cdsValidatorFunctions.FieldByName('PRST_ID').AsString  := dbPersonnelTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsString    := Cells[0,I];
                  dmSys.cdsValidatorFunctions.FieldByName('VS_ID').AsInteger   := 3;
                  dmSys.cdsValidatorFunctions.FieldByName('VEHT_ID').AsString  := dbVehicleTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('TP_ID').AsString    := dbTransportProviders.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('ACT_CODE').AsString := InttoStr(Act_code);
                  dmSys.cdsValidatorFunctions.FieldByName('PTVF_SORTORDER').AsInteger := StrtoInt(Cells[3,I]);
                  dmSys.cdsValidatorFunctions.Post;
               End;
        End;
   End;


  with sgFuncPlaca do
   Begin
     For I := 0 to RowCount - 1 do
       Begin
            IF Cells[2,I] = '.' Then //Normal...
               Act_code := 0
            Else
            IF Cells[2,I] = ',' Then //Forçado...
               Act_code := 1
            Else Act_code := -1;

            IF Act_code >= 0 Then
               Begin
                  dmSys.cdsValidatorFunctions.Insert;
                  dmSys.cdsValidatorFunctions.FieldByName('PRST_ID').AsString  := dbPersonnelTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsString    := Cells[0,I];
                  dmSys.cdsValidatorFunctions.FieldByName('VS_ID').AsInteger   := 4;
                  dmSys.cdsValidatorFunctions.FieldByName('VEHT_ID').AsString  := dbVehicleTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('TP_ID').AsString    := dbTransportProviders.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('ACT_CODE').AsString := InttoStr(Act_code);
                  dmSys.cdsValidatorFunctions.FieldByName('PTVF_SORTORDER').AsInteger := StrtoInt(Cells[3,I]);
                  dmSys.cdsValidatorFunctions.Post;
               End;
       End;
   End;


  with sgFuncComercial do
   Begin
     For I := 0 to RowCount - 1 do
       Begin
            IF Cells[2,I] = '.' Then //Normal...
               Act_code := 0
            Else
            IF Cells[2,I] = ',' Then //Forçado...
               Act_code := 1
            Else Act_code := -1;

            IF Act_code >= 0 Then
               Begin
                  dmSys.cdsValidatorFunctions.Insert;
                  dmSys.cdsValidatorFunctions.FieldByName('PRST_ID').AsString  := dbPersonnelTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsString    := Cells[0,I];
                  dmSys.cdsValidatorFunctions.FieldByName('VS_ID').AsInteger   := 5;
                  dmSys.cdsValidatorFunctions.FieldByName('VEHT_ID').AsString  := dbVehicleTypes.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('TP_ID').AsString    := dbTransportProviders.KeyValue;
                  dmSys.cdsValidatorFunctions.FieldByName('ACT_CODE').AsString := InttoStr(Act_code);
                  dmSys.cdsValidatorFunctions.FieldByName('PTVF_SORTORDER').AsInteger := StrtoInt(Cells[3,I]);
                  dmSys.cdsValidatorFunctions.Post;
               End;
       End;
   End;

End;

procedure TfrmPersonnelTypesXValidatorFcts.actApplyUpdatesExecute(
  Sender: TObject);
begin
 if Trim(dbTransportProviders.Text) = '' then
 begin
   MessageDlg('Campo obrigatório',mtInformation,[mbOK],0);
   dbTransportProviders.SetFocus;
   Exit;
 end;
 if Trim(dbPersonnelTypes.Text) = '' then
 begin
   MessageDlg('Campo obrigatório',mtInformation,[mbOK],0);
   dbPersonnelTypes.SetFocus;
   Exit;
 end;
 if Trim(dbVehicleTypes.Text) = '' then
 begin
   MessageDlg('Campo obrigatório',mtInformation,[mbOK],0);
   dbVehicleTypes.SetFocus;
   Exit;
 end;

 inherited;
  If  status = stConsult Then
    BEGIN

      DmSys.cdsValidatorFunctions.First;

      dmSys.cdsValidatorFunctions.Filter := '';
      dmSys.cdsValidatorFunctions.Filtered := False;

     //Deletando Funções antigas...
      While NOT DmSys.cdsValidatorFunctions.Eof do
          DmSys.cdsValidatorFunctions.Delete;

     //Adcionando novas funções...
      AddFunctions;

     If ApplyTablesSys([], [DmSys.cdsValidatorFunctions]) Then
         begin
           SetActions([], True, FrmPersonnelTypesXValidatorFcts, t_form_objects);
           SetActions([actApplyUpdates, actCancel], False, FrmPersonnelTypesXValidatorFcts, t_form_objects);
           status := stConsult;
           tbtnRefresh.Click;
           pcBaseCadastro.ActivePageIndex := 0;
           FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
         end;
    END;
end;

procedure TfrmPersonnelTypesXValidatorFcts.actEditExecute(Sender: TObject);
Var
  I : Integer;
begin
  inherited;
  SetActions([], False, frmPersonnelTypesXValidatorFcts, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, frmPersonnelTypesXValidatorFcts, t_form_objects);
  dbTransportProviders.KeyValue := dtsMaster.DataSet.FieldByName('TP_ID').AsString;
  dbPersonnelTypes.KeyValue     := dtsMaster.DataSet.FieldByName('PRST_ID').AsString;
  dbVehicleTypes.KeyValue       := dtsMaster.DataSet.FieldByName('VEHT_ID').AsString;
  SetVetor;
  pcValidador.ActivePageIndex := 0;
  For I := 0  to 4 do
    SetFunctions(I);
end;

procedure TfrmPersonnelTypesXValidatorFcts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  IF NOT (actExit.Enabled) Then
   Begin
    Action := caNone;
    DisplayMsg(t_form_objects, '%T', [2802], [], mtInformation, [mbOK]);
   End
  Else
   Begin
      CloseTablesSys([DmSys.cdsPersonnelTypes, DmSys.cdsVehicleTypes,
                       DmSys.cdsTransportProviders, DmSys.cdsValidatorFunctions,
                       DmSys.cdsPersonneltypesXValidatorfcts]);
      DmSys.cdsPersonneltypesXValidatorfcts.CommandText := 'SELECT '+ ccardPrsxValidatorFcts +
      ' FROM PERSONNELTYPESXVALIDATORFCTS PRST ' +
      'LEFT JOIN TRANSPORTPROVIDERS TP ON ( PRST.TP_ID   = TP.TP_ID ) '+
      'LEFT JOIN VEHICLETYPES     VEHT ON ( PRST.VEHT_ID = VEHT.VEHT_ID ) '+
      'INNER JOIN PERSONNELTYPES    PT ON ( PRST.PRST_ID = PT.PRST_ID ) '+
      'WHERE TP.TP_STATUS = ''A'' AND PT.PRST_STATUS = ''A'' AND VEHT.VEHT_STATUS = ''A'' '+
      ' ORDER BY TP.TP_DESC, PT.PRST_DESC, VEHT.VEHT_DESC ';
      FrmPersonnelTypesXValidatorFcts := Nil;
   End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.actCancelExecute(
  Sender: TObject);
begin
//  inherited;
  If DisplayMsg(t_form_objects, '%T', [1509], [], mtConfirmation, [mbYes, mbNo]) = mrYes Then
    begin
     dmSys.cdsPersonneltypesXValidatorfcts.Cancel;
     SetActions([], True, FrmPersonnelTypesXValidatorFcts, t_form_objects);
     SetActions([actApplyUpdates, actCancel], False, FrmPersonnelTypesXValidatorFcts, t_form_objects);
     pcBaseCadastro.ActivePageIndex := 0;
     Status := stConsult;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
    end;
end;

procedure TfrmPersonnelTypesXValidatorFcts.Normal1Click(Sender: TObject);
begin
    IF sgFunctions.Col = 2 Then
       sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] := ',';
       
   Case pcValidador.ActivePageIndex of
       0 : SelStatus(sgFunctions,     pcValidador.ActivePageIndex  );
       1 : SelStatus(sgFuncLiberado,  pcValidador.ActivePageIndex  );
       2 : SelStatus(sgFuncOcioso,    pcValidador.ActivePageIndex  );
       3 : SelStatus(sgFuncPlaca,     pcValidador.ActivePageIndex  );
       4 : SelStatus(sgFuncComercial, pcValidador.ActivePageIndex  );
  End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.Forado1Click(Sender: TObject);
begin
    IF sgFunctions.Col = 2  Then
    sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] := '.';
   Case pcValidador.ActivePageIndex of
       0 : SelStatus(sgFunctions,     pcValidador.ActivePageIndex  );
       1 : SelStatus(sgFuncLiberado,  pcValidador.ActivePageIndex  );
       2 : SelStatus(sgFuncOcioso,    pcValidador.ActivePageIndex  );
       3 : SelStatus(sgFuncPlaca,     pcValidador.ActivePageIndex  );
       4 : SelStatus(sgFuncComercial, pcValidador.ActivePageIndex  );
  End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.sgFunctionsMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
  var
  Pt : TPoint;
  Coluna, Linha : integer;
begin
   if (Button = mbRight) Then
    Begin
      GetCursorPos(Pt);
      Pt := sgFunctions.ScreenToClient(Pt);

      sgFunctions.MouseToCell(pt.x, pt.Y, Coluna, Linha);
      Mouse_Event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, Pt.x, Pt.y, 0, 0);
    End;


{   if (Button = mbLeft) And
      (status <> stConsult) Then
    IF (sgFunctions.Col > 1) Then
       IF sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] = '' Then
          sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] := '.'
       Else
       IF sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] = '.' Then
          sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] := ','
       Else
       IF sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] = ',' Then
          sgFunctions.Cells[sgFunctions.Col, sgFunctions.Row] := '';
}
end;

procedure TfrmPersonnelTypesXValidatorFcts.dtsMasterDataChange(
  Sender: TObject; Field: TField);
Var
  I : Integer;
begin
  inherited;
  IF (dtsMaster.DataSet.RecordCount > 0) and
     (dtsMaster.DataSet.state <> dsinsert) Then
     Begin
        dbTransportProviders.KeyValue := dtsMaster.DataSet.FieldByName('TP_ID').AsString;
        dbPersonnelTypes.KeyValue     := dtsMaster.DataSet.FieldByName('PRST_ID').AsString;
        dbVehicleTypes.KeyValue       := dtsMaster.DataSet.FieldByName('VEHT_ID').AsString;
        SetVetor;
        pcValidador.ActivePageIndex := 0;
        For I := 0  to 4 do
        SetFunctions(I);
      End
end;

Procedure TfrmPersonnelTypesXValidatorFcts.SetVetor;
Var
  I, Pos : Integer;
Begin
   SetLength(vFechado, 0);
   SetLength(vLiberado, 0);
   SetLength(vOcioso, 0);
   SetLength(vPlaca, 0);
   SetLength(vComercial, 0);

   For I := 1 to 5 do
     Begin
      Pos := 0;
      dmSys.cdsValidatorFunctions.Close;
      dmSys.cdsValidatorFunctions.Params.ParamByName('PRST_ID').AsString := dbPersonnelTypes.KeyValue;
      dmSys.cdsValidatorFunctions.Params.ParamByName('VEHT_ID').AsString := dbVehicleTypes.KeyValue;
      dmSys.cdsValidatorFunctions.Params.ParamByName('TP_ID').AsString   := dbTransportProviders.KeyValue;
      dmSys.cdsValidatorFunctions.Filter := 'VS_ID = '+InttoStr(I);
      dmSys.cdsValidatorFunctions.Filtered := True;

      dmSys.cdsValidatorFunctions.Open;


      While Not dmSys.cdsValidatorFunctions.Eof do
        Begin
           Case I of
             1 : Begin
                   SetLength(vFechado, dmSys.cdsValidatorFunctions.RecordCount);
                   vFechado[Pos].VF_ID    := dmSys.cdsValidatorFunctions.fieldByname('VF_ID').AsInteger;
                   vFechado[Pos].VF_DESC  := dmSys.cdsValidatorFunctions.fieldByname('VF_DESC').AsString;
                   vFechado[Pos].ACT_CODE := dmSys.cdsValidatorFunctions.fieldByname('ACT_CODE').AsInteger;
                   vFechado[Pos].PTVF_Sortorder := dmSys.cdsValidatorFunctions.fieldByname('PTVF_SORTORDER').AsInteger;
                 End;

             2 : Begin
                   SetLength(vLiberado, dmSys.cdsValidatorFunctions.RecordCount);
                   vLiberado[Pos].VF_ID    := dmSys.cdsValidatorFunctions.fieldByname('VF_ID').AsInteger;
                   vLiberado[Pos].VF_DESC  := dmSys.cdsValidatorFunctions.fieldByname('VF_DESC').AsString;
                   vLiberado[Pos].ACT_CODE := dmSys.cdsValidatorFunctions.fieldByname('ACT_CODE').AsInteger;
                   vLiberado[Pos].PTVF_Sortorder := dmSys.cdsValidatorFunctions.fieldByname('PTVF_SORTORDER').AsInteger;
                 End;


             3 : Begin
                   SetLength(vOcioso, dmSys.cdsValidatorFunctions.RecordCount);
                   vOcioso[Pos].VF_ID    := dmSys.cdsValidatorFunctions.fieldByname('VF_ID').AsInteger;
                   vOcioso[Pos].VF_DESC  := dmSys.cdsValidatorFunctions.fieldByname('VF_DESC').AsString;
                   vOcioso[Pos].ACT_CODE := dmSys.cdsValidatorFunctions.fieldByname('ACT_CODE').AsInteger;
                   vOcioso[Pos].PTVF_Sortorder := dmSys.cdsValidatorFunctions.fieldByname('PTVF_SORTORDER').AsInteger;
                 End;

             4 : Begin
                   SetLength(vPlaca, dmSys.cdsValidatorFunctions.RecordCount);
                   vPlaca[Pos].VF_ID    := dmSys.cdsValidatorFunctions.fieldByname('VF_ID').AsInteger;
                   vPlaca[Pos].VF_DESC  := dmSys.cdsValidatorFunctions.fieldByname('VF_DESC').AsString;
                   vPlaca[Pos].ACT_CODE := dmSys.cdsValidatorFunctions.fieldByname('ACT_CODE').AsInteger;
                   vPlaca[Pos].PTVF_Sortorder := dmSys.cdsValidatorFunctions.fieldByname('PTVF_SORTORDER').AsInteger;
                 End;

             5 : Begin
                   SetLength(vComercial, dmSys.cdsValidatorFunctions.RecordCount);
                   vComercial[Pos].VF_ID    := dmSys.cdsValidatorFunctions.fieldByname('VF_ID').AsInteger;
                   vComercial[Pos].VF_DESC  := dmSys.cdsValidatorFunctions.fieldByname('VF_DESC').AsString;
                   vComercial[Pos].ACT_CODE := dmSys.cdsValidatorFunctions.fieldByname('ACT_CODE').AsInteger;
                   vComercial[Pos].PTVF_Sortorder := dmSys.cdsValidatorFunctions.fieldByname('PTVF_SORTORDER').AsInteger;
                 End;

           End; // Case...
         dmSys.cdsValidatorFunctions.Next;
         Inc(Pos);
        End;
    End;

End;

procedure TfrmPersonnelTypesXValidatorFcts.actFilterExecute(
  Sender: TObject);
Var qtd_campos: Integer;


    procedure BuiltStrWhere;
    Var
    i : integer;
    Begin
     qtd_campos := 0;
     strWhere  := '';

     If Trim(dbLookempresa.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRST.TP_ID = ' + QuotedStr(dbLookempresa.KeyValue) + ' AND ';
       end;


     If Trim(dbLookCargo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRST.PRST_ID = ' + QuotedStr(dbLookCargo.KeyValue) + ' AND ';
       end;


     If Trim(dbVeiculo.text) <> '' Then
       begin
         Inc(qtd_campos);
         strWhere := strWhere + ' PRST.VEHT_ID = ' + QuotedStr(dbVeiculo.KeyValue) + ' AND ';
       end;


      strWhere := strWhere +' TP.TP_STATUS = ''A'' AND PT.PRST_STATUS = ''A'' AND VEHT.VEHT_STATUS = ''A'' AND';
//    Inc(qtd_campos);

      // Verifica se é necessário tirar o AND

//    if qtd_campos > 0 then
      if strWhere <> '' then
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
     FormAguarde.lblPosi.Caption:='S E L E C I O N A N D O'; FormAguarde.Show; Screen.Cursor:=crHourGlass; Application.ProcessMessages;
     cdsPersonneltypesXValidatorfcts.Close;
     cdsPersonneltypesXValidatorfcts.CommandText :=
//   ccardPrsxValidatorFcts = 'DISTINCT PRST.TP_ID, PRST.PRST_ID, PRST.VEHT_ID, '+
//                            '         TP.TP_DESC, PT.PRST_DESC, VEHT.VEHT_DESC ';

     'SELECT '+ccardPrsxValidatorFcts+' '#13+
     'FROM PERSONNELTYPESXVALIDATORFCTS PRST '#13 +
     'LEFT JOIN TRANSPORTPROVIDERS TP ON ( PRST.TP_ID   = TP.TP_ID ) '#13+
     'LEFT JOIN VEHICLETYPES     VEHT ON ( PRST.VEHT_ID = VEHT.VEHT_ID ) '#13+
     'INNER JOIN PERSONNELTYPES    PT ON ( PRST.PRST_ID = PT.PRST_ID ) '#13+
      strWhere + strOrder; // 'ORDER BY TP.TP_DESC, PT.PRST_DESC, VEHT.VEHT_DESC ';
//    ShowMessage(cdsPersonneltypesXValidatorfcts.CommandText);
      cdsPersonneltypesXValidatorfcts.Open;

//   FrmSparksysMain.stMain.Panels[3].Text := intToStr(cdsPersonneltypesXValidatorfcts.RecordCount) + ' Registro(s)';
     lblContador.Caption:=FormatFloat('#,##0',DmSys.cdsPersonneltypesXValidatorfcts.RecordCount)+' registro(s)';
     FrmSparksysMain.stMain.Panels[3].Text:=lblContador.Caption;

    FormAguarde.Hide; Screen.Cursor:=crDefault; Application.ProcessMessages;
    lbFiltrado.Visible:=qtd_campos > 0;
    end
end;

procedure TfrmPersonnelTypesXValidatorFcts.actInsertExecute(
  Sender: TObject);
begin
  inherited;
  SetActions([], False, FrmPersonnelTypesXValidatorFcts, t_form_objects);
  SetActions([actApplyUpdates, actCancel], true, FrmPersonnelTypesXValidatorFcts, t_form_objects);
  dbTransportProviders.KeyValue  := -1;
  dbPersonnelTypes.KeyValue      := -1;
  dbVehicleTypes.KeyValue        := -1;
  dbTransportProviders.Enabled   := True;
  dbPersonnelTypes.Enabled       := True;
  dbVehicleTypes.Enabled         := True;

  ClearGrid(sgFunctions);
  ClearGrid(sgFuncLiberado);
  ClearGrid(sgFuncOcioso);
  ClearGrid(sgFuncPlaca);
  ClearGrid(sgFuncComercial);

  sgFunctions.RowCount := 0;
  SetStatusPanels(True);
  btnFuncoes.Enabled := False;
  pcBaseCadastro.ActivePageIndex := 1;
//  Status := stInsert;
  FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

Procedure TfrmPersonnelTypesXValidatorFcts.SetStatusPanels(Status : Boolean);
Begin
// sgFunctions.Enabled := Status;
 pnMove.Enabled      := Status;
 gbPersonnel.enaBled := Status;
End;

procedure TfrmPersonnelTypesXValidatorFcts.dbVehicleTypesCloseUp(
  Sender: TObject);
Var I : Integer;
begin
  inherited;
  IF (dbTransportProviders.Text <> '') and
     (dbPersonnelTypes.Text <> '')     and
     (dbVehicleTypes.Text <> '')       Then
  Begin
    SetVetor;
    For I := 0  to 4 do
       SetFunctions(I);
//    SetFunctions(pcValidador.ActivePageIndex);
  End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.dbPersonnelTypesCloseUp(
  Sender: TObject);
begin
  inherited;
  IF (dbTransportProviders.Text <> '') and
     (dbPersonnelTypes.Text <> '')     and
     (dbVehicleTypes.Text <> '')       Then
     SetFunctions(pcValidador.ActivePageIndex);
end;

procedure TfrmPersonnelTypesXValidatorFcts.dbTransportProvidersCloseUp(
  Sender: TObject);
begin
  inherited;
  IF (dbTransportProviders.Text <> '') and
     (dbPersonnelTypes.Text <> '')     and
     (dbVehicleTypes.Text <> '')       Then
     SetFunctions(pcValidador.ActivePageIndex);
end;

procedure TfrmPersonnelTypesXValidatorFcts.pcBaseCadastroChange(
  Sender: TObject);
begin
  inherited;
  IF pcBaseCadastro.ActivePageIndex = 1 Then  //Manutenção...
     Begin
      pcValidador.ActivePageIndex := 0;
      SetStatusPanels(False);
      SetActions([actFilter, actDelete, actRefresh], False, FrmPersonnelTypesXValidatorFcts, t_form_objects);
     End
  Else
    Begin
      SetActions([actFilter, actDelete, actRefresh], True, FrmPersonnelTypesXValidatorFcts, t_form_objects);
    End;
     FrmSparksysMain.stMain.Panels[2].Text := GetState(Status);
end;

procedure TfrmPersonnelTypesXValidatorFcts.lbSelecionadasDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TfrmPersonnelTypesXValidatorFcts.lbDisponiveisDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source is TlistBox;
end;

procedure TfrmPersonnelTypesXValidatorFcts.sgFunctionsDblClick(
  Sender: TObject);
begin
  inherited;
 IF sgFunctions.Cells[0,0] <> '' Then
   Begin
      Case pcValidador.ActivePageIndex of
           0 : SelStatus(sgFunctions,     pcValidador.ActivePageIndex  );
           1 : SelStatus(sgFuncLiberado,  pcValidador.ActivePageIndex  );
           2 : SelStatus(sgFuncOcioso,    pcValidador.ActivePageIndex  );
           3 : SelStatus(sgFuncPlaca,     pcValidador.ActivePageIndex  );
           4 : SelStatus(sgFuncComercial, pcValidador.ActivePageIndex  );
      End;
   End;
end;

Procedure TfrmPersonnelTypesXValidatorFcts.SelStatus(sGrid : TStringGrid; ID : Integer);
  var
  I, ACTCODE, VF_ID : Integer;
Begin
   IF (status <> stConsult) Then
    IF (sGrid.Col = 2) Then
       IF sGrid.Cells[sGrid.Col, sGrid.Row] = '.' Then
          sGrid.Cells[sGrid.Col, sGrid.Row] := ','
       Else
       IF sGrid.Cells[sGrid.Col, sGrid.Row] = ',' Then
          sGrid.Cells[sGrid.Col, sGrid.Row] := '.';

       VF_ID := StrtoInt(sGrid.cells[0, sGrid.Row]);
       IF sGrid.Cells[sGrid.Col, sGrid.Row] = '.'
          Then ACTCODE := 0
          Else ACTCODE := 1;

       Case ID of
         0 : Begin
                For I := 0 to High(vFechado) do
                   IF vFechado[I].VF_ID = VF_ID Then
                      vFechado[I].ACT_CODE := ACTCODE;
             End;

         1 : Begin
                For I := 0 to High(vLiberado) do
                   IF vLiberado[I].VF_ID = VF_ID Then
                      vLiberado[I].ACT_CODE := ACTCODE;
             End;

         2 : Begin
                For I := 0 to High(vOcioso) do
                   IF vOcioso[I].VF_ID = VF_ID Then
                      vOcioso[I].ACT_CODE := ACTCODE;
             End;

         3 : Begin
                For I := 0 to High(vPlaca) do
                   IF vPlaca[I].VF_ID = VF_ID Then
                      vPlaca[I].ACT_CODE := ACTCODE;
             End;

         4 : Begin
                For I := 0 to High(vComercial) do
                   IF vComercial[I].VF_ID = VF_ID Then
                      vComercial[I].ACT_CODE := ACTCODE;
             End;

       End;//Case...

End;

procedure TfrmPersonnelTypesXValidatorFcts.pcValidadorChange(
  Sender: TObject);
begin
  inherited;
//  SetFunctions(pcValidador.ActivePageIndex);
end;

procedure TfrmPersonnelTypesXValidatorFcts.sgFuncLiberadoDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  inherited;
  with Sender as TStringGrid do
    begin
       IF sgFuncLiberado.Cells[Acol,ARow] = '.' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,0)
       Else IF sgFuncLiberado.Cells[Acol,ARow] = ',' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,1)
    end;
end;

procedure TfrmPersonnelTypesXValidatorFcts.sgFuncOciosoDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  inherited;
  with Sender as TStringGrid do
    begin
       IF sgFuncOcioso.Cells[Acol,ARow] = '.' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,0)
       Else IF sgFuncOcioso.Cells[Acol,ARow] = ',' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,1)
    end;

end;

procedure TfrmPersonnelTypesXValidatorFcts.sgFuncPlacaDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  inherited;
  with Sender as TStringGrid do
    begin
       IF sgFuncPlaca.Cells[Acol,ARow] = '.' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,0)
       Else IF sgFuncPlaca.Cells[Acol,ARow] = ',' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,1)
    end;

end;

procedure TfrmPersonnelTypesXValidatorFcts.sgFuncComercialDrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
begin
  inherited;
  with Sender as TStringGrid do
    begin
       IF sgFuncComercial.Cells[Acol,ARow] = '.' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,0)
       Else IF sgFuncComercial.Cells[Acol,ARow] = ',' Then
          imglstGrid.Draw(canvas,Rect.Left,Rect.Top,1)
    end;
end;

procedure TfrmPersonnelTypesXValidatorFcts.BitBtn1Click(Sender: TObject);
 Var
   vTemp : Array of RecStatus;

   Function TrataAct_code(ActCode : String) : Integer;
      Begin
        Result := 0;
           Case ActCode[1] of
             '.' : Result := 0;
             ',' : Result := 1;
           End;
      End;

   Function TrataAct_CodInv(ActCode : Integer) : String;
      Begin
           Case ActCode of
             0 : Result := '.';
             1 : Result := ',';
           End;

      End;
begin
  inherited;

  Case pcValidador.ActivePageIndex of
     0 : Begin  //Fechado...
           IF sgFunctions.Row > 0 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFunctions.cells[0, sgFunctions.Row]);
                vTemp[0].VF_DESC         := sgFunctions.cells[1, sgFunctions.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFunctions.cells[2, sgFunctions.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFunctions.cells[3, sgFunctions.Row]);

                sgFunctions.cells[0, sgFunctions.Row] := sgFunctions.cells[0, sgFunctions.Row - 1];
                sgFunctions.cells[1, sgFunctions.Row] := sgFunctions.cells[1, sgFunctions.Row - 1];
                sgFunctions.cells[2, sgFunctions.Row] := sgFunctions.cells[2, sgFunctions.Row - 1];

                sgFunctions.cells[0, sgFunctions.Row - 1] := InttoStr(vTemp[0].VF_ID);
                sgFunctions.cells[1, sgFunctions.Row - 1] := vTemp[0].VF_DESC;
                sgFunctions.cells[2, sgFunctions.Row - 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);



                sgFunctions.Row := sgFunctions.Row - 1;
             End;
         End;

     1 : Begin //Liberado...
           IF sgFuncLiberado.Row > 0 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncLiberado.cells[0, sgFuncLiberado.Row]);
                vTemp[0].VF_DESC         := sgFuncLiberado.cells[1, sgFuncLiberado.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncLiberado.cells[2, sgFuncLiberado.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncLiberado.cells[3, sgFuncLiberado.Row]);

                sgFuncLiberado.cells[0, sgFuncLiberado.Row] := sgFuncLiberado.cells[0, sgFuncLiberado.Row - 1];
                sgFuncLiberado.cells[1, sgFuncLiberado.Row] := sgFuncLiberado.cells[1, sgFuncLiberado.Row - 1];
                sgFuncLiberado.cells[2, sgFuncLiberado.Row] := sgFuncLiberado.cells[2, sgFuncLiberado.Row - 1];

                sgFuncLiberado.cells[0, sgFuncLiberado.Row - 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncLiberado.cells[1, sgFuncLiberado.Row - 1] := vTemp[0].VF_DESC;
                sgFuncLiberado.cells[2, sgFuncLiberado.Row - 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncLiberado.Row := sgFuncLiberado.Row - 1;
             End;
         End;


     2 : Begin  //Ocioso...
           IF sgFuncOcioso.Row > 0 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncOcioso.cells[0, sgFuncOcioso.Row]);
                vTemp[0].VF_DESC         := sgFuncOcioso.cells[1, sgFuncOcioso.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncOcioso.cells[2, sgFuncOcioso.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncOcioso.cells[3, sgFuncOcioso.Row]);

                //Ordenando Grid...
                sgFuncOcioso.cells[0, sgFuncOcioso.Row]  := sgFuncOcioso.cells[0, sgFuncOcioso.Row - 1];
                sgFuncOcioso.cells[1, sgFuncOcioso.Row]  := sgFuncOcioso.cells[1, sgFuncOcioso.Row - 1];
                sgFuncOcioso.cells[2, sgFuncOcioso.Row]  := sgFuncOcioso.cells[2, sgFuncOcioso.Row - 1];

                //Ordenando Grid...
                sgFuncOcioso.cells[0, sgFuncOcioso.Row - 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncOcioso.cells[1, sgFuncOcioso.Row - 1] := vTemp[0].VF_DESC;
                sgFuncOcioso.cells[2, sgFuncOcioso.Row - 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncOcioso.Row := sgFuncOcioso.Row - 1;
             End;
         End;


     3 : Begin //Placa...
           IF sgFuncPlaca.Row > 0 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncPlaca.cells[0, sgFuncPlaca.Row]);
                vTemp[0].VF_DESC         := sgFuncPlaca.cells[1, sgFuncPlaca.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncPlaca.cells[2, sgFuncPlaca.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncPlaca.cells[3, sgFuncPlaca.Row]);

                sgFuncPlaca.cells[0, sgFuncPlaca.Row] := sgFuncPlaca.cells[0, sgFuncPlaca.Row - 1];
                sgFuncPlaca.cells[1, sgFuncPlaca.Row] := sgFuncPlaca.cells[1, sgFuncPlaca.Row - 1];
                sgFuncPlaca.cells[2, sgFuncPlaca.Row] := sgFuncPlaca.cells[2, sgFuncPlaca.Row - 1];

                sgFuncPlaca.cells[0, sgFuncPlaca.Row - 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncPlaca.cells[1, sgFuncPlaca.Row - 1] := vTemp[0].VF_DESC;
                sgFuncPlaca.cells[2, sgFuncPlaca.Row - 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncPlaca.Row := sgFuncPlaca.Row - 1;
             End;
         End;


     4 : Begin //Comercial...
           IF sgFuncComercial.Row > 0 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncComercial.cells[0, sgFuncComercial.Row]);
                vTemp[0].VF_DESC         := sgFuncComercial.cells[1, sgFuncComercial.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncComercial.cells[2, sgFuncComercial.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncComercial.cells[3, sgFuncComercial.Row]);

                sgFuncComercial.cells[0, sgFuncComercial.Row] := sgFuncComercial.cells[0, sgFuncComercial.Row - 1];
                sgFuncComercial.cells[1, sgFuncComercial.Row] := sgFuncComercial.cells[1, sgFuncComercial.Row - 1];
                sgFuncComercial.cells[2, sgFuncComercial.Row] := sgFuncComercial.cells[2, sgFuncComercial.Row - 1];

                sgFuncComercial.cells[0, sgFuncComercial.Row - 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncComercial.cells[1, sgFuncComercial.Row - 1] := vTemp[0].VF_DESC;
                sgFuncComercial.cells[2, sgFuncComercial.Row - 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncComercial.Row := sgFuncComercial.Row - 1;
             End;
         End;


  End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.BitBtn2Click(Sender: TObject);
 Var
   vTemp : Array of RecStatus;

   Function TrataAct_code(ActCode : String) : Integer;
      Begin
         Result := 0;
           Case ActCode[1] of
             '.' : Result := 0;
             ',' : Result := 1;
           End;
      End;

   Function TrataAct_CodInv(ActCode : Integer) : String;
      Begin
           Case ActCode of
             0 : Result := '.';
             1 : Result := ',';
           End;

      End;

begin
  inherited;
  Case pcValidador.ActivePageIndex of
     0 : Begin
           IF sgFunctions.Row < sgFunctions.RowCount - 1 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFunctions.cells[0, sgFunctions.Row]);
                vTemp[0].VF_DESC         := sgFunctions.cells[1, sgFunctions.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFunctions.cells[2, sgFunctions.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFunctions.cells[3, sgFunctions.Row]);

                sgFunctions.cells[0, sgFunctions.Row] := sgFunctions.cells[0, sgFunctions.Row + 1];
                sgFunctions.cells[1, sgFunctions.Row] := sgFunctions.cells[1, sgFunctions.Row + 1];
                sgFunctions.cells[2, sgFunctions.Row] := sgFunctions.cells[2, sgFunctions.Row + 1];

                sgFunctions.cells[0, sgFunctions.Row + 1] := InttoStr(vTemp[0].VF_ID);
                sgFunctions.cells[1, sgFunctions.Row + 1] := vTemp[0].VF_DESC;
                sgFunctions.cells[2, sgFunctions.Row + 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFunctions.Row := sgFunctions.Row + 1;
             End;
         End;

     1 : Begin
           IF sgFuncLiberado.Row < sgFuncLiberado.RowCount - 1 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncLiberado.cells[0, sgFuncLiberado.Row]);
                vTemp[0].VF_DESC         := sgFuncLiberado.cells[1, sgFuncLiberado.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncLiberado.cells[2, sgFuncLiberado.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncLiberado.cells[3, sgFuncLiberado.Row]);

                sgFuncLiberado.cells[0, sgFuncLiberado.Row] := sgFuncLiberado.cells[0, sgFuncLiberado.Row + 1];
                sgFuncLiberado.cells[1, sgFuncLiberado.Row] := sgFuncLiberado.cells[1, sgFuncLiberado.Row + 1];
                sgFuncLiberado.cells[2, sgFuncLiberado.Row] := sgFuncLiberado.cells[2, sgFuncLiberado.Row + 1];

                sgFuncLiberado.cells[0, sgFuncLiberado.Row + 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncLiberado.cells[1, sgFuncLiberado.Row + 1] := vTemp[0].VF_DESC;
                sgFuncLiberado.cells[2, sgFuncLiberado.Row + 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncLiberado.Row := sgFuncLiberado.Row + 1;
             End;
         End;


     2 : Begin
           IF sgFuncOcioso.Row < sgFuncOcioso.rowcount - 1  Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncOcioso.cells[0, sgFuncOcioso.Row]);
                vTemp[0].VF_DESC         := sgFuncOcioso.cells[1, sgFuncOcioso.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncOcioso.cells[2, sgFuncOcioso.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncOcioso.cells[3, sgFuncOcioso.Row]);

                sgFuncOcioso.cells[0, sgFuncOcioso.Row] := sgFuncOcioso.cells[0, sgFuncOcioso.Row + 1];
                sgFuncOcioso.cells[1, sgFuncOcioso.Row] := sgFuncOcioso.cells[1, sgFuncOcioso.Row + 1];
                sgFuncOcioso.cells[2, sgFuncOcioso.Row] := sgFuncOcioso.cells[2, sgFuncOcioso.Row + 1];

                sgFuncOcioso.cells[0, sgFuncOcioso.Row + 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncOcioso.cells[1, sgFuncOcioso.Row + 1] := vTemp[0].VF_DESC;
                sgFuncOcioso.cells[2, sgFuncOcioso.Row + 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncOcioso.Row := sgFuncOcioso.Row + 1;
             End;
         End;


     3 : Begin
           IF sgFuncPlaca.Row < sgFuncPlaca.rowCount - 1 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncPlaca.cells[0, sgFuncPlaca.Row]);
                vTemp[0].VF_DESC         := sgFuncPlaca.cells[1, sgFuncPlaca.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncPlaca.cells[2, sgFuncPlaca.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncPlaca.cells[3, sgFuncPlaca.Row]);

                sgFuncPlaca.cells[0, sgFuncPlaca.Row] := sgFuncPlaca.cells[0, sgFuncPlaca.Row + 1];
                sgFuncPlaca.cells[1, sgFuncPlaca.Row] := sgFuncPlaca.cells[1, sgFuncPlaca.Row + 1];
                sgFuncPlaca.cells[2, sgFuncPlaca.Row] := sgFuncPlaca.cells[2, sgFuncPlaca.Row + 1];

                sgFuncPlaca.cells[0, sgFuncPlaca.Row + 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncPlaca.cells[1, sgFuncPlaca.Row + 1] := vTemp[0].VF_DESC;
                sgFuncPlaca.cells[2, sgFuncPlaca.Row + 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncPlaca.Row := sgFuncPlaca.Row + 1;
             End;
         End;


     4 : Begin
           IF sgFuncComercial.Row < sgFuncComercial.RowCount - 1 Then
             Begin
                SetLength(vTemp, 1);
                vTemp[0].VF_ID           := StrtoInt(sgFuncComercial.cells[0, sgFuncComercial.Row]);
                vTemp[0].VF_DESC         := sgFuncComercial.cells[1, sgFuncComercial.Row];
                vTemp[0].ACT_CODE        := TrataAct_code(sgFuncComercial.cells[2, sgFuncComercial.Row]);
                vTemp[0].PTVF_Sortorder  := StrtoInt(sgFuncComercial.cells[3, sgFuncComercial.Row]);

                sgFuncComercial.cells[0, sgFuncComercial.Row] := sgFuncComercial.cells[0, sgFuncComercial.Row + 1];
                sgFuncComercial.cells[1, sgFuncComercial.Row] := sgFuncComercial.cells[1, sgFuncComercial.Row + 1];
                sgFuncComercial.cells[2, sgFuncComercial.Row] := sgFuncComercial.cells[2, sgFuncComercial.Row + 1];

                sgFuncComercial.cells[0, sgFuncComercial.Row + 1] := InttoStr(vTemp[0].VF_ID);
                sgFuncComercial.cells[1, sgFuncComercial.Row + 1] := vTemp[0].VF_DESC;
                sgFuncComercial.cells[2, sgFuncComercial.Row + 1] := TrataAct_CodInv(vTemp[0].ACT_CODE);

                sgFuncComercial.Row := sgFuncComercial.Row + 1;
             End;
         End;
    End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.btnCancelarClick(Sender: TObject);
begin
  inherited;
  SetActions([], True, FrmPersonnelTypesXValidatorFcts, t_form_objects);
  grdResultado.Visible := True; grdResultado.SetFocus;
  btnCopiaFcts.Enabled := True;
  gbFiltro.Enabled     := True;
  actApplyUpdates.Enabled  := False;
  actCancel.Enabled        := False;
end;

procedure TfrmPersonnelTypesXValidatorFcts.btnOKClick(Sender: TObject);
begin
  inherited;
   IF lbOrigem.ItemIndex < 0 Then
      Begin
        DisplayMsg(t_form_objects, '%T %T %T', [1541, 1521, 2803 ], [], mtInformation, [mbOK]);
        Exit;
      End;

   IF lbDestino.ItemIndex < 0 Then
      Begin
        DisplayMsg(t_form_objects, '%T %T %T', [1541, 1521, 2804 ], [], mtInformation, [mbOK]);
        Exit;
      End;

   Screen.Cursor := crHourGlass;
   dmSys.cdsGeral.Close;
   dmSys.cdsGeral.CommandText := 'Select * from personneltypesxvalidatorfcts Where TP_ID = '+InttoStr(Integer(lbOrigem.items.Objects[lbOrigem.ItemIndex])) +
     ' Order By VEHT_ID, PRST_ID, VF_ID, VS_ID';
   dmSys.cdsGeral.Open;
   gProgress.MaxValue := dmSys.cdsGeral.RecordCount;

  While NOT dmSys.cdsGeral.Eof do
     Begin
      Try
       DmSys.cdsValidatorFunctions.Insert;
       Application.ProcessMessages;
       DmSys.cdsValidatorFunctions.FieldByName('PRST_ID').AsInteger  := DmSys.cdsGeral.fieldByName('PRST_ID').AsInteger;
       DmSys.cdsValidatorFunctions.FieldByName('VF_ID').AsInteger    := DmSys.cdsGeral.fieldByName('VF_ID').AsInteger;
       DmSys.cdsValidatorFunctions.FieldByName('VS_ID').AsInteger    := DmSys.cdsGeral.fieldByName('VS_ID').AsInteger;
       DmSys.cdsValidatorFunctions.FieldByName('ACT_CODE').AsInteger := DmSys.cdsGeral.fieldByName('ACT_CODE').AsInteger;
       DmSys.cdsValidatorFunctions.FieldByName('VEHT_ID').AsInteger  := DmSys.cdsGeral.fieldByName('VEHT_ID').AsInteger;
       DmSys.cdsValidatorFunctions.FieldByName('TP_ID').AsInteger    := Integer(lbDestino.items.Objects[lbDestino.ItemIndex]);
       DmSys.cdsValidatorFunctions.FieldByName('PTVF_SORTORDER').AsInteger := DmSys.cdsGeral.fieldByName('PTVF_SORTORDER').AsInteger;
       DmSys.cdsValidatorFunctions.post;
       Except
         DmSys.cdsValidatorFunctions.Cancel;
       End;
       dmSys.cdsGeral.Next;
       gProgress.Progress := gProgress.Progress + 1;
       Application.ProcessMessages;
     End;

  DmSys.cdsValidatorFunctions.ApplyUpdates(-1);
  Screen.Cursor := crDefault;

  DisplayMsg(t_form_objects, '%T', [2805], [], mtInformation, [mbOK]);

  SetActions([], True, FrmPersonnelTypesXValidatorFcts, t_form_objects);
  grdResultado.Visible := True;
  btnCopiaFcts.Enabled := True;
  gbFiltro.Enabled     := True;
  actApplyUpdates.Enabled  := False;
  actCancel.Enabled        := False;
  tbtnFiltrar.Click;
end;

procedure TfrmPersonnelTypesXValidatorFcts.actDeleteExecute(
  Sender: TObject);
begin
  With Dmsys do
    Begin
     IF DisplayMsg(t_form_objects, '%T', [1510], [], mtConfirmation, [mbYes, mbNo]) = mryes Then
        Begin
         cdsGeral.Close;
         cdsGeral.CommandText := 'DELETE FROM PERSONNELTYPESXVALIDATORFCTS WHERE TP_ID = :v_TP_ID AND '+
         'PRST_ID = :v_PRST_ID AND VEHT_ID = :v_VEHT_ID';
         cdsGeral.Params.ParamByName('v_TP_ID').AsString   := cdsPersonneltypesXValidatorfcts.fieldByName('TP_ID').AsString;
         cdsGeral.Params.ParamByName('v_PRST_ID').AsString := cdsPersonneltypesXValidatorfcts.fieldByName('PRST_ID').AsString;
         cdsGeral.Params.ParamByName('v_VEHT_ID').AsString := cdsPersonneltypesXValidatorfcts.fieldByName('VEHT_ID').AsString;
         cdsGeral.Execute;

       tbtnFiltrar.Click;
        End;
    End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.grdResultadoDblClick(
  Sender: TObject);
begin
  inherited;
  SetStatusPanels(False);
end;

procedure TfrmPersonnelTypesXValidatorFcts.actFuncoesValidadorExecute(
  Sender: TObject);
Var
  I : Integer;
  NewValue : Integer;
begin
inherited;
 FrmFuncoes := TFrmFuncoes.Create(Self);
  With dmSys do
    Begin
      AtualizaVetores;

      cdsValidatorFunctionsDisp.Open;
      While Not cdsValidatorFunctionsDisp.Eof do
         Begin
            IF VerificaFuncoes(cdsValidatorFunctionsDisp.fieldByName('VF_ID').AsInteger)
            Then FrmFuncoes.lbSelecionadas.Items.AddObject(cdsValidatorFunctionsDisp.fieldByName('VF_DESC').AsString,
                                                  TObject(cdsValidatorFunctionsDisp.fieldByName('VF_ID').AsInteger))
            Else FrmFuncoes.lbDisponiveis.Items.AddObject(cdsValidatorFunctionsDisp.fieldByName('VF_DESC').AsString,
                                                  TObject(cdsValidatorFunctionsDisp.fieldByName('VF_ID').AsInteger));
           cdsValidatorFunctionsDisp.Next;
         End;
     FrmFuncoes.ID := pcValidador.ActivePageIndex;
       Case pcValidador.ActivePageIndex of
          0 : OrderFunctions(sgFunctions);
          1 : OrderFunctions(sgFuncLiberado);
          2 : OrderFunctions(sgFuncOcioso);
          3 : OrderFunctions(sgFuncPlaca);
          4 : OrderFunctions(sgFuncComercial);
       End;
     FrmFuncoes.lbFunction.Caption := pcValidador.ActivePage.Caption;
     FrmFuncoes.Showmodal;

     For I := 0 to high(FrmFuncoes.vAux) do
        Begin
          Case pcValidador.ActivePageIndex of
             0 : Begin
                    NewValue := Length(VFechado)+1;
                    SetLength(vFechado, NewValue );
                    vFechado[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vFechado[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vFechado[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vFechado[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             1 : Begin
                    NewValue := Length(VLiberado)+1;
                    SetLength(vLiberado, NewValue );
                    vLiberado[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vLiberado[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vLiberado[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vLiberado[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             2 : Begin
                    NewValue := Length(VOcioso)+1;
                    SetLength(vOcioso, NewValue );
                    vOcioso[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vOcioso[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vOcioso[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vOcioso[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             3 : Begin
                    NewValue := Length(VPlaca)+1;
                    SetLength(vPlaca, NewValue );
                    vPlaca[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vPlaca[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vPlaca[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vPlaca[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             4 : Begin
                    NewValue := Length(VComercial)+1;
                    SetLength(VComercial, NewValue );
                    VComercial[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    VComercial[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    VComercial[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    VComercial[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

        End;
    End;
     FrmFuncoes.Free;
     cdsValidatorFunctionsDisp.Close;
     SetFunctions(pcValidador.ActivePageIndex);

   End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.actCopiaFuncoesExecute(
  Sender: TObject);
begin
  inherited;
   gProgress.Progress := 0;
   btnCopiaFcts.Enabled := False;
   SetActions([], False, FrmPersonnelTypesXValidatorFcts, t_form_objects);
   gbFiltro.Enabled := False;
   lbOrigem.Items.Clear;
   lbDestino.Items.Clear;

   dmSys.cdsGeral.Close;
   dmSys.cdsGeral.CommandText := 'Select TP_ID, TP_DESC From Transportproviders where TP_ID IN (Select tp_id from personneltypesxvalidatorfcts) Order By TP_DESC';
   dmSys.cdsGeral.Open;

   While NOt dmSys.cdsGeral.Eof do
     Begin
        lbOrigem.Items.AddObject(dmSys.cdsGeral.fieldByName('TP_DESC').AsString,
                         TObject(dmSys.cdsGeral.fieldByName('TP_ID').AsInteger));
        dmSys.cdsGeral.Next;
     End;

   dmSys.cdsGeral.Close;
   dmSys.cdsGeral.CommandText := 'Select TP_ID, TP_DESC From Transportproviders where TP_ID NOT IN (Select tp_id from personneltypesxvalidatorfcts) Order By TP_DESC';
   dmSys.cdsGeral.Open;

   While NOt dmSys.cdsGeral.Eof do
     Begin
        lbDestino.Items.AddObject(dmSys.cdsGeral.fieldByName('TP_DESC').AsString,
                          TObject(dmSys.cdsGeral.fieldByName('TP_ID').AsInteger));
        dmSys.cdsGeral.Next;
     End;

  dmSys.cdsGeral.Close;
  grdResultado.Visible := False;

  IF ( lbOrigem.Items.Count  = 0 ) OR
     ( lbDestino.Items.Count = 0 ) Then
      btnOK.Enabled := False
  Else
      btnOK.Enabled := True;
end;

procedure TfrmPersonnelTypesXValidatorFcts.Action1Execute(Sender: TObject);
Var
  I : Integer;
  NewValue : Integer;
begin
inherited;
 FrmFuncoes := TFrmFuncoes.Create(Self);
  With dmSys do
    Begin
      AtualizaVetores;

      cdsValidatorFunctionsDisp.Open;
      While Not cdsValidatorFunctionsDisp.Eof do
         Begin
            IF VerificaFuncoes(cdsValidatorFunctionsDisp.fieldByName('VF_ID').AsInteger)
            Then FrmFuncoes.lbSelecionadas.Items.AddObject(cdsValidatorFunctionsDisp.fieldByName('VF_DESC').AsString,
                                                  TObject(cdsValidatorFunctionsDisp.fieldByName('VF_ID').AsInteger))
            Else FrmFuncoes.lbDisponiveis.Items.AddObject(cdsValidatorFunctionsDisp.fieldByName('VF_DESC').AsString,
                                                  TObject(cdsValidatorFunctionsDisp.fieldByName('VF_ID').AsInteger));
           cdsValidatorFunctionsDisp.Next;
         End;
     FrmFuncoes.ID := pcValidador.ActivePageIndex;
       Case pcValidador.ActivePageIndex of
          0 : OrderFunctions(sgFunctions);
          1 : OrderFunctions(sgFuncLiberado);
          2 : OrderFunctions(sgFuncOcioso);
          3 : OrderFunctions(sgFuncPlaca);
          4 : OrderFunctions(sgFuncComercial);
       End;
     FrmFuncoes.lbFunction.Caption := pcValidador.ActivePage.Caption;
     FrmFuncoes.Showmodal;

     For I := 0 to high(FrmFuncoes.vAux) do
        Begin
          Case pcValidador.ActivePageIndex of
             0 : Begin
                    NewValue := Length(VFechado)+1;
                    SetLength(vFechado, NewValue );
                    vFechado[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vFechado[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vFechado[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vFechado[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             1 : Begin
                    NewValue := Length(VLiberado)+1;
                    SetLength(vLiberado, NewValue );
                    vLiberado[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vLiberado[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vLiberado[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vLiberado[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             2 : Begin
                    NewValue := Length(VOcioso)+1;
                    SetLength(vOcioso, NewValue );
                    vOcioso[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vOcioso[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vOcioso[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vOcioso[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             3 : Begin
                    NewValue := Length(VPlaca)+1;
                    SetLength(vPlaca, NewValue );
                    vPlaca[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    vPlaca[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    vPlaca[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    vPlaca[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

             4 : Begin
                    NewValue := Length(VComercial)+1;
                    SetLength(VComercial, NewValue );
                    VComercial[NewValue-1].VF_ID    := FrmFuncoes.vAux[I].VF_ID;
                    VComercial[NewValue-1].VF_DESC  := FrmFuncoes.vAux[I].VF_DESC;
                    VComercial[NewValue-1].ACT_CODE := FrmFuncoes.vAux[I].ACT_CODE;
                    VComercial[NewValue-1].PTVF_Sortorder := FrmFuncoes.vAux[I].PTVF_Sortorder;
                 End;

        End;
    End;
     FrmFuncoes.Free;
     cdsValidatorFunctionsDisp.Close;
     SetFunctions(pcValidador.ActivePageIndex);

   End;
end;

procedure TfrmPersonnelTypesXValidatorFcts.Entra(Sender: TObject); begin FM_Entra(Sender); end;
procedure TfrmPersonnelTypesXValidatorFcts.Sai(Sender: TObject); begin FM_SAi(Sender); end;
procedure TfrmPersonnelTypesXValidatorFcts.FormKeyPress(Sender: TObject;
  var Key: Char);  begin IF Key = #27 THEN BEGIN Key:=#0; Close; END; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmPersonnelTypesXValidatorFcts.lbFiltradoClick(
  Sender: TObject);
Var i,j: Integer;
begin
j:=0;
FOR i := 0 to gbFiltro.ControlCount - 1
DO BEGIN
   {$include Limpa_Filtro.pas}
   IF gbFiltro.Controls[i] is TRxDBLookupCombo
   THEN BEGIN
        Inc(j);
        TRxDBLookupCombo(gbFiltro.Controls[i]).ClearValue;
        TRxDBLookupCombo(gbFiltro.Controls[i]).Repaint;
        END;
   END;
IF j <> gbFiltro.ControlCount
THEN BEGIN
     ShowMessage('ERRO DO SISTEMA:'#13#10'Falta componente(s) na Limpa Filtro');
     END
ELSE tbtnFiltrar.Click;
grdResultado.SetFocus;
end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmPersonnelTypesXValidatorFcts.btnLimpaEmpresaClick(
  Sender: TObject); begin dbLookempresa.ClearValue; dbLookempresa.Repaint; end;
procedure TfrmPersonnelTypesXValidatorFcts.btnLimpaCargoClick(
  Sender: TObject); begin dbLookCargo.ClearValue; dbLookCargo.Repaint; end;
procedure TfrmPersonnelTypesXValidatorFcts.btnLimpaVeiculoClick(
  Sender: TObject); begin dbVeiculo.ClearValue; dbVeiculo.Repaint; end;
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
procedure TfrmPersonnelTypesXValidatorFcts.grdResultadoTitleClick(Column: TColumn);
{$Include C:\Spark\Mercury2_Sys\Includes\Include_TitleClick.pas}
{%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%}
end.
