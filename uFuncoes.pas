unit uFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, uGeralFunctions, Buttons, ExtCtrls, ImgList,
  ActnList;

Type
 RecStatus = Record
   VF_ID    : Integer;
   VF_DESC  : String;
   ACT_CODE : Integer;
   PTVF_Sortorder : Integer;
 End;

type
  TFrmFuncoes = class(TForm)
    Label9: TLabel;
    lbDisponiveis: TListBox;
    lbSelecionadas: TListBox;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    imglstBase: TImageList;
    cbLineMt: TCoolBar;
    tbLineMt: TToolBar;
    tbtnNewLineMt: TToolButton;
    btnAddAllLineMt: TToolButton;
    btnDelAllLineMt: TToolButton;
    tbtnDeleteLineMt: TToolButton;
    lbFunction: TLabel;
    BitBtn2: TBitBtn;
    ActionList1: TActionList;
    actOK: TAction;
    actCancelar: TAction;
    actAddAll: TAction;
    actAdd: TAction;
    actDel: TAction;
    actDelAll: TAction;
    procedure lbDisponiveisDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lbSelecionadasDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure lbDisponiveisDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure lbSelecionadasDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actAddAllExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure actDelAllExecute(Sender: TObject);
  private
      t_form_objects : t_Object_List;
    { Private declarations }
  public
     vAux : Array of RecStatus;
     ID : Integer;
    { Public declarations }
  end;

var
  FrmFuncoes: TFrmFuncoes;

implementation

uses uPersonnelTypesXValidatorFcts, uDmConexao, uDataBaseFunctions;

{$R *.dfm}

procedure TFrmFuncoes.lbDisponiveisDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TlistBox;
end;

procedure TFrmFuncoes.lbSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source is TlistBox;
end;

procedure TFrmFuncoes.lbDisponiveisDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  btnDelAllLineMt.Click;
end;

procedure TFrmFuncoes.lbSelecionadasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
btnAddAllLineMt.Click;
End;

procedure TFrmFuncoes.FormCreate(Sender: TObject);
begin

  if not FillObjectsList(TForm(Sender).Tag, dmConexao.SystemUser_Id, dmConexao.cdsGeral, t_form_objects) then
    begin
      DisplayMsg(t_form_objects, '%T', [2828], []);
      TForm(Sender).Close;
    end;
  SetDisplayValues(t_form_objects,TForm(Sender));

end;

procedure TFrmFuncoes.actCancelarExecute(Sender: TObject);
begin
Close;
end;

procedure TFrmFuncoes.actOKExecute(Sender: TObject);
Var
  I, J, X : Integer;
  Existe : boolean;
begin
 With frmPersonnelTypesXValidatorFcts do
  Begin
  SetLength(vAux, 0);
   Case ID of
    0 : Begin
          For I := 0 To High(vFechado) do
             Begin
               Existe := False;

                For J := 0 to FrmFuncoes.lbSelecionadas.Items.Count - 1 do
                 Begin
                   IF  vFechado[I].VF_ID = Integer(FrmFuncoes.lbSelecionadas.items.Objects[J])  Then
                      Existe := True;
                 End;

                IF Not (Existe) Then
                   vFechado[I].VF_ID := -1;
             End; //For...

          X := 1;
          For I:=0 To FrmFuncoes.lbSelecionadas.Items.Count - 1 do
             Begin
               Existe := False;

                For J := 0 to High(vFechado) do
                   IF Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]) = vFechado[J].VF_ID   Then
                      Begin
                        Existe := True;
                        Break;
                      End;


                IF Not (Existe) Then
                   Begin
                      SetLength(vAux, X);
                      vAux[X-1].VF_ID    := Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]);
                      vAux[X-1].VF_DESC  := FrmFuncoes.lbSelecionadas.items.Strings[I];
                      vAux[X-1].ACT_CODE := 0;
                      vAux[X-1].PTVF_Sortorder := X;
                      inc(X);
                   End;
             End; //For...
        End;


    1 : Begin
          For I := 0 To High(vLiberado) do
             Begin
               Existe := False;

                For J := 0 to FrmFuncoes.lbSelecionadas.Items.Count - 1 do
                 Begin
                   IF  vLiberado[I].VF_ID = Integer(FrmFuncoes.lbSelecionadas.items.Objects[J])  Then
                      Existe := True;
                 End;

                IF Not (Existe) Then
                   vLiberado[I].VF_ID := -1;
             End; //For...

          X := 1;
          For I:=0 To FrmFuncoes.lbSelecionadas.Items.Count - 1 do
             Begin
               Existe := False;

                For J := 0 to High(vLiberado) do
                   IF Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]) = vLiberado[J].VF_ID   Then
                      Begin
                        Existe := True;
                        Break;
                      End;


                IF Not (Existe) Then
                   Begin
                      SetLength(vAux, X);
                      vAux[X-1].VF_ID    := Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]);
                      vAux[X-1].VF_DESC  := FrmFuncoes.lbSelecionadas.items.Strings[I];
                      vAux[X-1].ACT_CODE := 0;
                      vAux[X-1].PTVF_Sortorder := X;
                      inc(X);
                   End;
             End; //For...
        End;


    2 : Begin
          For I := 0 To High(vOcioso) do
             Begin
               Existe := False;

                For J := 0 to FrmFuncoes.lbSelecionadas.Items.Count - 1 do
                 Begin
                   IF  vOcioso[I].VF_ID = Integer(FrmFuncoes.lbSelecionadas.items.Objects[J])  Then
                      Existe := True;
                 End;

                IF Not (Existe) Then
                   vOcioso[I].VF_ID := -1;
             End; //For...

          X := 1;
          For I:=0 To FrmFuncoes.lbSelecionadas.Items.Count - 1 do
             Begin
               Existe := False;

                For J := 0 to High(vOcioso) do
                   IF Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]) = vOcioso[J].VF_ID   Then
                      Begin
                        Existe := True;
                        Break;
                      End;


                IF Not (Existe) Then
                   Begin
                      SetLength(vAux, X);
                      vAux[X-1].VF_ID    := Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]);
                      vAux[X-1].VF_DESC  := FrmFuncoes.lbSelecionadas.items.Strings[I];
                      vAux[X-1].ACT_CODE := 0;
                      vAux[X-1].PTVF_Sortorder := X;
                      inc(X);
                   End;
             End; //For...
        End;

    3 : Begin
          For I := 0 To High(vPlaca) do
             Begin
               Existe := False;

                For J := 0 to FrmFuncoes.lbSelecionadas.Items.Count - 1 do
                 Begin
                   IF  vPlaca[I].VF_ID = Integer(FrmFuncoes.lbSelecionadas.items.Objects[J])  Then
                      Existe := True;
                 End;

                IF Not (Existe) Then
                   vPlaca[I].VF_ID := -1;
             End; //For...

          X := 1;
          For I:=0 To FrmFuncoes.lbSelecionadas.Items.Count - 1 do
             Begin
               Existe := False;

                For J := 0 to High(vPlaca) do
                   IF Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]) = vPlaca[J].VF_ID   Then
                      Begin
                        Existe := True;
                        Break;
                      End;


                IF Not (Existe) Then
                   Begin
                      SetLength(vAux, X);
                      vAux[X-1].VF_ID    := Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]);
                      vAux[X-1].VF_DESC  := FrmFuncoes.lbSelecionadas.items.Strings[I];
                      vAux[X-1].ACT_CODE := 0;
                      vAux[X-1].PTVF_Sortorder := X;
                      inc(X);
                   End;
             End; //For...
        End;

    4 : Begin
          For I := 0 To High(vComercial) do
             Begin
               Existe := False;

                For J := 0 to FrmFuncoes.lbSelecionadas.Items.Count - 1 do
                 Begin
                   IF  vComercial[I].VF_ID = Integer(FrmFuncoes.lbSelecionadas.items.Objects[J])  Then
                      Existe := True;
                 End;

                IF Not (Existe) Then
                   vComercial[I].VF_ID := -1;
             End; //For...

          X := 1;
          For I:=0 To FrmFuncoes.lbSelecionadas.Items.Count - 1 do
             Begin
               Existe := False;

                For J := 0 to High(vComercial) do
                   IF Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]) = vComercial[J].VF_ID   Then
                      Begin
                        Existe := True;
                        Break;
                      End;


                IF Not (Existe) Then
                   Begin
                      SetLength(vAux, X);
                      vAux[X-1].VF_ID    := Integer(FrmFuncoes.lbSelecionadas.items.Objects[I]);
                      vAux[X-1].VF_DESC  := FrmFuncoes.lbSelecionadas.items.Strings[I];
                      vAux[X-1].ACT_CODE := 0;
                      vAux[X-1].PTVF_Sortorder := X;
                      inc(X);
                   End;
             End; //For...
        End;
   //========================
   End; //Case...
 End; //With...
  FrmFuncoes.Close;

end;

procedure TFrmFuncoes.actAddAllExecute(Sender: TObject);
begin
  lbDisponiveis.SelectAll;
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmFuncoes.actAddExecute(Sender: TObject);
begin
  lbDisponiveis.MoveSelection(lbSelecionadas);
end;

procedure TFrmFuncoes.actDelExecute(Sender: TObject);
begin
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

procedure TFrmFuncoes.actDelAllExecute(Sender: TObject);
begin
  lbSelecionadas.SelectAll;
  lbSelecionadas.MoveSelection(lbDisponiveis);
end;

end.
